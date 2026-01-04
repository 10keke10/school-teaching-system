package com.ruoyi.edu.admin.service;

import java.util.List;
import com.ruoyi.edu.domain.CreditRule;

/**
 * 学分规则Service接口
 * 
 * @author A
 * @date 2024-01-15
 */
public interface ICreditRuleService 
{
    /**
     * 查询学分规则
     * 
     * @param ruleId 学分规则主键
     * @return 学分规则
     */
    public CreditRule selectCreditRuleByRuleId(Long ruleId);

    /**
     * 查询学分规则列表
     * 
     * @param creditRule 学分规则
     * @return 学分规则集合
     */
    public List<CreditRule> selectCreditRuleList(CreditRule creditRule);

    /**
     * 新增学分规则
     * 
     * @param creditRule 学分规则
     * @return 结果
     */
    public int insertCreditRule(CreditRule creditRule);

    /**
     * 修改学分规则
     * 
     * @param creditRule 学分规则
     * @return 结果
     */
    public int updateCreditRule(CreditRule creditRule);

    /**
     * 批量删除学分规则
     * 
     * @param ruleIds 需要删除的学分规则主键集合
     * @return 结果
     */
    public int deleteCreditRuleByRuleIds(Long[] ruleIds);

    /**
     * 删除学分规则信息
     * 
     * @param ruleId 学分规则主键
     * @return 结果
     */
    public int deleteCreditRuleByRuleId(Long ruleId);
}
