// 位置：ruoyi-admin/src/main/java/com/ruoyi/edu/student/mapper/EnrollmentMapper.java
package com.ruoyi.edu.student.mapper;

import com.ruoyi.edu.domain.Enrollment;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 选课记录Mapper接口
 */
public interface EnrollmentMapper {
    
    /**
     * 根据ID查询选课记录
     */
    Enrollment selectEnrollmentById(Long enrollmentId);
    
    /**
     * 查询学生和班级的选课记录
     */
    Enrollment selectByStudentAndClass(@Param("studentId") Long studentId, 
                                       @Param("classId") Long classId);
    
    /**
     * 查询学生的所有选课记录
     */
    List<Enrollment> selectByStudentId(Long studentId);
    
    /**
     * 查询班级的所有选课记录
     */
    List<Enrollment> selectByClassId(Long classId);
    
    /**
     * 新增选课记录
     */
    int insertEnrollment(Enrollment enrollment);
    
    /**
     * 更新选课记录
     */
    int updateEnrollment(Enrollment enrollment);

    /**
     * Update the grade status for every enrollment in the given class.
     *
     * @param classId     class identifier whose enrollments should be updated
     * @param gradeStatus new grade status to persist
     * @return number of enrollments that were updated
     */
    int updateGradeStatusByClass(@Param("classId") Long classId, @Param("gradeStatus") String gradeStatus);
    
    /**
     * 调用存储过程：计算学生学分
     */
    void callCalcStudentCredits(Map<String, Object> params);
    
    /**
     * 检查学生是否已选某课程
     */
    boolean exists(@Param("studentId") Long studentId, 
                   @Param("classId") Long classId);

    /**
     * 查询选课记录列表
     */
    List<Enrollment> selectEnrollmentList(Enrollment enrollment);

    /**
     * 批量删除选课记录
     */
    int deleteEnrollmentByIds(Long[] enrollmentIds);
}
