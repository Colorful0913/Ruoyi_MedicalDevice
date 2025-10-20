package com.ruoyi.device.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

/**
 * 数据初始化控制器
 * 
 * @author liubowen
 * @date 2025-10-20
 */
@RestController
@RequestMapping("/device/init")
public class DataInitController extends BaseController {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    /**
     * 初始化仪表板菜单
     */
    @PostMapping("/dashboardMenu")
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
    
    /**
     * 初始化医院部门数据
     */
    @PostMapping("/hospitalDept")
    public AjaxResult initHospitalDept() {
        try {
            // 删除现有的演示部门数据（保留系统必需的数据）
            jdbcTemplate.update("DELETE FROM sys_dept WHERE dept_id > 100 AND dept_id < 200");
            
            // 插入医院部门数据
            String[] deptInserts = {
                "INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (101, 0, '0', '医院管理', 1, '院长', '010-12345678', 'hospital@example.com', '0', '0', 'admin', NOW(), '', null)",
                "INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (102, 101, '0,101', '内科', 1, '内科主任', '010-12345679', 'internal@example.com', '0', '0', 'admin', NOW(), '', null)",
                "INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (103, 101, '0,101', '外科', 2, '外科主任', '010-12345680', 'surgery@example.com', '0', '0', 'admin', NOW(), '', null)",
                "INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (104, 101, '0,101', '妇产科', 3, '妇产科主任', '010-12345681', 'obstetrics@example.com', '0', '0', 'admin', NOW(), '', null)",
                "INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (105, 101, '0,101', '儿科', 4, '儿科主任', '010-12345682', 'pediatrics@example.com', '0', '0', 'admin', NOW(), '', null)",
                "INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (106, 101, '0,101', '急诊科', 5, '急诊科主任', '010-12345683', 'emergency@example.com', '0', '0', 'admin', NOW(), '', null)",
                "INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (107, 101, '0,101', 'ICU', 6, 'ICU主任', '010-12345684', 'icu@example.com', '0', '0', 'admin', NOW(), '', null)",
                "INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (108, 101, '0,101', '手术室', 7, '手术室主任', '010-12345685', 'operation@example.com', '0', '0', 'admin', NOW(), '', null)",
                "INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (109, 101, '0,101', '药房', 8, '药房主任', '010-12345686', 'pharmacy@example.com', '0', '0', 'admin', NOW(), '', null)",
                "INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (110, 101, '0,101', '检验科', 9, '检验科主任', '010-12345687', 'laboratory@example.com', '0', '0', 'admin', NOW(), '', null)",
                "INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (111, 101, '0,101', '影像科', 10, '影像科主任', '010-12345688', 'imaging@example.com', '0', '0', 'admin', NOW(), '', null)",
                "INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (112, 101, '0,101', '护理部', 11, '护理部主任', '010-12345689', 'nursing@example.com', '0', '0', 'admin', NOW(), '', null)"
            };
            
            for (String sql : deptInserts) {
                jdbcTemplate.update(sql);
            }
            
            // 为管理员角色分配新部门权限
            String[] roleDeptInserts = {
                "INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 101)",
                "INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 102)",
                "INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 103)",
                "INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 104)",
                "INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 105)",
                "INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 106)",
                "INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 107)",
                "INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 108)",
                "INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 109)",
                "INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 110)",
                "INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 111)",
                "INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 112)"
            };
            
            for (String sql : roleDeptInserts) {
                try {
                    jdbcTemplate.update(sql);
                } catch (Exception e) {
                    // 忽略重复插入错误
                    logger.warn("角色部门权限可能已存在: " + e.getMessage());
                }
            }
            
            return success("医院部门数据初始化成功");
        } catch (Exception e) {
            logger.error("初始化医院部门数据失败", e);
            return error("初始化失败: " + e.getMessage());
        }
    }
}
