/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : nacos_config

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 25/03/2019 14:39:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` VALUES (8, 'mdsp-auth-service-dev.yml', 'AUTH_GROUP', '#Oauth2 认证服务器 提供token\nserver:\n  port: 9001\n  tomcat:\n    max-threads: 500 # Maximum amount of worker threads.\n    min-spare-threads: 50 # Minimum amount of worker threads\n#应用基本配置\nspring:\n  application:\n    name: mdsp-auth-service\n  #reids配置\n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password:\n#rabbitmq配置\n  rabbitmq:\n    host: 127.0.0.1\n    port: 5672\n    username: mdsp\n    password: mdsp\n  boot:\n    admin:\n      client:\n        url: http://localhost:9006\n        instance:\n          service-base-url: http://localhost:9001\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n        metadata:\n          user.name: ${spring.security.user.name}\n          user.password: ${spring.security.user.password}\n  security:\n    user:\n      name: \"mdsp\"\n      password: \"mdsp\"\n#数据源配置\n  datasource:\n    url: jdbc:mysql://localhost:3306/mdsp_upms?useUnicode=true&characterEncoding=UTF8&useSSL=false&autoReconnect=true\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: keai1111\n    hikari:\n      minimum-idle: 0\n#feign日志打印\nlogging:\n  level:\n    com.mdsp.auth.service.SysUserService: debug\n#文件上传配置\n#  http:\n#    multipart:\n#      max-file-size: 1000MB\n#      max-request-size: 1000MB\nribbon:\n  eager-load:\n    enabled: true\n    clients: mdsp-upms-service\n\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: false\n  httpclient:\n    enabled: true\n  client:\n    config:\n      feignName:\n        connectTimeout: 30000\n        readTimeout: 30000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\nhystrix:\n  threadpool:\n    default:\n      coreSize: 500\n      maxQueueSize: 1000\n      queueSizeRejectionThreshold: 800\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\n#开启端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\nsecurity:\n  enabled: false', 'ae99a14fe674b4ba2bb8103a1f103da7', '2019-03-08 13:10:31', '2019-03-20 22:07:45', NULL, '127.0.0.1', '', '', '', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (16, 'mdsp-upms-service-dev.yml', 'BACK_GROUP', '#通用用户权限系统\nserver:\n  port: 9002\n  tomcat:\n    max-threads: 500 # Maximum amount of worker threads.\n    min-spare-threads: 50 # Minimum amount of worker threads\n#应用基本配置\nspring:\n  application:\n    name: mdsp-upms-service\n  boot:\n    admin:\n      client:\n        url: http://localhost:9006\n        instance:\n          service-base-url: http://localhost:9002\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n        metadata:\n          user.name: ${spring.security.user.name}\n          user.password: ${spring.security.user.password}\n  security:\n    user:\n      name: \"mdsp\"\n      password: \"mdsp\"\n  cache:\n    cache-names: roleResourceCache\n    multi:\n      caffeine:\n        expireAfterAccess: \'10000\'\n      redis:\n        defaultExpiration: \'60000\'\n  #reids配置\n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password:\n  #rabbitmq配置\n  rabbitmq:\n    host: 127.0.0.1\n    port: 5672\n    username: mdsp\n    password: mdsp\n  #数据源配置\n  datasource:\n    url: jdbc:mysql://localhost:3306/mdsp_upms?useUnicode=true&characterEncoding=UTF8&useSSL=false&autoReconnect=true\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: keai1111\n    hikari:\n      minimum-idle: 0\n#mybatis-plus相关配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  #实体扫描，多个package用逗号或者分号分隔\n  typeAliasesPackage: com.mdsp.upms.model.entity\n  global-config:\n    db-config:\n      #主键类型  0:\"数据库ID自增\", 1:\"用户输入ID\",2:\"全局唯一ID (数字类型唯一ID)\", 3:\"全局唯一ID UUID\";\n      id-type: AUTO\n      #字段策略 0:\"忽略判断\",1:\"非 NULL 判断\"),2:\"非空判断\"\n      field-strategy: NOT_EMPTY\n      #驼峰下划线转换\n      table-underline: true\n      #mp2.3+ 全局表前缀 mp_\n      #table-prefix: mp_\n      #刷新mapper 调试神器\n      #refresh-mapper: true\n      #数据库大写下划线转换\n      #alipay-mode: true\n      # Sequence序列接口实现类配置\n      #key-generator: com.baomidou.mybatisplus.incrementer.OracleKeyGenerator\n      #逻辑删除配置（下面3个配置）\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n      #sql-injector: com.baomidou.mybatisplus.mapper.LogicSqlInjector\n      #自定义填充策略接口实现\n    #meta-object-handler: com.baomidou.mybatisplus.core.handlers.MetaObjectHandler\n  configuration:\n    #配置返回数据库(column下划线命名&&返回java实体是驼峰命名)，自动匹配无需as（没开启这个，SQL需要写as： select user_id as userId）\n    map-underscore-to-camel-case: true\n    cache-enabled: false\n    #配置JdbcTypeForNull, oracle数据库必须配置\n    jdbc-type-for-null: \'null\'\n# Logger Config\nlogging:\n  level:\n    com.mdsp: debug\n    org.springframework: INFO\n#文件上传配置\n#  http:\n#    multipart:\n#      max-file-size: 1000MB\n#      max-request-size: 1000MB\n#feign相关配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: false\n  httpclient:\n    enabled: true\n  client:\n    config:\n      feignName:\n        connectTimeout: 30000\n        readTimeout: 30000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n#hystrix配置\nhystrix:\n  threadpool:\n    default:\n      coreSize: 500\n      maxQueueSize: 1000\n      queueSizeRejectionThreshold: 800\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n#开启端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\nsecurity:\n  enabled: false', '44bdb6ea33db148295f7413a12ea3377', '2019-03-08 13:53:02', '2019-03-20 21:48:48', NULL, '127.0.0.1', '', '', '', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (21, 'mdsp-gateway-service-dev.yml', 'GATE_GROUP', '#后端统一入口，提供动态路由，oauth2的资源服务器\nserver:\n  port: 2019\n  tomcat:\n    max-threads: 500 # Maximum amount of worker threads.\n    min-spare-threads: 50 # Minimum amount of worker threads\n\n#应用基本配置\nspring:\n  application:\n    name: mdsp-gateway-service\n  boot:\n    admin:\n      client:\n        url: http://localhost:9006\n        instance:\n          service-base-url: http://localhost:2019\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n        metadata:\n          user.name: ${spring.security.user.name}\n          user.password: ${spring.security.user.password}\n  security:\n    user:\n      name: \"mdsp\"\n      password: \"mdsp\"\n  #reids配置\n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password:\n  #rabbitmq配置\n  rabbitmq:\n    host: 127.0.0.1\n    port: 5672\n    username: mdsp\n    password: mdsp\n  #数据源配置\n  datasource:\n    url: jdbc:mysql://localhost:3306/mdsp_route?useUnicode=true&characterEncoding=UTF8&useSSL=false&autoReconnect=true\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: keai1111\n#feign日志打印\nlogging:\n  level:\n    com.mdsp.gateway.feign.SysResourceService: debug\n#文件上传配置\n#  http:\n#    multipart:\n#      max-file-size: 1000MB\n#      max-request-size: 1000MB\nribbon:\n  eager-load:\n    enabled: true\n    clients: mdsp-upms-service\n\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: false\n  httpclient:\n    enabled: true\n  client:\n    config:\n      feignName:\n        connectTimeout: 30000\n        readTimeout: 30000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\nhystrix:\n  threadpool:\n    default:\n      coreSize: 500\n      maxQueueSize: 1000\n      queueSizeRejectionThreshold: 800\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nignore:\n  urls:\n    - /**/*.css\n    - /auth/**\n    - /actuator/**\n    - /admin/user/**\n    - /admin/resource/**\n    - /admin/role/**\n    - /refresh/**\n    - /swagger-ui.html\n    - /swagger-resources/**\n    - /*/v2/api-docs\n    - /webjars/**\n\nswagger:\n  client:\n    - mdsp-upms-service\n    - mdsp-gen-service\n\n# 关闭默认路由\nzuul:\n  ignoredServices: \'*\'\n  sensitive-headers:\n\n#开启端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\nsecurity:\n  enabled: false', '896ad99f9cd7643033cdf6633bb6fe33', '2019-03-08 14:08:17', '2019-03-20 22:27:20', NULL, '127.0.0.1', '', '', '', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (23, 'mdsp-gen-service-dev.yml', 'BACK_GROUP', '#代码生成模块\nserver:\n  port: 9003\n  tomcat:\n    max-threads: 500 # Maximum amount of worker threads.\n    min-spare-threads: 50 # Minimum amount of worker threads\n#应用基本配置\nspring:\n  application:\n    name: mdsp-gen-service\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n  #rabbitmq配置\n  rabbitmq:\n    host: 127.0.0.1\n    port: 5672\n    username: mdsp\n    password: mdsp\n  #数据源配置\n  datasource:\n    url: jdbc:mysql://localhost:3306/mdsp_gen?useUnicode=true&characterEncoding=UTF8&useSSL=false&autoReconnect=true\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: keai1111\n    hikari:\n      minimum-idle: 0\n#mybatis-plus相关配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  #实体扫描，多个package用逗号或者分号分隔\n  typeAliasesPackage: com.mdsp.upms.model.entity\n  global-config:\n    db-config:\n      #主键类型  0:\"数据库ID自增\", 1:\"用户输入ID\",2:\"全局唯一ID (数字类型唯一ID)\", 3:\"全局唯一ID UUID\";\n      id-type: AUTO\n      #字段策略 0:\"忽略判断\",1:\"非 NULL 判断\"),2:\"非空判断\"\n      field-strategy: NOT_EMPTY\n      #驼峰下划线转换\n      table-underline: true\n      #mp2.3+ 全局表前缀 mp_\n      #table-prefix: mp_\n      #刷新mapper 调试神器\n      #refresh-mapper: true\n      #数据库大写下划线转换\n      #alipay-mode: true\n      # Sequence序列接口实现类配置\n      #key-generator: com.baomidou.mybatisplus.incrementer.OracleKeyGenerator\n      #逻辑删除配置（下面3个配置）\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n      #sql-injector: com.baomidou.mybatisplus.mapper.LogicSqlInjector\n      #自定义填充策略接口实现\n    #meta-object-handler: com.baomidou.mybatisplus.core.handlers.MetaObjectHandler\n  configuration:\n    #配置返回数据库(column下划线命名&&返回java实体是驼峰命名)，自动匹配无需as（没开启这个，SQL需要写as： select user_id as userId）\n    map-underscore-to-camel-case: true\n    cache-enabled: false\n    #配置JdbcTypeForNull, oracle数据库必须配置\n    jdbc-type-for-null: \'null\'\n#feign日志打印\nlogging:\n  level:\n    com.mdsp.gen.mapper: debug\n', '57e3466a0df89f04aa7acaa44898cd39', '2019-03-08 14:22:34', '2019-03-20 16:49:52', NULL, '192.168.27.132', '', '', '代码生成配置', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (26, 'mdsp-log-service-dev.yml', 'BACK_GROUP', '#日志中心模块\nserver:\n  port: 9004\n  tomcat:\n    max-threads: 500 # Maximum amount of worker threads.\n    min-spare-threads: 50 # Minimum amount of worker threads\n#应用基本配置\nspring:\n  application:\n    name: mdsp-log-service\n  boot:\n    admin:\n      client:\n        url: http://localhost:9006\n        instance:\n          service-base-url: http://localhost:9004\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n  #rabbitmq配置\n  rabbitmq:\n    host: 127.0.0.1\n    port: 5672\n    username: mdsp\n    password: mdsp\n  #数据源配置\n  datasource:\n    url: jdbc:mysql://localhost:3306/mdsp_log?useUnicode=true&characterEncoding=UTF8&useSSL=false&autoReconnect=true\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: keai1111\n    hikari:\n      minimum-idle: 0\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  #实体扫描，多个package用逗号或者分号分隔\n  typeAliasesPackage: com.mdsp.log.model.entity\n  global-config:\n    db-config:\n      #主键类型  0:\"数据库ID自增\", 1:\"用户输入ID\",2:\"全局唯一ID (数字类型唯一ID)\", 3:\"全局唯一ID UUID\";\n      id-type: AUTO\n      #字段策略 0:\"忽略判断\",1:\"非 NULL 判断\"),2:\"非空判断\"\n      field-strategy: NOT_EMPTY\n      #驼峰下划线转换\n      table-underline: true\n      #mp2.3+ 全局表前缀 mp_\n      #table-prefix: mp_\n      #刷新mapper 调试神器\n      #refresh-mapper: true\n      #数据库大写下划线转换\n      #alipay-mode: true\n      # Sequence序列接口实现类配置\n      #key-generator: com.baomidou.mybatisplus.incrementer.OracleKeyGenerator\n      #逻辑删除配置（下面3个配置）\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n      #sql-injector: com.baomidou.mybatisplus.mapper.LogicSqlInjector\n      #自定义填充策略接口实现\n    #meta-object-handler: com.baomidou.mybatisplus.core.handlers.MetaObjectHandler\n  configuration:\n    #配置返回数据库(column下划线命名&&返回java实体是驼峰命名)，自动匹配无需as（没开启这个，SQL需要写as： select user_id as userId）\n    map-underscore-to-camel-case: true\n    cache-enabled: false\n    #配置JdbcTypeForNull, oracle数据库必须配置\n    jdbc-type-for-null: \'null\'\n# Logger Config\nlogging:\n  level:\n    com.mdsp.log.mapper: debug\n#开启端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\nsecurity:\n  enabled: false', 'f2bf4e6e669f3776dcbcd9279764cd18', '2019-03-08 14:33:31', '2019-03-20 16:54:18', NULL, '192.168.27.132', '', '', '日志相关配置', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (30, 'mdsp-transaction-service-dev.yml', 'TSC_GROUP', '#基于mq最终一致性实现可靠消息的分布式事务方案\nserver:\n  port: 8081\n  tomcat:\n    max-threads: 500 # Maximum amount of worker threads.\n    min-spare-threads: 50 # Minimum amount of worker threads\n#应用基本配置\nspring:\n  application:\n    name: mdsp-transaction-service\n#reids配置\n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password:\n#rabbitmq配置\n  rabbitmq:\n    host: 127.0.0.1\n    port: 5672\n    username: mdsp\n    password: mdsp\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n#数据源配置\n  datasource:\n    url: jdbc:mysql://localhost:3306/mdsp_msg?useUnicode=true&characterEncoding=UTF8&useSSL=false&autoReconnect=true\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: keai1111\n    hikari:\n      minimum-idle: 0', 'c037c43a8f0a00f650087088ec25e856', '2019-03-08 15:15:15', '2019-03-20 16:51:40', NULL, '192.168.27.132', '', '', ' 分布式事务配置', NULL, NULL, 'yaml', NULL);
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
INSERT INTO `his_config_info` VALUES (16, 1, 'mdsp-upms-service-dev.yml', 'BACK_GROUP', '', '#通用用户权限系统\nserver:\n  port: 9002\n  tomcat:\n    max-threads: 500 # Maximum amount of worker threads.\n    min-spare-threads: 50 # Minimum amount of worker threads\n#应用基本配置\nspring:\n  application:\n    name: mdsp-upms-service\n  boot:\n    admin:\n      client:\n        url: http://localhost:9006\n        instance:\n          service-base-url: http://localhost:9002\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n        metadata:\n          user.name: ${spring.security.user.name}\n          user.password: ${spring.security.user.password}\n  security:\n    user:\n      name: \"mdsp\"\n      password: \"mdsp\"\n  cache:\n    cache-names: roleResourceCache\n    multi:\n      caffeine:\n        expireAfterAccess: \'10000\'\n      redis:\n        defaultExpiration: \'60000\'\n  #reids配置\n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password:\n  #rabbitmq配置\n  rabbitmq:\n    host: 127.0.0.1\n    port: 5672\n    username: mdsp\n    password: mdsp\n  #数据源配置\n  datasource:\n    url: jdbc:mysql://localhost:3306/mdsp?useUnicode=true&characterEncoding=UTF8&useSSL=false&autoReconnect=true\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: keai1111\n    hikari:\n      minimum-idle: 0\n#mybatis-plus相关配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  #实体扫描，多个package用逗号或者分号分隔\n  typeAliasesPackage: com.mdsp.upms.model.entity\n  global-config:\n    db-config:\n      #主键类型  0:\"数据库ID自增\", 1:\"用户输入ID\",2:\"全局唯一ID (数字类型唯一ID)\", 3:\"全局唯一ID UUID\";\n      id-type: AUTO\n      #字段策略 0:\"忽略判断\",1:\"非 NULL 判断\"),2:\"非空判断\"\n      field-strategy: NOT_EMPTY\n      #驼峰下划线转换\n      table-underline: true\n      #mp2.3+ 全局表前缀 mp_\n      #table-prefix: mp_\n      #刷新mapper 调试神器\n      #refresh-mapper: true\n      #数据库大写下划线转换\n      #alipay-mode: true\n      # Sequence序列接口实现类配置\n      #key-generator: com.baomidou.mybatisplus.incrementer.OracleKeyGenerator\n      #逻辑删除配置（下面3个配置）\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n      #sql-injector: com.baomidou.mybatisplus.mapper.LogicSqlInjector\n      #自定义填充策略接口实现\n    #meta-object-handler: com.baomidou.mybatisplus.core.handlers.MetaObjectHandler\n  configuration:\n    #配置返回数据库(column下划线命名&&返回java实体是驼峰命名)，自动匹配无需as（没开启这个，SQL需要写as： select user_id as userId）\n    map-underscore-to-camel-case: true\n    cache-enabled: false\n    #配置JdbcTypeForNull, oracle数据库必须配置\n    jdbc-type-for-null: \'null\'\n# Logger Config\nlogging:\n  level:\n    com.mdsp: debug\n    org.springframework: INFO\n#文件上传配置\n#  http:\n#    multipart:\n#      max-file-size: 1000MB\n#      max-request-size: 1000MB\n#feign相关配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: false\n  httpclient:\n    enabled: true\n  client:\n    config:\n      feignName:\n        connectTimeout: 30000\n        readTimeout: 30000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n#hystrix配置\nhystrix:\n  threadpool:\n    default:\n      coreSize: 500\n      maxQueueSize: 1000\n      queueSizeRejectionThreshold: 800\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n#开启端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\nsecurity:\n  enabled: false', 'dd3f03d11e7170f990b5bb627b579fd4', '2010-05-05 00:00:00', '2019-03-20 21:35:16', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (16, 2, 'mdsp-upms-service-dev.yml', 'BACK_GROUP', '', '#通用用户权限系统\nserver:\n  port: 9002\n  tomcat:\n    max-threads: 500 # Maximum amount of worker threads.\n    min-spare-threads: 50 # Minimum amount of worker threads\n#应用基本配置\nspring:\n  application:\n    name: mdsp-upms-service\n  boot:\n    admin:\n      client:\n        url: http://localhost:9006\n        instance:\n          service-base-url: http://localhost:9002\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n        metadata:\n          user.name: ${spring.security.user.name}\n          user.password: ${spring.security.user.password}\n  security:\n    user:\n      name: \"mdsp\"\n      password: \"mdsp\"\n  cache:\n    cache-names: roleResourceCache\n    multi:\n      caffeine:\n        expireAfterAccess: \'10000\'\n      redis:\n        defaultExpiration: \'60000\'\n  #reids配置\n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password:\n  #rabbitmq配置\n  rabbitmq:\n    host: 127.0.0.1\n    port: 5672\n    username: mdsp\n    password: mdsp\n  #数据源配置\n  datasource:\n    url: jdbc:mysql://localhost:3306/mdsp_upms?useUnicode=true&characterEncoding=UTF8&useSSL=false&autoReconnect=true\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: keai1111\n    hikari:\n      minimum-idle: 0\n#mybatis-plus相关配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  #实体扫描，多个package用逗号或者分号分隔\n  typeAliasesPackage: com.mdsp.upms.model.entity\n  global-config:\n    db-config:\n      #主键类型  0:\"数据库ID自增\", 1:\"用户输入ID\",2:\"全局唯一ID (数字类型唯一ID)\", 3:\"全局唯一ID UUID\";\n      id-type: AUTO\n      #字段策略 0:\"忽略判断\",1:\"非 NULL 判断\"),2:\"非空判断\"\n      field-strategy: NOT_EMPTY\n      #驼峰下划线转换\n      table-underline: true\n      #mp2.3+ 全局表前缀 mp_\n      #table-prefix: mp_\n      #刷新mapper 调试神器\n      #refresh-mapper: true\n      #数据库大写下划线转换\n      #alipay-mode: true\n      # Sequence序列接口实现类配置\n      #key-generator: com.baomidou.mybatisplus.incrementer.OracleKeyGenerator\n      #逻辑删除配置（下面3个配置）\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n      #sql-injector: com.baomidou.mybatisplus.mapper.LogicSqlInjector\n      #自定义填充策略接口实现\n    #meta-object-handler: com.baomidou.mybatisplus.core.handlers.MetaObjectHandler\n  configuration:\n    #配置返回数据库(column下划线命名&&返回java实体是驼峰命名)，自动匹配无需as（没开启这个，SQL需要写as： select user_id as userId）\n    map-underscore-to-camel-case: true\n    cache-enabled: false\n    #配置JdbcTypeForNull, oracle数据库必须配置\n    jdbc-type-for-null: \'null\'\n# Logger Config\nlogging:\n  level:\n    com.mdsp: debug\n    org.springframework: INFO\n#文件上传配置\n#  http:\n#    multipart:\n#      max-file-size: 1000MB\n#      max-request-size: 1000MB\n#feign相关配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: false\n  httpclient:\n    enabled: true\n  client:\n    config:\n      feignName:\n        connectTimeout: 30000\n        readTimeout: 30000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n#hystrix配置\nhystrix:\n  threadpool:\n    default:\n      coreSize: 500\n      maxQueueSize: 1000\n      queueSizeRejectionThreshold: 800\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n#开启端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\nsecurity:\n  enabled: false', '44bdb6ea33db148295f7413a12ea3377', '2010-05-05 00:00:00', '2019-03-20 21:48:48', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 3, 'mdsp-auth-service-dev.yml', 'AUTH_GROUP', '', '#Oauth2 认证服务器 提供token\nserver:\n  port: 9001\n  tomcat:\n    max-threads: 500 # Maximum amount of worker threads.\n    min-spare-threads: 50 # Minimum amount of worker threads\n#应用基本配置\nspring:\n  application:\n    name: mdsp-auth-service\n  #reids配置\n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password:\n#rabbitmq配置\n  rabbitmq:\n    host: 127.0.0.1\n    port: 5672\n    username: mdsp\n    password: mdsp\n  boot:\n    admin:\n      client:\n        url: http://localhost:9006\n        instance:\n          service-base-url: http://localhost:9001\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n        metadata:\n          user.name: ${spring.security.user.name}\n          user.password: ${spring.security.user.password}\n  security:\n    user:\n      name: \"mdsp\"\n      password: \"mdsp\"\n#数据源配置\n  datasource:\n    url: jdbc:mysql://localhost:3306/mdsp?useUnicode=true&characterEncoding=UTF8&useSSL=false&autoReconnect=true\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: keai1111\n    hikari:\n      minimum-idle: 0\n#feign日志打印\nlogging:\n  level:\n    com.mdsp.auth.service.SysUserService: debug\n#文件上传配置\n#  http:\n#    multipart:\n#      max-file-size: 1000MB\n#      max-request-size: 1000MB\nribbon:\n  eager-load:\n    enabled: true\n    clients: mdsp-upms-service\n\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: false\n  httpclient:\n    enabled: true\n  client:\n    config:\n      feignName:\n        connectTimeout: 30000\n        readTimeout: 30000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\nhystrix:\n  threadpool:\n    default:\n      coreSize: 500\n      maxQueueSize: 1000\n      queueSizeRejectionThreshold: 800\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\n#开启端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\nsecurity:\n  enabled: false', '26fd5460b077e21610bbb254dcb5843f', '2010-05-05 00:00:00', '2019-03-20 22:07:45', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (21, 4, 'mdsp-gateway-service-dev.yml', 'GATE_GROUP', '', '#后端统一入口，提供动态路由，oauth2的资源服务器\n  port: 2019\n  tomcat:\n    max-threads: 500 # Maximum amount of worker threads.\n    min-spare-threads: 50 # Minimum amount of worker threads\n#应用基本配置\nspring:\n  application:\n    name: mdsp-gateway-service\n  boot:\n    admin:\n      client:\n        url: http://localhost:9006\n        instance:\n          service-base-url: http://localhost:2019\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n        metadata:\n          user.name: ${spring.security.user.name}\n          user.password: ${spring.security.user.password}\n  security:\n    user:\n      name: \"mdsp\"\n      password: \"mdsp\"\n  #reids配置\n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password:\n  #rabbitmq配置\n  rabbitmq:\n    host: 127.0.0.1\n    port: 5672\n    username: mdsp\n    password: mdsp\n  #数据源配置\n  datasource:\n    url: jdbc:mysql://localhost:3306/mdsp_route?useUnicode=true&characterEncoding=UTF8&useSSL=false&autoReconnect=true\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: keai1111\n#feign日志打印\nlogging:\n  level:\n    com.mdsp.gateway.feign.SysResourceService: debug\n#文件上传配置\n#  http:\n#    multipart:\n#      max-file-size: 1000MB\n#      max-request-size: 1000MB\nribbon:\n  eager-load:\n    enabled: true\n    clients: mdsp-upms-service\n\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: false\n  httpclient:\n    enabled: true\n  client:\n    config:\n      feignName:\n        connectTimeout: 30000\n        readTimeout: 30000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\nhystrix:\n  threadpool:\n    default:\n      coreSize: 500\n      maxQueueSize: 1000\n      queueSizeRejectionThreshold: 800\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nignore:\n  urls:\n    - /**/*.css\n    - /auth/**\n    - /actuator/**\n    - /admin/user/**\n    - /admin/resource/**\n    - /admin/role/**\n    - /refresh/**\n    - /swagger-ui.html\n    - /swagger-resources/**\n    - /*/v2/api-docs\n    - /webjars/**\n\nswagger:\n  client:\n    - mdsp-upms-service\n    - mdsp-gen-service\n\n# 关闭默认路由\nzuul:\n  ignoredServices: \'*\'\n  sensitive-headers:\n\n#开启端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\nsecurity:\n  enabled: false\n', 'f246dce7549a0a5f2415e8bc9a4ecf18', '2010-05-05 00:00:00', '2019-03-20 22:19:41', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (21, 5, 'mdsp-gateway-service-dev.yml', 'GATE_GROUP', '', '#后端统一入口，提供动态路由，oauth2的资源服务器\n  port: 2019\n  tomcat:\n    max-threads: 500 # Maximum amount of worker threads.\n    min-spare-threads: 50 # Minimum amount of worker threads\n#应用基本配置\nspring:\n  application:\n    name: mdsp-gateway-service\n  boot:\n    admin:\n      client:\n        url: http://localhost:9006\n        instance:\n          service-base-url: http://localhost:2019\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n        metadata:\n          user.name: ${spring.security.user.name}\n          user.password: ${spring.security.user.password}\n  security:\n    user:\n      name: \"mdsp\"\n      password: \"mdsp\"\n  #reids配置\n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password:\n  #rabbitmq配置\n  rabbitmq:\n    host: 127.0.0.1\n    port: 5672\n    username: mdsp\n    password: mdsp\n  #数据源配置\n  datasource:\n    url: jdbc:mysql://localhost:3306/mdsp_route?useUnicode=true&characterEncoding=UTF8&useSSL=false&autoReconnect=true\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: keai1111\n#feign日志打印\nlogging:\n  level:\n    com.mdsp.gateway.feign.SysResourceService: debug\n#文件上传配置\n#  http:\n#    multipart:\n#      max-file-size: 1000MB\n#      max-request-size: 1000MB\nribbon:\n  eager-load:\n    enabled: true\n    clients: mdsp-upms-service\n\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: false\n  httpclient:\n    enabled: true\n  client:\n    config:\n      feignName:\n        connectTimeout: 30000\n        readTimeout: 30000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\nhystrix:\n  threadpool:\n    default:\n      coreSize: 500\n      maxQueueSize: 1000\n      queueSizeRejectionThreshold: 800\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nignore:\n  urls:\n    - /**/*.css\n    - /auth/**\n    - /actuator/**\n    - /admin/user/**\n    - /admin/resource/**\n    - /admin/role/**\n    - /refresh/**\n    - /swagger-ui.html\n    - /swagger-resources/**\n    - /*/v2/api-docs\n    - /webjars/**\n\nswagger:\n  client:\n    - mdsp-upms-service\n    - mdsp-gen-service\n\n# 关闭默认路由\nzuul:\n  ignoredServices: \'*\'\n  sensitive-headers:\n\n#开启端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\nsecurity:\n  enabled: false', '7ab4c9e6d3e086d6f1577d02e4996ce0', '2010-05-05 00:00:00', '2019-03-20 22:23:50', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (21, 6, 'mdsp-gateway-service-dev.yml', 'GATE_GROUP', '', '#后端统一入口，提供动态路由，oauth2的资源服务器\n  port: 2019\n  tomcat:\n    max-threads: 500 # Maximum amount of worker threads.\n    min-spare-threads: 50 # Minimum amount of worker threads\n#应用基本配置\nspring:\n  application:\n    name: mdsp-gateway-service\n  boot:\n    admin:\n      client:\n        url: http://localhost:9006\n        instance:\n          service-base-url: http://localhost:2019\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n        metadata:\n          user.name: ${spring.security.user.name}\n          user.password: ${spring.security.user.password}\n  security:\n    user:\n      name: \"mdsp\"\n      password: \"mdsp\"\n  #reids配置\n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password:\n  #rabbitmq配置\n  rabbitmq:\n    host: 127.0.0.1\n    port: 5672\n    username: mdsp\n    password: mdsp\n  #数据源配置\n  datasource:\n    url: jdbc:mysql://localhost:3306/mdsp_route?useUnicode=true&characterEncoding=UTF8&useSSL=false&autoReconnect=true\n    driver-class-name: com.mysql.jdbc.Driver\n    username: root\n    password: keai1111\n#feign日志打印\nlogging:\n  level:\n    com.mdsp.gateway.feign.SysResourceService: debug\n#文件上传配置\n#  http:\n#    multipart:\n#      max-file-size: 1000MB\n#      max-request-size: 1000MB\nribbon:\n  eager-load:\n    enabled: true\n    clients: mdsp-upms-service\n\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: false\n  httpclient:\n    enabled: true\n  client:\n    config:\n      feignName:\n        connectTimeout: 30000\n        readTimeout: 30000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\nhystrix:\n  threadpool:\n    default:\n      coreSize: 500\n      maxQueueSize: 1000\n      queueSizeRejectionThreshold: 800\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nignore:\n  urls:\n    - /**/*.css\n    - /auth/**\n    - /actuator/**\n    - /admin/user/**\n    - /admin/resource/**\n    - /admin/role/**\n    - /refresh/**\n    - /swagger-ui.html\n    - /swagger-resources/**\n    - /*/v2/api-docs\n    - /webjars/**\n\nswagger:\n  client:\n    - mdsp-upms-service\n    - mdsp-gen-service\n\n# 关闭默认路由\nzuul:\n  ignoredServices: \'*\'\n  sensitive-headers:\n\n#开启端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\nsecurity:\n  enabled: false', '7ab4c9e6d3e086d6f1577d02e4996ce0', '2010-05-05 00:00:00', '2019-03-20 22:27:20', NULL, '127.0.0.1', 'U', '');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('fisher', '$2a$10$2D3ATBLJ2YfBoIbtMS5zDuWUdJy3jXjeGthFN/L5OoJJMSUgBpOm2', 1);
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;