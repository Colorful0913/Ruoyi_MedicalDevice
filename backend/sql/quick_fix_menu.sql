-- 快速修复仪表板菜单权限
-- 确保菜单2003存在且状态正常
UPDATE sys_menu SET 
    status = '0', 
    visible = '0', 
    menu_type = 'M',
    path = '/device/dashboard/index',
    component = 'device/dashboard/index'
WHERE menu_id = 2003;

-- 为超级管理员角色分配菜单权限
INSERT IGNORE INTO sys_role_menu VALUES('1', '2003');

-- 为普通角色也分配权限（可选）
INSERT IGNORE INTO sys_role_menu VALUES('2', '2003');

-- 检查结果
SELECT 
    m.menu_id,
    m.menu_name,
    m.path,
    m.status,
    m.visible,
    m.menu_type,
    CASE WHEN rm.role_id IS NOT NULL THEN '已分配' ELSE '未分配' END as role_status
FROM sys_menu m
LEFT JOIN sys_role_menu rm ON m.menu_id = rm.menu_id AND rm.role_id = 1
WHERE m.menu_id = 2003;



