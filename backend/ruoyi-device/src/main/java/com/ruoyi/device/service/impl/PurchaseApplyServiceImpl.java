package com.ruoyi.device.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.device.mapper.PurchaseApplyMapper;
import com.ruoyi.device.domain.PurchaseApply;
import com.ruoyi.device.service.IPurchaseApplyService;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils; // 用于获取当前用户名
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 采购申请Service业务层处理
 * 
 * @author liubowen
 * @date 2025-10-18
 */
@Service
public class PurchaseApplyServiceImpl implements IPurchaseApplyService 
{
    @Autowired
    private PurchaseApplyMapper purchaseApplyMapper;

    /**
     * 查询采购申请
     * 
     * @param applyId 采购申请主键
     * @return 采购申请
     */
    @Override
    public PurchaseApply selectPurchaseApplyByApplyId(Long applyId)
    {
        return purchaseApplyMapper.selectPurchaseApplyByApplyId(applyId);
    }

    /**
     * 查询采购申请列表
     * 
     * @param purchaseApply 采购申请
     * @return 采购申请
     */
    @Override
    public List<PurchaseApply> selectPurchaseApplyList(PurchaseApply purchaseApply)
    {
        return purchaseApplyMapper.selectPurchaseApplyList(purchaseApply);
    }

    /**
     * 新增采购申请
     * 
     * @param purchaseApply 采购申请
     * @return 结果
     */
    @Override
    public int insertPurchaseApply(PurchaseApply purchaseApply)
    {
        // 1. 【手动添加】设置默认的审批状态为 '0' (待审批)
        purchaseApply.setApplyStatus("0");

        // 2. 【手动添加】生成一个唯一的申请单号（例如：CG + 年月日时分秒）
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String timestamp = sdf.format(new Date());
        purchaseApply.setApplyCode("CG" + timestamp);

        // 3. 【手动添加】设置申请人为当前登录用户
        purchaseApply.setCreateBy(SecurityUtils.getUsername());

        // 4. (这是代码生成器已有的) 设置创建时间
        purchaseApply.setCreateTime(DateUtils.getNowDate());

        // 5. 调用 mapper 将完整的数据插入数据库
        return purchaseApplyMapper.insertPurchaseApply(purchaseApply);
    }

    /**
     * 修改采购申请
     * 
     * @param purchaseApply 采购申请
     * @return 结果
     */
    @Override
    public int updatePurchaseApply(PurchaseApply purchaseApply)
    {
        purchaseApply.setUpdateTime(DateUtils.getNowDate());
        return purchaseApplyMapper.updatePurchaseApply(purchaseApply);
    }

    /**
     * 批量删除采购申请
     * 
     * @param applyIds 需要删除的采购申请主键
     * @return 结果
     */
    @Override
    public int deletePurchaseApplyByApplyIds(Long[] applyIds)
    {
        return purchaseApplyMapper.deletePurchaseApplyByApplyIds(applyIds);
    }

    /**
     * 删除采购申请信息
     * 
     * @param applyId 采购申请主键
     * @return 结果
     */
    @Override
    public int deletePurchaseApplyByApplyId(Long applyId)
    {
        return purchaseApplyMapper.deletePurchaseApplyByApplyId(applyId);
    }

    @Override
    public int approvePurchaseApply(PurchaseApply purchaseApply) {
        // 1. 从数据库中获取最新的申请单信息
        PurchaseApply currentApply = purchaseApplyMapper.selectPurchaseApplyByApplyId(purchaseApply.getApplyId());

        // 2. 状态校验，确保只有“待审批”的单据才能被操作
        if (currentApply == null || !"0".equals(currentApply.getApplyStatus())) {
            throw new RuntimeException("操作失败，该申请单状态已改变！");
        }

        // 3. 设置审批人和审批时间
        purchaseApply.setApproverBy(SecurityUtils.getUsername());
        purchaseApply.setApproveTime(DateUtils.getNowDate());

        // 4. 调用 update 方法更新数据库
        return purchaseApplyMapper.updatePurchaseApply(purchaseApply);
    }
}
