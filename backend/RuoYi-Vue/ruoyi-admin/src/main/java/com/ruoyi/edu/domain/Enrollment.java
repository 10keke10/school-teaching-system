// 文件：src/main/java/com/ruoyi/edu/domain/Enrollment.java
package com.ruoyi.edu.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 选课记录对象 enrollment
 * 
 * @author B同学
 * @date 2024-XX-XX
 */
@TableName("enrollment")
public class Enrollment extends BaseEntity {
  private static final long serialVersionUID = 1L;

  /** 选课记录ID */
  @TableId(type = IdType.AUTO)
  private Long enrollmentId;

  /** 学生ID */
  @Excel(name = "学生ID")
  private Long studentId;

  /** 教学班ID */
  @Excel(name = "教学班ID")
  private Long classId;

  /** 学期ID */
  @Excel(name = "学期ID")
  private String termId;

  /** 状态：ENROLLED已选课，DROPPED已退课 */
  @Excel(name = "状态")
  private String status;

  /** 成绩（0-100，支持小数） */
  @Excel(name = "成绩")
  private BigDecimal grade;

  /** 成绩状态：DRAFT草稿，PUBLISHED已发布 */
  @Excel(name = "成绩状态")
  private String gradeStatus;

  /** 选课时间 */
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  @Excel(name = "选课时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
  private Date enrollTime;

  /** 退课时间 */
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  @Excel(name = "退课时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
  private Date dropTime;

  // Getter和Setter方法（必须要有）
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
    return "Enrollment{" +
        "enrollmentId=" + enrollmentId +
        ", studentId=" + studentId +
        ", classId=" + classId +
        ", termId='" + termId + '\'' +
        ", status='" + status + '\'' +
        ", grade=" + grade +
        ", gradeStatus='" + gradeStatus + '\'' +
        ", enrollTime=" + enrollTime +
        ", dropTime=" + dropTime +
        '}';
  }
}