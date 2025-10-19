package com.ruoyi.device.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 采购申请对象 tb_purchase_apply
 * 
 * @author liubowen
 * @date 2025-10-18
 */
public class PurchaseApply extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 申请单ID */
    private Long applyId;

    /** 申请单号 */
    @Excel(name = "申请单号")
    private String applyCode;

    /** 申请科室ID */
    @Excel(name = "申请科室ID")
    private Long deptId;

    /** 关联器械ID */
    @Excel(name = "关联器械ID")
    private Long deviceId;

    /** 申请采购数量 */
    @Excel(name = "申请采购数量")
    private BigDecimal requiredQuantity;

    /** 需求到货日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "需求到货日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date requiredDate;

    /** 审批状态（字典：0-待审批 1-已通过 2-已驳回） */
    @Excel(name = "审批状态", readConverterExp = "字=典：0-待审批,1=-已通过,2=-已驳回")
    private String applyStatus;

    /** 审批人 */
    @Excel(name = "审批人")
    private String approverBy;

    /** 审批时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "审批时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date approveTime;

    /** 入库状态（字典：0-待入库 1-部分入库 2-已完成入库） */
    @Excel(name = "入库状态", readConverterExp = "字=典：0-待入库,1=-部分入库,2=-已完成入库")
    private String procureStatus;

    public void setApplyId(Long applyId) 
    {
        this.applyId = applyId;
    }

    public Long getApplyId() 
    {
        return applyId;
    }

    public void setApplyCode(String applyCode) 
    {
        this.applyCode = applyCode;
    }

    public String getApplyCode() 
    {
        return applyCode;
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

    public void setRequiredQuantity(BigDecimal requiredQuantity) 
    {
        this.requiredQuantity = requiredQuantity;
    }

    public BigDecimal getRequiredQuantity() 
    {
        return requiredQuantity;
    }

    public void setRequiredDate(Date requiredDate) 
    {
        this.requiredDate = requiredDate;
    }

    public Date getRequiredDate() 
    {
        return requiredDate;
    }

    public void setApplyStatus(String applyStatus) 
    {
        this.applyStatus = applyStatus;
    }

    public String getApplyStatus() 
    {
        return applyStatus;
    }

    public void setApproverBy(String approverBy) 
    {
        this.approverBy = approverBy;
    }

    public String getApproverBy() 
    {
        return approverBy;
    }

    public void setApproveTime(Date approveTime) 
    {
        this.approveTime = approveTime;
    }

    public Date getApproveTime() 
    {
        return approveTime;
    }

    public void setProcureStatus(String procureStatus) 
    {
        this.procureStatus = procureStatus;
    }

    public String getProcureStatus() 
    {
        return procureStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("applyId", getApplyId())
            .append("applyCode", getApplyCode())
            .append("deptId", getDeptId())
            .append("deviceId", getDeviceId())
            .append("requiredQuantity", getRequiredQuantity())
            .append("requiredDate", getRequiredDate())
            .append("applyStatus", getApplyStatus())
            .append("approverBy", getApproverBy())
            .append("approveTime", getApproveTime())
            .append("procureStatus", getProcureStatus())
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
