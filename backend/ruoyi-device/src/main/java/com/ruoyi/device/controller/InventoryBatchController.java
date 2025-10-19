package com.ruoyi.device.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.device.domain.InventoryBatch;
import com.ruoyi.device.service.IInventoryBatchService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 库存批次Controller
 * 
 * @author liubowen
 * @date 2025-10-19
 */
@RestController
@RequestMapping("/device/batch")
public class InventoryBatchController extends BaseController
{
    @Autowired
    private IInventoryBatchService inventoryBatchService;

    /**
     * 查询库存批次列表
     */
    @PreAuthorize("@ss.hasPermi('device:batch:list')")
    @GetMapping("/list")
    public TableDataInfo list(InventoryBatch inventoryBatch)
    {
        startPage();
        List<InventoryBatch> list = inventoryBatchService.selectInventoryBatchList(inventoryBatch);
        return getDataTable(list);
    }

    /**
     * 导出库存批次列表
     */
    @PreAuthorize("@ss.hasPermi('device:batch:export')")
    @Log(title = "库存批次", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, InventoryBatch inventoryBatch)
    {
        List<InventoryBatch> list = inventoryBatchService.selectInventoryBatchList(inventoryBatch);
        ExcelUtil<InventoryBatch> util = new ExcelUtil<InventoryBatch>(InventoryBatch.class);
        util.exportExcel(response, list, "库存批次数据");
    }

    /**
     * 获取库存批次详细信息
     */
    @PreAuthorize("@ss.hasPermi('device:batch:query')")
    @GetMapping(value = "/{batchId}")
    public AjaxResult getInfo(@PathVariable("batchId") Long batchId)
    {
        return success(inventoryBatchService.selectInventoryBatchByBatchId(batchId));
    }

    /**
     * 新增库存批次
     */
    @PreAuthorize("@ss.hasPermi('device:batch:add')")
    @Log(title = "库存批次", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody InventoryBatch inventoryBatch)
    {
        return toAjax(inventoryBatchService.insertInventoryBatch(inventoryBatch));
    }

    /**
     * 修改库存批次
     */
    @PreAuthorize("@ss.hasPermi('device:batch:edit')")
    @Log(title = "库存批次", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody InventoryBatch inventoryBatch)
    {
        return toAjax(inventoryBatchService.updateInventoryBatch(inventoryBatch));
    }

    /**
     * 删除库存批次
     */
    @PreAuthorize("@ss.hasPermi('device:batch:remove')")
    @Log(title = "库存批次", businessType = BusinessType.DELETE)
	@DeleteMapping("/{batchIds}")
    public AjaxResult remove(@PathVariable Long[] batchIds)
    {
        return toAjax(inventoryBatchService.deleteInventoryBatchByBatchIds(batchIds));
    }
}
