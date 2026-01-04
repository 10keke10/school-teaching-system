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
import com.ruoyi.edu.domain.CreditRule;
import com.ruoyi.edu.admin.service.ICreditRuleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学分规则Controller
 * 
 * @author A
 * @date 2024-01-15
 */
@RestController
@RequestMapping("/edu/admin")
public class EduCreditRuleController extends BaseController
{
    @Autowired
    private ICreditRuleService creditRuleService;

    /**
     * 查询学分规则列表
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:creditRule:list')")
    @GetMapping("/creditRule/list")
    public TableDataInfo list(CreditRule creditRule)
    {
        startPage();
        // A只查询自己插入的数据（前缀a_）
        if (creditRule.getTermId() != null && !creditRule.getTermId().startsWith("a_")) {
             // 仅当用户指定了termId时才处理，否则查询所有可能包含前缀的
             creditRule.setTermId("a_" + creditRule.getTermId());
        } else if (creditRule.getTermId() == null) {
            creditRule.setTermId("a_"); // 模糊匹配
        }
        
        List<CreditRule> list = creditRuleService.selectCreditRuleList(creditRule);
        return getDataTable(list);
    }

    /**
     * 导出学分规则列表
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:creditRule:export')")
    @Log(title = "学分规则", businessType = BusinessType.EXPORT)
    @PostMapping("/creditRule/export")
    public void export(HttpServletResponse response, CreditRule creditRule)
    {
        creditRule.setTermId("a_");
        List<CreditRule> list = creditRuleService.selectCreditRuleList(creditRule);
        ExcelUtil<CreditRule> util = new ExcelUtil<CreditRule>(CreditRule.class);
        util.exportExcel(response, list, "学分规则数据");
    }

    /**
     * 获取学分规则详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:creditRule:query')")
    @GetMapping(value = "/creditRule/{ruleId}")
    public AjaxResult getInfo(@PathVariable("ruleId") Long ruleId)
    {
        return success(creditRuleService.selectCreditRuleByRuleId(ruleId));
    }

    /**
     * 新增学分规则
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:creditRule:add')")
    @Log(title = "学分规则", businessType = BusinessType.INSERT)
    @PostMapping("/creditRule")
    public AjaxResult add(@Validated @RequestBody CreditRule creditRule)
    {
        if (creditRule.getTermId() != null && !creditRule.getTermId().startsWith("a_")) {
            creditRule.setTermId("a_" + creditRule.getTermId());
        }
        return toAjax(creditRuleService.insertCreditRule(creditRule));
    }

    /**
     * 修改学分规则
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:creditRule:edit')")
    @Log(title = "学分规则", businessType = BusinessType.UPDATE)
    @PutMapping("/creditRule")
    public AjaxResult edit(@RequestBody CreditRule creditRule)
    {
        return toAjax(creditRuleService.updateCreditRule(creditRule));
    }

    /**
     * 删除学分规则
     */
    @PreAuthorize("@ss.hasPermi('edu:admin:creditRule:remove')")
    @Log(title = "学分规则", businessType = BusinessType.DELETE)
	@DeleteMapping("/creditRule/{ruleIds}")
    public AjaxResult remove(@PathVariable Long[] ruleIds)
    {
        return toAjax(creditRuleService.deleteCreditRuleByRuleIds(ruleIds));
    }
}
