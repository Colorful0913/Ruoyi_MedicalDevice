/*
 Navicat Premium Dump SQL

 Source Server         : 魔丸
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : medicaldevice

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 22/10/2025 14:18:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'tb_device_info', '医疗器械/耗材档案表', NULL, NULL, 'DeviceInfo', 'crud', 'element-plus', 'com.ruoyi.device', 'device', 'info', '器械档案', 'liubowen', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27', NULL);
INSERT INTO `gen_table` VALUES (2, 'tb_inventory_batch', '库存批次表', NULL, NULL, 'InventoryBatch', 'crud', 'element-plus', 'com.ruoyi.device', 'device', 'batch', '库存批次', 'liubowen', '0', '/', '{\"parentMenuId\":2001}', 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27', NULL);
INSERT INTO `gen_table` VALUES (3, 'tb_purchase_apply', '物资采购申请单表', NULL, NULL, 'PurchaseApply', 'crud', 'element-plus', 'com.ruoyi.device', 'device', 'apply', '采购申请', 'liubowen', '0', '/', '{\"parentMenuId\":2001}', 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42', NULL);
INSERT INTO `gen_table` VALUES (4, 'tb_requisition_apply', '科室领用申请单表', NULL, NULL, 'RequisitionApply', 'crud', 'element-plus', 'com.ruoyi.device', 'device', 'requisition', '科室领用申请单', 'liubowen', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'device_id', '器械档案ID', 'bigint(20)', 'Long', 'deviceId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (2, 1, 'device_name', '器械名称', 'varchar(100)', 'String', 'deviceName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (3, 1, 'device_code', '器械编号/型号', 'varchar(64)', 'String', 'deviceCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (4, 1, 'category', '器械分类（字典：sys_device_category）', 'varchar(64)', 'String', 'category', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_device_category', 4, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (5, 1, 'spec', '规格型号', 'varchar(100)', 'String', 'spec', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (6, 1, 'unit', '计量单位', 'varchar(20)', 'String', 'unit', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (7, 1, 'register_num', '医疗器械注册证号', 'varchar(100)', 'String', 'registerNum', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'input', '', 7, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (8, 1, 'min_stock', '最低库存预警值', 'int(11)', 'Integer', 'minStock', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (9, 1, 'total_stock', '当前总库存量（由系统维护）', 'decimal(10,2)', 'BigDecimal', 'totalStock', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 9, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (10, 1, 'status', '器械状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 10, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (11, 1, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ', 'textarea', '', 11, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (12, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, '1', NULL, 'EQ', 'input', '', 12, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (13, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, '1', '1', 'BETWEEN', 'datetime', '', 13, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (14, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (15, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2025-10-16 13:23:15', '', '2025-10-16 17:55:27');
INSERT INTO `gen_table_column` VALUES (16, 2, 'batch_id', '批次ID', 'bigint(20)', 'Long', 'batchId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (17, 2, 'device_id', '关联器械ID', 'bigint(20)', 'Long', 'deviceId', '0', '0', '1', '1', '0', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (18, 2, 'batch_num', '批次号/序列号', 'varchar(64)', 'String', 'batchNum', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (19, 2, 'supplier', '供应商名称', 'varchar(100)', 'String', 'supplier', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (20, 2, 'inbound_time', '入库日期（用于FIFO）', 'datetime', 'Date', 'inboundTime', '0', '0', '1', '1', '0', '1', '1', 'BETWEEN', 'datetime', '', 5, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (21, 2, 'expiry_date', '过期日期/有效期（用于预警）', 'date', 'Date', 'expiryDate', '0', '0', '1', '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 6, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (22, 2, 'inbound_quantity', '初始入库数量', 'decimal(10,2)', 'BigDecimal', 'inboundQuantity', '0', '0', '1', '1', '0', '1', '0', 'EQ', 'input', '', 7, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (23, 2, 'current_quantity', '当前库存数量', 'decimal(10,2)', 'BigDecimal', 'currentQuantity', '0', '0', '1', '0', '0', '1', '0', 'EQ', 'input', '', 8, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (24, 2, 'status', '批次状态（0在库 1出库完毕 2已过期）', 'char(1)', 'String', 'status', '0', '0', '0', '0', '1', '1', '1', 'EQ', 'select', 'sys_batch_status', 9, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (25, 2, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (26, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (27, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (28, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (29, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2025-10-16 13:41:12', '', '2025-10-19 15:56:27');
INSERT INTO `gen_table_column` VALUES (30, 3, 'apply_id', '申请单ID', 'bigint(20)', 'Long', 'applyId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (31, 3, 'apply_code', '申请单号', 'varchar(64)', 'String', 'applyCode', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (32, 3, 'dept_id', '申请科室ID', 'bigint(20)', 'Long', 'deptId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (33, 3, 'device_id', '关联器械ID', 'bigint(20)', 'Long', 'deviceId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (34, 3, 'required_quantity', '申请采购数量', 'decimal(10,2)', 'BigDecimal', 'requiredQuantity', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (35, 3, 'required_date', '需求到货日期', 'date', 'Date', 'requiredDate', '0', '0', '0', '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 6, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (36, 3, 'apply_status', '审批状态（字典：0-待审批 1-已通过 2-已驳回）', 'char(1)', 'String', 'applyStatus', '0', '0', '1', '0', '1', '1', '1', 'EQ', 'select', 'sys_apply_status', 7, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (37, 3, 'approver_by', '审批人', 'varchar(64)', 'String', 'approverBy', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (38, 3, 'approve_time', '审批时间', 'datetime', 'Date', 'approveTime', '0', '0', '0', '0', '0', '1', '1', 'BETWEEN', 'datetime', '', 9, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (39, 3, 'procure_status', '入库状态（字典：0-待入库 1-部分入库 2-已完成入库）', 'char(1)', 'String', 'procureStatus', '0', '0', '0', '0', '1', '1', '1', 'EQ', 'select', 'sys_procure_status', 10, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (40, 3, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ', 'textarea', '', 11, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (41, 3, 'create_by', '创建者（即申请人）', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (42, 3, 'create_time', '创建时间（即申请时间）', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, '1', '1', 'BETWEEN', 'datetime', '', 13, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (43, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 14, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (44, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'datetime', '', 15, 'admin', '2025-10-18 15:54:13', '', '2025-10-18 17:11:42');
INSERT INTO `gen_table_column` VALUES (45, 4, 'requisition_id', '领用申请ID', 'bigint(20)', 'Long', 'requisitionId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');
INSERT INTO `gen_table_column` VALUES (46, 4, 'requisition_code', '领用单号', 'varchar(64)', 'String', 'requisitionCode', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');
INSERT INTO `gen_table_column` VALUES (47, 4, 'dept_id', '申请科室ID', 'bigint(20)', 'Long', 'deptId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');
INSERT INTO `gen_table_column` VALUES (48, 4, 'device_id', '申请器材ID', 'bigint(20)', 'Long', 'deviceId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');
INSERT INTO `gen_table_column` VALUES (49, 4, 'requisition_quantity', '申请领用数量', 'decimal(10,2)', 'BigDecimal', 'requisitionQuantity', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');
INSERT INTO `gen_table_column` VALUES (50, 4, 'requisition_status', '领用状态（字典：0-待审核 1-已出库 2-已驳回）', 'char(1)', 'String', 'requisitionStatus', '0', '0', '0', '0', '1', '1', '1', 'EQ', 'radio', 'sys_requisition_status', 6, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');
INSERT INTO `gen_table_column` VALUES (51, 4, 'handler_by', '处理人（库管员）', 'varchar(64)', 'String', 'handlerBy', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');
INSERT INTO `gen_table_column` VALUES (52, 4, 'handle_time', '处理时间', 'datetime', 'Date', 'handleTime', '0', '0', '0', '0', '1', '1', '1', 'BETWEEN', 'datetime', '', 8, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');
INSERT INTO `gen_table_column` VALUES (53, 4, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ', 'textarea', '', 9, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');
INSERT INTO `gen_table_column` VALUES (54, 4, 'create_by', '创建者（申请人）', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');
INSERT INTO `gen_table_column` VALUES (55, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');
INSERT INTO `gen_table_column` VALUES (56, 4, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');
INSERT INTO `gen_table_column` VALUES (57, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2025-10-19 18:01:23', '', '2025-10-19 18:31:02');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-10-16 09:12:57', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-10-16 09:12:57', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-10-16 09:12:57', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2025-10-16 09:12:57', 'admin', '2025-10-16 13:22:43', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-10-16 09:12:57', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-10-16 09:12:57', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-10-16 09:12:57', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-10-16 09:12:57', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '内科', 0, '', '', '', '0', '0', 'admin', '2025-10-16 09:12:57', 'admin', '2025-10-20 15:24:56');
INSERT INTO `sys_dept` VALUES (113, 100, '0,100', '外科妇', 0, NULL, NULL, NULL, '0', '0', 'admin', '2025-10-20 15:25:33', '', NULL);
INSERT INTO `sys_dept` VALUES (114, 100, '0,100', '产科', 0, NULL, NULL, NULL, '0', '0', 'admin', '2025-10-20 15:25:39', '', NULL);
INSERT INTO `sys_dept` VALUES (115, 100, '0,100', '儿科', 0, NULL, NULL, NULL, '0', '0', 'admin', '2025-10-20 15:25:44', '', NULL);
INSERT INTO `sys_dept` VALUES (116, 100, '0,100', '急诊科', 0, NULL, NULL, NULL, '0', '0', 'admin', '2025-10-20 15:25:48', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '高值耗材', '1', 'sys_device_category', NULL, 'default', 'N', '0', 'admin', '2025-10-16 14:45:54', '', NULL, '例如：支架、人工关节');
INSERT INTO `sys_dict_data` VALUES (101, 2, '低值耗材', '2', 'sys_device_category', NULL, 'default', 'N', '0', 'admin', '2025-10-16 14:46:05', '', NULL, '例如：纱布、手套');
INSERT INTO `sys_dict_data` VALUES (102, 3, '医疗设备', '3', 'sys_device_category', NULL, 'default', 'N', '0', 'admin', '2025-10-16 14:46:15', '', NULL, '例如：监护仪、呼吸机');
INSERT INTO `sys_dict_data` VALUES (103, 1, '待审批', '0', 'sys_apply_status', NULL, 'default', 'N', '0', 'admin', '2025-10-18 16:10:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 2, '已通过', '1', 'sys_apply_status', NULL, 'default', 'N', '0', 'admin', '2025-10-18 16:10:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 3, '已驳回', '2', 'sys_apply_status', NULL, 'default', 'N', '0', 'admin', '2025-10-18 16:10:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 1, '待入库', '0', 'sys_procure_status', NULL, 'default', 'N', '0', 'admin', '2025-10-18 16:11:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 2, '部分入库', '1', 'sys_procure_status', NULL, 'default', 'N', '0', 'admin', '2025-10-18 16:11:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 3, '已完成入库', '2', 'sys_procure_status', NULL, 'default', 'N', '0', 'admin', '2025-10-18 16:11:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 1, '在库', '0', 'sys_batch_status', NULL, 'default', 'N', '0', 'admin', '2025-10-19 15:40:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 2, '出库完毕', '1', 'sys_batch_status', NULL, 'default', 'N', '0', 'admin', '2025-10-19 15:40:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 3, '已过期', '2', 'sys_batch_status', NULL, 'default', 'N', '0', 'admin', '2025-10-19 15:40:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 1, '待审核', '0', 'sys_requisition_status', NULL, 'default', 'N', '0', 'admin', '2025-10-19 18:03:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 2, '已出库', '1', 'sys_requisition_status', NULL, 'default', 'N', '0', 'admin', '2025-10-19 18:03:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 3, '已驳回', '2', 'sys_requisition_status', NULL, 'default', 'N', '0', 'admin', '2025-10-19 18:03:43', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '器械分类', 'sys_device_category', '0', 'admin', '2025-10-16 14:45:10', '', NULL, '医疗器械分类');
INSERT INTO `sys_dict_type` VALUES (101, '审批状态', 'sys_apply_status', '0', 'admin', '2025-10-18 16:05:13', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '入库状态', 'sys_procure_status', '0', 'admin', '2025-10-18 16:05:23', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '批次状态', 'sys_batch_status', '0', 'admin', '2025-10-19 15:40:06', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '出入库', 'sys_requisition_status', '0', 'admin', '2025-10-19 18:03:09', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-10-16 09:12:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-16 13:22:25');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-16 14:39:37');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-16 15:12:26');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-16 15:12:27');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-16 15:28:02');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-16 15:28:03');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-16 16:11:48');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-16 17:07:27');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-16 17:53:55');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-17 18:23:12');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-17 19:32:50');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-17 20:52:10');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-18 15:36:59');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-19 15:25:22');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-19 17:13:04');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-19 17:13:09');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-19 19:40:15');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-19 20:10:16');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-19 20:46:14');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-19 21:30:20');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-19 22:02:42');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 00:18:35');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 02:19:57');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 03:36:10');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-20 03:54:05');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 03:54:06');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 03:58:40');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-20 04:05:43');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 04:05:46');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 13:28:36');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 14:19:54');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-20 15:40:35');
INSERT INTO `sys_logininfor` VALUES (132, 'storekeeper_b', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 15:40:40');
INSERT INTO `sys_logininfor` VALUES (133, 'storekeeper_b', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-20 15:41:27');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 15:41:41');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 18:23:47');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-20 18:23:55');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 18:24:03');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-20 18:24:12');
INSERT INTO `sys_logininfor` VALUES (139, 'approver', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 18:24:16');
INSERT INTO `sys_logininfor` VALUES (140, 'approver', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-20 18:26:11');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 18:26:15');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-20 18:27:02');
INSERT INTO `sys_logininfor` VALUES (143, 'approver', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 18:27:05');
INSERT INTO `sys_logininfor` VALUES (144, 'approver', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-20 18:27:44');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 18:27:50');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-20 18:28:11');
INSERT INTO `sys_logininfor` VALUES (147, 'approver', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 18:28:13');
INSERT INTO `sys_logininfor` VALUES (148, 'approver', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-20 18:28:37');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 18:28:40');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 20:07:48');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-20 20:07:52');
INSERT INTO `sys_logininfor` VALUES (152, 'approver', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-20 20:07:55');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2065 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-10-16 09:12:57', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-10-16 09:12:57', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-10-16 09:12:57', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-10-16 09:12:57', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-10-16 09:12:57', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-10-16 09:12:57', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-10-16 09:12:57', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-10-16 09:12:57', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-10-16 09:12:57', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-10-16 09:12:57', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-10-16 09:12:57', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-10-16 09:12:57', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-10-16 09:12:57', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-10-16 09:12:57', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-10-16 09:12:57', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-10-16 09:12:57', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-10-16 09:12:57', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-10-16 09:12:57', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-10-16 09:12:57', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-10-16 09:12:57', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-10-16 09:12:57', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-10-16 09:12:57', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-10-16 09:12:57', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-10-16 09:12:57', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '报表分析', 2064, 5, 'dashboard', 'device/dashboard/index', NULL, '', 1, 0, 'C', '0', '0', 'device:dashboard:list', 'monitor', 'admin', '2025-10-16 14:04:20', 'admin', '2025-10-20 14:58:04', '');
INSERT INTO `sys_menu` VALUES (2008, '器械信息', 2064, 1, 'info', 'device/info/index', NULL, '', 1, 0, 'C', '0', '0', 'device:info:list', 'list', 'admin', '2025-10-16 18:06:58', 'admin', '2025-10-20 14:24:47', '器械档案菜单');
INSERT INTO `sys_menu` VALUES (2009, '器械档案查询', 2008, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:info:query', '#', 'admin', '2025-10-16 18:06:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '器械档案新增', 2008, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:info:add', '#', 'admin', '2025-10-16 18:06:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '器械档案修改', 2008, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:info:edit', '#', 'admin', '2025-10-16 18:06:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '器械档案删除', 2008, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:info:remove', '#', 'admin', '2025-10-16 18:06:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '器械档案导出', 2008, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:info:export', '#', 'admin', '2025-10-16 18:06:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '采购申请', 2064, 2, 'apply', 'device/apply/index', NULL, '', 1, 0, 'C', '0', '0', 'device:apply:list', 'shopping', 'admin', '2025-10-18 17:01:30', 'admin', '2025-10-20 14:24:40', '采购申请菜单');
INSERT INTO `sys_menu` VALUES (2015, '采购申请查询', 2014, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:apply:query', '#', 'admin', '2025-10-18 17:01:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '采购申请新增', 2014, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:apply:add', '#', 'admin', '2025-10-18 17:01:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '采购申请修改', 2014, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:apply:edit', '#', 'admin', '2025-10-18 17:01:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '采购申请删除', 2014, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:apply:remove', '#', 'admin', '2025-10-18 17:01:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '采购申请导出', 2014, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:apply:export', '#', 'admin', '2025-10-18 17:01:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '批次管理', 2064, 4, 'batch', 'device/batch/index', NULL, '', 1, 0, 'C', '0', '0', 'device:batch:list', 'nested', 'admin', '2025-10-19 15:49:25', 'admin', '2025-10-20 14:25:47', '库存批次菜单');
INSERT INTO `sys_menu` VALUES (2033, '库存批次查询', 2032, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:batch:query', '#', 'admin', '2025-10-19 15:49:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '库存批次新增', 2032, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:batch:add', '#', 'admin', '2025-10-19 15:49:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '库存批次修改', 2032, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:batch:edit', '#', 'admin', '2025-10-19 15:49:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '库存批次删除', 2032, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:batch:remove', '#', 'admin', '2025-10-19 15:49:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '库存批次导出', 2032, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:batch:export', '#', 'admin', '2025-10-19 15:49:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '领用管理', 2064, 3, 'requisition', 'device/requisition/index', NULL, '', 1, 0, 'C', '0', '0', 'device:requisition:list', 'form', 'admin', '2025-10-19 18:31:38', 'admin', '2025-10-20 14:25:21', '科室领用申请单菜单');
INSERT INTO `sys_menu` VALUES (2057, '科室领用申请单查询', 2056, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:requisition:query', '#', 'admin', '2025-10-19 18:31:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '科室领用申请单新增', 2056, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:requisition:add', '#', 'admin', '2025-10-19 18:31:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '科室领用申请单修改', 2056, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:requisition:edit', '#', 'admin', '2025-10-19 18:31:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '科室领用申请单删除', 2056, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:requisition:remove', '#', 'admin', '2025-10-19 18:31:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '科室领用申请单导出', 2056, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'device:requisition:export', '#', 'admin', '2025-10-19 18:31:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '采购审批', 2014, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'device:apply:approve', '#', 'admin', '2025-10-20 00:56:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '领用审批', 2056, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'device:requisition:approve', '#', 'admin', '2025-10-20 01:37:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '医疗器械管理', 0, 0, 'device', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-10-20 14:22:42', 'admin', '2025-10-20 14:22:52', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-10-16 09:12:57', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-10-16 09:12:57', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 315 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 09:12:57\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 13:22:43', 19);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_device_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 13:23:16', 69);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_inventory_batch\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 13:41:12', 41);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"器械档案管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"/device-info-mgt\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:01:21', 27);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-10-16 14:01:21\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"器械档案管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"/device-info-mgt\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:01:29', 8);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"采购审批管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"/procurement-mgt\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:02:24', 6);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"tab\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"库存与出入库\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"/inventory-flow\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:04:00', 8);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"报表分析\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"/report-analysis\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:04:20', 7);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/info/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"器械档案维护\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"/device-info-mgt/info\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:05:31', 15);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/apply/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"采购申请单\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"/procurement-mgt/apply\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:06:08', 15);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/batch/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"批次库存管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2002,\"path\":\"/inventory-flow/batch\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:06:34', 7);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/requisition/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"领用出库\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"/inventory-flow/requisition\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:07:00', 6);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"TbDeviceInfo\",\"columns\":[{\"capJavaField\":\"DeviceId\",\"columnComment\":\"器械档案ID\",\"columnId\":1,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deviceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeviceName\",\"columnComment\":\"器械名称\",\"columnId\":2,\"columnName\":\"device_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeviceCode\",\"columnComment\":\"器械编号/型号\",\"columnId\":3,\"columnName\":\"device_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"器械分类（字典：sys_device_category）\",\"columnId\":4,\"columnName\":\"category\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:40:47', 44);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"TbDeviceInfo\",\"columns\":[{\"capJavaField\":\"DeviceId\",\"columnComment\":\"器械档案ID\",\"columnId\":1,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deviceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-10-16 14:40:47\",\"usableColumn\":false},{\"capJavaField\":\"DeviceName\",\"columnComment\":\"器械名称\",\"columnId\":2,\"columnName\":\"device_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-10-16 14:40:47\",\"usableColumn\":false},{\"capJavaField\":\"DeviceCode\",\"columnComment\":\"器械编号/型号\",\"columnId\":3,\"columnName\":\"device_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-10-16 14:40:47\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"器械分类（字典：sys_device_category）\",\"columnId\":4,\"columnName\":\"category\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:43:27', 39);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"TbDeviceInfo\",\"columns\":[{\"capJavaField\":\"DeviceId\",\"columnComment\":\"器械档案ID\",\"columnId\":1,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deviceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-10-16 14:43:27\",\"usableColumn\":false},{\"capJavaField\":\"DeviceName\",\"columnComment\":\"器械名称\",\"columnId\":2,\"columnName\":\"device_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-10-16 14:43:27\",\"usableColumn\":false},{\"capJavaField\":\"DeviceCode\",\"columnComment\":\"器械编号/型号\",\"columnId\":3,\"columnName\":\"device_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-10-16 14:43:27\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"器械分类（字典：sys_device_category）\",\"columnId\":4,\"columnName\":\"category\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:43:39', 35);
INSERT INTO `sys_oper_log` VALUES (115, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"器械分类\",\"dictType\":\"sys_device_category\",\"params\":{},\"remark\":\"医疗器械分类\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:45:10', 10);
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"高值耗材\",\"dictSort\":1,\"dictType\":\"sys_device_category\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"例如：支架、人工关节\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:45:54', 8);
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"低值耗材\",\"dictSort\":2,\"dictType\":\"sys_device_category\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"例如：纱布、手套\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:46:05', 13);
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"医疗设备\",\"dictSort\":3,\"dictType\":\"sys_device_category\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"remark\":\"例如：监护仪、呼吸机\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:46:15', 16);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"TbDeviceInfo\",\"columns\":[{\"capJavaField\":\"DeviceId\",\"columnComment\":\"器械档案ID\",\"columnId\":1,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deviceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-10-16 14:43:39\",\"usableColumn\":false},{\"capJavaField\":\"DeviceName\",\"columnComment\":\"器械名称\",\"columnId\":2,\"columnName\":\"device_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-10-16 14:43:39\",\"usableColumn\":false},{\"capJavaField\":\"DeviceCode\",\"columnComment\":\"器械编号/型号\",\"columnId\":3,\"columnName\":\"device_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-10-16 14:43:39\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"器械分类（字典：sys_device_category）\",\"columnId\":4,\"columnName\":\"category\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"sys_de', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 14:46:42', 17);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_device_info\"}', NULL, 0, NULL, '2025-10-16 14:47:13', 164);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/info\",\"createTime\":\"2025-10-16 14:05:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"器械档案维护\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"/device-info-mgt/info\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 15:17:01', 18);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/info/index\",\"createTime\":\"2025-10-16 14:05:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"器械档案维护\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"/device-info-mgt/info\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 15:17:23', 9);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/info/index\",\"createTime\":\"2025-10-16 14:05:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"器械档案维护\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"tb_device_info\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 16:12:59', 19);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/info/index\",\"createTime\":\"2025-10-16 14:05:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"器械档案维护\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"tb_device_info\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 17:07:50', 16);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"DeviceInfo\",\"columns\":[{\"capJavaField\":\"DeviceId\",\"columnComment\":\"器械档案ID\",\"columnId\":1,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deviceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-10-16 14:46:42\",\"usableColumn\":false},{\"capJavaField\":\"DeviceName\",\"columnComment\":\"器械名称\",\"columnId\":2,\"columnName\":\"device_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-10-16 14:46:42\",\"usableColumn\":false},{\"capJavaField\":\"DeviceCode\",\"columnComment\":\"器械编号/型号\",\"columnId\":3,\"columnName\":\"device_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-10-16 14:46:42\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"器械分类（字典：sys_device_category）\",\"columnId\":4,\"columnName\":\"category\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:23:15\",\"dictType\":\"sys_devi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-16 17:55:27', 42);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_device_info\"}', NULL, 0, NULL, '2025-10-16 17:55:32', 94);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2008', '127.0.0.1', '内网IP', '2008', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-10-17 18:25:36', 6);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2015', '127.0.0.1', '内网IP', '2015', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-17 18:25:54', 19);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2016', '127.0.0.1', '内网IP', '2016', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-17 18:25:56', 9);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2017', '127.0.0.1', '内网IP', '2017', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-17 18:25:59', 5);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2018', '127.0.0.1', '内网IP', '2018', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-17 18:26:00', 15);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2019', '127.0.0.1', '内网IP', '2019', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-17 18:26:01', 15);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-17 18:26:03', 5);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2004', '127.0.0.1', '内网IP', '2004', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-17 18:27:21', 7);
INSERT INTO `sys_oper_log` VALUES (135, '器械档案', 5, 'com.ruoyi.device.controller.DeviceInfoController.export()', 'POST', 1, 'admin', '研发部门', '/device/info/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-10-17 18:27:34', 395);
INSERT INTO `sys_oper_log` VALUES (136, '器械档案', 1, 'com.ruoyi.device.controller.DeviceInfoController.add()', 'POST', 1, 'admin', '研发部门', '/device/info', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-10-17 18:27:54\",\"deviceCode\":\"1\",\"deviceId\":31,\"deviceName\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-17 18:27:54', 21);
INSERT INTO `sys_oper_log` VALUES (137, '器械档案', 3, 'com.ruoyi.device.controller.DeviceInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/device/info/31', '127.0.0.1', '内网IP', '[31]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-17 18:28:00', 5);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/info/index\",\"createTime\":\"2025-10-16 18:06:58\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"器械档案\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"info\",\"perms\":\"device:info:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-17 18:30:11', 17);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2000', '127.0.0.1', '内网IP', '2000', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-17 18:30:42', 6);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/info/index\",\"createTime\":\"2025-10-16 18:06:58\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"器械档案\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"info\",\"perms\":\"device:info:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-17 18:30:55', 18);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-10-17 18:31:09', 8);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_purchase_apply\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 15:54:13', 71);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"TbPurchaseApply\",\"columns\":[{\"capJavaField\":\"ApplyId\",\"columnComment\":\"申请单ID\",\"columnId\":30,\"columnName\":\"apply_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ApplyCode\",\"columnComment\":\"申请单号\",\"columnId\":31,\"columnName\":\"apply_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"applyCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":32,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":33,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:01:01', 63);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"PurchaseApply\",\"columns\":[{\"capJavaField\":\"ApplyId\",\"columnComment\":\"申请单ID\",\"columnId\":30,\"columnName\":\"apply_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:01:01\",\"usableColumn\":false},{\"capJavaField\":\"ApplyCode\",\"columnComment\":\"申请单号\",\"columnId\":31,\"columnName\":\"apply_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"applyCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:01:01\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":32,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:01:01\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":33,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":fals', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:01:31', 28);
INSERT INTO `sys_oper_log` VALUES (145, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"审批状态\",\"dictType\":\"sys_apply_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:05:13', 10);
INSERT INTO `sys_oper_log` VALUES (146, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"入库状态\",\"dictType\":\"sys_procure_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:05:23', 8);
INSERT INTO `sys_oper_log` VALUES (147, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"cssClass\":\"\",\"default\":false,\"dictLabel\":\"待审批\",\"dictSort\":1,\"dictType\":\"sys_apply_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:10:40', 17);
INSERT INTO `sys_oper_log` VALUES (148, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已通过\",\"dictSort\":2,\"dictType\":\"sys_apply_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:10:49', 7);
INSERT INTO `sys_oper_log` VALUES (149, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已驳回\",\"dictSort\":3,\"dictType\":\"sys_apply_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:10:56', 8);
INSERT INTO `sys_oper_log` VALUES (150, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待入库\",\"dictSort\":1,\"dictType\":\"sys_procure_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:11:17', 11);
INSERT INTO `sys_oper_log` VALUES (151, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"部分入库\",\"dictSort\":2,\"dictType\":\"sys_procure_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:11:23', 9);
INSERT INTO `sys_oper_log` VALUES (152, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已完成入库\",\"dictSort\":3,\"dictType\":\"sys_procure_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:11:30', 8);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"PurchaseApply\",\"columns\":[{\"capJavaField\":\"ApplyId\",\"columnComment\":\"申请单ID\",\"columnId\":30,\"columnName\":\"apply_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:01:31\",\"usableColumn\":false},{\"capJavaField\":\"ApplyCode\",\"columnComment\":\"申请单号\",\"columnId\":31,\"columnName\":\"apply_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"applyCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:01:31\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":32,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:01:31\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":33,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":fals', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:11:39', 36);
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"PurchaseApply\",\"columns\":[{\"capJavaField\":\"ApplyId\",\"columnComment\":\"申请单ID\",\"columnId\":30,\"columnName\":\"apply_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:11:39\",\"usableColumn\":false},{\"capJavaField\":\"ApplyCode\",\"columnComment\":\"申请单号\",\"columnId\":31,\"columnName\":\"apply_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"applyCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:11:39\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":32,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:11:39\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":33,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":f', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:21:46', 50);
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"PurchaseApply\",\"columns\":[{\"capJavaField\":\"ApplyId\",\"columnComment\":\"申请单ID\",\"columnId\":30,\"columnName\":\"apply_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:21:46\",\"usableColumn\":false},{\"capJavaField\":\"ApplyCode\",\"columnComment\":\"申请单号\",\"columnId\":31,\"columnName\":\"apply_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"applyCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:21:46\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":32,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:21:46\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":33,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":f', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:40:27', 24);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"PurchaseApply\",\"columns\":[{\"capJavaField\":\"ApplyId\",\"columnComment\":\"申请单ID\",\"columnId\":30,\"columnName\":\"apply_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:40:27\",\"usableColumn\":false},{\"capJavaField\":\"ApplyCode\",\"columnComment\":\"申请单号\",\"columnId\":31,\"columnName\":\"apply_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:40:27\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":32,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:40:27\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":33,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:43:28', 28);
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"PurchaseApply\",\"columns\":[{\"capJavaField\":\"ApplyId\",\"columnComment\":\"申请单ID\",\"columnId\":30,\"columnName\":\"apply_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:43:28\",\"usableColumn\":false},{\"capJavaField\":\"ApplyCode\",\"columnComment\":\"申请单号\",\"columnId\":31,\"columnName\":\"apply_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:43:28\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":32,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:43:28\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":33,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:44:49', 30);
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"PurchaseApply\",\"columns\":[{\"capJavaField\":\"ApplyId\",\"columnComment\":\"申请单ID\",\"columnId\":30,\"columnName\":\"apply_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:44:49\",\"usableColumn\":false},{\"capJavaField\":\"ApplyCode\",\"columnComment\":\"申请单号\",\"columnId\":31,\"columnName\":\"apply_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:44:49\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":32,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:44:49\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":33,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:47:32', 32);
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"PurchaseApply\",\"columns\":[{\"capJavaField\":\"ApplyId\",\"columnComment\":\"申请单ID\",\"columnId\":30,\"columnName\":\"apply_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:47:32\",\"usableColumn\":false},{\"capJavaField\":\"ApplyCode\",\"columnComment\":\"申请单号\",\"columnId\":31,\"columnName\":\"apply_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:47:32\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":32,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:47:32\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":33,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 16:57:20', 28);
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_purchase_apply\"}', NULL, 0, NULL, '2025-10-18 16:57:25', 175);
INSERT INTO `sys_oper_log` VALUES (161, '采购申请', 1, 'com.ruoyi.device.controller.PurchaseApplyController.add()', 'POST', 1, 'admin', '研发部门', '/device/apply', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-10-18 17:04:34\",\"deptId\":103,\"params\":{},\"requiredDate\":\"2025-10-21\",\"requiredQuantity\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value\r\n### The error may exist in file [E:\\code\\RuoYi\\backend\\ruoyi-device\\target\\classes\\mapper\\device\\PurchaseApplyMapper.xml]\r\n### The error may involve com.ruoyi.device.mapper.PurchaseApplyMapper.insertPurchaseApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_purchase_apply          ( dept_id,                          required_quantity,             required_date,                                                                                           create_time )           values ( ?,                          ?,             ?,                                                                                           ? )\r\n### Cause: java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value\n; Field \'apply_code\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value', '2025-10-18 17:04:34', 221);
INSERT INTO `sys_oper_log` VALUES (162, '采购申请', 1, 'com.ruoyi.device.controller.PurchaseApplyController.add()', 'POST', 1, 'admin', '研发部门', '/device/apply', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-10-18 17:04:35\",\"deptId\":103,\"params\":{},\"requiredDate\":\"2025-10-21\",\"requiredQuantity\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value\r\n### The error may exist in file [E:\\code\\RuoYi\\backend\\ruoyi-device\\target\\classes\\mapper\\device\\PurchaseApplyMapper.xml]\r\n### The error may involve com.ruoyi.device.mapper.PurchaseApplyMapper.insertPurchaseApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_purchase_apply          ( dept_id,                          required_quantity,             required_date,                                                                                           create_time )           values ( ?,                          ?,             ?,                                                                                           ? )\r\n### Cause: java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value\n; Field \'apply_code\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value', '2025-10-18 17:04:35', 4);
INSERT INTO `sys_oper_log` VALUES (163, '采购申请', 1, 'com.ruoyi.device.controller.PurchaseApplyController.add()', 'POST', 1, 'admin', '研发部门', '/device/apply', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-10-18 17:07:05\",\"deptId\":103,\"params\":{},\"requiredDate\":\"2025-10-31\",\"requiredQuantity\":10}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value\r\n### The error may exist in file [E:\\code\\RuoYi\\backend\\ruoyi-device\\target\\classes\\mapper\\device\\PurchaseApplyMapper.xml]\r\n### The error may involve com.ruoyi.device.mapper.PurchaseApplyMapper.insertPurchaseApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_purchase_apply          ( dept_id,                          required_quantity,             required_date,                                                                                           create_time )           values ( ?,                          ?,             ?,                                                                                           ? )\r\n### Cause: java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value\n; Field \'apply_code\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value', '2025-10-18 17:07:05', 4);
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"PurchaseApply\",\"columns\":[{\"capJavaField\":\"ApplyId\",\"columnComment\":\"申请单ID\",\"columnId\":30,\"columnName\":\"apply_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:57:20\",\"usableColumn\":false},{\"capJavaField\":\"ApplyCode\",\"columnComment\":\"申请单号\",\"columnId\":31,\"columnName\":\"apply_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"applyCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:57:20\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":32,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-10-18 16:57:20\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":33,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 15:54:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 17:11:42', 92);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_purchase_apply\"}', NULL, 0, NULL, '2025-10-18 17:12:47', 218);
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_purchase_apply\"}', NULL, 0, NULL, '2025-10-18 17:13:10', 55);
INSERT INTO `sys_oper_log` VALUES (167, '采购申请', 1, 'com.ruoyi.device.controller.PurchaseApplyController.add()', 'POST', 1, 'admin', '研发部门', '/device/apply', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-10-18 17:16:35\",\"deptId\":103,\"deviceId\":2,\"params\":{},\"requiredDate\":\"2025-10-31\",\"requiredQuantity\":10}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value\r\n### The error may exist in file [E:\\code\\RuoYi\\backend\\ruoyi-device\\target\\classes\\mapper\\device\\PurchaseApplyMapper.xml]\r\n### The error may involve com.ruoyi.device.mapper.PurchaseApplyMapper.insertPurchaseApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_purchase_apply          ( dept_id,             device_id,             required_quantity,             required_date,                                                                                           create_time )           values ( ?,             ?,             ?,             ?,                                                                                           ? )\r\n### Cause: java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value\n; Field \'apply_code\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value', '2025-10-18 17:16:35', 239);
INSERT INTO `sys_oper_log` VALUES (168, '采购申请', 1, 'com.ruoyi.device.controller.PurchaseApplyController.add()', 'POST', 1, 'admin', '研发部门', '/device/apply', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-10-18 17:17:16\",\"deptId\":103,\"deviceId\":2,\"params\":{},\"remark\":\"1\",\"requiredDate\":\"2025-10-31\",\"requiredQuantity\":10}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value\r\n### The error may exist in file [E:\\code\\RuoYi\\backend\\ruoyi-device\\target\\classes\\mapper\\device\\PurchaseApplyMapper.xml]\r\n### The error may involve com.ruoyi.device.mapper.PurchaseApplyMapper.insertPurchaseApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_purchase_apply          ( dept_id,             device_id,             required_quantity,             required_date,                                                                 remark,                          create_time )           values ( ?,             ?,             ?,             ?,                                                                 ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value\n; Field \'apply_code\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'apply_code\' doesn\'t have a default value', '2025-10-18 17:17:16', 5);
INSERT INTO `sys_oper_log` VALUES (169, '采购申请', 1, 'com.ruoyi.device.controller.PurchaseApplyController.add()', 'POST', 1, 'admin', '研发部门', '/device/apply', '127.0.0.1', '内网IP', '{\"applyCode\":\"CG20251018172532\",\"applyId\":21,\"applyStatus\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 17:25:32\",\"deptId\":103,\"deviceId\":2,\"params\":{},\"requiredDate\":\"2025-10-31\",\"requiredQuantity\":10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 17:25:33', 170);
INSERT INTO `sys_oper_log` VALUES (170, '采购申请', 1, 'com.ruoyi.device.controller.PurchaseApplyController.add()', 'POST', 1, 'admin', '研发部门', '/device/apply', '127.0.0.1', '内网IP', '{\"applyCode\":\"CG20251018172546\",\"applyId\":22,\"applyStatus\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 17:25:46\",\"deptId\":104,\"deviceId\":3,\"params\":{},\"requiredDate\":\"2025-10-30\",\"requiredQuantity\":11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-18 17:25:46', 7);
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"batch\",\"className\":\"TbInventoryBatch\",\"columns\":[{\"capJavaField\":\"BatchId\",\"columnComment\":\"批次ID\",\"columnId\":16,\"columnName\":\"batch_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"batchId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":17,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BatchNum\",\"columnComment\":\"批次号/序列号\",\"columnId\":18,\"columnName\":\"batch_num\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNum\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Supplier\",\"columnComment\":\"供应商名称\",\"columnId\":19,\"columnName\":\"supplier\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 15:38:42', 60);
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"batch\",\"className\":\"InventoryBatch\",\"columns\":[{\"capJavaField\":\"BatchId\",\"columnComment\":\"批次ID\",\"columnId\":16,\"columnName\":\"batch_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"batchId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:38:42\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":17,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:38:42\",\"usableColumn\":false},{\"capJavaField\":\"BatchNum\",\"columnComment\":\"批次号/序列号\",\"columnId\":18,\"columnName\":\"batch_num\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNum\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:38:42\",\"usableColumn\":false},{\"capJavaField\":\"Supplier\",\"columnComment\":\"供应商名称\",\"columnId\":19,\"columnName\":\"supplier\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 15:39:07', 31);
INSERT INTO `sys_oper_log` VALUES (173, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"批次状态\",\"dictType\":\"sys_batch_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 15:40:06', 19);
INSERT INTO `sys_oper_log` VALUES (174, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"在库\",\"dictSort\":1,\"dictType\":\"sys_batch_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 15:40:21', 8);
INSERT INTO `sys_oper_log` VALUES (175, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"出库完毕\",\"dictSort\":2,\"dictType\":\"sys_batch_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 15:40:30', 15);
INSERT INTO `sys_oper_log` VALUES (176, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已过期\",\"dictSort\":3,\"dictType\":\"sys_batch_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 15:40:37', 18);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"batch\",\"className\":\"InventoryBatch\",\"columns\":[{\"capJavaField\":\"BatchId\",\"columnComment\":\"批次ID\",\"columnId\":16,\"columnName\":\"batch_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"batchId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:39:07\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":17,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:39:07\",\"usableColumn\":false},{\"capJavaField\":\"BatchNum\",\"columnComment\":\"批次号/序列号\",\"columnId\":18,\"columnName\":\"batch_num\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNum\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:39:07\",\"usableColumn\":false},{\"capJavaField\":\"Supplier\",\"columnComment\":\"供应商名称\",\"columnId\":19,\"columnName\":\"supplier\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increm', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 15:44:26', 51);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"batch\",\"className\":\"InventoryBatch\",\"columns\":[{\"capJavaField\":\"BatchId\",\"columnComment\":\"批次ID\",\"columnId\":16,\"columnName\":\"batch_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"batchId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:44:26\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":17,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:44:26\",\"usableColumn\":false},{\"capJavaField\":\"BatchNum\",\"columnComment\":\"批次号/序列号\",\"columnId\":18,\"columnName\":\"batch_num\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNum\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:44:26\",\"usableColumn\":false},{\"capJavaField\":\"Supplier\",\"columnComment\":\"供应商名称\",\"columnId\":19,\"columnName\":\"supplier\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increm', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 15:44:53', 20);
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_inventory_batch\"}', NULL, 0, NULL, '2025-10-19 15:45:29', 114);
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"batch\",\"className\":\"InventoryBatch\",\"columns\":[{\"capJavaField\":\"BatchId\",\"columnComment\":\"批次ID\",\"columnId\":16,\"columnName\":\"batch_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"batchId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:44:53\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":17,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:44:53\",\"usableColumn\":false},{\"capJavaField\":\"BatchNum\",\"columnComment\":\"批次号/序列号\",\"columnId\":18,\"columnName\":\"batch_num\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNum\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:44:53\",\"usableColumn\":false},{\"capJavaField\":\"Supplier\",\"columnComment\":\"供应商名称\",\"columnId\":19,\"columnName\":\"supplier\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increm', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 15:48:53', 31);
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_inventory_batch\"}', NULL, 0, NULL, '2025-10-19 15:48:56', 56);
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"batch\",\"className\":\"InventoryBatch\",\"columns\":[{\"capJavaField\":\"BatchId\",\"columnComment\":\"批次ID\",\"columnId\":16,\"columnName\":\"batch_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"batchId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:48:53\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"关联器械ID\",\"columnId\":17,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:48:53\",\"usableColumn\":false},{\"capJavaField\":\"BatchNum\",\"columnComment\":\"批次号/序列号\",\"columnId\":18,\"columnName\":\"batch_num\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"batchNum\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 15:48:53\",\"usableColumn\":false},{\"capJavaField\":\"Supplier\",\"columnComment\":\"供应商名称\",\"columnId\":19,\"columnName\":\"supplier\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 13:41:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"incr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 15:56:27', 65);
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_inventory_batch\"}', NULL, 0, NULL, '2025-10-19 15:56:29', 179);
INSERT INTO `sys_oper_log` VALUES (184, '库存批次', 1, 'com.ruoyi.device.controller.InventoryBatchController.add()', 'POST', 1, 'admin', '研发部门', '/device/batch', '127.0.0.1', '内网IP', '{\"batchId\":26,\"batchNum\":\"B20251019026\",\"createTime\":\"2025-10-19 16:12:27\",\"deviceId\":3,\"expiryDate\":\"2025-10-31 00:00:00\",\"inboundQuantity\":100,\"inboundTime\":\"2025-10-19 00:00:00\",\"params\":{},\"supplier\":\"刘博文\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 16:12:27', 85);
INSERT INTO `sys_oper_log` VALUES (185, '库存批次', 3, 'com.ruoyi.device.controller.InventoryBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/device/batch/26', '127.0.0.1', '内网IP', '[26]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 16:28:45', 17);
INSERT INTO `sys_oper_log` VALUES (186, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_purchase_apply\"}', NULL, 0, NULL, '2025-10-19 17:30:26', 162);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2021', '127.0.0.1', '内网IP', '2021', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:34:39', 33);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2022', '127.0.0.1', '内网IP', '2022', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:34:40', 8);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2024', '127.0.0.1', '内网IP', '2024', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:34:42', 9);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2023', '127.0.0.1', '内网IP', '2023', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:34:43', 19);
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2025', '127.0.0.1', '内网IP', '2025', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:34:45', 13);
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2020', '127.0.0.1', '内网IP', '2020', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:34:47', 6);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2039', '127.0.0.1', '内网IP', '2039', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:34:59', 8);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2040', '127.0.0.1', '内网IP', '2040', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:35:00', 9);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2041', '127.0.0.1', '内网IP', '2041', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:35:01', 20);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2042', '127.0.0.1', '内网IP', '2042', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:35:03', 10);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2043', '127.0.0.1', '内网IP', '2043', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:35:04', 9);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2038', '127.0.0.1', '内网IP', '2038', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:35:06', 15);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2026', '127.0.0.1', '内网IP', '2026', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-10-19 17:35:11', 2);
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2027', '127.0.0.1', '内网IP', '2027', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:35:16', 9);
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2028', '127.0.0.1', '内网IP', '2028', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:35:17', 23);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2029', '127.0.0.1', '内网IP', '2029', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:35:19', 17);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2030', '127.0.0.1', '内网IP', '2030', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:35:21', 20);
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2031', '127.0.0.1', '内网IP', '2031', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:35:22', 10);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2026', '127.0.0.1', '内网IP', '2026', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:35:24', 7);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2005', '127.0.0.1', '内网IP', '2005', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:36:34', 18);
INSERT INTO `sys_oper_log` VALUES (207, '库存批次', 1, 'com.ruoyi.device.controller.InventoryBatchController.add()', 'POST', 1, 'admin', '研发部门', '/device/batch', '127.0.0.1', '内网IP', '{\"batchId\":27,\"batchNum\":\"B20251019027\",\"createTime\":\"2025-10-19 17:56:08\",\"deviceId\":1,\"expiryDate\":\"2028-10-07 00:00:00\",\"inboundQuantity\":100,\"inboundTime\":\"2025-10-19 00:00:00\",\"params\":{},\"supplier\":\"华北医疗器械有限公司\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:56:09', 175);
INSERT INTO `sys_oper_log` VALUES (208, '库存批次', 3, 'com.ruoyi.device.controller.InventoryBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/device/batch/27', '127.0.0.1', '内网IP', '[27]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 17:56:27', 17);
INSERT INTO `sys_oper_log` VALUES (209, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_requisition_apply\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 18:01:23', 74);
INSERT INTO `sys_oper_log` VALUES (210, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"RequisitionApply\",\"columns\":[{\"capJavaField\":\"RequisitionId\",\"columnComment\":\"领用申请ID\",\"columnId\":45,\"columnName\":\"requisition_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"requisitionId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RequisitionCode\",\"columnComment\":\"领用单号\",\"columnId\":46,\"columnName\":\"requisition_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"requisitionCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":47,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"申请器材ID\",\"columnId\":48,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 18:02:02', 48);
INSERT INTO `sys_oper_log` VALUES (211, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"出入库\",\"dictType\":\"sys_requisition_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 18:03:09', 22);
INSERT INTO `sys_oper_log` VALUES (212, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待审核\",\"dictSort\":1,\"dictType\":\"sys_requisition_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 18:03:27', 20);
INSERT INTO `sys_oper_log` VALUES (213, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已出库\",\"dictSort\":2,\"dictType\":\"sys_requisition_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 18:03:33', 7);
INSERT INTO `sys_oper_log` VALUES (214, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已驳回\",\"dictSort\":3,\"dictType\":\"sys_requisition_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 18:03:43', 17);
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"RequisitionApply\",\"columns\":[{\"capJavaField\":\"RequisitionId\",\"columnComment\":\"领用申请ID\",\"columnId\":45,\"columnName\":\"requisition_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"requisitionId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 18:02:02\",\"usableColumn\":false},{\"capJavaField\":\"RequisitionCode\",\"columnComment\":\"领用单号\",\"columnId\":46,\"columnName\":\"requisition_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"requisitionCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 18:02:02\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":47,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 18:02:02\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"申请器材ID\",\"columnId\":48,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"ed', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 18:06:30', 42);
INSERT INTO `sys_oper_log` VALUES (216, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apply\",\"className\":\"RequisitionApply\",\"columns\":[{\"capJavaField\":\"RequisitionId\",\"columnComment\":\"领用申请ID\",\"columnId\":45,\"columnName\":\"requisition_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"requisitionId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 18:06:30\",\"usableColumn\":false},{\"capJavaField\":\"RequisitionCode\",\"columnComment\":\"领用单号\",\"columnId\":46,\"columnName\":\"requisition_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"requisitionCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 18:06:30\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":47,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 18:06:30\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"申请器材ID\",\"columnId\":48,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"ed', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 18:09:43', 47);
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_requisition_apply\"}', NULL, 0, NULL, '2025-10-19 18:12:18', 180);
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"requisition\",\"className\":\"RequisitionApply\",\"columns\":[{\"capJavaField\":\"RequisitionId\",\"columnComment\":\"领用申请ID\",\"columnId\":45,\"columnName\":\"requisition_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"requisitionId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 18:09:43\",\"usableColumn\":false},{\"capJavaField\":\"RequisitionCode\",\"columnComment\":\"领用单号\",\"columnId\":46,\"columnName\":\"requisition_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"requisitionCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 18:09:43\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":47,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 18:09:43\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"申请器材ID\",\"columnId\":48,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 18:17:46', 84);
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_requisition_apply\"}', NULL, 0, NULL, '2025-10-19 18:17:48', 191);
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"requisition\",\"className\":\"RequisitionApply\",\"columns\":[{\"capJavaField\":\"RequisitionId\",\"columnComment\":\"领用申请ID\",\"columnId\":45,\"columnName\":\"requisition_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"requisitionId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 18:17:46\",\"usableColumn\":false},{\"capJavaField\":\"RequisitionCode\",\"columnComment\":\"领用单号\",\"columnId\":46,\"columnName\":\"requisition_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"requisitionCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 18:17:46\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"申请科室ID\",\"columnId\":47,\"columnName\":\"dept_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-10-19 18:17:46\",\"usableColumn\":false},{\"capJavaField\":\"DeviceId\",\"columnComment\":\"申请器材ID\",\"columnId\":48,\"columnName\":\"device_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-19 18:01:23\",\"dictType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 18:31:02', 88);
INSERT INTO `sys_oper_log` VALUES (221, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_requisition_apply\"}', NULL, 0, NULL, '2025-10-19 18:31:15', 166);
INSERT INTO `sys_oper_log` VALUES (222, '科室领用申请单', 1, 'com.ruoyi.device.controller.RequisitionApplyController.add()', 'POST', 1, 'admin', '研发部门', '/device/requisition', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-10-19 19:41:45\",\"deptId\":101,\"deviceId\":1,\"params\":{},\"remark\":\"111\",\"requisitionQuantity\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'requisition_status\' doesn\'t have a default value\r\n### The error may exist in file [E:\\code\\RuoYi\\backend\\ruoyi-device\\target\\classes\\mapper\\device\\RequisitionApplyMapper.xml]\r\n### The error may involve com.ruoyi.device.mapper.RequisitionApplyMapper.insertRequisitionApply-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_requisition_apply          ( dept_id,             device_id,             requisition_quantity,                                                    remark,                          create_time )           values ( ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'requisition_status\' doesn\'t have a default value\n; Field \'requisition_status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'requisition_status\' doesn\'t have a default value', '2025-10-19 19:41:45', 131);
INSERT INTO `sys_oper_log` VALUES (223, '科室领用申请单', 1, 'com.ruoyi.device.controller.RequisitionApplyController.add()', 'POST', 1, 'admin', '研发部门', '/device/requisition', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-10-19 19:50:43\",\"deptId\":101,\"deviceId\":1,\"params\":{},\"remark\":\"test\",\"requisitionCode\":\"LY20251019195043\",\"requisitionId\":21,\"requisitionQuantity\":10,\"requisitionStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 19:50:43', 178);
INSERT INTO `sys_oper_log` VALUES (224, '科室领用申请单', 3, 'com.ruoyi.device.controller.RequisitionApplyController.remove()', 'DELETE', 1, 'admin', '研发部门', '/device/requisition/21', '127.0.0.1', '内网IP', '[21]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-19 19:50:59', 7);
INSERT INTO `sys_oper_log` VALUES (225, '采购申请', 1, 'com.ruoyi.device.controller.PurchaseApplyController.add()', 'POST', 1, 'admin', '研发部门', '/device/apply', '127.0.0.1', '内网IP', '{\"applyCode\":\"CG20251020002745\",\"applyId\":21,\"applyStatus\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2025-10-20 00:27:45\",\"deptId\":103,\"deviceId\":1,\"params\":{},\"requiredDate\":\"2025-10-22\",\"requiredQuantity\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 00:27:45', 44);
INSERT INTO `sys_oper_log` VALUES (226, '采购申请', 3, 'com.ruoyi.device.controller.PurchaseApplyController.remove()', 'DELETE', 1, 'admin', '研发部门', '/device/apply/21', '127.0.0.1', '内网IP', '[21]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 00:28:02', 51);
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"采购审批\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2014,\"perms\":\"device:apply:approve\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 00:56:29', 242);
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2045', '127.0.0.1', '内网IP', '2045', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:01:58', 20);
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2046', '127.0.0.1', '内网IP', '2046', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:02:00', 12);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2047', '127.0.0.1', '内网IP', '2047', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:02:01', 10);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2048', '127.0.0.1', '内网IP', '2048', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:02:02', 10);
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2049', '127.0.0.1', '内网IP', '2049', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:02:05', 7);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2044', '127.0.0.1', '内网IP', '2044', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:02:07', 10);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2006', '127.0.0.1', '内网IP', '2006', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:02:16', 15);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2007', '127.0.0.1', '内网IP', '2007', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:02:18', 7);
INSERT INTO `sys_oper_log` VALUES (236, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2008,2001,2014,2002,2056,2009,2015,2016,2057,2058],\"params\":{},\"remark\":\"这个角色是系统中最基础的使用者，通常是医院各个科室的护士或工作人员，他们的核心需求是申请物资。\\n\",\"roleId\":3,\"roleKey\":\"requester\",\"roleName\":\"科室领用员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:06:06', 37);
INSERT INTO `sys_oper_log` VALUES (237, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2014,2002,2056,2008,2009,2010,2011,2012,2013,2015,2032,2033,2034,2035,2036,2037,2057,2059],\"params\":{},\"remark\":\"这个角色是系统的核心操作者，负责所有物资的出入库管理和库存维护。\",\"roleId\":4,\"roleKey\":\"storekeeper\",\"roleName\":\"库管员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:08:47', 27);
INSERT INTO `sys_oper_log` VALUES (238, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2014,2062,2015,2016,2017,2018,2019,2032,2033,2034,2035,2036,2037,2002,2056,2057,2058,2059,2060,2061],\"params\":{},\"remark\":\"这个角色是系统的高级管理者，通常是采购部门或设备科的负责人，拥有审批和监督的权限。\",\"roleId\":5,\"roleKey\":\"approver\",\"roleName\":\"院级管理员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:10:31', 19);
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2050', '127.0.0.1', '内网IP', '2050', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-10-20 01:19:02', 5);
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2051', '127.0.0.1', '内网IP', '2051', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:19:10', 12);
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2052', '127.0.0.1', '内网IP', '2052', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:19:12', 7);
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2053', '127.0.0.1', '内网IP', '2053', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:19:13', 8);
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2054', '127.0.0.1', '内网IP', '2054', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:19:15', 8);
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2055', '127.0.0.1', '内网IP', '2055', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:19:16', 10);
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2050', '127.0.0.1', '内网IP', '2050', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:19:18', 8);
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/requisition/index\",\"createTime\":\"2025-10-19 18:31:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2056,\"menuName\":\"领用审批\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"requisition\",\"perms\":\"device:requisition:approve\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:34:06', 23);
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/requisition/index\",\"createTime\":\"2025-10-19 18:31:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2056,\"menuName\":\"领用审批\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"requisition\",\"perms\":\"device:requisition:approve\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:35:10', 10);
INSERT INTO `sys_oper_log` VALUES (248, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/requisition/index\",\"createTime\":\"2025-10-19 18:31:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2056,\"menuName\":\"领用审批\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"requisition\",\"perms\":\"device:requisition:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:36:26', 10);
INSERT INTO `sys_oper_log` VALUES (249, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"领用审批\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2056,\"perms\":\"device:requisition:approve\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:37:05', 12);
INSERT INTO `sys_oper_log` VALUES (250, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/requisition/index\",\"createTime\":\"2025-10-19 18:31:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2056,\"menuName\":\"科室领用申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"requisition\",\"perms\":\"device:requisition:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:37:25', 11);
INSERT INTO `sys_oper_log` VALUES (251, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-10-20 01:08:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2014,2002,2056,2008,2009,2010,2011,2012,2013,2015,2032,2033,2034,2035,2036,2037,2057,2063,2059],\"params\":{},\"remark\":\"这个角色是系统的核心操作者，负责所有物资的出入库管理和库存维护。\",\"roleId\":4,\"roleKey\":\"storekeeper\",\"roleName\":\"库管员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:37:54', 30);
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/batch/index\",\"createTime\":\"2025-10-19 15:49:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"库存批次\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"batch\",\"perms\":\"device:batch:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:49:14', 9);
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/requisition/index\",\"createTime\":\"2025-10-19 18:31:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2056,\"menuName\":\"科室领用申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"requisition\",\"perms\":\"device:requisition:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 01:50:35', 7);
INSERT INTO `sys_oper_log` VALUES (254, '科室领用申请单', 5, 'com.ruoyi.device.controller.RequisitionApplyController.export()', 'POST', 1, 'admin', '研发部门', '/device/requisition/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"2\"}', NULL, 0, NULL, '2025-10-20 01:51:41', 471);
INSERT INTO `sys_oper_log` VALUES (255, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/101', '127.0.0.1', '内网IP', '101', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2025-10-20 03:37:11', 6);
INSERT INTO `sys_oper_log` VALUES (256, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '108', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 03:45:59', 12);
INSERT INTO `sys_oper_log` VALUES (257, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '109', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 03:46:00', 16);
INSERT INTO `sys_oper_log` VALUES (258, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 03:46:02', 4);
INSERT INTO `sys_oper_log` VALUES (259, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '107', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 03:46:03', 7);
INSERT INTO `sys_oper_log` VALUES (260, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '106', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 03:46:04', 6);
INSERT INTO `sys_oper_log` VALUES (261, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '105', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-10-20 03:46:06', 3);
INSERT INTO `sys_oper_log` VALUES (262, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '104', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 03:46:11', 5);
INSERT INTO `sys_oper_log` VALUES (263, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '103', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-10-20 03:46:12', 2);
INSERT INTO `sys_oper_log` VALUES (264, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"临床科室\",\"orderNum\":0,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 03:46:27', 12);
INSERT INTO `sys_oper_log` VALUES (265, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"医技科室\",\"orderNum\":0,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 03:46:39', 11);
INSERT INTO `sys_oper_log` VALUES (266, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"行政后勤\",\"orderNum\":0,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 03:46:48', 5);
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-10-16 14:04:20\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"报表分析\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"/device/dashboard/index\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 03:53:45', 42);
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"医疗器械管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"device\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:22:42', 29);
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-10-20 14:22:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2064,\"menuName\":\"医疗器械管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"device\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:22:52', 9);
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/info/index\",\"createTime\":\"2025-10-16 18:06:58\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"器械档案\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2064,\"path\":\"info\",\"perms\":\"device:info:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:23:13', 19);
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/info/index\",\"createTime\":\"2025-10-16 18:06:58\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"器械信息\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2064,\"path\":\"info\",\"perms\":\"device:info:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:23:53', 6);
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/apply/index\",\"createTime\":\"2025-10-18 17:01:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"采购申请\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2064,\"path\":\"apply\",\"perms\":\"device:apply:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:24:18', 9);
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/info/index\",\"createTime\":\"2025-10-16 18:06:58\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"器械信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2064,\"path\":\"info\",\"perms\":\"device:info:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:24:25', 6);
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/apply/index\",\"createTime\":\"2025-10-18 17:01:30\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"采购申请\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2064,\"path\":\"apply\",\"perms\":\"device:apply:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:24:40', 6);
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/info/index\",\"createTime\":\"2025-10-16 18:06:58\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"器械信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2064,\"path\":\"info\",\"perms\":\"device:info:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:24:47', 6);
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/requisition/index\",\"createTime\":\"2025-10-19 18:31:38\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2056,\"menuName\":\"领用管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2064,\"path\":\"requisition\",\"perms\":\"device:requisition:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:25:21', 6);
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/batch/index\",\"createTime\":\"2025-10-19 15:49:25\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"批次管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"batch\",\"perms\":\"device:batch:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:25:38', 7);
INSERT INTO `sys_oper_log` VALUES (278, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/batch/index\",\"createTime\":\"2025-10-19 15:49:25\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"批次管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2064,\"path\":\"batch\",\"perms\":\"device:batch:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:25:47', 5);
INSERT INTO `sys_oper_log` VALUES (279, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-10-16 14:04:20\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"报表分析\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"/device/dashboard\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:29:38', 8);
INSERT INTO `sys_oper_log` VALUES (280, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-10-16 14:04:20\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"报表分析\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"device/dashboard/index\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:35:26', 19);
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/dashboard/index\",\"createTime\":\"2025-10-16 14:04:20\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"报表分析\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"dashboard\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:35:44', 10);
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/dashboard/index\",\"createTime\":\"2025-10-16 14:04:20\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"报表分析\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"dashboard\",\"perms\":\"device:dashboard:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:35:59', 8);
INSERT INTO `sys_oper_log` VALUES (283, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/dashboard/index\",\"createTime\":\"2025-10-16 14:04:20\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"报表分析\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2064,\"path\":\"dashboard\",\"perms\":\"device:dashboard:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:58:04', 8);
INSERT INTO `sys_oper_log` VALUES (284, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-10-20 14:58:10', 23);
INSERT INTO `sys_oper_log` VALUES (285, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-10-20 01:06:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2064,2008,2014,2056,2009,2015,2016,2057,2058],\"params\":{},\"remark\":\"这个角色是系统中最基础的使用者，通常是医院各个科室的护士或工作人员，他们的核心需求是申请物资。\\n\",\"roleId\":3,\"roleKey\":\"requester\",\"roleName\":\"科室领用员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 14:58:24', 38);
INSERT INTO `sys_oper_log` VALUES (286, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-10-20 01:06:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2064,2008,2014,2056,2009,2015,2016,2057,2058,2003],\"params\":{},\"remark\":\"这个角色是系统中最基础的使用者，通常是医院各个科室的护士或工作人员，他们的核心需求是申请物资。\\n\",\"roleId\":3,\"roleKey\":\"requester\",\"roleName\":\"科室领用员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:01:17', 17);
INSERT INTO `sys_oper_log` VALUES (287, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-10-20 01:06:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2064,2008,2014,2056,2009,2015,2016,2057,2058],\"params\":{},\"remark\":\"这个角色是系统中最基础的使用者，通常是医院各个科室的护士或工作人员，他们的核心需求是申请物资。\\n\",\"roleId\":3,\"roleKey\":\"requester\",\"roleName\":\"科室领用员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:01:58', 16);
INSERT INTO `sys_oper_log` VALUES (288, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-10-20 01:08:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2064,2014,2056,2008,2009,2010,2011,2012,2013,2015,2057,2063,2059,2032,2033,2034,2035,2036,2037,2003],\"params\":{},\"remark\":\"这个角色是系统的核心操作者，负责所有物资的出入库管理和库存维护。\",\"roleId\":4,\"roleKey\":\"storekeeper\",\"roleName\":\"库管员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:02:36', 25);
INSERT INTO `sys_oper_log` VALUES (289, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-10-20 01:10:31\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2064,2008,2009,2010,2011,2012,2013,2014,2062,2015,2016,2017,2018,2019,2056,2057,2063,2058,2059,2060,2061,2032,2033,2034,2035,2036,2037,2003],\"params\":{},\"remark\":\"这个角色是系统的高级管理者，通常是采购部门或设备科的负责人，拥有审批和监督的权限。\",\"roleId\":5,\"roleKey\":\"approver\",\"roleName\":\"院级管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:02:43', 13);
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:03:01', 9);
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2001', '127.0.0.1', '内网IP', '2001', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:03:03', 6);
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-10-20 15:03:05', 4);
INSERT INTO `sys_oper_log` VALUES (293, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '105', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-10-20 15:16:15', 10);
INSERT INTO `sys_oper_log` VALUES (294, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-10-16 09:12:57\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@qq.com\",\"loginDate\":\"2025-10-16 09:12:57\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[],\"pwdUpdateDate\":\"2025-10-16 09:12:57\",\"remark\":\"测试员\",\"roleIds\":[],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:16:30', 53);
INSERT INTO `sys_oper_log` VALUES (295, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:16:32', 10);
INSERT INTO `sys_oper_log` VALUES (296, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '105', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:16:42', 9);
INSERT INTO `sys_oper_log` VALUES (297, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '103', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-10-20 15:16:44', 5);
INSERT INTO `sys_oper_log` VALUES (298, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"临床\",\"email\":\"\",\"leader\":\"\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:17:54', 11);
INSERT INTO `sys_oper_log` VALUES (299, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"内科\",\"email\":\"\",\"leader\":\"\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:24:56', 19);
INSERT INTO `sys_oper_log` VALUES (300, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"外科妇\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:25:33', 9);
INSERT INTO `sys_oper_log` VALUES (301, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"产科\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:25:39', 16);
INSERT INTO `sys_oper_log` VALUES (302, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"儿科\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:25:44', 9);
INSERT INTO `sys_oper_log` VALUES (303, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"急诊科\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:25:48', 5);
INSERT INTO `sys_oper_log` VALUES (304, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":116,\"nickName\":\"王护士\",\"params\":{},\"postIds\":[],\"roleIds\":[3],\"status\":\"0\",\"userId\":3,\"userName\":\"requester_w\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:30:53', 87);
INSERT INTO `sys_oper_log` VALUES (305, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":115,\"nickName\":\"李医生\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":4,\"userName\":\"requester_l\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:31:21', 73);
INSERT INTO `sys_oper_log` VALUES (306, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"库管员A\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":5,\"userName\":\"storekeeper_a\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:31:44', 77);
INSERT INTO `sys_oper_log` VALUES (307, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"库管员B\",\"params\":{},\"postIds\":[],\"roleIds\":[4],\"status\":\"0\",\"userId\":6,\"userName\":\"storekeeper_b\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:31:56', 81);
INSERT INTO `sys_oper_log` VALUES (308, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-10-20 15:31:44\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"库管员A\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[4],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":5,\"userName\":\"storekeeper_a\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:32:02', 10);
INSERT INTO `sys_oper_log` VALUES (309, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-10-20 15:31:21\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":115,\"deptName\":\"儿科\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":115,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"李医生\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[3],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":4,\"userName\":\"requester_l\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:32:07', 22);
INSERT INTO `sys_oper_log` VALUES (310, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"刘院长\",\"params\":{},\"postIds\":[],\"roleIds\":[5],\"status\":\"0\",\"userId\":7,\"userName\":\"approver\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 15:32:41', 86);
INSERT INTO `sys_oper_log` VALUES (311, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-10-20 01:10:31\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2064,2008,2009,2010,2011,2012,2013,2014,2062,2015,2016,2017,2018,2019,2056,2057,2063,2058,2059,2060,2061,2032,2033,2034,2035,2036,2037,2003,103,1016,1017,1018,1019],\"params\":{},\"remark\":\"这个角色是系统的高级管理者，通常是采购部门或设备科的负责人，拥有审批和监督的权限。\",\"roleId\":5,\"roleKey\":\"approver\",\"roleName\":\"院级管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 18:26:58', 34);
INSERT INTO `sys_oper_log` VALUES (312, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-10-20 01:10:31\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,103,2064,2008,2009,2010,2011,2012,2013,2014,2062,2015,2016,2017,2018,2019,2056,2057,2063,2058,2059,2060,2061,2032,2033,2034,2035,2036,2037,2003,1016],\"params\":{},\"remark\":\"这个角色是系统的高级管理者，通常是采购部门或设备科的负责人，拥有审批和监督的权限。\",\"roleId\":5,\"roleKey\":\"approver\",\"roleName\":\"院级管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 18:28:07', 18);
INSERT INTO `sys_oper_log` VALUES (313, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-10-20 01:06:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2064,2008,2014,2056,1,101,2009,2015,2016,2057,2058,1007],\"params\":{},\"remark\":\"这个角色是系统中最基础的使用者，通常是医院各个科室的护士或工作人员，他们的核心需求是申请物资。\\n\",\"roleId\":3,\"roleKey\":\"requester\",\"roleName\":\"科室领用员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 18:28:55', 15);
INSERT INTO `sys_oper_log` VALUES (314, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-10-20 01:08:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2064,2014,2056,1,101,2008,2009,2010,2011,2012,2013,2015,2057,2063,2059,2032,2033,2034,2035,2036,2037,2003,1007],\"params\":{},\"remark\":\"这个角色是系统的核心操作者，负责所有物资的出入库管理和库存维护。\",\"roleId\":4,\"roleKey\":\"storekeeper\",\"roleName\":\"库管员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-20 18:29:04', 13);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-10-16 09:12:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-10-16 09:12:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-10-16 09:12:57', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '科室领用员', 'requester', 0, '1', 1, 1, '0', '0', 'admin', '2025-10-20 01:06:06', 'admin', '2025-10-20 18:28:55', '这个角色是系统中最基础的使用者，通常是医院各个科室的护士或工作人员，他们的核心需求是申请物资。\n');
INSERT INTO `sys_role` VALUES (4, '库管员', 'storekeeper', 0, '1', 1, 1, '0', '0', 'admin', '2025-10-20 01:08:47', 'admin', '2025-10-20 18:29:04', '这个角色是系统的核心操作者，负责所有物资的出入库管理和库存维护。');
INSERT INTO `sys_role` VALUES (5, '院级管理员', 'approver', 0, '1', 1, 1, '0', '0', 'admin', '2025-10-20 01:10:31', 'admin', '2025-10-20 18:28:07', '这个角色是系统的高级管理者，通常是采购部门或设备科的负责人，拥有审批和监督的权限。');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 2008);
INSERT INTO `sys_role_menu` VALUES (3, 2009);
INSERT INTO `sys_role_menu` VALUES (3, 2014);
INSERT INTO `sys_role_menu` VALUES (3, 2015);
INSERT INTO `sys_role_menu` VALUES (3, 2016);
INSERT INTO `sys_role_menu` VALUES (3, 2056);
INSERT INTO `sys_role_menu` VALUES (3, 2057);
INSERT INTO `sys_role_menu` VALUES (3, 2058);
INSERT INTO `sys_role_menu` VALUES (3, 2064);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 101);
INSERT INTO `sys_role_menu` VALUES (4, 1007);
INSERT INTO `sys_role_menu` VALUES (4, 2003);
INSERT INTO `sys_role_menu` VALUES (4, 2008);
INSERT INTO `sys_role_menu` VALUES (4, 2009);
INSERT INTO `sys_role_menu` VALUES (4, 2010);
INSERT INTO `sys_role_menu` VALUES (4, 2011);
INSERT INTO `sys_role_menu` VALUES (4, 2012);
INSERT INTO `sys_role_menu` VALUES (4, 2013);
INSERT INTO `sys_role_menu` VALUES (4, 2014);
INSERT INTO `sys_role_menu` VALUES (4, 2015);
INSERT INTO `sys_role_menu` VALUES (4, 2032);
INSERT INTO `sys_role_menu` VALUES (4, 2033);
INSERT INTO `sys_role_menu` VALUES (4, 2034);
INSERT INTO `sys_role_menu` VALUES (4, 2035);
INSERT INTO `sys_role_menu` VALUES (4, 2036);
INSERT INTO `sys_role_menu` VALUES (4, 2037);
INSERT INTO `sys_role_menu` VALUES (4, 2056);
INSERT INTO `sys_role_menu` VALUES (4, 2057);
INSERT INTO `sys_role_menu` VALUES (4, 2059);
INSERT INTO `sys_role_menu` VALUES (4, 2063);
INSERT INTO `sys_role_menu` VALUES (4, 2064);
INSERT INTO `sys_role_menu` VALUES (5, 1);
INSERT INTO `sys_role_menu` VALUES (5, 103);
INSERT INTO `sys_role_menu` VALUES (5, 1016);
INSERT INTO `sys_role_menu` VALUES (5, 2003);
INSERT INTO `sys_role_menu` VALUES (5, 2008);
INSERT INTO `sys_role_menu` VALUES (5, 2009);
INSERT INTO `sys_role_menu` VALUES (5, 2010);
INSERT INTO `sys_role_menu` VALUES (5, 2011);
INSERT INTO `sys_role_menu` VALUES (5, 2012);
INSERT INTO `sys_role_menu` VALUES (5, 2013);
INSERT INTO `sys_role_menu` VALUES (5, 2014);
INSERT INTO `sys_role_menu` VALUES (5, 2015);
INSERT INTO `sys_role_menu` VALUES (5, 2016);
INSERT INTO `sys_role_menu` VALUES (5, 2017);
INSERT INTO `sys_role_menu` VALUES (5, 2018);
INSERT INTO `sys_role_menu` VALUES (5, 2019);
INSERT INTO `sys_role_menu` VALUES (5, 2032);
INSERT INTO `sys_role_menu` VALUES (5, 2033);
INSERT INTO `sys_role_menu` VALUES (5, 2034);
INSERT INTO `sys_role_menu` VALUES (5, 2035);
INSERT INTO `sys_role_menu` VALUES (5, 2036);
INSERT INTO `sys_role_menu` VALUES (5, 2037);
INSERT INTO `sys_role_menu` VALUES (5, 2056);
INSERT INTO `sys_role_menu` VALUES (5, 2057);
INSERT INTO `sys_role_menu` VALUES (5, 2058);
INSERT INTO `sys_role_menu` VALUES (5, 2059);
INSERT INTO `sys_role_menu` VALUES (5, 2060);
INSERT INTO `sys_role_menu` VALUES (5, 2061);
INSERT INTO `sys_role_menu` VALUES (5, 2062);
INSERT INTO `sys_role_menu` VALUES (5, 2063);
INSERT INTO `sys_role_menu` VALUES (5, 2064);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-10-20 20:07:49', '2025-10-16 09:12:57', 'admin', '2025-10-16 09:12:57', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, NULL, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2025-10-16 09:12:57', '2025-10-16 09:12:57', 'admin', '2025-10-16 09:12:57', 'admin', '2025-10-20 15:16:30', '测试员');
INSERT INTO `sys_user` VALUES (3, 116, 'requester_w', '王护士', '00', '', '', '0', '', '$2a$10$WtnDU7bsfC.KP.aKhrvqxuKFZ5KXlxTFzRDmTproxVeVgYo93wQ8K', '0', '0', '', NULL, NULL, 'admin', '2025-10-20 15:30:53', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (4, 115, 'requester_l', '李医生', '00', '', '', '0', '', '$2a$10$AlE1juIqhGwr2TNEdQkZTOh5v87QgWLlpSqt3fUYKM33FFok09hTa', '0', '0', '', NULL, NULL, 'admin', '2025-10-20 15:31:21', 'admin', '2025-10-20 15:32:07', NULL);
INSERT INTO `sys_user` VALUES (5, NULL, 'storekeeper_a', '库管员A', '00', '', '', '0', '', '$2a$10$/FyycL4h1cVR1/aRfrtxcegNTeP9dhjDkNPzgKDiMxz.2iPvaA/UO', '0', '0', '', NULL, NULL, 'admin', '2025-10-20 15:31:44', 'admin', '2025-10-20 15:32:02', NULL);
INSERT INTO `sys_user` VALUES (6, NULL, 'storekeeper_b', '库管员B', '00', '', '', '0', '', '$2a$10$u4kLfiR70swdEosd3plxMeQryKsBnwx8EQuB2dvE3mOZ5ZEFh5gxS', '0', '0', '127.0.0.1', '2025-10-20 15:40:41', NULL, 'admin', '2025-10-20 15:31:56', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (7, NULL, 'approver', '刘院长', '00', '', '', '0', '', '$2a$10$av1a7NYpXGRjq.qI290b3OwMsqTu8SnXPZjeHsk7SdeM0otYIbb4C', '0', '0', '127.0.0.1', '2025-10-20 20:07:56', NULL, 'admin', '2025-10-20 15:32:41', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 3);
INSERT INTO `sys_user_role` VALUES (5, 4);
INSERT INTO `sys_user_role` VALUES (6, 4);
INSERT INTO `sys_user_role` VALUES (7, 5);

-- ----------------------------
-- Table structure for tb_device_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_info`;
CREATE TABLE `tb_device_info`  (
  `device_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '器械档案ID',
  `device_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '器械名称',
  `device_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '器械编号/型号',
  `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '器械分类（字典：sys_device_category）',
  `spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规格型号',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '计量单位',
  `register_num` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '医疗器械注册证号',
  `min_stock` int(11) NULL DEFAULT 0 COMMENT '最低库存预警值',
  `total_stock` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '当前总库存量（由系统维护）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '器械状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`device_id`) USING BTREE,
  UNIQUE INDEX `uk_device_code`(`device_code`) USING BTREE COMMENT '器械编号唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医疗器械/耗材档案表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_device_info
-- ----------------------------
INSERT INTO `tb_device_info` VALUES (1, '一次性无菌注射器', 'DEV0001', '2', '5ml', '支', '械注准20220001', 500, 840.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (2, '医用外科口罩', 'DEV0002', '2', '标准型', '包', '械注准20220002', 1000, 1800.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (3, '高分子夹板', 'DEV0003', '2', '手臂型', '个', '械注准20220003', 100, 180.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (4, '冠状动脉支架', 'DEV0004', '1', '3.5mm*18mm', '个', '械注准20230004', 10, 27.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (5, '人工髋关节假体', 'DEV0005', '1', '陶瓷-A型', '套', '械注准20230005', 5, 13.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (6, '心脏起搏器', 'DEV0006', '1', '双腔型', '个', '械注准20230006', 3, 7.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (7, '便携式心电监护仪', 'DEV0007', '3', 'PM-50', '台', '械注准20240007', 2, 3.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (8, '多功能输液泵', 'DEV0008', '3', 'Inject-200', '台', '械注准20240008', 3, 8.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (9, '医用除颤仪', 'DEV0009', '3', 'Defi-5', '台', '械注准20240009', 1, 3.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (10, '血糖测试仪', 'DEV0010', '3', 'Gluco-80', '台', '械注准20240010', 20, 45.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (11, '输液留置针', 'DEV0011', '2', '24G', '盒', '械注准20220011', 200, 450.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (12, '医用消毒酒精', 'DEV0012', '2', '500ml/瓶', '瓶', '械注准20220012', 300, 400.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (13, '可吸收缝合线', 'DEV0013', '1', '4-0', '包', '械注准20230013', 100, 260.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (14, '手术刀片', 'DEV0014', '2', '#11', '盒', '械注准20220014', 50, 90.00, '0', NULL, 'admin', NULL, '', NULL);
INSERT INTO `tb_device_info` VALUES (15, '超声耦合剂', 'DEV0015', '2', '250ml', '瓶', '械注准20220015', 80, 130.00, '0', NULL, 'admin', NULL, '', NULL);

-- ----------------------------
-- Table structure for tb_inventory_batch
-- ----------------------------
DROP TABLE IF EXISTS `tb_inventory_batch`;
CREATE TABLE `tb_inventory_batch`  (
  `batch_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '批次ID',
  `device_id` bigint(20) NOT NULL COMMENT '关联器械ID',
  `batch_num` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次号/序列号',
  `supplier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商名称',
  `inbound_time` datetime NOT NULL COMMENT '入库日期（用于FIFO）',
  `expiry_date` date NOT NULL COMMENT '过期日期/有效期（用于预警）',
  `inbound_quantity` decimal(10, 2) NOT NULL COMMENT '初始入库数量',
  `current_quantity` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '当前库存数量',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '批次状态（0在库 1出库完毕 2已过期）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`batch_id`) USING BTREE,
  UNIQUE INDEX `uk_batch_num`(`batch_num`) USING BTREE COMMENT '批次号唯一索引',
  INDEX `idx_device_id`(`device_id`) USING BTREE COMMENT '器械档案ID索引'
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存批次表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_inventory_batch
-- ----------------------------
INSERT INTO `tb_inventory_batch` VALUES (1, 1, 'B20240115001', '华南耗材厂', '2024-01-15 10:00:00', '2026-01-14', 500.00, 440.00, '0', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (2, 1, 'B20240620002', '华南耗材厂', '2024-06-20 11:00:00', '2026-06-19', 400.00, 400.00, '0', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (3, 2, 'B20240201003', '洁净防护用品公司', '2024-02-01 09:30:00', '2027-02-01', 1000.00, 800.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (4, 2, 'B20240710004', '洁净防护用品公司', '2024-07-10 14:00:00', '2027-07-10', 1000.00, 1000.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (5, 3, 'B20240305005', '华南耗材厂', '2024-03-05 13:00:00', '2028-03-04', 200.00, 180.00, '0', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (6, 4, 'B20231101006', '国际高值耗材代理', '2023-11-01 10:00:00', '2025-10-31', 20.00, 17.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (7, 4, 'B20240415007', '国际高值耗材代理', '2024-04-15 11:30:00', '2026-04-14', 10.00, 10.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (8, 5, 'B20240120008', '华东医疗设备', '2024-01-20 15:00:00', '2034-01-19', 10.00, 8.00, '0', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (9, 5, 'B20240801009', '华东医疗设备', '2024-08-01 16:00:00', '2034-07-31', 5.00, 5.00, '0', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (10, 6, 'B20231210010', '国际高值耗材代理', '2023-12-10 09:00:00', '2028-12-09', 5.00, 3.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (11, 6, 'B20240525011', '国际高值耗材代理', '2024-05-25 10:30:00', '2029-05-24', 4.00, 4.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (12, 7, 'B20240228012', '华西设备集团', '2024-02-28 11:00:00', '2031-02-27', 3.00, 1.00, '0', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (13, 7, 'B20240901013', '华西设备集团', '2024-09-01 14:00:00', '2031-08-31', 2.00, 2.00, '0', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (14, 8, 'B20240315014', '华东医疗设备', '2024-03-15 13:30:00', '2030-03-14', 5.00, 5.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (15, 8, 'B20240810015', '华东医疗设备', '2024-08-10 16:30:00', '2030-08-09', 3.00, 3.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (16, 9, 'B20240401016', '华西设备集团', '2024-04-01 10:00:00', '2032-03-31', 2.00, 2.00, '0', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (17, 9, 'B20240915017', '华西设备集团', '2024-09-15 11:00:00', '2032-09-14', 1.00, 1.00, '0', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (18, 10, 'B20240510018', '华东医疗设备', '2024-05-10 14:30:00', '2029-05-09', 50.00, 45.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (19, 11, 'B20240210019', '华南耗材厂', '2024-02-10 10:30:00', '2026-02-09', 300.00, 250.00, '0', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (20, 11, 'B20240720020', '华南耗材厂', '2024-07-20 11:30:00', '2026-07-19', 200.00, 200.00, '0', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (21, 12, 'B20240301021', '洁净防护用品公司', '2024-03-01 09:00:00', '2026-02-28', 500.00, 400.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (22, 13, 'B20240105022', '国际高值耗材代理', '2024-01-05 14:00:00', '2025-12-05', 200.00, 160.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (23, 13, 'B20240615023', '国际高值耗材代理', '2024-06-15 15:30:00', '2026-05-15', 100.00, 100.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (24, 14, 'B20240420024', '华南耗材厂', '2024-04-20 10:00:00', '2027-04-19', 100.00, 90.00, '0', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (25, 15, 'B20240515025', '洁净防护用品公司', '2024-05-15 11:00:00', '2026-05-14', 150.00, 130.00, '0', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (26, 3, 'B20231010026', '老批次供应商', '2023-10-10 09:00:00', '2024-10-01', 50.00, 0.00, '1', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (27, 12, 'B20231111027', '老批次供应商', '2023-11-11 09:00:00', '2024-08-01', 20.00, 0.00, '2', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (28, 1, 'B20230901028', '已用完批次', '2023-09-01 10:00:00', '2025-08-31', 100.00, 0.00, '1', NULL, 'kuguana', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (29, 4, 'B20230815029', '已过期批次', '2023-08-15 14:00:00', '2024-09-30', 5.00, 5.00, '2', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (30, 8, 'B20231201030', '华东医疗设备', '2023-12-01 13:30:00', '2028-11-30', 2.00, 0.00, '1', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (31, 10, 'B20231215031', '华东医疗设备', '2023-12-15 14:30:00', '2028-12-14', 10.00, 0.00, '1', NULL, 'kguanb', NULL, '', NULL);
INSERT INTO `tb_inventory_batch` VALUES (32, 11, 'B20231220032', '华南耗材厂', '2023-12-20 10:30:00', '2025-12-19', 50.00, 0.00, '1', NULL, 'kuguana', NULL, '', NULL);

-- ----------------------------
-- Table structure for tb_purchase_apply
-- ----------------------------
DROP TABLE IF EXISTS `tb_purchase_apply`;
CREATE TABLE `tb_purchase_apply`  (
  `apply_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '申请单ID',
  `apply_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '申请单号',
  `dept_id` bigint(20) NOT NULL COMMENT '申请科室ID',
  `device_id` bigint(20) NOT NULL COMMENT '关联器械ID',
  `required_quantity` decimal(10, 2) NOT NULL COMMENT '申请采购数量',
  `required_date` date NULL DEFAULT NULL COMMENT '需求到货日期',
  `apply_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '审批状态（字典：0-待审批 1-已通过 2-已驳回）',
  `approver_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人',
  `approve_time` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `procure_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '入库状态（字典：0-待入库 1-部分入库 2-已完成入库）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者（即申请人）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间（即申请时间）',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`apply_id`) USING BTREE,
  UNIQUE INDEX `uk_apply_code`(`apply_code`) USING BTREE COMMENT '申请单号唯一索引',
  INDEX `idx_dept_id`(`dept_id`) USING BTREE COMMENT '科室ID索引',
  INDEX `idx_device_id`(`device_id`) USING BTREE COMMENT '器械ID索引'
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物资采购申请单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_purchase_apply
-- ----------------------------
INSERT INTO `tb_purchase_apply` VALUES (1, 'CG20240105001', 103, 1, 500.00, NULL, '1', 'approver', '2024-01-06 10:00:00', '2', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (2, 'CG20240120001', 104, 2, 1000.00, NULL, '1', 'approver', '2024-01-21 11:00:00', '2', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (3, 'CG20240220001', 103, 3, 200.00, NULL, '1', 'approver', '2024-02-21 12:00:00', '2', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (4, 'CG20231015001', 105, 4, 20.00, NULL, '1', 'approver', '2023-10-16 13:00:00', '2', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (5, 'CG20240110001', 103, 5, 10.00, NULL, '1', 'approver', '2024-01-11 14:00:00', '2', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (6, 'CG20240920001', 105, 6, 5.00, NULL, '0', NULL, NULL, '0', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (7, 'CG20240921001', 103, 7, 2.00, NULL, '1', 'approver', '2024-09-22 16:00:00', '0', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (8, 'CG20240922001', 104, 8, 3.00, NULL, '0', NULL, NULL, '0', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (9, 'CG20240923001', 105, 9, 1.00, NULL, '1', 'approver', '2024-09-24 10:00:00', '0', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (10, 'CG20240924001', 103, 10, 50.00, NULL, '2', 'approver', '2024-09-25 11:00:00', '0', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (11, 'CG20240710001', 104, 11, 200.00, NULL, '1', 'approver', '2024-07-11 12:00:00', '2', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (12, 'CG20240220002', 103, 12, 500.00, NULL, '1', 'approver', '2024-02-21 13:00:00', '2', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (13, 'CG20240605001', 105, 13, 100.00, NULL, '1', 'approver', '2024-06-06 14:00:00', '2', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (14, 'CG20240410001', 104, 14, 100.00, NULL, '1', 'approver', '2024-04-11 15:00:00', '2', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (15, 'CG20240505001', 103, 15, 150.00, NULL, '1', 'approver', '2024-05-06 16:00:00', '2', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (16, 'CG20240925001', 105, 4, 10.00, NULL, '0', NULL, NULL, '0', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (17, 'CG20240926001', 103, 1, 1000.00, NULL, '1', 'approver', '2024-09-27 10:00:00', '0', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (18, 'CG20240927001', 104, 2, 2000.00, NULL, '0', NULL, NULL, '0', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (19, 'CG20240928001', 105, 8, 5.00, NULL, '1', 'approver', '2024-09-29 11:00:00', '0', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_purchase_apply` VALUES (20, 'CG20240929001', 103, 12, 500.00, NULL, '1', 'approver', '2024-09-30 12:00:00', '0', NULL, 'requester', NULL, '', NULL);

-- ----------------------------
-- Table structure for tb_requisition_apply
-- ----------------------------
DROP TABLE IF EXISTS `tb_requisition_apply`;
CREATE TABLE `tb_requisition_apply`  (
  `requisition_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '领用申请ID',
  `requisition_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领用单号',
  `dept_id` bigint(20) NOT NULL COMMENT '申请科室ID',
  `device_id` bigint(20) NOT NULL COMMENT '申请器材ID',
  `requisition_quantity` decimal(10, 2) NOT NULL COMMENT '申请领用数量',
  `requisition_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '领用状态（字典：0-待审核 1-已出库 2-已驳回）',
  `handler_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人（库管员）',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者（申请人）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`requisition_id`) USING BTREE,
  UNIQUE INDEX `uk_requisition_code`(`requisition_code`) USING BTREE COMMENT '领用单号唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '科室领用申请单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_requisition_apply
-- ----------------------------
INSERT INTO `tb_requisition_apply` VALUES (1, 'LY20240201001', 103, 1, 50.00, '1', 'kuguana', '2024-02-01 11:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (2, 'LY20240301001', 104, 2, 200.00, '1', 'kguanb', '2024-03-01 12:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (3, 'LY20240401001', 103, 3, 20.00, '1', 'kuguana', '2024-04-01 13:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (4, 'LY20240501001', 105, 4, 2.00, '1', 'kguanb', '2024-05-01 14:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (5, 'LY20240601001', 103, 5, 2.00, '1', 'kuguana', '2024-06-01 15:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (6, 'LY20240701001', 105, 6, 2.00, '1', 'kguanb', '2024-07-01 16:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (7, 'LY20240801001', 103, 7, 1.00, '1', 'kuguana', '2024-08-01 17:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (8, 'LY20240901001', 104, 10, 5.00, '1', 'kguanb', '2024-09-01 10:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (9, 'LY20240902001', 103, 11, 50.00, '1', 'kuguana', '2024-09-02 11:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (10, 'LY20240903001', 104, 12, 100.00, '1', 'kguanb', '2024-09-03 12:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (11, 'LY20240904001', 105, 13, 40.00, '1', 'kguanb', '2024-09-04 13:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (12, 'LY20240905001', 103, 14, 10.00, '1', 'kuguana', '2024-09-05 14:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (13, 'LY20240906001', 104, 15, 20.00, '1', 'kguanb', '2024-09-06 15:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (14, 'LY20241001001', 103, 1, 10.00, '1', 'approver', '2025-10-20 18:25:49', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (15, 'LY20241002001', 104, 2, 20.00, '0', NULL, NULL, NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (16, 'LY20241003001', 105, 7, 1.00, '1', 'admin', '2025-10-20 15:07:42', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (17, 'LY20241004001', 103, 4, 1.00, '1', 'admin', '2025-10-20 01:51:03', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (18, 'LY20241005001', 104, 5, 1.00, '2', 'kuguana', '2024-10-05 16:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (19, 'LY20241006001', 105, 8, 1.00, '0', NULL, NULL, NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (20, 'LY20241007001', 103, 11, 20.00, '0', NULL, NULL, NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (21, 'LY20241008001', 104, 12, 30.00, '0', NULL, NULL, NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (22, 'LY20241009001', 105, 13, 5.00, '2', 'kguanb', '2024-10-09 17:00:00', NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (23, 'LY20241010001', 103, 9, 1.00, '0', NULL, NULL, NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (24, 'LY20241011001', 104, 3, 10.00, '0', NULL, NULL, NULL, 'requester', NULL, '', NULL);
INSERT INTO `tb_requisition_apply` VALUES (25, 'LY20241012001', 105, 15, 5.00, '0', NULL, NULL, NULL, 'requester', NULL, '', NULL);

SET FOREIGN_KEY_CHECKS = 1;
