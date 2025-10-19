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
import com.ruoyi.device.domain.PurchaseApply;
import com.ruoyi.device.service.IPurchaseApplyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 采购申请Controller
 * 
 * @author liubowen
 * @date 2025-10-18
 */
@RestController
@RequestMapping("/device/apply")
public class PurchaseApplyController extends BaseController
{
    @Autowired
    private IPurchaseApplyService purchaseApplyService;

    /**
     * 查询采购申请列表
     */
    @PreAuthorize("@ss.hasPermi('device:apply:list')")
    @GetMapping("/list")
    public TableDataInfo list(PurchaseApply purchaseApply)
    {
        startPage();
        List<PurchaseApply> list = purchaseApplyService.selectPurchaseApplyList(purchaseApply);
        return getDataTable(list);
    }

    /**
     * 导出采购申请列表
     */
    @PreAuthorize("@ss.hasPermi('device:apply:export')")
    @Log(title = "采购申请", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PurchaseApply purchaseApply)
    {
        List<PurchaseApply> list = purchaseApplyService.selectPurchaseApplyList(purchaseApply);
        ExcelUtil<PurchaseApply> util = new ExcelUtil<PurchaseApply>(PurchaseApply.class);
        util.exportExcel(response, list, "采购申请数据");
    }

    /**
     * 获取采购申请详细信息
     */
    @PreAuthorize("@ss.hasPermi('device:apply:query')")
    @GetMapping(value = "/{applyId}")
    public AjaxResult getInfo(@PathVariable("applyId") Long applyId)
    {
        return success(purchaseApplyService.selectPurchaseApplyByApplyId(applyId));
    }

    /**
     * 新增采购申请
     */
    @PreAuthorize("@ss.hasPermi('device:apply:add')")
    @Log(title = "采购申请", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PurchaseApply purchaseApply)
    {
        return toAjax(purchaseApplyService.insertPurchaseApply(purchaseApply));
    }

    /**
     * 修改采购申请
     */
    @PreAuthorize("@ss.hasPermi('device:apply:edit')")
    @Log(title = "采购申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PurchaseApply purchaseApply)
    {
        return toAjax(purchaseApplyService.updatePurchaseApply(purchaseApply));
    }

    /**
     * 删除采购申请
     */
    @PreAuthorize("@ss.hasPermi('device:apply:remove')")
    @Log(title = "采购申请", businessType = BusinessType.DELETE)
	@DeleteMapping("/{applyIds}")
    public AjaxResult remove(@PathVariable Long[] applyIds)
    {
        return toAjax(purchaseApplyService.deletePurchaseApplyByApplyIds(applyIds));
    }

    /**
     * 审批采购申请
     */
    @PreAuthorize("@ss.hasPermi('device:apply:approve')") // 【关键】权限控制
    @PutMapping("/approve")
    public AjaxResult approve(@RequestBody PurchaseApply purchaseApply)
    {
        return toAjax(purchaseApplyService.approvePurchaseApply(purchaseApply));
    }
}
