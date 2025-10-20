-- 强制清理旧菜单并重建设备管理菜单
-- 这个脚本将彻底删除旧菜单并创建新的设备管理菜单结构

-- 1. 首先查看当前存在的菜单（用于调试）
SELECT '当前菜单列表:' as info;
SELECT menu_id, menu_name, parent_id, path, component, menu_type 
FROM sys_menu 
WHERE menu_name IN ('器械档案', '采购审批管理', '库存与出入库', '报表分析', '设备管理')
ORDER BY menu_id;

-- 2. 删除所有相关的角色菜单关联
DELETE FROM sys_role_menu WHERE menu_id IN (
    SELECT menu_id FROM sys_menu WHERE menu_name IN (
        '器械档案', '采购审批管理', '库存与出入库', '报表分析', '设备管理'
    )
);

-- 3. 删除所有相关的菜单项
DELETE FROM sys_menu WHERE menu_name IN (
    '器械档案', '采购审批管理', '库存与出入库', '报表分析', '设备管理'
);

-- 4. 删除可能存在的设备管理相关菜单（清理ID范围2000-2099）
DELETE FROM sys_role_menu WHERE menu_id BETWEEN 2000 AND 2099;
DELETE FROM sys_menu WHERE menu_id BETWEEN 2000 AND 2099;

-- 5. 创建新的设备管理菜单结构
-- 主菜单：设备管理
INSERT INTO sys_menu VALUES(
    '2000',                    -- menu_id
    '设备管理',                 -- menu_name
    '0',                       -- parent_id (顶级菜单)
    '5',                       -- order_num
    'device',                  -- path
    null,                      -- component
    '',                        -- query
    '',                        -- is_frame
    1,                         -- is_cache
    0,                         -- menu_type (M=目录)
    '0',                       -- visible
    '0',                       -- status
    '',                        -- perms
    'tool',                    -- icon
    'admin',                   -- create_by
    sysdate(),                 -- create_time
    '',                        -- update_by
    null,                      -- update_time
    '设备管理目录'              -- remark
);

-- 子菜单1：设备信息
INSERT INTO sys_menu VALUES(
    '2001',                    -- menu_id
    '设备信息',                 -- menu_name
    '2000',                    -- parent_id
    '1',                       -- order_num
    'info',                    -- path
    'device/info/index',       -- component
    '',                        -- query
    '',                        -- is_frame
    1,                         -- is_cache
    1,                         -- menu_type (C=菜单)
    '0',                       -- visible
    '0',                       -- status
    'device:info:list',        -- perms
    'list',                    -- icon
    'admin',                   -- create_by
    sysdate(),                 -- create_time
    '',                        -- update_by
    null,                      -- update_time
    '设备信息菜单'              -- remark
);

-- 子菜单2：采购申请
INSERT INTO sys_menu VALUES(
    '2002',                    -- menu_id
    '采购申请',                 -- menu_name
    '2000',                    -- parent_id
    '2',                       -- order_num
    'apply',                   -- path
    'device/apply/index',      -- component
    '',                        -- query
    '',                        -- is_frame
    1,                         -- is_cache
    1,                         -- menu_type (C=菜单)
    '0',                       -- visible
    '0',                       -- status
    'device:apply:list',        -- perms
    'shopping',                -- icon
    'admin',                   -- create_by
    sysdate(),                 -- create_time
    '',                        -- update_by
    null,                      -- update_time
    '采购申请菜单'              -- remark
);

-- 子菜单3：领用管理
INSERT INTO sys_menu VALUES(
    '2003',                    -- menu_id
    '领用管理',                 -- menu_name
    '2000',                    -- parent_id
    '3',                       -- order_num
    'requisition',             -- path
    'device/requisition/index', -- component
    '',                        -- query
    '',                        -- is_frame
    1,                         -- is_cache
    1,                         -- menu_type (C=菜单)
    '0',                       -- visible
    '0',                       -- status
    'device:requisition:list', -- perms
    'takeaway-box',            -- icon
    'admin',                   -- create_by
    sysdate(),                 -- create_time
    '',                        -- update_by
    null,                      -- update_time
    '领用管理菜单'              -- remark
);

-- 子菜单4：批次管理
INSERT INTO sys_menu VALUES(
    '2004',                    -- menu_id
    '批次管理',                 -- menu_name
    '2000',                    -- parent_id
    '4',                       -- order_num
    'batch',                   -- path
    'device/batch/index',      -- component
    '',                        -- query
    '',                        -- is_frame
    1,                         -- is_cache
    1,                         -- menu_type (C=菜单)
    '0',                       -- visible
    '0',                       -- status
    'device:batch:list',       -- perms
    'nested',                  -- icon
    'admin',                   -- create_by
    sysdate(),                 -- create_time
    '',                        -- update_by
    null,                      -- update_time
    '批次管理菜单'              -- remark
);

-- 子菜单5：数据分析
INSERT INTO sys_menu VALUES(
    '2005',                    -- menu_id
    '数据分析',                 -- menu_name
    '2000',                    -- parent_id
    '5',                       -- order_num
    'dashboard',               -- path
    'device/dashboard/index',  -- component
    '',                        -- query
    '',                        -- is_frame
    1,                         -- is_cache
    1,                         -- menu_type (C=菜单)
    '0',                       -- visible
    '0',                       -- status
    'device:dashboard:view',   -- perms
    'chart',                   -- icon
    'admin',                   -- create_by
    sysdate(),                 -- create_time
    '',                        -- update_by
    null,                      -- update_time
    '数据分析菜单'              -- remark
);

-- 6. 为超级管理员角色分配菜单权限
INSERT INTO sys_role_menu VALUES('1', '2000');  -- 设备管理
INSERT INTO sys_role_menu VALUES('1', '2001');  -- 设备信息
INSERT INTO sys_role_menu VALUES('1', '2002');  -- 采购申请
INSERT INTO sys_role_menu VALUES('1', '2003');  -- 领用管理
INSERT INTO sys_role_menu VALUES('1', '2004');  -- 批次管理
INSERT INTO sys_role_menu VALUES('1', '2005');  -- 数据分析

-- 7. 为普通用户角色也分配权限（如果需要）
INSERT INTO sys_role_menu VALUES('2', '2000');
INSERT INTO sys_role_menu VALUES('2', '2001');
INSERT INTO sys_role_menu VALUES('2', '2002');
INSERT INTO sys_role_menu VALUES('2', '2003');
INSERT INTO sys_role_menu VALUES('2', '2004');
INSERT INTO sys_role_menu VALUES('2', '2005');

-- 8. 验证菜单创建结果
SELECT '创建后的菜单列表:' as info;
SELECT 
    menu_id,
    menu_name,
    parent_id,
    order_num,
    path,
    component,
    menu_type,
    visible,
    status,
    perms,
    icon
FROM sys_menu 
WHERE menu_id BETWEEN 2000 AND 2005
ORDER BY menu_id;

-- 9. 验证角色菜单关联
SELECT '角色菜单关联:' as info;
SELECT rm.role_id, rm.menu_id, m.menu_name
FROM sys_role_menu rm
JOIN sys_menu m ON rm.menu_id = m.menu_id
WHERE rm.menu_id BETWEEN 2000 AND 2005
ORDER BY rm.role_id, rm.menu_id;
