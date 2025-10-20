-- 创建设备管理菜单
-- 这个脚本专门用于创建新的设备管理菜单结构

-- 1. 首先清理可能存在的设备管理菜单
DELETE FROM sys_role_menu WHERE menu_id BETWEEN 2000 AND 2005;
DELETE FROM sys_menu WHERE menu_id BETWEEN 2000 AND 2005;

-- 2. 创建设备管理主菜单
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

-- 3. 创建设备信息子菜单
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

-- 4. 创建采购申请子菜单
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

-- 5. 创建领用管理子菜单
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

-- 6. 创建批次管理子菜单
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

-- 7. 创建数据分析子菜单
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

-- 8. 为超级管理员角色分配菜单权限
INSERT INTO sys_role_menu VALUES('1', '2000');  -- 设备管理
INSERT INTO sys_role_menu VALUES('1', '2001');  -- 设备信息
INSERT INTO sys_role_menu VALUES('1', '2002');  -- 采购申请
INSERT INTO sys_role_menu VALUES('1', '2003');  -- 领用管理
INSERT INTO sys_role_menu VALUES('1', '2004');  -- 批次管理
INSERT INTO sys_role_menu VALUES('1', '2005');  -- 数据分析

-- 9. 验证菜单创建结果
SELECT '设备管理菜单创建结果:' as info;
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
