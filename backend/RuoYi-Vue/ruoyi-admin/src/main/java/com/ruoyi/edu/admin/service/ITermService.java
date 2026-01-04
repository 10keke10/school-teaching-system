package com.ruoyi.edu.admin.service;

import java.util.List;
import com.ruoyi.edu.domain.Term;

/**
 * 学期Service接口
 * 
 * @author A
 * @date 2024-01-15
 */
public interface ITermService 
{
    /**
     * 查询学期
     * 
     * @param termId 学期主键
     * @return 学期
     */
    public Term selectTermByTermId(String termId);

    /**
     * 查询学期列表
     * 
     * @param term 学期
     * @return 学期集合
     */
    public List<Term> selectTermList(Term term);

    /**
     * 新增学期
     * 
     * @param term 学期
     * @return 结果
     */
    public int insertTerm(Term term);

    /**
     * 修改学期
     * 
     * @param term 学期
     * @return 结果
     */
    public int updateTerm(Term term);

    /**
     * 批量删除学期
     * 
     * @param termIds 需要删除的学期主键集合
     * @return 结果
     */
    public int deleteTermByTermIds(String[] termIds);

    /**
     * 删除学期信息
     * 
     * @param termId 学期主键
     * @return 结果
     */
    public int deleteTermByTermId(String termId);
}
