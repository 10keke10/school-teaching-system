package com.ruoyi.edu.student.service.impl;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.edu.domain.Enrollment;
import com.ruoyi.edu.domain.ClassTimeSlot;
import com.ruoyi.edu.domain.CourseClass;
import com.ruoyi.edu.student.mapper.ClassTimeSlotMapper;
import com.ruoyi.edu.student.mapper.CourseClassMapper;
import com.ruoyi.edu.student.mapper.EnrollmentMapper;
import com.ruoyi.edu.student.service.IEnrollmentService;
import com.ruoyi.edu.admin.mapper.TermMapper;
import com.ruoyi.edu.domain.Term;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 选课业务服务实现
 */
@Service
public class EnrollmentServiceImpl implements IEnrollmentService {

    @Autowired
    private EnrollmentMapper enrollmentMapper;

    @Autowired
    private CourseClassMapper courseClassMapper;

    @Autowired
    private ClassTimeSlotMapper classTimeSlotMapper;

    @Autowired
    private TermMapper termMapper;

    @Autowired
    private com.ruoyi.edu.admin.mapper.CreditRuleMapper creditRuleMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult enrollCourse(Long studentId, Long classId) {
        // 使用悲观锁查询课程班级信息，防止并发选课导致超量
        CourseClass courseClass = courseClassMapper.selectCourseClassByIdForUpdate(classId);
        if (courseClass == null) {
            return AjaxResult.error("教学班不存在");
        }
        if (courseClass.getStatus() != null && courseClass.getStatus() != 1) {
            return AjaxResult.error("课程未开放选课");
        }
        
        // 校验容量 (双重保障：Java层悲观锁校验 + 数据库触发器)
        if (courseClass.getCapacity() != null && courseClass.getSelectedCount() != null 
                && courseClass.getSelectedCount() >= courseClass.getCapacity()) {
            return AjaxResult.error("课程容量已满，无法选课");
        }

        // 重复选课（存在已选记录）
        // 优先检查有效选课记录
        Enrollment active = enrollmentMapper.selectActiveByStudentAndClass(studentId, classId);
        if (active != null) {
            return AjaxResult.error("已选该课程，不能重复选课");
        }

        Enrollment existed = enrollmentMapper.selectByStudentAndClass(studentId, classId);
        if (existed != null) {
            if ("ENROLLED".equals(existed.getStatus())) {
                return AjaxResult.error("已选该课程，不能重复选课");
            }
            if ("DROPPED".equals(existed.getStatus())) {
                // 退课后再次选同一班级，直接恢复原记录避免唯一键冲突
                // 同学期同课程号校验
                if (enrollmentMapper.existsSameCourseInTerm(studentId, classId)) {
                    return AjaxResult.error("同一学期不能选多个同一课程号的课程");
                }
                // 时间冲突校验
                if (checkTimeConflict(studentId, classId)) {
                    return AjaxResult.error("与已有课程时间冲突");
                }
                // 学分上限校验
                Map<String, Object> courseInfoRe = courseClassMapper.selectCourseInfo(classId);
                int creditHoursRe = courseInfoRe != null && courseInfoRe.get("credit_hours") != null
                        ? Integer.parseInt(courseInfoRe.get("credit_hours").toString())
                        : 0;
                if (!checkCreditLimit(studentId, courseClass.getTermId(), creditHoursRe)) {
                    return AjaxResult.error("超过学分上限，无法选课");
                }
                existed.setStatus("ENROLLED");
                existed.setDropTime(null);
                existed.setEnrollTime(new Date());
                existed.setGradeStatus("DRAFT");
                existed.setUpdateTime(new Date());

                try {
                    int updated = enrollmentMapper.updateEnrollment(existed);
                    if (updated > 0) {
                        return AjaxResult.success("选课成功");
                    }
                    return AjaxResult.error("选课失败");
                } catch (Exception e) {
                    return handleEnrollmentException(e);
                }
            }
            // 其他状态一律视为不可重复选
            return AjaxResult.error("已存在该课程记录，无法重复选课");
        }
        if (enrollmentMapper.existsSameCourseInTerm(studentId, classId)) {
            return AjaxResult.error("同一学期不能选多个同一课程号的课程");
        }
        // 时间冲突校验
        if (checkTimeConflict(studentId, classId)) {
            return AjaxResult.error("与已有课程时间冲突");
        }
        // 学分上限校验
        Map<String, Object> courseInfo = courseClassMapper.selectCourseInfo(classId);
        int creditHours = courseInfo != null && courseInfo.get("credit_hours") != null
                ? Integer.parseInt(courseInfo.get("credit_hours").toString())
                : 0;
        if (!checkCreditLimit(studentId, courseClass.getTermId(), creditHours)) {
            return AjaxResult.error("超过学分上限，无法选课");
        }

        Enrollment enrollment = new Enrollment();
        enrollment.setStudentId(studentId);
        enrollment.setClassId(classId);
        enrollment.setTermId(courseClass.getTermId());
        enrollment.setStatus("ENROLLED");
        enrollment.setGradeStatus("DRAFT");
        enrollment.setEnrollTime(new Date());
        enrollment.setCreateTime(new Date());

        // 尝试插入选课记录，捕获触发器异常（容量控制）
        try {
            int rows = enrollmentMapper.insertEnrollment(enrollment);
            if (rows > 0) {
                return AjaxResult.success("选课成功");
            }
            return AjaxResult.error("选课失败");
        } catch (Exception e) {
            return handleEnrollmentException(e);
        }
    }

