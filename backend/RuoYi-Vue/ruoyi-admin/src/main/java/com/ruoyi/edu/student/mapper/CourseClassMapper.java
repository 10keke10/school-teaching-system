package com.ruoyi.edu.student.mapper;

import com.ruoyi.edu.domain.CourseClass;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 教学班Mapper
 */
public interface CourseClassMapper {

        CourseClass selectCourseClassById(Long classId);
        
        CourseClass selectCourseClassByIdForUpdate(Long classId);

        /**
         * 查询可选课程列表（按学期过滤，可带学生ID标记已选）
         */
        List<Map<String, Object>> selectAvailableCoursesPaged(@Param("studentId") Long studentId,
                        @Param("termId") String termId,
                        @Param("courseName") String courseName,
                        @Param("offset") Integer offset,
                        @Param("pageSize") Integer pageSize);

        /**
         * 统计可选课程总数（用于分页total）
         */
        Integer selectAvailableCoursesCount(@Param("studentId") Long studentId,
                        @Param("termId") String termId,
                        @Param("courseName") String courseName);

        /**
         * 查询课程信息（含课程名称/学分等），用于选课/学分校验
         */
        Map<String, Object> selectCourseInfo(@Param("classId") Long classId);

        /**
         * 乐观更新已选人数 +1（仅当未超容量）
         */
        int increaseSelectedCount(Long classId);

        /**
         * 已选人数 -1（不低于0）
         */
        int decreaseSelectedCount(Long classId);

        /**
         * 查询教师所教的所有班级（含课程信息、学生数量）
         */
        List<Map<String, Object>> selectClassesByTeacherId(@Param("teacherId") Long teacherId,
                        @Param("termId") String termId);

        /**
         * 查询学生在指定学期已选课程的上课时间字符串（来自course_class.class_time）
         */
        List<Map<String, Object>> selectEnrolledClassTimesByStudentAndTerm(@Param("studentId") Long studentId,
                        @Param("termId") String termId);

        /**
         * 查询学生在指定学期已选课程的课表详情（课程名、地点、教师、class_time）
         */
        List<Map<String, Object>> selectEnrolledClassScheduleByStudentAndTerm(@Param("studentId") Long studentId,
                        @Param("termId") String termId);
}
