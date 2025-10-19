package com.ruoyi.device.service;

import java.util.List;
import com.ruoyi.device.domain.InventoryBatch;

/**
 * 库存批次Service接口
 * 
 * @author liubowen
 * @date 2025-10-19
 */
public interface IInventoryBatchService 
{
    /**
     * 查询库存批次
     * 
     * @param batchId 库存批次主键
     * @return 库存批次
     */
    public InventoryBatch selectInventoryBatchByBatchId(Long batchId);

    /**
     * 查询库存批次列表
     * 
     * @param inventoryBatch 库存批次
     * @return 库存批次集合
     */
    public List<InventoryBatch> selectInventoryBatchList(InventoryBatch inventoryBatch);

    /**
     * 新增库存批次
     * 
     * @param inventoryBatch 库存批次
     * @return 结果
     */
    public int insertInventoryBatch(InventoryBatch inventoryBatch);

    /**
     * 修改库存批次
     * 
     * @param inventoryBatch 库存批次
     * @return 结果
     */
    public int updateInventoryBatch(InventoryBatch inventoryBatch);

    /**
     * 批量删除库存批次
     * 
     * @param batchIds 需要删除的库存批次主键集合
     * @return 结果
     */
    public int deleteInventoryBatchByBatchIds(Long[] batchIds);

    /**
     * 删除库存批次信息
     * 
     * @param batchId 库存批次主键
     * @return 结果
     */
    public int deleteInventoryBatchByBatchId(Long batchId);
}
