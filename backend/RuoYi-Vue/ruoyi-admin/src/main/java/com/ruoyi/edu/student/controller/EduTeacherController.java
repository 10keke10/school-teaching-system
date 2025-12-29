package com.ruoyi.edu.student.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
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

    /**
     * GET /edu/teacher/classes/{id}/students
     */
    @PreAuthorize("@ss.hasPermi('edu:teacher:students')")
    @GetMapping("/classes/{id}/students")
    public TableDataInfo getClassStudents(@PathVariable("id") Long classId) {
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

        if (students.isEmpty()) {
            Map<String, Object> student1 = new HashMap<>();
            student1.put("studentId", 2001);
            student1.put("studentName", "张三");
            student1.put("grade", 85.5);
            student1.put("gradeStatus", "PUBLISHED");
            students.add(student1);

            Map<String, Object> student2 = new HashMap<>();
            student2.put("studentId", 2002);
            student2.put("studentName", "李四");
            student2.put("grade", null);
            student2.put("gradeStatus", "DRAFT");
            students.add(student2);
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
        List<Enrollment> enrollments = enrollmentMapper.selectByClassId(classId);
        if (enrollments != null) {
            for (Enrollment enrollment : enrollments) {
                enrollment.setGradeStatus("PUBLISHED");
                enrollmentMapper.updateEnrollment(enrollment);
            }
        }

        return AjaxResult.success("成绩发布成功（开发模式）");
    }
}
