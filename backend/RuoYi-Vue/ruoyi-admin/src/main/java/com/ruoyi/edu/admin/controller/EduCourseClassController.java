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
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.edu.domain.CourseClass;
import com.ruoyi.edu.admin.service.ICourseClassService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 教学班Controller
 * 
 * @author A
 * @date 2024-01-15
 */
@RestController
@RequestMapping("/edu/admin")
public class EduCourseClassController extends BaseController
{
    @Autowired
    private ICourseClassService courseClassService;

    /**
     * 查询教学班列表
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:courseClass:list')")
    @GetMapping("/courseClass/list")
    public TableDataInfo list(CourseClass courseClass)
    {
        startPage();
        // 核心逻辑：强制隔离，如果没有指定termId，则默认查询所有 "a_" 开头的学期
        // 如果前端传递了 specific termId (e.g. "a_202401")，则使用前端传递的
        if (courseClass.getTermId() == null || courseClass.getTermId().trim().isEmpty()) {
            courseClass.setTermId("a_%");
        }
        List<CourseClass> list = courseClassService.selectCourseClassList(courseClass);
        return getDataTable(list);
    }

    /**
     * 导出教学班列表
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:courseClass:export')")
    @Log(title = "教学班", businessType = BusinessType.EXPORT)
    @PostMapping("/courseClass/export")
    public void export(HttpServletResponse response, CourseClass courseClass)
    {
        if (courseClass.getTermId() == null || courseClass.getTermId().trim().isEmpty()) {
            courseClass.setTermId("a_%");
        }
        List<CourseClass> list = courseClassService.selectCourseClassList(courseClass);
        ExcelUtil<CourseClass> util = new ExcelUtil<CourseClass>(CourseClass.class);
        util.exportExcel(response, list, "教学班数据");
    }

    /**
     * 获取教学班详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:courseClass:query')")
    @GetMapping(value = "/courseClass/{classId}")
    public AjaxResult getInfo(@PathVariable("classId") Long classId)
    {
        return AjaxResult.success(courseClassService.selectCourseClassById(classId));
    }

    /**
     * 新增教学班
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:courseClass:add')")
    @Log(title = "教学班", businessType = BusinessType.INSERT)
    @PostMapping("/courseClass")
    public AjaxResult add(@RequestBody CourseClass courseClass)
    {
        return toAjax(courseClassService.insertCourseClass(courseClass));
    }

    /**
     * 修改教学班
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:courseClass:edit')")
    @Log(title = "教学班", businessType = BusinessType.UPDATE)
    @PutMapping("/courseClass")
    public AjaxResult edit(@RequestBody CourseClass courseClass)
    {
        return toAjax(courseClassService.updateCourseClass(courseClass));
    }

    /**
     * 删除教学班
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:courseClass:remove')")
    @Log(title = "教学班", businessType = BusinessType.DELETE)
	@DeleteMapping("/courseClass/{classIds}")
    public AjaxResult remove(@PathVariable Long[] classIds)
    {
        return toAjax(courseClassService.deleteCourseClassByIds(classIds));
    }
}
