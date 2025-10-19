package com.ruoyi.device.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 科室领用申请单对象 tb_requisition_apply
 * 
 * @author liubowen
 * @date 2025-10-19
 */
public class RequisitionApply extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 领用申请ID */
    private Long requisitionId;

    /** 领用单号 */
    @Excel(name = "领用单号")
    private String requisitionCode;

    /** 申请科室ID */
    @Excel(name = "申请科室ID")
    private Long deptId;

    /** 申请器材ID */
    @Excel(name = "申请器材ID")
    private Long deviceId;

    /** 申请领用数量 */
    @Excel(name = "申请领用数量")
    private BigDecimal requisitionQuantity;

    /** 领用状态（字典：0-待审核 1-已出库 2-已驳回） */
    @Excel(name = "领用状态", readConverterExp = "字=典：0-待审核,1=-已出库,2=-已驳回")
    private String requisitionStatus;

    /** 处理人（库管员） */
    @Excel(name = "处理人", readConverterExp = "库=管员")
    private String handlerBy;

    /** 处理时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "处理时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date handleTime;

    public void setRequisitionId(Long requisitionId) 
    {
        this.requisitionId = requisitionId;
    }

    public Long getRequisitionId() 
    {
        return requisitionId;
    }

    public void setRequisitionCode(String requisitionCode) 
    {
        this.requisitionCode = requisitionCode;
    }

    public String getRequisitionCode() 
    {
        return requisitionCode;
    }

    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }

    public void setDeviceId(Long deviceId) 
    {
        this.deviceId = deviceId;
    }

    public Long getDeviceId() 
    {
        return deviceId;
    }

    public void setRequisitionQuantity(BigDecimal requisitionQuantity) 
    {
        this.requisitionQuantity = requisitionQuantity;
    }

    public BigDecimal getRequisitionQuantity() 
    {
        return requisitionQuantity;
    }

    public void setRequisitionStatus(String requisitionStatus) 
    {
        this.requisitionStatus = requisitionStatus;
    }

    public String getRequisitionStatus() 
    {
        return requisitionStatus;
    }

    public void setHandlerBy(String handlerBy) 
    {
        this.handlerBy = handlerBy;
    }

    public String getHandlerBy() 
    {
        return handlerBy;
    }

    public void setHandleTime(Date handleTime) 
    {
        this.handleTime = handleTime;
    }

    public Date getHandleTime() 
    {
        return handleTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("requisitionId", getRequisitionId())
            .append("requisitionCode", getRequisitionCode())
            .append("deptId", getDeptId())
            .append("deviceId", getDeviceId())
            .append("requisitionQuantity", getRequisitionQuantity())
            .append("requisitionStatus", getRequisitionStatus())
            .append("handlerBy", getHandlerBy())
            .append("handleTime", getHandleTime())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }

    private String deviceName;

    public void setDeviceName(String deviceName)
    {
        this.deviceName = deviceName;
    }

    public String getDeviceName()
    {
        return deviceName;
    }
}
