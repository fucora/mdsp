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

 Date: 25/03/2019 14:13:40
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
  `database` varchar(32) NOT NULL COMMENT '具体数据库名',
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成表';

SET FOREIGN_KEY_CHECKS = 1;
