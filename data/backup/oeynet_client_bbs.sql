/*
Navicat MySQL Data Transfer

Source Server         : docker-mysql-db
Source Server Version : 50636
Source Host           : 192.168.99.100:3306
Source Database       : oeynet_client_bbs

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-07-19 10:49:23
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
INSERT INTO `oeynet_auth_group` VALUES ('3', '普通用户组', '1970', '1', '', '19,25,20,24,27,31,32,30,29,33,34');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_category
-- ----------------------------
INSERT INTO `oeynet_bbs_category` VALUES ('31', '每日总结', '', '0', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('32', '项目进度', '', '0', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('33', '每周会议', '', '0', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('34', '内部培训', '', '0', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('35', '公司任务', '', '0', '1');
INSERT INTO `oeynet_bbs_category` VALUES ('36', '项目计划', '', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_comment
-- ----------------------------
INSERT INTO `oeynet_bbs_comment` VALUES ('131', '0', '55', '1', '<p>工作内容：无</p><p>遇到问题：无</p><p>解决方案：无</p><p>学习总结：无</p><p>推荐资料：无</p>', '1500430722', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_picture
-- ----------------------------
INSERT INTO `oeynet_bbs_picture` VALUES ('64', 'desktop-2.png', null, '1500430536', null, 'ef/ff446dfde55d97db24e6e6999cfbd6.png', '/app/webroot/public/upload/head/ef/ff446dfde55d97db24e6e6999cfbd6.png', 'efff446dfde55d97db24e6e6999cfbd6', '0', '0', '0', '213352', 'png', '1', '', 'image/png', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_bbs_post
-- ----------------------------
INSERT INTO `oeynet_bbs_post` VALUES ('55', '31', '1', '2017-07-19 总结汇报', '<h1>2017-07-19 总结汇报</h1><p>2017-07-19 总结汇报</p><p>2017-07-19 总结汇报</p><p>2017-07-19 总结汇报</p><p>2017-07-19 总结汇报</p>', '1500430632', null, '0', '0', '1', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_friend_links
-- ----------------------------
INSERT INTO `oeynet_friend_links` VALUES ('2', '成都易猿网络科技科有限责任公司', 'https://oeynet.com', '222', '123123', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_system_config
-- ----------------------------
INSERT INTO `oeynet_system_config` VALUES ('1', '系统名称', 'WEB_SITE_TITLE', '易猿考勤-Sys', '1', '网站显示名', '1970', '0');
INSERT INTO `oeynet_system_config` VALUES ('2', '单页条数', 'SYSTEM_PAGE_LIMIT', '5', '1', '分页单页的显示条', '1970', '0');
INSERT INTO `oeynet_system_config` VALUES ('3', '网站默认SEO描述', 'WEB_SITE_DESC', '101BBS论坛，101BBS论坛，描述', '1', '网站默认SEO描述', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('4', '网站默认SEO关键词', 'WEB_SITE_KEYWORDS', '101BBS论坛，关键词', '1', '网站默认SEO关键词', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('5', '前台单页条数', 'WEB_INDEX_PAGE_LIMIT', '50', '1', '前台单页条数', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('6', '帖子自动审核通过', 'BBS_AUTH_STATUS_TRUE', '1', '1', '帖子自动审核通过（0:关闭,1开启）', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('7', '评论自动审核通过', 'BBS_AUTH_COMMENT_STATUS_TRUE', '1', '1', '评论自动审核通过（0:关闭,1开启）', '1970', '0');
INSERT INTO `oeynet_system_config` VALUES ('8', '默认游客组号', 'SYSTEM_DEFAULT_VIEWER_GROUP_ID', '2', '1', '默认游客组号(游客相关权限)', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('9', '新注册用户默认组别', 'SYSTEM_USER_SIGNUP_GROUP_ID', '3', '1', '新注册用户默认组别(用户权限)', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('10', '管理员联系方式', 'WEB_ADMINER_CONTACT', '1716771371', '1', '管理员联系方式', null, '0');
INSERT INTO `oeynet_system_config` VALUES ('11', '调试模式', 'app_debug', '0', '1', '调试模式', '1970', '0');

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
INSERT INTO `oeynet_user` VALUES ('1', 'admin', '赵俊', 'b78d4866a53cf64f21b8b3660c5ead92', '', null, null, '0', '0', null, '0', '1', '1', '10', '64', '1156', null);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oeynet_user_score_log
-- ----------------------------
INSERT INTO `oeynet_user_score_log` VALUES ('26', '1', '用户回复帖子获取积分', '1', '1500430516', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('27', '1', '用户回复帖子获取积分', '1', '1500430571', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('28', '1', '用户回复帖子获取积分', '1', '1500430585', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('29', '1', '用户回复帖子获取积分', '1', '1500430632', '2', '192.168.99.1');
INSERT INTO `oeynet_user_score_log` VALUES ('30', '1', '用户回复帖子获取积分', '1', '1500430723', '2', '192.168.99.1');
