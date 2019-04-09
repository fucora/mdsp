/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : mdsp_gen

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 10/04/2019 01:17:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_gen_db_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_gen_db_config`;
CREATE TABLE `sys_gen_db_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `host` varchar(32) NOT NULL COMMENT '数据库地址',
  `port` varchar(32) NOT NULL COMMENT '数据库端口',
  `db_type` varchar(32) NOT NULL COMMENT '数据库类型',
  `driver_class_name` varchar(32) NOT NULL COMMENT 'jdbc驱动类名',
  `database_name` varchar(32) NOT NULL COMMENT '具体数据库名',
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成表';

-- ----------------------------
-- Records of sys_gen_db_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_gen_db_config` VALUES (1, '123', '123', '123', '123', '123', '123', '1', '2019-04-09 19:43:24', '2019-04-10 00:31:29');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
