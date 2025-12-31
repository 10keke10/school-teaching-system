// 位置：ruoyi-admin/src/main/java/com/ruoyi/edu/student/service/IEnrollmentService.java
package com.ruoyi.edu.student.service;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.edu.domain.Enrollment;

import java.util.List;
import java.util.Map;

/**
 * 选课业务服务接口
 */
public interface IEnrollmentService {
    
    /**
     * 学生选课
     * @param studentId 学生ID
     * @param classId 教学班ID
     * @return 操作结果
     */
    AjaxResult enrollCourse(Long studentId, Long classId);
    
    /**
     * 学生退课
     * @param enrollmentId 选课记录ID
     * @return 操作结果
     */
    AjaxResult dropCourse(Long enrollmentId);
    
    /**
     * 检查学分上限
     * @param studentId 学生ID
     * @param termId 学期ID
     * @return 是否超过上限
     */
    boolean checkCreditLimit(Long studentId, String termId);
    
    /**
     * 检查时间冲突
     * @param studentId 学生ID
     * @param classId 教学班ID
     * @return 是否存在冲突
     */
    boolean checkTimeConflict(Long studentId, Long classId);

    /**
    * 获取学生学分统计信息（调用A的存储过程）
    * @param studentId 学生ID
    * @param termId 学期ID
    * @return 学分统计信息
    */
    Map<String, Object> getStudentCreditInfo(Long studentId, String termId);

    /**
     * 可选课程列表（含是否已选、容量等）
     */
    Map<String, Object> listAvailableCourses(Long studentId, String termId);

    /**
     * 学生课表数据
     */
    Map<String, Object> getStudentTimetable(Long studentId);

    /**
     * 学生成绩列表
     */
    List<Map<String, Object>> getStudentGrades(Long studentId, String termId, String gradeStatus);

    /**
     * 查询选课记录列表
     */
    List<Enrollment> selectEnrollmentList(Enrollment enrollment);

    /**
     * 根据ID查询选课记录
     */
    Enrollment selectEnrollmentById(Long enrollmentId);

    /**
     * 新增选课记录
     */
    int insertEnrollment(Enrollment enrollment);

    /**
     * 更新选课记录
     */
    int updateEnrollment(Enrollment enrollment);

    /**
     * 批量删除选课记录
     */
    int deleteEnrollmentByIds(Long[] enrollmentIds);

    /**
     * 获取班级成绩统计信息（平均分等）
     */
    Map<String, Object> getClassGradeStatistics(Long classId);
}
