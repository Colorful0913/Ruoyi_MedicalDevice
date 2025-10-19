package com.ruoyi.device.service;

import java.util.List;
import com.ruoyi.device.domain.PurchaseApply;

/**
 * 采购申请Service接口
 * 
 * @author liubowen
 * @date 2025-10-18
 */
public interface IPurchaseApplyService 
{
    /**
     * 查询采购申请
     * 
     * @param applyId 采购申请主键
     * @return 采购申请
     */
    public PurchaseApply selectPurchaseApplyByApplyId(Long applyId);

    /**
     * 查询采购申请列表
     * 
     * @param purchaseApply 采购申请
     * @return 采购申请集合
     */
    public List<PurchaseApply> selectPurchaseApplyList(PurchaseApply purchaseApply);

    /**
     * 新增采购申请
     * 
     * @param purchaseApply 采购申请
     * @return 结果
     */
    public int insertPurchaseApply(PurchaseApply purchaseApply);

    /**
     * 修改采购申请
     * 
     * @param purchaseApply 采购申请
     * @return 结果
     */
    public int updatePurchaseApply(PurchaseApply purchaseApply);

    /**
     * 批量删除采购申请
     * 
     * @param applyIds 需要删除的采购申请主键集合
     * @return 结果
     */
    public int deletePurchaseApplyByApplyIds(Long[] applyIds);

    /**
     * 删除采购申请信息
     * 
     * @param applyId 采购申请主键
     * @return 结果
     */
    public int deletePurchaseApplyByApplyId(Long applyId);

    public int approvePurchaseApply(PurchaseApply purchaseApply);
}
