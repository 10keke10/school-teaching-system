package com.ruoyi.edu.student.mapper;

import com.ruoyi.edu.domain.ClassTimeSlot;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 课堂时间槽Mapper
 */
public interface ClassTimeSlotMapper {

    /**
     * 查询某教学班的时间槽
     */
    List<ClassTimeSlot> selectByClassId(Long classId);

    /**
     * 查询学生当前已选课程的时间槽（通过 enrollment 关联）
     */
    List<ClassTimeSlot> selectByStudentId(@Param("studentId") Long studentId);

    /**
     * 查询学生在指定学期的已选课程时间槽
     */
    List<ClassTimeSlot> selectByStudentIdAndTerm(@Param("studentId") Long studentId,
            @Param("termId") String termId);

    /**
     * 查询学生课表视图（含课程名称、地点等）
     */
    List<Map<String, Object>> selectTimetableByStudent(@Param("studentId") Long studentId);
}
