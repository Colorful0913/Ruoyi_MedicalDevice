-- 设备管理模块数据库表
-- 器械档案表
DROP TABLE IF EXISTS `tb_device_info`;
CREATE TABLE `tb_device_info` (
  `device_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '器械ID',
  `device_code` varchar(50) NOT NULL COMMENT '器械编码',
  `device_name` varchar(100) NOT NULL COMMENT '器械名称',
  `device_type` varchar(50) DEFAULT NULL COMMENT '器械类型',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格型号',
  `unit` varchar(20) DEFAULT NULL COMMENT '计量单位',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `total_stock` decimal(10,2) DEFAULT '0.00' COMMENT '总库存',
  `safety_stock` decimal(10,2) DEFAULT '0.00' COMMENT '安全库存',
  `supplier` varchar(100) DEFAULT NULL COMMENT '供应商',
  `storage_location` varchar(100) DEFAULT NULL COMMENT '存放位置',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`device_id`),
  UNIQUE KEY `uk_device_code` (`device_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='器械档案表';

-- 库存批次表
DROP TABLE IF EXISTS `tb_inventory_batch`;
CREATE TABLE `tb_inventory_batch` (
  `batch_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '批次ID',
  `batch_code` varchar(50) NOT NULL COMMENT '批次编码',
  `device_id` bigint(20) NOT NULL COMMENT '器械ID',
  `purchase_date` date DEFAULT NULL COMMENT '采购日期',
  `expiry_date` date DEFAULT NULL COMMENT '有效期',
  `batch_quantity` decimal(10,2) NOT NULL COMMENT '批次数量',
  `current_quantity` decimal(10,2) NOT NULL COMMENT '当前数量',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `supplier` varchar(100) DEFAULT NULL COMMENT '供应商',
  `status` char(1) DEFAULT '0' COMMENT '状态（0在库 1出库完毕）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`batch_id`),
  UNIQUE KEY `uk_batch_code` (`batch_code`),
  KEY `idx_device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='库存批次表';

-- 采购申请表
DROP TABLE IF EXISTS `tb_purchase_apply`;
CREATE TABLE `tb_purchase_apply` (
  `apply_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `apply_code` varchar(50) NOT NULL COMMENT '申请单号',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '申请科室ID',
  `device_id` bigint(20) NOT NULL COMMENT '关联器械ID',
  `required_quantity` decimal(10,2) NOT NULL COMMENT '申请采购数量',
  `required_date` date DEFAULT NULL COMMENT '需求到货日期',
  `apply_status` char(1) DEFAULT '0' COMMENT '申请状态（0待审核 1已批准 2已驳回）',
  `procure_status` char(1) DEFAULT '0' COMMENT '采购状态（0未采购 1采购中 2已到货）',
  `handler_by` varchar(64) DEFAULT NULL COMMENT '处理人',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`apply_id`),
  UNIQUE KEY `uk_apply_code` (`apply_code`),
  KEY `idx_device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='采购申请表';

-- 领用申请表
DROP TABLE IF EXISTS `tb_requisition_apply`;
CREATE TABLE `tb_requisition_apply` (
  `requisition_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '领用申请ID',
  `requisition_code` varchar(50) NOT NULL COMMENT '领用单号',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '申请科室ID',
  `device_id` bigint(20) NOT NULL COMMENT '申请器材ID',
  `requisition_quantity` decimal(10,2) NOT NULL COMMENT '申请领用数量',
  `requisition_status` char(1) DEFAULT '0' COMMENT '领用状态（0待审核 1已出库 2已驳回）',
  `handler_by` varchar(64) DEFAULT NULL COMMENT '处理人',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`requisition_id`),
  UNIQUE KEY `uk_requisition_code` (`requisition_code`),
  KEY `idx_device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='领用申请表';

