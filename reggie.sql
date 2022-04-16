/*
 Navicat MySQL Data Transfer

 Source Server         : project
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : reggie

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 02/01/2022 10:30:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人',
  `sex` tinyint(4) NOT NULL COMMENT '性别 0 女 1 男',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '地址簿' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (1417414526093082626, 1417012167126876162, '小明', 1, '13812345678', NULL, NULL, NULL, NULL, NULL, NULL, '昌平区金燕龙办公楼', '公司', 1, '2021-07-20 17:22:12', '2021-07-20 17:26:33', 1417012167126876162, 1417012167126876162, 0);
INSERT INTO `address_book` VALUES (1417414926166769666, 1417012167126876162, '小李', 1, '13512345678', NULL, NULL, NULL, NULL, NULL, NULL, '测试', '家', 0, '2021-07-20 17:23:47', '2021-07-20 17:23:47', 1417012167126876162, 1417012167126876162, 0);
INSERT INTO `address_book` VALUES (1476484312755892226, 1476447058469703682, 'dcy', 1, '15912345678', NULL, NULL, NULL, NULL, NULL, NULL, 'wuhan', '公司', 1, '2021-12-30 17:24:27', '2021-12-30 17:24:30', 1476447058469703682, 1476447058469703682, 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1397844263642378242, 1, '湘菜', 1, '2021-05-27 09:16:58', '2021-07-15 20:25:23', 1, 1);
INSERT INTO `category` VALUES (1397844303408574465, 1, '川菜', 2, '2021-05-27 09:17:07', '2021-06-02 14:27:22', 1, 1);
INSERT INTO `category` VALUES (1397844391040167938, 1, '粤菜', 3, '2021-05-27 09:17:28', '2021-07-09 14:37:13', 1, 1);
INSERT INTO `category` VALUES (1413341197421846529, 1, '饮品', 11, '2021-07-09 11:36:15', '2021-07-09 14:39:15', 1, 1);
INSERT INTO `category` VALUES (1413342269393674242, 2, '商务套餐', 5, '2021-07-09 11:40:30', '2021-07-09 14:43:45', 1, 1);
INSERT INTO `category` VALUES (1413384954989060097, 1, '主食', 12, '2021-07-09 14:30:07', '2021-07-09 14:39:19', 1, 1);
INSERT INTO `category` VALUES (1413386191767674881, 2, '儿童套餐', 6, '2021-07-09 14:35:02', '2021-07-09 14:39:05', 1, 1);
INSERT INTO `category` VALUES (1471775931088523265, 1, '荤菜', 10, '2021-12-17 17:35:01', '2021-12-17 17:35:01', 1, 1);
INSERT INTO `category` VALUES (1472747888239972353, 1, '家乡菜', 10, '2021-12-20 09:57:14', '2021-12-20 09:57:14', 1, 1);
INSERT INTO `category` VALUES (1472747979302506498, 2, '情侣套餐', 15, '2021-12-20 09:57:35', '2021-12-20 09:57:35', 1, 1);
INSERT INTO `category` VALUES (1472748084541788162, 2, '单身套餐', 19, '2021-12-20 09:58:00', '2021-12-20 14:59:21', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品码',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (1472843285968990209, '烤鸭', 1397844303408574465, 2500.00, '', 'c379b1b5-5719-4248-ac0d-aa1bc2708017.jpeg', '鸭王烤鸭', 1, 0, '2021-12-20 16:16:18', '2021-12-30 15:52:42', 1, 1);
INSERT INTO `dish` VALUES (1472873154463494146, '回锅肉', 1397844263642378242, 3600.00, '', '087cf9db-91cc-49ea-9dcd-6c8b56f42bbe.jpg', '好吃回锅肉', 1, 0, '2021-12-20 18:14:59', '2021-12-30 15:52:32', 1, 1);
INSERT INTO `dish` VALUES (1472873388648263682, '大龙虾', 1397844391040167938, 5000.00, '', 'd5fe5c16-7f5c-439f-ac2d-74169b08e835.jpeg', '澳洲大龙虾', 1, 0, '2021-12-20 18:15:55', '2021-12-30 15:51:11', 1, 1);
INSERT INTO `dish` VALUES (1472873618789724161, '鱼香肉丝', 1471775931088523265, 1800.00, '', '26823cd6-76a5-490f-b7c3-c5a7e53e66a2.jpg', '鱼香肉丝', 1, 0, '2021-12-20 18:16:50', '2021-12-30 15:50:48', 1, 1);
INSERT INTO `dish` VALUES (1472873883186065409, '王老吉', 1413341197421846529, 500.00, '', 'b3614a88-447a-4508-86c5-e7d2ebd7fba7.png', '怕上火，喝王老吉', 1, 0, '2021-12-20 18:17:53', '2021-12-30 15:51:00', 1, 1);
INSERT INTO `dish` VALUES (1472874213672054785, '白米饭', 1413384954989060097, 300.00, '', '7f2df35d-12b8-4157-b2e9-0a8d070f8332.png', '可口白米饭', 1, 0, '2021-12-20 18:19:12', '2021-12-30 15:50:04', 1, 1);
INSERT INTO `dish` VALUES (1476461461155872770, '啤酒', 1413341197421846529, 2000.00, '', 'c691b865-a967-41a7-bce9-4d62e6bbd83c.png', '燕京啤酒', 1, 0, '2021-12-30 15:53:38', '2021-12-30 15:53:38', 1, 1);
INSERT INTO `dish` VALUES (1476461974639345666, '辣子鸡', 1397844303408574465, 1500.00, '', 'b8f6f7d0-3f2c-4f18-80e4-c20a1953ab4e.jpg', '可口辣子鸡', 1, 0, '2021-12-30 15:55:41', '2021-12-30 15:55:41', 1, 1);
INSERT INTO `dish` VALUES (1476462331603976193, '白切鸡', 1397844391040167938, 2600.00, '', 'a6f346ef-bee9-4496-9778-424fdac87657.jpeg', '好吃', 1, 0, '2021-12-30 15:57:06', '2021-12-30 16:30:58', 1, 1);
INSERT INTO `dish` VALUES (1476462667580309506, '小龙虾', 1397844303408574465, 2500.00, '', '40cf3a84-e3cb-4075-9bdb-2e2679df951f.jpg', '红红火火，小龙虾', 1, 0, '2021-12-30 15:58:26', '2021-12-30 15:58:26', 1, 1);
INSERT INTO `dish` VALUES (1476462886355206145, '鸡汤', 1472747888239972353, 5000.00, '', '6c30f5b0-10f6-43d4-a240-8873838c3ab8.jpeg', '十全大补鸡汤', 1, 0, '2021-12-30 15:59:18', '2021-12-30 15:59:18', 1, 1);
INSERT INTO `dish` VALUES (1476463159928684546, '过桥米线', 1413384954989060097, 2000.00, '', 'aba46e11-eb48-4917-9221-45535ca9b1c8.jpg', '', 1, 0, '2021-12-30 16:00:23', '2021-12-30 16:00:23', 1, 1);
INSERT INTO `dish` VALUES (1476463349276344321, '红烧兔头', 1397844303408574465, 3600.00, '', '5958a5a7-507d-4759-9b4e-afe727660fd6.jpg', '', 1, 0, '2021-12-30 16:01:08', '2021-12-30 16:01:08', 1, 1);
INSERT INTO `dish` VALUES (1476463506608881666, '烤乳猪', 1472747888239972353, 12000.00, '', '347fbb9c-2b88-4aba-b94e-cddc520a931a.jpeg', '美味可口', 1, 0, '2021-12-30 16:01:46', '2021-12-30 16:01:46', 1, 1);
INSERT INTO `dish` VALUES (1476463740588130306, '水煮鱼片', 1397844263642378242, 3600.00, '', 'a26419b6-bb4f-447c-a727-c760b6d145ac.jpg', '', 1, 0, '2021-12-30 16:02:42', '2021-12-30 16:02:42', 1, 1);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `dish_id` bigint(20) NOT NULL COMMENT '菜品',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '口味名称',
  `value` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味数据list',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (1472843286086430722, 1472843285968990209, '温度', '[\"常温\"]', '2021-12-30 15:52:42', '2021-12-30 15:52:42', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472843286086430723, 1472843285968990209, '辣度', '[\"不辣\",\"微辣\",\"中辣\"]', '2021-12-30 15:52:42', '2021-12-30 15:52:42', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472843286086430724, 1472843285968990209, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-12-30 15:52:42', '2021-12-30 15:52:42', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472859495213330434, 1, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]', '2021-12-20 17:20:43', '2021-12-20 17:20:43', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472859495213330435, 1, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-12-20 17:20:43', '2021-12-20 17:20:43', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472873154522214402, 1472873154463494146, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-12-30 15:52:32', '2021-12-30 15:52:32', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472873154522214403, 1472873154463494146, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-12-30 15:52:32', '2021-12-30 15:52:32', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472873388648263683, 1472873388648263682, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-12-30 15:51:11', '2021-12-30 15:51:11', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472873388648263684, 1472873388648263682, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-12-30 15:51:11', '2021-12-30 15:51:11', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472873388727955457, 1472873388648263682, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-12-30 15:51:11', '2021-12-30 15:51:11', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472873618986856450, 1472873618789724161, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-12-30 15:50:48', '2021-12-30 15:50:48', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472873618986856451, 1472873618789724161, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-12-30 15:50:48', '2021-12-30 15:50:48', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472873883261562882, 1472873883186065409, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-12-30 15:51:00', '2021-12-30 15:51:00', 1, 1);
INSERT INTO `dish_flavor` VALUES (1472874213734969346, 1472874213672054785, '温度', '[\"常温\"]', '2021-12-30 15:50:04', '2021-12-30 15:50:04', 1, 1);
INSERT INTO `dish_flavor` VALUES (1476461461155872771, 1476461461155872770, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-12-30 15:53:38', '2021-12-30 15:53:38', 1, 1);
INSERT INTO `dish_flavor` VALUES (1476461974647734273, 1476461974639345666, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-12-30 15:55:41', '2021-12-30 15:55:41', 1, 1);
INSERT INTO `dish_flavor` VALUES (1476462331633336322, 1476462331603976193, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-12-30 16:30:58', '2021-12-30 16:30:58', 1, 1);
INSERT INTO `dish_flavor` VALUES (1476462331633336323, 1476462331603976193, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-12-30 16:30:58', '2021-12-30 16:30:58', 1, 1);
INSERT INTO `dish_flavor` VALUES (1476462667592892417, 1476462667580309506, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-12-30 15:58:26', '2021-12-30 15:58:26', 1, 1);
INSERT INTO `dish_flavor` VALUES (1476463159928684547, 1476463159928684546, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-12-30 16:00:23', '2021-12-30 16:00:23', 1, 1);
INSERT INTO `dish_flavor` VALUES (1476463349284732929, 1476463349276344321, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-12-30 16:01:08', '2021-12-30 16:01:08', 1, 1);
INSERT INTO `dish_flavor` VALUES (1476463740604907521, 1476463740588130306, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-12-30 16:02:42', '2021-12-30 16:02:42', 1, 1);
INSERT INTO `dish_flavor` VALUES (1476463740604907522, 1476463740588130306, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-12-30 16:02:42', '2021-12-30 16:02:42', 1, 1);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:正常',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '0', '110101199001010047', 1, '2021-05-06 17:20:07', '2021-12-18 22:30:49', 1, 1);
INSERT INTO `employee` VALUES (1471455797471916033, '风清扬', 'fengqingyang', 'e10adc3949ba59abbe56e057f20f883e', '15912341234', '1', '421181200101018416', 0, '2021-12-16 20:22:55', '2021-12-18 22:34:08', 1, 1);
INSERT INTO `employee` VALUES (1471462535738736642, '李四', 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '15912341239', '1', '421181200101010000', 1, '2021-12-16 20:49:42', '2021-12-17 17:09:15', 1, 1);
INSERT INTO `employee` VALUES (1472174998685523970, '张三', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '15912341234', '1', '610123456789012', 1, '2021-12-18 20:00:46', '2021-12-19 00:11:42', 1, 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1476484158090932226, '烤乳猪', '347fbb9c-2b88-4aba-b94e-cddc520a931a.jpeg', 1476484393613684737, 1476463506608881666, NULL, NULL, 12, 120.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款，2待派送，3已派送，4已完成，5已取消',
  `user_id` bigint(20) NOT NULL COMMENT '下单用户',
  `address_book_id` bigint(20) NOT NULL COMMENT '地址id',
  `order_time` datetime(0) NOT NULL COMMENT '下单时间',
  `checkout_time` datetime(0) NOT NULL COMMENT '结账时间',
  `pay_method` int(11) NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `consignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1476484393613684737, '1476484393613684737', 2, 1476447058469703682, 1476484312755892226, '2021-12-30 17:24:46', '2021-12-30 17:24:46', 1, 1440.00, '', '15912345678', 'wuhan', NULL, 'dcy');

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态 0:停用 1:启用',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编码',
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (1476461740056117249, 1472747979302506498, '心心相印', 52000.00, 1, '', '心心相印，天长地久。', '1275cdfb-c153-4e11-9226-c6a6939152d5.jpeg', '2021-12-30 15:54:45', '2021-12-30 15:54:45', 1, 1);
INSERT INTO `setmeal` VALUES (1476482876743737346, 1472748084541788162, '单身狗套餐', 11100.00, 1, '', '', '5df46856-0d5f-4984-ba5e-ffd48b237066.jpeg', '2021-12-30 17:18:44', '2021-12-30 17:18:44', 1, 1);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `setmeal_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐id ',
  `dish_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品原价（冗余字段）',
  `copies` int(11) NOT NULL COMMENT '份数',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (1476461740056117250, '1476461740056117249', '1472873154463494146', '回锅肉', 3600.00, 1, 0, '2021-12-30 15:54:45', '2021-12-30 15:54:45', 1, 1);
INSERT INTO `setmeal_dish` VALUES (1476461740056117251, '1476461740056117249', '1472843285968990209', '烤鸭', 2500.00, 1, 0, '2021-12-30 15:54:45', '2021-12-30 15:54:45', 1, 1);
INSERT INTO `setmeal_dish` VALUES (1476461740056117252, '1476461740056117249', '1472873388648263682', '大龙虾', 5000.00, 1, 0, '2021-12-30 15:54:45', '2021-12-30 15:54:45', 1, 1);
INSERT INTO `setmeal_dish` VALUES (1476461740056117253, '1476461740056117249', '1472873618789724161', '鱼香肉丝', 1800.00, 1, 0, '2021-12-30 15:54:45', '2021-12-30 15:54:45', 1, 1);
INSERT INTO `setmeal_dish` VALUES (1476461740056117254, '1476461740056117249', '1476461461155872770', '啤酒', 2000.00, 1, 0, '2021-12-30 15:54:45', '2021-12-30 15:54:45', 1, 1);
INSERT INTO `setmeal_dish` VALUES (1476461740077088770, '1476461740056117249', '1472873883186065409', '王老吉', 500.00, 1, 0, '2021-12-30 15:54:45', '2021-12-30 15:54:45', 1, 1);
INSERT INTO `setmeal_dish` VALUES (1476461740077088771, '1476461740056117249', '1472874213672054785', '白米饭', 300.00, 1, 0, '2021-12-30 15:54:45', '2021-12-30 15:54:45', 1, 1);
INSERT INTO `setmeal_dish` VALUES (1476482876802457601, '1476482876743737346', '1476463740588130306', '水煮鱼片', 3600.00, 1, 0, '2021-12-30 17:18:44', '2021-12-30 17:18:44', 1, 1);
INSERT INTO `setmeal_dish` VALUES (1476482876819234818, '1476482876743737346', '1472873154463494146', '回锅肉', 3600.00, 1, 0, '2021-12-30 17:18:44', '2021-12-30 17:18:44', 1, 1);
INSERT INTO `setmeal_dish` VALUES (1476482876819234819, '1476482876743737346', '1476462886355206145', '鸡汤', 5000.00, 1, 0, '2021-12-30 17:18:44', '2021-12-30 17:18:44', 1, 1);
INSERT INTO `setmeal_dish` VALUES (1476482876819234820, '1476482876743737346', '1476463506608881666', '烤乳猪', 12000.00, 1, 0, '2021-12-30 17:18:44', '2021-12-30 17:18:44', 1, 1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint(20) NOT NULL COMMENT '主键',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态 0:禁用，1:正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1476447058469703682, NULL, '15912345678', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1476487159971160065, NULL, '159123456789', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1476488375471996930, NULL, '15987654321', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1476491602217160705, NULL, '15987655678', NULL, NULL, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
