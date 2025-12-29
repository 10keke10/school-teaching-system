// 位置：ruoyi-admin/src/main/java/com/ruoyi/edu/student/controller/EduStatisticsController.java
package com.ruoyi.edu.student.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.edu.student.service.IEnrollmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 统计功能控制器
 * 实现契约接口：/edu/statistics/*
 */
@RestController
@RequestMapping("/edu/statistics")
public class EduStatisticsController extends BaseController {

    @Autowired
    private IEnrollmentService enrollmentService;

    /**
     * 契约：GET /edu/statistics/student/{id}/credits
     * 学分统计（调用存储过程）
     * 注意：这个接口由B提供，但需要调用A的存储过程
     */
    @PreAuthorize("@ss.hasPermi('edu:statistics:credits')")
    @GetMapping("/student/{id}/credits")
    public AjaxResult getStudentCredits(
            @PathVariable("id") Long studentId,
            @RequestParam(value = "term_id", required = false) String termId) {
        
        String term = termId != null ? termId : "2024-2025-1";
        try {
            Map<String, Object> creditInfo = enrollmentService.getStudentCreditInfo(studentId, term);
            return AjaxResult.success(creditInfo);
        } catch (Exception e) {
            return AjaxResult.error("获取学分信息失败: " + e.getMessage());
        }
    }
    
    /**
     * 需要在IEnrollmentService中新增方法
     */
    // Map<String, Object> getStudentCreditInfo(Long studentId, String termId);
}
