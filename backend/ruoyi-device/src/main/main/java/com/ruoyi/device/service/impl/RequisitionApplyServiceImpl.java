package com.ruoyi.device.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.device.mapper.RequisitionApplyMapper;
import com.ruoyi.device.domain.RequisitionApply;
import com.ruoyi.device.service.IRequisitionApplyService;

/**
 * 科室领用申请单Service业务层处理
 * 
 * @author liubowen
 * @date 2025-10-19
 */
@Service
public class RequisitionApplyServiceImpl implements IRequisitionApplyService 
{
    @Autowired
    private RequisitionApplyMapper requisitionApplyMapper;

    /**
     * 查询科室领用申请单
     * 
     * @param requisitionId 科室领用申请单主键
     * @return 科室领用申请单
     */
    @Override
    public RequisitionApply selectRequisitionApplyByRequisitionId(Long requisitionId)
    {
        return requisitionApplyMapper.selectRequisitionApplyByRequisitionId(requisitionId);
    }

    /**
     * 查询科室领用申请单列表
     * 
     * @param requisitionApply 科室领用申请单
     * @return 科室领用申请单
     */
    @Override
    public List<RequisitionApply> selectRequisitionApplyList(RequisitionApply requisitionApply)
    {
        return requisitionApplyMapper.selectRequisitionApplyList(requisitionApply);
    }

    /**
     * 新增科室领用申请单
     * 
     * @param requisitionApply 科室领用申请单
     * @return 结果
     */
    @Override
    public int insertRequisitionApply(RequisitionApply requisitionApply)
    {
        requisitionApply.setCreateTime(DateUtils.getNowDate());
        return requisitionApplyMapper.insertRequisitionApply(requisitionApply);
    }

    /**
     * 修改科室领用申请单
     * 
     * @param requisitionApply 科室领用申请单
     * @return 结果
     */
    @Override
    public int updateRequisitionApply(RequisitionApply requisitionApply)
    {
        requisitionApply.setUpdateTime(DateUtils.getNowDate());
        return requisitionApplyMapper.updateRequisitionApply(requisitionApply);
    }

    /**
     * 批量删除科室领用申请单
     * 
     * @param requisitionIds 需要删除的科室领用申请单主键
     * @return 结果
     */
    @Override
    public int deleteRequisitionApplyByRequisitionIds(Long[] requisitionIds)
    {
        return requisitionApplyMapper.deleteRequisitionApplyByRequisitionIds(requisitionIds);
    }

    /**
     * 删除科室领用申请单信息
     * 
     * @param requisitionId 科室领用申请单主键
     * @return 结果
     */
    @Override
    public int deleteRequisitionApplyByRequisitionId(Long requisitionId)
    {
        return requisitionApplyMapper.deleteRequisitionApplyByRequisitionId(requisitionId);
    }
}
