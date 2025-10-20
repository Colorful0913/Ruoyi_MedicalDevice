-- 设备管理模块字典数据
-- 领用状态字典
INSERT INTO sys_dict_type VALUES(100, '领用状态', 'sys_requisition_status', '0', 'admin', sysdate(), '', null, '领用申请状态列表');

INSERT INTO sys_dict_data VALUES(100, 1, '待审核', '0', 'sys_requisition_status', '', 'primary', 'N', '0', 'admin', sysdate(), '', null, '待审核状态');
INSERT INTO sys_dict_data VALUES(101, 2, '已出库', '1', 'sys_requisition_status', '', 'success', 'N', '0', 'admin', sysdate(), '', null, '已出库状态');
INSERT INTO sys_dict_data VALUES(102, 3, '已驳回', '2', 'sys_requisition_status', '', 'danger', 'N', '0', 'admin', sysdate(), '', null, '已驳回状态');

-- 采购申请状态字典
INSERT INTO sys_dict_type VALUES(101, '采购申请状态', 'sys_apply_status', '0', 'admin', sysdate(), '', null, '采购申请状态列表');

INSERT INTO sys_dict_data VALUES(103, 1, '待审核', '0', 'sys_apply_status', '', 'primary', 'N', '0', 'admin', sysdate(), '', null, '待审核状态');
INSERT INTO sys_dict_data VALUES(104, 2, '已批准', '1', 'sys_apply_status', '', 'success', 'N', '0', 'admin', sysdate(), '', null, '已批准状态');
INSERT INTO sys_dict_data VALUES(105, 3, '已驳回', '2', 'sys_apply_status', '', 'danger', 'N', '0', 'admin', sysdate(), '', null, '已驳回状态');

-- 采购状态字典
INSERT INTO sys_dict_type VALUES(102, '采购状态', 'sys_procure_status', '0', 'admin', sysdate(), '', null, '采购状态列表');

INSERT INTO sys_dict_data VALUES(106, 1, '未采购', '0', 'sys_procure_status', '', 'info', 'N', '0', 'admin', sysdate(), '', null, '未采购状态');
INSERT INTO sys_dict_data VALUES(107, 2, '采购中', '1', 'sys_procure_status', '', 'warning', 'N', '0', 'admin', sysdate(), '', null, '采购中状态');
INSERT INTO sys_dict_data VALUES(108, 3, '已到货', '2', 'sys_procure_status', '', 'success', 'N', '0', 'admin', sysdate(), '', null, '已到货状态');

-- 库存批次状态字典
INSERT INTO sys_dict_type VALUES(103, '库存状态', 'sys_batch_status', '0', 'admin', sysdate(), '', null, '库存批次状态列表');

INSERT INTO sys_dict_data VALUES(109, 1, '在库', '0', 'sys_batch_status', '', 'success', 'N', '0', 'admin', sysdate(), '', null, '在库状态');
INSERT INTO sys_dict_data VALUES(110, 2, '出库完毕', '1', 'sys_batch_status', '', 'info', 'N', '0', 'admin', sysdate(), '', null, '出库完毕状态');

