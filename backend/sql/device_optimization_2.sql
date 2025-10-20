-- 优化2: 添加仪表板菜单
INSERT INTO sys_menu VALUES('2005', '设备仪表板', '2000', '0', 'dashboard', 'device/dashboard/index', '', '', 1, 0, 'C', '0', '0', 'device:dashboard:view', 'dashboard', 'admin', sysdate(), '', null, '设备管理仪表板');

-- 为管理员角色分配仪表板权限
INSERT INTO sys_role_menu VALUES('1', '2005');

