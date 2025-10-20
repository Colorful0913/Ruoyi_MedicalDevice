-- 设备管理系统完整优化方案
-- 执行顺序：先执行基础表结构，再执行菜单权限，最后执行测试数据

-- 1. 基础表结构（如果还没有执行）
-- 执行: device_tables.sql

-- 2. 菜单权限配置（如果还没有执行）
-- 执行: device_menu.sql

-- 3. 字典数据配置（如果还没有执行）
-- 执行: device_dict.sql

-- 4. 测试数据（如果还没有执行）
-- 执行: device_test_data.sql

-- 5. 优化1: 科室选择功能
-- 执行: device_optimization_1.sql

-- 6. 优化2: 仪表板功能
-- 执行: device_optimization_2.sql

-- 7. 最终权限分配确认
-- 确保管理员角色拥有所有设备管理权限
INSERT IGNORE INTO sys_role_menu VALUES('1', '2000');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2001');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2002');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2003');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2004');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2005');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2006');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2010');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2011');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2012');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2013');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2014');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2015');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2020');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2021');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2022');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2023');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2024');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2025');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2026');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2030');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2031');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2032');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2033');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2034');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2035');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2036');
INSERT IGNORE INTO sys_role_menu VALUES('1', '2040');

