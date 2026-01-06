package com.ruoyi.edu.admin.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;
import com.ruoyi.edu.admin.mapper.AdminCourseClassMapper;
import com.ruoyi.edu.student.mapper.EnrollmentMapper;
import com.ruoyi.edu.domain.CourseClass;
import com.ruoyi.edu.admin.service.ICourseClassService;

/**
 * 教学班Service业务层处理
 * 
 * @author A
 * @date 2024-01-15
 */
@Service
public class CourseClassServiceImpl implements ICourseClassService 
{
    @Autowired
    private AdminCourseClassMapper courseClassMapper;
    @Autowired
    private EnrollmentMapper enrollmentMapper;

    /**
     * 查询教学班
     * 
     * @param classId 教学班ID
     * @return 教学班
     */
    @Override
    public CourseClass selectCourseClassById(Long classId)
    {
        return courseClassMapper.selectCourseClassById(classId);
    }

    /**
     * 查询教学班列表
     * 
     * @param courseClass 教学班
     * @return 教学班
     */
    @Override
    public List<CourseClass> selectCourseClassList(CourseClass courseClass)
    {
        return courseClassMapper.selectCourseClassList(courseClass);
    }

    /**
     * 新增教学班
     * 
     * @param courseClass 教学班
     * @return 结果
     */
    @Override
    public int insertCourseClass(CourseClass courseClass)
    {
        courseClass.setCreateTime(DateUtils.getNowDate());
        return courseClassMapper.insertCourseClass(courseClass);
    }

    /**
     * 修改教学班
     * 
     * @param courseClass 教学班
     * @return 结果
     */
    @Override
    public int updateCourseClass(CourseClass courseClass)
    {
        courseClass.setUpdateTime(DateUtils.getNowDate());
        return courseClassMapper.updateCourseClass(courseClass);
    }

    /**
     * 批量删除教学班
     * 
     * @param classIds 需要删除的教学班ID
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteCourseClassByIds(Long[] classIds)
    {
        enrollmentMapper.deleteByClassIds(classIds);
        return courseClassMapper.deleteCourseClassByIds(classIds);
    }

    /**
     * 删除教学班信息
     * 
     * @param classId 教学班ID
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteCourseClassById(Long classId)
    {
        enrollmentMapper.deleteByClassId(classId);
        return courseClassMapper.deleteCourseClassById(classId);
    }
}
