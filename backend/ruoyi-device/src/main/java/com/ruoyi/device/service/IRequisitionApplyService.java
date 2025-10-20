package com.ruoyi.device.service;

import java.util.List;
import com.ruoyi.device.domain.RequisitionApply;

/**
 * 科室领用申请单Service接口
 * 
 * @author liubowen
 * @date 2025-10-19
 */
public interface IRequisitionApplyService 
{
    /**
     * 查询科室领用申请单
     * 
     * @param requisitionId 科室领用申请单主键
     * @return 科室领用申请单
     */
    public RequisitionApply selectRequisitionApplyByRequisitionId(Long requisitionId);

    /**
     * 查询科室领用申请单列表
     * 
     * @param requisitionApply 科室领用申请单
     * @return 科室领用申请单集合
     */
    public List<RequisitionApply> selectRequisitionApplyList(RequisitionApply requisitionApply);

    /**
     * 新增科室领用申请单
     * 
     * @param requisitionApply 科室领用申请单
     * @return 结果
     */
    public int insertRequisitionApply(RequisitionApply requisitionApply);

    /**
     * 修改科室领用申请单
     * 
     * @param requisitionApply 科室领用申请单
     * @return 结果
     */
    public int updateRequisitionApply(RequisitionApply requisitionApply);

    /**
     * 批量删除科室领用申请单
     * 
     * @param requisitionIds 需要删除的科室领用申请单主键集合
     * @return 结果
     */
    public int deleteRequisitionApplyByRequisitionIds(Long[] requisitionIds);

    /**
     * 删除科室领用申请单信息
     * 
     * @param requisitionId 科室领用申请单主键
     * @return 结果
     */
    public int deleteRequisitionApplyByRequisitionId(Long requisitionId);

    public int approveAndProcessOutbound(Long requisitionId);

    public int rejectRequisitionApply(Long requisitionId, String remark);

    /**
     * 获取待审核申请数量
     * 
     * @return 待审核申请数量
     */
    public Long getPendingCount();

    /**
     * 获取本月出库数量
     * 
     * @return 本月出库数量
     */
    public Long getMonthlyOutboundCount();
}
