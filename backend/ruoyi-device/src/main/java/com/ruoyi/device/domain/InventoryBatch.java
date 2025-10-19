package com.ruoyi.device.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 库存批次对象 tb_inventory_batch
 * 
 * @author liubowen
 * @date 2025-10-19
 */
public class InventoryBatch extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 批次ID */
    private Long batchId;

    /** 关联器械ID */
    @Excel(name = "关联器械ID")
    private Long deviceId;

    /** 批次号/序列号 */
    @Excel(name = "批次号/序列号")
    private String batchNum;

    /** 供应商名称 */
    @Excel(name = "供应商名称")
    private String supplier;

    /** 入库日期（用于FIFO） */
    @Excel(name = "入库日期", readConverterExp = "用=于FIFO")
    private Date inboundTime;

    /** 过期日期/有效期（用于预警） */
    @Excel(name = "过期日期/有效期", readConverterExp = "用=于预警")
    private Date expiryDate;

    /** 初始入库数量 */
    @Excel(name = "初始入库数量")
    private BigDecimal inboundQuantity;

    /** 当前库存数量 */
    @Excel(name = "当前库存数量")
    private BigDecimal currentQuantity;

    /** 批次状态（0在库 1出库完毕 2已过期） */
    @Excel(name = "批次状态", readConverterExp = "0=在库,1=出库完毕,2=已过期")
    private String status;

    public void setBatchId(Long batchId) 
    {
        this.batchId = batchId;
    }

    public Long getBatchId() 
    {
        return batchId;
    }

    public void setDeviceId(Long deviceId) 
    {
        this.deviceId = deviceId;
    }

    public Long getDeviceId() 
    {
        return deviceId;
    }

    public void setBatchNum(String batchNum) 
    {
        this.batchNum = batchNum;
    }

    public String getBatchNum() 
    {
        return batchNum;
    }

    public void setSupplier(String supplier) 
    {
        this.supplier = supplier;
    }

    public String getSupplier() 
    {
        return supplier;
    }

    public void setInboundTime(Date inboundTime) 
    {
        this.inboundTime = inboundTime;
    }

    public Date getInboundTime() 
    {
        return inboundTime;
    }

    public void setExpiryDate(Date expiryDate) 
    {
        this.expiryDate = expiryDate;
    }

    public Date getExpiryDate() 
    {
        return expiryDate;
    }

    public void setInboundQuantity(BigDecimal inboundQuantity) 
    {
        this.inboundQuantity = inboundQuantity;
    }

    public BigDecimal getInboundQuantity() 
    {
        return inboundQuantity;
    }

    public void setCurrentQuantity(BigDecimal currentQuantity) 
    {
        this.currentQuantity = currentQuantity;
    }

    public BigDecimal getCurrentQuantity() 
    {
        return currentQuantity;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("batchId", getBatchId())
            .append("deviceId", getDeviceId())
            .append("batchNum", getBatchNum())
            .append("supplier", getSupplier())
            .append("inboundTime", getInboundTime())
            .append("expiryDate", getExpiryDate())
            .append("inboundQuantity", getInboundQuantity())
            .append("currentQuantity", getCurrentQuantity())
            .append("status", getStatus())
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
