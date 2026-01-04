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
import com.ruoyi.edu.domain.Term;
import com.ruoyi.edu.admin.service.ITermService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学期Controller
 * 
 * @author A
 * @date 2024-01-15
 */
@RestController
@RequestMapping("/edu/admin")
public class EduTermController extends BaseController
{
    @Autowired
    private ITermService termService;

    /**
     * 查询学期列表
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:term:list')")
    @GetMapping("/term/list")
    public TableDataInfo list(Term term)
    {
        startPage();
        // A只查询自己插入的数据（前缀a_）
        if (term.getTermId() == null || !term.getTermId().startsWith("a_")) {
             term.setTermId("a_"); // 简单模糊匹配，实际Mapper用了like '%a_%'
        }
        List<Term> list = termService.selectTermList(term);
        return getDataTable(list);
    }

    /**
     * 契约：GET /edu/admin/terms - 学期列表
     * 注意：RuoYi生成的是/edu/admin/term/list，需要额外添加此接口
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:term:list')")
    @GetMapping("/terms")
    public AjaxResult getTerms() {
        // A只查询自己插入的数据（前缀a_）
        Term term = new Term();
        term.setTermId("a_");  // 模糊查询
        List<Term> list = termService.selectTermList(term);
        return AjaxResult.success(list);
    }

    /**
     * 导出学期列表
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:term:export')")
    @Log(title = "学期", businessType = BusinessType.EXPORT)
    @PostMapping("/term/export")
    public void export(HttpServletResponse response, Term term)
    {
        term.setTermId("a_");
        List<Term> list = termService.selectTermList(term);
        ExcelUtil<Term> util = new ExcelUtil<Term>(Term.class);
        util.exportExcel(response, list, "学期数据");
    }

    /**
     * 获取学期详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:term:query')")
    @GetMapping(value = "/term/{termId}")
    public AjaxResult getInfo(@PathVariable("termId") String termId)
    {
        return success(termService.selectTermByTermId(termId));
    }

    /**
     * 新增学期
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:term:add')")
    @Log(title = "学期", businessType = BusinessType.INSERT)
    @PostMapping("/term")
    public AjaxResult add(@Validated @RequestBody Term term)
    {
        // 自动添加a_前缀
        if (!term.getTermId().startsWith("a_")) {
            term.setTermId("a_" + term.getTermId());
        }
        return toAjax(termService.insertTerm(term));
    }

    /**
     * 修改学期
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:term:edit')")
    @Log(title = "学期", businessType = BusinessType.UPDATE)
    @PutMapping("/term")
    public AjaxResult edit(@RequestBody Term term)
    {
        return toAjax(termService.updateTerm(term));
    }

    /**
     * 删除学期
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:term:remove')")
    @Log(title = "学期", businessType = BusinessType.DELETE)
	@DeleteMapping("/term/{termIds}")
    public AjaxResult remove(@PathVariable String[] termIds)
    {
        return toAjax(termService.deleteTermByTermIds(termIds));
    }
}
