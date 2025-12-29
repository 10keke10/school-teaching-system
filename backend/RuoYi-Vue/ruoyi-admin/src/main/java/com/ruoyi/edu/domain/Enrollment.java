package com.ruoyi.edu.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 选课记录 enrollment
 */
public class Enrollment extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 选课记录ID */
    private Long enrollmentId;

    /** 学生ID（关联 sys_user.user_id） */
    @Excel(name = "学生ID")
    private Long studentId;

    /** 教学班ID */
    @Excel(name = "教学班ID")
    private Long classId;

    /** 学期ID */
    @Excel(name = "学期ID")
    private String termId;

    /** 状态：ENROLLED / DROPPED */
    @Excel(name = "状态")
    private String status;

    /** 成绩 */
    @Excel(name = "成绩")
    private BigDecimal grade;

    /** 成绩状态：DRAFT / PUBLISHED */
    @Excel(name = "成绩状态")
    private String gradeStatus;

    /** 选课时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "选课时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date enrollTime;

    /** 退课时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "退课时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date dropTime;

    public Long getEnrollmentId() {
        return enrollmentId;
    }

    public void setEnrollmentId(Long enrollmentId) {
        this.enrollmentId = enrollmentId;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public Long getClassId() {
        return classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public String getTermId() {
        return termId;
    }

    public void setTermId(String termId) {
        this.termId = termId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BigDecimal getGrade() {
        return grade;
    }

    public void setGrade(BigDecimal grade) {
        this.grade = grade;
    }

    public String getGradeStatus() {
        return gradeStatus;
    }

    public void setGradeStatus(String gradeStatus) {
        this.gradeStatus = gradeStatus;
    }

    public Date getEnrollTime() {
        return enrollTime;
    }

    public void setEnrollTime(Date enrollTime) {
        this.enrollTime = enrollTime;
    }

    public Date getDropTime() {
        return dropTime;
    }

    public void setDropTime(Date dropTime) {
        this.dropTime = dropTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("enrollmentId", getEnrollmentId())
                .append("studentId", getStudentId())
                .append("classId", getClassId())
                .append("termId", getTermId())
                .append("status", getStatus())
                .append("grade", getGrade())
                .append("gradeStatus", getGradeStatus())
                .append("enrollTime", getEnrollTime())
                .append("dropTime", getDropTime())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
