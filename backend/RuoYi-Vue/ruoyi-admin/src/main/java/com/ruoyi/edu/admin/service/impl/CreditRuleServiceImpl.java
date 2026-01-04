package com.ruoyi.edu.admin.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.edu.admin.mapper.CreditRuleMapper;
import com.ruoyi.edu.domain.CreditRule;
import com.ruoyi.edu.admin.service.ICreditRuleService;

/**
 * 学分规则Service业务层处理
 * 
 * @author A
 * @date 2024-01-15
 */
@Service
public class CreditRuleServiceImpl implements ICreditRuleService 
{
    @Autowired
    private CreditRuleMapper creditRuleMapper;

    /**
     * 查询学分规则
     * 
     * @param ruleId 学分规则主键
     * @return 学分规则
     */
    @Override
    public CreditRule selectCreditRuleByRuleId(Long ruleId)
    {
        return creditRuleMapper.selectCreditRuleByRuleId(ruleId);
    }

    /**
     * 查询学分规则列表
     * 
     * @param creditRule 学分规则
     * @return 学分规则
     */
    @Override
    public List<CreditRule> selectCreditRuleList(CreditRule creditRule)
    {
        return creditRuleMapper.selectCreditRuleList(creditRule);
    }

    /**
     * 新增学分规则
     * 
     * @param creditRule 学分规则
     * @return 结果
     */
    @Override
    public int insertCreditRule(CreditRule creditRule)
    {
        creditRule.setCreateTime(DateUtils.getNowDate());
        return creditRuleMapper.insertCreditRule(creditRule);
    }

    /**
     * 修改学分规则
     * 
     * @param creditRule 学分规则
     * @return 结果
     */
    @Override
    public int updateCreditRule(CreditRule creditRule)
    {
        creditRule.setUpdateTime(DateUtils.getNowDate());
        return creditRuleMapper.updateCreditRule(creditRule);
    }

    /**
     * 批量删除学分规则
     * 
     * @param ruleIds 需要删除的学分规则主键
     * @return 结果
     */
    @Override
    public int deleteCreditRuleByRuleIds(Long[] ruleIds)
    {
        return creditRuleMapper.deleteCreditRuleByRuleIds(ruleIds);
    }

    /**
     * 删除学分规则信息
     * 
     * @param ruleId 学分规则主键
     * @return 结果
     */
    @Override
    public int deleteCreditRuleByRuleId(Long ruleId)
    {
        return creditRuleMapper.deleteCreditRuleByRuleId(ruleId);
    }
}