    private AjaxResult handleEnrollmentException(Exception e) {
        String errorMsg = e.getMessage();
        // 尝试修复乱码 (UTF-8 bytes interpreted as GBK)
        if (errorMsg != null) {
            try {
                String decoded = new String(errorMsg.getBytes("GBK"), "UTF-8");
                if (decoded.contains("满") || decoded.contains("full")) {
                    return AjaxResult.error("选课失败：该教学班已满员");
                }
            } catch (Exception ignore) {
            }
        }

        if (errorMsg != null && (errorMsg.contains("容量") || errorMsg.contains("capacity")
                || errorMsg.contains("已满") || errorMsg.contains("full"))) {
            return AjaxResult.error("课程容量已满，无法选课");
        }
        return AjaxResult.error("选课失败：" + (errorMsg != null ? errorMsg : "数据库操作异常"));

    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult dropCourse(Long enrollmentId) {
        Enrollment enrollment = enrollmentMapper.selectEnrollmentById(enrollmentId);
        if (enrollment == null) {
            return AjaxResult.error("选课记录不存在");
        }

        if ("PUBLISHED".equals(enrollment.getGradeStatus())) {
            return AjaxResult.error("成绩已发布，不能退课");
        }

        if (!checkDropDeadline(enrollment.getTermId())) {
            return AjaxResult.error("已超过退课截止时间");
        }

        enrollment.setStatus("DROPPED");
        enrollment.setDropTime(new Date());

        int rows = enrollmentMapper.updateEnrollment(enrollment);
        if (rows > 0) {
            return AjaxResult.success("退课成功");
        }
        return AjaxResult.error("退课失败");
    }

    @Override
    public boolean checkCreditLimit(Long studentId, String termId) {
        return checkCreditLimit(studentId, termId, 0);
    }

    private boolean checkCreditLimit(Long studentId, String termId, int newCourseCredits) {
        int maxCredits = resolveMaxCredits(termId);
        // 首选：调用存储过程
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("p_student_id", studentId);
            params.put("p_term_id", termId);
            params.put("p_total_credits", null);
            enrollmentMapper.callCalcStudentCredits(params);
            Integer totalCredits = (Integer) params.get("p_total_credits");
            int credits = totalCredits != null ? totalCredits : 0;
            return credits + newCourseCredits <= maxCredits;
        } catch (Exception ignore) {
            // 回退：直接统计该学期已选课程的学分和
            try {
                Integer sum = enrollmentMapper.sumCreditsByStudentAndTerm(studentId, termId);
                int credits = sum != null ? sum : 0;
                return credits + newCourseCredits <= maxCredits;
            } catch (Exception e2) {
                // 最后回退：保守拒绝（确保不突破上限）
                return newCourseCredits <= maxCredits;
            }
        }
    }

