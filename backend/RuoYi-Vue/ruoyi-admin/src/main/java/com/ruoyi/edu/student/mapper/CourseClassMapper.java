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

    /**
     * 查询可选课程列表（按学期过滤，可带学生ID标记已选）
     */
    List<Map<String, Object>> selectAvailableCourses(@Param("studentId") Long studentId,
            @Param("termId") String termId);

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
}
