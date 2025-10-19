package com.ruoyi.device.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.device.mapper.RequisitionApplyMapper;
import com.ruoyi.device.domain.RequisitionApply;
import com.ruoyi.device.service.IRequisitionApplyService;

/**
 * 科室领用申请单Service业务层处理
 * 
 * @author liubowen
 * @date 2025-10-19
 */
@Service
public class RequisitionApplyServiceImpl implements IRequisitionApplyService 
{
    @Autowired
    private RequisitionApplyMapper requisitionApplyMapper;

    /**
     * 查询科室领用申请单
     * 
     * @param requisitionId 科室领用申请单主键
     * @return 科室领用申请单
     */
    @Override
    public RequisitionApply selectRequisitionApplyByRequisitionId(Long requisitionId)
    {
        return requisitionApplyMapper.selectRequisitionApplyByRequisitionId(requisitionId);
    }

    /**
     * 查询科室领用申请单列表
     * 
     * @param requisitionApply 科室领用申请单
     * @return 科室领用申请单
     */
    @Override
    public List<RequisitionApply> selectRequisitionApplyList(RequisitionApply requisitionApply)
    {
        return requisitionApplyMapper.selectRequisitionApplyList(requisitionApply);
    }

    /**
     * 新增科室领用申请单
     * 
     * @param requisitionApply 科室领用申请单
     * @return 结果
     */
    @Override
    public int insertRequisitionApply(RequisitionApply requisitionApply)
    {
        // 1. 【手动添加】设置默认的领用状态为 '0' (待审核)
        requisitionApply.setRequisitionStatus("0");

        // 2. 【手动添加】生成一个唯一的领用单号（例如：LY + 年月日时分秒）
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String timestamp = sdf.format(new Date());
        requisitionApply.setRequisitionCode("LY" + timestamp);

        // 3. 【手动添加】设置申请人为当前登录用户
        requisitionApply.setCreateBy(SecurityUtils.getUsername());

        // 4. (这是代码生成器已有的) 设置创建时间
        requisitionApply.setCreateTime(DateUtils.getNowDate());

        // 5. 调用 mapper 将完整的数据插入数据库
        return requisitionApplyMapper.insertRequisitionApply(requisitionApply);
    }

    /**
     * 修改科室领用申请单
     * 
     * @param requisitionApply 科室领用申请单
     * @return 结果
     */
    @Override
    public int updateRequisitionApply(RequisitionApply requisitionApply)
    {
        requisitionApply.setUpdateTime(DateUtils.getNowDate());
        return requisitionApplyMapper.updateRequisitionApply(requisitionApply);
    }

    /**
     * 批量删除科室领用申请单
     * 
     * @param requisitionIds 需要删除的科室领用申请单主键
     * @return 结果
     */
    @Override
    public int deleteRequisitionApplyByRequisitionIds(Long[] requisitionIds)
    {
        return requisitionApplyMapper.deleteRequisitionApplyByRequisitionIds(requisitionIds);
    }

    /**
     * 删除科室领用申请单信息
     * 
     * @param requisitionId 科室领用申请单主键
     * @return 结果
     */
    @Override
    public int deleteRequisitionApplyByRequisitionId(Long requisitionId)
    {
        return requisitionApplyMapper.deleteRequisitionApplyByRequisitionId(requisitionId);
    }
}
