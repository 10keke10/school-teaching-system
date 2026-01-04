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
     * 统计班级已选人数（只统计ENROLLED）
     */
    int countEnrolledByClassId(Long classId);

    /**
     * 查询某学生是否已有此班级的有效选课记录
     */
    Enrollment selectActiveByStudentAndClass(@Param("studentId") Long studentId,
            @Param("classId") Long classId);

    /**
     * 查询学生当前已选（ENROLLED）课程的时间槽，用于冲突检测
     */
    List<Long> selectActiveClassIdsByStudent(Long studentId);

    /**
     * 查询学生成绩列表（可按学期/状态过滤）
     */
    List<Enrollment> selectStudentGrades(@Param("studentId") Long studentId,
            @Param("termId") String termId,
            @Param("gradeStatus") String gradeStatus);

    /**
     * 成绩视图（含课程名称）
     */
    List<Map<String, Object>> selectStudentGradeView(@Param("studentId") Long studentId,
            @Param("termId") String termId,
            @Param("gradeStatus") String gradeStatus);

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

    /**
     * 查询班级成绩统计（平均分等）
     */
    Map<String, Object> selectClassGradeStatistics(@Param("classId") Long classId);

    /**
     * 检查学生在同一学期是否已选相同课程号（按course_code判断）
     */
    boolean existsSameCourseInTerm(@Param("studentId") Long studentId,
            @Param("classId") Long classId);
}
