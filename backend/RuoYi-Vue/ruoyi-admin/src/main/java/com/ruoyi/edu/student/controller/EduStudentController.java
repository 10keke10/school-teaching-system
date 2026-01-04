package com.ruoyi.edu.student.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.edu.student.service.IEnrollmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import com.ruoyi.edu.admin.mapper.TermMapper;
import com.ruoyi.edu.domain.Term;
import java.util.Map;
import java.util.List;

/**
 * 学生功能控制器（接口：/edu/student/*）
 */
@RestController
@RequestMapping("/edu/student")
public class EduStudentController extends BaseController {

    @Autowired
    private IEnrollmentService enrollmentService;

    @Autowired
    private TermMapper termMapper;

    /**
     * POST /edu/student/enroll - 学生选课
     */
    @Log(title = "学生选课", businessType = BusinessType.INSERT)
    @PreAuthorize("@ss.hasPermi('edu:student:enroll')")
    @PostMapping("/enroll")
    public AjaxResult enroll(@RequestBody Map<String, Object> request) {
        Long studentId = getCurrentStudentId();
        Long classId = Long.valueOf(request.get("classId").toString());

        return enrollmentService.enrollCourse(studentId, classId);
    }

    /**
     * POST /edu/student/drop/{id} - 学生退课
     */
    @Log(title = "学生退课", businessType = BusinessType.DELETE)
    @PreAuthorize("@ss.hasPermi('edu:student:drop')")
    @PostMapping("/drop/{id}")
    public AjaxResult drop(@PathVariable("id") Long enrollmentId) {
        return enrollmentService.dropCourse(enrollmentId);
    }

    /**
     * GET /edu/student/timetable - 学生课表查询
     */
    @PreAuthorize("@ss.hasPermi('edu:student:timetable')")
    @GetMapping("/timetable")
    public AjaxResult getTimetable() {
        Long studentId = getCurrentStudentId();
        return AjaxResult.success(enrollmentService.getStudentTimetable(studentId));
    }

    /**
     * 获取当前登录学生ID（开发阶段写死，后续接入登录信息）
     */
    private Long getCurrentStudentId() {
        return SecurityUtils.getUserId();
    }

    /**
     * 获取可选课程列表（用于前端页面）
     */
    @GetMapping("/courses")
    public AjaxResult getAvailableCourses(@RequestParam(required = false) String termId,
            @RequestParam(required = false) String courseName,
            @RequestParam(required = false) Integer pageNum,
            @RequestParam(required = false) Integer pageSize) {
        Long studentId = getCurrentStudentId();
        return AjaxResult
                .success(enrollmentService.listAvailableCourses(studentId, termId, courseName, pageNum, pageSize));
    }

    /**
     * 成绩查询
     */
    @PreAuthorize("@ss.hasPermi('edu:student:grades')")
    @GetMapping("/grades")
    public AjaxResult getGrades(@RequestParam(required = false) String termId,
            @RequestParam(required = false) String gradeStatus) {
        Long studentId = getCurrentStudentId();
        return AjaxResult.success(enrollmentService.getStudentGrades(studentId, termId, gradeStatus));
    }

    /**
     * 学期列表（供学生端选择使用）
     */
    @GetMapping("/terms")
    public AjaxResult getTerms() {
        Term query = new Term();
        List<Term> list = termMapper.selectTermList(query);
        return AjaxResult.success(list);
    }
}
