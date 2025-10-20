-- 设备管理模块菜单数据
-- 设备管理主菜单
INSERT INTO sys_menu VALUES('2000', '设备管理', '0', '5', 'device', null, '', '', 1, 0, 'M', '0', '0', '', 'device', 'admin', sysdate(), '', null, '设备管理目录');

-- 器械档案管理
INSERT INTO sys_menu VALUES('2001', '器械档案', '2000', '1', 'info', 'device/info/index', '', '', 1, 0, 'C', '0', '0', 'device:info:list', 'device', 'admin', sysdate(), '', null, '器械档案菜单');
INSERT INTO sys_menu VALUES('2002', '器械档案查询', '2001', '1', '', '', '', '', 1, 0, 'F', '0', '0', 'device:info:query', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2003', '器械档案新增', '2001', '2', '', '', '', '', 1, 0, 'F', '0', '0', 'device:info:add', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2004', '器械档案修改', '2001', '3', '', '', '', '', 1, 0, 'F', '0', '0', 'device:info:edit', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2005', '器械档案删除', '2001', '4', '', '', '', '', 1, 0, 'F', '0', '0', 'device:info:remove', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2006', '器械档案导出', '2001', '5', '', '', '', '', 1, 0, 'F', '0', '0', 'device:info:export', '#', 'admin', sysdate(), '', null, '');

-- 库存批次管理
INSERT INTO sys_menu VALUES('2010', '库存批次', '2000', '2', 'batch', 'device/batch/index', '', '', 1, 0, 'C', '0', '0', 'device:batch:list', 'list', 'admin', sysdate(), '', null, '库存批次菜单');
INSERT INTO sys_menu VALUES('2011', '库存批次查询', '2010', '1', '', '', '', '', 1, 0, 'F', '0', '0', 'device:batch:query', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2012', '库存批次新增', '2010', '2', '', '', '', '', 1, 0, 'F', '0', '0', 'device:batch:add', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2013', '库存批次修改', '2010', '3', '', '', '', '', 1, 0, 'F', '0', '0', 'device:batch:edit', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2014', '库存批次删除', '2010', '4', '', '', '', '', 1, 0, 'F', '0', '0', 'device:batch:remove', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2015', '库存批次导出', '2010', '5', '', '', '', '', 1, 0, 'F', '0', '0', 'device:batch:export', '#', 'admin', sysdate(), '', null, '');

-- 采购申请管理
INSERT INTO sys_menu VALUES('2020', '采购申请', '2000', '3', 'apply', 'device/apply/index', '', '', 1, 0, 'C', '0', '0', 'device:apply:list', 'shopping', 'admin', sysdate(), '', null, '采购申请菜单');
INSERT INTO sys_menu VALUES('2021', '采购申请查询', '2020', '1', '', '', '', '', 1, 0, 'F', '0', '0', 'device:apply:query', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2022', '采购申请新增', '2020', '2', '', '', '', '', 1, 0, 'F', '0', '0', 'device:apply:add', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2023', '采购申请修改', '2020', '3', '', '', '', '', 1, 0, 'F', '0', '0', 'device:apply:edit', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2024', '采购申请删除', '2020', '4', '', '', '', '', 1, 0, 'F', '0', '0', 'device:apply:remove', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2025', '采购申请导出', '2020', '5', '', '', '', '', 1, 0, 'F', '0', '0', 'device:apply:export', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2026', '采购申请审批', '2020', '6', '', '', '', '', 1, 0, 'F', '0', '0', 'device:apply:approve', '#', 'admin', sysdate(), '', null, '');

-- 领用申请管理
INSERT INTO sys_menu VALUES('2030', '领用申请', '2000', '4', 'requisition', 'device/requisition/index', '', '', 1, 0, 'C', '0', '0', 'device:requisition:list', 'form', 'admin', sysdate(), '', null, '领用申请菜单');
INSERT INTO sys_menu VALUES('2031', '领用申请查询', '2030', '1', '', '', '', '', 1, 0, 'F', '0', '0', 'device:requisition:query', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2032', '领用申请新增', '2030', '2', '', '', '', '', 1, 0, 'F', '0', '0', 'device:requisition:add', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2033', '领用申请修改', '2030', '3', '', '', '', '', 1, 0, 'F', '0', '0', 'device:requisition:edit', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2034', '领用申请删除', '2030', '4', '', '', '', '', 1, 0, 'F', '0', '0', 'device:requisition:remove', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2035', '领用申请导出', '2030', '5', '', '', '', '', 1, 0, 'F', '0', '0', 'device:requisition:export', '#', 'admin', sysdate(), '', null, '');
INSERT INTO sys_menu VALUES('2036', '领用申请审批', '2030', '6', '', '', '', '', 1, 0, 'F', '0', '0', 'device:requisition:approve', '#', 'admin', sysdate(), '', null, '');

-- 设备仪表板菜单
INSERT INTO sys_menu VALUES('2005', '设备仪表板', '2000', '0', 'dashboard', 'device/dashboard/index', '', '', 1, 0, 'C', '0', '0', 'device:dashboard:view', 'dashboard', 'admin', sysdate(), '', null, '设备管理仪表板');

-- 为管理员角色分配设备管理权限
INSERT INTO sys_role_menu VALUES('1', '2000');
INSERT INTO sys_role_menu VALUES('1', '2001');
INSERT INTO sys_role_menu VALUES('1', '2002');
INSERT INTO sys_role_menu VALUES('1', '2003');
INSERT INTO sys_role_menu VALUES('1', '2004');
INSERT INTO sys_role_menu VALUES('1', '2005');
INSERT INTO sys_role_menu VALUES('1', '2006');
INSERT INTO sys_role_menu VALUES('1', '2010');
INSERT INTO sys_role_menu VALUES('1', '2011');
INSERT INTO sys_role_menu VALUES('1', '2012');
INSERT INTO sys_role_menu VALUES('1', '2013');
INSERT INTO sys_role_menu VALUES('1', '2014');
INSERT INTO sys_role_menu VALUES('1', '2015');
INSERT INTO sys_role_menu VALUES('1', '2020');
INSERT INTO sys_role_menu VALUES('1', '2021');
INSERT INTO sys_role_menu VALUES('1', '2022');
INSERT INTO sys_role_menu VALUES('1', '2023');
INSERT INTO sys_role_menu VALUES('1', '2024');
INSERT INTO sys_role_menu VALUES('1', '2025');
INSERT INTO sys_role_menu VALUES('1', '2026');
INSERT INTO sys_role_menu VALUES('1', '2030');
INSERT INTO sys_role_menu VALUES('1', '2031');
INSERT INTO sys_role_menu VALUES('1', '2032');
INSERT INTO sys_role_menu VALUES('1', '2033');
INSERT INTO sys_role_menu VALUES('1', '2034');
INSERT INTO sys_role_menu VALUES('1', '2035');
INSERT INTO sys_role_menu VALUES('1', '2036');

