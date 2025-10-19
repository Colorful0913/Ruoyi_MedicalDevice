package com.ruoyi.device.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.device.service.IDeviceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.device.mapper.InventoryBatchMapper;
import com.ruoyi.device.domain.InventoryBatch;
import com.ruoyi.device.service.IInventoryBatchService;
import org.springframework.transaction.annotation.Transactional;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 库存批次Service业务层处理
 * * @author liubowen
 * @date 2025-10-19
 */
@Service
public class InventoryBatchServiceImpl implements IInventoryBatchService
{
    @Autowired
    private InventoryBatchMapper inventoryBatchMapper;

    @Autowired
    private IDeviceInfoService deviceInfoService;

    /**
     * 查询库存批次
     * * @param batchId 库存批次主键
     * @return 库存批次
     */
    @Override
    public InventoryBatch selectInventoryBatchByBatchId(Long batchId)
    {
        return inventoryBatchMapper.selectInventoryBatchByBatchId(batchId);
    }

    /**
     * 查询库存批次列表
     * * @param inventoryBatch 库存批次
     * @return 库存批次
     */
    @Override
    public List<InventoryBatch> selectInventoryBatchList(InventoryBatch inventoryBatch)
    {
        return inventoryBatchMapper.selectInventoryBatchList(inventoryBatch);
    }

    /**
     * 新增库存批次（已修改：自动生成批次号并同步总库存）
     * * @param inventoryBatch 库存批次
     * @return 结果
     */
    @Override
    @Transactional // 添加事务注解，确保所有数据库操作要么都成功，要么都失败
    public int insertInventoryBatch(InventoryBatch inventoryBatch)
    {
        // 步骤 1: 设置创建时间，并先插入一次数据以获取自增的 batch_id
        // 注意：此时 inventoryBatch 对象中的 batchNum 是 null
        inventoryBatch.setCreateTime(DateUtils.getNowDate());
        // RuoYi的Mapper在插入后，会自动将数据库生成的自增ID回填到inventoryBatch对象中
        int rows = inventoryBatchMapper.insertInventoryBatch(inventoryBatch);

        if (rows > 0) {
            // 步骤 2: 构造批次号 (Batch Number)
            // 获取入库日期并格式化为 yyyyMMdd
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            String dateStr = sdf.format(inventoryBatch.getInboundTime());

            // 获取回填的 batch_id 并格式化为三位数的字符串（例如：1 -> "001"）
            // 您可以根据需要调整格式化的位数，例如 %04d 会生成 "0001"
            String batchIdStr = String.format("%03d", inventoryBatch.getBatchId());

            // 拼接成最终的批次号
            String batchNum = "B" + dateStr + batchIdStr;

            // 将生成的批次号设置回对象
            inventoryBatch.setBatchNum(batchNum);

            // 步骤 3: 使用 batch_id 作为条件，更新刚刚插入的记录，填上批次号
            inventoryBatchMapper.updateInventoryBatch(inventoryBatch);

            // 步骤 4: 更新主档案的总库存
            // 注意：我们使用 inboundQuantity 而不是 currentQuantity，因为它是本次的入库量
            deviceInfoService.updateTotalStock(inventoryBatch.getDeviceId(), inventoryBatch.getInboundQuantity());
        }

        return rows;
    }

    /**
     * 修改库存批次
     * * @param inventoryBatch 库存批次
     * @return 结果
     */
    @Override
    public int updateInventoryBatch(InventoryBatch inventoryBatch)
    {
        inventoryBatch.setUpdateTime(DateUtils.getNowDate());
        return inventoryBatchMapper.updateInventoryBatch(inventoryBatch);
    }

    /**
     * 批量删除库存批次
     * * @param batchIds 需要删除的库存批次主键
     * @return 结果
     */
    @Override
    public int deleteInventoryBatchByBatchIds(Long[] batchIds)
    {
        // 注意：实际项目中，删除批次时也应该同步扣减总库存，这里为了简化暂时不实现
        return inventoryBatchMapper.deleteInventoryBatchByBatchIds(batchIds);
    }

    /**
     * 删除库存批次信息
     * * @param batchId 库存批次主键
     * @return 结果
     */
    @Override
    public int deleteInventoryBatchByBatchId(Long batchId)
    {
        // 注意：实际项目中，删除批次时也应该同步扣减总库存，这里为了简化暂时不实现
        return inventoryBatchMapper.deleteInventoryBatchByBatchId(batchId);
    }
}