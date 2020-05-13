/*
Navicat MySQL Data Transfer

Source Server         : liening
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : jiacang

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-05-13 18:28:24
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
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '跳转地址',
  `is_index` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '/uploads/20200511/8a70e1113df14da75caadb1c4d955e94.jpg', 'https://www.baidu.com/', '1');
INSERT INTO `banner` VALUES ('2', '/uploads/20200511/254fdde9b4e96edea4c6501c98d2827b.jpg', 'https://github.com/', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '钱币', '1', '2020-04-23 17:46:02');
INSERT INTO `class` VALUES ('2', '玉器', '0', '2020-04-26 18:14:48');
INSERT INTO `class` VALUES ('3', '青铜器', '0', '2020-04-26 18:15:15');
INSERT INTO `class` VALUES ('4', '古玩', '3', '2020-04-26 18:15:32');
INSERT INTO `class` VALUES ('5', '瓷器', '0', '2020-05-07 17:55:37');
INSERT INTO `class` VALUES ('6', '字画', '0', '2020-05-12 11:39:41');
INSERT INTO `class` VALUES ('7', '书籍', '0', '2020-05-12 11:39:52');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `user_key` varchar(50) NOT NULL COMMENT '用户账号',
  `goods_id` int(11) NOT NULL COMMENT '商品ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('95865eb8bec61de07', '16');
INSERT INTO `collect` VALUES ('81305eb8beebd9ab5', '16');
INSERT INTO `collect` VALUES ('27015eb8bef396c67', '16');
INSERT INTO `collect` VALUES ('48905eb8cabeccbc5', '16');
INSERT INTO `collect` VALUES ('95865eb8bec61de07', '11');
INSERT INTO `collect` VALUES ('81305eb8beebd9ab5', '11');
INSERT INTO `collect` VALUES ('27015eb8bef396c67', '11');
INSERT INTO `collect` VALUES ('48905eb8cabeccbc5', '11');

-- ----------------------------
-- Table structure for datatest
-- ----------------------------
DROP TABLE IF EXISTS `datatest`;
CREATE TABLE `datatest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datatest
-- ----------------------------
INSERT INTO `datatest` VALUES ('1', '/uploads/55.docx', '/uploads/55.docx');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES ('1', 'LindenVan', '开发者', '763dd48d9fdf6695d4c51183596861c5', 'hm0udo', '/assets/img/avatar.png', 'admin@admin.com', '0', '1589333757', '127.0.0.1', '1492186163', '1589333757', 'b2f93a82-06ea-47b3-9ade-20070f41a5e0', 'normal');
INSERT INTO `fa_admin` VALUES ('3', 'admin1', '超管', '6188be37f2157d0d561fc9b47a0dc633', 'BJ0YG4', '/assets/img/avatar.png', 'test@test.com', '0', '1589249242', '127.0.0.1', '1588745058', '1589273307', '', 'normal');

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
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=utf8 COMMENT='管理员日志表';

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
INSERT INTO `fa_admin_log` VALUES ('198', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/multi/ids/1', '菜单规则', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952107');
INSERT INTO `fa_admin_log` VALUES ('199', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952107');
INSERT INTO `fa_admin_log` VALUES ('200', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/multi/ids/1', '菜单规则', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952109');
INSERT INTO `fa_admin_log` VALUES ('201', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952109');
INSERT INTO `fa_admin_log` VALUES ('202', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/multi/ids/1', '菜单规则', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952112');
INSERT INTO `fa_admin_log` VALUES ('203', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952112');
INSERT INTO `fa_admin_log` VALUES ('204', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/multi/ids/1', '菜单规则', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952115');
INSERT INTO `fa_admin_log` VALUES ('205', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952115');
INSERT INTO `fa_admin_log` VALUES ('206', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/multi/ids/95', '菜单规则', '{\"action\":\"\",\"ids\":\"95\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952117');
INSERT INTO `fa_admin_log` VALUES ('207', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952117');
INSERT INTO `fa_admin_log` VALUES ('208', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/multi/ids/95', '菜单规则', '{\"action\":\"\",\"ids\":\"95\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952121');
INSERT INTO `fa_admin_log` VALUES ('209', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952121');
INSERT INTO `fa_admin_log` VALUES ('210', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/multi/ids/95', '菜单规则', '{\"action\":\"\",\"ids\":\"95\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952126');
INSERT INTO `fa_admin_log` VALUES ('211', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952127');
INSERT INTO `fa_admin_log` VALUES ('212', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/multi/ids/95', '菜单规则', '{\"action\":\"\",\"ids\":\"95\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952130');
INSERT INTO `fa_admin_log` VALUES ('213', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952130');
INSERT INTO `fa_admin_log` VALUES ('214', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/6,3,2,1', '客户管理 客户列表 批量更新', '{\"ids\":\"6,3,2,1\",\"params\":\"password=dc483e80a7a0bd9ef71d8cf973673924\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952816');
INSERT INTO `fa_admin_log` VALUES ('215', '1', 'lindenvan', '/rWPFXdqobO.php/client/users/multi/ids/6,3,2,1', '客户管理 客户列表 批量更新', '{\"ids\":\"6,3,2,1\",\"params\":\"password=dc483e80a7a0bd9ef71d8cf973673924\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587952822');
INSERT INTO `fa_admin_log` VALUES ('216', '1', 'lindenvan', '/rWPFXdqobO.php/goods/good/del/ids/3', '商品管理 商品列表 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587959374');
INSERT INTO `fa_admin_log` VALUES ('217', '1', 'lindenvan', '/rWPFXdqobO.php/goods/good/del/ids/2', '商品管理 商品列表 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587967121');
INSERT INTO `fa_admin_log` VALUES ('218', '1', 'lindenvan', '/rWPFXdqobO.php/goods/good/del/ids/4', '商品管理 商品列表 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587967248');
INSERT INTO `fa_admin_log` VALUES ('219', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969222');
INSERT INTO `fa_admin_log` VALUES ('220', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969235');
INSERT INTO `fa_admin_log` VALUES ('221', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969316');
INSERT INTO `fa_admin_log` VALUES ('222', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969322');
INSERT INTO `fa_admin_log` VALUES ('223', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969323');
INSERT INTO `fa_admin_log` VALUES ('224', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969715');
INSERT INTO `fa_admin_log` VALUES ('225', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969717');
INSERT INTO `fa_admin_log` VALUES ('226', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969720');
INSERT INTO `fa_admin_log` VALUES ('227', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969722');
INSERT INTO `fa_admin_log` VALUES ('228', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969723');
INSERT INTO `fa_admin_log` VALUES ('229', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969860');
INSERT INTO `fa_admin_log` VALUES ('230', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969862');
INSERT INTO `fa_admin_log` VALUES ('231', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969863');
INSERT INTO `fa_admin_log` VALUES ('232', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969864');
INSERT INTO `fa_admin_log` VALUES ('233', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587969963');
INSERT INTO `fa_admin_log` VALUES ('234', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587970063');
INSERT INTO `fa_admin_log` VALUES ('235', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587971224');
INSERT INTO `fa_admin_log` VALUES ('236', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587971240');
INSERT INTO `fa_admin_log` VALUES ('237', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587971263');
INSERT INTO `fa_admin_log` VALUES ('238', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587971294');
INSERT INTO `fa_admin_log` VALUES ('239', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587971295');
INSERT INTO `fa_admin_log` VALUES ('240', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587971296');
INSERT INTO `fa_admin_log` VALUES ('241', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587971309');
INSERT INTO `fa_admin_log` VALUES ('242', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587971334');
INSERT INTO `fa_admin_log` VALUES ('243', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587973084');
INSERT INTO `fa_admin_log` VALUES ('244', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587973163');
INSERT INTO `fa_admin_log` VALUES ('245', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587974435');
INSERT INTO `fa_admin_log` VALUES ('246', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587974437');
INSERT INTO `fa_admin_log` VALUES ('247', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587974528');
INSERT INTO `fa_admin_log` VALUES ('248', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587974558');
INSERT INTO `fa_admin_log` VALUES ('249', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587974766');
INSERT INTO `fa_admin_log` VALUES ('250', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587974767');
INSERT INTO `fa_admin_log` VALUES ('251', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587974769');
INSERT INTO `fa_admin_log` VALUES ('252', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587974770');
INSERT INTO `fa_admin_log` VALUES ('253', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587974771');
INSERT INTO `fa_admin_log` VALUES ('254', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587974772');
INSERT INTO `fa_admin_log` VALUES ('255', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587974975');
INSERT INTO `fa_admin_log` VALUES ('256', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587974976');
INSERT INTO `fa_admin_log` VALUES ('257', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587975001');
INSERT INTO `fa_admin_log` VALUES ('258', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass?id=ids', '客户管理 实名认证', '{\"id\":\"ids\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587976057');
INSERT INTO `fa_admin_log` VALUES ('259', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587976070');
INSERT INTO `fa_admin_log` VALUES ('260', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587976271');
INSERT INTO `fa_admin_log` VALUES ('261', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/refuse/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587976427');
INSERT INTO `fa_admin_log` VALUES ('262', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587976429');
INSERT INTO `fa_admin_log` VALUES ('263', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/refuse/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587976434');
INSERT INTO `fa_admin_log` VALUES ('264', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/refuse/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587976555');
INSERT INTO `fa_admin_log` VALUES ('265', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587976556');
INSERT INTO `fa_admin_log` VALUES ('266', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587976557');
INSERT INTO `fa_admin_log` VALUES ('267', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/refuse/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587976715');
INSERT INTO `fa_admin_log` VALUES ('268', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587976717');
INSERT INTO `fa_admin_log` VALUES ('269', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587977050');
INSERT INTO `fa_admin_log` VALUES ('270', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/refuse/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587977092');
INSERT INTO `fa_admin_log` VALUES ('271', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587977294');
INSERT INTO `fa_admin_log` VALUES ('272', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/refuse/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587977321');
INSERT INTO `fa_admin_log` VALUES ('273', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587977539');
INSERT INTO `fa_admin_log` VALUES ('274', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/refuse/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587977543');
INSERT INTO `fa_admin_log` VALUES ('275', '1', 'lindenvan', '/rWPFXdqobO.php/finance/withdrawals/handling/ids/1', '财务管理 提现管理', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587982452');
INSERT INTO `fa_admin_log` VALUES ('276', '1', 'lindenvan', '/rWPFXdqobO.php/finance/withdrawals/handling/ids/1', '财务管理 提现管理', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1587982966');
INSERT INTO `fa_admin_log` VALUES ('277', '1', 'lindenvan', '/rWPFXdqobO.php/finance/withdrawals/handling/ids/1', '财务管理 提现管理', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588041167');
INSERT INTO `fa_admin_log` VALUES ('278', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/multi/ids/1', '客户管理 实名认证 批量更新', '{\"ids\":\"1\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588042437');
INSERT INTO `fa_admin_log` VALUES ('279', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588042445');
INSERT INTO `fa_admin_log` VALUES ('280', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/multi/ids/1', '客户管理 实名认证 批量更新', '{\"ids\":\"1\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588042451');
INSERT INTO `fa_admin_log` VALUES ('281', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/multi/ids/1', '客户管理 实名认证 批量更新', '{\"ids\":\"1\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588042458');
INSERT INTO `fa_admin_log` VALUES ('282', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588042463');
INSERT INTO `fa_admin_log` VALUES ('283', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/handling/ids/1', '鉴定管理 在线鉴定', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588043144');
INSERT INTO `fa_admin_log` VALUES ('284', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/handling/ids/1', '鉴定管理 在线鉴定', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588043523');
INSERT INTO `fa_admin_log` VALUES ('285', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/handling/ids/1', '鉴定管理 在线鉴定', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588043620');
INSERT INTO `fa_admin_log` VALUES ('286', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/handling/ids/1', '鉴定管理 在线鉴定', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588043657');
INSERT INTO `fa_admin_log` VALUES ('287', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/handling/ids/1', '鉴定管理 在线鉴定', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588043722');
INSERT INTO `fa_admin_log` VALUES ('288', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588132140');
INSERT INTO `fa_admin_log` VALUES ('289', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588132141');
INSERT INTO `fa_admin_log` VALUES ('290', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588132143');
INSERT INTO `fa_admin_log` VALUES ('291', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588132177');
INSERT INTO `fa_admin_log` VALUES ('292', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588132177');
INSERT INTO `fa_admin_log` VALUES ('293', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588132178');
INSERT INTO `fa_admin_log` VALUES ('294', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588132179');
INSERT INTO `fa_admin_log` VALUES ('295', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588132179');
INSERT INTO `fa_admin_log` VALUES ('296', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/4?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"0d640212df77bdfbb29e25d2215fd848\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"addon\",\"title\":\"\\u63d2\\u4ef6\\u7ba1\\u7406\",\"icon\":\"fa fa-rocket\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"Addon tips\",\"status\":\"normal\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588140665');
INSERT INTO `fa_admin_log` VALUES ('297', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588140665');
INSERT INTO `fa_admin_log` VALUES ('298', '1', 'lindenvan', '/rWPFXdqobO.php/addon/install', '插件管理', '{\"name\":\"nkeditor\",\"force\":\"0\",\"uid\":\"21588\",\"token\":\"bec38bee-d27f-437d-bcea-9c6c2941da09\",\"version\":\"1.0.8\",\"faversion\":\"1.0.0.20200228_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588140687');
INSERT INTO `fa_admin_log` VALUES ('299', '1', 'lindenvan', '/rWPFXdqobO.php/addon/state', '插件管理 禁用启用', '{\"name\":\"markdown\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588140815');
INSERT INTO `fa_admin_log` VALUES ('300', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588140816');
INSERT INTO `fa_admin_log` VALUES ('301', '1', 'lindenvan', '/rWPFXdqobO.php/addon/install', '插件管理', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"21588\",\"token\":\"bec38bee-d27f-437d-bcea-9c6c2941da09\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20200228_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588140826');
INSERT INTO `fa_admin_log` VALUES ('302', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588140826');
INSERT INTO `fa_admin_log` VALUES ('303', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588145042');
INSERT INTO `fa_admin_log` VALUES ('304', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588145045');
INSERT INTO `fa_admin_log` VALUES ('305', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588145120');
INSERT INTO `fa_admin_log` VALUES ('306', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588145359');
INSERT INTO `fa_admin_log` VALUES ('307', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588145360');
INSERT INTO `fa_admin_log` VALUES ('308', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588145361');
INSERT INTO `fa_admin_log` VALUES ('309', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588145420');
INSERT INTO `fa_admin_log` VALUES ('310', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588145743');
INSERT INTO `fa_admin_log` VALUES ('311', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588145784');
INSERT INTO `fa_admin_log` VALUES ('312', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588146212');
INSERT INTO `fa_admin_log` VALUES ('313', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"test\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588146414');
INSERT INTO `fa_admin_log` VALUES ('314', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"text\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588146468');
INSERT INTO `fa_admin_log` VALUES ('315', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"test\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588146484');
INSERT INTO `fa_admin_log` VALUES ('316', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"123\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588146499');
INSERT INTO `fa_admin_log` VALUES ('317', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"test\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588146543');
INSERT INTO `fa_admin_log` VALUES ('318', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u662f\\u7684\\u6492\\u591a\\u6492\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588146654');
INSERT INTO `fa_admin_log` VALUES ('319', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"123\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588146728');
INSERT INTO `fa_admin_log` VALUES ('320', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u6b63\\u54c1\\u5982\\u5047\\u5305\\u6362\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588147204');
INSERT INTO `fa_admin_log` VALUES ('321', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u53d1\\u90fd\\u662f\\u53d1\\u80dc\\u591a\\u8d1f\\u5c11\\u7684\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588147218');
INSERT INTO `fa_admin_log` VALUES ('322', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u6b63\\u54c1\\uff0c\\u5982\\u5047\\u5305\\u6362\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588147352');
INSERT INTO `fa_admin_log` VALUES ('323', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/1?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"123456\\u554a\",\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588147669');
INSERT INTO `fa_admin_log` VALUES ('324', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/1?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u5927\\u8428\\u8fbe\\u6240\",\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588147722');
INSERT INTO `fa_admin_log` VALUES ('325', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/1?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u53d1\\u591a\\u5c11\",\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588147775');
INSERT INTO `fa_admin_log` VALUES ('326', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u5982\\u5047\\u5305\\u6362\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588147841');
INSERT INTO `fa_admin_log` VALUES ('327', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u5982\\u5047\\u5305\\u6362\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588147868');
INSERT INTO `fa_admin_log` VALUES ('328', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u9632\\u5b88\\u6253\\u6cd5\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588147876');
INSERT INTO `fa_admin_log` VALUES ('329', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u6c34\\u7535\\u8d39\\u6c34\\u7535\\u8d39\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588148015');
INSERT INTO `fa_admin_log` VALUES ('330', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u6c34\\u7535\\u8d39\\u6c34\\u7535\\u8d39\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588148093');
INSERT INTO `fa_admin_log` VALUES ('331', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u5982\\u5047\\u5305\\u6362\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588148201');
INSERT INTO `fa_admin_log` VALUES ('332', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/1?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u5982\\u5047\\u5305\\u6362\",\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588148375');
INSERT INTO `fa_admin_log` VALUES ('333', '1', 'lindenvan', '/rWPFXdqobO.php/finance/withdrawals/handling/ids/1', '财务管理 提现管理', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588149042');
INSERT INTO `fa_admin_log` VALUES ('334', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/refuse/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588151902');
INSERT INTO `fa_admin_log` VALUES ('335', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588151906');
INSERT INTO `fa_admin_log` VALUES ('336', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/2?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"00001 00010 00100 01000 10000\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588153235');
INSERT INTO `fa_admin_log` VALUES ('337', '1', 'lindenvan', '/rWPFXdqobO.php/finance/withdrawals/handling/ids/1', '财务管理 提现管理', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588155214');
INSERT INTO `fa_admin_log` VALUES ('338', '1', 'lindenvan', '/rWPFXdqobO.php/finance/withdrawals/handling/ids/1', '财务管理 提现管理', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588155509');
INSERT INTO `fa_admin_log` VALUES ('339', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/181?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"493527f8f6a697df72a883ebd3744b52\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"system\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"181\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588211944');
INSERT INTO `fa_admin_log` VALUES ('340', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588211944');
INSERT INTO `fa_admin_log` VALUES ('341', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/182?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"915af13e60ee577e6a0317d5f1fc4ea5\",\"row\":{\"ismenu\":\"1\",\"pid\":\"181\",\"name\":\"system\\/banner\",\"title\":\"Banner\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"182\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588211953');
INSERT INTO `fa_admin_log` VALUES ('342', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588211953');
INSERT INTO `fa_admin_log` VALUES ('343', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/181?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"b1a1c5813ffb690f8d5bfdefee9a2f4f\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"system\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"93\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"181\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588211980');
INSERT INTO `fa_admin_log` VALUES ('344', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588211980');
INSERT INTO `fa_admin_log` VALUES ('345', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/181?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"8dc996123d3c69fe507f2a47f1a26b17\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"system\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa fa-gears\",\"weigh\":\"93\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"181\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588212012');
INSERT INTO `fa_admin_log` VALUES ('346', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588212012');
INSERT INTO `fa_admin_log` VALUES ('347', '1', 'lindenvan', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"\\u6355\\u83b7.JPG\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588213368');
INSERT INTO `fa_admin_log` VALUES ('348', '1', 'lindenvan', '/rWPFXdqobO.php/system/banner/add?dialog=1', '系统管理 Banner 添加', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200430\\/50de2b33343e218bcd8d3a1a939c7966.jpg\",\"url\":\"https:\\/\\/github.com\\/\",\"is_index\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588213407');
INSERT INTO `fa_admin_log` VALUES ('349', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证 Pass', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588215248');
INSERT INTO `fa_admin_log` VALUES ('350', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/refuse/ids/1', '客户管理 实名认证 Refuse', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588215290');
INSERT INTO `fa_admin_log` VALUES ('351', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证 Pass', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588215293');
INSERT INTO `fa_admin_log` VALUES ('352', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证 Pass', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588215357');
INSERT INTO `fa_admin_log` VALUES ('353', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/refuse/ids/1', '客户管理 实名认证 Refuse', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588215584');
INSERT INTO `fa_admin_log` VALUES ('354', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/pass/ids/1', '客户管理 实名认证 Pass', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588215587');
INSERT INTO `fa_admin_log` VALUES ('355', '1', 'lindenvan', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"log.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588215926');
INSERT INTO `fa_admin_log` VALUES ('356', '1', 'lindenvan', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"log.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588215929');
INSERT INTO `fa_admin_log` VALUES ('357', '1', 'lindenvan', '/rWPFXdqobO.php/system/banner/multi/ids/2', '系统管理 Banner 批量更新', '{\"action\":\"\",\"ids\":\"2\",\"params\":\"is_index=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588216988');
INSERT INTO `fa_admin_log` VALUES ('358', '1', 'lindenvan', '/rWPFXdqobO.php/system/banner/multi/ids/2', '系统管理 Banner 批量更新', '{\"action\":\"\",\"ids\":\"2\",\"params\":\"is_index=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588216990');
INSERT INTO `fa_admin_log` VALUES ('359', '1', 'lindenvan', '/rWPFXdqobO.php/system/banner/multi/ids/2', '系统管理 Banner 批量更新', '{\"action\":\"\",\"ids\":\"2\",\"params\":\"is_index=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588216992');
INSERT INTO `fa_admin_log` VALUES ('360', '1', 'lindenvan', '/rWPFXdqobO.php/system/banner/multi/ids/2', '系统管理 Banner 批量更新', '{\"action\":\"\",\"ids\":\"2\",\"params\":\"is_index=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588217011');
INSERT INTO `fa_admin_log` VALUES ('361', '1', 'lindenvan', '/rWPFXdqobO.php/system/banner/multi/ids/1', '系统管理 Banner 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"is_index=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588217012');
INSERT INTO `fa_admin_log` VALUES ('362', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/5?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"ac686ad040367a076285948a82c031e7\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"auth\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa fa-group\",\"weigh\":\"3\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218652');
INSERT INTO `fa_admin_log` VALUES ('363', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218652');
INSERT INTO `fa_admin_log` VALUES ('364', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/roletree', '权限管理 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218688');
INSERT INTO `fa_admin_log` VALUES ('365', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/del/ids/2', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218749');
INSERT INTO `fa_admin_log` VALUES ('366', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/del/ids/3', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218754');
INSERT INTO `fa_admin_log` VALUES ('367', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/del/ids/5', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218757');
INSERT INTO `fa_admin_log` VALUES ('368', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/del/ids/4', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218761');
INSERT INTO `fa_admin_log` VALUES ('369', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/roletree', '权限管理 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218763');
INSERT INTO `fa_admin_log` VALUES ('370', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/roletree', '权限管理 角色组', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218771');
INSERT INTO `fa_admin_log` VALUES ('371', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/add?dialog=1', '权限管理 角色组 添加', '{\"dialog\":\"1\",\"__token__\":\"7a67b761e9539fd47ed0a7b0e93f11a0\",\"row\":{\"rules\":\"1,13,14,16,15,17,95,138,139,140,141,142,143,97,98,99,100,101,102,175,176,177,178,179,180,194,195,108,118,144,145,146,147,148,119,109,120,121,122,123,124,125,169,170,171,172,173,174,110,132,133,134,135,136,137,149,150,151,152,153,154,155,2,6,18,19,20,21,22,7,23,24,25,26,27,28,8,29,30,31,32,33,34,156,157,158,159,160,161,162,163,164,165,166,167,168,181,188,189,190,191,192,193,3,35,36,37,38,39,5,9,40,41,42,43,10,44,45,46,11,47,48,49,50,12,51,52,53,54,4,55,56,57,58,59,60,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84\",\"pid\":\"1\",\"name\":\"\\u4e1a\\u52a1\\u5458\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218788');
INSERT INTO `fa_admin_log` VALUES ('372', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/del/ids/2', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218793');
INSERT INTO `fa_admin_log` VALUES ('373', '1', 'lindenvan', '/rWPFXdqobO.php/auth/admin/add?dialog=1', '权限管理 管理员管理 添加', '{\"dialog\":\"1\",\"__token__\":\"0d7db7f341afd90a17aeebe8072afaea\",\"group\":[\"6\"],\"row\":{\"username\":\"fast\",\"email\":\"admin@admin.com\",\"nickname\":\"fast\",\"password\":\"a123000\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218936');
INSERT INTO `fa_admin_log` VALUES ('374', '1', 'lindenvan', '/rWPFXdqobO.php/auth/admin/add?dialog=1', '权限管理 管理员管理 添加', '{\"dialog\":\"1\",\"__token__\":\"f1577f9d059223c1938ce0e03e8c9769\",\"group\":[\"6\"],\"row\":{\"username\":\"fast\",\"email\":\"566@admin.com\",\"nickname\":\"fast\",\"password\":\"a123000\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588218942');
INSERT INTO `fa_admin_log` VALUES ('375', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/roletree', '权限管理 角色组', '{\"id\":\"6\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588219066');
INSERT INTO `fa_admin_log` VALUES ('376', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/edit/ids/6?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"__token__\":\"251574971bcd5553c06eaa20bcde65bc\",\"row\":{\"rules\":\"139,140,141,142,143,98,99,100,101,102,176,177,178,179,180,194,195,144,145,146,147,148,119,121,122,123,124,125,170,171,172,173,174,133,134,135,136,137,151,152,153,154,155,189,190,191,192,193,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,55,56,57,58,59,60,63,64,65,68,69,70,71,72,74,75,76,77,78,80,81,82,83,84,138,97,175,95,118,108,120,169,109,132,110,150,149,188,181,3,9,10,11,5,4,67,73,79,66,12\",\"pid\":\"1\",\"name\":\"\\u4e1a\\u52a1\\u5458\",\"status\":\"normal\"},\"ids\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588219108');
INSERT INTO `fa_admin_log` VALUES ('377', '2', 'fast', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"6411d784d99ac4e18debbecca1032e84\",\"username\":\"fast\",\"captcha\":\"FNfn\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588219137');
INSERT INTO `fa_admin_log` VALUES ('378', '1', 'lindenvan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"532cf90bb4608d187ecc835de7e13cd9\",\"username\":\"lindenvan\",\"captcha\":\"2XVA\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588219173');
INSERT INTO `fa_admin_log` VALUES ('379', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/roletree', '权限管理 角色组', '{\"id\":\"6\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588219183');
INSERT INTO `fa_admin_log` VALUES ('380', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/edit/ids/6?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"__token__\":\"c224f88a37ebdf48c751e29f1dd7521a\",\"row\":{\"rules\":\"3,35,36,37,38,39,95,97,98,99,100,101,102,108,109,110,118,119,120,121,122,123,124,125,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,169,170,171,172,173,174,175,176,177,178,179,180,189,190,194,195,188,181\",\"pid\":\"1\",\"name\":\"\\u4e1a\\u52a1\\u5458\",\"status\":\"normal\"},\"ids\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588219275');
INSERT INTO `fa_admin_log` VALUES ('381', '0', 'Unknown', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"ca4216656e5d4fa16ccee1bfc0e3cf00\",\"username\":\"fast\",\"captcha\":\"JNFQ\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588219295');
INSERT INTO `fa_admin_log` VALUES ('382', '2', 'fast', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"9001cfb254a504691be6d14e06d8db4e\",\"username\":\"fast\",\"captcha\":\"66C8\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588219305');
INSERT INTO `fa_admin_log` VALUES ('383', '2', 'fast', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"1e079035bce4574e431d1c53a57c1709\",\"username\":\"fast\",\"captcha\":\"JMV4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588225428');
INSERT INTO `fa_admin_log` VALUES ('384', '2', 'fast', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"c0207931435304df7b2cfb1ffdf8e298\",\"username\":\"fast\",\"captcha\":\"UWCQ\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588225447');
INSERT INTO `fa_admin_log` VALUES ('385', '1', 'lindenvan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"f1a4ef5caf5572d83ff7556d0595d7dc\",\"username\":\"lindenvan\",\"captcha\":\"QNQH\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1588225470');
INSERT INTO `fa_admin_log` VALUES ('386', '1', 'lindenvan', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '登录', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"603262c7b172c0dcf1b1d02da2470c4a\",\"username\":\"lindenvan\",\"captcha\":\"V8Ly\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588226300');
INSERT INTO `fa_admin_log` VALUES ('387', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/181?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"01a3660bbce73756b63dd97597d15e46\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"system\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa fa-gears\",\"weigh\":\"92\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"181\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588227420');
INSERT INTO `fa_admin_log` VALUES ('388', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588227421');
INSERT INTO `fa_admin_log` VALUES ('389', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/5?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"1ad73dd2147dd1404161ffcc49b23503\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"auth\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa fa-group\",\"weigh\":\"93\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588227429');
INSERT INTO `fa_admin_log` VALUES ('390', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588227430');
INSERT INTO `fa_admin_log` VALUES ('391', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/5?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"aead33b0972cc03ae87eaf8051f2afaa\",\"row\":{\"ismenu\":\"1\",\"pid\":\"181\",\"name\":\"auth\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa fa-group\",\"weigh\":\"93\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588227450');
INSERT INTO `fa_admin_log` VALUES ('392', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588227450');
INSERT INTO `fa_admin_log` VALUES ('393', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/10?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"c1d57d676977221beae0be58b0c65950\",\"row\":{\"ismenu\":\"1\",\"pid\":\"181\",\"name\":\"auth\\/adminlog\",\"title\":\"\\u7ba1\\u7406\\u5458\\u65e5\\u5fd7\",\"icon\":\"fa fa-list-alt\",\"weigh\":\"113\",\"condition\":\"\",\"remark\":\"Admin log tips\",\"status\":\"normal\"},\"ids\":\"10\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588227516');
INSERT INTO `fa_admin_log` VALUES ('394', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588227516');
INSERT INTO `fa_admin_log` VALUES ('395', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/5?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"ec798ea3b3cdb61209f5885f01986fd0\",\"row\":{\"ismenu\":\"1\",\"pid\":\"181\",\"name\":\"auth\",\"title\":\"\\u89d2\\u8272\\u4e0e\\u6743\\u9650\",\"icon\":\"fa fa-group\",\"weigh\":\"93\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588227529');
INSERT INTO `fa_admin_log` VALUES ('396', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588227530');
INSERT INTO `fa_admin_log` VALUES ('397', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/188?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"d1fd6e69929301b914de8bffc769eb9c\",\"row\":{\"ismenu\":\"1\",\"pid\":\"181\",\"name\":\"system\\/banner\",\"title\":\"Banner\",\"icon\":\"fa fa-photo\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"188\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588227588');
INSERT INTO `fa_admin_log` VALUES ('398', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588227588');
INSERT INTO `fa_admin_log` VALUES ('399', '1', 'lindenvan', '/rWPFXdqobO.php/identify/ident/hand/ids/3?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u5927\\u5927\\u6240\\u591a\\u591a\\u6240\\u5927\\u6240\\u591a\",\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588228539');
INSERT INTO `fa_admin_log` VALUES ('400', '1', 'lindenvan', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"5.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588231742');
INSERT INTO `fa_admin_log` VALUES ('401', '1', 'lindenvan', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"52.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588231752');
INSERT INTO `fa_admin_log` VALUES ('402', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/add?dialog=1', '客户管理 实名认证 添加', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u5f20\\u67d0\",\"id_key\":\"15166118960325211X\",\"tel\":\"15599661793\",\"user_key\":\"lopll10\",\"id_images\":\"\\/uploads\\/20200430\\/07524b120ff7288fd7f0b4c5160da7e8.jpg,\\/uploads\\/20200430\\/049abffc2beb4ce171f639605907045f.jpg\",\"create_time\":\"2020-04-30 15:28:51\",\"status\":\"0\",\"comment\":\"\\u5927\\u8428\\u8fbe\\u6240\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588231802');
INSERT INTO `fa_admin_log` VALUES ('403', '1', 'lindenvan', '/rWPFXdqobO.php/client/real_name/refuse/ids/2', '客户管理 实名认证 Refuse', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588231837');
INSERT INTO `fa_admin_log` VALUES ('404', '1', 'lindenvan', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"id\":\"6\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588233688');
INSERT INTO `fa_admin_log` VALUES ('405', '1', 'lindenvan', '/rWPFXdqobO.php/system/banner/multi/ids/2', '系统管理 Banner 批量更新', '{\"action\":\"\",\"ids\":\"2\",\"params\":\"is_index=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588235653');
INSERT INTO `fa_admin_log` VALUES ('406', '1', 'lindenvan', '/rWPFXdqobO.php/system/banner/multi/ids/2', '系统管理 Banner 批量更新', '{\"action\":\"\",\"ids\":\"2\",\"params\":\"is_index=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588235654');
INSERT INTO `fa_admin_log` VALUES ('407', '1', 'lindenvan', '/rWPFXdqobO.php/auth/rule/edit/ids/163?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"74e67eb0c392a27664e6944c9f5323c2\",\"row\":{\"ismenu\":\"1\",\"pid\":\"156\",\"name\":\"msg\\/feedback\",\"title\":\"\\u53cd\\u9988\\u7ba1\\u7406\",\"icon\":\"fa fa-comments\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"163\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588236771');
INSERT INTO `fa_admin_log` VALUES ('408', '1', 'lindenvan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588236771');
INSERT INTO `fa_admin_log` VALUES ('409', '1', 'lindenvan', '/rWPFXdqobO.php/msg/feedback/handling/ids/1', '消息管理 反馈管理', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588237894');
INSERT INTO `fa_admin_log` VALUES ('410', '1', 'admin', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"de5e4f6b1bf1085c84e62edfcdf34de7\",\"username\":\"admin\",\"captcha\":\"YDYG\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588241927');
INSERT INTO `fa_admin_log` VALUES ('411', '1', 'admin', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"f71063a4fc2122462e0ddd18049b8f97\",\"username\":\"admin\",\"captcha\":\"paYQ\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588242034');
INSERT INTO `fa_admin_log` VALUES ('412', '1', 'admin', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '登录', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"f332f9b65458e8edd40adb1d0bdc96fd\",\"username\":\"admin\",\"captcha\":\"cxev\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588728663');
INSERT INTO `fa_admin_log` VALUES ('413', '1', 'admin', '/rWPFXdqobO.php/auth/rule/edit/ids/196?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"d74d42a94cbeaa2556dd39d0f64f5950\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"datatest\",\"title\":\"\\u6d4b\\u8bd5\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"196\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588728800');
INSERT INTO `fa_admin_log` VALUES ('414', '1', 'admin', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588728800');
INSERT INTO `fa_admin_log` VALUES ('415', '1', 'admin', '/rWPFXdqobO.php/auth/rule/multi/ids/66', '角色与权限 菜单规则', '{\"action\":\"\",\"ids\":\"66\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588729073');
INSERT INTO `fa_admin_log` VALUES ('416', '1', 'admin', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588729073');
INSERT INTO `fa_admin_log` VALUES ('417', '1', 'admin', '/rWPFXdqobO.php/auth/rule/multi/ids/66', '角色与权限 菜单规则', '{\"action\":\"\",\"ids\":\"66\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588729081');
INSERT INTO `fa_admin_log` VALUES ('418', '1', 'admin', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588729081');
INSERT INTO `fa_admin_log` VALUES ('419', '1', 'admin', '/rWPFXdqobO.php/auth/rule/edit/ids/2?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"d49c26f3c20b56046aa0158f640384e2\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"general\",\"title\":\"\\u5e38\\u89c4\\u7ba1\\u7406\",\"icon\":\"fa fa-cogs\",\"weigh\":\"94\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588729092');
INSERT INTO `fa_admin_log` VALUES ('420', '1', 'admin', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588729093');
INSERT INTO `fa_admin_log` VALUES ('421', '1', 'admin', '/rWPFXdqobO.php/auth/rule/edit/ids/66?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"fcda320e42be0e6257bf86d2374da24e\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"user\",\"title\":\"\\u4f1a\\u5458\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"66\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588729113');
INSERT INTO `fa_admin_log` VALUES ('422', '1', 'admin', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588729114');
INSERT INTO `fa_admin_log` VALUES ('423', '1', 'admin', '/rWPFXdqobO.php/ajax/weigh', '', '{\"ids\":\"1,95,138,97,175,108,118,119,109,120,169,110,132,149,150,2,6,7,8,156,157,163,181,5,9,11,10,188,3,12,4,66,67,73,79,196\",\"changeid\":\"10\",\"pid\":\"181\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588729248');
INSERT INTO `fa_admin_log` VALUES ('424', '1', 'admin', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588729248');
INSERT INTO `fa_admin_log` VALUES ('425', '1', 'admin', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"qrcode_for_gh_967be99f3af3_258.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588734189');
INSERT INTO `fa_admin_log` VALUES ('426', '1', 'admin', '/rWPFXdqobO.php/general/attachment/del/ids/6', '常规管理 附件管理 删除', '{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588734253');
INSERT INTO `fa_admin_log` VALUES ('427', '1', 'admin', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588734615');
INSERT INTO `fa_admin_log` VALUES ('428', '1', 'admin', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588734631');
INSERT INTO `fa_admin_log` VALUES ('429', '1', 'admin', '/rWPFXdqobO.php/auth/group/add?dialog=1', '角色与权限 角色组 添加', '{\"dialog\":\"1\",\"__token__\":\"62ab6b3f487def94e800ae5198071a41\",\"row\":{\"rules\":\"1,3,5,9,10,11,13,14,15,16,17,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,95,97,98,99,100,101,102,108,109,110,118,119,120,121,122,123,124,125,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,188,189,190,191,192,193,194,195\",\"pid\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588734679');
INSERT INTO `fa_admin_log` VALUES ('430', '1', 'admin', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"id\":\"7\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588734684');
INSERT INTO `fa_admin_log` VALUES ('431', '1', 'admin', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"id\":\"6\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588734704');
INSERT INTO `fa_admin_log` VALUES ('432', '1', 'admin', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"id\":\"7\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588744959');
INSERT INTO `fa_admin_log` VALUES ('433', '1', 'admin', '/rWPFXdqobO.php/auth/admin/add?dialog=1', '角色与权限 管理员管理 添加', '{\"dialog\":\"1\",\"__token__\":\"9edba2d2d780b450de9e05cabe7d9641\",\"group\":[\"7\"],\"row\":{\"username\":\"admin1\",\"email\":\"123666@qq.com\",\"nickname\":\"\\u8d85\\u7ba1\",\"password\":\"123456\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745058');
INSERT INTO `fa_admin_log` VALUES ('434', '3', 'admin1', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"744cfb4f9513e588514dfd2c8f81a559\",\"username\":\"admin1\",\"captcha\":\"QDIJ\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745082');
INSERT INTO `fa_admin_log` VALUES ('435', '3', 'admin1', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"pid\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745099');
INSERT INTO `fa_admin_log` VALUES ('436', '1', 'admin', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"60cb499af0fad9b056e4cff89148dfc0\",\"username\":\"admin\",\"captcha\":\"6JMV\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745161');
INSERT INTO `fa_admin_log` VALUES ('437', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"794e962042763e499e435bd068d4bc94\",\"username\":\"Lindenvan\",\"captcha\":\"F6J6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745381');
INSERT INTO `fa_admin_log` VALUES ('438', '0', 'Unknown', '/rWPFXdqobO.php/index/login', '', '{\"__token__\":\"406b6bdfd425d68cbdc9b8e47516cda1\",\"username\":\"Lindenvan\",\"captcha\":\"U1aQ\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745437');
INSERT INTO `fa_admin_log` VALUES ('439', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"b917c5f299bb11e24974a916313dc7d9\",\"username\":\"Lindenvan\",\"captcha\":\"VQ65\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745447');
INSERT INTO `fa_admin_log` VALUES ('440', '3', 'admin1', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"7815371e9ead4a2ad3d6332d8b647530\",\"username\":\"admin1\",\"captcha\":\"pNCP\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745646');
INSERT INTO `fa_admin_log` VALUES ('441', '3', 'admin1', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"pid\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745657');
INSERT INTO `fa_admin_log` VALUES ('442', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"b0c9b2395bb19d667fc20702ba867a20\",\"username\":\"Lindenvan\",\"captcha\":\"WMJU\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745734');
INSERT INTO `fa_admin_log` VALUES ('443', '1', 'LindenVan', '/rWPFXdqobO.php/auth/admin/del/ids/2', '角色与权限 管理员管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745759');
INSERT INTO `fa_admin_log` VALUES ('444', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/del/ids/6', '角色与权限 角色组 删除', '{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745767');
INSERT INTO `fa_admin_log` VALUES ('445', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"id\":\"7\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745776');
INSERT INTO `fa_admin_log` VALUES ('446', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/multi/ids/1', '角色与权限 菜单规则', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745828');
INSERT INTO `fa_admin_log` VALUES ('447', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745828');
INSERT INTO `fa_admin_log` VALUES ('448', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"id\":\"7\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745889');
INSERT INTO `fa_admin_log` VALUES ('449', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/edit/ids/7?dialog=1', '角色与权限 角色组 编辑', '{\"dialog\":\"1\",\"__token__\":\"39cdc458f248ce1e3b2c8b118850fe45\",\"row\":{\"rules\":\"139,140,141,142,143,98,99,100,101,102,176,177,178,179,180,194,195,144,145,146,147,148,119,121,122,123,124,125,170,171,172,173,174,133,134,135,136,137,151,152,153,154,155,158,159,160,161,162,164,165,166,167,168,40,41,42,43,47,48,49,50,44,45,46,189,190,191,192,193,35,36,37,38,39,68,69,70,71,72,74,75,76,77,78,80,81,82,83,84,138,97,175,95,118,108,120,169,109,132,110,150,149,157,163,156,9,11,5,10,188,181,3,67,73,79,66\",\"pid\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"status\":\"normal\"},\"ids\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745896');
INSERT INTO `fa_admin_log` VALUES ('450', '3', 'admin1', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"a8c758bb9398aabe8c7bc9f7cdb62509\",\"username\":\"admin1\",\"captcha\":\"EGWB\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588745915');
INSERT INTO `fa_admin_log` VALUES ('451', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"08e04ebaefbad27fb0b5138f4022ae18\",\"username\":\"Lindenvan\",\"captcha\":\"L8aC\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588746107');
INSERT INTO `fa_admin_log` VALUES ('452', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"id\":\"7\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588746128');
INSERT INTO `fa_admin_log` VALUES ('453', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"id\":\"7\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588746177');
INSERT INTO `fa_admin_log` VALUES ('454', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/del/ids/119', '角色与权限 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"119\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588746411');
INSERT INTO `fa_admin_log` VALUES ('455', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588746411');
INSERT INTO `fa_admin_log` VALUES ('456', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"id\":\"7\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588747443');
INSERT INTO `fa_admin_log` VALUES ('457', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/202?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"aea03e1a165802b83fdac7fc41e3e570\",\"row\":{\"ismenu\":\"1\",\"pid\":\"108\",\"name\":\"goods\\/classes\",\"title\":\"\\u5546\\u54c1\\u5206\\u7c7b\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"202\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588747528');
INSERT INTO `fa_admin_log` VALUES ('458', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588747528');
INSERT INTO `fa_admin_log` VALUES ('459', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/208?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"31e17b580f2f0fa489a692df4b66e1d4\",\"row\":{\"ismenu\":\"1\",\"pid\":\"108\",\"name\":\"goods\\/good\",\"title\":\"\\u5546\\u54c1\\u5217\\u8868\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"208\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588747543');
INSERT INTO `fa_admin_log` VALUES ('460', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588747543');
INSERT INTO `fa_admin_log` VALUES ('461', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/202?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"dce762621727c816926242d413a79ead\",\"row\":{\"ismenu\":\"1\",\"pid\":\"108\",\"name\":\"goods\\/classes\",\"title\":\"\\u5206\\u7c7b\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"202\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588747572');
INSERT INTO `fa_admin_log` VALUES ('462', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588747572');
INSERT INTO `fa_admin_log` VALUES ('463', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"id\":\"7\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588747918');
INSERT INTO `fa_admin_log` VALUES ('464', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/edit/ids/7?dialog=1', '角色与权限 角色组 编辑', '{\"dialog\":\"1\",\"__token__\":\"b828515da24227284401319885fcae8c\",\"row\":{\"rules\":\"3,5,9,10,11,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,95,97,98,99,100,101,102,108,109,110,120,121,122,123,124,125,132,133,134,135,136,137,138,139,140,141,142,143,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,188,189,190,191,192,193,194,195,202,203,204,205,206,207,208,209,210,211,212,213\",\"pid\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"status\":\"normal\"},\"ids\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588747982');
INSERT INTO `fa_admin_log` VALUES ('465', '1', 'LindenVan', '/rWPFXdqobO.php/client/users/multi/ids/1', '客户管理 客户列表 批量更新', '{\"ids\":\"1\",\"params\":\"password=dc483e80a7a0bd9ef71d8cf973673924\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588755752');
INSERT INTO `fa_admin_log` VALUES ('466', '1', 'LindenVan', '/rWPFXdqobO.php/general.profile/update', '常规管理 个人资料 更新个人信息', '{\"__token__\":\"5fb1d14b4502f0cee157eacbecce972b\",\"row\":{\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"email\":\"admin@admin.com\",\"nickname\":\"\\u5f00\\u53d1\\u8005\",\"password\":\"a10000\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588755838');
INSERT INTO `fa_admin_log` VALUES ('467', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"fb9bedfe88da5bae023900c07324ccc3\",\"username\":\"Lindenvan\",\"captcha\":\"BNYA\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588755860');
INSERT INTO `fa_admin_log` VALUES ('468', '3', 'admin1', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"290720d3e4e54d18eb673878c8580740\",\"username\":\"admin1\",\"captcha\":\"MAXE\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588755879');
INSERT INTO `fa_admin_log` VALUES ('469', '3', 'admin1', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"pid\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588814744');
INSERT INTO `fa_admin_log` VALUES ('470', '3', 'admin1', '/rWPFXdqobO.php/goods/good/multi/ids/2', '商品管理 商品列表 批量更新', '{\"ids\":\"2\",\"params\":\"status=2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588819884');
INSERT INTO `fa_admin_log` VALUES ('471', '3', 'admin1', '/rWPFXdqobO.php/goods/good/multi/ids/1', '商品管理 商品列表 批量更新', '{\"ids\":\"1\",\"params\":\"status=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588819889');
INSERT INTO `fa_admin_log` VALUES ('472', '0', 'Unknown', '/rWPFXdqobO.php/index/login', '', '{\"__token__\":\"cb0f2ce1ad5adffd88627fd26e124c0b\",\"username\":\"Lindenvan\",\"captcha\":\"C6NH\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588822169');
INSERT INTO `fa_admin_log` VALUES ('473', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"2b157d638140460db547b83ef754a7bf\",\"username\":\"Lindenvan\",\"captcha\":\"RCA5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588822176');
INSERT INTO `fa_admin_log` VALUES ('474', '1', 'LindenVan', '/rWPFXdqobO.php/goods/good/edit/ids/1?dialog=1', '商品管理 商品列表 编辑', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u6c49\\u4e94\\u94e2\",\"details\":\"\\u8fd9\\u5c31\\u662f\\u8be6\\u60c5\",\"class\":\"1\",\"price\":\"366\",\"goods_image\":\"http:\\/\\/www.f1f2.com\\/assets\\/img\\/qrcode.png\",\"num\":\"2\",\"tel\":\"40006299999\",\"user_key\":\"xiaoli01\",\"comment\":\"\\u6682\\u65e0\\u7b80\\u4ecb\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588837636');
INSERT INTO `fa_admin_log` VALUES ('475', '1', 'LindenVan', '/rWPFXdqobO.php/goods/good/edit/ids/3?dialog=1', '商品管理 商品列表 编辑', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u6c49\\u4e94\\u94e2\",\"details\":\"\\u6211\\u662f\\u8be6\\u60c5\",\"class\":\"1\",\"price\":\"366\",\"goods_image\":\"http:\\/\\/www.f1f2.com\\/assets\\/img\\/qrcode.png\",\"num\":\"2\",\"tel\":\"40006299999\",\"user_key\":\"xiaoli01\",\"comment\":\"\\u6682\\u65e0\\u7b80\\u4ecb\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588837648');
INSERT INTO `fa_admin_log` VALUES ('476', '1', 'LindenVan', '/rWPFXdqobO.php/goods/good/edit/ids/2?dialog=1', '商品管理 商品列表 编辑', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u6c49\\u4e94\\u94e2\",\"details\":\"\\u8fd9\\u91cc\\u5c31\\u662f\",\"class\":\"1\",\"price\":\"366\",\"goods_image\":\"http:\\/\\/www.f1f2.com\\/assets\\/img\\/qrcode.png\",\"num\":\"2\",\"tel\":\"40006299999\",\"user_key\":\"xiaoli01\",\"comment\":\"\\u6682\\u65e0\\u7b80\\u4ecb\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588837659');
INSERT INTO `fa_admin_log` VALUES ('477', '1', 'LindenVan', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"Free-Converter.com-age_of_reformation-54810608.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588837672');
INSERT INTO `fa_admin_log` VALUES ('478', '1', 'LindenVan', '/rWPFXdqobO.php/goods/good/add?dialog=1', '商品管理 商品列表 添加', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u5b57\\u753b\",\"details\":\"\\u8def\\u5fb7\\u5b97\\u6539\\u9769\",\"class\":\"4\",\"price\":\"233\",\"goods_image\":\"\\/uploads\\/20200507\\/799ba846cbc3ddc9f44bac59360c2bdc.jpg\",\"num\":\"1\",\"tel\":\"15599661793\",\"user_key\":\"lopll10\",\"comment\":\"\\u7edd\\u5bf9\\u771f\\u54c1\\uff0c\\u5047\\u4e00\\u8d54\\u5341\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588837737');
INSERT INTO `fa_admin_log` VALUES ('479', '1', 'LindenVan', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"upl_2.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588838013');
INSERT INTO `fa_admin_log` VALUES ('480', '1', 'LindenVan', '/rWPFXdqobO.php/goods/good/add?dialog=1', '商品管理 商品列表 添加', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u6d4b\\u8bd5\",\"details\":\"\\u8fd9\\u5c31\\u662f\\u8be6\\u60c5\",\"class\":\"2\",\"price\":\"23.81\",\"goods_image\":\"\\/uploads\\/20200507\\/4941dc039e41e28404833d0839794d3e.png\",\"num\":\"1\",\"tel\":\"15599661696\",\"user_key\":\"0\",\"create_time\":\"2020-05-07 15:53:06\",\"comment\":\"\\u6240\\u5f97\\u5206\\u6570\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588838037');
INSERT INTO `fa_admin_log` VALUES ('481', '1', 'LindenVan', '/rWPFXdqobO.php/goods/good/add?dialog=1', '商品管理 商品列表 添加', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u6d4b\\u8bd5\",\"details\":\"\\u6211\\u662f\\u8be6\\u60c5\",\"class\":\"3\",\"price\":\"9.98\",\"goods_image\":\"\\/uploads\\/20200430\\/049abffc2beb4ce171f639605907045f.jpg\",\"num\":\"6\",\"tel\":\"15599661793\",\"user_key\":\"lopll10\",\"create_time\":\"2020-05-07 15:54:36\",\"status\":\"0\",\"comment\":\"\\u53d1\\u987a\\u4e30\\u5230\\u4ed8\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588838126');
INSERT INTO `fa_admin_log` VALUES ('482', '1', 'LindenVan', '/rWPFXdqobO.php/goods/good/del/ids/5', '商品管理 商品列表 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588838133');
INSERT INTO `fa_admin_log` VALUES ('483', '1', 'LindenVan', '/rWPFXdqobO.php/goods/good/del/ids/4', '商品管理 商品列表 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588838134');
INSERT INTO `fa_admin_log` VALUES ('484', '1', 'LindenVan', '/rWPFXdqobO.php/client/users/edit/ids/11?dialog=1', '客户管理 客户列表 编辑', '{\"dialog\":\"1\",\"row\":{\"user_key\":\"lopll10\",\"tel\":\"15599661793\",\"level\":\"0\",\"money\":\"260\",\"pending\":\"20\",\"name\":\"\\u9648\\u4e94\",\"id_number\":\"15023319850623\",\"status\":\"2\",\"comment\":\"\\u6682\\u65e0\\u5907\\u6ce8\"},\"ids\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588839285');
INSERT INTO `fa_admin_log` VALUES ('485', '1', 'LindenVan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"1\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588839493');
INSERT INTO `fa_admin_log` VALUES ('486', '1', 'LindenVan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"0\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588839501');
INSERT INTO `fa_admin_log` VALUES ('487', '1', 'LindenVan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"1\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588839505');
INSERT INTO `fa_admin_log` VALUES ('488', '1', 'LindenVan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"0\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588839517');
INSERT INTO `fa_admin_log` VALUES ('489', '1', 'LindenVan', '/rWPFXdqobO.php/client/address/edit/ids/1?dialog=1', '客户管理 地址列表 编辑', '{\"dialog\":\"1\",\"row\":{\"address_key\":\"xiaoli10\",\"address_name\":\"\\u5f20\\u4e09\",\"user_tel\":\"18805013713\",\"address_comment\":\"\\u56db\\u5ddd\\u6210\\u90fd\\u5e02\\u9ad8\\u65b0\\u533a\\u8f6f\\u4ef6\\u56edA\\u533a1\\u680b505\",\"is_default\":\"1\",\"add_time\":\"2020-04-22 15:44:33\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588839523');
INSERT INTO `fa_admin_log` VALUES ('490', '1', 'LindenVan', '/rWPFXdqobO.php/goods/classes/add?dialog=1', '商品管理 分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"class_name\":\"\\u91d1\\u77f3\",\"have_num\":\"0\",\"cerate_time\":\"2020-05-07 17:55:37\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588845355');
INSERT INTO `fa_admin_log` VALUES ('491', '1', 'LindenVan', '/rWPFXdqobO.php/goods/classes/edit/ids/5?dialog=1', '商品管理 分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"class_name\":\"\\u74f7\\u5668\"},\"ids\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588845376');
INSERT INTO `fa_admin_log` VALUES ('492', '1', 'LindenVan', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"San_Francisco.zip\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588904227');
INSERT INTO `fa_admin_log` VALUES ('493', '1', 'LindenVan', '/rWPFXdqobO.php/system/banner/edit/ids/2?dialog=1', '系统管理 Banner 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200430\\/50de2b33343e218bcd8d3a1a939c7966.jpg\",\"url\":\"\\/uploads\\/696.txt\",\"is_index\":\"0\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588908383');
INSERT INTO `fa_admin_log` VALUES ('494', '1', 'LindenVan', '/rWPFXdqobO.php/system/banner/edit/ids/2?dialog=1', '系统管理 Banner 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200430\\/50de2b33343e218bcd8d3a1a939c7966.jpg\",\"url\":\"\\/uploads\\/20200508\\/a6c3c5f034f631351785dc60b2bad080.zip\",\"is_index\":\"0\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588908418');
INSERT INTO `fa_admin_log` VALUES ('495', '1', 'LindenVan', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"upl_1.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588908786');
INSERT INTO `fa_admin_log` VALUES ('496', '1', 'LindenVan', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"jianli8772.rar\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588908790');
INSERT INTO `fa_admin_log` VALUES ('497', '1', 'LindenVan', '/rWPFXdqobO.php/system/banner/edit/ids/2?dialog=1', '系统管理 Banner 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200430\\/50de2b33343e218bcd8d3a1a939c7966.jpg\",\"url\":\"https:\\/\\/github.com\\/\",\"is_index\":\"0\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588910247');
INSERT INTO `fa_admin_log` VALUES ('498', '1', 'LindenVan', '/rWPFXdqobO.php/general/attachment/del/ids/9', '常规管理 附件管理 删除', '{\"action\":\"del\",\"ids\":\"9\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588917554');
INSERT INTO `fa_admin_log` VALUES ('499', '1', 'LindenVan', '/rWPFXdqobO.php/identify/ident/add?dialog=1', '鉴定管理 在线鉴定 添加', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u5f20\\u67d0\",\"user_tel\":\"12236663666\",\"user_key\":\"5555\",\"describe\":\"\\u6c34\\u7535\\u8d39\\u6c34\\u7535\\u8d39\",\"filename\":\"\",\"attachment\":\"\\/uploads\\/20200508\\/e05c70a045af7264f0bc144bfbff1a18.rar\",\"create_time\":\"2020-05-08 14:25:04\",\"status\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588919194');
INSERT INTO `fa_admin_log` VALUES ('500', '1', 'LindenVan', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"55.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588921070');
INSERT INTO `fa_admin_log` VALUES ('501', '1', 'LindenVan', '/rWPFXdqobO.php/identify/ident/add?dialog=1', '鉴定管理 在线鉴定 添加', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u5f20\\u67d0\",\"user_tel\":\"12236663666\",\"user_key\":\"\\u7684\\u8bf4\\u6cd5\",\"describe\":\"\\u6d4b\\u8bd5\\u9644\\u4ef6\",\"attachment\":\"\\/uploads\\/20200508\\/60ae50bc996855de67408045d9369f51.docx\",\"create_time\":\"2020-05-08 14:57:46\",\"status\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588921110');
INSERT INTO `fa_admin_log` VALUES ('502', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/66?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"67845628a9f28186a63f7aa824d4010f\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"user\",\"title\":\"\\u4f1a\\u5458\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"66\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588923033');
INSERT INTO `fa_admin_log` VALUES ('503', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588923034');
INSERT INTO `fa_admin_log` VALUES ('504', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/2?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"6108864deb15a7d88f700499d8cc2f50\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"general\",\"title\":\"\\u5e38\\u89c4\\u7ba1\\u7406\",\"icon\":\"fa fa-cogs\",\"weigh\":\"10\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588923070');
INSERT INTO `fa_admin_log` VALUES ('505', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588923071');
INSERT INTO `fa_admin_log` VALUES ('506', '1', 'LindenVan', '/rWPFXdqobO.php/identify/ident/hand/ids/4?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u9274\\u5b9a\\u5b8c\\u6bd5\\u5047\\u7684\",\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588930229');
INSERT INTO `fa_admin_log` VALUES ('507', '1', 'LindenVan', '/rWPFXdqobO.php/identify/ident/hand/ids/7?dialog=1', '鉴定管理 在线鉴定', '{\"dialog\":\"1\",\"comment\":\"\\u624d\\u758f\\u5b66\\u6d45\",\"ids\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588930244');
INSERT INTO `fa_admin_log` VALUES ('508', '1', 'LindenVan', '/rWPFXdqobO.php/client/real_name/pass/ids/2', '客户管理 实名认证 Pass', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588930360');
INSERT INTO `fa_admin_log` VALUES ('509', '1', 'LindenVan', '/rWPFXdqobO.php/client/real_name/refuse/ids/1', '客户管理 实名认证 Refuse', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588930363');
INSERT INTO `fa_admin_log` VALUES ('510', '1', 'LindenVan', '/rWPFXdqobO.php/finance/withdrawals/refuse/ids/3', '财务管理 提现管理', '{\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588930927');
INSERT INTO `fa_admin_log` VALUES ('511', '1', 'LindenVan', '/rWPFXdqobO.php/finance/withdrawals/pass/ids/2', '财务管理 提现管理', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588930931');
INSERT INTO `fa_admin_log` VALUES ('512', '1', 'LindenVan', '/rWPFXdqobO.php/finance/withdrawals/pass/ids/1', '财务管理 提现管理', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588931017');
INSERT INTO `fa_admin_log` VALUES ('513', '1', 'LindenVan', '/rWPFXdqobO.php/finance/withdrawals/refuse/ids/2', '财务管理 提现管理', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588931021');
INSERT INTO `fa_admin_log` VALUES ('514', '1', 'LindenVan', '/rWPFXdqobO.php/finance/withdrawals/pass/ids/3', '财务管理 提现管理', '{\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588931022');
INSERT INTO `fa_admin_log` VALUES ('515', '1', 'LindenVan', '/rWPFXdqobO.php/msg/feedback/edit/ids/3', '消息管理 反馈管理 编辑', '{\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588932512');
INSERT INTO `fa_admin_log` VALUES ('516', '1', 'LindenVan', '/rWPFXdqobO.php/msg/feedback/edit/ids/3', '消息管理 反馈管理 编辑', '{\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588932514');
INSERT INTO `fa_admin_log` VALUES ('517', '1', 'LindenVan', '/rWPFXdqobO.php/msg/feedback/edit/ids/1', '消息管理 反馈管理 编辑', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588932517');
INSERT INTO `fa_admin_log` VALUES ('518', '1', 'LindenVan', '/rWPFXdqobO.php/msg/feedback/edit/ids/2', '消息管理 反馈管理 编辑', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588932520');
INSERT INTO `fa_admin_log` VALUES ('519', '1', 'LindenVan', '/rWPFXdqobO.php/msg/feedback/hand/ids/2', '消息管理 反馈管理', '{\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588932595');
INSERT INTO `fa_admin_log` VALUES ('520', '3', 'admin1', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"5845a9f28fc581fb1d0ddec81fb928ab\",\"username\":\"admin1\",\"captcha\":\"8MRD\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933171');
INSERT INTO `fa_admin_log` VALUES ('521', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"d27bcf8445a248529225cacf785811ff\",\"username\":\"Lindenvan\",\"captcha\":\"pzsa\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933293');
INSERT INTO `fa_admin_log` VALUES ('522', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/8?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"31d7c1f7ba5468d5358c427d210c0eaa\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"general\\/profile\",\"title\":\"\\u4e2a\\u4eba\\u8d44\\u6599\",\"icon\":\"fa fa-user\",\"weigh\":\"34\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933344');
INSERT INTO `fa_admin_log` VALUES ('523', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933345');
INSERT INTO `fa_admin_log` VALUES ('524', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/multi/ids/8', '角色与权限 菜单规则', '{\"action\":\"\",\"ids\":\"8\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933350');
INSERT INTO `fa_admin_log` VALUES ('525', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933351');
INSERT INTO `fa_admin_log` VALUES ('526', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"id\":\"7\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933369');
INSERT INTO `fa_admin_log` VALUES ('527', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/edit/ids/7?dialog=1', '角色与权限 角色组 编辑', '{\"dialog\":\"1\",\"__token__\":\"e463f3150a44fe3eeb4d2e8d85562243\",\"row\":{\"rules\":\"3,5,8,9,10,11,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,95,97,98,99,100,101,102,108,109,110,120,121,122,123,124,125,132,133,134,135,136,137,138,139,140,141,142,143,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,188,189,190,191,192,193,194,195,202,203,204,205,206,207,208,209,210,211,212,213\",\"pid\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"status\":\"normal\"},\"ids\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933375');
INSERT INTO `fa_admin_log` VALUES ('528', '3', 'admin1', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"768f8a9989a4e6300e637e2895c37c7a\",\"username\":\"admin1\",\"captcha\":\"VGTH\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933391');
INSERT INTO `fa_admin_log` VALUES ('529', '3', 'admin1', '/rWPFXdqobO.php/general.profile/update', '更新个人信息', '{\"__token__\":\"f0c53f4cbc2e35e1d4cbc71936003b68\",\"row\":{\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"email\":\"123666@qq.com\",\"nickname\":\"\\u8d85\\u7ba1\",\"password\":\"admin1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933415');
INSERT INTO `fa_admin_log` VALUES ('530', '3', 'admin1', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"2b98131fbbe69151cd7df839a2a28227\",\"username\":\"admin1\",\"captcha\":\"7ar3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933485');
INSERT INTO `fa_admin_log` VALUES ('531', '3', 'admin1', '/rWPFXdqobO.php/general.profile/update', '更新个人信息', '{\"__token__\":\"dcfd86297e68a01a5ac50151f13f1651\",\"row\":{\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"email\":\"test@test.com\",\"nickname\":\"\\u8d85\\u7ba1\",\"password\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933514');
INSERT INTO `fa_admin_log` VALUES ('532', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"7d79c1a92f19db5c1f6774d33c0ea110\",\"username\":\"Lindenvan\",\"captcha\":\"6RP8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933580');
INSERT INTO `fa_admin_log` VALUES ('533', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/8?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"4efeb72daf2b4431d6771cf1f8a7543d\",\"row\":{\"ismenu\":\"0\",\"pid\":\"0\",\"name\":\"general\\/profile\",\"title\":\"\\u4e2a\\u4eba\\u8d44\\u6599\",\"icon\":\"fa fa-user\",\"weigh\":\"1134\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933596');
INSERT INTO `fa_admin_log` VALUES ('534', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/8?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"9e66ae2222f614a31455ea6ef6892db8\",\"row\":{\"ismenu\":\"0\",\"pid\":\"0\",\"name\":\"general\\/profile\",\"title\":\"\\u4e2a\\u4eba\\u8d44\\u6599\",\"icon\":\"fa fa-user\",\"weigh\":\"1134\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933609');
INSERT INTO `fa_admin_log` VALUES ('535', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/8?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"81198c52ff8b8733d6763135bc384b10\",\"row\":{\"ismenu\":\"0\",\"pid\":\"2\",\"name\":\"general\\/profile\",\"title\":\"\\u4e2a\\u4eba\\u8d44\\u6599\",\"icon\":\"fa fa-user\",\"weigh\":\"1134\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933643');
INSERT INTO `fa_admin_log` VALUES ('536', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933643');
INSERT INTO `fa_admin_log` VALUES ('537', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/8?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"e60fd9e9a63a5f4e2324cb87ee9c3ad2\",\"row\":{\"ismenu\":\"0\",\"pid\":\"0\",\"name\":\"general\\/profile\",\"title\":\"\\u4e2a\\u4eba\\u8d44\\u6599\",\"icon\":\"fa fa-user\",\"weigh\":\"1134\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933671');
INSERT INTO `fa_admin_log` VALUES ('538', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/8?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"4f83e3df1a8eba70ddd742450531bf54\",\"row\":{\"ismenu\":\"0\",\"pid\":\"0\",\"name\":\"general\\/profile\",\"title\":\"\\u4e2a\\u4eba\\u8d44\\u6599\",\"icon\":\"fa fa-user\",\"weigh\":\"1134\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933674');
INSERT INTO `fa_admin_log` VALUES ('539', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/8?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"2e9244b6096e152923da0f1b56007a3d\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"general\\/profile\",\"title\":\"\\u4e2a\\u4eba\\u8d44\\u6599\",\"icon\":\"fa fa-user\",\"weigh\":\"1134\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933682');
INSERT INTO `fa_admin_log` VALUES ('540', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933682');
INSERT INTO `fa_admin_log` VALUES ('541', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/multi/ids/8', '角色与权限 菜单规则', '{\"action\":\"\",\"ids\":\"8\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933702');
INSERT INTO `fa_admin_log` VALUES ('542', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933702');
INSERT INTO `fa_admin_log` VALUES ('543', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"65a3739140e497be134e8c370cdba017\",\"username\":\"Lindenvan\",\"captcha\":\"YYUZ\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933733');
INSERT INTO `fa_admin_log` VALUES ('544', '3', 'admin1', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"b5f4d81dd4ebe7d253013d0b875d7ac7\",\"username\":\"admin1\",\"captcha\":\"bufn\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '1588933791');
INSERT INTO `fa_admin_log` VALUES ('545', '1', 'LindenVan', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '登录', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"4e9c2a8b7cef8934c4747ad8a95b674f\",\"username\":\"Lindenvan\",\"captcha\":\"GYDM\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588986732');
INSERT INTO `fa_admin_log` VALUES ('546', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/8?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"6ad83da414a699ca7262a0d585fb28d4\",\"row\":{\"ismenu\":\"0\",\"pid\":\"0\",\"name\":\"general\\/profile\",\"title\":\"\\u4e2a\\u4eba\\u8d44\\u6599\",\"icon\":\"fa fa-user\",\"weigh\":\"1134\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992633');
INSERT INTO `fa_admin_log` VALUES ('547', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/multi/ids/8', '角色与权限 菜单规则', '{\"action\":\"\",\"ids\":\"8\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992639');
INSERT INTO `fa_admin_log` VALUES ('548', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992639');
INSERT INTO `fa_admin_log` VALUES ('549', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/8?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"3a89ec055caf36be6254f9642ba52a83\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"general\\/profile\",\"title\":\"\\u4e2a\\u4eba\\u8d44\\u6599\",\"icon\":\"fa fa-user\",\"weigh\":\"1134\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992645');
INSERT INTO `fa_admin_log` VALUES ('550', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992645');
INSERT INTO `fa_admin_log` VALUES ('551', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"823fc754d09f0e03229e3d5dc7d29205\",\"username\":\"Lindenvan\",\"captcha\":\"TCME\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992665');
INSERT INTO `fa_admin_log` VALUES ('552', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/multi/ids/1', '角色与权限 菜单规则', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992677');
INSERT INTO `fa_admin_log` VALUES ('553', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992677');
INSERT INTO `fa_admin_log` VALUES ('554', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/edit/ids/1?dialog=1', '角色与权限 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"a133a14a5b0a2a1554793379bac01f85\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"dashboard\",\"title\":\"\\u63a7\\u5236\\u53f0\",\"icon\":\"fa fa-dashboard\",\"weigh\":\"150\",\"condition\":\"\",\"remark\":\"Dashboard tips\",\"status\":\"hidden\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992759');
INSERT INTO `fa_admin_log` VALUES ('555', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992759');
INSERT INTO `fa_admin_log` VALUES ('556', '1', 'LindenVan', '/rWPFXdqobO.php/auth/rule/multi/ids/1', '角色与权限 菜单规则', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992761');
INSERT INTO `fa_admin_log` VALUES ('557', '1', 'LindenVan', '/rWPFXdqobO.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992762');
INSERT INTO `fa_admin_log` VALUES ('558', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"9a49ce7f6e36ca395513301b1fe475cf\",\"username\":\"Lindenvan\",\"captcha\":\"UXDX\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992794');
INSERT INTO `fa_admin_log` VALUES ('559', '1', 'LindenVan', '/rWPFXdqobO.php/general.config/edit', '常规管理 系统配置 编辑', '{\"__token__\":\"4a39715c86e7ada63ee14b72b41b4939\",\"row\":{\"name\":\"\\u4f73\\u85cf\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"dashboard\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1588992815');
INSERT INTO `fa_admin_log` VALUES ('560', '1', 'LindenVan', '/rWPFXdqobO.php/addon/install', '插件管理', '{\"name\":\"qcloudsms\",\"force\":\"0\",\"uid\":\"21588\",\"token\":\"bec38bee-d27f-437d-bcea-9c6c2941da09\",\"version\":\"1.0.3\",\"faversion\":\"1.0.0.20200228_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589005001');
INSERT INTO `fa_admin_log` VALUES ('561', '1', 'LindenVan', '/rWPFXdqobO.php/client/users/add?dialog=1', '客户管理 客户列表 添加', '{\"dialog\":\"1\",\"row\":{\"user_key\":\"lopll10\",\"tel\":\"15599661793\",\"level\":\"0\",\"name\":\"\",\"id_number\":\"\",\"create_time\":\"2020-05-09 14:48:05\",\"status\":\"0\",\"comment\":\"ffdsfds\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589006897');
INSERT INTO `fa_admin_log` VALUES ('562', '1', 'LindenVan', '/rWPFXdqobO.php/client/users/add?dialog=1', '客户管理 客户列表 添加', '{\"dialog\":\"1\",\"row\":{\"user_key\":\"lopll10\",\"nickname\":\"Test\",\"tel\":\"15918364696\",\"level\":\"0\",\"name\":\"\",\"id_number\":\"\",\"create_time\":\"2020-05-09 15:07:22\",\"status\":\"0\",\"comment\":\"\\u6682\\u65e0\\u5907\\u6ce8\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589008098');
INSERT INTO `fa_admin_log` VALUES ('563', '1', 'LindenVan', '/rWPFXdqobO.php/client/users/add?dialog=1', '客户管理 客户列表 添加', '{\"dialog\":\"1\",\"row\":{\"user_key\":\"26968525\",\"nickname\":\"Test\",\"tel\":\"18639243804\",\"level\":\"0\",\"create_time\":\"2020-05-09 15:09:09\",\"status\":\"0\",\"comment\":\"\\u6682\\u65e0\\u5907\\u6ce8\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589008172');
INSERT INTO `fa_admin_log` VALUES ('564', '1', 'LindenVan', '/rWPFXdqobO.php/client/users/edit/ids/1?dialog=1', '客户管理 客户列表 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\",\"nickname\":\"\\u6d4b\\u8bd5\\u8005\",\"tel\":\"15696937525\",\"id_number\":\"\",\"comment\":\"\\u6682\\u65e0\\u5907\\u6ce8\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589008379');
INSERT INTO `fa_admin_log` VALUES ('565', '3', 'admin1', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '登录', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"149e4b32547e2eda14debea9b05b1eda\",\"username\":\"admin1\",\"captcha\":\"5JUU\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589164189');
INSERT INTO `fa_admin_log` VALUES ('566', '3', 'admin1', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"apple-1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589164280');
INSERT INTO `fa_admin_log` VALUES ('567', '3', 'admin1', '/rWPFXdqobO.php/system/banner/edit/ids/2?dialog=1', '系统管理 Banner 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200511\\/254fdde9b4e96edea4c6501c98d2827b.jpg\",\"url\":\"https:\\/\\/github.com\\/\",\"is_index\":\"0\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589164282');
INSERT INTO `fa_admin_log` VALUES ('568', '3', 'admin1', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"apple-1.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589164289');
INSERT INTO `fa_admin_log` VALUES ('569', '3', 'admin1', '/rWPFXdqobO.php/system/banner/edit/ids/1?dialog=1', '系统管理 Banner 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200511\\/254fdde9b4e96edea4c6501c98d2827b.jpg\",\"url\":\"https:\\/\\/www.baidu.com\\/\",\"is_index\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589164291');
INSERT INTO `fa_admin_log` VALUES ('570', '3', 'admin1', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"apple-2.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589164297');
INSERT INTO `fa_admin_log` VALUES ('571', '3', 'admin1', '/rWPFXdqobO.php/system/banner/edit/ids/1?dialog=1', '系统管理 Banner 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20200511\\/8a70e1113df14da75caadb1c4d955e94.jpg\",\"url\":\"https:\\/\\/www.baidu.com\\/\",\"is_index\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589164298');
INSERT INTO `fa_admin_log` VALUES ('572', '3', 'admin1', '/rWPFXdqobO.php/system/banner/multi/ids/2', '系统管理 Banner 批量更新', '{\"action\":\"\",\"ids\":\"2\",\"params\":\"is_index=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589164303');
INSERT INTO `fa_admin_log` VALUES ('573', '3', 'admin1', '/rWPFXdqobO.php/goods/good/del/ids/6', '商品管理 商品列表 删除', '{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589165248');
INSERT INTO `fa_admin_log` VALUES ('574', '3', 'admin1', '/rWPFXdqobO.php/goods/good/del/ids/3', '商品管理 商品列表 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589165249');
INSERT INTO `fa_admin_log` VALUES ('575', '3', 'admin1', '/rWPFXdqobO.php/goods/good/del/ids/2', '商品管理 商品列表 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589165250');
INSERT INTO `fa_admin_log` VALUES ('576', '3', 'admin1', '/rWPFXdqobO.php/goods/good/del/ids/1', '商品管理 商品列表 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589165254');
INSERT INTO `fa_admin_log` VALUES ('577', '3', 'admin1', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"swiper2.5ba8b45f.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589165322');
INSERT INTO `fa_admin_log` VALUES ('578', '3', 'admin1', '/rWPFXdqobO.php/goods/good/add?dialog=1', '商品管理 商品列表 添加', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u9ec4\\u7389\\u9e9f\",\"details\":\"\\u7cbe\\u54c1\\u9ec4\\u7389\\u9e9f\",\"class\":\"2\",\"price\":\"1999\",\"goods_image\":\"\\/uploads\\/20200511\\/5ba8b45f1b84dfe37a77bc7e53cbed0d.jpg\",\"num\":\"2\",\"tel\":\"18639243804\",\"user_key\":\"95865eb8bec61de07\",\"create_time\":\"2020-05-11 10:47:49\",\"status\":\"0\",\"comment\":\"\\u7fe1\\u7fe0\\u4e0d\\u540c\\u4e8e\\u4e00\\u822c\\u7684\\u5546\\u54c1\\uff0c\\u5176\\u4ef7\\u503c\\u4e3b\\u8981\\u53d6\\u51b3\\u4e8e\\u7fe1\\u7fe0\\u672c\\u8eab\\u7684\\u8d28\\u5730; \\u5927\\u5bb6\\u8033\\u719f\\u80fd\\u8be6\\u7684\\u300c\\u79cd\\u300d\\u3001\\u300c\\u6c34\\u300d\\u3001\\u300c\\u8272\\u300d\\u3001\\u300c\\u5730\\u300d\\u3001\\u300c\\u5de5\\u300d \\u4e94\\u5927\\u8981\\u7d20; \\u5176\\u4e2d\\u53ea\\u6709\\u5de5\\u827a\\u8fd9\\u4e00\\u4e2a\\u8981\\u7d20\\u662f\\u8ddf\\u540e\\u5929\\u52a0\\u5de5\\u6709\\u5173\\uff0c\\u5176\\u4f59\\u56db\\u5927\\u8981\\u7d20\\u90fd\\u662f\\u5929\\u7136\\u8d28\\u5730\\uff0c\\u800c\\u4e14\\u662f\\u540e\\u5929\\u4e0d\\u53ef\\u6539\\u53d8\\u7684 ; \\u5f53\\u7136\\u901a\\u8fc7\\u5316\\u5b66\\u624b\\u6bb5\\u53ef\\u6539\\u53d8\\u79cd\\u6c34\\u548c\\u4e00\\u90e8\\u5206\\u7684\\u8272\\uff0c\\u4f46\\u8fd9\\u6837\\u5c31\\u53d8\\u6210\\u4e86\\u7fe1\\u7fe0B\\u8d27\\u4e0d\\u503c\\u94b1\\u4e86\\u3002\\u7fe1\\u7fe0\\u7684\\u539f\\u4ea7\\u5730\\u5728\\u7f05\\u7538\\uff0c\\u8fd9\\u4e2a\\u5927\\u5bb6\\u90fd\\u77e5\\u9053\\u3002\\u540c\\u6837\\uff0c\\u5927\\u5bb6\\u4e5f\\u77e5\\u9053\\uff0c\\u5728\\u56fd\\u5185\\uff0c\\u7fe1\\u7fe0\\u52a0\\u5de5\\u5de5\\u827a\\u6c34\\u5e73\\u6700\\u597d\\u7684\\u5730\\u65b9\\u5c31\\u5728\\u5e7f\\u5dde\\u3002\\u6240\\u4ee5\\uff0c\\u4e5f\\u6709\\u5f88\\u591a\\u4eba\\u88ab\\u8bef\\u89e3\\u4e3a\\u5e7f\\u5dde\\u6240\\u4ea7\\u51fa\\u7684\\u7fe1\\u7fe0\\u6210\\u54c1\\u6027\\u4ef7\\u6bd4\\u5e94\\u8be5\\u662f\\u6700\\u9ad8\\u7684\\u3002\\u4f46\\u662f\\uff0c\\u5927\\u5bb6\\u4e0d\\u8981\\u5fd8\\u4e86\\uff0c\\u5728\\u4e2d\\u56fd\\uff0c\\u6700\\u9760\\u8fd1\\u7f05\\u7538\\u7684\\u5730\\u65b9\\u5c31\\u662f\\u4e91\\u5357\\uff0c\\u90a3\\u4e48\\u4e91\\u5357\\u7684\\u7fe1\\u7fe0\\u6210\\u54c1\\u6027\\u4ef7\\u6bd4\\u5230\\u5e95\\u600e\\u4e48\\u6837\\u5462\\uff1f \\u5176\\u5b9e\\uff0c\\u5728\\u51e0\\u5e74\\u524d\\uff0c\\u4e91\\u5357\\u7684\\u7fe1\\u7fe0\\u52a0\\u5de5\\u5de5\\u827a\\u771f\\u7684\\u662f\\u975e\\u5e38\\u5dee\\u3002\\u5f53\\u65f6\\u4e91\\u5357\\u6240\\u4ea7\\u51fa\\u7684\\u7fe1\\u7fe0\\u6bdb\\u6599\\u90fd\\u8981\\u9001\\u5230\\u5e7f\\u5dde\\u8fdb\\u884c\\u52a0\\u5de5\\uff0c\\u7136\\u540e\\u518d\\u8fd0\\u56de\\u4e91\\u5357\\uff0c\\u8fd9\\u6837\\u624d\\u80fd\\u51fa\\u73b0\\u975e\\u5e38\\u7cbe\\u7f8e\\u7684\\u7fe1\\u7fe0\\u9970\\u54c1\\uff0c\\u624d\\u80fd\\u5356\\u5f97\\u51fa\\u53bb\\u3002\\u4e0d\\u8fc7\\u8fd9\\u4e00\\u6765\\u4e00\\u56de\\u5c31\\u4f1a\\u51fa\\u73b0\\u975e\\u5e38\\u9ad8\\u7684\\u6210\\u672c\\uff01\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589165859');
INSERT INTO `fa_admin_log` VALUES ('579', '3', 'admin1', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"swiper2.5ba8b45f.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589165901');
INSERT INTO `fa_admin_log` VALUES ('580', '3', 'admin1', '/rWPFXdqobO.php/goods/good/add?dialog=1', '商品管理 商品列表 添加', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u548c\\u7530\\u7389\",\"details\":\"\\u7cbe\\u54c1\\u548c\\u7530\\u7389\",\"class\":\"2\",\"price\":\"1998\",\"goods_image\":\"\\/uploads\\/20200511\\/5ba8b45f1b84dfe37a77bc7e53cbed0d.jpg\",\"num\":\"5\",\"tel\":\"15599661793\",\"user_key\":\"95865eb8bec61de07\",\"create_time\":\"2020-05-11 10:57:44\",\"status\":\"0\",\"comment\":\"\\u7fe1\\u7fe0\\u4e0d\\u540c\\u4e8e\\u4e00\\u822c\\u7684\\u5546\\u54c1\\uff0c\\u5176\\u4ef7\\u503c\\u4e3b\\u8981\\u53d6\\u51b3\\u4e8e\\u7fe1\\u7fe0\\u672c\\u8eab\\u7684\\u8d28\\u5730; \\u5927\\u5bb6\\u8033\\u719f\\u80fd\\u8be6\\u7684\\u300c\\u79cd\\u300d\\u3001\\u300c\\u6c34\\u300d\\u3001\\u300c\\u8272\\u300d\\u3001\\u300c\\u5730\\u300d\\u3001\\u300c\\u5de5\\u300d \\u4e94\\u5927\\u8981\\u7d20; \\u5176\\u4e2d\\u53ea\\u6709\\u5de5\\u827a\\u8fd9\\u4e00\\u4e2a\\u8981\\u7d20\\u662f\\u8ddf\\u540e\\u5929\\u52a0\\u5de5\\u6709\\u5173\\uff0c\\u5176\\u4f59\\u56db\\u5927\\u8981\\u7d20\\u90fd\\u662f\\u5929\\u7136\\u8d28\\u5730\\uff0c\\u800c\\u4e14\\u662f\\u540e\\u5929\\u4e0d\\u53ef\\u6539\\u53d8\\u7684 ; \\u5f53\\u7136\\u901a\\u8fc7\\u5316\\u5b66\\u624b\\u6bb5\\u53ef\\u6539\\u53d8\\u79cd\\u6c34\\u548c\\u4e00\\u90e8\\u5206\\u7684\\u8272\\uff0c\\u4f46\\u8fd9\\u6837\\u5c31\\u53d8\\u6210\\u4e86\\u7fe1\\u7fe0B\\u8d27\\u4e0d\\u503c\\u94b1\\u4e86\\u3002\\u7fe1\\u7fe0\\u7684\\u539f\\u4ea7\\u5730\\u5728\\u7f05\\u7538\\uff0c\\u8fd9\\u4e2a\\u5927\\u5bb6\\u90fd\\u77e5\\u9053\\u3002\\u540c\\u6837\\uff0c\\u5927\\u5bb6\\u4e5f\\u77e5\\u9053\\uff0c\\u5728\\u56fd\\u5185\\uff0c\\u7fe1\\u7fe0\\u52a0\\u5de5\\u5de5\\u827a\\u6c34\\u5e73\\u6700\\u597d\\u7684\\u5730\\u65b9\\u5c31\\u5728\\u5e7f\\u5dde\\u3002\\u6240\\u4ee5\\uff0c\\u4e5f\\u6709\\u5f88\\u591a\\u4eba\\u88ab\\u8bef\\u89e3\\u4e3a\\u5e7f\\u5dde\\u6240\\u4ea7\\u51fa\\u7684\\u7fe1\\u7fe0\\u6210\\u54c1\\u6027\\u4ef7\\u6bd4\\u5e94\\u8be5\\u662f\\u6700\\u9ad8\\u7684\\u3002\\u4f46\\u662f\\uff0c\\u5927\\u5bb6\\u4e0d\\u8981\\u5fd8\\u4e86\\uff0c\\u5728\\u4e2d\\u56fd\\uff0c\\u6700\\u9760\\u8fd1\\u7f05\\u7538\\u7684\\u5730\\u65b9\\u5c31\\u662f\\u4e91\\u5357\\uff0c\\u90a3\\u4e48\\u4e91\\u5357\\u7684\\u7fe1\\u7fe0\\u6210\\u54c1\\u6027\\u4ef7\\u6bd4\\u5230\\u5e95\\u600e\\u4e48\\u6837\\u5462\\uff1f \\u5176\\u5b9e\\uff0c\\u5728\\u51e0\\u5e74\\u524d\\uff0c\\u4e91\\u5357\\u7684\\u7fe1\\u7fe0\\u52a0\\u5de5\\u5de5\\u827a\\u771f\\u7684\\u662f\\u975e\\u5e38\\u5dee\\u3002\\u5f53\\u65f6\\u4e91\\u5357\\u6240\\u4ea7\\u51fa\\u7684\\u7fe1\\u7fe0\\u6bdb\\u6599\\u90fd\\u8981\\u9001\\u5230\\u5e7f\\u5dde\\u8fdb\\u884c\\u52a0\\u5de5\\uff0c\\u7136\\u540e\\u518d\\u8fd0\\u56de\\u4e91\\u5357\\uff0c\\u8fd9\\u6837\\u624d\\u80fd\\u51fa\\u73b0\\u975e\\u5e38\\u7cbe\\u7f8e\\u7684\\u7fe1\\u7fe0\\u9970\\u54c1\\uff0c\\u624d\\u80fd\\u5356\\u5f97\\u51fa\\u53bb\\u3002\\u4e0d\\u8fc7\\u8fd9\\u4e00\\u6765\\u4e00\\u56de\\u5c31\\u4f1a\\u51fa\\u73b0\\u975e\\u5e38\\u9ad8\\u7684\\u6210\\u672c\\uff01\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589165926');
INSERT INTO `fa_admin_log` VALUES ('581', '3', 'admin1', '/rWPFXdqobO.php/goods/good/multi/ids/8,7', '商品管理 商品列表 批量更新', '{\"ids\":\"8,7\",\"params\":\"status=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589165988');
INSERT INTO `fa_admin_log` VALUES ('582', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"3e6dd3b5fc4c06467077e4ad16e02fd9\",\"username\":\"Lindenvan\",\"captcha\":\"DFUW\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589249097');
INSERT INTO `fa_admin_log` VALUES ('583', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"id\":\"7\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589249140');
INSERT INTO `fa_admin_log` VALUES ('584', '1', 'LindenVan', '/rWPFXdqobO.php/auth/group/edit/ids/7?dialog=1', '角色与权限 角色组 编辑', '{\"dialog\":\"1\",\"__token__\":\"51e656462c36b9accaae1582fade768a\",\"row\":{\"rules\":\"3,5,8,9,10,11,24,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,95,97,98,99,100,101,102,108,109,110,120,121,122,123,124,125,132,133,134,135,136,137,138,139,140,141,142,143,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,188,189,190,191,192,193,194,195,202,203,204,205,206,207,208,209,210,211,212,213,7,2\",\"pid\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"status\":\"normal\"},\"ids\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589249208');
INSERT INTO `fa_admin_log` VALUES ('585', '0', 'Unknown', '/rWPFXdqobO.php/index/login', '', '{\"__token__\":\"ddf5e5136735a272edac48083f5da7da\",\"username\":\"admin1\",\"captcha\":\"VNBU\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589249224');
INSERT INTO `fa_admin_log` VALUES ('586', '0', 'Unknown', '/rWPFXdqobO.php/index/login', '', '{\"__token__\":\"4b941bd0a61c9e340c2b0bd1f4643a5f\",\"username\":\"admin1\",\"captcha\":\"NXMB\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589249234');
INSERT INTO `fa_admin_log` VALUES ('587', '3', 'admin1', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"55f51bc4833d6b38f8668289b13570a6\",\"username\":\"admin1\",\"captcha\":\"MHWS\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589249242');
INSERT INTO `fa_admin_log` VALUES ('588', '3', 'admin1', '/rWPFXdqobO.php/ajax/upload', '', '{\"name\":\"Chairman_mao.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589254113');
INSERT INTO `fa_admin_log` VALUES ('589', '3', 'admin1', '/rWPFXdqobO.php/auth/group/roletree', '角色与权限 角色组', '{\"pid\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589254598');
INSERT INTO `fa_admin_log` VALUES ('590', '3', 'admin1', '/rWPFXdqobO.php/goods/classes/add?dialog=1', '商品管理 分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"class_name\":\"\\u5b57\\u753b\",\"have_num\":\"0\",\"cerate_time\":\"2020-05-12 11:39:41\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589254790');
INSERT INTO `fa_admin_log` VALUES ('591', '3', 'admin1', '/rWPFXdqobO.php/goods/classes/add?dialog=1', '商品管理 分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"class_name\":\"\\u4e66\\u7c4d\",\"have_num\":\"0\",\"cerate_time\":\"2020-05-12 11:39:52\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589254796');
INSERT INTO `fa_admin_log` VALUES ('592', '3', 'admin1', '/rWPFXdqobO.php/goods/good/add?dialog=1', '商品管理 商品列表 添加', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u9769\\u59d4\\u4f1a\\u6d77\\u62a5\",\"details\":\"\\u5317\\u4eac\\u5de5\\u827a\\u7f8e\\u9662\\u9769\\u59d4\\u4f1a\\u6d77\\u62a5\",\"class\":\"6\",\"price\":\"22.9\",\"goods_image\":\"\\/uploads\\/20200512\\/54b51dd79e426cbbb6bf25d34fd4c355.jpg\",\"num\":\"5\",\"tel\":\"15918364696\",\"user_key\":\"48905eb8cabeccbc5\",\"create_time\":\"2020-05-12 11:40:02\",\"status\":\"0\",\"comment\":\"\\u5317\\u4eac\\u5de5\\u827a\\u7f8e\\u9662\\u9769\\u59d4\\u4f1a\\u6d77\\u62a5-\\u5168\\u4e16\\u754c\\u65e0\\u4ea7\\u9636\\u7ea7\\u8054\\u5408\\u8d77\\u6765\\u6253\\u5230\\u7f8e\\u5e1d\\u56fd\\u4e3b\\u4e49\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589254990');
INSERT INTO `fa_admin_log` VALUES ('593', '3', 'admin1', '/rWPFXdqobO.php/goods/good/multi/ids/15', '商品管理 商品列表 批量更新', '{\"ids\":\"15\",\"params\":\"status=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589255017');
INSERT INTO `fa_admin_log` VALUES ('594', '1', 'LindenVan', '/rWPFXdqobO.php/index/login', '登录', '{\"__token__\":\"1fe3b87ea69b0fa1748ebbc560545324\",\"username\":\"Lindenvan\",\"captcha\":\"JN6C\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589273321');
INSERT INTO `fa_admin_log` VALUES ('595', '1', 'LindenVan', '/rWPFXdqobO.php/index/login?url=%2FrWPFXdqobO.php', '登录', '{\"url\":\"\\/rWPFXdqobO.php\",\"__token__\":\"24394a6e92f25c23e2cfa25e31ce27d5\",\"username\":\"Lindenvan\",\"captcha\":\"BGMV\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589333757');
INSERT INTO `fa_admin_log` VALUES ('596', '1', 'LindenVan', '/rWPFXdqobO.php/client/real_name/refuse/ids/3', '客户管理 实名认证 Refuse', '{\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589334260');
INSERT INTO `fa_admin_log` VALUES ('597', '1', 'LindenVan', '/rWPFXdqobO.php/client/real_name/pass/ids/4', '客户管理 实名认证 Pass', '{\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '1589336797');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES ('1', '1', '0', '/assets/img/qrcode.png', '150', '150', 'png', '0', '21859', 'image/png', '', '1499681848', '1499681848', '1499681848', 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `fa_attachment` VALUES ('2', '1', '0', '/uploads/20200430/50de2b33343e218bcd8d3a1a939c7966.jpg', '438', '273', 'jpg', '0', '38154', 'image/jpeg', '{\"name\":\"\\u6355\\u83b7.JPG\"}', '1588213368', '1588213368', '1588213368', 'local', '70afa545d0d00afeeabb3c1af793a47a88eeadd0');
INSERT INTO `fa_attachment` VALUES ('3', '1', '0', '/uploads/20200430/22e722b15d9a5b940131a445fb3020da.png', '100', '100', 'png', '0', '4948', 'image/png', '{\"name\":\"log.png\"}', '1588215926', '1588215926', '1588215926', 'local', 'd98e8f2f24b5a01c01ed015839288ab0f660977d');
INSERT INTO `fa_attachment` VALUES ('4', '1', '0', '/uploads/20200430/07524b120ff7288fd7f0b4c5160da7e8.jpg', '1366', '768', 'jpg', '0', '389386', 'image/jpeg', '{\"name\":\"5.jpg\"}', '1588231742', '1588231742', '1588231742', 'local', 'a9bb10b5f78054588eaf3ce6f46847d42ca951b6');
INSERT INTO `fa_attachment` VALUES ('5', '1', '0', '/uploads/20200430/049abffc2beb4ce171f639605907045f.jpg', '1366', '768', 'jpg', '0', '293257', 'image/jpeg', '{\"name\":\"52.jpg\"}', '1588231752', '1588231752', '1588231752', 'local', 'bbcd9bfe26f27e7eaa2f640494328fb637661b98');
INSERT INTO `fa_attachment` VALUES ('6', '1', '0', '/uploads/20200507/799ba846cbc3ddc9f44bac59360c2bdc.jpg', '504', '162', 'jpg', '0', '32083', 'image/jpeg', '{\"name\":\"Free-Converter.com-age_of_reformation-54810608.jpg\"}', '1588837671', '1588837671', '1588837671', 'local', '7704e7fe60dec66a6f2936184c98cb42d1c5ff81');
INSERT INTO `fa_attachment` VALUES ('7', '1', '0', '/uploads/20200507/4941dc039e41e28404833d0839794d3e.png', '200', '200', 'png', '0', '4115', 'image/png', '{\"name\":\"upl_2.png\"}', '1588838013', '1588838013', '1588838013', 'local', 'b11a006e7e2931a07a78f52ec7e5b4aa2b3af498');
INSERT INTO `fa_attachment` VALUES ('8', '1', '0', '/uploads/20200508/a6c3c5f034f631351785dc60b2bad080.zip', '', '', 'zip', '0', '286373', 'application/x-zip-compressed', '{\"name\":\"San_Francisco.zip\"}', '1588904227', '1588904227', '1588904227', 'local', 'b93183d829c2ada1b814467ddf15b54abcc0c992');
INSERT INTO `fa_attachment` VALUES ('10', '1', '0', '/uploads/20200508/e05c70a045af7264f0bc144bfbff1a18.rar', '', '', 'rar', '0', '368951', 'application/octet-stream', '{\"name\":\"jianli8772.rar\"}', '1588908790', '1588908790', '1588908790', 'local', '567597500cff7c618081c4d8e6dd3f1cb8d4e652');
INSERT INTO `fa_attachment` VALUES ('11', '1', '0', '/uploads/20200508/60ae50bc996855de67408045d9369f51.docx', '', '', 'docx', '0', '11558', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '{\"name\":\"55.docx\"}', '1588921070', '1588921070', '1588921070', 'local', '4180cc8b44511e02ae731dfdde76545f8e5ef1f6');
INSERT INTO `fa_attachment` VALUES ('12', '3', '0', '/uploads/20200511/254fdde9b4e96edea4c6501c98d2827b.jpg', '660', '520', 'jpg', '0', '25106', 'image/jpeg', '{\"name\":\"apple-1.jpg\"}', '1589164280', '1589164280', '1589164280', 'local', 'a3a9ba0effa08c94c194cd7828f5f2a0bf59ef5f');
INSERT INTO `fa_attachment` VALUES ('13', '3', '0', '/uploads/20200511/8a70e1113df14da75caadb1c4d955e94.jpg', '1600', '1295', 'jpg', '0', '116911', 'image/jpeg', '{\"name\":\"apple-2.jpg\"}', '1589164297', '1589164297', '1589164297', 'local', '7304d3865a199ce806dce4970c7c012ed1b95496');
INSERT INTO `fa_attachment` VALUES ('14', '3', '0', '/uploads/20200511/5ba8b45f1b84dfe37a77bc7e53cbed0d.jpg', '640', '427', 'jpg', '0', '89125', 'image/jpeg', '{\"name\":\"swiper2.5ba8b45f.jpg\"}', '1589165322', '1589165322', '1589165322', 'local', '84188a31e2dfa464d85ebbeb06701a4ff67d32e6');
INSERT INTO `fa_attachment` VALUES ('15', '3', '0', '/uploads/20200512/54b51dd79e426cbbb6bf25d34fd4c355.jpg', '600', '404', 'jpg', '0', '205438', 'image/jpeg', '{\"name\":\"Chairman_mao.jpg\"}', '1589254113', '1589254113', '1589254113', 'local', 'b889bbcbcd4b55feff07a402035c0254ba4fe227');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='分组表';

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES ('1', '0', 'Admin group', '*', '1490883540', '149088354', 'normal');
INSERT INTO `fa_auth_group` VALUES ('7', '1', '超级管理员', '3,5,8,9,10,11,24,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,95,97,98,99,100,101,102,108,109,110,120,121,122,123,124,125,132,133,134,135,136,137,138,139,140,141,142,143,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,188,189,190,191,192,193,194,195,202,203,204,205,206,207,208,209,210,211,212,213,7,2', '1588734679', '1589249208', 'normal');

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
INSERT INTO `fa_auth_group_access` VALUES ('3', '7');

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
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 COMMENT='节点表';

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES ('1', 'file', '0', 'dashboard', '控制台', 'fa fa-dashboard', '', 'Dashboard tips', '0', '1497429920', '1588992761', '150', 'hidden');
INSERT INTO `fa_auth_rule` VALUES ('2', 'file', '0', 'general', '常规管理', 'fa fa-cogs', '', '', '1', '1497429920', '1588923070', '10', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('3', 'file', '0', 'category', '分类管理', 'fa fa-leaf', '', 'Category tips', '1', '1497429920', '1587540685', '4', 'hidden');
INSERT INTO `fa_auth_rule` VALUES ('4', 'file', '0', 'addon', '插件管理', 'fa fa-rocket', '', 'Addon tips', '1', '1502035509', '1588140664', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('5', 'file', '181', 'auth', '角色与权限', 'fa fa-group', '', '', '1', '1497429920', '1588227529', '113', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('6', 'file', '2', 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', '1', '1497429920', '1497430683', '60', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('7', 'file', '2', 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', '1', '1497429920', '1497430699', '53', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('8', 'file', '0', 'general/profile', '个人资料', 'fa fa-user', '', '', '1', '1497429920', '1588992645', '1134', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', '1', '1497429920', '1497430320', '118', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('10', 'file', '181', 'auth/adminlog', '管理员日志', 'fa fa-list-alt', '', 'Admin log tips', '1', '1497429920', '1588227516', '93', 'normal');
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
INSERT INTO `fa_auth_rule` VALUES ('66', 'file', '0', 'user', '会员管理', 'fa fa-list', '', '', '1', '1516374729', '1588923033', '0', 'hidden');
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
INSERT INTO `fa_auth_rule` VALUES ('95', 'file', '0', 'client', '客户管理', 'fa fa-address-card', '', '', '1', '1587537208', '1587952129', '99', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('97', 'file', '95', 'client/address', '地址列表', 'fa fa-align-justify', '', '', '1', '1587540598', '1587540730', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('98', 'file', '97', 'client/address/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587542989', '1587542989', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('99', 'file', '97', 'client/address/del', '删除', 'fa fa-circle-o', '', '', '0', '1587542989', '1587542989', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('100', 'file', '97', 'client/address/index', '查看', 'fa fa-circle-o', '', '', '0', '1587542989', '1587542989', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('101', 'file', '97', 'client/address/add', '添加', 'fa fa-circle-o', '', '', '0', '1587542989', '1587542989', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('102', 'file', '97', 'client/address/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587542989', '1587542989', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('108', 'file', '0', 'goods', '商品管理', 'fa fa-archive', '', '', '1', '1587544916', '1587634689', '98', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('109', 'file', '0', 'order', '订单管理', 'fa fa-newspaper-o', '', '', '1', '1587544996', '1587544996', '97', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('110', 'file', '0', 'finance', '财务管理', 'fa fa-dollar', '', '', '1', '1587545052', '1587545086', '96', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('120', 'file', '109', 'order/goreder', '商品订单', 'fa fa-circle-o', '', '', '1', '1587620978', '1587621116', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('121', 'file', '120', 'order/goreder/index', '查看', 'fa fa-circle-o', '', '', '0', '1587620978', '1588213720', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('122', 'file', '120', 'order/goreder/add', '添加', 'fa fa-circle-o', '', '', '0', '1587620978', '1588213720', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('123', 'file', '120', 'order/goreder/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587620978', '1588213720', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('124', 'file', '120', 'order/goreder/del', '删除', 'fa fa-circle-o', '', '', '0', '1587620978', '1588213720', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('125', 'file', '120', 'order/goreder/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587620978', '1588213720', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('132', 'file', '110', 'finance/withdrawals', '提现管理', 'fa fa-circle-o', '', '', '1', '1587621428', '1587621747', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('133', 'file', '132', 'finance/withdrawals/index', '查看', 'fa fa-circle-o', '', '', '0', '1587621428', '1588751745', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('134', 'file', '132', 'finance/withdrawals/add', '添加', 'fa fa-circle-o', '', '', '0', '1587621428', '1588751745', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('135', 'file', '132', 'finance/withdrawals/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587621428', '1588751745', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('136', 'file', '132', 'finance/withdrawals/del', '删除', 'fa fa-circle-o', '', '', '0', '1587621428', '1588751745', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('137', 'file', '132', 'finance/withdrawals/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587621428', '1588751745', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('138', 'file', '95', 'client/users', '客户列表', 'fa fa-address-book-o', '', '', '1', '1587622027', '1587622110', '20', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('139', 'file', '138', 'client/users/index', '查看', 'fa fa-circle-o', '', '', '0', '1587622027', '1587622027', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('140', 'file', '138', 'client/users/add', '添加', 'fa fa-circle-o', '', '', '0', '1587622027', '1587622027', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('141', 'file', '138', 'client/users/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587622027', '1587622027', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('142', 'file', '138', 'client/users/del', '删除', 'fa fa-circle-o', '', '', '0', '1587622027', '1587622027', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('143', 'file', '138', 'client/users/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587622027', '1587622027', '0', 'normal');
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
INSERT INTO `fa_auth_rule` VALUES ('163', 'file', '156', 'msg/feedback', '反馈管理', 'fa fa-comments', '', '', '1', '1587886248', '1588236771', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('164', 'file', '163', 'msg/feedback/index', '查看', 'fa fa-circle-o', '', '', '0', '1587886248', '1588758803', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('165', 'file', '163', 'msg/feedback/add', '添加', 'fa fa-circle-o', '', '', '0', '1587886248', '1588758803', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('166', 'file', '163', 'msg/feedback/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587886248', '1588758803', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('167', 'file', '163', 'msg/feedback/del', '删除', 'fa fa-circle-o', '', '', '0', '1587886248', '1588758803', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('168', 'file', '163', 'msg/feedback/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587886248', '1588758803', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('169', 'file', '109', 'order/voreder', '会员订单', 'fa fa-circle-o', '', '', '1', '1587891382', '1587891688', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('170', 'file', '169', 'order/voreder/index', '查看', 'fa fa-circle-o', '', '', '0', '1587891382', '1587891599', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('171', 'file', '169', 'order/voreder/add', '添加', 'fa fa-circle-o', '', '', '0', '1587891382', '1587891599', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('172', 'file', '169', 'order/voreder/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587891382', '1587891599', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('173', 'file', '169', 'order/voreder/del', '删除', 'fa fa-circle-o', '', '', '0', '1587891382', '1587891599', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('174', 'file', '169', 'order/voreder/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587891382', '1587891599', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('175', 'file', '95', 'client/real_name', '实名认证', 'fa fa-circle-o', '', '', '1', '1587893349', '1587894846', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('176', 'file', '175', 'client/real_name/index', '查看', 'fa fa-circle-o', '', '', '0', '1587893350', '1588215049', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('177', 'file', '175', 'client/real_name/add', '添加', 'fa fa-circle-o', '', '', '0', '1587893350', '1588215049', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('178', 'file', '175', 'client/real_name/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1587893350', '1588215049', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('179', 'file', '175', 'client/real_name/del', '删除', 'fa fa-circle-o', '', '', '0', '1587893350', '1588215049', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('180', 'file', '175', 'client/real_name/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1587893350', '1588215049', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('181', 'file', '0', 'system', '系统管理', 'fa fa-gears', '', '', '1', '1588211920', '1588227420', '92', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('188', 'file', '181', 'system/banner', 'Banner', 'fa fa-photo', '', '', '1', '1588212923', '1588227588', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('189', 'file', '188', 'system/banner/index', '查看', 'fa fa-circle-o', '', '', '0', '1588212924', '1588213067', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('190', 'file', '188', 'system/banner/add', '添加', 'fa fa-circle-o', '', '', '0', '1588212924', '1588213067', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('191', 'file', '188', 'system/banner/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1588212924', '1588213067', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('192', 'file', '188', 'system/banner/del', '删除', 'fa fa-circle-o', '', '', '0', '1588212924', '1588213067', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('193', 'file', '188', 'system/banner/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1588212924', '1588213067', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('194', 'file', '175', 'client/real_name/pass', 'Pass', 'fa fa-circle-o', '', '', '0', '1588215049', '1588215049', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('195', 'file', '175', 'client/real_name/refuse', 'Refuse', 'fa fa-circle-o', '', '', '0', '1588215049', '1588215049', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('196', 'file', '0', 'datatest', '测试', 'fa fa-circle-o', '', '', '1', '1588228977', '1588728800', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('197', 'file', '196', 'datatest/index', '查看', 'fa fa-circle-o', '', '', '0', '1588228977', '1588228977', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('198', 'file', '196', 'datatest/add', '添加', 'fa fa-circle-o', '', '', '0', '1588228977', '1588228977', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('199', 'file', '196', 'datatest/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1588228977', '1588228977', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('200', 'file', '196', 'datatest/del', '删除', 'fa fa-circle-o', '', '', '0', '1588228977', '1588228977', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('201', 'file', '196', 'datatest/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1588228977', '1588228977', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('202', 'file', '108', 'goods/classes', '分类管理', 'fa fa-circle-o', '', '', '1', '1588746981', '1588747572', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('203', 'file', '202', 'goods/classes/index', '查看', 'fa fa-circle-o', '', '', '0', '1588746981', '1588746981', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('204', 'file', '202', 'goods/classes/add', '添加', 'fa fa-circle-o', '', '', '0', '1588746981', '1588746981', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('205', 'file', '202', 'goods/classes/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1588746981', '1588746981', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('206', 'file', '202', 'goods/classes/del', '删除', 'fa fa-circle-o', '', '', '0', '1588746981', '1588746981', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('207', 'file', '202', 'goods/classes/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1588746981', '1588746981', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('208', 'file', '108', 'goods/good', '商品列表', 'fa fa-circle-o', '', '', '1', '1588747419', '1588747543', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('209', 'file', '208', 'goods/good/index', '查看', 'fa fa-circle-o', '', '', '0', '1588747419', '1588816147', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('210', 'file', '208', 'goods/good/add', '添加', 'fa fa-circle-o', '', '', '0', '1588747419', '1588816147', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('211', 'file', '208', 'goods/good/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1588747419', '1588816147', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('212', 'file', '208', 'goods/good/del', '删除', 'fa fa-circle-o', '', '', '0', '1588747419', '1588816147', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('213', 'file', '208', 'goods/good/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1588747419', '1588816147', '0', 'normal');

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
INSERT INTO `fa_config` VALUES ('1', 'name', 'basic', 'Site name', '请填写站点名称', 'string', '佳藏', '', 'required', '');
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
INSERT INTO `fa_user` VALUES ('1', '1', 'admin', 'admin', 'c13f62012fd6a8fdf06b3452a94430e5', 'rpR6Bv', 'admin@163.com', '13888888888', '', '0', '0', '2017-04-15', '', '0.00', '0', '2', '2', '1589163175', '1589169225', '127.0.0.1', '0', '127.0.0.1', '1491461418', '0', '1589169225', '', 'normal', '');

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
  `user_key` varchar(50) NOT NULL COMMENT '用户账号',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员Token表';

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------
INSERT INTO `fa_user_token` VALUES ('f6f78178665b174247be85bde5486fda2be36204', '1', '1589360604', '1591952604', '95865eb8bec61de07');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_key` varchar(50) DEFAULT NULL COMMENT '佳藏号',
  `tel` char(11) DEFAULT NULL COMMENT '电话',
  `user_name` varchar(50) DEFAULT NULL COMMENT '反馈者名称',
  `comment` text COMMENT '反馈信息',
  `create_time` datetime DEFAULT NULL COMMENT '反馈时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', 'xiaoli012', '18801051453', '李九', '真好据悉李国庆与俞渝之前已经历“八王议政、当众摔杯、浴池梅毒、票圈撕破脸”等事件。真好据悉李国庆与俞渝之前已经历“八王议政、当众摔杯、浴池梅毒、票圈撕破脸”等事件。真好据悉李国庆与俞渝之前已经历“八王议政、当众摔杯、浴池梅毒、票圈撕破脸”等事件。', '2020-04-26 14:52:05', '1');
INSERT INTO `feedback` VALUES ('2', 'xiaoli012', '18801051453', '李九', '中国青年报客户端北京5月8日电（中青报中青网记者 邱晨辉）记者从中国载人航天工程办公室获悉，2020年5月8日13时49分，我国新一代载人飞船试验船返回舱在东风着陆场预定区域成功着陆，试验取得圆满成功', '2020-04-26 14:52:05', '1');
INSERT INTO `feedback` VALUES ('3', 'xiaoli012', '18801051453', '李九', '今天12时21分，北京航天飞行控制中心控制试验船完成返回制动，进入返回轨道。13时33分，服务舱与返回舱成功分离。13时49分，试验船返回舱安全着陆。搜救分队第一时间发现目标并到达着陆现场开展处置，经现场确认，舱体结构完好。', '2020-04-26 14:52:05', '0');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `details` varchar(255) DEFAULT NULL COMMENT '详情',
  `class` char(1) DEFAULT NULL COMMENT '分类',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `goods_image` varchar(255) DEFAULT NULL COMMENT '示例图',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `browse` int(11) DEFAULT '0' COMMENT '浏览量',
  `collect` int(11) DEFAULT '0' COMMENT '收藏量',
  `tel` char(11) DEFAULT NULL COMMENT '发布人电话',
  `user_key` varchar(50) DEFAULT NULL COMMENT '发布人佳藏号',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `comment` text COMMENT '备注',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('7', '黄玉郎', '精品黄玉麟', '2', '1999.00', '/uploads/20200511/5ba8b45f1b84dfe37a77bc7e53cbed0d.jpg,/uploads/20200511/5ba8b45f1b84dfe37a77bc7e53cbed0d.jpg', '2', '599', '0', '18639243804', '95865eb8bec61de07', '2020-05-11 10:47:49', '1', '翡翠不同于一般的商品，其价值主要取决于翡翠本身的质地; 大家耳熟能详的「种」、「水」、「色」、「地」、「工」 五大要素; 其中只有工艺这一个要素是跟后天加工有关，其余四大要素都是天然质地，而且是后天不可改变的 ; 当然通过化学手段可改变种水和一部分的色，但这样就变成了翡翠B货不值钱了。翡翠的原产地在缅甸，这个大家都知道。同样，大家也知道，在国内，翡翠加工工艺水平最好的地方就在广州。所以，也有很多人被误解为广州所产出的翡翠成品性价比应该是最高的。但是，大家不要忘了，在中国，最靠近缅甸的地方就是云南，那么云南的翡翠成品性价比到底怎么样呢？ 其实，在几年前，云南的翡翠加工工艺真的是非常差。当时云南所产出的翡翠毛料都要送到广州进行加工，然后再运回云南，这样才能出现非常精美的翡翠饰品，才能卖得出去。不过这一来一回就会出现非常高的成本！');
INSERT INTO `goods` VALUES ('8', '和田玉3', '精品和田玉', '2', '1998.00', '/uploads/20200511/5ba8b45f1b84dfe37a77bc7e53cbed0d.jpg', '5', '588', '0', '15599661793', '95865eb8bec61de07', '2020-05-11 10:27:04', '1', '翡翠不同于一般的商品，其价值主要取决于翡翠本身的质地; 大家耳熟能详的「种」、「水」、「色」、「地」、「工」 五大要素; 其中只有工艺这一个要素是跟后天加工有关，其余四大要素都是天然质地，而且是后天不可改变的 ; 当然通过化学手段可改变种水和一部分的色，但这样就变成了翡翠B货不值钱了。翡翠的原产地在缅甸，这个大家都知道。同样，大家也知道，在国内，翡翠加工工艺水平最好的地方就在广州。所以，也有很多人被误解为广州所产出的翡翠成品性价比应该是最高的。但是，大家不要忘了，在中国，最靠近缅甸的地方就是云南，那么云南的翡翠成品性价比到底怎么样呢？ 其实，在几年前，云南的翡翠加工工艺真的是非常差。当时云南所产出的翡翠毛料都要送到广州进行加工，然后再运回云南，这样才能出现非常精美的翡翠饰品，才能卖得出去。不过这一来一回就会出现非常高的成本！\r\n');
INSERT INTO `goods` VALUES ('9', '和田红玉', '精品和田玉', '2', '1998.00', '/uploads/20200511/5ba8b45f1b84dfe37a77bc7e53cbed0d.jpg', '5', '699', '0', '15599661793', '95865eb8bec61de07', '2020-04-29 10:57:42', '1', '翡翠不同于一般的商品，其价值主要取决于翡翠本身的质地; 大家耳熟能详的「种」、「水」、「色」、「地」、「工」 五大要素; 其中只有工艺这一个要素是跟后天加工有关，其余四大要素都是天然质地，而且是后天不可改变的 ; 当然通过化学手段可改变种水和一部分的色，但这样就变成了翡翠B货不值钱了。翡翠的原产地在缅甸，这个大家都知道。同样，大家也知道，在国内，翡翠加工工艺水平最好的地方就在广州。所以，也有很多人被误解为广州所产出的翡翠成品性价比应该是最高的。但是，大家不要忘了，在中国，最靠近缅甸的地方就是云南，那么云南的翡翠成品性价比到底怎么样呢？ 其实，在几年前，云南的翡翠加工工艺真的是非常差。当时云南所产出的翡翠毛料都要送到广州进行加工，然后再运回云南，这样才能出现非常精美的翡翠饰品，才能卖得出去。不过这一来一回就会出现非常高的成本！\r\n');
INSERT INTO `goods` VALUES ('10', '和田玉1', '精品和田玉', '2', '1998.00', '/uploads/20200511/5ba8b45f1b84dfe37a77bc7e53cbed0d.jpg', '5', '611', '0', '15599661793', '95865eb8bec61de07', '2020-05-11 10:57:50', '1', '翡翠不同于一般的商品，其价值主要取决于翡翠本身的质地; 大家耳熟能详的「种」、「水」、「色」、「地」、「工」 五大要素; 其中只有工艺这一个要素是跟后天加工有关，其余四大要素都是天然质地，而且是后天不可改变的 ; 当然通过化学手段可改变种水和一部分的色，但这样就变成了翡翠B货不值钱了。翡翠的原产地在缅甸，这个大家都知道。同样，大家也知道，在国内，翡翠加工工艺水平最好的地方就在广州。所以，也有很多人被误解为广州所产出的翡翠成品性价比应该是最高的。但是，大家不要忘了，在中国，最靠近缅甸的地方就是云南，那么云南的翡翠成品性价比到底怎么样呢？ 其实，在几年前，云南的翡翠加工工艺真的是非常差。当时云南所产出的翡翠毛料都要送到广州进行加工，然后再运回云南，这样才能出现非常精美的翡翠饰品，才能卖得出去。不过这一来一回就会出现非常高的成本！\r\n');
INSERT INTO `goods` VALUES ('11', '青玉麒麟', '精品玉麒麟', '2', '1998.00', '/uploads/20200511/5ba8b45f1b84dfe37a77bc7e53cbed0d.jpg', '5', '836', '0', '15599661793', '95865eb8bec61de07', '2020-05-05 10:57:45', '1', '翡翠不同于一般的商品，其价值主要取决于翡翠本身的质地; 大家耳熟能详的「种」、「水」、「色」、「地」、「工」 五大要素; 其中只有工艺这一个要素是跟后天加工有关，其余四大要素都是天然质地，而且是后天不可改变的 ; 当然通过化学手段可改变种水和一部分的色，但这样就变成了翡翠B货不值钱了。翡翠的原产地在缅甸，这个大家都知道。同样，大家也知道，在国内，翡翠加工工艺水平最好的地方就在广州。所以，也有很多人被误解为广州所产出的翡翠成品性价比应该是最高的。但是，大家不要忘了，在中国，最靠近缅甸的地方就是云南，那么云南的翡翠成品性价比到底怎么样呢？ 其实，在几年前，云南的翡翠加工工艺真的是非常差。当时云南所产出的翡翠毛料都要送到广州进行加工，然后再运回云南，这样才能出现非常精美的翡翠饰品，才能卖得出去。不过这一来一回就会出现非常高的成本！\r\n');
INSERT INTO `goods` VALUES ('12', '红玉麒麟', '精品玉麒麟', '2', '1998.00', '/uploads/20200511/5ba8b45f1b84dfe37a77bc7e53cbed0d.jpg', '5', '211', '0', '15599661793', '95865eb8bec61de07', '2020-05-11 10:57:45', '1', '翡翠不同于一般的商品，其价值主要取决于翡翠本身的质地; 大家耳熟能详的「种」、「水」、「色」、「地」、「工」 五大要素; 其中只有工艺这一个要素是跟后天加工有关，其余四大要素都是天然质地，而且是后天不可改变的 ; 当然通过化学手段可改变种水和一部分的色，但这样就变成了翡翠B货不值钱了。翡翠的原产地在缅甸，这个大家都知道。同样，大家也知道，在国内，翡翠加工工艺水平最好的地方就在广州。所以，也有很多人被误解为广州所产出的翡翠成品性价比应该是最高的。但是，大家不要忘了，在中国，最靠近缅甸的地方就是云南，那么云南的翡翠成品性价比到底怎么样呢？ 其实，在几年前，云南的翡翠加工工艺真的是非常差。当时云南所产出的翡翠毛料都要送到广州进行加工，然后再运回云南，这样才能出现非常精美的翡翠饰品，才能卖得出去。不过这一来一回就会出现非常高的成本！\r\n');
INSERT INTO `goods` VALUES ('13', '蓝玉麒麟', '精品玉麒麟', '2', '1998.00', '/uploads/20200511/5ba8b45f1b84dfe37a77bc7e53cbed0d.jpg', '5', '985', '0', '15599661793', '95865eb8bec61de07', '2020-05-11 10:57:45', '1', '翡翠不同于一般的商品，其价值主要取决于翡翠本身的质地; 大家耳熟能详的「种」、「水」、「色」、「地」、「工」 五大要素; 其中只有工艺这一个要素是跟后天加工有关，其余四大要素都是天然质地，而且是后天不可改变的 ; 当然通过化学手段可改变种水和一部分的色，但这样就变成了翡翠B货不值钱了。翡翠的原产地在缅甸，这个大家都知道。同样，大家也知道，在国内，翡翠加工工艺水平最好的地方就在广州。所以，也有很多人被误解为广州所产出的翡翠成品性价比应该是最高的。但是，大家不要忘了，在中国，最靠近缅甸的地方就是云南，那么云南的翡翠成品性价比到底怎么样呢？ 其实，在几年前，云南的翡翠加工工艺真的是非常差。当时云南所产出的翡翠毛料都要送到广州进行加工，然后再运回云南，这样才能出现非常精美的翡翠饰品，才能卖得出去。不过这一来一回就会出现非常高的成本！\r\n');
INSERT INTO `goods` VALUES ('14', '紫玉麒麟', '精品玉麒麟', '2', '1998.00', '/uploads/20200511/5ba8b45f1b84dfe37a77bc7e53cbed0d.jpg', '5', '315', '0', '15599661793', '95865eb8bec61de07', '2020-05-11 10:57:45', '0', '翡翠不同于一般的商品，其价值主要取决于翡翠本身的质地; 大家耳熟能详的「种」、「水」、「色」、「地」、「工」 五大要素; 其中只有工艺这一个要素是跟后天加工有关，其余四大要素都是天然质地，而且是后天不可改变的 ; 当然通过化学手段可改变种水和一部分的色，但这样就变成了翡翠B货不值钱了。翡翠的原产地在缅甸，这个大家都知道。同样，大家也知道，在国内，翡翠加工工艺水平最好的地方就在广州。所以，也有很多人被误解为广州所产出的翡翠成品性价比应该是最高的。但是，大家不要忘了，在中国，最靠近缅甸的地方就是云南，那么云南的翡翠成品性价比到底怎么样呢？ 其实，在几年前，云南的翡翠加工工艺真的是非常差。当时云南所产出的翡翠毛料都要送到广州进行加工，然后再运回云南，这样才能出现非常精美的翡翠饰品，才能卖得出去。不过这一来一回就会出现非常高的成本！\r\n');
INSERT INTO `goods` VALUES ('15', '革委会海报', '北京工艺美院革委会海报', '6', '22.90', '/uploads/20200512/54b51dd79e426cbbb6bf25d34fd4c355.jpg', '5', '266', '0', '15918364696', '95865eb8bec61de07', '2020-05-12 11:40:02', '1', '北京工艺美院革委会海报-全世界无产阶级联合起来打到美帝国主义');
INSERT INTO `goods` VALUES ('16', '革委会海报', '北京工艺美院革委会海报', '6', '22.90', '/uploads/20200512/54b51dd79e426cbbb6bf25d34fd4c355.jpg,/uploads/20200512/54b51dd79e426cbbb6bf25d34fd4c355.jpg', '5', '358', '0', '15918364696', '81305eb8beebd9ab5', '2020-05-12 11:40:02', '1', '北京工艺美院革委会海报-全世界无产阶级联合起来打到美帝国主义');
INSERT INTO `goods` VALUES ('17', '革委会海报', '北京工艺美院革委会海报', '6', '22.90', '/uploads/20200512/54b51dd79e426cbbb6bf25d34fd4c355.jpg,/uploads/20200512/54b51dd79e426cbbb6bf25d34fd4c355.jpg', '5', '0', '0', '15918364696', '81305eb8beebd9ab5', '2020-05-12 11:40:02', '2', '北京工艺美院革委会海报-全世界无产阶级联合起来打到美帝国主义');
INSERT INTO `goods` VALUES ('18', '宋代智能手机', null, '4', '998.00', '/uploads/20200513/ed0b514bbfcacff0809324fa5f893d5c.jpg,/uploads/20200513/fa450bd6873968231e2259c2fcd6741d.jpg', '10', '0', '0', '15599661793', '95865eb8bec61de07', '2020-05-13 11:40:02', '1', '这既是简介');
INSERT INTO `goods` VALUES ('19', '革委会海报', '北京工艺美院革委会海报', '6', '22.90', '/uploads/20200512/54b51dd79e426cbbb6bf25d34fd4c355.jpg,/uploads/20200512/54b51dd79e426cbbb6bf25d34fd4c355.jpg', '5', '0', '0', '15918364696', '81305eb8beebd9ab5', '2020-05-12 11:40:02', '1', '北京工艺美院革委会海报-全世界无产阶级联合起来打到美帝国主义');
INSERT INTO `goods` VALUES ('20', '明代智能手机', null, '4', '998.00', '/uploads/20200513/24a1adfbb05ae9a9222d4963390da21a.jpg,/uploads/20200513/124f965714f9d4966ade38b3132c31e2.jpg', '10', '0', '0', '18801057371', '95865eb8bec61de07', '2020-05-13 18:08:51', '0', '我大明天下无敌啊');
INSERT INTO `goods` VALUES ('21', '明代智能手机', null, '4', '998.00', '/uploads/20200513/1c44af6a38bffde45fddd6cb6f9f158a.jpg,/uploads/20200513/f1ee164a0fa646619fe5b704a398cbab.jpg', '10', '0', '0', '18801057371', '95865eb8bec61de07', '2020-05-13 18:09:46', '0', '我大明天下无敌啊');

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
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `comment` text COMMENT '鉴定结果',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of identify
-- ----------------------------
INSERT INTO `identify` VALUES ('1', '张三', '18801057596', 'xiaoli02', '鉴定鉴定鉴定鉴定鉴定鉴定', '/uploads/696.txt', '2020-04-24 14:27:06', '1', '<div style=\"text-align: center;\"><b>如假包换</b></div><hr><div style=\"text-align: center;\"><b><br></b></div>');
INSERT INTO `identify` VALUES ('2', '张三', '18801057596', 'xiaoli02', '鉴定', '/uploads/696.txt', '2020-04-24 14:27:06', '1', '00001 00010 00100 01000 10000');
INSERT INTO `identify` VALUES ('3', '张三', '18801057596', 'xiaoli02', '鉴定2', '/uploads/696.txt', '2020-04-24 14:27:06', '1', '<p>大大所多多所大所多</p>');
INSERT INTO `identify` VALUES ('4', '张三', '18801057596', 'xiaoli02', '鉴定3', '/uploads/696.txt', '2020-04-24 14:27:06', '1', '<p>鉴定完毕假的</p>');
INSERT INTO `identify` VALUES ('5', '张三', '18801057596', 'xiaoli02', '鉴定4', '/uploads/696.txt', '2020-04-24 14:27:06', '0', '00001 00010 00100 01000 10000');
INSERT INTO `identify` VALUES ('6', '张某', '12236663666', '5555', '水电费水电费', '/uploads/20200508/e05c70a045af7264f0bc144bfbff1a18.rar	', '2020-05-08 14:25:04', '0', null);
INSERT INTO `identify` VALUES ('7', '张某', '12236663666', '的说法', '测试附件', '/uploads/20200508/60ae50bc996855de67408045d9369f51.docx', '2020-05-08 14:57:46', '1', '<p>才疏学浅</p>');

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
  `goods_image` varchar(255) DEFAULT NULL COMMENT '商品图片',
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
  `id_images` varchar(255) NOT NULL COMMENT '身份证正反面',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '当前状态',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of real_name
-- ----------------------------
INSERT INTO `real_name` VALUES ('1', '王某', '130430145310112118', '18569647201', 'xiaowa10', '../../uploads/log.png,../../uploads/log.png', '2020-04-26 17:27:18', '2', 'test');
INSERT INTO `real_name` VALUES ('2', '张某', '15166118960325211X', '15599661793', 'lopll10', '/uploads/20200430/07524b120ff7288fd7f0b4c5160da7e8.jpg,/uploads/20200430/049abffc2beb4ce171f639605907045f.jpg', '2020-04-30 15:28:51', '1', '测试一下');
INSERT INTO `real_name` VALUES ('3', '金馆长', '13043019980612217X', '18801057371', '95865eb8bec61de07', '/uploads/20200512/3beb8627feae826c9716d621b812bd16.png,/uploads/20200512/f6cb63a312974f73bc7cfa36857ba675.png', '2020-05-12 18:08:34', '2', null);
INSERT INTO `real_name` VALUES ('4', '金馆长', '13043019980612217X', '18801057371', '95865eb8bec61de07', '/uploads/20200513/1e54e90377ad4a9780ad73de6532fa2a.png,/uploads/20200513/77f420da74d572351cc52d888cc93024.png', '2020-05-13 09:43:15', '1', null);
INSERT INTO `real_name` VALUES ('5', '林某万', '13043019980612217X', '18801053084', '81305eb8beebd9ab5', '/uploads/20200513/0da0429e5682259a3648046d8be99810.png,/uploads/20200513/f879e75c865ee548947b363de9ea4da5.png', '2020-05-13 11:17:07', '0', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_key` varchar(25) CHARACTER SET armscii8 DEFAULT NULL COMMENT '佳藏号',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `tel` char(11) DEFAULT NULL COMMENT '手机',
  `level` tinyint(1) DEFAULT '0' COMMENT '会员级别',
  `money` float(11,2) DEFAULT '0.00' COMMENT '余额',
  `pending` float(11,2) DEFAULT '0.00' COMMENT '待结算金额',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `id_number` char(18) DEFAULT NULL COMMENT '身份证',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `last_time` datetime DEFAULT NULL COMMENT '最后登录',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '95865eb8bec61de07', 'xiaoli', '18801057371', '0', '0.00', '0.00', '金馆长', '13043019980612217X', '2020-05-09 16:06:00', '2020-05-13 17:03:24', '0', null, 'dc483e80a7a0bd9ef71d8cf973673924');
INSERT INTO `users` VALUES ('2', '81305eb8beebd9ab5', 'Lin', '18801053084', '0', '0.00', '0.00', null, null, '2020-05-09 16:06:30', '2020-05-13 11:14:52', '0', null, 'dc483e80a7a0bd9ef71d8cf973673924');
INSERT INTO `users` VALUES ('4', '27015eb8bef396c67', 'dc483e80a7a0bd9ef71d8cf973673924', '18801053086', '0', '0.00', '0.00', null, null, '2020-05-09 16:51:42', '2020-05-11 18:24:59', '0', null, 'dc483e80a7a0bd9ef71d8cf973673924');
INSERT INTO `users` VALUES ('5', '48905eb8cabeccbc5', 'dc483e80a7a0bd9ef71d8cf973673924', '15966693265', '0', '0.00', '0.00', null, null, '2020-05-11 11:47:10', null, '0', null, 'dc483e80a7a0bd9ef71d8cf973673924');

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
  `user_key` varchar(50) DEFAULT NULL COMMENT '佳藏号',
  `money` float(11,2) NOT NULL COMMENT '提现金额',
  `poundage` float(11,2) NOT NULL COMMENT '手续费',
  `actual_money` float(11,2) NOT NULL COMMENT '实际到账',
  `cash_account` varchar(19) NOT NULL COMMENT '提现账户',
  `wdr_time` datetime NOT NULL COMMENT '提现时间',
  `tel` char(11) NOT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`wdr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of withdrawals
-- ----------------------------
INSERT INTO `withdrawals` VALUES ('1', '张三', '130430200010112117', 'xiaoli02', '200.00', '20.00', '180.00', '15900000', '2020-04-22 09:23:36', '18801057371', '1', '暂无简介');
INSERT INTO `withdrawals` VALUES ('2', '李四', '15340319850813', 'xiaosun02', '200.00', '20.00', '180.00', '15900000', '2020-04-22 09:23:36', '15360785590', '2', '暂无简介');
INSERT INTO `withdrawals` VALUES ('3', '王五', '15340319850813', 'xiao0', '200.00', '20.00', '180.00', '15900000', '2020-04-22 09:23:36', '15360785590', '1', '暂无简介');
