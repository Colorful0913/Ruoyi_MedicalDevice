package com.ruoyi.device.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.device.domain.DeviceInfo;
import com.ruoyi.device.domain.InventoryBatch;
import com.ruoyi.device.mapper.InventoryBatchMapper;
import com.ruoyi.device.service.IDeviceInfoService;
import com.ruoyi.device.service.IInventoryBatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.device.mapper.RequisitionApplyMapper;
import com.ruoyi.device.domain.RequisitionApply;
import com.ruoyi.device.service.IRequisitionApplyService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 科室领用申请单Service业务层处理
 * * @author liubowen
 * @date 2025-10-19
 */
@Service
public class RequisitionApplyServiceImpl implements IRequisitionApplyService
{
    @Autowired
    private RequisitionApplyMapper requisitionApplyMapper;

    // 【新增】注入依赖
    @Autowired
    private InventoryBatchMapper inventoryBatchMapper;

    @Autowired
    private IDeviceInfoService deviceInfoService;

    /**
     * 查询科室领用申请单
     * * @param requisitionId 科室领用申请单主键
     * @return 科室领用申请单
     */
    @Override
    public RequisitionApply selectRequisitionApplyByRequisitionId(Long requisitionId)
    {
        return requisitionApplyMapper.selectRequisitionApplyByRequisitionId(requisitionId);
    }

    /**
     * 查询科室领用申请单列表
     * * @param requisitionApply 科室领用申请单
     * @return 科室领用申请单
     */
    @Override
    public List<RequisitionApply> selectRequisitionApplyList(RequisitionApply requisitionApply)
    {
        return requisitionApplyMapper.selectRequisitionApplyList(requisitionApply);
    }

    /**
     * 新增科室领用申请单
     * * @param requisitionApply 科室领用申请单
     * @return 结果
     */
    @Override
    public int insertRequisitionApply(RequisitionApply requisitionApply)
    {
        // 1. 设置默认的领用状态为 '0' (待审核)
        requisitionApply.setRequisitionStatus("0");

        // 2. 生成一个唯一的领用单号（例如：LY + 年月日时分秒）
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String timestamp = sdf.format(new Date());
        requisitionApply.setRequisitionCode("LY" + timestamp);

        // 3. 设置申请人为当前登录用户
        requisitionApply.setCreateBy(SecurityUtils.getUsername());

        // 4. 设置创建时间
        requisitionApply.setCreateTime(DateUtils.getNowDate());

        // 5. 调用 mapper 将完整的数据插入数据库
        return requisitionApplyMapper.insertRequisitionApply(requisitionApply);
    }

    /**
     * 修改科室领用申请单
     * * @param requisitionApply 科室领用申请单
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
     * * @param requisitionIds 需要删除的科室领用申请单主键
     * @return 结果
     */
    @Override
    public int deleteRequisitionApplyByRequisitionIds(Long[] requisitionIds)
    {
        return requisitionApplyMapper.deleteRequisitionApplyByRequisitionIds(requisitionIds);
    }

    /**
     * 删除科室领用申请单信息
     * * @param requisitionId 科室领用申请单主键
     * @return 结果
     */
    @Override
    public int deleteRequisitionApplyByRequisitionId(Long requisitionId)
    {
        return requisitionApplyMapper.deleteRequisitionApplyByRequisitionId(requisitionId);
    }

