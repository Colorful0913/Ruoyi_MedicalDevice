-- 优化1: 添加科室选择功能
-- 为领用申请添加科室下拉选择

-- 添加科室查询接口权限
INSERT INTO sys_menu VALUES('2040', '科室查询', '2030', '7', '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:list', '#', 'admin', sysdate(), '', null, '');

-- 为管理员角色分配科室查询权限
INSERT INTO sys_role_menu VALUES('1', '2040');

