-- 手动删除多余的菜单项
-- 根据你的截图，需要删除以下菜单项

-- 1. 查看当前需要删除的菜单
SELECT '需要删除的菜单:' as info;
SELECT menu_id, menu_name, parent_id, path, component 
FROM sys_menu 
WHERE menu_name IN ('器械档案', '采购审批管理', '库存与出入库', '报表分析')
ORDER BY menu_id;

-- 2. 删除角色菜单关联
DELETE FROM sys_role_menu WHERE menu_id IN (
    SELECT menu_id FROM sys_menu WHERE menu_name IN (
        '器械档案', '采购审批管理', '库存与出入库', '报表分析'
    )
);

-- 3. 删除菜单项
DELETE FROM sys_menu WHERE menu_name IN (
    '器械档案', '采购审批管理', '库存与出入库', '报表分析'
);

-- 4. 验证删除结果
SELECT '删除后的菜单列表:' as info;
SELECT menu_id, menu_name, parent_id, path, component 
FROM sys_menu 
WHERE menu_name IN ('器械档案', '采购审批管理', '库存与出入库', '报表分析')
ORDER BY menu_id;
