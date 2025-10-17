package com.ruoyi.device.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 器械档案对象 tb_device_info
 * 
 * @author liubowen
 * @date 2025-10-16
 */
public class DeviceInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 器械档案ID */
    private Long deviceId;

    /** 器械名称 */
    @Excel(name = "器械名称")
    private String deviceName;

    /** 器械编号/型号 */
    @Excel(name = "器械编号/型号")
    private String deviceCode;

    /** 器械分类（字典：sys_device_category） */
    @Excel(name = "器械分类", readConverterExp = "字=典：sys_device_category")
    private String category;

    /** 规格型号 */
    @Excel(name = "规格型号")
    private String spec;

    /** 计量单位 */
    @Excel(name = "计量单位")
    private String unit;

    /** 医疗器械注册证号 */
    private String registerNum;

    /** 最低库存预警值 */
    @Excel(name = "最低库存预警值")
    private Integer minStock;

    /** 当前总库存量（由系统维护） */
    @Excel(name = "当前总库存量", readConverterExp = "由=系统维护")
    private BigDecimal totalStock;

    /** 器械状态（0正常 1停用） */
    @Excel(name = "器械状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setDeviceId(Long deviceId) 
    {
        this.deviceId = deviceId;
    }

    public Long getDeviceId() 
    {
        return deviceId;
    }

    public void setDeviceName(String deviceName) 
    {
        this.deviceName = deviceName;
    }

    public String getDeviceName() 
    {
        return deviceName;
    }

    public void setDeviceCode(String deviceCode) 
    {
        this.deviceCode = deviceCode;
    }

    public String getDeviceCode() 
    {
        return deviceCode;
    }

    public void setCategory(String category) 
    {
        this.category = category;
    }

    public String getCategory() 
    {
        return category;
    }

    public void setSpec(String spec) 
    {
        this.spec = spec;
    }

    public String getSpec() 
    {
        return spec;
    }

    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }

    public void setRegisterNum(String registerNum) 
    {
        this.registerNum = registerNum;
    }

    public String getRegisterNum() 
    {
        return registerNum;
    }

    public void setMinStock(Integer minStock) 
    {
        this.minStock = minStock;
    }

    public Integer getMinStock() 
    {
        return minStock;
    }

    public void setTotalStock(BigDecimal totalStock) 
    {
        this.totalStock = totalStock;
    }

    public BigDecimal getTotalStock() 
    {
        return totalStock;
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
            .append("deviceId", getDeviceId())
            .append("deviceName", getDeviceName())
            .append("deviceCode", getDeviceCode())
            .append("category", getCategory())
            .append("spec", getSpec())
            .append("unit", getUnit())
            .append("registerNum", getRegisterNum())
            .append("minStock", getMinStock())
            .append("totalStock", getTotalStock())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
