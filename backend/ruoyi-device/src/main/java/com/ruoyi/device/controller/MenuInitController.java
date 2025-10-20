package com.ruoyi.device.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;

/**
 * 菜单初始化控制器
 * 
 * @author liubowen
 * @date 2025-10-20
 */
@RestController
@RequestMapping("/device/menu")
public class MenuInitController extends BaseController {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    /**
     * 初始化仪表板菜单
     */
    @GetMapping("/initDashboard")
    public AjaxResult initDashboardMenu() {
        try {
            // 检查菜单是否已存在
            Integer count = jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM sys_menu WHERE menu_id = 2005", Integer.class);
            
            if (count == 0) {
                // 插入仪表板菜单
                jdbcTemplate.update(
                    "INSERT INTO sys_menu VALUES('2005', '设备仪表板', '2000', '0', 'dashboard', 'device/dashboard/index', '', '', 1, 0, 'C', '0', '0', 'device:dashboard:view', 'dashboard', 'admin', NOW(), '', null, '设备管理仪表板')");
                
                // 为管理员角色分配仪表板权限
                jdbcTemplate.update("INSERT INTO sys_role_menu VALUES('1', '2005')");
                
                return success("仪表板菜单初始化成功");
            } else {
                return success("仪表板菜单已存在");
            }
        } catch (Exception e) {
            logger.error("初始化仪表板菜单失败", e);
            return error("初始化失败: " + e.getMessage());
        }
    }
}


