package com.ruoyi.edu.admin.mapper;

import java.util.List;
import com.ruoyi.edu.domain.CourseClass;
import org.apache.ibatis.annotations.Mapper;

import org.apache.ibatis.annotations.Param;

/**
 * 教学班Mapper接口
 * 
 * @author A
 * @date 2024-01-15
 */
@Mapper
public interface AdminCourseClassMapper 
{
    /**
     * 查询教学班
     * 
     * @param classId 教学班ID
     * @return 教学班
     */
    public CourseClass selectCourseClassById(Long classId);

    /**
     * 查询教学班列表
     * 
     * @param courseClass 教学班
     * @return 教学班集合
     */
    public List<CourseClass> selectCourseClassList(@Param("courseClass") CourseClass courseClass);

    /**
     * 新增教学班
     * 
     * @param courseClass 教学班
     * @return 结果
     */
    public int insertCourseClass(CourseClass courseClass);

    /**
     * 修改教学班
     * 
     * @param courseClass 教学班
     * @return 结果
     */
    public int updateCourseClass(CourseClass courseClass);

    /**
     * 删除教学班
     * 
     * @param classId 教学班ID
     * @return 结果
     */
    public int deleteCourseClassById(Long classId);

    /**
     * 批量删除教学班
     * 
     * @param classIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteCourseClassByIds(Long[] classIds);
}
