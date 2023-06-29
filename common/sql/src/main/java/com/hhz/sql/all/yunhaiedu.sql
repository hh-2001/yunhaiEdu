/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : yunhaiedu

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 19/06/2023 11:54:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '菜单编号',
  `pid` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '类型(1:菜单,2:按钮)',
  `permission_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_permission
-- ----------------------------
INSERT INTO `acl_permission` VALUES ('1', '0', '全部数据', 0, NULL, NULL, NULL, 'dashboard', NULL, 0, '2019-11-15 17:13:06', '2019-11-15 17:13:06');
INSERT INTO `acl_permission` VALUES ('1195268474480156673', '1', '权限管理', 1, NULL, '/acl', 'Layout', 'nested', NULL, 0, '2019-11-15 17:13:06', '2019-11-18 13:54:25');
INSERT INTO `acl_permission` VALUES ('1195268616021139457', '1195268474480156673', '用户管理', 1, NULL, 'user/list', '/acl/user/list', 'table', NULL, 0, '2019-11-15 17:13:40', '2019-11-18 13:53:12');
INSERT INTO `acl_permission` VALUES ('1195268788138598401', '1195268474480156673', '角色管理', 1, NULL, 'role/list', '/acl/role/list', 'table', NULL, 0, '2019-11-15 17:14:21', '2019-11-15 17:14:21');
INSERT INTO `acl_permission` VALUES ('1195268893830864898', '1195268474480156673', '菜单管理', 1, NULL, 'menu/list', '/acl/menu/list', 'table', NULL, 0, '2019-11-15 17:14:46', '2019-11-15 17:14:46');
INSERT INTO `acl_permission` VALUES ('1195269143060602882', '1195268616021139457', '查看', 2, 'user.list', '', '', NULL, NULL, 0, '2019-11-15 17:15:45', '2019-11-17 21:57:16');
INSERT INTO `acl_permission` VALUES ('1195269295926206466', '1195268616021139457', '添加', 2, 'user.add', 'user/add', '/acl/user/form', NULL, NULL, 0, '2019-11-15 17:16:22', '2019-11-15 17:16:22');
INSERT INTO `acl_permission` VALUES ('1195269473479483394', '1195268616021139457', '修改', 2, 'user.update', 'user/update/:id', '/acl/user/form', NULL, NULL, 0, '2019-11-15 17:17:04', '2019-11-15 17:17:04');
INSERT INTO `acl_permission` VALUES ('1195269547269873666', '1195268616021139457', '删除', 2, 'user.remove', '', '', NULL, NULL, 0, '2019-11-15 17:17:22', '2019-11-15 17:17:22');
INSERT INTO `acl_permission` VALUES ('1195269821262782465', '1195268788138598401', '修改', 2, 'role.update', 'role/update/:id', '/acl/role/form', NULL, NULL, 0, '2019-11-15 17:18:27', '2019-11-15 17:19:53');
INSERT INTO `acl_permission` VALUES ('1195269903542444034', '1195268788138598401', '查看', 2, 'role.list', '', '', NULL, NULL, 0, '2019-11-15 17:18:47', '2019-11-15 17:18:47');
INSERT INTO `acl_permission` VALUES ('1195270037005197313', '1195268788138598401', '添加', 2, 'role.add', 'role/add', '/acl/role/form', NULL, NULL, 0, '2019-11-15 17:19:19', '2019-11-18 11:05:42');
INSERT INTO `acl_permission` VALUES ('1195270442602782721', '1195268788138598401', '删除', 2, 'role.remove', '', '', NULL, NULL, 0, '2019-11-15 17:20:55', '2019-11-15 17:20:55');
INSERT INTO `acl_permission` VALUES ('1195270621548568578', '1195268788138598401', '角色权限', 2, 'role.acl', 'role/distribution/:id', '/acl/role/roleForm', NULL, NULL, 0, '2019-11-15 17:21:38', '2019-11-15 17:21:38');
INSERT INTO `acl_permission` VALUES ('1195270744097742849', '1195268893830864898', '查看', 2, 'permission.list', '', '', NULL, NULL, 0, '2019-11-15 17:22:07', '2019-11-15 17:22:07');
INSERT INTO `acl_permission` VALUES ('1195270810560684034', '1195268893830864898', '添加', 2, 'permission.add', '', '', NULL, NULL, 0, '2019-11-15 17:22:23', '2019-11-15 17:22:23');
INSERT INTO `acl_permission` VALUES ('1195270862100291586', '1195268893830864898', '修改', 2, 'permission.update', '', '', NULL, NULL, 0, '2019-11-15 17:22:35', '2019-11-15 17:22:35');
INSERT INTO `acl_permission` VALUES ('1195270887933009922', '1195268893830864898', '删除', 2, 'permission.remove', '', '', NULL, NULL, 0, '2019-11-15 17:22:41', '2019-11-15 17:22:41');
INSERT INTO `acl_permission` VALUES ('1195349439240048642', '1', '讲师管理', 1, NULL, '/teacher', 'Layout', 'nested', NULL, 0, '2019-11-15 22:34:49', '2019-11-15 22:34:49');
INSERT INTO `acl_permission` VALUES ('1195349699995734017', '1195349439240048642', '讲师列表', 1, NULL, 'table', '/edu/teacher/list', 'table', NULL, 0, '2019-11-15 22:35:52', '2019-11-15 22:35:52');
INSERT INTO `acl_permission` VALUES ('1195349810561781761', '1195349439240048642', '添加讲师', 1, NULL, 'save', '/edu/teacher/save', 'tree', NULL, 0, '2019-11-15 22:36:18', '2019-11-15 22:36:18');
INSERT INTO `acl_permission` VALUES ('1195349876252971010', '1195349810561781761', '添加', 2, 'teacher.add', '', '', 'tree', NULL, 0, '2019-11-15 22:36:34', '2019-11-15 22:36:34');
INSERT INTO `acl_permission` VALUES ('1195349979797753857', '1195349699995734017', '查看', 2, 'teacher.list', '', '', 'tree', NULL, 0, '2019-11-15 22:36:58', '2019-11-15 22:36:58');
INSERT INTO `acl_permission` VALUES ('1195350117270261762', '1195349699995734017', '修改', 2, 'teacher.update', 'edit/:id', '/edu/teacher/save', 'tree', NULL, 0, '2019-11-15 22:37:31', '2019-11-15 22:37:31');
INSERT INTO `acl_permission` VALUES ('1195350188359520258', '1195349699995734017', '删除', 2, 'teacher.remove', '', '', NULL, NULL, 0, '2019-11-15 22:37:48', '2019-11-15 22:37:48');
INSERT INTO `acl_permission` VALUES ('1195350299365969922', '1', '课程分类', 1, NULL, '/subject', 'Layout', 'nested', NULL, 0, '2019-11-15 22:38:15', '2019-11-15 22:38:15');
INSERT INTO `acl_permission` VALUES ('1195350397751758850', '1195350299365969922', '课程分类列表', 1, NULL, 'list', '/edu/subject/list', 'table', NULL, 0, '2019-11-15 22:38:38', '2019-11-15 22:38:38');
INSERT INTO `acl_permission` VALUES ('1195350500512206850', '1195350299365969922', '导入课程分类', 1, NULL, 'import', '/edu/subject/import', 'table', NULL, 0, '2019-11-15 22:39:03', '2019-11-15 22:39:03');
INSERT INTO `acl_permission` VALUES ('1195350612172967938', '1195350397751758850', '查看', 2, 'subject.list', '', '', NULL, NULL, 0, '2019-11-15 22:39:29', '2019-11-15 22:39:29');
INSERT INTO `acl_permission` VALUES ('1195350687590748161', '1195350500512206850', '导入', 2, 'subject.import', '', '', NULL, NULL, 0, '2019-11-15 22:39:47', '2019-11-15 22:39:47');
INSERT INTO `acl_permission` VALUES ('1195350831744782337', '1', '课程管理', 1, NULL, '/course', 'Layout', 'nested', NULL, 0, '2019-11-15 22:40:21', '2019-11-15 22:40:21');
INSERT INTO `acl_permission` VALUES ('1195350919074385921', '1195350831744782337', '课程列表', 1, NULL, 'list', '/edu/course/list', 'table', NULL, 0, '2019-11-15 22:40:42', '2019-11-15 22:40:42');
INSERT INTO `acl_permission` VALUES ('1195351020463296513', '1195350831744782337', '发布课程', 1, NULL, 'info', '/edu/course/info', 'nested', NULL, 0, '2019-11-15 22:41:06', '2019-11-15 22:41:06');
INSERT INTO `acl_permission` VALUES ('1195351159672246274', '1195350919074385921', '完成发布', 2, 'course.publish', 'publish/:id', '/edu/course/publish', NULL, NULL, 0, '2019-11-15 22:41:40', '2019-11-15 22:44:01');
INSERT INTO `acl_permission` VALUES ('1195351326706208770', '1195350919074385921', '编辑课程', 2, 'course.update', 'info/:id', '/edu/course/info', NULL, NULL, 0, '2019-11-15 22:42:19', '2019-11-15 22:42:19');
INSERT INTO `acl_permission` VALUES ('1195351566221938690', '1195350919074385921', '编辑课程大纲', 2, 'chapter.update', 'chapter/:id', '/edu/course/chapter', NULL, NULL, 0, '2019-11-15 22:43:17', '2019-11-15 22:43:17');
INSERT INTO `acl_permission` VALUES ('1195351862889254913', '1', '统计分析', 1, NULL, '/sta', 'Layout', 'nested', NULL, 0, '2019-11-15 22:44:27', '2019-11-15 22:44:27');
INSERT INTO `acl_permission` VALUES ('1195351968841568257', '1195351862889254913', '生成统计', 2, 'statistics.add', 'create', '/sta/create', 'nested', NULL, 0, '2019-11-15 22:44:53', '2019-11-15 22:44:53');
INSERT INTO `acl_permission` VALUES ('1195352054917074946', '1195351862889254913', '统计图表', 2, 'statistics.list', 'show', '/sta/show', 'nested', NULL, 0, '2019-11-15 22:45:13', '2019-11-15 22:45:13');
INSERT INTO `acl_permission` VALUES ('1195352547621965825', '1', 'Banner管理', 1, NULL, '/banner', 'Layout', 'nested', NULL, 0, '2019-11-15 22:47:11', '2019-11-18 10:51:46');
INSERT INTO `acl_permission` VALUES ('1195352856645701633', '1195352547621965825', '幻灯片列表', 1, 'banner.list', 'list', '/edu/banner/list', 'table', NULL, 0, '2019-11-15 22:48:24', '2019-11-15 22:48:24');
INSERT INTO `acl_permission` VALUES ('1195352909401657346', '1195352547621965825', '添加幻灯片', 1, 'banner.add', 'save', '/edu/banner/save', 'tree', NULL, 0, '2019-11-15 22:48:37', '2019-11-18 10:52:10');
INSERT INTO `acl_permission` VALUES ('1195353051395624961', '1195352856645701633', '修改幻灯片', 2, 'banner.update', 'edit/:id', '/edu/banner/save', NULL, NULL, 0, '2019-11-15 22:49:11', '2019-11-18 10:52:05');
INSERT INTO `acl_permission` VALUES ('1195354076890370050', '1', '订单管理', 1, NULL, '/order', 'Layout', 'nested', NULL, 0, '2019-11-15 22:53:15', '2019-11-15 22:53:15');
INSERT INTO `acl_permission` VALUES ('1195354153482555393', '1195354076890370050', '订单列表', 2, NULL, 'list', '/order/list', 'table', NULL, 0, '2019-11-15 22:53:33', '2019-11-15 22:53:58');
INSERT INTO `acl_permission` VALUES ('1196301740985311234', '1195268616021139457', '分配角色', 2, 'user.assgin', 'user/role/:id', '/acl/user/roleForm', NULL, NULL, 0, '2019-11-18 13:38:56', '2019-11-18 13:38:56');
INSERT INTO `acl_permission` VALUES ('1649979110904918018', '1195349439240048642', '讲师级别列表', 1, NULL, 'listLevel', '/edu/teacher/listLevel', 'table', NULL, 0, '2023-04-23 11:30:50', '2023-04-23 11:31:12');
INSERT INTO `acl_permission` VALUES ('1655395898505326594', '1195349439240048642', '添加讲师级别', 1, NULL, 'saveLevel', '/edu/teacher/saveLevel', 'tree', NULL, 0, '2023-05-08 10:15:13', '2023-05-08 10:15:13');

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES ('1', '普通管理员', 'admin', NULL, 0, '2019-11-11 13:09:32', '2019-11-18 10:27:18');
INSERT INTO `acl_role` VALUES ('1193757683205607426', '课程管理员', 'course', NULL, 0, '2019-11-11 13:09:45', '2019-11-18 10:25:44');
INSERT INTO `acl_role` VALUES ('1196300996034977794', 'test', 'test', NULL, 0, '2019-11-18 13:35:58', '2019-11-18 13:35:58');
INSERT INTO `acl_role` VALUES ('1654681864114135042', '路人', NULL, NULL, 0, '2023-05-06 10:57:54', '2023-05-06 10:57:54');

-- ----------------------------
-- Table structure for acl_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_permission`;
CREATE TABLE `acl_role_permission`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `permission_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role_permission
-- ----------------------------
INSERT INTO `acl_role_permission` VALUES ('1648950106865356801', '1196300996034977794', '1195268474480156673', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356802', '1196300996034977794', '1195268616021139457', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356803', '1196300996034977794', '1195269143060602882', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356804', '1196300996034977794', '1195269295926206466', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356805', '1196300996034977794', '1195269473479483394', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356806', '1196300996034977794', '1195269547269873666', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356807', '1196300996034977794', '1196301740985311234', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356808', '1196300996034977794', '1195268788138598401', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356809', '1196300996034977794', '1195269821262782465', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356810', '1196300996034977794', '1195269903542444034', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356811', '1196300996034977794', '1195270037005197313', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356812', '1196300996034977794', '1195270442602782721', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356813', '1196300996034977794', '1195270621548568578', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356814', '1196300996034977794', '1195268893830864898', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356815', '1196300996034977794', '1195270744097742849', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356816', '1196300996034977794', '1195270810560684034', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356817', '1196300996034977794', '1195270862100291586', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356818', '1196300996034977794', '1195270887933009922', 0, '2023-04-20 15:21:56', '2023-04-20 15:21:56');
INSERT INTO `acl_role_permission` VALUES ('1648950106865356819', '1196300996034977794', '1', 0, '2023-05-09 14:11:19', '2023-05-09 14:11:21');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535426', '1', '1195268474480156673', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535427', '1', '1195268616021139457', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535428', '1', '1195269143060602882', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535429', '1', '1195269295926206466', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535430', '1', '1195269473479483394', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535431', '1', '1195269547269873666', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535432', '1', '1196301740985311234', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535433', '1', '1195268788138598401', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535434', '1', '1195269821262782465', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535435', '1', '1195269903542444034', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535436', '1', '1195270037005197313', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535437', '1', '1195270442602782721', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535438', '1', '1195270621548568578', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535439', '1', '1195268893830864898', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535440', '1', '1195270744097742849', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535441', '1', '1195270810560684034', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535442', '1', '1195270862100291586', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535443', '1', '1195270887933009922', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535444', '1', '1195349439240048642', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535445', '1', '1195349699995734017', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535446', '1', '1195349979797753857', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535447', '1', '1195350117270261762', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535448', '1', '1195350188359520258', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535449', '1', '1195349810561781761', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535450', '1', '1195349876252971010', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535451', '1', '1195350299365969922', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535452', '1', '1195350397751758850', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535453', '1', '1195350612172967938', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535454', '1', '1195350500512206850', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535455', '1', '1195350687590748161', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959477762535456', '1', '1195351159672246274', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959478072913921', '1', '1195351020463296513', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959478072913922', '1', '1195351862889254913', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959478072913923', '1', '1195351968841568257', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959478072913924', '1', '1195352054917074946', 0, '2023-04-20 15:59:10', '2023-04-20 15:59:10');
INSERT INTO `acl_role_permission` VALUES ('1648959478072913925', '1', '1', 0, '2023-05-09 14:10:21', '2023-05-09 14:10:23');
INSERT INTO `acl_role_permission` VALUES ('1655820405070221314', '1193757683205607426', '1195350299365969922', 0, '2023-05-09 14:22:03', '2023-05-09 14:22:03');
INSERT INTO `acl_role_permission` VALUES ('1655820405070221315', '1193757683205607426', '1195350397751758850', 0, '2023-05-09 14:22:03', '2023-05-09 14:22:03');
INSERT INTO `acl_role_permission` VALUES ('1655820405070221316', '1193757683205607426', '1195350612172967938', 0, '2023-05-09 14:22:03', '2023-05-09 14:22:03');
INSERT INTO `acl_role_permission` VALUES ('1655820405070221317', '1193757683205607426', '1195350500512206850', 0, '2023-05-09 14:22:03', '2023-05-09 14:22:03');
INSERT INTO `acl_role_permission` VALUES ('1655820405070221318', '1193757683205607426', '1195350687590748161', 0, '2023-05-09 14:22:03', '2023-05-09 14:22:03');
INSERT INTO `acl_role_permission` VALUES ('1655820405078609922', '1193757683205607426', '1195350831744782337', 0, '2023-05-09 14:22:03', '2023-05-09 14:22:03');
INSERT INTO `acl_role_permission` VALUES ('1655820405078609923', '1193757683205607426', '1195350919074385921', 0, '2023-05-09 14:22:03', '2023-05-09 14:22:03');
INSERT INTO `acl_role_permission` VALUES ('1655820405078609924', '1193757683205607426', '1195351159672246274', 0, '2023-05-09 14:22:03', '2023-05-09 14:22:03');
INSERT INTO `acl_role_permission` VALUES ('1655820405086998529', '1193757683205607426', '1195351326706208770', 0, '2023-05-09 14:22:03', '2023-05-09 14:22:03');
INSERT INTO `acl_role_permission` VALUES ('1655820405086998530', '1193757683205607426', '1195351566221938690', 0, '2023-05-09 14:22:03', '2023-05-09 14:22:03');
INSERT INTO `acl_role_permission` VALUES ('1655820405086998531', '1193757683205607426', '1195351020463296513', 0, '2023-05-09 14:22:03', '2023-05-09 14:22:03');
INSERT INTO `acl_role_permission` VALUES ('1655820405086998532', '1193757683205607426', '1', 0, '2023-05-09 14:23:10', '2023-05-09 14:23:13');
INSERT INTO `acl_role_permission` VALUES ('1655824508013879297', '1654681864114135042', '1195351862889254913', 0, '2023-05-09 14:38:21', '2023-05-09 14:38:21');
INSERT INTO `acl_role_permission` VALUES ('1655824508089376770', '1654681864114135042', '1195351968841568257', 0, '2023-05-09 14:38:21', '2023-05-09 14:38:21');
INSERT INTO `acl_role_permission` VALUES ('1655824508089376771', '1654681864114135042', '1195352054917074946', 0, '2023-05-09 14:38:21', '2023-05-09 14:38:21');
INSERT INTO `acl_role_permission` VALUES ('1655824508089376772', '1654681864114135042', '1195352547621965825', 0, '2023-05-09 14:38:21', '2023-05-09 14:38:21');
INSERT INTO `acl_role_permission` VALUES ('1655824508089376773', '1654681864114135042', '1195352856645701633', 0, '2023-05-09 14:38:21', '2023-05-09 14:38:21');
INSERT INTO `acl_role_permission` VALUES ('1655824508097765377', '1654681864114135042', '1195353051395624961', 0, '2023-05-09 14:38:21', '2023-05-09 14:38:21');
INSERT INTO `acl_role_permission` VALUES ('1655824508097765378', '1654681864114135042', '1195352909401657346', 0, '2023-05-09 14:38:21', '2023-05-09 14:38:21');
INSERT INTO `acl_role_permission` VALUES ('1655824508097765379', '1654681864114135042', '1195354076890370050', 0, '2023-05-09 14:38:21', '2023-05-09 14:38:21');
INSERT INTO `acl_role_permission` VALUES ('1655824508097765380', '1654681864114135042', '1195354153482555393', 0, '2023-05-09 14:38:21', '2023-05-09 14:38:21');
INSERT INTO `acl_role_permission` VALUES ('1655824508097765381', '1654681864114135042', '1', 0, '2023-05-09 14:38:21', '2023-05-09 14:38:21');

-- ----------------------------
-- Table structure for acl_user
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`, `username`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user
-- ----------------------------
INSERT INTO `acl_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '123141415', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/23/099f62561b9f40c8a84bcab8078db3abbackgroud.jpg', '1112121', 0, '2019-11-01 10:39:47', '2023-04-23 15:17:45');
INSERT INTO `acl_user` VALUES ('1655819644458356738', 'test1', 'e10adc3949ba59abbe56e057f20f883e', 'test1', NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/09/a450957aef28443da70f89ad33dd7d26duck.jpg', NULL, 0, '2023-05-09 14:19:02', '2023-05-09 14:19:02');
INSERT INTO `acl_user` VALUES ('2', 'test', 'e10adc3949ba59abbe56e057f20f883e', 'test', NULL, NULL, NULL, 0, '2019-11-01 16:36:07', '2019-11-01 16:40:08');

-- ----------------------------
-- Table structure for acl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_role`;
CREATE TABLE `acl_user_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主键id',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user_role
-- ----------------------------
INSERT INTO `acl_user_role` VALUES ('1650073912824684545', '1', '1', 0, '2023-04-23 17:47:32', '2023-04-23 17:47:32');
INSERT INTO `acl_user_role` VALUES ('1655810381459603457', '1', '2', 0, '2023-05-09 13:42:13', '2023-05-09 13:42:13');
INSERT INTO `acl_user_role` VALUES ('1655824668055937026', '1654681864114135042', '1655819644458356738', 0, '2023-05-09 14:38:59', '2023-05-09 14:38:59');

-- ----------------------------
-- Table structure for crm_banner
-- ----------------------------
DROP TABLE IF EXISTS `crm_banner`;
CREATE TABLE `crm_banner`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'ID',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标题',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '所属模块',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '首页banner表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_banner
-- ----------------------------
INSERT INTO `crm_banner` VALUES ('1633364388633980930', 'banner1', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/banner/banner1.jpg', '/index', 0, 0, '2023-03-08 15:09:51', '2023-03-08 15:09:51');
INSERT INTO `crm_banner` VALUES ('1633364473098874882', 'banner2', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/banner/bannner2.jpg', '/index', 1, 0, '2023-03-08 15:10:11', '2023-03-08 15:10:11');
INSERT INTO `crm_banner` VALUES ('1633364596239446017', 'banner3', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/banner/banner3.jpg', '/index', 2, 0, '2023-03-08 15:10:41', '2023-03-08 15:10:41');
INSERT INTO `crm_banner` VALUES ('1633364679035006978', 'banner4', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/banner/banner4.jpg', '/index', 3, 0, '2023-03-08 15:11:01', '2023-03-08 15:11:01');
INSERT INTO `crm_banner` VALUES ('1633364974192373761', 'banner5', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/20/4e53f62a80b949a5846ff5ad61d144ca1.jpg', '/index', 4, 0, '2023-03-08 15:12:11', '2023-04-20 13:19:14');

-- ----------------------------
-- Table structure for edu_article
-- ----------------------------
DROP TABLE IF EXISTS `edu_article`;
CREATE TABLE `edu_article`  (
  `article_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '文章的Id',
  `article_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章类型',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章图片',
  `article_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章名称',
  `create_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_id` int(0) NULL DEFAULT NULL COMMENT '创建人id',
  `gmt_create` date NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` date NULL DEFAULT NULL COMMENT '修改时间',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列表时的小片段',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_article
-- ----------------------------
INSERT INTO `edu_article` VALUES (1, 'Java', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/08/48ecbf762b6b4d71b966f048fff47d22file.png', 'openfeign远程调用学习笔记', 'admin', 1, '2023-04-21', '2023-04-21', 'openfeign的官网学习');
INSERT INTO `edu_article` VALUES (2, 'html', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/08/48ecbf762b6b4d71b966f048fff47d22file.png', 'html介绍', '徐杰', 2, '2023-04-21', '2023-04-21', 'html标签介绍，html简单实现');

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节名称',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示排序',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES ('1', '14', '第一章：HTML', 0, '2019-01-01 12:27:40', '2019-01-01 12:55:30');
INSERT INTO `edu_chapter` VALUES ('1181729226915577857', '18', '第七章：I/O流', 70, '2019-10-09 08:32:58', '2019-10-09 08:33:20');
INSERT INTO `edu_chapter` VALUES ('1192252428399751169', '1192252213659774977', '第一章节', 0, '2019-11-07 09:28:25', '2019-11-07 09:28:25');
INSERT INTO `edu_chapter` VALUES ('15', '18', '第一章：Java入门', 0, '2019-01-01 12:27:40', '2019-10-09 09:13:19');
INSERT INTO `edu_chapter` VALUES ('1632619546400268289', '1632619478658064385', 'html基本语法', 1, '2023-03-06 13:50:07', '2023-03-06 13:50:07');
INSERT INTO `edu_chapter` VALUES ('1632619619477626881', '1632619478658064385', 'CSS基本使用', 2, '2023-03-06 13:50:25', '2023-03-06 13:50:25');
INSERT INTO `edu_chapter` VALUES ('1632619679720415234', '1632619478658064385', 'JavaScript语法与使用', 3, '2023-03-06 13:50:39', '2023-03-06 13:50:39');
INSERT INTO `edu_chapter` VALUES ('1632623073164091394', '1632623017757335554', 'hdf文件系统', 0, '2023-03-06 14:04:08', '2023-03-06 14:04:08');
INSERT INTO `edu_chapter` VALUES ('1632623144660197377', '1632623017757335554', 'MapReduce计算逻辑', 1, '2023-03-06 14:04:25', '2023-03-06 14:04:25');
INSERT INTO `edu_chapter` VALUES ('1632623212519841793', '1632623017757335554', 'Yarn资源调配中心', 3, '2023-03-06 14:04:41', '2023-03-06 14:04:41');
INSERT INTO `edu_chapter` VALUES ('1645247992532054018', '1645247972449726465', '12', 1, '2023-04-10 10:11:03', '2023-04-10 10:11:03');
INSERT INTO `edu_chapter` VALUES ('1645300857011183618', '1645253418531172353', 'Java基础', 1, '2023-04-10 13:41:07', '2023-04-10 13:41:07');
INSERT INTO `edu_chapter` VALUES ('1645622780303851522', '1645247972449726465', '13', 1, '2023-04-11 11:00:20', '2023-04-11 11:00:20');
INSERT INTO `edu_chapter` VALUES ('1654678125848403970', '1654678079639756801', 'hdfs入门', 1, '2023-05-06 10:43:02', '2023-05-06 10:43:02');
INSERT INTO `edu_chapter` VALUES ('1654680394845196290', '1654675964368375810', 'hdfs入门', 1, '2023-05-06 10:52:03', '2023-05-06 10:52:03');
INSERT INTO `edu_chapter` VALUES ('1654692717060186114', '1654691934323367937', 'testImg', 1, '2023-05-06 11:41:01', '2023-05-06 11:41:01');
INSERT INTO `edu_chapter` VALUES ('1655873484901703681', '1655873449132679170', 'title1', 1, '2023-05-09 17:52:58', '2023-05-09 17:52:58');
INSERT INTO `edu_chapter` VALUES ('1655874114227560450', '1655874083885965313', 'title1', 1, '2023-05-09 17:55:28', '2023-05-09 17:55:28');
INSERT INTO `edu_chapter` VALUES ('3', '14', '第二章：CSS', 0, '2019-01-01 12:55:35', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('32', '18', '第二章：控制台输入和输出', 0, '2019-01-01 12:27:40', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('44', '18', '第三章：控制流', 0, '2019-01-01 12:27:40', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('48', '18', '第四章：类的定义', 0, '2019-01-01 12:27:40', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('63', '18', '第五章：数组', 0, '2019-01-01 12:27:40', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('64', '18', '第六章：继承', 61, '2019-01-01 12:27:40', '2019-10-09 08:32:47');

-- ----------------------------
-- Table structure for edu_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_comment`;
CREATE TABLE `edu_comment`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '讲师ID',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '讲师id',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员头像',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_comment
-- ----------------------------
INSERT INTO `edu_comment` VALUES ('1194499162790211585', '1192252213659774977', '1189389726308478977', '1', '小三123', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/23/099f62561b9f40c8a84bcab8078db3abbackgroud.jpg', '课程很好', 0, '2019-11-13 14:16:08', '2019-11-13 14:16:08');
INSERT INTO `edu_comment` VALUES ('1194898406466420738', '1192252213659774977', '1189389726308478977', '1', '小三123', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/23/099f62561b9f40c8a84bcab8078db3abbackgroud.jpg', '11', 0, '2019-11-14 16:42:35', '2019-11-14 16:42:35');
INSERT INTO `edu_comment` VALUES ('1194898484388200450', '1192252213659774977', '1189389726308478977', '1', '小三123', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/23/099f62561b9f40c8a84bcab8078db3abbackgroud.jpg', '111', 0, '2019-11-14 16:42:53', '2019-11-14 16:42:53');
INSERT INTO `edu_comment` VALUES ('1195251020861317122', '1192252213659774977', '1189389726308478977', '1', NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/23/099f62561b9f40c8a84bcab8078db3abbackgroud.jpg', '2233', 0, '2019-11-15 16:03:45', '2019-11-15 16:03:45');
INSERT INTO `edu_comment` VALUES ('1195251382720700418', '1192252213659774977', '1189389726308478977', '1', NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/23/099f62561b9f40c8a84bcab8078db3abbackgroud.jpg', '4455', 0, '2019-11-15 16:05:11', '2019-11-15 16:05:11');
INSERT INTO `edu_comment` VALUES ('1195252819177570306', '1192252213659774977', '1189389726308478977', '1', '小三1231', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/23/099f62561b9f40c8a84bcab8078db3abbackgroud.jpg', '55', 0, '2019-11-15 16:10:53', '2019-11-15 16:10:53');
INSERT INTO `edu_comment` VALUES ('1195252899448160258', '1192252213659774977', '1189389726308478977', '1', '小三1231', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/23/099f62561b9f40c8a84bcab8078db3abbackgroud.jpg', '55', 0, '2019-11-15 16:11:13', '2019-11-15 16:11:13');
INSERT INTO `edu_comment` VALUES ('1195252920587452417', '1192252213659774977', '1189389726308478977', '1', '小三1231', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/23/099f62561b9f40c8a84bcab8078db3abbackgroud.jpg', '223344', 0, '2019-11-15 16:11:18', '2019-11-15 16:11:18');
INSERT INTO `edu_comment` VALUES ('1195262128095559681', '14', '1189389726308478977', '1', '小三1231', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/23/099f62561b9f40c8a84bcab8078db3abbackgroud.jpg', '11', 0, '2019-11-15 16:47:53', '2019-11-15 16:47:53');
INSERT INTO `edu_comment` VALUES ('1196264505170767874', '1192252213659774977', '1189389726308478977', '1', '小三1231', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/23/099f62561b9f40c8a84bcab8078db3abbackgroud.jpg', '666666', 0, '2019-11-18 11:10:58', '2019-11-18 11:10:58');
INSERT INTO `edu_comment` VALUES ('1670639803387736066', '1645247972449726465', '1', '1633357594188640258', 'what', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/09/6a37d6d28eac46a2abdb76620ecdefaa2abs3PKlPgjd85bbf77ee6940ba95fef36071b58d446.jpg', '12', 0, '2023-06-19 11:49:03', '2023-06-19 11:49:03');
INSERT INTO `edu_comment` VALUES ('1670639811268833281', '1645247972449726465', '1', '1633357594188640258', 'what', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/09/6a37d6d28eac46a2abdb76620ecdefaa2abs3PKlPgjd85bbf77ee6940ba95fef36071b58d446.jpg', '12', 0, '2023-06-19 11:49:05', '2023-06-19 11:49:05');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `owner_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程所有人ID',
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程专业ID',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程专业父级ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程标题',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
  `is_deleted` int(3) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `idx_teacher_id`(`owner_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('1632619478658064385', '1632616175941554178', '1178585108454121473', '1178214681181483010', 'html入门到入土', 120.00, 10, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/08/04b1a8c8cf204031a39ba815e7fa9beaduck.jpg', 0, 0, 1, 'Normal', 000, '2023-03-06 13:49:51', '2023-05-08 10:00:34');
INSERT INTO `edu_course` VALUES ('1632623017757335554', '1', '1178214681504444418', '1178214681483472898', 'Hadoop入门到脱发', 450.00, 12, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/08/78a47e8c88d34b54b4a3cb577ef2f540duck.jpg', 0, 0, 1, 'Normal', 000, '2023-03-06 14:03:55', '2023-05-08 10:00:21');
INSERT INTO `edu_course` VALUES ('1645247972449726465', '1', '1178214681139539969', '1178214681118568449', 'test', 0.00, 1, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/08/d81863b71681434da4f0f8c6345bffbeduck.jpg', 0, 0, 1, 'Normal', 000, '2023-04-10 10:10:59', '2023-05-08 09:59:49');
INSERT INTO `edu_course` VALUES ('1645253418531172353', '1189390295668469762', '1178214681139539969', '1178214681118568449', 'JavaWeb', 1.00, 6, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', 0, 0, 1, 'Normal', 000, '2023-04-10 10:32:37', '2023-04-23 17:27:04');
INSERT INTO `edu_course` VALUES ('1651497894299828226', '1', '1178214681139539969', '1178214681118568449', 'test', 12.00, 12, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', 0, 0, 1, 'Draft', NULL, '2023-04-27 16:05:56', '2023-05-09 17:52:02');
INSERT INTO `edu_course` VALUES ('1654675964368375810', '1192249914833055746', '1178214681504444418', '1178214681483472898', 'hdfs', 0.00, 1, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/06/dcf8ef9b58614c388ea8429e9f301eccduck.jpg', 0, 0, 1, 'Draft', NULL, '2023-05-06 10:34:27', '2023-05-06 10:56:02');
INSERT INTO `edu_course` VALUES ('1654676603127324674', '1', '1178585108407984130', '1178214681118568449', 'qe', 0.00, 1, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/08/9b851c1399a6400ca287059efe6d2d51duck.jpg', 0, 0, 1, 'Normal', NULL, '2023-05-06 10:36:59', '2023-05-08 09:41:26');
INSERT INTO `edu_course` VALUES ('1654678079639756801', '1189426464967995393', '1178214681504444418', '1178214681483472898', 'hdfs', 0.00, 5, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/06/82ac3f899c69429c95d0c13647849e66duck.jpg', 0, 0, 1, 'Normal', NULL, '2023-05-06 10:42:51', '2023-05-10 13:47:23');
INSERT INTO `edu_course` VALUES ('1654691934323367937', '1', '1178214681252786178', '1178214681231814658', 'testImg', 0.00, 10, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/08/a28cca8068dd48ee8e8ac6565c796057duck.jpg', 0, 0, 1, 'Normal', NULL, '2023-05-06 11:37:54', '2023-05-08 09:59:19');
INSERT INTO `edu_course` VALUES ('1654716473098919937', '1189426437876985857', '1178585108407984130', '1178214681118568449', 'test', 0.00, 3, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/06/bb0a562b7faf43c3955ee7f15c790c4cduck.jpg', 0, 0, 1, 'Normal', NULL, '2023-05-06 13:15:25', '2023-05-08 11:54:24');
INSERT INTO `edu_course` VALUES ('1654716816453033985', '1189426437876985857', '1178214681139539969', '1178214681118568449', 'rte', 0.00, 1, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/06/f601a710a3f64e1f932b549fe31bfce6duck.jpg', 0, 0, 1, 'Normal', NULL, '2023-05-06 13:16:47', '2023-05-08 11:51:46');
INSERT INTO `edu_course` VALUES ('1655873449132679170', '1189426437876985857', '1178214681139539969', '1178214681118568449', 'adad', 0.00, 1, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/09/414cbca0af2f456399f5cddbdc59f1fc可达.jpeg', 0, 0, 1, 'Normal', NULL, '2023-05-09 17:52:50', '2023-05-09 17:53:02');
INSERT INTO `edu_course` VALUES ('1655874083885965313', '1189426437876985857', '1178214681139539969', '1178214681118568449', 'tesfasf', 123.00, 1, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/09/09873e938a5b44a88779c5bf45742799duck.jpg', 0, 0, 1, 'Normal', NULL, '2023-05-09 17:55:21', '2023-06-19 11:31:45');

-- ----------------------------
-- Table structure for edu_course_collect
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_collect`;
CREATE TABLE `edu_course_collect`  (
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程讲师ID',
  `member_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程专业ID',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程收藏' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course_collect
-- ----------------------------
INSERT INTO `edu_course_collect` VALUES ('1632619478658064385', '1633357594188640258', 1, '2019-11-18 11:30:12', '2019-11-18 11:30:12');
INSERT INTO `edu_course_collect` VALUES ('1632619478658064385', '1633357594188640258', 0, '2023-04-19 10:28:28', '2023-04-19 10:28:31');
INSERT INTO `edu_course_collect` VALUES ('1645247972449726465', '1633357594188640258', 0, '2023-05-10 10:13:42', '2023-05-10 10:13:42');
INSERT INTO `edu_course_collect` VALUES ('1645253418531172353', '1633357594188640258', 0, '2023-05-10 10:15:25', '2023-05-10 10:15:25');

-- ----------------------------
-- Table structure for edu_course_description
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_description`;
CREATE TABLE `edu_course_description`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '课程简介',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程简介' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_course_description
-- ----------------------------
INSERT INTO `edu_course_description` VALUES ('1632619478658064385', '<p>12e31eadad</p>', '2023-03-06 13:49:51', '2023-05-08 10:00:30');
INSERT INTO `edu_course_description` VALUES ('1632623017757335554', '<p>12e31eadad</p>', '2023-03-06 14:03:55', '2023-05-08 10:00:18');
INSERT INTO `edu_course_description` VALUES ('1645247972449726465', '<p>12e31eadad</p>', '2023-04-10 10:10:59', '2023-05-08 09:59:46');
INSERT INTO `edu_course_description` VALUES ('1645253418531172353', '<p>12e31eadad</p>', '2023-04-10 10:32:37', '2023-05-06 10:36:59');
INSERT INTO `edu_course_description` VALUES ('1651497894299828226', '<p>12e31eadad</p>', '2019-03-06 18:06:36', '2023-05-09 17:52:02');
INSERT INTO `edu_course_description` VALUES ('1654675964368375810', '<p>的公司的噶时光</p>', '2023-05-06 10:56:02', '2023-05-06 10:56:02');
INSERT INTO `edu_course_description` VALUES ('1654676603127324674', NULL, '2023-05-08 09:40:31', '2023-05-08 09:41:22');
INSERT INTO `edu_course_description` VALUES ('1654678079639756801', '<p><img class=\"wscnph\" src=\"https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/06/b42954b835c34e708f0da3214da1ae45邱淑贞.jpg\" />asdasd</p>', '2023-05-06 10:42:51', '2023-05-06 11:43:13');
INSERT INTO `edu_course_description` VALUES ('1654691934323367937', '<p><img class=\"wscnph\" src=\"https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/06/4bb966816406475f89178340f9e94f03duck.jpg\" /><img class=\"wscnph\" src=\"undefined\" />asfasfafgsdgasg</p>', '2023-05-06 11:37:54', '2023-05-08 09:59:15');
INSERT INTO `edu_course_description` VALUES ('1654716473098919937', 'adada', '2023-05-06 13:15:25', '2023-05-08 11:54:20');
INSERT INTO `edu_course_description` VALUES ('1654716816453033985', 'asaadcv', '2023-05-06 13:16:47', '2023-05-08 11:51:46');
INSERT INTO `edu_course_description` VALUES ('1655873449132679170', '<p>asdafafag</p>', '2023-05-09 17:52:50', '2023-05-09 17:52:50');
INSERT INTO `edu_course_description` VALUES ('1655874083885965313', '<p>affasdafsf</p>', '2023-05-09 17:55:21', '2023-06-19 11:31:41');

-- ----------------------------
-- Table structure for edu_level
-- ----------------------------
DROP TABLE IF EXISTS `edu_level`;
CREATE TABLE `edu_level`  (
  `level_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职位ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职位名称',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '讲师级别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_level
-- ----------------------------
INSERT INTO `edu_level` VALUES ('1', '首席讲师', '教授级别，十年项目经验', '2023-04-07 11:05:57', '2023-04-07 15:01:57', 2);
INSERT INTO `edu_level` VALUES ('2', '高级讲师', '高级别讲师，本科毕业，5年编程经验', '2023-04-07 11:05:57', '2023-04-07 14:16:18', 1);
INSERT INTO `edu_level` VALUES ('3', '特级教师', '博士后驻站导师', '2023-04-07 15:01:47', '2023-04-07 15:48:18', 3);
INSERT INTO `edu_level` VALUES ('4', '终极讲师', '骨灰级，图灵奖', '2023-04-07 15:48:55', '2023-04-07 15:48:55', 4);

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程类别ID',
  `title` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名称',
  `parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程分类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES ('1178214681118568449', '后端开发', '0', 1, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681139539969', 'Java', '1178214681118568449', 1, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681181483010', '前端开发', '0', 3, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681210843137', 'JavaScript', '1178214681181483010', 4, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681231814658', '云计算', '0', 5, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681252786178', 'Docker', '1178214681231814658', 5, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681294729217', 'Linux', '1178214681231814658', 6, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681324089345', '系统/运维', '0', 7, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681353449473', 'Linux', '1178214681324089345', 7, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681382809602', 'Windows', '1178214681324089345', 8, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681399586817', '数据库', '0', 9, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681428946945', 'MySQL', '1178214681399586817', 9, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681454112770', 'MongoDB', '1178214681399586817', 10, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681483472898', '大数据', '0', 11, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681504444418', 'Hadoop', '1178214681483472898', 11, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681529610242', 'Spark', '1178214681483472898', 12, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681554776066', '人工智能', '0', 13, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681584136193', 'Python', '1178214681554776066', 13, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681613496321', '编程语言', '0', 14, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178214681626079234', 'Java', '1178214681613496321', 14, '2019-09-29 15:47:25', '2019-09-29 15:47:25');
INSERT INTO `edu_subject` VALUES ('1178585108407984130', 'Python', '1178214681118568449', 2, '2019-09-30 16:19:22', '2019-09-30 16:19:22');
INSERT INTO `edu_subject` VALUES ('1178585108454121473', 'HTML/CSS', '1178214681181483010', 3, '2019-09-30 16:19:22', '2019-09-30 16:19:22');
INSERT INTO `edu_subject` VALUES ('1632645487168176129', 'vue', '1178214681181483010', 0, '2023-03-06 15:33:12', '2023-03-06 15:33:12');
INSERT INTO `edu_subject` VALUES ('1632645487168176130', 'jquery', '1178214681181483010', 0, '2023-03-06 15:33:12', '2023-03-06 15:33:12');
INSERT INTO `edu_subject` VALUES ('1632645487205924866', 'C++', '1178214681118568449', 0, '2023-03-06 15:33:12', '2023-03-06 15:33:12');
INSERT INTO `edu_subject` VALUES ('1632645487205924867', '数据库开发', '0', 0, '2023-03-06 15:33:12', '2023-03-06 15:33:12');
INSERT INTO `edu_subject` VALUES ('1632645487205924868', 'mysql', '1632645487205924867', 0, '2023-03-06 15:33:12', '2023-03-06 15:33:12');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '讲师ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '讲师姓名',
  `intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '讲师简介',
  `career` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
  `level` int(0) UNSIGNED NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师头像',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(3) UNSIGNED ZEROFILL NOT NULL DEFAULT 000 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '讲师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES ('1', '张三', '近年主持国家自然科学基金（6项）、江苏省重大科技成果转化项目（5项）、江苏省产学研前瞻性联合研究项目（3项）、省工业科技支撑、省高技术、省自然科学基金等省部级及其企业的主要科研项目40多个，多个项目在企业成功转化，产生了较好的经济、社会和环境效益。积极开展产学研科技合作，并与省内16家企业建立了江苏省研究生工作站，其中6家为江苏省优秀研究生工作站', '高级讲师', 1, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/06/c48a551090f3467b87e91e4167f15f0cfile.png', 0, 000, '2019-10-30 14:18:46', '2023-03-06 14:32:57');
INSERT INTO `edu_teacher` VALUES ('1189389726308478977', '晴天', '高级讲师简介', '高级讲师', 2, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/08/af7614e3f9644e19a3c325de3fa91619file.png', 1, 000, '2019-10-30 11:53:03', '2023-03-08 16:57:10');
INSERT INTO `edu_teacher` VALUES ('1189390295668469762', '李刚', '自然学家，考古学家，荣获地质维特勒森奖', '高级讲师', 2, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/08/48ecbf762b6b4d71b966f048fff47d22file.png', 2, 000, '2019-10-30 11:55:19', '2023-03-08 16:56:37');
INSERT INTO `edu_teacher` VALUES ('1189426437876985857', '王二', '高级讲师简介', '高级讲师', 3, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/08/a38c87f92c3a4ba8b0f3decec678ed52file.png', 0, 000, '2019-10-30 14:18:56', '2023-03-08 15:17:51');
INSERT INTO `edu_teacher` VALUES ('1189426464967995393', '王五', '高级讲师简介', '高级讲师', 1, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/08/15006e16a759438d876d7e55cb06a534file.png', 0, 000, '2019-10-30 14:19:02', '2023-03-08 15:17:32');
INSERT INTO `edu_teacher` VALUES ('1192249914833055746', '李四', '高级讲师简介', '高级讲师', 1, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/06/9e5c2f36cb4b4c7ba1dade49bfea515ffile.png', 0, 000, '2019-11-07 09:18:25', '2023-03-06 14:31:22');
INSERT INTO `edu_teacher` VALUES ('1632616175941554178', 'QDADA', '示范法撒个', '特级教师', 3, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/07/59280eecf41c4299b372268f0e909ed8file.png', 1, 000, '2023-03-06 13:36:44', '2023-04-07 17:41:43');
INSERT INTO `edu_teacher` VALUES ('1644275658853822466', '黄晓明', '斯坦福大学毕业，五年架构师', '高级讲师', 2, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/07/fd14b335b23d4cb78dca18d7de0f9cecfile.png', 1, 000, '2023-04-07 17:47:21', '2023-04-07 17:47:21');
INSERT INTO `edu_teacher` VALUES ('1651488856157757441', 'test', 'test', '高级讲师', 2, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/27/831ec7f19ac8478a9c0b12d70b3eea60file.png', 1, 000, '2023-04-27 15:30:01', '2023-04-27 15:30:01');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `chapter_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点名称',
  `type` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '类型（0:视频，1:音频）',
  `video_source_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数',
  `is_free` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT 0 COMMENT '视频时长（秒）',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'Empty' COMMENT 'Empty未上传 Transcoding转码中  Normal正常',
  `size` bigint(0) UNSIGNED NULL DEFAULT 0 COMMENT '视频源文件大小（字节）',
  `version` bigint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程视频' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES ('1182499307429339137', '18', '32', '第一节', '0', '', '', 0, 0, 0, 0, '', 0, 1, '2019-10-11 11:32:59', '2019-10-11 11:57:38');
INSERT INTO `edu_video` VALUES ('1185312444399071234', '14', '1', '12', '0', '', '', 0, 0, 0, 0, 'Empty', 0, 1, '2019-10-19 05:51:23', '2019-10-19 05:51:33');
INSERT INTO `edu_video` VALUES ('1189434737808990210', '18', '44', '测试', '0', '', '', 1, 0, 0, 0, 'Empty', 0, 1, '2019-10-30 14:51:55', '2019-10-30 14:51:55');
INSERT INTO `edu_video` VALUES ('1189471423678939138', '18', '1181729226915577857', 'test', '0', '46d562c0a7a771edac666733a68f0102\r\n', '视频', 1, 0, 0, 0, 'Empty', 0, 1, '2019-10-30 17:17:41', '2019-10-30 17:17:41');
INSERT INTO `edu_video` VALUES ('1189476403626409986', '18', '1181729226915577857', '22', '0', '5155c73dc112475cbbddccf4723f7cef', '视频.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2019-10-30 17:37:29', '2019-10-30 17:37:29');
INSERT INTO `edu_video` VALUES ('1192252824606289921', '1192252213659774977', '1192252428399751169', '第一课时', '0', '756cf06db9cb4f30be85a9758b19c645', 'eae2b847ef8503b81f5d5593d769dde2.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2019-11-07 09:29:59', '2019-11-07 09:29:59');
INSERT INTO `edu_video` VALUES ('1192628092797730818', '1192252213659774977', '1192252428399751169', '第二课时', '0', '2a02d726622f4c7089d44cb993c531e1', 'eae2b847ef8503b81f5d5593d769dde2.mp4', 0, 0, 1, 0, 'Empty', 0, 1, '2019-11-08 10:21:10', '2019-11-08 10:21:22');
INSERT INTO `edu_video` VALUES ('1192632495013380097', '1192252213659774977', '1192252428399751169', '第三课时', '0', '4e560c892fdf4fa2b42e0671aa42fa9d', 'eae2b847ef8503b81f5d5593d769dde2.mp4', 0, 0, 1, 0, 'Empty', 0, 1, '2019-11-08 10:38:40', '2019-11-08 10:38:40');
INSERT INTO `edu_video` VALUES ('1194117638832111617', '1192252213659774977', '1192252428399751169', '第四课时', '0', '4e560c892fdf4fa2b42e0671aa42fa9d', 'eae2b847ef8503b81f5d5593d769dde2.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2019-11-12 13:00:05', '2019-11-12 13:00:05');
INSERT INTO `edu_video` VALUES ('1196263770832023554', '1192252213659774977', '1192252428399751169', '第五课时', '0', '27d21158b0834cb5a8d50710937de330', 'eae2b847ef8503b81f5d5593d769dde2.mp4', 5, 0, 0, 0, 'Empty', 0, 1, '2019-11-18 11:08:03', '2019-11-18 11:08:03');
INSERT INTO `edu_video` VALUES ('1645295815302582273', '1645247972449726465', '1645247992532054018', 'test', '0', '5a549bc0d76071ed8e8a6732b68f0102', '2', 1, 0, 0, 0, 'Empty', 0, 1, '2023-04-10 13:21:05', '2023-04-10 13:21:05');
INSERT INTO `edu_video` VALUES ('1645297373989838850', '1645247972449726465', '1645247992532054018', 'test1', '0', '5a549bc0d76071ed8e8a6732b68f0102', '1', 2, 0, 0, 0, 'Empty', 0, 1, '2023-04-10 13:27:17', '2023-04-10 13:27:17');
INSERT INTO `edu_video` VALUES ('1645297950698250241', '1645247972449726465', '1645247992532054018', 'test2', '0', 'a94bc1e0d76071ed8e8a6732b68f0102', '1', 3, 0, 0, 0, 'Empty', 0, 1, '2023-04-10 13:29:34', '2023-04-10 13:29:34');
INSERT INTO `edu_video` VALUES ('1645300926045233153', '1645253418531172353', '1645300857011183618', '基本数据类型', '0', 'a46b6b60d76771ed8bef0675b3ed0102', NULL, 1, 0, 0, 0, 'Empty', 0, 1, '2023-04-10 13:41:24', '2023-04-10 14:19:30');
INSERT INTO `edu_video` VALUES ('1645624731263385602', '1645247972449726465', '1645622780303851522', 'test', '0', 'f38c77b0d81771ed80780764a0fd0102', NULL, 1, 0, 0, 0, 'Empty', 0, 1, '2023-04-11 11:08:05', '2023-04-11 11:21:36');
INSERT INTO `edu_video` VALUES ('1656167103546011650', '1654678079639756801', '1654678125848403970', 'test', '0', 'd6789ba0eef571ed80210764a3fc0102', '可达鸭', 1, 0, 0, 0, 'Empty', 0, 1, '2023-05-10 13:19:42', '2023-05-10 13:45:17');
INSERT INTO `edu_video` VALUES ('1656174034801143809', '1654678079639756801', '1654678125848403970', 'test1', '0', '1d393f90eef671ed80210764a3fc0102', '视频', 2, 0, 0, 0, 'Empty', 0, 1, '2023-05-10 13:47:15', '2023-05-10 13:47:15');
INSERT INTO `edu_video` VALUES ('1670616781792485378', '1655874083885965313', '1655874114227560450', 'test', '1', '6ebea9c00e4771eebdb66723b78e0102', '可达鸭', 1, 0, 1, 0, 'Empty', 0, 1, '2023-06-19 10:17:34', '2023-06-19 10:37:42');
INSERT INTO `edu_video` VALUES ('17', '18', '15', '第一节：Java简介', '0', '196116a6fee742e1ba9f6c18f65bd8c1', '1', 1, 1000, 1, 100, 'Draft', 0, 1, '2019-01-01 13:08:57', '2019-10-11 11:26:39');
INSERT INTO `edu_video` VALUES ('18', '18', '15', '第二节：表达式和赋值语句', '0', '2d99b08ca0214909899910c9ba042d47', '7 - How Do I Find Time for My ', 2, 999, 1, 100, 'Draft', 0, 1, '2019-01-01 13:09:02', '2019-03-08 03:30:27');
INSERT INTO `edu_video` VALUES ('19', '18', '15', '第三节：String类', '0', '51120d59ddfd424cb5ab08b44fc8b23a', 'eae2b847ef8503b81f5d5593d769dde2.mp4', 3, 888, 0, 100, 'Draft', 0, 1, '2019-01-01 13:09:05', '2019-11-12 12:50:45');
INSERT INTO `edu_video` VALUES ('20', '18', '15', '第四节：程序风格', '0', '2a38988892d84df598752226c50f3fa3', '00-day10总结.avi', 4, 666, 0, 100, 'Draft', 0, 1, '2019-01-01 13:09:05', '2019-10-11 09:20:09');

-- ----------------------------
-- Table structure for statistics_daily
-- ----------------------------
DROP TABLE IF EXISTS `statistics_daily`;
CREATE TABLE `statistics_daily`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号ID',
  `date_calculated` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '统计日期',
  `register_num` int(0) NOT NULL DEFAULT 0 COMMENT '注册人数',
  `login_num` int(0) NOT NULL DEFAULT 0 COMMENT '登录人数',
  `video_view_num` int(0) NOT NULL DEFAULT 0 COMMENT '每日播放视频数',
  `course_num` int(0) NOT NULL DEFAULT 0 COMMENT '每日新增课程数',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `statistics_day`(`date_calculated`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站统计日数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of statistics_daily
-- ----------------------------
INSERT INTO `statistics_daily` VALUES ('1648370811075936257', '2023-04-18', 0, 148, 171, 196, '2023-04-19 01:00:01', '2023-04-19 01:00:01');
INSERT INTO `statistics_daily` VALUES ('1648733190150275074', '2023-04-19', 0, 165, 116, 169, '2023-04-20 00:59:59', '2023-04-20 00:59:59');
INSERT INTO `statistics_daily` VALUES ('1649095585884356609', '2023-04-20', 0, 146, 185, 192, '2023-04-21 01:00:01', '2023-04-21 01:00:01');
INSERT INTO `statistics_daily` VALUES ('1650182748973563905', '2023-04-23', 0, 176, 158, 155, '2023-04-24 01:00:01', '2023-04-24 01:00:01');
INSERT INTO `statistics_daily` VALUES ('1655491343093080065', '2023-05-16', 0, 181, 195, 106, '2023-05-08 16:34:28', '2023-05-08 16:34:28');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '编号ID',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `course_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程封面',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师名称',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员手机',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '订单金额（分）',
  `pay_type` tinyint(0) NULL DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_order_no`(`order_no`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1195693605513891841', '1195693605555834880', '18', 'Java精品课程', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '晴天', '1', '小三1231', '13700000001', 1.00, NULL, 0, 0, '2019-11-16 21:22:25', '2019-11-16 21:22:25');
INSERT INTO `t_order` VALUES ('1195694200178118657', '1195694200186507264', '18', 'Java精品课程', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '晴天', '1', '小三1231', '13700000001', 1.00, NULL, 0, 0, '2019-11-16 21:24:47', '2019-11-16 21:24:47');
INSERT INTO `t_order` VALUES ('1196264007411744769', '1196264005255872512', '1192252213659774977', 'java基础课程：test', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '晴天', '1', '小三1231', '13700000001', 1.00, NULL, 1, 0, '2019-11-18 11:09:00', '2019-11-18 11:10:14');
INSERT INTO `t_order` VALUES ('1196265495278174209', '1196265495273979904', '18', 'Java精品课程', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '晴天', '1', '小三1231', '13700000001', 1.00, NULL, 0, 0, '2019-11-18 11:14:54', '2019-11-18 11:14:54');
INSERT INTO `t_order` VALUES ('1645243880105132034', '20230410095442482', '1632623017757335554', 'Hadoop入门到脱发', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/06/83cf5d5e2a444a678c89667e0a3acf3c8-3-1.jpg', '张三', '1633357594188640258', '噶事', '18312045087', 450.00, 1, 0, 0, '2023-04-10 09:54:43', NULL);
INSERT INTO `t_order` VALUES ('1645246034580721665', '20230410100316125', '1632619478658064385', 'html入门到入土', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/06/1956a74ae6304f20af80840cf84fcecb8-3-1.jpg', 'QDADA', '1633357594188640258', '噶事', '18312045087', 120.00, 1, 0, 0, '2023-04-10 10:03:16', NULL);
INSERT INTO `t_order` VALUES ('1645246898720591873', '20230410100642308', '1632623017757335554', 'Hadoop入门到脱发', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/06/83cf5d5e2a444a678c89667e0a3acf3c8-3-1.jpg', '张三', '1633357594188640258', '噶事', '18312045087', 450.00, 1, 0, 0, '2023-04-10 10:06:43', NULL);
INSERT INTO `t_order` VALUES ('1645248051969642497', '20230410101117918', '1645247972449726465', 'test', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '张三', '1633357594188640258', '噶事', '18312045087', 1.00, 1, 0, 0, '2023-04-10 10:11:17', NULL);
INSERT INTO `t_order` VALUES ('1645263176168493058', '20230410111123395', '1632623017757335554', 'Hadoop入门到脱发', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/06/83cf5d5e2a444a678c89667e0a3acf3c8-3-1.jpg', '张三', '1633357594188640258', '噶事', '18312045087', 450.00, 1, 0, 0, '2023-04-10 11:11:23', NULL);
INSERT INTO `t_order` VALUES ('1645307291484672001', '20230410140641884', '1645253418531172353', 'JavaWeb', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '李刚', '1633357594188640258', '噶事', '18312045087', 0.00, 1, 0, 0, '2023-04-10 14:06:41', NULL);
INSERT INTO `t_order` VALUES ('1645310818231599105', '20230410142042984', '1645253418531172353', 'JavaWeb', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '李刚', '1633357594188640258', '噶事', '18312045087', 0.00, 1, 0, 0, '2023-04-10 14:20:42', NULL);
INSERT INTO `t_order` VALUES ('1645316883862003713', '20230410144448100', '1645253418531172353', 'JavaWeb', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '李刚', '1633357594188640258', '噶事', '18312045087', 0.00, 1, 0, 0, '2023-04-10 14:44:48', NULL);
INSERT INTO `t_order` VALUES ('1645317405121716225', '20230410144652969', '1645253418531172353', 'JavaWeb', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '李刚', '1633357594188640258', '噶事', '18312045087', 1.00, 1, 0, 0, '2023-04-10 14:46:53', NULL);
INSERT INTO `t_order` VALUES ('1645364063389970434', '20230410175216219', '1645253418531172353', 'JavaWeb', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '李刚', '1633357594188640258', '噶事', '18312045087', 1.00, 1, 0, 0, '2023-04-10 17:52:17', NULL);
INSERT INTO `t_order` VALUES ('1645692701528387585', '20230411153810520', '1632619478658064385', 'html入门到入土', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/06/1956a74ae6304f20af80840cf84fcecb8-3-1.jpg', 'QDADA', '1633357594188640258', '噶事', '18312045087', 120.00, 1, 0, 0, '2023-04-11 15:38:10', NULL);
INSERT INTO `t_order` VALUES ('1648499570982522881', '20230419093139624', '1645253418531172353', 'JavaWeb', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '李刚', '1633357594188640258', '噶事', '18312045087', 1.00, 1, 0, 0, '2023-04-19 09:31:40', '2023-04-19 09:31:40');
INSERT INTO `t_order` VALUES ('1648568644026503169', '20230419140608185', '1645253418531172353', 'JavaWeb', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '李刚', '1633357594188640258', '噶事', '18312045087', 1.00, 1, 1, 0, '2023-04-19 14:06:08', '2023-04-19 14:11:50');
INSERT INTO `t_order` VALUES ('1648570124771110913', '20230419141201182', '1645253418531172353', 'JavaWeb', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '李刚', '1633357594188640258', '噶事', '18312045087', 1.00, 1, 1, 0, '2023-04-19 14:12:01', '2023-04-19 14:12:07');
INSERT INTO `t_order` VALUES ('1648570414375219201', '20230419141310648', '1645253418531172353', 'JavaWeb', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '李刚', '1633357594188640258', '噶事', '18312045087', 1.00, 1, 1, 0, '2023-04-19 14:13:10', '2023-04-19 14:13:15');
INSERT INTO `t_order` VALUES ('1648570464899805185', '20230419141322693', '1645253418531172353', 'JavaWeb', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', '李刚', '1633357594188640258', '噶事', '18312045087', 1.00, 1, 1, 0, '2023-04-19 14:13:22', '2023-04-19 14:13:27');
INSERT INTO `t_order` VALUES ('1648927293819432961', '20230420135117906', '1632619478658064385', 'html入门到入土', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/06/1956a74ae6304f20af80840cf84fcecb8-3-1.jpg', 'QDADA', '1633357594188640258', '噶事', '18312045087', 120.00, 1, 1, 0, '2023-04-20 13:51:17', '2023-04-20 13:51:23');
INSERT INTO `t_order` VALUES ('1650318035187941377', '20230424095735495', '1632623017757335554', 'Hadoop入门到脱发', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/03/06/83cf5d5e2a444a678c89667e0a3acf3c8-3-1.jpg', '张三', '1633357594188640258', '什么', '18312045087', 450.00, 1, 0, 0, '2023-04-24 09:57:36', '2023-04-24 09:57:36');
INSERT INTO `t_order` VALUES ('1655891912710422529', '20230509190611557', '1632623017757335554', 'Hadoop入门到脱发', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/08/78a47e8c88d34b54b4a3cb577ef2f540duck.jpg', '张三', '1633357594188640258', 'what', '18312045087', 450.00, 1, 1, 0, '2023-05-09 19:06:12', '2023-05-09 19:08:42');
INSERT INTO `t_order` VALUES ('1670635776109305858', '20230619113302875', '1655874083885965313', 'tesfasf', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/09/09873e938a5b44a88779c5bf45742799duck.jpg', '王二', '1633357594188640258', 'what', '18312045087', 123.00, 1, 1, 0, '2023-06-19 11:33:03', '2023-06-19 11:33:19');

-- ----------------------------
-- Table structure for t_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_log`;
CREATE TABLE `t_pay_log`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '编号ID',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '支付金额（分）',
  `transaction_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `trade_state` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易状态',
  `pay_type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '支付类型（1：微信 2：支付宝）',
  `attr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '其他属性',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pay_log
-- ----------------------------
INSERT INTO `t_pay_log` VALUES ('1194498446013001730', '1194498300579704832', '2019-11-13 14:13:17', 1.00, '4200000469201911130676624386', 'SUCCESS', 1, '{\"transaction_id\":\"4200000469201911130676624386\",\"nonce_str\":\"2Lc23ILl231It53M\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"CFT\",\"openid\":\"oNpSGwR-QGG5DaZtDkh2UZlsFDQE\",\"sign\":\"5404850AA3ED0E844DE104651477F07A\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1473426802\",\"cash_fee\":\"1\",\"out_trade_no\":\"1194498300579704832\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx8397f8696b538317\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191113141314\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2019-11-13 14:13:17', '2019-11-13 14:13:17');
INSERT INTO `t_pay_log` VALUES ('1195253787449430017', '1195253049260314624', '2019-11-15 16:14:44', 1.00, '4200000454201911150981874895', 'SUCCESS', 1, '{\"transaction_id\":\"4200000454201911150981874895\",\"nonce_str\":\"MAM5UM4Xhv1lItvO\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"CFT\",\"openid\":\"oNpSGwR-QGG5DaZtDkh2UZlsFDQE\",\"sign\":\"7DBDCAF4A078B30BB3EF073E6A238C20\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1473426802\",\"cash_fee\":\"1\",\"out_trade_no\":\"1195253049260314624\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx8397f8696b538317\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191115161440\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2019-11-15 16:14:44', '2019-11-15 16:14:44');
INSERT INTO `t_pay_log` VALUES ('1196264321397342210', '1196264005255872512', '2019-11-18 11:10:14', 1.00, '4200000453201911184025781554', 'SUCCESS', 1, '{\"transaction_id\":\"4200000453201911184025781554\",\"nonce_str\":\"D1dHexCLIFIxAAg2\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"CFT\",\"openid\":\"oNpSGwR-QGG5DaZtDkh2UZlsFDQE\",\"sign\":\"C9F5CA1EE49EA7891736D73BEB423962\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1473426802\",\"cash_fee\":\"1\",\"out_trade_no\":\"1196264005255872512\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx8397f8696b538317\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191118111011\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2019-11-18 11:10:14', '2019-11-18 11:10:14');
INSERT INTO `t_pay_log` VALUES ('1648570078310805505', '20230419140608185', '2023-04-19 14:11:50', 1.00, NULL, 'SUCCESS', 1, '{\"nonce_str\":\"MOJc5Mhk8M7ajocE\",\"device_info\":\"\",\"trade_state\":\"SUCCESS\",\"out_trade_no\":\"20230419140608185\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"100\",\"trade_state_desc\":\"订单未支付\",\"sign\":\"912B8DEA2F6F90D72B39DD04E9332F75\",\"return_msg\":\"OK\",\"result_code\":\"SUCCESS\",\"mch_id\":\"1558950191\",\"return_code\":\"SUCCESS\"}', 0, '2023-04-19 14:11:50', '2023-04-19 14:11:50');
INSERT INTO `t_pay_log` VALUES ('1648570146422108161', '20230419141201182', '2023-04-19 14:12:07', 1.00, NULL, 'SUCCESS', 1, '{\"nonce_str\":\"wQwNkm7xcoAw5rm6\",\"device_info\":\"\",\"trade_state\":\"SUCCESS\",\"out_trade_no\":\"20230419141201182\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"100\",\"trade_state_desc\":\"订单未支付\",\"sign\":\"CF100F2CCDE3F8AE18365929DA87C908\",\"return_msg\":\"OK\",\"result_code\":\"SUCCESS\",\"mch_id\":\"1558950191\",\"return_code\":\"SUCCESS\"}', 0, '2023-04-19 14:12:07', '2023-04-19 14:12:07');
INSERT INTO `t_pay_log` VALUES ('1648570432897265666', '20230419141310648', '2023-04-19 14:13:15', 1.00, NULL, 'SUCCESS', 1, '{\"nonce_str\":\"BkugHsk14ttulVrE\",\"device_info\":\"\",\"trade_state\":\"SUCCESS\",\"out_trade_no\":\"20230419141310648\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"100\",\"trade_state_desc\":\"订单未支付\",\"sign\":\"A843C454529A7DE0B2CD843A6985FB50\",\"return_msg\":\"OK\",\"result_code\":\"SUCCESS\",\"mch_id\":\"1558950191\",\"return_code\":\"SUCCESS\"}', 0, '2023-04-19 14:13:15', '2023-04-19 14:13:15');
INSERT INTO `t_pay_log` VALUES ('1648570483593818113', '20230419141322693', '2023-04-19 14:13:27', 1.00, NULL, 'SUCCESS', 1, '{\"nonce_str\":\"Imna9TbNVQWSNfSv\",\"device_info\":\"\",\"trade_state\":\"SUCCESS\",\"out_trade_no\":\"20230419141322693\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"100\",\"trade_state_desc\":\"订单未支付\",\"sign\":\"0226A5FF3C67A839B5D984383F6C4E4C\",\"return_msg\":\"OK\",\"result_code\":\"SUCCESS\",\"mch_id\":\"1558950191\",\"return_code\":\"SUCCESS\"}', 0, '2023-04-19 14:13:27', '2023-04-19 14:13:27');
INSERT INTO `t_pay_log` VALUES ('1648927317815046146', '20230420135117906', '2023-04-20 13:51:23', 120.00, NULL, 'SUCCESS', 1, '{\"nonce_str\":\"J4mvcSfYZgAsZAiZ\",\"device_info\":\"\",\"trade_state\":\"SUCCESS\",\"out_trade_no\":\"20230420135117906\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"12000\",\"trade_state_desc\":\"订单未支付\",\"sign\":\"D9EC489C3CF6AEDE5490F8B04BBCF1B9\",\"return_msg\":\"OK\",\"result_code\":\"SUCCESS\",\"mch_id\":\"1558950191\",\"return_code\":\"SUCCESS\"}', 0, '2023-04-20 13:51:23', '2023-04-20 13:51:23');
INSERT INTO `t_pay_log` VALUES ('1650085270886563842', '20230423183138496', '2023-04-23 18:32:40', 450.00, NULL, 'SUCCESS', 1, '{\"nonce_str\":\"gJ9densZ2Z9VGeCT\",\"device_info\":\"\",\"trade_state\":\"SUCCESS\",\"out_trade_no\":\"20230423183138496\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"45000\",\"trade_state_desc\":\"订单未支付\",\"sign\":\"D2CEBB2DF104ABAE3A17690450758D46\",\"return_msg\":\"OK\",\"result_code\":\"SUCCESS\",\"mch_id\":\"1558950191\",\"return_code\":\"SUCCESS\"}', 0, '2023-04-23 18:32:40', '2023-04-23 18:32:40');
INSERT INTO `t_pay_log` VALUES ('1650085576949121026', '20230423183347590', '2023-04-23 18:33:53', 450.00, NULL, 'SUCCESS', 1, '{\"nonce_str\":\"f47GhwbQZfKnUiMA\",\"device_info\":\"\",\"trade_state\":\"SUCCESS\",\"out_trade_no\":\"20230423183347590\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"45000\",\"trade_state_desc\":\"订单未支付\",\"sign\":\"EF06B7FC48100BBA1E662F027D10BE1A\",\"return_msg\":\"OK\",\"result_code\":\"SUCCESS\",\"mch_id\":\"1558950191\",\"return_code\":\"SUCCESS\"}', 0, '2023-04-23 18:33:53', '2023-04-23 18:33:53');
INSERT INTO `t_pay_log` VALUES ('1655892542640357377', '20230509190611557', '2023-05-09 19:08:42', 450.00, NULL, 'SUCCESS', 1, '{\"nonce_str\":\"nx7RPyfmagiPhJPr\",\"device_info\":\"\",\"trade_state\":\"SUCCESS\",\"out_trade_no\":\"20230509190611557\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"45000\",\"trade_state_desc\":\"订单未支付\",\"sign\":\"DC164DD70BF392196467E9B3EC9B7775\",\"return_msg\":\"OK\",\"result_code\":\"SUCCESS\",\"mch_id\":\"1558950191\",\"return_code\":\"SUCCESS\"}', 0, '2023-05-09 19:08:42', '2023-05-09 19:08:42');
INSERT INTO `t_pay_log` VALUES ('1670635846145794049', '20230619113302875', '2023-06-19 11:33:19', 123.00, NULL, 'SUCCESS', 1, '{\"nonce_str\":\"zxzO1XQXXhailUpY\",\"device_info\":\"\",\"trade_state\":\"SUCCESS\",\"out_trade_no\":\"20230619113302875\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"12300\",\"trade_state_desc\":\"订单未支付\",\"sign\":\"F6F350DD5D4FA7622D940F2851911AF4\",\"return_msg\":\"OK\",\"result_code\":\"SUCCESS\",\"mch_id\":\"1558950191\",\"return_code\":\"SUCCESS\"}', 0, '2023-06-19 11:33:19', '2023-06-19 11:33:19');

-- ----------------------------
-- Table structure for ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_member`;
CREATE TABLE `ucenter_member`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员id',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信openid',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '性别 1 男，2 女，3其他',
  `age` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `e_mail` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 1（true）已禁用，  0（false）未禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ucenter_member
-- ----------------------------
INSERT INTO `ucenter_member` VALUES ('1', NULL, '13700000001', '96e79218965eb72c92a549dd5a330112', '小三123', 1, 5, NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-04-17 09:33:36');
INSERT INTO `ucenter_member` VALUES ('1080736474267144193', NULL, '13700000011', '96e79218965eb72c92a549dd5a330112', '用户XJtDfaYeKk', 1, 19, NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-04-17 09:33:36');
INSERT INTO `ucenter_member` VALUES ('1080736474355224577', NULL, '13700000002', '96e79218965eb72c92a549dd5a330112', '用户wUrNkzAPrc', 1, 27, NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-04-17 09:33:36');
INSERT INTO `ucenter_member` VALUES ('1086387099449442306', NULL, '13520191388', '96e79218965eb72c92a549dd5a330112', '用户XTMUeHDAoj', 2, 20, NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-04-17 09:33:36');
INSERT INTO `ucenter_member` VALUES ('1086387099520745473', NULL, '13520191389', '96e79218965eb72c92a549dd5a330112', '用户vSdKeDlimn', 1, 21, NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-04-17 09:33:36');
INSERT INTO `ucenter_member` VALUES ('1086387099608825858', NULL, '13520191381', '96e79218965eb72c92a549dd5a330112', '用户EoyWUVXQoP', 1, 18, NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-04-17 09:33:36');
INSERT INTO `ucenter_member` VALUES ('1086387099701100545', NULL, '13520191382', '96e79218965eb72c92a549dd5a330112', '用户LcAYbxLNdN', 2, 24, NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-04-17 09:33:36');
INSERT INTO `ucenter_member` VALUES ('1086387099776598018', NULL, '13520191383', '96e79218965eb72c92a549dd5a330112', '用户dZdjcgltnk', 2, 25, NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-04-17 09:33:36');
INSERT INTO `ucenter_member` VALUES ('1086387099852095490', NULL, '13520191384', '96e79218965eb72c92a549dd5a330112', '用户wNHGHlxUwX', 2, 23, NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-04-17 09:33:36');
INSERT INTO `ucenter_member` VALUES ('1191600824445046786', NULL, '15210078344', '96e79218965eb72c92a549dd5a330112', 'IT妖姬', 1, 5, NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-04-17 09:33:36');
INSERT INTO `ucenter_member` VALUES ('1191616288114163713', NULL, '17866603606', '96e79218965eb72c92a549dd5a330112', 'xiaowu', NULL, NULL, NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-04-17 09:33:36');
INSERT INTO `ucenter_member` VALUES ('1195187659054329857', NULL, '15010546384', '96e79218965eb72c92a549dd5a330112', 'qy', NULL, NULL, NULL, 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/04/10/b8f11653d5604cb7af5efc73793a9583duck.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-04-17 09:33:36');
INSERT INTO `ucenter_member` VALUES ('1633357594188640258', NULL, '18312045087', 'e10adc3949ba59abbe56e057f20f883e', 'what', 1, NULL, '12345678@163.com', 'https://yuhaiedu.oss-cn-hongkong.aliyuncs.com/2023/05/09/6a37d6d28eac46a2abdb76620ecdefaa2abs3PKlPgjd85bbf77ee6940ba95fef36071b58d446.jpg', NULL, 0, 0, '2023-04-17 09:32:00', '2023-05-09 19:18:01');

SET FOREIGN_KEY_CHECKS = 1;
