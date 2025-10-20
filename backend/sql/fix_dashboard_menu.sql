-- 修复仪表板菜单权限问题
-- 首先删除可能存在的重复菜单
DELETE FROM sys_menu WHERE menu_id = 2005;

-- 确保仪表板菜单存在（使用你修改后的菜单ID 2003）
-- 检查菜单是否存在，如果不存在则插入
INSERT IGNORE INTO sys_menu VALUES('2003', '报表分析', '0', '8', 'dashboard', 'device/dashboard/index', '', '', 1, 0, 'M', '0', '0', 'device:dashboard:view', 'monitor', 'admin', NOW(), '', null, '设备管理仪表板');

-- 为超级管理员角色(role_id=1)分配仪表板菜单权限
INSERT IGNORE INTO sys_role_menu VALUES('1', '2003');

-- 为普通角色(role_id=2)也分配权限（如果需要的话）
INSERT IGNORE INTO sys_role_menu VALUES('2', '2003');


