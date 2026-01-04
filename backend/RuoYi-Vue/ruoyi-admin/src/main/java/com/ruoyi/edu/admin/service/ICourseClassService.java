package com.ruoyi.edu.admin.service;

import java.util.List;
import com.ruoyi.edu.domain.CourseClass;

/**
 * 教学班Service接口
 * 
 * @author A
 * @date 2024-01-15
 */
public interface ICourseClassService 
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
    public List<CourseClass> selectCourseClassList(CourseClass courseClass);

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
     * 批量删除教学班
     * 
     * @param classIds 需要删除的教学班ID
     * @return 结果
     */
    public int deleteCourseClassByIds(Long[] classIds);

    /**
     * 删除教学班信息
     * 
     * @param classId 教学班ID
     * @return 结果
     */
    public int deleteCourseClassById(Long classId);
}
