/*
Navicat MySQL Data Transfer

Source Server         : docker-mysql-db
Source Server Version : 50636
Source Host           : 192.168.99.100:3306
Source Database       : oeynet_client_bbs

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-07-16 16:41:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oeynet_admin
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_admin`;
CREATE TABLE `oeynet_admin` (
  `uid` int(11) NOT NULL COMMENT 'user_id',
  `type` int(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_root` int(255) NOT NULL DEFAULT '0' COMMENT '是否是管理员',
  PRIMARY KEY (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `oeynet_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oeynet_admin
-- ----------------------------
INSERT INTO `oeynet_admin` VALUES ('1', '1', '无敌站长', '1');

-- ----------------------------
-- Table structure for oeynet_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_auth_group`;
CREATE TABLE `oeynet_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `mark` varchar(255) DEFAULT NULL,
  `rules` varchar(1000) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oeynet_auth_group
-- ----------------------------
INSERT INTO `oeynet_auth_group` VALUES ('1', '站长组', '1970', '1', '', '1,2,3,4,5,1,12,13,15,22,21,10,11,26,24,14,23');
INSERT INTO `oeynet_auth_group` VALUES ('2', '游客权限', '1970', '1', '', '19,25,20,27');
INSERT INTO `oeynet_auth_group` VALUES ('3', '普通用户组', '1970', '1', '', '19,25,20,24,27,31,28,32,30,29,33,34');
INSERT INTO `oeynet_auth_group` VALUES ('4', '首页访问测试', '1970', '1', '', '19,24');
INSERT INTO `oeynet_auth_group` VALUES ('5', '管理员', '1970', '1', '3、管理员需求权限组', '13,35,36,23,37,8,9,16,42,41,44,45,48,49,46');

-- ----------------------------
-- Table structure for oeynet_auth_logs
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_auth_logs`;
CREATE TABLE `oeynet_auth_logs` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_auth_logs
-- ----------------------------

-- ----------------------------
-- Table structure for oeynet_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_auth_rule`;
CREATE TABLE `oeynet_auth_rule` (
  `id` mediumint(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(11) NOT NULL DEFAULT '0',
  `auth_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:menu,2:buttom,3:hidden',
  `title` char(20) NOT NULL DEFAULT '',
  `rule` varchar(255) NOT NULL COMMENT '支持url函数调用生成url',
  `module` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oeynet_auth_rule
-- ----------------------------
INSERT INTO `oeynet_auth_rule` VALUES ('1', '0', '1', '权限管理', '', 'admin', 'auth', 'index', '999', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('3', '1', '1', '权限菜单', 'admin/auth/authrule', 'admin', 'auth', 'authrule', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('4', '0', '1', '用户管理', '', 'admin', '', '', '998', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('5', '4', '1', '用户列表', 'admin/user.user/userList', 'admin', 'user.user', 'userList', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('6', '0', '1', '系统设置', '', 'admin', '', '', '1000', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('7', '6', '1', '友情链接', 'admin/system.config/friendLinks', 'admin', 'system.config', 'friendLinks', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('8', '0', '1', '内容管理', '', 'admin', '', '', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('9', '0', '1', '网站附件', '', 'admin', '', '', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('10', '6', '1', '全局配置', 'admin/system.config/index', 'admin', 'system.config', 'index', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('11', '6', '1', '大数据', 'admin/system.analyze/show', 'admin', 'system.analyze', 'show', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('13', '8', '1', '帖子管理', 'admin/bbs.post/postlist', 'admin', 'bbs.post', 'postlist', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('14', '4', '1', '小黑屋', 'admin/user.user/userlist?status=0', 'admin', 'user.user', 'userlist', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('15', '8', '1', '栏目管理', 'admin/bbs.category/index', 'admin', 'bbs.category', 'index', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('16', '9', '1', '文件管理', 'admin/bbs.file/index', 'admin', 'bbs.file', 'index', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('17', '9', '0', '图片管理', 'admin/bbs.picture/index', 'admin', 'bbs.picture', 'index', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('18', '2', '1', '控制台', 'admin/index/dashboard', 'admin', 'index', 'dashboard', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('19', '0', '1', '论坛首页', 'index/index/index', 'index', 'index', 'index', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('20', '0', '1', '网站附件', 'index/attach.file/index', 'index', 'attach.file', 'index', '2', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('21', '8', '1', '评论管理', 'admin/bbs.comment/comments', 'admin', 'bbs.comment', 'comments', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('22', '1', '1', '用户组', 'admin/auth/authgroup', 'admin', 'auth', 'authgroup', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('23', '13', '0', '获取帖子数据', 'admin/bbs.post/getlist', 'admin', 'bbs.post', 'getlist', '0', '0');
INSERT INTO `oeynet_auth_rule` VALUES ('24', '0', '0', '我的附件', 'index/user.attach/index', 'index', 'user.attach', 'index', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('41', '9', '0', '获取文件附件', 'admin/bbs.file/getlist', 'admin', 'bbs.file', 'getlist', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('27', '0', '0', '帖子详情', 'index/bbs.post/detail', 'index', '/bbs.post', 'detail', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('28', '0', '0', '发表帖子', 'index/bbs.post/post', 'index', 'bbs.post', 'post', '1', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('29', '0', '0', '帖子回复', 'index/bbs.post/comment', 'index', 'bbs.post', 'comment', '1', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('30', '0', '0', '个人资料', 'index/user.profile/index', 'index', 'user.profile', 'index', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('31', '0', '0', '更新个人资料权限', 'index/user.profile/upprofile', 'index', 'user.profile', 'upprofile', '1', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('32', '0', '0', '重置密码', 'index/user.profile/resetpwd', 'index', 'user.profile', 'resetpwd', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('33', '0', '0', '附件购买', 'index/attach.file/buy', 'index', 'attach.file', 'buy', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('34', '0', '0', '附件下载', 'index/attach.file/download', 'index', 'attach.file', 'download', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('35', '0', '0', '后台首页', 'admin/index/index', 'admin', 'index', 'index', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('36', '15', '0', '获取栏目数据', 'admin/bbs.category/getcategory', 'admin', 'bbs.category', 'getcategory', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('37', '13', '0', '编辑帖子数据', 'admin/bbs.post/addedit', 'admin', 'bbs.post', 'addedit', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('38', '13', '0', '删除帖子数据', 'admin/bbs.post/del', 'admin', 'bbs.post', 'del', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('39', '15', '0', '编辑栏目数据', 'admin/bbs.category/addedit', 'admin', 'bbs.category', 'addedit', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('40', '15', '0', '删除栏目数据', 'admin/bbs.category/del', 'admin', 'bbs.category', 'del', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('42', '9', '0', '编辑文件附件', 'admin/bbs.file/addedit', 'admin', 'bbs.file', 'addedit', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('43', '9', '0', '删除文件附件', 'admin/bbs.file/del', 'admin', 'bbs.file', 'del', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('44', '9', '0', '审核文件附件', 'admin/bbs.file/changestatus', 'admin', 'bbs.file', 'changestatus', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('45', '13', '0', '审核帖子数据', 'admin/bbs.post/changestatus', 'admin', 'bbs.post', 'changestatus', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('46', '21', '0', '获取评论数据', 'admin/bbs.comment/getlist', 'admin', 'bbs.comment', 'getlist', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('47', '21', '0', '编辑评论数据', 'admin/bbs.comment/addedit', 'admin', 'bbs.comment', 'addedit', '0', '0');
INSERT INTO `oeynet_auth_rule` VALUES ('48', '21', '0', '删除评论数据', 'admin/bbs.comment/del', 'admin', 'bbs.comment', 'del', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('49', '21', '0', '审核评论数据', 'admin/bbs.comment/changestatus', 'admin', 'bbs.comment', 'changestatus', '0', '1');
INSERT INTO `oeynet_auth_rule` VALUES ('50', '6', '1', '用户等级', 'admin/system.userlevel/userlevel', 'admin', 'system.userlevel', 'userlevel', '0', '1');

-- ----------------------------
-- Table structure for oeynet_auth_user_group
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_auth_user_group`;
CREATE TABLE `oeynet_auth_user_group` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  `sort` int(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oeynet_auth_user_group
-- ----------------------------
INSERT INTO `oeynet_auth_user_group` VALUES ('1', '1', '0');
INSERT INTO `oeynet_auth_user_group` VALUES ('61', '2', '0');
INSERT INTO `oeynet_auth_user_group` VALUES ('62', '3', '0');
INSERT INTO `oeynet_auth_user_group` VALUES ('0', '3', '0');
INSERT INTO `oeynet_auth_user_group` VALUES ('1', '4', '0');
INSERT INTO `oeynet_auth_user_group` VALUES ('1', '3', '0');
INSERT INTO `oeynet_auth_user_group` VALUES ('1', '2', '0');
INSERT INTO `oeynet_auth_user_group` VALUES ('61', '3', '0');
INSERT INTO `oeynet_auth_user_group` VALUES ('61', '5', '0');
INSERT INTO `oeynet_auth_user_group` VALUES ('63', '3', '0');

-- ----------------------------
-- Table structure for oeynet_bbs_attach
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_bbs_attach`;
CREATE TABLE `oeynet_bbs_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_attach
-- ----------------------------

-- ----------------------------
-- Table structure for oeynet_bbs_attach_buy
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_bbs_attach_buy`;
CREATE TABLE `oeynet_bbs_attach_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `attach_id` int(11) NOT NULL,
  `pay_type` int(11) NOT NULL,
  `pay_amount` decimal(10,2) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_attach_buy
-- ----------------------------
INSERT INTO `oeynet_bbs_attach_buy` VALUES ('17', '61', '28', '0', '0.00', '1500176807');
INSERT INTO `oeynet_bbs_attach_buy` VALUES ('18', '1', '29', '0', '0.00', '1500177414');
INSERT INTO `oeynet_bbs_attach_buy` VALUES ('19', '1', '30', '0', '0.00', '1500178236');
INSERT INTO `oeynet_bbs_attach_buy` VALUES ('20', '61', '30', '0', '0.00', '1500181354');
INSERT INTO `oeynet_bbs_attach_buy` VALUES ('21', '62', '30', '0', '0.00', '1500183914');

-- ----------------------------
-- Table structure for oeynet_bbs_category
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_bbs_category`;
CREATE TABLE `oeynet_bbs_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mark` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_category
-- ----------------------------
INSERT INTO `oeynet_bbs_category` VALUES ('10', '人物情感', '人物情感', '0', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('11', '动物世界', '', '0', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('21', '法治社会', '', '2', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('25', '生活健康', '1234123', '2123', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('26', '小明', '', '23', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('27', '草泥马', '1232', '22', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('28', '嘿咻嘿咻', '', '2', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('29', '小道消息', '小道消息小道消息小道消息', '22', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('30', 'hellowlrd', '', '22', '1');

-- ----------------------------
-- Table structure for oeynet_bbs_comment
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_bbs_comment`;
CREATE TABLE `oeynet_bbs_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_comment
-- ----------------------------
INSERT INTO `oeynet_bbs_comment` VALUES ('69', '0', '0', '1', '<p>请您填写发帖内容</p>', '1500089250', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('70', '0', '50', '1', '<p>请您填写发帖内容</p>', '1500089303', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('71', '0', '50', '1', '<p>请您填写发帖内容</p>', '1500089879', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('72', '0', '50', '1', '<p>简直就是畜生</p>', '1500090381', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('73', '0', '50', '1', '<p>简直就是畜生</p>', '1500090392', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('74', '0', '50', '1', '<p>哈哈哈无敌醉了</p>', '1500090512', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('75', '0', '44', '1', '<p>&lt;!--StartFragment--&gt;请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您', '1500091185', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('76', '0', '44', '1', '<p>&lt;!--StartFragment--&gt;请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您', '1500091199', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('77', '0', '44', '1', '<p>&lt;!--StartFragment--&gt;请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您', '1500091219', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('78', '0', '44', '1', '<p>&lt;!--StartFragment--&gt;填写发帖内容请您填写发帖内容请您填写发&lt;!--EndFragment--&gt;  <br></p>', '1500091233', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('79', '0', '44', '1', '<h1>Are youOK？</h1><p><br></p>', '1500091252', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('80', '0', '44', '1', '<h1>我不是只是针对你，我是说在座的所有人都是SB</h1><p><br></p><p>', '1500091429', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('81', '0', '44', '1', '&lt;h1&gt;我不是只是针对你，我是说在座的所有人都是SB&lt;/h1&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;!--StartFragment--&gt;&lt;!--EndFragment--&gt;&lt;/p&gt;&lt;p&gt;', '1500091460', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('82', '0', '44', '1', '&lt;h1&gt;我不是只是针对你，我是说在座的所有人都是SB&lt;/h1&gt;&lt;p&gt;&lt;b&gt;​&lt;/b&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;!--StartFragment--&gt;&lt;!--EndFragment--&gt;&lt;/p&gt;&lt;p&gt;', '1500091476', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('83', '0', '44', '1', '&lt;h1&gt;阿斯达斯', '1500091487', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('84', '0', '44', '1', '<p>&lt;!--StartFragment--&gt;&lt;!--EndFragment--&gt;</p><h1><span >', '1500091510', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('85', '0', '44', '1', '<h1>123123123', '1500091530', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('86', '0', '44', '1', '<p>', '1500091560', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('87', '0', '44', '1', '<p>', '1500091628', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('88', '0', '44', '1', '<h1>11</h1>', '1500091636', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('89', '0', '44', '1', '<p><img src=\"https://box.kancloud.cn/6f2963cef6b00ecb8a5d70ccbfc83833\" ><br></p>', '1500091740', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('90', '0', '44', '1', '<blockquote>123123123</blockquote>', '1500091748', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('91', '0', '44', '1', '<h1><p>## PSR公认规范总结\n<br>\n<br>##### PSR规范中文版(大部分来源google翻译)(cn)\n<br>部分psr包含例子，附录包含了一些规范的实现\n<br>\n<br>- [PSR-1：基本编码标准](https://github.com/zhaojunlike/php-psr-chinese/blob/master/psr-1/README.md)\n<br>- [PSR-2：编码风格指南](https://github.com/zhaojunlike/php-psr-chinese/blob/master/psr-2/README.md)\n<br>- [PSR-3：日志接口规范](https://github.com/zhaojunlike/php-psr-chinese/blob/master/psr-3/README.md)\n<br>- [PSR-4：自动加载规范](https://github.com/zhaojunlike/php-psr-chinese/blob/master/psr-4/README.md)\n<br>\n<br>\n<br>loa', '1500091784', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('92', '0', '44', '1', '<p>## PSR公认规范总结\n\n##### PSR规范中文版(大部分来源google翻译)(cn)\n部分psr包含例子，附录包含了一些规范的实现\n\n- [PSR-1：基本编码标准](https://github.com/zhaojunlike/php-psr-chinese/blob/master/psr-1/README.md)\n- [PSR-2：编码风格指南](https://github.com/zhaojunlike/php-psr-chinese/blob/master/psr-2/README.md)\n- [PSR-3：日志接口规范](https://github.com/zhaojunlike/php-psr-chinese/blob/master/psr-3/README.md)\n- [PSR-4：自动加载规范](https://github.com/zhaojunlike/php-psr-chinese/blob/master/psr-4/README.md)\n\n\nloading.....\n\n##### PSR规范英文版(en)\n\n- [PSR-1：Basic Co', '1500091801', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('93', '0', '44', '1', '<p>## PSR公认规范总结\n\n##### PSR规范中文版(大部分来源google翻译)(cn)\n部分psr包含例子，附录包含了一些规范的实现\n\n- [PSR-1：基本编码标准](https://github.com/zhaojunlike/php-psr-chinese/blob/master/psr-1/README.md)\n- [PSR-2：编码风格指南](https://github.com/zhaojunlike/php-psr-chinese/blob/master/psr-2/README.md)\n- [PSR-3：日志接口规范](https://github.com/zhaojunlike/php-psr-chinese/blob/master/psr-3/README.md)\n- [PSR-4：自动加载规范](https://github.com/zhaojunlike/php-psr-chinese/blob/master/psr-4/README.md)\n\n\nloading.....\n\n##### PSR规范英文版(en)\n\n- [PSR-1：Basic Co', '1500091809', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('94', '0', '47', '1', '<p>1341234</p>', '1500114345', '0', '0');
INSERT INTO `oeynet_bbs_comment` VALUES ('95', '0', '47', '1', '<p>123412</p>', '1500114352', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('96', '0', '50', '2', '<p>13413</p>', '1500114512', '0', '0');
INSERT INTO `oeynet_bbs_comment` VALUES ('97', '0', '48', '2', '<p>呵呵呵啊</p>', '1500114533', '0', '0');
INSERT INTO `oeynet_bbs_comment` VALUES ('98', '0', '50', '2', '<p>草泥马</p>', '1500114545', '0', '0');
INSERT INTO `oeynet_bbs_comment` VALUES ('100', '0', '50', '61', '<p>23452345234<br></p>', '1500176354', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('101', '0', '50', '62', '<p>小君子</p>', '1500183938', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('102', '0', '41', '1', '<p>245245</p>', '1500188296', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('103', '0', '41', '1', '<p>345245</p>', '1500188313', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('104', '0', '41', '1', '<p>345245</p>', '1500188315', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('105', '0', '41', '1', '<p>345245</p>', '1500188317', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('106', '0', '41', '1', '<p>345245</p>', '1500188327', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('107', '0', '41', '1', '<p>3563456</p>', '1500188331', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('108', '0', '41', '1', '<p>34563456</p>', '1500188334', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('109', '0', '41', '1', '<p>5678</p>', '1500188343', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('110', '0', '41', '1', '<p>36345635</p>', '1500188348', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('111', '0', '41', '1', '<p>1341234</p>', '1500188354', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('112', '0', '41', '1', '<p>1341234</p>', '1500188356', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('113', '0', '41', '1', '<p>134</p>', '1500188358', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('114', '0', '41', '1', '<p>134</p>', '1500188360', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('115', '0', '41', '1', '<p>134</p>', '1500188361', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('116', '0', '41', '1', '<p>134</p>', '1500188363', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('117', '0', '41', '1', '<p>13</p>', '1500188364', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('118', '0', '41', '1', '<p>13</p>', '1500188366', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('119', '0', '41', '1', '<p>12341234</p>', '1500188368', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('120', '0', '41', '1', '<p>1234134</p>', '1500188372', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('121', '0', '41', '1', '<p>134134</p>', '1500188377', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('122', '0', '41', '1', '<p>12341234</p>', '1500188381', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('123', '0', '41', '1', '<p>134123</p>', '1500188384', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('124', '0', '41', '1', '<p>2345245</p>', '1500188389', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('125', '0', '41', '1', '<p>356356</p>', '1500188392', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('126', '0', '40', '1', '<p>123412341234</p>', '1500188984', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('127', '0', '51', '1', '<p>1234</p>', '1500189921', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('128', '0', '51', '1', '<p>123</p>', '1500190018', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('129', '0', '51', '63', '<p>12341234</p>', '1500191838', '0', '1');
INSERT INTO `oeynet_bbs_comment` VALUES ('130', '0', '52', '63', '<p>&lt;!--StartFragment--&gt;请您填写发帖内容123412341341&lt;!--EndFragment--&gt; 请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341 </p>', '1500191954', '0', '1');

-- ----------------------------
-- Table structure for oeynet_bbs_file
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_bbs_file`;
CREATE TABLE `oeynet_bbs_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `desc` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `local_path` varchar(255) CHARACTER SET utf8 NOT NULL,
  `md5` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `view_count` int(11) NOT NULL DEFAULT '0',
  `download_count` int(11) NOT NULL DEFAULT '0',
  `size` double DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `path_type` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `need_score` int(11) NOT NULL DEFAULT '0' COMMENT '需要积分',
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_file
-- ----------------------------
INSERT INTO `oeynet_bbs_file` VALUES ('30', 'desktop-2.png', null, '1500177409', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/storage/files/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_file` VALUES ('31', 'desktop-2.png', '', '1500183632', '1500183687', 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/storage/files/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', 'file', 'image/png', '0', '0');

-- ----------------------------
-- Table structure for oeynet_bbs_picture
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_bbs_picture`;
CREATE TABLE `oeynet_bbs_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `desc` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `local_path` varchar(255) CHARACTER SET utf8 NOT NULL,
  `md5` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `view_count` int(11) NOT NULL DEFAULT '0',
  `download_count` int(11) NOT NULL DEFAULT '0',
  `size` double DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `path_type` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `need_score` int(11) NOT NULL DEFAULT '0' COMMENT '需要积分',
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_picture
-- ----------------------------
INSERT INTO `oeynet_bbs_picture` VALUES ('4', '1.png', null, '1500002858', '0', '8b/8ea9675b7e09377e7fc04d66f7413c.png', '/app/webroot/storage/files/8b/8ea9675b7e09377e7fc04d66f7413c.png', '8b8ea9675b7e09377e7fc04d66f7413c', '0', '0', '0', '84204', 'png', '1', 'file', 'image/png', '100', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('5', 'xmindshell.dll', null, '1500002864', '0', '06/464d341a0b2efeaf46a886b25bce10.dll', '/app/webroot/storage/files/06/464d341a0b2efeaf46a886b25bce10.dll', '06464d341a0b2efeaf46a886b25bce10', '0', '0', '0', '53248', 'dll', '1', 'file', 'application/x-msdownload', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('7', 'unins000.dat', null, '1500002966', '0', '2c/2a6de5c1c474e100df19f29ba992ef.dat', '/app/webroot/storage/files/2c/2a6de5c1c474e100df19f29ba992ef.dat', '2c2a6de5c1c474e100df19f29ba992ef', '0', '0', '0', '1088361', 'dat', '0', 'file', 'application/octet-stream', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('8', 'desktop-1.png', null, '1500002969', '0', 'd1/4ff186d842ce54b7a81aff5879b70c.png', '/app/webroot/storage/files/d1/4ff186d842ce54b7a81aff5879b70c.png', 'd14ff186d842ce54b7a81aff5879b70c', '0', '0', '0', '4049588', 'png', '0', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('9', 'desktop-1.png', null, '1500002981', '0', 'd1/4ff186d842ce54b7a81aff5879b70c.png', '/app/webroot/storage/files/d1/4ff186d842ce54b7a81aff5879b70c.png', 'd14ff186d842ce54b7a81aff5879b70c', '0', '0', '0', '4049588', 'png', '0', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('10', 'desktop-1.png', null, '1500003028', '0', 'd1/4ff186d842ce54b7a81aff5879b70c.png', '/app/webroot/storage/files/d1/4ff186d842ce54b7a81aff5879b70c.png', 'd14ff186d842ce54b7a81aff5879b70c', '0', '0', '0', '4049588', 'png', '0', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('11', 'desktop-1.png', null, '1500003069', '0', 'd1/4ff186d842ce54b7a81aff5879b70c.png', '/app/webroot/storage/files/d1/4ff186d842ce54b7a81aff5879b70c.png', 'd14ff186d842ce54b7a81aff5879b70c', '0', '0', '0', '4049588', 'png', '0', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('12', 'desktop-1.png', 'hello world', '1500003185', '1500022736', 'd1/4ff186d842ce54b7a81aff5879b70c.png', '/app/webroot/storage/files/d1/4ff186d842ce54b7a81aff5879b70c.png', 'd14ff186d842ce54b7a81aff5879b70c', '0', '0', '0', '4049588', 'png', '0', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('13', 'desktop-2.png', '4567', '1500003189', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/storage/files/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '33', '0', '0', '213352', 'png', '1', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('15', 'www (1).rar.xltd.cfg', '234523', '2017', '0', '3d/d9ad9cebe50c73007802ad7bfb86f3.cfg', '/app/webroot/storage/files/3d/d9ad9cebe50c73007802ad7bfb86f3.cfg', '3dd9ad9cebe50c73007802ad7bfb86f3', '0', '0', '0', '4096', 'cfg', '1', 'file', 'application/octet-stream', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('16', 'php5.6-stable.tar.gz', '12341234', '2017', '0', '40/d4939e116c46cec0a486e2fab7c8b0.gz', '/app/webroot/storage/files/40/d4939e116c46cec0a486e2fab7c8b0.gz', '40d4939e116c46cec0a486e2fab7c8b0', '0', '0', '0', '19288947', 'gz', '1', 'file', 'application/gzip', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('17', 'php5.6-sta222', '', '2017', '0', '40/d4939e116c46cec0a486e2fab7c8b0.gz', '/app/webroot/storage/files/40/d4939e116c46cec0a486e2fab7c8b0.gz', '40d4939e116c46cec0a486e2fab7c8b0', '0', '0', '0', '19288947', 'gz', '1', 'file', 'application/gzip', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('18', 'php5.6-stable.tar.gz', '234', '2017', '0', '40/d4939e116c46cec0a486e2fab7c8b0.gz', '/app/webroot/storage/files/40/d4939e116c46cec0a486e2fab7c8b0.gz', '40d4939e116c46cec0a486e2fab7c8b0', '0', '0', '0', '19288947', 'gz', '1', 'file', 'application/gzip', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('19', 'desktop-1.png', null, '1500081547', null, 'd1/4ff186d842ce54b7a81aff5879b70c.png', '/app/webroot/storage/files/d1/4ff186d842ce54b7a81aff5879b70c.png', 'd14ff186d842ce54b7a81aff5879b70c', '0', '0', '0', '4049588', 'png', '1', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('20', 'desktop-2.png', null, '1500081631', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/storage/files/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('21', 'desktop-2.png', null, '1500081638', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/storage/files/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('22', 'desktop-1.png', null, '1500081646', null, 'd1/4ff186d842ce54b7a81aff5879b70c.png', '/app/webroot/storage/files/d1/4ff186d842ce54b7a81aff5879b70c.png', 'd14ff186d842ce54b7a81aff5879b70c', '0', '0', '0', '4049588', 'png', '1', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('23', 'desktop-2.png', null, '1500081649', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/storage/files/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('24', 'desktop-1.png', null, '1500081668', null, 'd1/4ff186d842ce54b7a81aff5879b70c.png', '/app/webroot/storage/files/d1/4ff186d842ce54b7a81aff5879b70c.png', 'd14ff186d842ce54b7a81aff5879b70c', '0', '0', '0', '4049588', 'png', '1', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('25', 'desktop-2.png', null, '1500081670', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/storage/files/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('26', 'desktop-1.png', null, '1500081673', null, 'd1/4ff186d842ce54b7a81aff5879b70c.png', '/app/webroot/storage/files/d1/4ff186d842ce54b7a81aff5879b70c.png', 'd14ff186d842ce54b7a81aff5879b70c', '0', '0', '0', '4049588', 'png', '1', 'file', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('27', 'QQ截图20170715092355.png', null, '1500081976', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('28', 'QQ截图20170715092355.png', null, '1500081998', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('29', 'QQ截图20170715092355.png', null, '1500082076', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('30', 'QQ截图20170715092355.png', null, '1500082131', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '0');
INSERT INTO `oeynet_bbs_picture` VALUES ('31', 'QQ截图20170715092355.png', null, '1500082251', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('32', 'QQ截图20170715092355.png', null, '1500082272', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('33', 'QQ截图20170715092355.png', null, '1500082342', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('34', 'QQ截图20170715092355.png', null, '1500082381', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('35', 'QQ截图20170715092355.png', null, '1500082410', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('36', 'QQ截图20170715092355.png', null, '1500082422', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('37', 'QQ截图20170715092355.png', null, '1500082434', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('38', 'QQ截图20170715092355.png', null, '1500082461', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('39', 'QQ截图20170715092355.png', null, '1500082508', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('40', 'QQ截图20170715092355.png', null, '1500082536', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('41', 'QQ截图20170715092355.png', null, '1500082586', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('42', 'QQ截图20170715092355.png', null, '1500082626', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('43', 'QQ截图20170715092355.png', null, '1500082689', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('44', 'QQ截图20170715092355.png', null, '1500082713', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('45', 'QQ截图20170715092355.png', null, '1500082721', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('46', 'QQ截图20170715092355.png', null, '1500082762', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('47', 'QQ截图20170715092355.png', null, '1500082791', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('48', 'QQ截图20170715092355.png', null, '1500082825', null, '3d/e9f957323dfb612dc5345e33b80dbb.png', '/app/webroot/public/upload/head/3d/e9f957323dfb612dc5345e33b80dbb.png', '3de9f957323dfb612dc5345e33b80dbb', '0', '0', '0', '388', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('49', '1.png', null, '1500084585', null, '64/fa4cbef0318e5d4bfc3139836f5065.png', '/app/webroot/public/upload/head/64/fa4cbef0318e5d4bfc3139836f5065.png', '64fa4cbef0318e5d4bfc3139836f5065', '0', '0', '0', '148001', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('50', '1.png', null, '1500084733', null, '64/fa4cbef0318e5d4bfc3139836f5065.png', '/app/webroot/public/upload/head/64/fa4cbef0318e5d4bfc3139836f5065.png', '64fa4cbef0318e5d4bfc3139836f5065', '0', '0', '0', '148001', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('51', '2.png', null, '1500084807', null, 'd8/67e59129e879d405e1bf916b3ad949.png', '/app/webroot/public/upload/head/d8/67e59129e879d405e1bf916b3ad949.png', 'd867e59129e879d405e1bf916b3ad949', '0', '0', '0', '398044', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('52', 'desktop-2.png', null, '1500084953', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/public/upload/head/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('53', 'desktop-2.png', null, '1500084959', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/public/upload/head/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('54', 'desktop-1.png', null, '1500084981', null, 'd1/4ff186d842ce54b7a81aff5879b70c.png', '/app/webroot/public/upload/head/d1/4ff186d842ce54b7a81aff5879b70c.png', 'd14ff186d842ce54b7a81aff5879b70c', '0', '0', '0', '4049588', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('55', 'desktop-2.png', null, '1500114521', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/public/upload/head/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', '', 'image/png', '0', '2');
INSERT INTO `oeynet_bbs_picture` VALUES ('56', 'desktop-2.png', null, '1500176371', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/public/upload/head/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', '', 'image/png', '0', '61');
INSERT INTO `oeynet_bbs_picture` VALUES ('57', 'desktop-2.png', null, '1500177954', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/public/upload/head/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', '', 'image/png', '0', '61');
INSERT INTO `oeynet_bbs_picture` VALUES ('58', 'desktop-2.png', null, '1500177966', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/public/upload/head/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', '', 'image/png', '0', '61');
INSERT INTO `oeynet_bbs_picture` VALUES ('59', 'desktop-2.png', null, '1500178167', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/public/upload/head/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', '', 'image/png', '0', '61');
INSERT INTO `oeynet_bbs_picture` VALUES ('60', 'desktop-2.png', null, '1500178214', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/public/upload/head/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('61', 'desktop-2.png', null, '1500178312', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/public/upload/head/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', '', 'image/png', '0', '1');
INSERT INTO `oeynet_bbs_picture` VALUES ('62', 'desktop-2.png', null, '1500183902', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/public/upload/head/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', '', 'image/png', '0', '62');
INSERT INTO `oeynet_bbs_picture` VALUES ('63', 'desktop-2.png', null, '1500192000', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/public/upload/head/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', '', 'image/png', '0', '63');

-- ----------------------------
-- Table structure for oeynet_bbs_picture-old
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_bbs_picture-old`;
CREATE TABLE `oeynet_bbs_picture-old` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `uid` int(255) NOT NULL,
  `md5` char(32) CHARACTER SET utf8 NOT NULL,
  `root_path` varchar(255) CHARACTER SET utf8 NOT NULL,
  `save_path` varchar(255) CHARACTER SET utf8 NOT NULL,
  `create_time` int(255) NOT NULL,
  `update_time` int(11) NOT NULL,
  `mark` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_picture-old
-- ----------------------------
INSERT INTO `oeynet_bbs_picture-old` VALUES ('1', '1', '', '', '', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for oeynet_bbs_post
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_bbs_post`;
CREATE TABLE `oeynet_bbs_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` text CHARACTER SET utf8,
  `create_time` int(255) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `recommend_count` int(11) NOT NULL DEFAULT '0',
  `like_count` int(11) NOT NULL DEFAULT '0',
  `view_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_post
-- ----------------------------
INSERT INTO `oeynet_bbs_post` VALUES ('40', '10', '1', '请您填写发帖内容', '<p>请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容</p>', '1499843031', null, '0', '0', '2', '1', '0');
INSERT INTO `oeynet_bbs_post` VALUES ('41', '26', '1', '12312341234', '<p>请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容</p>', '1499854260', null, '0', '0', '1', '1', '123123');
INSERT INTO `oeynet_bbs_post` VALUES ('42', '26', '1', '请您填写发帖内容', '<p>请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容</p>', '1499854266', null, '0', '0', '4', '1', '0');
INSERT INTO `oeynet_bbs_post` VALUES ('43', '25', '1', '请您填写发帖内容', '<p>请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容</p>', '1499854272', null, '0', '0', '0', '1', '0');
INSERT INTO `oeynet_bbs_post` VALUES ('44', '10', '1', '请您填写发帖内容', '<p>请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容</p>', '1499854277', null, '0', '0', '1', '1', '0');
INSERT INTO `oeynet_bbs_post` VALUES ('46', '25', '1', '12123', '<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</p>', '1499916512', null, '0', '0', '1', '1', '0');
INSERT INTO `oeynet_bbs_post` VALUES ('48', '10', '1', '12341234123441234123', '<p>请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容</p>', '1500012561', null, '0', '0', '5', '1', '0');
INSERT INTO `oeynet_bbs_post` VALUES ('49', '10', '1', '123123123', '<p>请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123请您填写发帖内容123123</p>', '1500079859', null, '0', '0', '4', '1', '0');
INSERT INTO `oeynet_bbs_post` VALUES ('50', '10', '1', '请您填写发帖内容&quot;&quot;', '<p>请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"请您填写发帖内容\"\"</p>', '1500080981', null, '0', '0', '80', '1', '0');
INSERT INTO `oeynet_bbs_post` VALUES ('51', '10', '1', '123123', '<p>请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容请您填写发帖内容</p>', '1500185367', null, '0', '0', '2', '1', '0');
INSERT INTO `oeynet_bbs_post` VALUES ('52', '11', '63', '请您填写发帖内容123412341341', '<p>请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341请您填写发帖内容123412341341</p>', '1500191948', null, '0', '0', '1', '1', '0');

-- ----------------------------
-- Table structure for oeynet_bbs_tags
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_bbs_tags`;
CREATE TABLE `oeynet_bbs_tags` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_tags
-- ----------------------------

-- ----------------------------
-- Table structure for oeynet_black_home
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_black_home`;
CREATE TABLE `oeynet_black_home` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '小黑屋',
  `create_time` int(11) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_black_home
-- ----------------------------

-- ----------------------------
-- Table structure for oeynet_friend_links
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_friend_links`;
CREATE TABLE `oeynet_friend_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `mark` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_friend_links
-- ----------------------------
INSERT INTO `oeynet_friend_links` VALUES ('2', '成都易猿网络科技科有限责任公司', 'https://oeynet.com', '222', '123123', '1');
INSERT INTO `oeynet_friend_links` VALUES ('3', '43563456356', '1231', '0', '3123', '1');
INSERT INTO `oeynet_friend_links` VALUES ('12', '13413333243', '33', '333', '1234', '1');
INSERT INTO `oeynet_friend_links` VALUES ('13', '13413', '41234', '0', '1234', '1');
INSERT INTO `oeynet_friend_links` VALUES ('14', '13413', '41234', '0', '1234', '1');
INSERT INTO `oeynet_friend_links` VALUES ('15', '13413', '41234', '0', '1234', '1');
INSERT INTO `oeynet_friend_links` VALUES ('16', '13413', '41234', '0', '1234', '1');
INSERT INTO `oeynet_friend_links` VALUES ('17', '13413', '41234', '0', '1234', '1');
INSERT INTO `oeynet_friend_links` VALUES ('20', '2345', '23452345', '0', '2345', '1');
INSERT INTO `oeynet_friend_links` VALUES ('22', '123', '123', '0', '123123', '1');
INSERT INTO `oeynet_friend_links` VALUES ('23', 'test', 'http://oeynet.com', '0', '123123', '1');

-- ----------------------------
-- Table structure for oeynet_system_config
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_system_config`;
CREATE TABLE `oeynet_system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(255) NOT NULL DEFAULT '1',
  `mark` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `type` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_system_config
-- ----------------------------
INSERT INTO `oeynet_system_config` VALUES ('1', '系统名称', 'WEB_SITE_TITLE', '101BBS论坛', '1', '网站显示名', '1970', '0');
INSERT INTO `oeynet_system_config` VALUES ('2', '单页条数', 'SYSTEM_PAGE_LIMIT', '5', '1', '分页单页的显示条', '1970', '0');
INSERT INTO `oeynet_system_config` VALUES ('3', '网站默认SEO描述', 'WEB_SITE_DESC', '101BBS论坛，101BBS论坛，描述', '1', '网站默认SEO描述', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('4', '网站默认SEO关键词', 'WEB_SITE_KEYWORDS', '101BBS论坛，关键词', '1', '网站默认SEO关键词', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('5', '前台单页条数', 'WEB_INDEX_PAGE_LIMIT', '50', '1', '前台单页条数', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('6', '帖子自动审核通过', 'BBS_AUTH_STATUS_TRUE', '1', '1', '帖子自动审核通过（0:关闭,1开启）', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('7', '评论自动审核通过', 'BBS_AUTH_COMMENT_STATUS_TRUE', '1', '1', '评论自动审核通过（0:关闭,1开启）', '1970', '0');
INSERT INTO `oeynet_system_config` VALUES ('8', '默认游客组号', 'SYSTEM_DEFAULT_VIEWER_GROUP_ID', '2', '1', '默认游客组号(游客相关权限)', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('9', '新注册用户默认组别', 'SYSTEM_USER_SIGNUP_GROUP_ID', '3', '1', '新注册用户默认组别(用户权限)', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('10', '管理员联系方式', 'WEB_ADMINER_CONTACT', '1716771371', '1', '管理员联系方式', null, '0');

-- ----------------------------
-- Table structure for oeynet_user
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_user`;
CREATE TABLE `oeynet_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(30) NOT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `password` char(32) NOT NULL,
  `pwd_salt` char(5) NOT NULL COMMENT '不需要，备用',
  `email` varchar(50) DEFAULT NULL,
  `phone` char(15) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `reg_time` int(11) NOT NULL,
  `reg_ip` varchar(25) DEFAULT NULL,
  `level_score` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(3) NOT NULL DEFAULT '1' COMMENT '用户等级',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `experience` int(11) NOT NULL DEFAULT '0',
  `head_pic_id` int(11) NOT NULL DEFAULT '0' COMMENT '头像图片ID',
  `score` int(11) NOT NULL DEFAULT '0',
  `level_title` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oeynet_user
-- ----------------------------
INSERT INTO `oeynet_user` VALUES ('1', 'admin', 'SB222', 'b78d4866a53cf64f21b8b3660c5ead92', '', null, null, '0', '0', null, '0', '1', '1', '0', '61', '1146', null);
INSERT INTO `oeynet_user` VALUES ('61', 'zhaojun', '123123', '84cc99dd01b647a3d26f5bd541656f95', '', null, null, '0', '0', null, '0', '1', '1', '0', '59', '0', null);
INSERT INTO `oeynet_user` VALUES ('62', 'zhaojun1', 'HelloWorld', 'de0fd65cf2b6ced0dc310e899e6907f7', '', null, null, '0', '0', null, '0', '1', '1', '0', '62', '0', null);
INSERT INTO `oeynet_user` VALUES ('63', 'zhaojun3', '674674', 'ebb5767a586f80b1592fe3b2d3c0d4e1', '', null, null, '0', '0', null, '0', '1', '0', '13', '63', '13', null);

-- ----------------------------
-- Table structure for oeynet_user_level
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_user_level`;
CREATE TABLE `oeynet_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:经验等级',
  `name` char(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_user_level
-- ----------------------------
INSERT INTO `oeynet_user_level` VALUES ('1', '200', '4', '1', '团长');
INSERT INTO `oeynet_user_level` VALUES ('2', '0', '1', '1', '步兵');
INSERT INTO `oeynet_user_level` VALUES ('3', '10', '2', '1', '小排长');
INSERT INTO `oeynet_user_level` VALUES ('4', '100', '3', '1', '营长');
INSERT INTO `oeynet_user_level` VALUES ('5', '500', '5', '1', '独立团李云龙');
INSERT INTO `oeynet_user_level` VALUES ('6', '1000', '6', '1', '蒋介石');

-- ----------------------------
-- Table structure for oeynet_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `oeynet_user_score_log`;
CREATE TABLE `oeynet_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `msg` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `use_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:增加,2:减少',
  `create_time` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `ip` char(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_user_score_log
-- ----------------------------
INSERT INTO `oeynet_user_score_log` VALUES ('1', '1', '用户回复帖子获取积分', '1', '1500188296', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('2', '1', '用户回复帖子获取积分', '1', '1500188327', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('3', '1', '用户回复帖子获取积分', '1', '1500188331', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('4', '1', '用户回复帖子获取积分', '1', '1500188334', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('5', '1', '用户回复帖子获取积分', '1', '1500188343', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('6', '1', '用户回复帖子获取积分', '1', '1500188348', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('7', '1', '用户回复帖子获取积分', '1', '1500188354', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('8', '1', '用户回复帖子获取积分', '1', '1500188356', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('9', '1', '用户回复帖子获取积分', '1', '1500188358', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('10', '1', '用户回复帖子获取积分', '1', '1500188360', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('11', '1', '用户回复帖子获取积分', '1', '1500188361', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('12', '1', '用户回复帖子获取积分', '1', '1500188363', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('13', '1', '用户回复帖子获取积分', '1', '1500188364', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('14', '1', '用户回复帖子获取积分', '1', '1500188366', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('15', '1', '用户回复帖子获取积分', '1', '1500188368', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('16', '1', '用户回复帖子获取积分', '1', '1500188372', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('17', '1', '用户回复帖子获取积分', '1', '1500188377', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('18', '1', '用户回复帖子获取积分', '1', '1500188381', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('19', '1', '用户回复帖子获取积分', '1', '1500188384', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('20', '1', '用户回复帖子获取积分', '1', '1500188389', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('21', '63', '用户今日首次登陆积分', '1', '1500191824', '5', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('22', '63', '用户回复帖子获取积分', '1', '1500191838', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('23', '63', '用户回复帖子获取积分', '1', '1500191943', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('24', '63', '用户回复帖子获取积分', '1', '1500191948', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('25', '63', '用户回复帖子获取积分', '1', '1500191954', '2', '192.168.99.1');