    /**
     * 【新增】批准领用申请并处理出库
     *
     * @param requisitionId 领用申请ID
     * @return 结果
     */
    @Override
    @Transactional // 【关键】声明此方法为一个事务
    public int approveAndProcessOutbound(Long requisitionId) {
        // 1. 查询领用申请单详情
        RequisitionApply requisition = requisitionApplyMapper.selectRequisitionApplyByRequisitionId(requisitionId);

        // 2. 状态校验：确保申请单存在且处于“待审核”状态
        if (requisition == null || !"0".equals(requisition.getRequisitionStatus())) {
            throw new RuntimeException("申请单状态不正确，无法处理出库！");
        }

        Long deviceId = requisition.getDeviceId();
        BigDecimal requiredQuantity = requisition.getRequisitionQuantity();

        // 3. 检查总库存是否充足
        DeviceInfo deviceInfo = deviceInfoService.selectDeviceInfoByDeviceId(deviceId);
        if (deviceInfo == null || deviceInfo.getTotalStock().compareTo(requiredQuantity) < 0) {
            throw new RuntimeException("器材总库存不足，无法出库！");
        }

        // 4. 【核心逻辑：FIFO】查询该器材所有“在库”的批次，并按入库时间升序排序
        InventoryBatch queryParam = new InventoryBatch();
        queryParam.setDeviceId(deviceId);
        queryParam.setStatus("0"); // 只查询在库的批次
        List<InventoryBatch> batchList = inventoryBatchMapper.selectInventoryBatchList(queryParam);

        BigDecimal remainingToDeduct = requiredQuantity; // 尚未扣减的数量

        // 5. 遍历批次列表，进行库存扣减
        for (InventoryBatch batch : batchList) {
            if (remainingToDeduct.compareTo(BigDecimal.ZERO) <= 0) {
                break; // 如果已经扣减完毕，跳出循环
            }

            BigDecimal deductQuantity; // 本次要从当前批次扣减的数量
            if (batch.getCurrentQuantity().compareTo(remainingToDeduct) >= 0) {
                // 当前批次库存充足
                deductQuantity = remainingToDeduct;
                batch.setCurrentQuantity(batch.getCurrentQuantity().subtract(deductQuantity));
            } else {
                // 当前批次库存不足，全部扣减
                deductQuantity = batch.getCurrentQuantity();
                batch.setCurrentQuantity(BigDecimal.ZERO);
            }

            // 如果批次被用完，更新其状态为“出库完毕”
            if (batch.getCurrentQuantity().compareTo(BigDecimal.ZERO) == 0) {
                batch.setStatus("1");
            }

            // 更新数据库中的批次信息
            inventoryBatchMapper.updateInventoryBatch(batch);

            remainingToDeduct = remainingToDeduct.subtract(deductQuantity);
        }

        // 6. 再次校验，如果循环结束后仍有未扣减的数量，说明库存数据有问题，回滚事务
        if (remainingToDeduct.compareTo(BigDecimal.ZERO) > 0) {
            throw new RuntimeException("批次库存扣减异常，实际库存与总库存不符！");
        }

        // 7. 更新器材档案的总库存（扣减）
        deviceInfoService.updateTotalStock(deviceId, requiredQuantity.negate()); // negate() 将正数变为负数

        // 8. 更新领用申请单的状态
        requisition.setRequisitionStatus("1"); // 1-已出库
        requisition.setHandlerBy(SecurityUtils.getUsername()); // 设置处理人为当前库管员
        requisition.setHandleTime(new Date());

        return requisitionApplyMapper.updateRequisitionApply(requisition);
    }

    @Override
    public int rejectRequisitionApply(Long requisitionId, String remark) {
        // 1. 查询领用申请单
        RequisitionApply requisition = requisitionApplyMapper.selectRequisitionApplyByRequisitionId(requisitionId);

        // 2. 状态校验，确保只有“待审核”的单据才能被驳回
        if (requisition == null || !"0".equals(requisition.getRequisitionStatus())) {
            throw new RuntimeException("操作失败，该申请单状态已改变！");
        }

        // 3. 更新状态、处理人和处理时间
        requisition.setRequisitionStatus("2"); // 2-已驳回
        requisition.setHandlerBy(SecurityUtils.getUsername());
        requisition.setHandleTime(new Date());
        requisition.setRemark(remark); // 记录驳回原因

        // 4. 更新数据库
        return requisitionApplyMapper.updateRequisitionApply(requisition);
    }

    /**
     * 获取待审核申请数量
     * 
     * @return 待审核申请数量
     */
    @Override
    public Long getPendingCount()
    {
        return requisitionApplyMapper.getPendingCount();
    }

    /**
     * 获取本月出库数量
     * 
     * @return 本月出库数量
     */
    @Override
    public Long getMonthlyOutboundCount()
    {
        return requisitionApplyMapper.getMonthlyOutboundCount();
    }
}