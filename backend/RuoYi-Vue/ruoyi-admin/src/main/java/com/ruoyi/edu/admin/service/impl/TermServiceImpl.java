package com.ruoyi.edu.admin.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.edu.admin.mapper.TermMapper;
import com.ruoyi.edu.domain.Term;
import com.ruoyi.edu.admin.service.ITermService;

/**
 * 学期Service业务层处理
 * 
 * @author A
 * @date 2024-01-15
 */
@Service
public class TermServiceImpl implements ITermService 
{
    @Autowired
    private TermMapper termMapper;

    /**
     * 查询学期
     * 
     * @param termId 学期主键
     * @return 学期
     */
    @Override
    public Term selectTermByTermId(String termId)
    {
        return termMapper.selectTermByTermId(termId);
    }

    /**
     * 查询学期列表
     * 
     * @param term 学期
     * @return 学期
     */
    @Override
    public List<Term> selectTermList(Term term)
    {
        return termMapper.selectTermList(term);
    }

    /**
     * 新增学期
     * 
     * @param term 学期
     * @return 结果
     */
    @Override
    @Transactional
    public int insertTerm(Term term)
    {
        if (term.getIsActive() != null && term.getIsActive() == 1) {
            termMapper.resetAllActive();
        }
        term.setCreateTime(DateUtils.getNowDate());
        return termMapper.insertTerm(term);
    }

    /**
     * 修改学期
     * 
     * @param term 学期
     * @return 结果
     */
    @Override
    @Transactional
    public int updateTerm(Term term)
    {
        if (term.getIsActive() != null && term.getIsActive() == 1) {
            termMapper.resetAllActive();
        }
        term.setUpdateTime(DateUtils.getNowDate());
        return termMapper.updateTerm(term);
    }

    /**
     * 批量删除学期
     * 
     * @param termIds 需要删除的学期主键
     * @return 结果
     */
    @Override
    public int deleteTermByTermIds(String[] termIds)
    {
        return termMapper.deleteTermByTermIds(termIds);
    }

    /**
     * 删除学期信息
     * 
     * @param termId 学期主键
     * @return 结果
     */
    @Override
    public int deleteTermByTermId(String termId)
    {
        return termMapper.deleteTermByTermId(termId);
    }
}