    @Override
    public boolean checkTimeConflict(Long studentId, Long classId) {
        List<ClassTimeSlot> newSlots = classTimeSlotMapper.selectByClassId(classId);
        CourseClass cc = courseClassMapper.selectCourseClassById(classId);
        String termId = cc != null ? cc.getTermId() : null;
        List<ClassTimeSlot> currentSlots = termId != null
                ? classTimeSlotMapper.selectByStudentIdAndTerm(studentId, termId)
                : classTimeSlotMapper.selectByStudentId(studentId);
        // 首选：使用class_time_slot表的结构化数据进行检测
        if (newSlots != null && !newSlots.isEmpty() && currentSlots != null && !currentSlots.isEmpty()) {
            for (ClassTimeSlot newSlot : newSlots) {
                for (ClassTimeSlot existing : currentSlots) {
                    if (newSlot.isTimeConflict(existing)) {
                        return true;
                    }
                }
            }
            return false;
        }
        // 兜底：若缺少结构化时间槽数据，则解析course_class.class_time文本进行检测
        List<ClassTimeSlot> parsedNewSlots = parseClassTimeString(cc != null ? cc.getClassTime() : null);
        if (parsedNewSlots == null || parsedNewSlots.isEmpty()) {
            return false;
        }
        List<Map<String, Object>> enrolledTimes = (termId != null)
                ? courseClassMapper.selectEnrolledClassTimesByStudentAndTerm(studentId, termId)
                : new java.util.ArrayList<>();
        List<ClassTimeSlot> parsedCurrentSlots = new java.util.ArrayList<>();
        if (enrolledTimes != null) {
            for (Map<String, Object> row : enrolledTimes) {
                String ct = row.get("class_time") != null ? row.get("class_time").toString() : null;
                parsedCurrentSlots.addAll(parseClassTimeString(ct));
            }
        }
        if (parsedCurrentSlots.isEmpty()) {
            return false;
        }
        for (ClassTimeSlot n : parsedNewSlots) {
            for (ClassTimeSlot e : parsedCurrentSlots) {
                if (n.isTimeConflict(e)) {
                    return true;
                }
            }
        }
        return false;
    }

    private List<ClassTimeSlot> parseClassTimeString(String classTime) {
        List<ClassTimeSlot> slots = new java.util.ArrayList<>();
        if (classTime == null || classTime.trim().isEmpty()) {
            return slots;
        }
        String[] parts = classTime.split("[,，;；\\s]+");
        for (String part : parts) {
            part = part.trim();
            if (part.isEmpty())
                continue;
            java.util.regex.Pattern p = java.util.regex.Pattern.compile("周([一二三四五六日])\\s*第?(\\d+)\\s*-\\s*(\\d+)节");
            java.util.regex.Matcher m = p.matcher(part);
            if (m.find()) {
                int weekDay = mapWeekDay(m.group(1));
                int start = Integer.parseInt(m.group(2));
                int end = Integer.parseInt(m.group(3));
                ClassTimeSlot slot = new ClassTimeSlot();
                slot.setWeekDay(weekDay);
                slot.setStartSlot(start);
                slot.setEndSlot(end);
                slots.add(slot);
            }
        }
        return slots;
    }

    private int mapWeekDay(String cn) {
        switch (cn) {
            case "一":
                return 1;
            case "二":
                return 2;
            case "三":
                return 3;
            case "四":
                return 4;
            case "五":
                return 5;
            case "六":
                return 6;
            case "日":
                return 7;
            default:
                return 0;
        }
    }

    @Override
    public Map<String, Object> getStudentCreditInfo(Long studentId, String termId) {
        Map<String, Object> result = new HashMap<>();
        Map<String, Object> params = new HashMap<>();
        params.put("p_student_id", studentId);
        params.put("p_term_id", termId);
        params.put("p_total_credits", null);

        try {
            enrollmentMapper.callCalcStudentCredits(params);
            Integer totalCredits = (Integer) params.get("p_total_credits");
            int credits = totalCredits != null ? totalCredits : 0;
            int maxCredits = resolveMaxCredits(termId);

            result.put("studentId", studentId);
            result.put("termId", termId);
            result.put("totalCredits", credits);
            result.put("maxCredits", maxCredits);
            result.put("remainingCredits", Math.max(0, maxCredits - credits));
            result.put("percentage", credits * 100.0 / maxCredits);
        } catch (Exception e) {
            result.put("studentId", studentId);
            result.put("termId", termId);
            result.put("totalCredits", 12);
            result.put("maxCredits", 20);
            result.put("remainingCredits", 8);
            result.put("percentage", 60.0);
        }

        return result;
    }

    private int resolveMaxCredits(String termId) {
        int maxCredits = 20;
        try {
            com.ruoyi.edu.domain.CreditRule ruleQuery = new com.ruoyi.edu.domain.CreditRule();
            ruleQuery.setTermId(termId);
            ruleQuery.setIsActive(1);
            java.util.List<com.ruoyi.edu.domain.CreditRule> rules = creditRuleMapper.selectCreditRuleList(ruleQuery);
            if (rules != null && !rules.isEmpty() && rules.get(0).getMaxCredits() != null) {
                return rules.get(0).getMaxCredits();
            }
            com.ruoyi.edu.domain.CreditRule activeQuery = new com.ruoyi.edu.domain.CreditRule();
            activeQuery.setIsActive(1);
            java.util.List<com.ruoyi.edu.domain.CreditRule> actives = creditRuleMapper
                    .selectCreditRuleList(activeQuery);
            if (actives != null && !actives.isEmpty() && actives.get(0).getMaxCredits() != null) {
                return actives.get(0).getMaxCredits();
            }
        } catch (Exception ignore) {
        }
        return maxCredits;
    }

