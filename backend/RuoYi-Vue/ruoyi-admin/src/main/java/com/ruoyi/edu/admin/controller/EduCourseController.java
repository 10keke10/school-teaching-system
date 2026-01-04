package com.ruoyi.edu.admin.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.validation.annotation.Validated;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.edu.domain.Course;
import com.ruoyi.edu.admin.service.ICourseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 课程Controller
 * 
 * @author A
 * @date 2024-01-15
 */
@RestController
@RequestMapping("/edu/admin")
public class EduCourseController extends BaseController
{
    @Autowired
    private ICourseService courseService;

    /**
     * 查询课程列表
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:course:list')")
    @GetMapping("/course/list")
    public TableDataInfo list(Course course)
    {
        startPage();
        List<Course> list = courseService.selectCourseList(course);
        return getDataTable(list);
    }

    /**
     * 导出课程列表
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:course:export')")
    @Log(title = "课程", businessType = BusinessType.EXPORT)
    @PostMapping("/course/export")
    public void export(HttpServletResponse response, Course course)
    {
        List<Course> list = courseService.selectCourseList(course);
        ExcelUtil<Course> util = new ExcelUtil<Course>(Course.class);
        util.exportExcel(response, list, "课程数据");
    }

    /**
     * 获取课程详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:course:query')")
    @GetMapping(value = "/course/{courseId}")
    public AjaxResult getInfo(@PathVariable("courseId") Long courseId)
    {
        return success(courseService.selectCourseByCourseId(courseId));
    }

    /**
     * 新增课程
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:course:add')")
    @Log(title = "课程", businessType = BusinessType.INSERT)
    @PostMapping("/course")
    public AjaxResult add(@Validated @RequestBody Course course)
    {
        return toAjax(courseService.insertCourse(course));
    }

    /**
     * 修改课程
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:course:edit')")
    @Log(title = "课程", businessType = BusinessType.UPDATE)
    @PutMapping("/course")
    public AjaxResult edit(@RequestBody Course course)
    {
        return toAjax(courseService.updateCourse(course));
    }

    /**
     * 删除课程
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:course:remove')")
    @Log(title = "课程", businessType = BusinessType.DELETE)
	@DeleteMapping("/course/{courseIds}")
    public AjaxResult remove(@PathVariable Long[] courseIds)
    {
        return toAjax(courseService.deleteCourseByCourseIds(courseIds));
    }
}
