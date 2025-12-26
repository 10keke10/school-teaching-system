package com.ruoyi.edu.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 学分规则对象 credit_rule
 *
 * @author A
 * @date 2024-01-15
 */
@TableName("credit_rule")
public class CreditRule extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 规则ID */
    @TableId(type = IdType.AUTO)
    private Long ruleId;

    /** 规则名称 */
    @Excel(name = "规则名称")
    private String ruleName;

    /** 适用学期 */
    @Excel(name = "适用学期")
    private String termId;

    /** 最大学分 */
    @Excel(name = "最大学分")
    private Integer maxCredits;

    /** 最小学分 */
    @Excel(name = "最小学分")
    private Integer minCredits;

    /** 是否生效（1是，0否） */
    @Excel(name = "是否生效")
    private Integer isActive;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    // ============ Getter和Setter方法 ============
    public Long getRuleId() {
        return ruleId;
    }

    public void setRuleId(Long ruleId) {
        this.ruleId = ruleId;
    }

    public String getRuleName() {
        return ruleName;
    }

    public void setRuleName(String ruleName) {
        this.ruleName = ruleName;
    }

    public String getTermId() {
        return termId;
    }

    public void setTermId(String termId) {
        this.termId = termId;
    }

    public Integer getMaxCredits() {
        return maxCredits;
    }

    public void setMaxCredits(Integer maxCredits) {
        this.maxCredits = maxCredits;
    }

    public Integer getMinCredits() {
        return minCredits;
    }

    public void setMinCredits(Integer minCredits) {
        this.minCredits = minCredits;
    }

    public Integer getIsActive() {
        return isActive;
    }

    public void setIsActive(Integer isActive) {
        this.isActive = isActive;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    // ============ toString方法 ============
    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("ruleId", getRuleId())
                .append("ruleName", getRuleName())
                .append("termId", getTermId())
                .append("maxCredits", getMaxCredits())
                .append("minCredits", getMinCredits())
                .append("isActive", getIsActive())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }

    // ============ 业务方法 ============
    /**
     * 检查学分是否在规则允许范围内
     * @param credits 学分
     * @return true 表示合法，false 表示不合法
     */
    public boolean isValidCredits(Integer credits) {
        if (credits == null) {
            return false;
        }
        return credits >= minCredits && credits <= maxCredits;
    }

    /**
     * 检查规则是否对指定学期有效
     * @param targetTermId 目标学期ID
     * @return true 表示有效，false 表示无效
     */
    public boolean isEffectiveForTerm(String targetTermId) {
        return this.isActive == 1 && this.termId.equals(targetTermId);
    }
}