# 设备管理菜单接入RuoYi框架说明

## 问题描述
- 之前创建的"设备管理"菜单可以正常使用，但无法通过RuoYi框架的"菜单管理"功能进行管理
- 需要删除旧的独立菜单项，并创建符合RuoYi框架要求的新菜单结构

## 解决步骤

### 1. 执行菜单清理和重建脚本
```sql
-- 执行以下SQL文件
source backend/sql/clean_and_setup_device_menus.sql
```

### 2. 验证菜单创建
执行脚本后，检查菜单是否正确创建：
```sql
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
```

### 3. 重启应用
```bash
# 后端重启
cd backend
./bin/run.bat

# 前端重启
cd frontend
npm run dev
```

### 4. 验证菜单管理功能
1. 登录系统
2. 进入"系统管理" -> "菜单管理"
3. 应该能看到"设备管理"菜单及其子菜单
4. 可以正常编辑、删除、新增菜单项

## 菜单结构说明

### 主菜单：设备管理 (menu_id: 2000)
- 类型：目录 (M)
- 路径：device
- 图标：tool

### 子菜单结构：
1. **设备信息** (menu_id: 2001)
   - 路径：info
   - 组件：device/info/index
   - 图标：list

2. **采购申请** (menu_id: 2002)
   - 路径：apply
   - 组件：device/apply/index
   - 图标：shopping

3. **领用管理** (menu_id: 2003)
   - 路径：requisition
   - 组件：device/requisition/index
   - 图标：takeaway-box

4. **批次管理** (menu_id: 2004)
   - 路径：batch
   - 组件：device/batch/index
   - 图标：nested

5. **数据分析** (menu_id: 2005)
   - 路径：dashboard
   - 组件：device/dashboard/index
   - 图标：chart

## 注意事项
1. 执行SQL脚本前，请备份数据库
2. 确保所有菜单项的menu_type、visible、status等字段设置正确
3. 菜单权限已自动分配给超级管理员角色(role_id=1)
4. 如果需要为其他角色分配权限，请在sys_role_menu表中添加相应记录

## 故障排除
如果菜单管理功能仍然无法使用，请检查：
1. 数据库连接是否正常
2. 菜单数据是否正确插入
3. 用户角色权限是否正确分配
4. 应用是否正常重启
