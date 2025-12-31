package com.ruoyi.edu.student.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.edu.domain.Enrollment;
import com.ruoyi.edu.student.mapper.EnrollmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 教师功能控制器，契约接口 /edu/teacher/*
 */
@RestController
@RequestMapping("/edu/teacher")
public class EduTeacherController extends BaseController {

    @Autowired
    private EnrollmentMapper enrollmentMapper;

    @Autowired
    private com.ruoyi.edu.student.mapper.CourseClassMapper courseClassMapper;

    /**
     * GET /edu/teacher/classes - 获取教师所教的所有班级
     */
    @PreAuthorize("@ss.hasPermi('edu:teacher:classes')")
    @GetMapping("/classes")
    public AjaxResult getMyClasses(@RequestParam(required = false) String termId) {
        Long teacherId = SecurityUtils.getUserId();
        List<Map<String, Object>> classes = courseClassMapper.selectClassesByTeacherId(teacherId, termId);
        return AjaxResult.success(classes);
    }

    /**
     * GET /edu/teacher/classes/{id}/students
     */
    @PreAuthorize("@ss.hasPermi('edu:teacher:students')")
    @GetMapping("/classes/{id}/students")
    public TableDataInfo getClassStudents(@PathVariable("id") Long classId) {
        Long teacherId = SecurityUtils.getUserId();
        // 验证该班级是否属于当前教师
        com.ruoyi.edu.domain.CourseClass courseClass = courseClassMapper.selectCourseClassById(classId);
        if (courseClass == null) {
            return getDataTable(new ArrayList<>());
        }
        if (!courseClass.getTeacherId().equals(teacherId)) {
            return getDataTable(new ArrayList<>());
        }
        
        startPage();

        List<Map<String, Object>> students = new ArrayList<>();
        List<Enrollment> enrollments = enrollmentMapper.selectByClassId(classId);
        if (enrollments != null) {
            for (Enrollment enrollment : enrollments) {
                Map<String, Object> student = new HashMap<>();
                student.put("enrollmentId", enrollment.getEnrollmentId());
                student.put("studentId", enrollment.getStudentId());
                student.put("studentName", "学生" + enrollment.getStudentId());
                student.put("grade", enrollment.getGrade());
                student.put("gradeStatus", enrollment.getGradeStatus());
                students.add(student);
            }
        }

        // 查询学生姓名（从sys_user表）
        for (Map<String, Object> student : students) {
            Long studentId = (Long) student.get("studentId");
            // 这里可以调用用户服务获取真实姓名，暂时使用ID
            if (student.get("studentName") == null || student.get("studentName").toString().startsWith("学生")) {
                student.put("studentName", "学生" + studentId);
            }
        }

        return getDataTable(students);
    }

    /**
     * POST /edu/teacher/grades/batch
     */
    @Log(title = "批量录入成绩", businessType = BusinessType.UPDATE)
    @PreAuthorize("@ss.hasPermi('edu:teacher:grades:edit')")
    @Transactional(rollbackFor = Exception.class)
    @PostMapping("/grades/batch")
    public AjaxResult batchUpdateGrades(@RequestBody List<Map<String, Object>> gradeUpdates) {
        if (gradeUpdates == null || gradeUpdates.isEmpty()) {
            return AjaxResult.error("成绩更新数据不能为空");
        }

        Long teacherId = SecurityUtils.getUserId();
        
        // 验证所有选课记录都属于当前教师的班级
        for (Map<String, Object> update : gradeUpdates) {
            Object enrollmentIdObj = update.get("enrollmentId");
            if (enrollmentIdObj == null) {
                continue;
            }
            Long enrollmentId = Long.valueOf(enrollmentIdObj.toString());
            Enrollment enrollment = enrollmentMapper.selectEnrollmentById(enrollmentId);
            if (enrollment != null) {
                com.ruoyi.edu.domain.CourseClass courseClass = courseClassMapper.selectCourseClassById(enrollment.getClassId());
                if (courseClass != null && !courseClass.getTeacherId().equals(teacherId)) {
                    return AjaxResult.error("无权操作该选课记录");
                }
            }
        }

        for (Map<String, Object> update : gradeUpdates) {
            Object idObj = update.get("enrollmentId");
            if (idObj == null) {
                continue;
            }
            Long enrollmentId = Long.valueOf(idObj.toString());
            String gradeStatus = update.get("gradeStatus") != null ? update.get("gradeStatus").toString() : null;
            BigDecimal grade = null;
            if (update.get("grade") != null) {
                grade = new BigDecimal(update.get("grade").toString());
            }

            Enrollment enrollment = new Enrollment();
            enrollment.setEnrollmentId(enrollmentId);
            if (grade != null) {
                enrollment.setGrade(grade);
            }
            if (gradeStatus != null) {
                enrollment.setGradeStatus(gradeStatus);
            }
            enrollmentMapper.updateEnrollment(enrollment);
        }

        return AjaxResult.success("成绩更新成功（开发模式）");
    }

