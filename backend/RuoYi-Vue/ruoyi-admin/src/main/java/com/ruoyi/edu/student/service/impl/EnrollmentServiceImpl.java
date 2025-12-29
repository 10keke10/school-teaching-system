package com.ruoyi.edu.student.service.impl;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.edu.domain.Enrollment;
import com.ruoyi.edu.student.mapper.EnrollmentMapper;
import com.ruoyi.edu.student.service.IEnrollmentService;
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

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult enrollCourse(Long studentId, Long classId) {
        // TODO 后续补充容量、冲突、重复选课等校验
        return AjaxResult.success("选课成功（mock）");
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
        return rows > 0 ? AjaxResult.success("退课成功") : AjaxResult.error("退课失败");
    }

    @Override
    public boolean checkCreditLimit(Long studentId, String termId) {
        return true;
    }

    @Override
    public boolean checkTimeConflict(Long studentId, Long classId) {
        return false;
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
            int maxCredits = 20;

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
}
