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
import com.ruoyi.device.domain.RequisitionApply;
import com.ruoyi.device.service.IRequisitionApplyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 科室领用申请单Controller
 * 
 * @author liubowen
 * @date 2025-10-19
 */
@RestController
@RequestMapping("/device/requisition")
public class RequisitionApplyController extends BaseController
{
    @Autowired
    private IRequisitionApplyService requisitionApplyService;

    /**
     * 查询科室领用申请单列表
     */
    @PreAuthorize("@ss.hasPermi('device:requisition:list')")
    @GetMapping("/list")
    public TableDataInfo list(RequisitionApply requisitionApply)
    {
        startPage();
        List<RequisitionApply> list = requisitionApplyService.selectRequisitionApplyList(requisitionApply);
        return getDataTable(list);
    }

    /**
     * 导出科室领用申请单列表
     */
    @PreAuthorize("@ss.hasPermi('device:requisition:export')")
    @Log(title = "科室领用申请单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RequisitionApply requisitionApply)
    {
        List<RequisitionApply> list = requisitionApplyService.selectRequisitionApplyList(requisitionApply);
        ExcelUtil<RequisitionApply> util = new ExcelUtil<RequisitionApply>(RequisitionApply.class);
        util.exportExcel(response, list, "科室领用申请单数据");
    }

    /**
     * 获取科室领用申请单详细信息
     */
    @PreAuthorize("@ss.hasPermi('device:requisition:query')")
    @GetMapping(value = "/{requisitionId}")
    public AjaxResult getInfo(@PathVariable("requisitionId") Long requisitionId)
    {
        return success(requisitionApplyService.selectRequisitionApplyByRequisitionId(requisitionId));
    }

    /**
     * 新增科室领用申请单
     */
    @PreAuthorize("@ss.hasPermi('device:requisition:add')")
    @Log(title = "科室领用申请单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RequisitionApply requisitionApply)
    {
        return toAjax(requisitionApplyService.insertRequisitionApply(requisitionApply));
    }

    /**
     * 修改科室领用申请单
     */
    @PreAuthorize("@ss.hasPermi('device:requisition:edit')")
    @Log(title = "科室领用申请单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RequisitionApply requisitionApply)
    {
        return toAjax(requisitionApplyService.updateRequisitionApply(requisitionApply));
    }

    /**
     * 删除科室领用申请单
     */
    @PreAuthorize("@ss.hasPermi('device:requisition:remove')")
    @Log(title = "科室领用申请单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{requisitionIds}")
    public AjaxResult remove(@PathVariable Long[] requisitionIds)
    {
        return toAjax(requisitionApplyService.deleteRequisitionApplyByRequisitionIds(requisitionIds));
    }

    /**
     * 批准并出库领用申请
     */
    @PreAuthorize("@ss.hasPermi('device:requisition:approve')") // 【关键】加上与“驳回”相同的权限码
    @PutMapping("/approve/{requisitionId}")
    public AjaxResult approve(@PathVariable Long requisitionId)
    {
        return toAjax(requisitionApplyService.approveAndProcessOutbound(requisitionId));
    }
    /**
     * 驳回领用申请
     */
    @PreAuthorize("@ss.hasPermi('device:requisition:approve')") // 【关键】使用与批准相同的权限码
    @PutMapping("/reject")
    public AjaxResult reject(@RequestBody RequisitionApply requisitionApply)
    {
        return toAjax(requisitionApplyService.rejectRequisitionApply(requisitionApply.getRequisitionId(), requisitionApply.getRemark()));
    }
}
