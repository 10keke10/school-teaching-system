package com.ruoyi.edu.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 教学班对象 course_class
 *
 * @author A
 * @date 2024-01-15
 */
@TableName("course_class")
public class CourseClass extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 教学班ID */
    @TableId(type = IdType.AUTO)
    private Long classId;

    /** 课程ID */
    @Excel(name = "课程ID")
    private Long courseId;

    /** 教师ID（关联sys_user.user_id） */
    @Excel(name = "教师ID")
    private Long teacherId;

    /** 学期ID */
    @Excel(name = "学期ID")
    private String termId;

    /** 上课时间，如：周一1-2节，周三3-4节 */
    @Excel(name = "上课时间")
    private String classTime;

    /** 上课地点 */
    @Excel(name = "上课地点")
    private String location;

    /** 课程容量 */
    @Excel(name = "课程容量")
    private Integer capacity;

    /** 已选人数 */
    @Excel(name = "已选人数")
    private Integer selectedCount;

    /** 状态：1开放选课，0关闭 */
    @Excel(name = "状态")
    private Integer status;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    // ============ Getter和Setter方法 ============
    public Long getClassId() {
        return classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public Long getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Long teacherId) {
        this.teacherId = teacherId;
    }

    public String getTermId() {
        return termId;
    }

    public void setTermId(String termId) {
        this.termId = termId;
    }

    public String getClassTime() {
        return classTime;
    }

    public void setClassTime(String classTime) {
        this.classTime = classTime;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public Integer getSelectedCount() {
        return selectedCount;
    }

    public void setSelectedCount(Integer selectedCount) {
        this.selectedCount = selectedCount;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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
                .append("classId", getClassId())
                .append("courseId", getCourseId())
                .append("teacherId", getTeacherId())
                .append("termId", getTermId())
                .append("classTime", getClassTime())
                .append("location", getLocation())
                .append("capacity", getCapacity())
                .append("selectedCount", getSelectedCount())
                .append("status", getStatus())
                .append("remark", getRemark())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }

    // ============ 业务方法 ============
    /**
     * 检查是否还有空余名额
     * @return true 表示还有空余名额，false 表示已满
     */
    public boolean hasVacancy() {
        return selectedCount < capacity;
    }

    /**
     * 增加已选人数
     */
    public void increaseSelectedCount() {
        if (selectedCount < capacity) {
            selectedCount++;
        }
    }

    /**
     * 减少已选人数
     */
    public void decreaseSelectedCount() {
        if (selectedCount > 0) {
            selectedCount--;
        }
    }

    /**
     * 获取剩余名额
     * @return 剩余名额数
     */
    public Integer getRemainingSeats() {
        return capacity - selectedCount;
    }
}