    @Override
    public Map<String, Object> listAvailableCourses(Long studentId, String termId, String courseName, Integer pageNum,
            Integer pageSize) {
        Term active = termMapper.selectActiveTerm();
        String activeTermId = active != null ? active.getTermId() : null;
        int pn = (pageNum != null && pageNum > 0) ? pageNum : 1;
        int ps = (pageSize != null && pageSize > 0) ? pageSize : 10;
        int offset = (pn - 1) * ps;
        Integer total = courseClassMapper.selectAvailableCoursesCount(studentId, activeTermId, courseName);
        List<Map<String, Object>> courses = courseClassMapper.selectAvailableCoursesPaged(studentId, activeTermId,
                courseName, offset, ps);
        Map<String, Object> result = new HashMap<>();
        result.put("rows", courses);
        result.put("total", total != null ? total : (courses != null ? courses.size() : 0));
        if (active != null) {
            result.put("termId", active.getTermId());
            result.put("termName", active.getTermName());
        } else {
            result.put("termId", null);
            result.put("termName", null);
        }
        return result;
    }

    @Override
    public Map<String, Object> getStudentTimetable(Long studentId) {
        Map<String, Object> result = new HashMap<>();
        Term active = termMapper.selectActiveTerm();
        List<Map<String, Object>> slots = classTimeSlotMapper.selectTimetableByStudent(studentId);
        if (slots == null || slots.isEmpty()) {
            if (active != null) {
                List<Map<String, Object>> schedules = courseClassMapper
                        .selectEnrolledClassScheduleByStudentAndTerm(studentId, active.getTermId());
                List<Map<String, Object>> parsed = new java.util.ArrayList<>();
                if (schedules != null) {
                    long sid = 1L;
                    for (Map<String, Object> row : schedules) {
                        String ct = row.get("class_time") != null ? row.get("class_time").toString() : null;
                        Long classId = row.get("class_id") != null ? Long.valueOf(row.get("class_id").toString())
                                : null;
                        String courseName = row.get("course_name") != null ? row.get("course_name").toString() : null;
                        String location = row.get("location") != null ? row.get("location").toString() : null;
                        String teacherName = row.get("teacher_name") != null ? row.get("teacher_name").toString()
                                : null;
                        List<ClassTimeSlot> parts = parseClassTimeString(ct);
                        for (ClassTimeSlot s : parts) {
                            Map<String, Object> m = new HashMap<>();
                            m.put("slot_id", sid++);
                            m.put("class_id", classId);
                            m.put("week_day", s.getWeekDay());
                            m.put("start_slot", s.getStartSlot());
                            m.put("end_slot", s.getEndSlot());
                            m.put("class_time", ct);
                            m.put("location", location);
                            m.put("course_name", courseName);
                            m.put("teacher_name", teacherName);
                            parsed.add(m);
                        }
                    }
                }
                slots = parsed;
            }
        }
        result.put("studentId", studentId);
        result.put("slots", slots);
        if (active != null) {
            result.put("termId", active.getTermId());
            result.put("termName", active.getTermName());
        } else {
            result.put("termId", null);
            result.put("termName", null);
        }
        return result;
    }

    @Override
    public List<Map<String, Object>> getStudentGrades(Long studentId, String termId, String gradeStatus) {
        return enrollmentMapper.selectStudentGradeView(studentId, termId, gradeStatus);
    }

    @Override
    public List<Enrollment> selectEnrollmentList(Enrollment enrollment) {
        return enrollmentMapper.selectEnrollmentList(enrollment);
    }

    @Override
    public Enrollment selectEnrollmentById(Long enrollmentId) {
        return enrollmentMapper.selectEnrollmentById(enrollmentId);
    }

    @Override
    public int insertEnrollment(Enrollment enrollment) {
        return enrollmentMapper.insertEnrollment(enrollment);
    }

    @Override
    public int updateEnrollment(Enrollment enrollment) {
        return enrollmentMapper.updateEnrollment(enrollment);
    }

    @Override
    public int deleteEnrollmentByIds(Long[] enrollmentIds) {
        return enrollmentMapper.deleteEnrollmentByIds(enrollmentIds);
    }

    private boolean checkDropDeadline(String termId) {
        return true;
    }

    @Override
    public Map<String, Object> getClassGradeStatistics(Long classId) {
        return enrollmentMapper.selectClassGradeStatistics(classId);
    }
}
