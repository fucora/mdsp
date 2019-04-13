

-- 添加模块菜单
INSERT INTO `mdsp_upms`.`sys_resource`(`id`, `name`, `type`, `path`, `permission`, `color`, `parent_id`, `icon`, `component`, `sort`, `create_time`, `modify_time`, `del_flag`, `url`, `method`)
VALUES (1116634105528655874, '网站管理', '0', '/website', '/website', NULL, -1, 'develop', 'Layout', 2, '2019-03-02 15:07:08', '2019-03-03 22:32:28', '0', '', NULL);

-- 添加父菜单
INSERT INTO `mdsp_upms`.`sys_resource`(`id`, `name`, `type`, `path`, `permission`, `color`, `parent_id`, `icon`, `component`, `sort`, `create_time`, `modify_time`, `del_flag`, `url`, `method`)
VALUES (1116634105528655875, '订单管理', '0', 'intentOrder', '/website/intentOrder', NULL, 1116634105528655874, 'yonghuguanli', 'views/website/intentOrder/index', 2, '2017-11-02 22:24:37', '2019-03-03 17:05:20', '0', '', NULL);

-- 添加子菜单
INSERT INTO `mdsp_upms`.`sys_resource`(`id`, `name`, `type`, `path`, `permission`, `color`, `parent_id`, `icon`, `component`, `sort`, `create_time`, `modify_time`, `del_flag`, `url`, `method`)
VALUES (1116634105528655876, '意向客户', '0', '/website/intentOrder', '/website/intentOrder', NULL, 1116634105528655875, 'yonghuguanli', 'views/website/intentOrder/index', 2, '2017-11-02 22:24:37', '2019-03-03 17:05:20', '0', '', NULL);

-- 添加按钮菜单
INSERT INTO `mdsp_upms`.`sys_resource`(`id`, `name`, `type`, `path`, `permission`, `color`, `parent_id`, `icon`, `component`, `sort`, `create_time`, `modify_time`, `del_flag`, `url`, `method`)
VALUES (1116634105528655877, '添加', '1', NULL, 'intent_order_add', NULL, 1116634105528655876, NULL, NULL, 1, '2018-11-05 15:49:44', '2019-03-03 22:06:42', '0', '/website/intentOrder/*', 'POST');

INSERT INTO `mdsp_upms`.`sys_resource`(`id`, `name`, `type`, `path`, `permission`, `color`, `parent_id`, `icon`, `component`, `sort`, `create_time`, `modify_time`, `del_flag`, `url`, `method`)
VALUES (1116634105528655878, '修改', '1', NULL, 'intent_order_update', NULL, 1116634105528655876, NULL, NULL, 1, '2018-11-05 15:50:02', '2019-03-03 22:07:33', '0', '/website/intentOrder/*', 'PUT');

INSERT INTO `mdsp_upms`.`sys_resource`(`id`, `name`, `type`, `path`, `permission`, `color`, `parent_id`, `icon`, `component`, `sort`, `create_time`, `modify_time`, `del_flag`, `url`, `method`)
VALUES (1116634105528655879, '删除', '1', NULL, 'intent_order_delete', NULL, 1116634105528655876, NULL, NULL, 5, '2018-11-05 15:50:26', '2019-03-03 22:07:40', '0', '/website/intentOrder/*', 'DELETE');

INSERT INTO `mdsp_upms`.`sys_resource`(`id`, `name`, `type`, `path`, `permission`, `color`, `parent_id`, `icon`, `component`, `sort`, `create_time`, `modify_time`, `del_flag`, `url`, `method`)
VALUES (1116634105528655880, '查询', '1', NULL, 'intent_order_select', NULL, 1116634105528655876, NULL, NULL, 1, '2018-11-05 15:50:26', '2019-03-03 22:07:58', '0', '/website/intentOrder/*', 'GET');


















