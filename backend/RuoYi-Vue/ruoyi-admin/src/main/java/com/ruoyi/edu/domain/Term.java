package com.ruoyi.edu.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 学期对象 term
 *
 * @author A
 * @date 2024-01-15
 */
@TableName("term")
public class Term extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 学期ID，格式：2024-2025-1 */
    @TableId
    @Excel(name = "学期ID")
    private String termId;

    /** 学期名称，如：2024-2025秋季 */
    @Excel(name = "学期名称")
    private String termName;

    /** 选课开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "选课开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date enrollStart;

    /** 选课结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "选课结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date enrollEnd;

    /** 退课截止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "退课截止时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date dropDeadline;

    /** 是否当前学期（1是，0否） */
    @Excel(name = "是否当前学期")
    private Integer isActive;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    // ============ Getter和Setter方法 ============
    public String getTermId() {
        return termId;
    }

    public void setTermId(String termId) {
        this.termId = termId;
    }

    public String getTermName() {
        return termName;
    }

    public void setTermName(String termName) {
        this.termName = termName;
    }

    public Date getEnrollStart() {
        return enrollStart;
    }

    public void setEnrollStart(Date enrollStart) {
        this.enrollStart = enrollStart;
    }

    public Date getEnrollEnd() {
        return enrollEnd;
    }

    public void setEnrollEnd(Date enrollEnd) {
        this.enrollEnd = enrollEnd;
    }

    public Date getDropDeadline() {
        return dropDeadline;
    }

    public void setDropDeadline(Date dropDeadline) {
        this.dropDeadline = dropDeadline;
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
                .append("termId", getTermId())
                .append("termName", getTermName())
                .append("enrollStart", getEnrollStart())
                .append("enrollEnd", getEnrollEnd())
                .append("dropDeadline", getDropDeadline())
                .append("isActive", getIsActive())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}