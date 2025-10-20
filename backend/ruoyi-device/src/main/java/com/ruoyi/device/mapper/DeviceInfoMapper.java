package com.ruoyi.device.mapper;

import java.util.List;
import com.ruoyi.device.domain.DeviceInfo;

/**
 * 器械档案Mapper接口
 * 
 * @author liubowen
 * @date 2025-10-16
 */
public interface DeviceInfoMapper 
{
    /**
     * 查询器械档案
     * 
     * @param deviceId 器械档案主键
     * @return 器械档案
     */
    public DeviceInfo selectDeviceInfoByDeviceId(Long deviceId);

    /**
     * 查询器械档案列表
     * 
     * @param deviceInfo 器械档案
     * @return 器械档案集合
     */
    public List<DeviceInfo> selectDeviceInfoList(DeviceInfo deviceInfo);

    /**
     * 新增器械档案
     * 
     * @param deviceInfo 器械档案
     * @return 结果
     */
    public int insertDeviceInfo(DeviceInfo deviceInfo);

    /**
     * 修改器械档案
     * 
     * @param deviceInfo 器械档案
     * @return 结果
     */
    public int updateDeviceInfo(DeviceInfo deviceInfo);

    /**
     * 删除器械档案
     * 
     * @param deviceId 器械档案主键
     * @return 结果
     */
    public int deleteDeviceInfoByDeviceId(Long deviceId);

    /**
     * 批量删除器械档案
     * 
     * @param deviceIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDeviceInfoByDeviceIds(Long[] deviceIds);

    /**
     * 查询库存预警器械列表
     * 
     * @return 库存预警器械列表
     */
    public List<DeviceInfo> selectLowStockDevices();
}
