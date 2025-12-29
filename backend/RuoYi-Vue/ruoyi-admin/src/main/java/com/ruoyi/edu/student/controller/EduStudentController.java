package com.ruoyi.edu.student.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.edu.student.service.IEnrollmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 学生功能控制器（接口：/edu/student/*）
 */
@RestController
@RequestMapping("/edu/student")
public class EduStudentController extends BaseController {

    @Autowired
    private IEnrollmentService enrollmentService;

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

        Map<String, Object> timetable = new HashMap<>();
        timetable.put("studentId", studentId);

        List<Map<String, Object>> courses = new ArrayList<>();

        Map<String, Object> course1 = new HashMap<>();
        course1.put("courseName", "计算机基础");
        course1.put("classTime", "周一1-2节");
        course1.put("location", "教学楼A201");
        courses.add(course1);

        Map<String, Object> course2 = new HashMap<>();
        course2.put("courseName", "高等数学");
        course2.put("classTime", "周二3-4节");
        course2.put("location", "教学楼B301");
        courses.add(course2);

        timetable.put("courses", courses);
        return AjaxResult.success(timetable);
    }

    /**
     * 获取当前登录学生ID（开发阶段写死，后续接入登录信息）
     */
    private Long getCurrentStudentId() {
        return 2001L;
    }

    /**
     * 获取可选课程列表（用于前端页面）
     */
    @GetMapping("/courses")
    public AjaxResult getAvailableCourses(@RequestParam(required = false) String termId) {
        Map<String, Object> result = new HashMap<>();

        List<Map<String, Object>> courses = new ArrayList<>();
        Map<String, Object> course1 = new HashMap<>();
        course1.put("classId", 1L);
        course1.put("courseName", "计算机基础");
        course1.put("classTime", "周一1-2节");
        course1.put("teacherName", "张老师");
        course1.put("capacity", 60);
        course1.put("selectedCount", 30);
        course1.put("enrolled", false);
        courses.add(course1);

        result.put("rows", courses);
        result.put("total", courses.size());

        return AjaxResult.success(result);
    }
}
