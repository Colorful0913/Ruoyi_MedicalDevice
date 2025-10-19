package com.ruoyi.device.service.impl;

import java.math.BigDecimal;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.device.mapper.DeviceInfoMapper;
import com.ruoyi.device.domain.DeviceInfo;
import com.ruoyi.device.service.IDeviceInfoService;

/**
 * 器械档案Service业务层处理
 * 
 * @author liubowen
 * @date 2025-10-16
 */
@Service
public class DeviceInfoServiceImpl implements IDeviceInfoService 
{
    @Autowired
    private DeviceInfoMapper deviceInfoMapper;

    /**
     * 查询器械档案
     * 
     * @param deviceId 器械档案主键
     * @return 器械档案
     */
    @Override
    public DeviceInfo selectDeviceInfoByDeviceId(Long deviceId)
    {
        return deviceInfoMapper.selectDeviceInfoByDeviceId(deviceId);
    }

    /**
     * 查询器械档案列表
     * 
     * @param deviceInfo 器械档案
     * @return 器械档案
     */
    @Override
    public List<DeviceInfo> selectDeviceInfoList(DeviceInfo deviceInfo)
    {
        return deviceInfoMapper.selectDeviceInfoList(deviceInfo);
    }

    /**
     * 新增器械档案
     * 
     * @param deviceInfo 器械档案
     * @return 结果
     */
    @Override
    public int insertDeviceInfo(DeviceInfo deviceInfo)
    {
        deviceInfo.setCreateTime(DateUtils.getNowDate());
        return deviceInfoMapper.insertDeviceInfo(deviceInfo);
    }

    /**
     * 修改器械档案
     * 
     * @param deviceInfo 器械档案
     * @return 结果
     */
    @Override
    public int updateDeviceInfo(DeviceInfo deviceInfo)
    {
        deviceInfo.setUpdateTime(DateUtils.getNowDate());
        return deviceInfoMapper.updateDeviceInfo(deviceInfo);
    }

    /**
     * 批量删除器械档案
     * 
     * @param deviceIds 需要删除的器械档案主键
     * @return 结果
     */
    @Override
    public int deleteDeviceInfoByDeviceIds(Long[] deviceIds)
    {
        return deviceInfoMapper.deleteDeviceInfoByDeviceIds(deviceIds);
    }

    /**
     * 删除器械档案信息
     * 
     * @param deviceId 器械档案主键
     * @return 结果
     */
    @Override
    public int deleteDeviceInfoByDeviceId(Long deviceId)
    {
        return deviceInfoMapper.deleteDeviceInfoByDeviceId(deviceId);
    }

//    @Override
//    public int updateTotalStock(Long deviceId, BigDecimal quantityDelta) {
//        return 0;
//    }

    @Override
    public int updateTotalStock(Long deviceId, java.math.BigDecimal quantityDelta)
    {
        // 1. 根据 deviceId 从数据库中查询出当前的器材信息
        DeviceInfo deviceInfo = deviceInfoMapper.selectDeviceInfoByDeviceId(deviceId);

        // 2. 判断器材是否存在
        if (deviceInfo != null)
        {
            // 3. 计算新的总库存（当前总库存 + 本次入库数量）
            java.math.BigDecimal newTotalStock = deviceInfo.getTotalStock().add(quantityDelta);

            // 4. 将新的总库存设置回 deviceInfo 对象
            deviceInfo.setTotalStock(newTotalStock);

            // 5. 调用 mapper 更新数据库中的这条记录
            return deviceInfoMapper.updateDeviceInfo(deviceInfo);
        }

        // 如果找不到器材，返回0，表示没有更新任何记录
        return 0;
    }
}