    /**
     * POST /edu/teacher/grades/publish
     */
    @Log(title = "发布成绩", businessType = BusinessType.UPDATE)
    @PreAuthorize("@ss.hasPermi('edu:teacher:grades:publish')")
    @Transactional(rollbackFor = Exception.class)
    @PostMapping("/grades/publish")
    public AjaxResult publishGrades(@RequestBody Map<String, Object> publishRequest) {
        Object classIdObj = publishRequest.get("classId");
        if (classIdObj == null) {
            return AjaxResult.error("缺少班级ID");
        }

        Long classId = Long.valueOf(classIdObj.toString());
        Long teacherId = SecurityUtils.getUserId();
        
        // 验证该班级是否属于当前教师
        com.ruoyi.edu.domain.CourseClass courseClass = courseClassMapper.selectCourseClassById(classId);
        if (courseClass == null) {
            return AjaxResult.error("班级不存在");
        }
        if (!courseClass.getTeacherId().equals(teacherId)) {
            return AjaxResult.error("无权操作该班级");
        }
        
        List<Enrollment> enrollments = enrollmentMapper.selectByClassId(classId);
        if (enrollments != null) {
            for (Enrollment enrollment : enrollments) {
                enrollment.setGradeStatus("PUBLISHED");
                enrollmentMapper.updateEnrollment(enrollment);
            }
        }

        return AjaxResult.success("成绩发布成功（开发模式）");
    }

    /**
     * GET /edu/teacher/classes/{id}/statistics - 班级成绩统计（平均分）
     */
    @PreAuthorize("@ss.hasPermi('edu:teacher:statistics')")
    @GetMapping("/classes/{id}/statistics")
    public AjaxResult getClassStatistics(@PathVariable("id") Long classId) {
        Long teacherId = SecurityUtils.getUserId();
        
        // 验证该班级是否属于当前教师
        com.ruoyi.edu.domain.CourseClass courseClass = courseClassMapper.selectCourseClassById(classId);
        if (courseClass == null) {
            return AjaxResult.error("班级不存在");
        }
        if (!courseClass.getTeacherId().equals(teacherId)) {
            return AjaxResult.error("无权查看该班级统计");
        }
        
        Map<String, Object> statistics = enrollmentMapper.selectClassGradeStatistics(classId);
        if (statistics == null || statistics.isEmpty()) {
            // 返回默认值
            Map<String, Object> defaultStats = new HashMap<>();
            defaultStats.put("totalStudents", 0);
            defaultStats.put("gradedStudents", 0);
            defaultStats.put("averageGrade", 0.0);
            defaultStats.put("minGrade", null);
            defaultStats.put("maxGrade", null);
            defaultStats.put("excellentCount", 0);
            defaultStats.put("goodCount", 0);
            defaultStats.put("passCount", 0);
            defaultStats.put("failCount", 0);
            return AjaxResult.success(defaultStats);
        }
        return AjaxResult.success(statistics);
    }
}
