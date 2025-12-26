// 文件：src/main/java/com/ruoyi/edu/domain/ClassTimeSlot.java
package com.ruoyi.edu.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 上课时间槽对象 class_time_slot
 * 
 * @author B同学
 * @date 2024-XX-XX
 */
@TableName("class_time_slot")
public class ClassTimeSlot extends BaseEntity {
  private static final long serialVersionUID = 1L;

  /** 时间槽ID */
  @TableId(type = IdType.AUTO)
  private Long slotId;

  /** 教学班ID */
  @Excel(name = "教学班ID")
  private Long classId;

  /** 星期几（1-7，1=周一） */
  @Excel(name = "星期几")
  private Integer weekDay;

  /** 开始节次（1-12） */
  @Excel(name = "开始节次")
  private Integer startSlot;

  /** 结束节次 */
  @Excel(name = "结束节次")
  private Integer endSlot;

  /** 创建时间 */
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
  private Date createTime;

  /** 更新时间 */
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
  private Date updateTime;

  // Getter和Setter方法
  public Long getSlotId() {
    return slotId;
  }

  public void setSlotId(Long slotId) {
    this.slotId = slotId;
  }

  public Long getClassId() {
    return classId;
  }

  public void setClassId(Long classId) {
    this.classId = classId;
  }

  public Integer getWeekDay() {
    return weekDay;
  }

  public void setWeekDay(Integer weekDay) {
    this.weekDay = weekDay;
  }

  public Integer getStartSlot() {
    return startSlot;
  }

  public void setStartSlot(Integer startSlot) {
    this.startSlot = startSlot;
  }

  public Integer getEndSlot() {
    return endSlot;
  }

  public void setEndSlot(Integer endSlot) {
    this.endSlot = endSlot;
  }

  public Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }

  public Date getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(Date updateTime) {
    this.updateTime = updateTime;
  }

  @Override
  public String toString() {
    return "ClassTimeSlot{" +
        "slotId=" + slotId +
        ", classId=" + classId +
        ", weekDay=" + weekDay +
        ", startSlot=" + startSlot +
        ", endSlot=" + endSlot +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        '}';
  }

  /**
   * 辅助方法：获取时间段的字符串表示
   * 例如：周一第1-2节
   */
  public String getTimeSlotString() {
    String[] weekDays = { "", "周一", "周二", "周三", "周四", "周五", "周六", "周日" };
    String dayStr = weekDay >= 1 && weekDay <= 7 ? weekDays[weekDay] : "未知";
    return dayStr + "第" + startSlot + "-" + endSlot + "节";
  }

  /**
   * 检查时间是否冲突
   * 
   * @param other 另一个时间槽
   * @return true表示时间冲突
   */
  public boolean isTimeConflict(ClassTimeSlot other) {
    if (!this.weekDay.equals(other.weekDay)) {
      return false; // 不同天，不冲突
    }

    // 检查时间段是否有重叠
    return !(this.endSlot < other.startSlot || this.startSlot > other.endSlot);
  }
}