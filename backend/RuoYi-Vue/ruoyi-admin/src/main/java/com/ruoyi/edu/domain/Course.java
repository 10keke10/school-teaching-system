package com.ruoyi.edu.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 课程信息对象 course
 *
 * @author A
 * @date 2024-01-15
 */
@TableName("course")
public class Course extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 课程ID */
    @TableId(type = IdType.AUTO)
    private Long courseId;

    /** 课程代码 */
    @Excel(name = "课程代码")
    private String courseCode;

    /** 课程名称 */
    @Excel(name = "课程名称")
    private String courseName;

    /** 学分 */
    @Excel(name = "学分")
    private Integer creditHours;

    /** 开课院系ID（关联sys_dept.dept_id） */
    @Excel(name = "开课院系ID")
    private Long deptId;

    /** 课程类型：必修/选修 */
    @Excel(name = "课程类型")
    private String courseType;

    /** 课程描述 */
    @Excel(name = "课程描述")
    private String description;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    // ============ Getter和Setter方法 ============
    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Integer getCreditHours() {
        return creditHours;
    }

    public void setCreditHours(Integer creditHours) {
        this.creditHours = creditHours;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
                .append("courseId", getCourseId())
                .append("courseCode", getCourseCode())
                .append("courseName", getCourseName())
                .append("creditHours", getCreditHours())
                .append("deptId", getDeptId())
                .append("courseType", getCourseType())
                .append("description", getDescription())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}