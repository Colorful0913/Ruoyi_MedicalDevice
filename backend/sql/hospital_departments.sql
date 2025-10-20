-- 医院部门数据
-- 删除现有的演示部门数据（保留系统必需的数据）
DELETE FROM sys_dept WHERE dept_id > 100 AND dept_id < 200;

-- 插入医院部门数据
INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES
(101, 0, '0', '医院管理', 1, '院长', '010-12345678', 'hospital@example.com', '0', '0', 'admin', sysdate(), '', null),
(102, 101, '0,101', '内科', 1, '内科主任', '010-12345679', 'internal@example.com', '0', '0', 'admin', sysdate(), '', null),
(103, 101, '0,101', '外科', 2, '外科主任', '010-12345680', 'surgery@example.com', '0', '0', 'admin', sysdate(), '', null),
(104, 101, '0,101', '妇产科', 3, '妇产科主任', '010-12345681', 'obstetrics@example.com', '0', '0', 'admin', sysdate(), '', null),
(105, 101, '0,101', '儿科', 4, '儿科主任', '010-12345682', 'pediatrics@example.com', '0', '0', 'admin', sysdate(), '', null),
(106, 101, '0,101', '急诊科', 5, '急诊科主任', '010-12345683', 'emergency@example.com', '0', '0', 'admin', sysdate(), '', null),
(107, 101, '0,101', 'ICU', 6, 'ICU主任', '010-12345684', 'icu@example.com', '0', '0', 'admin', sysdate(), '', null),
(108, 101, '0,101', '手术室', 7, '手术室主任', '010-12345685', 'operation@example.com', '0', '0', 'admin', sysdate(), '', null),
(109, 101, '0,101', '药房', 8, '药房主任', '010-12345686', 'pharmacy@example.com', '0', '0', 'admin', sysdate(), '', null),
(110, 101, '0,101', '检验科', 9, '检验科主任', '010-12345687', 'laboratory@example.com', '0', '0', 'admin', sysdate(), '', null),
(111, 101, '0,101', '影像科', 10, '影像科主任', '010-12345688', 'imaging@example.com', '0', '0', 'admin', sysdate(), '', null),
(112, 101, '0,101', '护理部', 11, '护理部主任', '010-12345689', 'nursing@example.com', '0', '0', 'admin', sysdate(), '', null);

-- 更新部门层级关系
UPDATE sys_dept SET ancestors = '0,101' WHERE dept_id IN (102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112);

-- 为管理员角色分配新部门权限
INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 101);
INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 102);
INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 103);
INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 104);
INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 105);
INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 106);
INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 107);
INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 108);
INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 109);
INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 110);
INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 111);
INSERT INTO sys_role_dept (role_id, dept_id) VALUES (1, 112);


