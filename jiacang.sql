/*
Navicat MySQL Data Transfer

Source Server         : liening
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : jiacang

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-04-26 18:34:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `address_key` varchar(50) DEFAULT NULL COMMENT '佳藏号',
  `address_name` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `user_tel` char(11) DEFAULT NULL COMMENT '收货电话',
  `address_comment` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '是否为默认',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', 'xiaoli10', '张三', '18805013713', '四川成都市高新区软件园A区1栋505', '1', '2020-04-22 15:44:33');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `class_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `have_num` int(11) DEFAULT NULL COMMENT '包含商品数',
  `cerate_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '钱币', '1', '2020-04-23 17:46:02');
INSERT INTO `class` VALUES ('2', '玉器', '0', '2020-04-26 18:14:48');
INSERT INTO `class` VALUES ('3', '青铜器', '0', '2020-04-26 18:15:15');
INSERT INTO `class` VALUES ('4', '古玩', '0', '2020-04-26 18:15:32');

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES ('1', 'lindenvan', 'Admin', 'c13f62012fd6a8fdf06b3452a94430e5', 'rpR6Bv', '/assets/img/avatar.png', 'admin@admin.com', '0', '1587866215', '127.0.0.1', '1492186163', '1587866215', '1b4ffe5a-6b88-4d30-ae5e-0991efbd5b29', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COMMENT='管理员日志表';

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES ('1', '0', 'Unknown', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"f8897a69a8916e4c4e599a48187b95ce\",\"username\":\"lindenvan\",\"captcha\":\"fd1p\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587523180');
INSERT INTO `fa_admin_log` VALUES ('2', '1', 'lindenvan', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '登录', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"bbc9c1db1dfe8a73cc83dbb6937f4fd2\",\"username\":\"lindenvan\",\"captcha\":\"ivdk\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587523199');
INSERT INTO `fa_admin_log` VALUES ('3', '1', 'lindenvan', '/rWPFXdqobO.php/category/edit/ids/1?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"type\":\"page\",\"pid\":\"0\",\"name\":\"\\u5b98\\u65b9\\u65b0\\u95fb\",\"nickname\":\"news\",\"flag\":[\"recommend\"],\"image\":\"\\/assets\\/img\\/qrcode.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"1\",\"status\":\"hidden\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587523394');
INSERT INTO `fa_admin_log` VALUES ('4', '1', 'lindenvan', '/rWPFXdqobO.php/category/edit/ids/1?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"type\":\"page\",\"pid\":\"0\",\"name\":\"\\u5b98\\u65b9\\u65b0\\u95fb\",\"nickname\":\"news\",\"flag\":[\"recommend\"],\"image\":\"\\/assets\\/img\\/qrcode.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"1\",\"status\":\"normal\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587523485');
INSERT INTO `fa_admin_log` VALUES ('5', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/66?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"2900e3a40c392d6b1415e7bfae23319a\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"user\",\"title\":\"\\u4f1a\\u5458\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"66\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587523529');
INSERT INTO `fa_admin_log` VALUES ('6', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587523530');
INSERT INTO `fa_admin_log` VALUES ('7', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/79?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"5d7c51cf51b0d050bdc7c328ea438e71\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user\\/rule\",\"title\":\"\\u4f1a\\u5458\\u89c4\\u5219\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"79\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587523542');
INSERT INTO `fa_admin_log` VALUES ('8', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587523542');
INSERT INTO `fa_admin_log` VALUES ('9', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/3?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"a49915bf2074be92a20bcd6386e79720\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"category\",\"title\":\"\\u5206\\u7c7b\\u7ba1\\u7406\",\"icon\":\"fa fa-leaf\",\"weigh\":\"119\",\"condition\":\"\",\"remark\":\"Category tips\",\"status\":\"hidden\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587523556');
INSERT INTO `fa_admin_log` VALUES ('10', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587523556');
INSERT INTO `fa_admin_log` VALUES ('11', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/1?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"1ab32d5ca53d5d2a04a58ed8899dfe0a\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"dashboard\",\"title\":\"\\u63a7\\u5236\\u53f0\",\"icon\":\"fa fa-dashboard\",\"weigh\":\"143\",\"condition\":\"\",\"remark\":\"Dashboard tips\",\"status\":\"hidden\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587523680');
INSERT INTO `fa_admin_log` VALUES ('12', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587523680');
INSERT INTO `fa_admin_log` VALUES ('13', '1', 'lindenvan', '/rWPFXdqobO.php/addon/install', '插件管理', '{\"name\":\"upyun\",\"force\":\"0\",\"uid\":\"21588\",\"token\":\"bec38bee-d27f-437d-bcea-9c6c2941da09\",\"version\":\"1.0.3\",\"faversion\":\"1.0.0.20200228_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587524362');
INSERT INTO `fa_admin_log` VALUES ('14', '1', 'lindenvan', '/rWPFXdqobO.php/addon/install', '插件管理', '{\"name\":\"markdown\",\"force\":\"0\",\"uid\":\"21588\",\"token\":\"bec38bee-d27f-437d-bcea-9c6c2941da09\",\"version\":\"1.0.1\",\"faversion\":\"1.0.0.20200228_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587524384');
INSERT INTO `fa_admin_log` VALUES ('15', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587524384');
INSERT INTO `fa_admin_log` VALUES ('16', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/1?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"ba6d1b80c7089e4ebbe9db71016ba40d\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"dashboard\",\"title\":\"\\u63a7\\u5236\\u53f0\",\"icon\":\"fa fa-dashboard\",\"weigh\":\"143\",\"condition\":\"\",\"remark\":\"Dashboard tips\",\"status\":\"normal\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587526065');
INSERT INTO `fa_admin_log` VALUES ('17', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587526065');
INSERT INTO `fa_admin_log` VALUES ('18', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/85?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"1b3483183b504cbe07658262d665da40\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"users\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-users\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"85\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587527250');
INSERT INTO `fa_admin_log` VALUES ('19', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587527250');
INSERT INTO `fa_admin_log` VALUES ('20', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/85?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"8524ddd6488a85a71fe45e47bf7fb363\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"users\",\"title\":\"\\u5ba2\\u6237\\u5217\\u8868\",\"icon\":\"fa fa-users\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"85\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587533385');
INSERT INTO `fa_admin_log` VALUES ('21', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587533385');
INSERT INTO `fa_admin_log` VALUES ('22', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"f4c1f478d18fcdf8d1a34c42d07a30be\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"users\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587533497');
INSERT INTO `fa_admin_log` VALUES ('23', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/85?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"bb7ff823a76fd0ac4cccc3ed25c3234b\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"users\\/list\",\"title\":\"\\u5ba2\\u6237\\u5217\\u8868\",\"icon\":\"fa fa-users\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"85\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587533519');
INSERT INTO `fa_admin_log` VALUES ('24', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587533519');
INSERT INTO `fa_admin_log` VALUES ('25', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"df6f614dabca48b987143761c70271ed\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"users\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587533538');
INSERT INTO `fa_admin_log` VALUES ('26', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587533538');
INSERT INTO `fa_admin_log` VALUES ('27', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/85?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"a64baef9bcef3e74dabd4f4ac8964404\",\"row\":{\"ismenu\":\"1\",\"pid\":\"91\",\"name\":\"users\\/list\",\"title\":\"\\u5ba2\\u6237\\u5217\\u8868\",\"icon\":\"fa fa-users\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"85\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587533557');
INSERT INTO `fa_admin_log` VALUES ('28', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587533557');
INSERT INTO `fa_admin_log` VALUES ('29', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/del/ids/85', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"85\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587534574');
INSERT INTO `fa_admin_log` VALUES ('30', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587534574');
INSERT INTO `fa_admin_log` VALUES ('31', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/del/ids/91', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"91\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587534597');
INSERT INTO `fa_admin_log` VALUES ('32', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587534597');
INSERT INTO `fa_admin_log` VALUES ('33', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"58f3c0a48953b76ece17d921a8ddbff0\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"users\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-address-card\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587534812');
INSERT INTO `fa_admin_log` VALUES ('34', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587534813');
INSERT INTO `fa_admin_log` VALUES ('35', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"1a3b1f52912e1afff3e2833759ff8544\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"client\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587536403');
INSERT INTO `fa_admin_log` VALUES ('36', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587536403');
INSERT INTO `fa_admin_log` VALUES ('37', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"05b805b3baad5378d2900768026eeb8e\",\"row\":{\"ismenu\":\"1\",\"pid\":\"93\",\"name\":\"client\\/users\",\"title\":\"\\u5ba2\\u6237\\u5217\\u8868\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587536443');
INSERT INTO `fa_admin_log` VALUES ('38', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587536443');
INSERT INTO `fa_admin_log` VALUES ('39', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/93?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"73be5729c7f5ab35ce477bebae463677\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"client\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-address-card\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"93\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587536468');
INSERT INTO `fa_admin_log` VALUES ('40', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587536468');
INSERT INTO `fa_admin_log` VALUES ('41', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/94?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"d6a791cdb6b10701200ce4dc8bc513f8\",\"row\":{\"ismenu\":\"1\",\"pid\":\"93\",\"name\":\"client\\/users\",\"title\":\"\\u5ba2\\u6237\\u5217\\u8868\",\"icon\":\"fa fa-address-book-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"94\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587536477');
INSERT INTO `fa_admin_log` VALUES ('42', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587536477');
INSERT INTO `fa_admin_log` VALUES ('43', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/del/ids/94', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"94\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587536671');
INSERT INTO `fa_admin_log` VALUES ('44', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587536671');
INSERT INTO `fa_admin_log` VALUES ('45', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/del/ids/93', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"93\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587536821');
INSERT INTO `fa_admin_log` VALUES ('46', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587536821');
INSERT INTO `fa_admin_log` VALUES ('47', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"dd73c59263fe1567f15ffb2f7c73221c\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"client\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587537208');
INSERT INTO `fa_admin_log` VALUES ('48', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587537208');
INSERT INTO `fa_admin_log` VALUES ('49', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"b837783bceeda506a84343d3b60afba4\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"client\\/users\",\"title\":\"\\u5ba2\\u6237\\u5217\\u8868\",\"icon\":\"fa fa-address-book-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587537228');
INSERT INTO `fa_admin_log` VALUES ('50', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587537229');
INSERT INTO `fa_admin_log` VALUES ('51', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"2d14eeadf21dcdd05f4f578c1efe6f28\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"client\\/address\",\"title\":\"\\u5730\\u5740\\u5217\\u8868\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540598');
INSERT INTO `fa_admin_log` VALUES ('52', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540598');
INSERT INTO `fa_admin_log` VALUES ('53', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/1?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"a29ec7780880dba43e587c0fea555a9e\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"dashboard\",\"title\":\"\\u63a7\\u5236\\u53f0\",\"icon\":\"fa fa-dashboard\",\"weigh\":\"5\",\"condition\":\"\",\"remark\":\"Dashboard tips\",\"status\":\"normal\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540635');
INSERT INTO `fa_admin_log` VALUES ('54', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540636');
INSERT INTO `fa_admin_log` VALUES ('55', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/2?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"a9e3db6338b22f44331a5001f55c4673\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"general\",\"title\":\"\\u5e38\\u89c4\\u7ba1\\u7406\",\"icon\":\"fa fa-cogs\",\"weigh\":\"4\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540645');
INSERT INTO `fa_admin_log` VALUES ('56', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540645');
INSERT INTO `fa_admin_log` VALUES ('57', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/5?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"6a59911f15022ac7fc817db7c74022ee\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"auth\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa fa-group\",\"weigh\":\"3\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540655');
INSERT INTO `fa_admin_log` VALUES ('58', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540655');
INSERT INTO `fa_admin_log` VALUES ('59', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/95?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"b48da662ea87734734566a01fa9249a7\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"client\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"99\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"95\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540667');
INSERT INTO `fa_admin_log` VALUES ('60', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540667');
INSERT INTO `fa_admin_log` VALUES ('61', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/3?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"e81781bb59e20d45e54ad82dce530ebd\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"category\",\"title\":\"\\u5206\\u7c7b\\u7ba1\\u7406\",\"icon\":\"fa fa-leaf\",\"weigh\":\"4\",\"condition\":\"\",\"remark\":\"Category tips\",\"status\":\"hidden\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540686');
INSERT INTO `fa_admin_log` VALUES ('62', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540686');
INSERT INTO `fa_admin_log` VALUES ('63', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/95?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"e77fc8dff1e00ee17acd00466bd24aff\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"client\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa fa-address-card\",\"weigh\":\"99\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"95\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540704');
INSERT INTO `fa_admin_log` VALUES ('64', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540704');
INSERT INTO `fa_admin_log` VALUES ('65', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/97?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"ceffd4f8ef364f4a461998bff2212649\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"client\\/address\",\"title\":\"\\u5730\\u5740\\u5217\\u8868\",\"icon\":\"fa fa-align-justify\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"97\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540730');
INSERT INTO `fa_admin_log` VALUES ('66', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587540730');
INSERT INTO `fa_admin_log` VALUES ('67', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/1?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"feadf1ab697a76c5a3b698069d67a5f4\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"dashboard\",\"title\":\"\\u63a7\\u5236\\u53f0\",\"icon\":\"fa fa-dashboard\",\"weigh\":\"150\",\"condition\":\"\",\"remark\":\"Dashboard tips\",\"status\":\"normal\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587541263');
INSERT INTO `fa_admin_log` VALUES ('68', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587541264');
INSERT INTO `fa_admin_log` VALUES ('69', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/del/ids/1', '客户管理 地址列表', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587542686');
INSERT INTO `fa_admin_log` VALUES ('70', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/del/ids/3', '客户管理 地址列表', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587542741');
INSERT INTO `fa_admin_log` VALUES ('71', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"bf0342f4f9f72bd19f2126ce8034427b\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"goods\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587544916');
INSERT INTO `fa_admin_log` VALUES ('72', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587544916');
INSERT INTO `fa_admin_log` VALUES ('73', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/108?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"275cc905fc3349f5874dc783eb8e6b6b\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"goods\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa fa-archive\",\"weigh\":\"98\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"108\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587544948');
INSERT INTO `fa_admin_log` VALUES ('74', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587544948');
INSERT INTO `fa_admin_log` VALUES ('75', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"6aee9f75adc12fe83b82fff8ac09e15d\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"order\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa fa-newspaper-o\",\"weigh\":\"97\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587544996');
INSERT INTO `fa_admin_log` VALUES ('76', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587544996');
INSERT INTO `fa_admin_log` VALUES ('77', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"bf30b153fa34bc70b0a7545466e19543\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"finance\",\"title\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"96\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587545052');
INSERT INTO `fa_admin_log` VALUES ('78', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587545053');
INSERT INTO `fa_admin_log` VALUES ('79', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/110?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"9b8d744abf6cd6d7149aed233433be5b\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"finance\",\"title\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"icon\":\"fa fa-dollar\",\"weigh\":\"96\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"110\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587545086');
INSERT INTO `fa_admin_log` VALUES ('80', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587545087');
INSERT INTO `fa_admin_log` VALUES ('81', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/111?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"cb9efc8f1fcf09412cc8e4ed5bf04205\",\"row\":{\"ismenu\":\"1\",\"pid\":\"108\",\"name\":\"goods\\/goods\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"111\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587546688');
INSERT INTO `fa_admin_log` VALUES ('82', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587546689');
INSERT INTO `fa_admin_log` VALUES ('83', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/111?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"15dc2923e62c7ec54ed68ad6d1b9ef5d\",\"row\":{\"ismenu\":\"1\",\"pid\":\"108\",\"name\":\"goods\\/good\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"111\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587546864');
INSERT INTO `fa_admin_log` VALUES ('84', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587546864');
INSERT INTO `fa_admin_log` VALUES ('85', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/del/ids/111', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"111\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587546917');
INSERT INTO `fa_admin_log` VALUES ('86', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587546918');
INSERT INTO `fa_admin_log` VALUES ('87', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"90adeed78cce936c137fc80684ddf5e9\",\"row\":{\"ismenu\":\"1\",\"pid\":\"108\",\"name\":\"goods\\/goods\",\"title\":\"\\u5546\\u54c1\\u5217\\u8868\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587547019');
INSERT INTO `fa_admin_log` VALUES ('88', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587547019');
INSERT INTO `fa_admin_log` VALUES ('89', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"59db621691fb62a890170cf4b15a6ee0\",\"row\":{\"ismenu\":\"1\",\"pid\":\"108\",\"name\":\"goods\\/good\",\"title\":\"\\u5546\\u54c1\\u5217\\u8868\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587547533');
INSERT INTO `fa_admin_log` VALUES ('90', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587547534');
INSERT INTO `fa_admin_log` VALUES ('91', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"0cb7487407452011196613b8f63bfcaf\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"goods\\/classes\",\"title\":\"\\u5206\\u7c7b\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587548933');
INSERT INTO `fa_admin_log` VALUES ('92', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587548934');
INSERT INTO `fa_admin_log` VALUES ('93', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/119?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"b5ece9206997a156a50e5d87e2f9651a\",\"row\":{\"ismenu\":\"1\",\"pid\":\"108\",\"name\":\"goods\\/classes\",\"title\":\"\\u5206\\u7c7b\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"119\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587548955');
INSERT INTO `fa_admin_log` VALUES ('94', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587548955');
INSERT INTO `fa_admin_log` VALUES ('95', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/2?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"f43e8b593c24db4f96a6f584d7a93ac2\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"general\",\"title\":\"\\u5e38\\u89c4\\u7ba1\\u7406\",\"icon\":\"fa fa-cogs\",\"weigh\":\"4\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587548987');
INSERT INTO `fa_admin_log` VALUES ('96', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587548988');
INSERT INTO `fa_admin_log` VALUES ('97', '0', 'Unknown', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '登录', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"88a000d97bb8fafc959e30fa29351243\",\"username\":\"LindenVan\",\"captcha\":\"BANK\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587606643');
INSERT INTO `fa_admin_log` VALUES ('98', '0', 'Unknown', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '登录', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"84f1eba0ad4fd88328ffe499ea3b7bb5\",\"username\":\"LindenVan\",\"captcha\":\"WZUU\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587606657');
INSERT INTO `fa_admin_log` VALUES ('99', '0', 'Unknown', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '登录', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"3a9ff194c5f1019731b6820781a9b082\",\"username\":\"LindenVan\",\"captcha\":\"ZTTU\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587606680');
INSERT INTO `fa_admin_log` VALUES ('100', '0', 'Unknown', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"2bc7d4797ba0b5fb50ae42964f07d38e\",\"username\":\"jiacang\",\"captcha\":\"QzHi\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587606697');
INSERT INTO `fa_admin_log` VALUES ('101', '0', 'Unknown', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"07252bbe0f986aaad33b114701958676\",\"username\":\"jiacang\",\"captcha\":\"YNBJ\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587606705');
INSERT INTO `fa_admin_log` VALUES ('102', '0', 'Unknown', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"c30659e233619f57e949cf33b83b546d\",\"username\":\"jiacang\",\"captcha\":\"YZFZ\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587606716');
INSERT INTO `fa_admin_log` VALUES ('103', '0', 'Unknown', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"a47a8aeb39648fd531ec8d70f7b3340e\",\"username\":\"jiacang\",\"captcha\":\"VYMK\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587606737');
INSERT INTO `fa_admin_log` VALUES ('104', '0', 'Unknown', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '登录', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"4759d1c5cec763a3bb22b88320e7464c\",\"username\":\"LindenVan\",\"captcha\":\"EXNU\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587606790');
INSERT INTO `fa_admin_log` VALUES ('105', '1', 'lindenvan', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '登录', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"5d9b42ab19ecd31b03ed77822f65d4d7\",\"username\":\"lindenvan\",\"captcha\":\"YSCL\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587606992');
INSERT INTO `fa_admin_log` VALUES ('106', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/120?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"ecbb489cab20c779ad3241fbc5e02c74\",\"row\":{\"ismenu\":\"1\",\"pid\":\"109\",\"name\":\"order\\/goreder\",\"title\":\"\\u5546\\u54c1\\u8ba2\\u5355\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"120\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587621116');
INSERT INTO `fa_admin_log` VALUES ('107', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587621117');
INSERT INTO `fa_admin_log` VALUES ('108', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/126?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"e0706f972f76e0463a268a332e31b3e5\",\"row\":{\"ismenu\":\"1\",\"pid\":\"109\",\"name\":\"order\\/voreder\",\"title\":\"\\u4f1a\\u5458\\u8ba2\\u5355\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"126\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587621167');
INSERT INTO `fa_admin_log` VALUES ('109', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587621167');
INSERT INTO `fa_admin_log` VALUES ('110', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/132?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"16ad0317bb8d2cee0da77f229855e919\",\"row\":{\"ismenu\":\"1\",\"pid\":\"110\",\"name\":\"finance\\/withdrawals\",\"title\":\"\\u63d0\\u73b0\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"132\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587621747');
INSERT INTO `fa_admin_log` VALUES ('111', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587621747');
INSERT INTO `fa_admin_log` VALUES ('112', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/138?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"1612f1146ec8107a1682dae4366e5e08\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"client\\/users\",\"title\":\"\\u5ba2\\u6237\\u5217\\u8868\",\"icon\":\"fa fa-address-book-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"138\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587622095');
INSERT INTO `fa_admin_log` VALUES ('113', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587622095');
INSERT INTO `fa_admin_log` VALUES ('114', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/138?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"2874a9e476ced65433cfb1afc14add77\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"client\\/users\",\"title\":\"\\u5ba2\\u6237\\u5217\\u8868\",\"icon\":\"fa fa-address-book-o\",\"weigh\":\"20\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"138\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587622110');
INSERT INTO `fa_admin_log` VALUES ('115', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587622110');
INSERT INTO `fa_admin_log` VALUES ('116', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/del/ids/3', '客户管理 客户列表 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587622709');
INSERT INTO `fa_admin_log` VALUES ('117', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/edit/ids/2?dialog=1', '客户管理 客户列表 编辑', '{\"dialog\":\"1\",\"row\":{\"user_key\":\"xiaoli2\",\"tel\":\"18801057371\",\"level\":\"0\",\"money\":\"500\",\"pending\":\"50\",\"name\":\"\\u5f20\\u4e8c\",\"id_number\":\"13043019971015263X\",\"create_time\":\"2020-04-21 07:59:35\",\"last_time\":\"2020-04-22 11:44:40\",\"status\":\"0\",\"comment\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587622734');
INSERT INTO `fa_admin_log` VALUES ('118', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/2,1', '客户管理 客户列表 批量更新', '{\"ids\":\"2,1\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587624131');
INSERT INTO `fa_admin_log` VALUES ('119', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/2,1', '客户管理 客户列表 批量更新', '{\"ids\":\"2,1\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587624133');
INSERT INTO `fa_admin_log` VALUES ('120', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/edit/ids/3?dialog=1', '客户管理 客户列表 编辑', '{\"dialog\":\"1\",\"row\":{\"user_key\":\"xiaoli2\",\"tel\":\"18801057371\",\"level\":\"1\",\"money\":\"300\",\"pending\":\"50\",\"name\":\"\\u738b\\u67d0\",\"id_number\":\"13043019971015263X\",\"create_time\":\"2020-04-21 07:59:35\",\"last_time\":\"2020-04-22 11:44:40\",\"status\":\"0\",\"comment\":\"\\u6ca1\\u6709\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587631163');
INSERT INTO `fa_admin_log` VALUES ('121', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/edit/ids/3?dialog=1', '客户管理 客户列表 编辑', '{\"dialog\":\"1\",\"row\":{\"user_key\":\"xiaoli2\",\"tel\":\"18801057371\",\"level\":\"1\",\"money\":\"300\",\"pending\":\"50\",\"name\":\"\\u738b\\u67d0\",\"id_number\":\"13043019971015263X\",\"create_time\":\"2020-04-21 07:59:35\",\"last_time\":\"2020-04-22 11:44:40\",\"status\":\"1\",\"comment\":\"\\u6ca1\\u6709\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587631194');
INSERT INTO `fa_admin_log` VALUES ('122', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/add?dialog=1', '客户管理 客户列表 添加', '{\"dialog\":\"1\",\"row\":{\"user_key\":\"lopll10\",\"tel\":\"15599661793\",\"level\":\"0\",\"money\":\"260\",\"pending\":\"20\",\"name\":\"\\u9648\\u4e94\",\"id_number\":\"15023319850623\",\"create_time\":\"2020-04-23 16:50:03\",\"last_time\":\"2020-04-23 16:50:03\",\"status\":\"0\",\"comment\":\"\\u6682\\u65e0\\u5907\\u6ce8\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587631922');
INSERT INTO `fa_admin_log` VALUES ('123', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/edit/ids/1?dialog=1', '客户管理 客户列表 编辑', '{\"dialog\":\"1\",\"row\":{\"user_key\":\"xiaoli1\",\"tel\":\"18801057371\",\"level\":\"0\",\"money\":\"5066\",\"pending\":\"50\",\"name\":\"\\u5f20\\u4e09\",\"id_number\":\"13043019971015263X\",\"create_time\":\"2020-04-21 07:59:35\",\"last_time\":\"2020-04-22 11:44:40\",\"status\":\"0\",\"comment\":\"\\u6ca1\\u6709\\u7b80\\u4ecb\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587632080');
INSERT INTO `fa_admin_log` VALUES ('124', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/108?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"24650d91db94368263ec3c57fc327e45\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"goods\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa fa-archive\",\"weigh\":\"98\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"108\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587634689');
INSERT INTO `fa_admin_log` VALUES ('125', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587634690');
INSERT INTO `fa_admin_log` VALUES ('126', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/2?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"ca5e276592d10cbc55ccafb05e720372\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"general\",\"title\":\"\\u5e38\\u89c4\\u7ba1\\u7406\",\"icon\":\"fa fa-cogs\",\"weigh\":\"4\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587634704');
INSERT INTO `fa_admin_log` VALUES ('127', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587634705');
INSERT INTO `fa_admin_log` VALUES ('128', '1', 'lindenvan', '/rWPFXdqobO.php/general/config/check', '常规管理 系统配置', '{\"row\":{\"name\":\"client\\/users\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587634786');
INSERT INTO `fa_admin_log` VALUES ('129', '1', 'lindenvan', '/rWPFXdqobO.php/general.config/add', '常规管理 系统配置 添加', '{\"__token__\":\"e381f9545405809924182673da85437a\",\"row\":{\"type\":\"select\",\"group\":\"dictionary\",\"name\":\"client\\/users\",\"title\":\"\\u5ba2\\u6237\\u5217\\u8868\",\"value\":\"status\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"\",\"rule\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587634885');
INSERT INTO `fa_admin_log` VALUES ('130', '1', 'lindenvan', '/rWPFXdqobO.php/general/config/del', '常规管理 系统配置 删除', '{\"name\":\"client\\/users\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587634961');
INSERT INTO `fa_admin_log` VALUES ('131', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/multi/ids/1', '客户管理 地址列表 批量更新', '{\"ids\":\"1\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587693492');
INSERT INTO `fa_admin_log` VALUES ('132', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/multi/ids/1', '客户管理 地址列表 批量更新', '{\"ids\":\"1\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587693496');
INSERT INTO `fa_admin_log` VALUES ('133', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/multi/ids/1', '客户管理 地址列表 批量更新', '{\"ids\":\"1\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587693507');
INSERT INTO `fa_admin_log` VALUES ('134', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/multi/ids/1', '客户管理 地址列表 批量更新', '{\"ids\":\"1\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587693533');
INSERT INTO `fa_admin_log` VALUES ('135', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/multi/ids/1', '客户管理 地址列表 批量更新', '{\"ids\":\"1\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587693754');
INSERT INTO `fa_admin_log` VALUES ('136', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/multi/ids/1', '客户管理 地址列表 批量更新', '{\"ids\":\"1\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587693770');
INSERT INTO `fa_admin_log` VALUES ('137', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/6', '客户管理 客户列表 批量更新', '{\"ids\":\"6\",\"params\":\"status=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587718693');
INSERT INTO `fa_admin_log` VALUES ('138', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/3', '客户管理 客户列表 批量更新', '{\"ids\":\"3\",\"params\":\"status=2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587718841');
INSERT INTO `fa_admin_log` VALUES ('139', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/6', '客户管理 客户列表 批量更新', '{\"ids\":\"6\",\"params\":\"status=2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587718890');
INSERT INTO `fa_admin_log` VALUES ('140', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/3', '客户管理 客户列表 批量更新', '{\"ids\":\"3\",\"params\":\"status=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587718894');
INSERT INTO `fa_admin_log` VALUES ('141', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/6', '客户管理 客户列表 批量更新', '{\"ids\":\"6\",\"params\":\"status=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587719496');
INSERT INTO `fa_admin_log` VALUES ('142', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/6', '客户管理 客户列表 批量更新', '{\"ids\":\"6\",\"params\":\"status=2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587719501');
INSERT INTO `fa_admin_log` VALUES ('143', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/6,3,2,1', '客户管理 客户列表 批量更新', '{\"ids\":\"6,3,2,1\",\"params\":\"status=2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587719509');
INSERT INTO `fa_admin_log` VALUES ('144', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/6,3,2,1', '客户管理 客户列表 批量更新', '{\"ids\":\"6,3,2,1\",\"params\":\"password=dc483e80a7a0bd9ef71d8cf973673924\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587720219');
INSERT INTO `fa_admin_log` VALUES ('145', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/6,3,2,1', '客户管理 客户列表 批量更新', '{\"ids\":\"6,3,2,1\",\"params\":\"password=dc483e80a7a0bd9ef71d8cf973673924\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587720224');
INSERT INTO `fa_admin_log` VALUES ('146', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/12?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"40925152ba86d037dff6141ec5f8db92\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"auth\\/rule\",\"title\":\"\\u83dc\\u5355\\u89c4\\u5219\",\"icon\":\"fa fa-bars\",\"weigh\":\"1\",\"condition\":\"\",\"remark\":\"Rule tips\",\"status\":\"normal\"},\"ids\":\"12\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587722444');
INSERT INTO `fa_admin_log` VALUES ('147', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587722444');
INSERT INTO `fa_admin_log` VALUES ('148', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/4?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"1951342c161330e26887f22f3f856244\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"addon\",\"title\":\"\\u63d2\\u4ef6\\u7ba1\\u7406\",\"icon\":\"fa fa-rocket\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"Addon tips\",\"status\":\"hidden\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587722455');
INSERT INTO `fa_admin_log` VALUES ('149', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587722456');
INSERT INTO `fa_admin_log` VALUES ('150', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/5?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"39bb03ac2835051da48272877f1d9789\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"auth\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa fa-group\",\"weigh\":\"3\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587722463');
INSERT INTO `fa_admin_log` VALUES ('151', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587722463');
INSERT INTO `fa_admin_log` VALUES ('152', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/2?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"87fd0f385b2dc6539fd984eefc909706\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"general\",\"title\":\"\\u5e38\\u89c4\\u7ba1\\u7406\",\"icon\":\"fa fa-cogs\",\"weigh\":\"4\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587722472');
INSERT INTO `fa_admin_log` VALUES ('153', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587722472');
INSERT INTO `fa_admin_log` VALUES ('154', '1', 'lindenvan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"cef1cb51b3406aac2c0a1b1066924bcb\",\"username\":\"lindenvan\",\"captcha\":\"UKNE\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587723094');
INSERT INTO `fa_admin_log` VALUES ('155', '1', 'lindenvan', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '登录', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"0b38fee33fe55392bc09964f6ae8b20b\",\"username\":\"lindenvan\",\"captcha\":\"HDN8\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', '1587866215');
INSERT INTO `fa_admin_log` VALUES ('156', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"2\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587872961');
INSERT INTO `fa_admin_log` VALUES ('157', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"1\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587872974');
INSERT INTO `fa_admin_log` VALUES ('158', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"2\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587873098');
INSERT INTO `fa_admin_log` VALUES ('159', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"2\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587873119');
INSERT INTO `fa_admin_log` VALUES ('160', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"1\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587873124');
INSERT INTO `fa_admin_log` VALUES ('161', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"2\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587873140');
INSERT INTO `fa_admin_log` VALUES ('162', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"1\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587873235');
INSERT INTO `fa_admin_log` VALUES ('163', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"0\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587873428');
INSERT INTO `fa_admin_log` VALUES ('164', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/add?dialog=1', '客户管理 地址列表 添加', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"\",\"address_name\":\"\",\"user_tel\":\"\",\"address_comment\":\"\",\"is_default\":\"0\",\"add_time\":\"2020-04-26 12:30:25\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587875428');
INSERT INTO `fa_admin_log` VALUES ('165', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/del/ids/2', '客户管理 地址列表 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587880018');
INSERT INTO `fa_admin_log` VALUES ('166', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"0\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587880028');
INSERT INTO `fa_admin_log` VALUES ('167', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"0\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587880033');
INSERT INTO `fa_admin_log` VALUES ('168', '1', 'lindenvan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"1\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587880426');
INSERT INTO `fa_admin_log` VALUES ('169', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/149?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"e32dfe884ab96d93a5b4810834e3e776\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"identify\",\"title\":\"\\u9274\\u5b9a\\u7ba1\\u7406\",\"icon\":\"fa fa-bars\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"149\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587882980');
INSERT INTO `fa_admin_log` VALUES ('170', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587882980');
INSERT INTO `fa_admin_log` VALUES ('171', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/149?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"b91d0a9cfc5bb1d7487f8525c323ce39\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"identify\",\"title\":\"\\u9274\\u5b9a\\u7ba1\\u7406\",\"icon\":\"fa fa-list-ul\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"149\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587883004');
INSERT INTO `fa_admin_log` VALUES ('172', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587883004');
INSERT INTO `fa_admin_log` VALUES ('173', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/149?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"e26bcce80bbe4eaf6e02b1ee1f916091\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"identify\",\"title\":\"\\u9274\\u5b9a\\u7ba1\\u7406\",\"icon\":\"fa fa-list-ul\",\"weigh\":\"95\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"149\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587883027');
INSERT INTO `fa_admin_log` VALUES ('174', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587883027');
INSERT INTO `fa_admin_log` VALUES ('175', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/150?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"9bd29fe75e2c7a5e0a3a4b4471d01976\",\"row\":{\"ismenu\":\"1\",\"pid\":\"149\",\"name\":\"identify\\/ident\",\"title\":\"\\u5728\\u7ebf\\u9274\\u5b9a\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"150\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587883041');
INSERT INTO `fa_admin_log` VALUES ('176', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587883041');
INSERT INTO `fa_admin_log` VALUES ('177', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/150?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"8c26d49ef7b87305baea36cdab5b844c\",\"row\":{\"ismenu\":\"1\",\"pid\":\"149\",\"name\":\"identify\\/ident\",\"title\":\"\\u5728\\u7ebf\\u9274\\u5b9a\",\"icon\":\"fa fa-dot-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"150\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587883068');
INSERT INTO `fa_admin_log` VALUES ('178', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587883069');
INSERT INTO `fa_admin_log` VALUES ('179', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/156?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"fae342a69aba778ba16885fc8bea77fc\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"msg\",\"title\":\"\\u6d88\\u606f\\u7ba1\\u7406\",\"icon\":\"fa fa-commenting\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"156\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587885144');
INSERT INTO `fa_admin_log` VALUES ('180', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587885145');
INSERT INTO `fa_admin_log` VALUES ('181', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/156?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"782b1988e1e205fb995daadd93e72f12\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"msg\",\"title\":\"\\u6d88\\u606f\\u7ba1\\u7406\",\"icon\":\"fa fa-commenting\",\"weigh\":\"94\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"156\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587885155');
INSERT INTO `fa_admin_log` VALUES ('182', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587885156');
INSERT INTO `fa_admin_log` VALUES ('183', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/157?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"7b9b7267d35d9c8354fa2981f3337ed0\",\"row\":{\"ismenu\":\"1\",\"pid\":\"156\",\"name\":\"msg\\/message\",\"title\":\"\\u7559\\u8a00\\u7ba1\\u7406\",\"icon\":\"fa fa-commenting\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"157\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587885197');
INSERT INTO `fa_admin_log` VALUES ('184', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587885197');
INSERT INTO `fa_admin_log` VALUES ('185', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/157?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"5d8f38555544252629f17114844c0bf2\",\"row\":{\"ismenu\":\"1\",\"pid\":\"156\",\"name\":\"msg\\/message\",\"title\":\"\\u7559\\u8a00\\u7ba1\\u7406\",\"icon\":\"fa fa-commenting-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"157\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587885236');
INSERT INTO `fa_admin_log` VALUES ('186', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587885236');
INSERT INTO `fa_admin_log` VALUES ('187', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/163?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"c5fef3b6880f8d73519c58ffebe04125\",\"row\":{\"ismenu\":\"1\",\"pid\":\"156\",\"name\":\"msg\\/feedback\",\"title\":\"\\u53cd\\u9988\\u7ba1\\u7406\",\"icon\":\"fa fa-dedent\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"163\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587886622');
INSERT INTO `fa_admin_log` VALUES ('188', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587886622');
INSERT INTO `fa_admin_log` VALUES ('189', '1', 'lindenvan', '/rWPFXdqobO.php/ajax/weigh', '', '{\"ids\":\"1,95,138,97,108,118,119,109,120,126,110,132,149,156,150,157,163,2,6,7,8,3,5,9,10,11,12,4,66,67,73,79\",\"changeid\":\"156\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587891095');
INSERT INTO `fa_admin_log` VALUES ('190', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587891095');
INSERT INTO `fa_admin_log` VALUES ('191', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/169?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"4c2f3bc826925871034bf50e2d4a80e3\",\"row\":{\"ismenu\":\"1\",\"pid\":\"109\",\"name\":\"order\\/voreder\",\"title\":\"\\u4f1a\\u5458\\u8ba2\\u5355\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"169\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587891688');
INSERT INTO `fa_admin_log` VALUES ('192', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587891689');
INSERT INTO `fa_admin_log` VALUES ('193', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/175?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"88d61c57f24623cd04367279ea647a68\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"client\\/real_name\",\"title\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"175\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587894846');
INSERT INTO `fa_admin_log` VALUES ('194', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587894846');
INSERT INTO `fa_admin_log` VALUES ('195', '1', 'lindenvan', '/rWPFXdqobO.php/goods/classes/add?dialog=1', '商品管理 分类管理', '{\"dialog\":\"1\",\"row\":{\"class_name\":\"\\u7389\\u5668\",\"have_num\":\"0\",\"cerate_time\":\"2020-04-26 18:14:48\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587896112');
INSERT INTO `fa_admin_log` VALUES ('196', '1', 'lindenvan', '/rWPFXdqobO.php/goods/classes/add?dialog=1', '商品管理 分类管理', '{\"dialog\":\"1\",\"row\":{\"class_name\":\"\\u9752\\u94dc\\u5668\",\"have_num\":\"0\",\"cerate_time\":\"2020-04-26 18:15:15\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587896129');
INSERT INTO `fa_admin_log` VALUES ('197', '1', 'lindenvan', '/rWPFXdqobO.php/goods/classes/add?dialog=1', '商品管理 分类管理', '{\"dialog\":\"1\",\"row\":{\"class_name\":\"\\u53e4\\u73a9\",\"have_num\":\"0\",\"cerate_time\":\"2020-04-26 18:15:32\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587896146');

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES ('1', '1', '0', '/assets/img/qrcode.png', '150', '150', 'png', '0', '21859', 'image/png', '', '1499681848', '1499681848', '1499681848', 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分组表';

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES ('1', '0', 'Admin group', '*', '1490883540', '149088354', 'normal');
INSERT INTO `fa_auth_group` VALUES ('2', '1', 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', '1490883540', '1505465692', 'normal');
INSERT INTO `fa_auth_group` VALUES ('3', '2', 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', '1490883540', '1502205322', 'normal');
INSERT INTO `fa_auth_group` VALUES ('4', '1', 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', '1490883540', '1502205350', 'normal');
INSERT INTO `fa_auth_group` VALUES ('5', '2', 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', '1490883540', '1502205344', 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES ('1', '1');

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='节点表';

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES ('1', 'file', '0', 'dashboard', '控制台', 'fa fa-dashboard', '', 'Dashboard tips', '1', '1497429920', '1587541263', '150', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('2', 'file', '0', 'general', '常规管理', 'fa fa-cogs', '', '', '1', '1497429920', '1587722472', '94', 'hidden');
INSERT INTO `fa_auth_rule` VALUES ('3', 'file', '0', 'category', '分类管理', 'fa fa-leaf', '', 'Category tips', '1', '1497429920', '1587540685', '4', 'hidden');
INSERT INTO `fa_auth_rule` VALUES ('4', 'file', '0', 'addon', '插件管理', 'fa fa-rocket', '', 'Addon tips', '1', '1502035509', '1587722455', '0', 'hidden');
INSERT INTO `fa_auth_rule` VALUES ('5', 'file', '0', 'auth', '权限管理', 'fa fa-group', '', '', '1', '1497429920', '1587722463', '3', 'hidden');
INSERT INTO `fa_auth_rule` VALUES ('6', 'file', '2', 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', '1', '1497429920', '1497430683', '60', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('7', 'file', '2', 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', '1', '1497429920', '1497430699', '53', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('8', 'file', '2', 'general/profile', 'Profile', 'fa fa-user', '', '', '1', '1497429920', '1497429920', '34', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', '1', '1497429920', '1497430320', '118', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', '1', '1497429920', '1497430307', '113', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('11', 'file', '5', 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', '1', '1497429920', '1497429920', '109', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('12', 'file', '0', 'auth/rule', '菜单规则', 'fa fa-bars', '', 'Rule tips', '1', '1497429920', '1587722444', '1', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('13', 'file', '1', 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '136', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('14', 'file', '1', 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '135', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('15', 'file', '1', 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '133', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('16', 'file', '1', 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '134', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('17', 'file', '1', 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '132', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('18', 'file', '6', 'general/config/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '52', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('19', 'file', '6', 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '51', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('20', 'file', '6', 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '50', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('21', 'file', '6', 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '49', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('22', 'file', '6', 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '48', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('23', 'file', '7', 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', '0', '1497429920', '1497429920', '59', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('24', 'file', '7', 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '58', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('25', 'file', '7', 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '57', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('26', 'file', '7', 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '56', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('27', 'file', '7', 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '55', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('28', 'file', '7', 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '54', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('29', 'file', '8', 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '33', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('30', 'file', '8', 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '32', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('31', 'file', '8', 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '31', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('32', 'file', '8', 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '30', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('33', 'file', '8', 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '29', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('34', 'file', '8', 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '28', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('35', 'file', '3', 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', '0', '1497429920', '1497429920', '142', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('36', 'file', '3', 'category/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '141', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('37', 'file', '3', 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '140', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('38', 'file', '3', 'category/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '139', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('39', 'file', '3', 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '138', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('40', 'file', '9', 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', '0', '1497429920', '1497429920', '117', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('41', 'file', '9', 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '116', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('42', 'file', '9', 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '115', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('43', 'file', '9', 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '114', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('44', 'file', '10', 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', '0', '1497429920', '1497429920', '112', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('45', 'file', '10', 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '111', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('46', 'file', '10', 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '110', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('47', 'file', '11', 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', '0', '1497429920', '1497429920', '108', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('48', 'file', '11', 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '107', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('49', 'file', '11', 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '106', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('50', 'file', '11', 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '105', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('51', 'file', '12', 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', '0', '1497429920', '1497429920', '103', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('52', 'file', '12', 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '102', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('53', 'file', '12', 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '101', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('54', 'file', '12', 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '100', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('55', 'file', '4', 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('56', 'file', '4', 'addon/add', 'Add', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('57', 'file', '4', 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('58', 'file', '4', 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('59', 'file', '4', 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('60', 'file', '4', 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('63', 'file', '4', 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('64', 'file', '4', 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('65', 'file', '4', 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('66', 'file', '0', 'user', '会员管理', 'fa fa-list', '', '', '1', '1516374729', '1587523529', '0', 'hidden');
INSERT INTO `fa_auth_rule` VALUES ('67', 'file', '66', 'user/user', 'User', 'fa fa-user', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('68', 'file', '67', 'user/user/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('69', 'file', '67', 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('70', 'file', '67', 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('71', 'file', '67', 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('72', 'file', '67', 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('73', 'file', '66', 'user/group', 'User group', 'fa fa-users', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('74', 'file', '73', 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('75', 'file', '73', 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('76', 'file', '73', 'user/group/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('77', 'file', '73', 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('78', 'file', '73', 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('79', 'file', '66', 'user/rule', '会员规则', 'fa fa-circle-o', '', '', '1', '1516374729', '1587523542', '0', 'hidden');
INSERT INTO `fa_auth_rule` VALUES ('80', 'file', '79', 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('81', 'file', '79', 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('82', 'file', '79', 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('83', 'file', '79', 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('84', 'file', '79', 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('95', 'file', '0', 'client', '客户管理', 'fa fa-address-card', '', '', '1', '1587537208', '1587540704', '99', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('97', 'file', '95', 'client/address', '地址列表', 'fa fa-align-justify', '', '', '1', '1587540598', '1587540730', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('98', 'file', '97', 'client/address/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587542989', '1587542989', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('99', 'file', '97', 'client/address/del', '删除', 'fa fa-circle-o', '', '', '0', '1587542989', '1587542989', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('100', 'file', '97', 'client/address/index', '查看', 'fa fa-circle-o', '', '', '0', '1587542989', '1587542989', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('101', 'file', '97', 'client/address/add', '添加', 'fa fa-circle-o', '', '', '0', '1587542989', '1587542989', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('102', 'file', '97', 'client/address/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587542989', '1587542989', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('108', 'file', '0', 'goods', '商品管理', 'fa fa-archive', '', '', '1', '1587544916', '1587634689', '98', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('109', 'file', '0', 'order', '订单管理', 'fa fa-newspaper-o', '', '', '1', '1587544996', '1587544996', '97', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('110', 'file', '0', 'finance', '财务管理', 'fa fa-dollar', '', '', '1', '1587545052', '1587545086', '96', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('118', 'file', '108', 'goods/good', '商品列表', 'fa fa-circle-o', '', '', '1', '1587547533', '1587547533', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('119', 'file', '108', 'goods/classes', '分类管理', 'fa fa-circle-o', '', '', '1', '1587548933', '1587548955', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('120', 'file', '109', 'order/goreder', '商品订单', 'fa fa-circle-o', '', '', '1', '1587620978', '1587621116', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('121', 'file', '120', 'order/goreder/index', '查看', 'fa fa-circle-o', '', '', '0', '1587620978', '1587620978', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('122', 'file', '120', 'order/goreder/add', '添加', 'fa fa-circle-o', '', '', '0', '1587620978', '1587620978', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('123', 'file', '120', 'order/goreder/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587620978', '1587620978', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('124', 'file', '120', 'order/goreder/del', '删除', 'fa fa-circle-o', '', '', '0', '1587620978', '1587620978', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('125', 'file', '120', 'order/goreder/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587620978', '1587620978', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('132', 'file', '110', 'finance/withdrawals', '提现管理', 'fa fa-circle-o', '', '', '1', '1587621428', '1587621747', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('133', 'file', '132', 'finance/withdrawals/index', '查看', 'fa fa-circle-o', '', '', '0', '1587621428', '1587621428', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('134', 'file', '132', 'finance/withdrawals/add', '添加', 'fa fa-circle-o', '', '', '0', '1587621428', '1587621428', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('135', 'file', '132', 'finance/withdrawals/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587621428', '1587621428', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('136', 'file', '132', 'finance/withdrawals/del', '删除', 'fa fa-circle-o', '', '', '0', '1587621428', '1587621428', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('137', 'file', '132', 'finance/withdrawals/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587621428', '1587621428', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('138', 'file', '95', 'client/users', '客户列表', 'fa fa-address-book-o', '', '', '1', '1587622027', '1587622110', '20', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('139', 'file', '138', 'client/users/index', '查看', 'fa fa-circle-o', '', '', '0', '1587622027', '1587622027', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('140', 'file', '138', 'client/users/add', '添加', 'fa fa-circle-o', '', '', '0', '1587622027', '1587622027', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('141', 'file', '138', 'client/users/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587622027', '1587622027', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('142', 'file', '138', 'client/users/del', '删除', 'fa fa-circle-o', '', '', '0', '1587622027', '1587622027', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('143', 'file', '138', 'client/users/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587622027', '1587622027', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('144', 'file', '118', 'goods/good/index', '查看', 'fa fa-circle-o', '', '', '0', '1587700224', '1587700224', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('145', 'file', '118', 'goods/good/add', '添加', 'fa fa-circle-o', '', '', '0', '1587700224', '1587700224', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('146', 'file', '118', 'goods/good/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587700224', '1587700224', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('147', 'file', '118', 'goods/good/del', '删除', 'fa fa-circle-o', '', '', '0', '1587700224', '1587700224', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('148', 'file', '118', 'goods/good/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587700224', '1587700224', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('149', 'file', '0', 'identify', '鉴定管理', 'fa fa-list-ul', '', '', '1', '1587882665', '1587883027', '95', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('150', 'file', '149', 'identify/ident', '在线鉴定', 'fa fa-dot-circle-o', '', '', '1', '1587882665', '1587883068', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('151', 'file', '150', 'identify/ident/index', '查看', 'fa fa-circle-o', '', '', '0', '1587882665', '1587882665', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('152', 'file', '150', 'identify/ident/add', '添加', 'fa fa-circle-o', '', '', '0', '1587882665', '1587882665', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('153', 'file', '150', 'identify/ident/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587882665', '1587882665', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('154', 'file', '150', 'identify/ident/del', '删除', 'fa fa-circle-o', '', '', '0', '1587882665', '1587882665', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('155', 'file', '150', 'identify/ident/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587882665', '1587882665', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('156', 'file', '0', 'msg', '消息管理', 'fa fa-commenting', '', '', '1', '1587885000', '1587885155', '94', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('157', 'file', '156', 'msg/message', '留言管理', 'fa fa-commenting-o', '', '', '1', '1587885000', '1587885236', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('158', 'file', '157', 'msg/message/index', '查看', 'fa fa-circle-o', '', '', '0', '1587885000', '1587885000', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('159', 'file', '157', 'msg/message/add', '添加', 'fa fa-circle-o', '', '', '0', '1587885000', '1587885000', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('160', 'file', '157', 'msg/message/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587885000', '1587885000', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('161', 'file', '157', 'msg/message/del', '删除', 'fa fa-circle-o', '', '', '0', '1587885000', '1587885000', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('162', 'file', '157', 'msg/message/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587885000', '1587885000', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('163', 'file', '156', 'msg/feedback', '反馈管理', 'fa fa-dedent', '', '', '1', '1587886248', '1587886621', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('164', 'file', '163', 'msg/feedback/index', '查看', 'fa fa-circle-o', '', '', '0', '1587886248', '1587886248', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('165', 'file', '163', 'msg/feedback/add', '添加', 'fa fa-circle-o', '', '', '0', '1587886248', '1587886248', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('166', 'file', '163', 'msg/feedback/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587886248', '1587886248', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('167', 'file', '163', 'msg/feedback/del', '删除', 'fa fa-circle-o', '', '', '0', '1587886248', '1587886248', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('168', 'file', '163', 'msg/feedback/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587886248', '1587886248', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('169', 'file', '109', 'order/voreder', '会员订单', 'fa fa-circle-o', '', '', '1', '1587891382', '1587891688', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('170', 'file', '169', 'order/voreder/index', '查看', 'fa fa-circle-o', '', '', '0', '1587891382', '1587891599', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('171', 'file', '169', 'order/voreder/add', '添加', 'fa fa-circle-o', '', '', '0', '1587891382', '1587891599', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('172', 'file', '169', 'order/voreder/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587891382', '1587891599', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('173', 'file', '169', 'order/voreder/del', '删除', 'fa fa-circle-o', '', '', '0', '1587891382', '1587891599', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('174', 'file', '169', 'order/voreder/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587891382', '1587891599', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('175', 'file', '95', 'client/real_name', '实名认证', 'fa fa-circle-o', '', '', '1', '1587893349', '1587894846', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('176', 'file', '175', 'client/real_name/index', '查看', 'fa fa-circle-o', '', '', '0', '1587893350', '1587893350', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('177', 'file', '175', 'client/real_name/add', '添加', 'fa fa-circle-o', '', '', '0', '1587893350', '1587893350', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('178', 'file', '175', 'client/real_name/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587893350', '1587893350', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('179', 'file', '175', 'client/real_name/del', '删除', 'fa fa-circle-o', '', '', '0', '1587893350', '1587893350', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('180', 'file', '175', 'client/real_name/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587893350', '1587893350', '0', 'normal');

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of fa_category
-- ----------------------------
INSERT INTO `fa_category` VALUES ('1', '0', 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', '1495262190', '1587523485', '1', 'normal');
INSERT INTO `fa_category` VALUES ('2', '0', 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', '1495262244', '1495262244', '2', 'normal');
INSERT INTO `fa_category` VALUES ('3', '2', 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', '1495262288', '1495262288', '3', 'normal');
INSERT INTO `fa_category` VALUES ('4', '2', 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', '1495262317', '1495262317', '4', 'normal');
INSERT INTO `fa_category` VALUES ('5', '0', 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', '1495262336', '1499681850', '5', 'normal');
INSERT INTO `fa_category` VALUES ('6', '5', 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', '1495262357', '1495262357', '6', 'normal');
INSERT INTO `fa_category` VALUES ('7', '5', 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', '1495262391', '1495262391', '7', 'normal');
INSERT INTO `fa_category` VALUES ('8', '6', 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', '1495262424', '1495262424', '8', 'normal');
INSERT INTO `fa_category` VALUES ('9', '6', 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', '1495262456', '1495262456', '9', 'normal');
INSERT INTO `fa_category` VALUES ('10', '7', 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', '1495262487', '1495262487', '10', 'normal');
INSERT INTO `fa_category` VALUES ('11', '7', 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', '1495262515', '1495262515', '11', 'normal');
INSERT INTO `fa_category` VALUES ('12', '0', 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', '1497015727', '1497015727', '12', 'normal');
INSERT INTO `fa_category` VALUES ('13', '0', 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', '1497015738', '1497015738', '13', 'normal');

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES ('1', 'name', 'basic', 'Site name', '请填写站点名称', 'string', '佳藏后台', '', 'required', '');
INSERT INTO `fa_config` VALUES ('2', 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES ('3', 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES ('4', 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `fa_config` VALUES ('5', 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `fa_config` VALUES ('6', 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `fa_config` VALUES ('7', 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `fa_config` VALUES ('8', 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `fa_config` VALUES ('9', 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `fa_config` VALUES ('10', 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `fa_config` VALUES ('11', 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `fa_config` VALUES ('12', 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `fa_config` VALUES ('13', 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `fa_config` VALUES ('14', 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `fa_config` VALUES ('15', 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `fa_config` VALUES ('16', 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `fa_config` VALUES ('17', 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮箱验证码表';

-- ----------------------------
-- Records of fa_ems
-- ----------------------------

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信验证码表';

-- ----------------------------
-- Records of fa_sms
-- ----------------------------

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='测试表';

-- ----------------------------
-- Records of fa_test
-- ----------------------------
INSERT INTO `fa_test` VALUES ('1', '0', '12', '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', '0.00', '0', '2017-07-10', '2017-07-10 18:24:45', '2017', '18:24:45', '1499682285', '1499682526', '1499682526', null, '0', '1', 'normal', '1');

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES ('1', '1', 'admin', 'admin', 'c13f62012fd6a8fdf06b3452a94430e5', 'rpR6Bv', 'admin@163.com', '13888888888', '', '0', '0', '2017-04-15', '', '0.00', '0', '1', '1', '1516170492', '1516171614', '127.0.0.1', '0', '127.0.0.1', '1491461418', '0', '1516171614', '', 'normal', '');

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员组表';

-- ----------------------------
-- Records of fa_user_group
-- ----------------------------
INSERT INTO `fa_user_group` VALUES ('1', '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', '1515386468', '1516168298', 'normal');

-- ----------------------------
-- Table structure for fa_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_money_log`;
CREATE TABLE `fa_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员余额变动表';

-- ----------------------------
-- Records of fa_user_money_log
-- ----------------------------

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='会员规则表';

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
INSERT INTO `fa_user_rule` VALUES ('1', '0', 'index', '前台', '', '1', '1516168079', '1516168079', '1', 'normal');
INSERT INTO `fa_user_rule` VALUES ('2', '0', 'api', 'API接口', '', '1', '1516168062', '1516168062', '2', 'normal');
INSERT INTO `fa_user_rule` VALUES ('3', '1', 'user', '会员模块', '', '1', '1515386221', '1516168103', '12', 'normal');
INSERT INTO `fa_user_rule` VALUES ('4', '2', 'user', '会员模块', '', '1', '1515386221', '1516168092', '11', 'normal');
INSERT INTO `fa_user_rule` VALUES ('5', '3', 'index/user/login', '登录', '', '0', '1515386247', '1515386247', '5', 'normal');
INSERT INTO `fa_user_rule` VALUES ('6', '3', 'index/user/register', '注册', '', '0', '1515386262', '1516015236', '7', 'normal');
INSERT INTO `fa_user_rule` VALUES ('7', '3', 'index/user/index', '会员中心', '', '0', '1516015012', '1516015012', '9', 'normal');
INSERT INTO `fa_user_rule` VALUES ('8', '3', 'index/user/profile', '个人资料', '', '0', '1516015012', '1516015012', '4', 'normal');
INSERT INTO `fa_user_rule` VALUES ('9', '4', 'api/user/login', '登录', '', '0', '1515386247', '1515386247', '6', 'normal');
INSERT INTO `fa_user_rule` VALUES ('10', '4', 'api/user/register', '注册', '', '0', '1515386262', '1516015236', '8', 'normal');
INSERT INTO `fa_user_rule` VALUES ('11', '4', 'api/user/index', '会员中心', '', '0', '1516015012', '1516015012', '10', 'normal');
INSERT INTO `fa_user_rule` VALUES ('12', '4', 'api/user/profile', '个人资料', '', '0', '1516015012', '1516015012', '3', 'normal');

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分变动表';

-- ----------------------------
-- Records of fa_user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员Token表';

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_key` varchar(50) DEFAULT NULL COMMENT '佳藏号',
  `user_name` varchar(50) DEFAULT NULL COMMENT '反馈者名称',
  `comment` text COMMENT '反馈信息',
  `create_time` datetime DEFAULT NULL COMMENT '反馈时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', 'xiaoli012', '李九', '真好据悉李国庆与俞渝之前已经历“八王议政、当众摔杯、浴池梅毒、票圈撕破脸”等事件。真好据悉李国庆与俞渝之前已经历“八王议政、当众摔杯、浴池梅毒、票圈撕破脸”等事件。真好据悉李国庆与俞渝之前已经历“八王议政、当众摔杯、浴池梅毒、票圈撕破脸”等事件。', '2020-04-26 14:52:05', '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `class` char(1) DEFAULT NULL COMMENT '分类',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `img` varchar(255) DEFAULT NULL COMMENT '示例图',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `browse` int(11) DEFAULT NULL COMMENT '浏览量',
  `collect` int(11) DEFAULT NULL COMMENT '收藏量',
  `tel` char(11) DEFAULT NULL COMMENT '发布人电话',
  `user_key` varchar(11) DEFAULT NULL COMMENT '发布人佳藏号',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '汉五铢', '1', '366.00', 'http://www.f1f2.com/assets/img/qrcode.png', '2', '1', '1', '40006299999', 'xiaoli01', '2020-04-22 17:08:12', '暂无简介');

-- ----------------------------
-- Table structure for identify
-- ----------------------------
DROP TABLE IF EXISTS `identify`;
CREATE TABLE `identify` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `username` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `user_tel` char(11) DEFAULT NULL COMMENT '联系手机',
  `user_key` varchar(50) DEFAULT NULL COMMENT '佳藏号',
  `describe` text COMMENT '描述',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of identify
-- ----------------------------
INSERT INTO `identify` VALUES ('1', '张三', '18801057596', 'xiaoli02', 'identifyidentifyidentifyidentifyidentify', '/img/qrcode.png', '2020-04-24 14:27:06', '1');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `username` varchar(255) DEFAULT NULL COMMENT '名称',
  `user_key` varchar(50) DEFAULT NULL COMMENT '佳藏号',
  `user_tel` char(11) DEFAULT NULL COMMENT '留言人手机',
  `comment` text COMMENT '留言内容',
  `create_time` datetime DEFAULT NULL COMMENT '留言时间',
  `tel` char(11) DEFAULT NULL COMMENT '被留言者手机号',
  `key` varchar(50) DEFAULT NULL COMMENT '被留言者佳藏号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '李四', 'xiaoli02', '15693268147', '据悉李国庆与俞渝之前已经历“八王议政、当众摔杯、浴池梅毒、票圈撕破脸”等事件。', '2020-04-25 14:53:05', '15166104529', 'xiaolin03');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_key` char(20) DEFAULT NULL COMMENT '订单号',
  `buyer_tel` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `buyer_key` varchar(50) DEFAULT NULL COMMENT '购买者佳藏号',
  `buyer_name` varchar(50) DEFAULT NULL COMMENT '购买者姓名',
  `goods_title` varchar(100) DEFAULT NULL COMMENT '商品标题',
  `goods_img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `comment` varchar(255) DEFAULT NULL COMMENT '商品详情',
  `is_goods` tinyint(1) DEFAULT '1' COMMENT '是不是商品订单',
  `issuer_tel` char(11) DEFAULT NULL COMMENT '发布人电话',
  `issuer_key` varchar(50) DEFAULT NULL COMMENT '发布人佳藏号',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '支付价格',
  `pay_mode` tinyint(1) DEFAULT NULL COMMENT '支付方式',
  `create_time` datetime DEFAULT NULL COMMENT '下单时间',
  `address` varchar(255) DEFAULT NULL COMMENT '配送地址',
  `logistics` varchar(100) DEFAULT NULL COMMENT '物流公司',
  `logistics_key` varchar(30) DEFAULT NULL COMMENT '物流单号',
  `logistics_status` tinyint(1) DEFAULT '1' COMMENT '物流状态',
  `take_time` datetime DEFAULT NULL COMMENT '收货时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '11121314151617181910', '18801067975', 'xiaoli10', '张三', '汉五铢', 'http://www.f1f2.com/assets/img/qrcode.png', '暂无简介', '1', '18801067975', 'xiaoli10', '100.00', '100.00', '1', '2020-04-09 13:39:26', '四川成都市高新区软件园A区1栋505', '圆通', '1555555555', '1', '2020-04-11 10:17:40');
INSERT INTO `order` VALUES ('2', '11121314151617181910', '18801067975', 'xiaoli12', '赵二', '一级会员', 'http://www.f1f2.com/assets/img/qrcode.png', '一级会员', '0', '18801067975', 'xiaoli10', '100.00', '100.00', '1', '2020-04-09 13:39:26', '四川成都市高新区软件园A区1栋505', '无', '1555555555', '1', '2020-04-11 10:17:40');

-- ----------------------------
-- Table structure for real_name
-- ----------------------------
DROP TABLE IF EXISTS `real_name`;
CREATE TABLE `real_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '姓名',
  `id_key` char(18) NOT NULL COMMENT '身份证号',
  `tel` char(11) NOT NULL COMMENT '手机',
  `user_key` varchar(50) NOT NULL,
  `id_img` varchar(255) NOT NULL COMMENT '身份证正反面',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '当前状态',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of real_name
-- ----------------------------
INSERT INTO `real_name` VALUES ('1', '王某', '130430145310112118', '18569647201', 'xiaowa10', '../../uploads/log.png,../../uploads/log.png', '2020-04-26 17:27:18', '0', 'test');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_key` varchar(11) CHARACTER SET armscii8 DEFAULT NULL COMMENT '佳藏号',
  `tel` char(11) DEFAULT NULL COMMENT '手机',
  `level` tinyint(1) DEFAULT '0' COMMENT '会员级别',
  `money` float(11,2) DEFAULT NULL COMMENT '余额',
  `pending` float(11,2) DEFAULT NULL COMMENT '待结算金额',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `id_number` char(18) DEFAULT NULL COMMENT '身份证',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `last_time` datetime DEFAULT NULL COMMENT '最后登录',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `password` varchar(25) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'xiaoli1', '18801057371', '0', '5066.00', '50.00', '张三', '13043019971015263X', '2020-04-21 07:59:35', '2020-04-22 11:44:40', '0', '法外狂徒', 'dc483e80a7a0bd9ef71d8cf97');
INSERT INTO `users` VALUES ('2', 'xiaoli2', '18801057371', '0', '200.00', '50.00', '张二', '13043019971015263X', '2020-04-21 07:59:35', '2020-04-22 11:44:40', '0', '没有简介', 'dc483e80a7a0bd9ef71d8cf97');
INSERT INTO `users` VALUES ('3', 'xiaoli2', '18801057371', '1', '300.00', '50.00', '王某', '13043019971015263X', '2020-04-21 07:59:35', '2020-04-22 11:44:40', '0', '没有', 'dc483e80a7a0bd9ef71d8cf97');
INSERT INTO `users` VALUES ('6', 'lopll10', '15599661793', '0', '260.00', '20.00', '陈五', '15023319850623', '2020-04-23 16:50:03', '2020-04-23 16:50:03', '0', '暂无备注', 'dc483e80a7a0bd9ef71d8cf97');

-- ----------------------------
-- Table structure for vorder
-- ----------------------------
DROP TABLE IF EXISTS `vorder`;
CREATE TABLE `vorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_key` varchar(20) DEFAULT NULL COMMENT '订单号',
  `username` varchar(50) DEFAULT NULL COMMENT '购买者',
  `user_key` varchar(50) DEFAULT NULL COMMENT '购买者佳藏号',
  `user_tel` char(11) DEFAULT NULL COMMENT '购买者电话',
  `last_level` tinyint(1) DEFAULT NULL COMMENT '先前等级',
  `shop_level` tinyint(1) DEFAULT NULL COMMENT '购买等级',
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `pay_mode` tinyint(1) DEFAULT NULL COMMENT '支付方式',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vorder
-- ----------------------------
INSERT INTO `vorder` VALUES ('1', '100869517534862', '李四', 'xiaoli02', '15509057371', '0', '1', '100.00', '1', '2020-04-26 14:49:57');

-- ----------------------------
-- Table structure for withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `withdrawals`;
CREATE TABLE `withdrawals` (
  `wdr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `id_number` char(18) DEFAULT NULL COMMENT '身份证',
  `money` float(11,2) NOT NULL COMMENT '提现金额',
  `poundage` float(11,2) NOT NULL COMMENT '手续费',
  `actual_money` float(11,2) NOT NULL COMMENT '实际到账',
  `cash_account` varchar(19) NOT NULL COMMENT '提现账户',
  `wdr_time` datetime NOT NULL COMMENT '提现时间',
  `tel` char(11) NOT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`wdr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of withdrawals
-- ----------------------------
INSERT INTO `withdrawals` VALUES ('1', '张三', '15340319850813', '200.00', '20.00', '180.00', '15900000', '2020-04-22 09:23:36', '15360785590', '0', '暂无简介');
