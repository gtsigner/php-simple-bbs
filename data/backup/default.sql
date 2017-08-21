-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: mysql    Database: package_v1
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oeynet_admin`
--

DROP TABLE IF EXISTS `oeynet_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_admin` (
  `uid` int(11) NOT NULL COMMENT 'user_id',
  `type` int(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_root` int(255) NOT NULL DEFAULT '0' COMMENT '是否是管理员',
  PRIMARY KEY (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `oeynet_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_admin`
--

LOCK TABLES `oeynet_admin` WRITE;
/*!40000 ALTER TABLE `oeynet_admin` DISABLE KEYS */;
INSERT INTO `oeynet_admin` VALUES (1,1,'无敌站长',1);
/*!40000 ALTER TABLE `oeynet_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_auth_group`
--

DROP TABLE IF EXISTS `oeynet_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `mark` varchar(255) DEFAULT NULL,
  `rules` varchar(1000) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_auth_group`
--

LOCK TABLES `oeynet_auth_group` WRITE;
/*!40000 ALTER TABLE `oeynet_auth_group` DISABLE KEYS */;
INSERT INTO `oeynet_auth_group` VALUES (1,'站长组',1970,1,'','1,2,3,4,5,1,12,13,15,22,21,10,11,26,24,14,23'),(2,'游客权限',1970,1,'','19,25,20,27'),(3,'普通用户组',1970,1,'','19,25,20,24,27,31,28,32,30,29,33,34'),(4,'首页访问测试',1970,1,'','19,24'),(5,'管理员',1970,1,'3、管理员需求权限组','13,35,36,23,37,8,9,16,42,41,44,45,48,49,46');
/*!40000 ALTER TABLE `oeynet_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_auth_logs`
--

DROP TABLE IF EXISTS `oeynet_auth_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_auth_logs` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_auth_logs`
--

LOCK TABLES `oeynet_auth_logs` WRITE;
/*!40000 ALTER TABLE `oeynet_auth_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oeynet_auth_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_auth_rule`
--

DROP TABLE IF EXISTS `oeynet_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_auth_rule`
--

LOCK TABLES `oeynet_auth_rule` WRITE;
/*!40000 ALTER TABLE `oeynet_auth_rule` DISABLE KEYS */;
INSERT INTO `oeynet_auth_rule` VALUES (1,0,1,'权限管理','','admin','auth','index',999,1),(3,1,1,'权限菜单','admin/auth/authrule','admin','auth','authrule',0,1),(4,0,1,'用户管理','','admin','','',998,1),(5,4,1,'用户列表','admin/user.user/index','admin','user.user','index',0,1),(6,0,1,'系统设置','','admin','','',1000,1),(7,6,1,'友情链接','admin/system.config/friendLinks','admin','system.config','friendLinks',0,1),(8,0,1,'内容管理','','admin','','',0,1),(9,0,1,'网站附件','','admin','','',0,1),(10,6,1,'全局配置','admin/system.config/index','admin','system.config','index',0,1),(11,6,1,'大数据','admin/system.analyze/show','admin','system.analyze','show',0,1),(13,8,1,'帖子管理','admin/bbs.post/postlist','admin','bbs.post','postlist',0,1),(14,4,1,'小黑屋','admin/user.user/index?status=0','admin','user.user','index',0,1),(15,8,1,'栏目管理','admin/bbs.category/index','admin','bbs.category','index',0,1),(16,9,1,'文件管理','admin/bbs.file/index','admin','bbs.file','index',0,1),(17,9,0,'图片管理','admin/bbs.picture/index','admin','bbs.picture','index',0,1),(18,2,1,'控制台','admin/index/dashboard','admin','index','dashboard',0,1),(19,0,1,'博客首页','index/index/index','index','index','index',0,1),(20,0,1,'网站附件','index/attach.file/index','index','attach.file','index',2,1),(21,8,1,'评论管理','admin/bbs.comment/comments','admin','bbs.comment','comments',0,1),(22,1,1,'用户组','admin/auth/authgroup','admin','auth','authgroup',0,1),(23,13,0,'获取帖子数据','admin/bbs.post/getlist','admin','bbs.post','getlist',0,0),(24,0,0,'我的附件','index/user.attach/index','index','user.attach','index',0,1),(41,9,0,'获取文件附件','admin/bbs.file/getlist','admin','bbs.file','getlist',0,1),(27,0,0,'帖子详情','index/bbs.post/detail','index','/bbs.post','detail',0,1),(28,0,0,'发表帖子','index/bbs.post/post','index','bbs.post','post',1,1),(29,0,0,'帖子回复','index/bbs.post/comment','index','bbs.post','comment',1,1),(30,0,0,'个人资料','index/user.profile/index','index','user.profile','index',0,1),(31,0,0,'更新个人资料权限','index/user.profile/upprofile','index','user.profile','upprofile',1,1),(32,0,0,'重置密码','index/user.profile/resetpwd','index','user.profile','resetpwd',0,1),(33,0,0,'附件购买','index/attach.file/buy','index','attach.file','buy',0,1),(34,0,0,'附件下载','index/attach.file/download','index','attach.file','download',0,1),(35,0,0,'后台首页','admin/index/index','admin','index','index',0,1),(36,15,0,'获取栏目数据','admin/bbs.category/getcategory','admin','bbs.category','getcategory',0,1),(37,13,0,'编辑帖子数据','admin/bbs.post/addedit','admin','bbs.post','addedit',0,1),(38,13,0,'删除帖子数据','admin/bbs.post/del','admin','bbs.post','del',0,1),(39,15,0,'编辑栏目数据','admin/bbs.category/addedit','admin','bbs.category','addedit',0,1),(40,15,0,'删除栏目数据','admin/bbs.category/del','admin','bbs.category','del',0,1),(42,9,0,'编辑文件附件','admin/bbs.file/addedit','admin','bbs.file','addedit',0,1),(43,9,0,'删除文件附件','admin/bbs.file/del','admin','bbs.file','del',0,1),(44,9,0,'审核文件附件','admin/bbs.file/changestatus','admin','bbs.file','changestatus',0,1),(45,13,0,'审核帖子数据','admin/bbs.post/changestatus','admin','bbs.post','changestatus',0,1),(46,21,0,'获取评论数据','admin/bbs.comment/getlist','admin','bbs.comment','getlist',0,1),(47,21,0,'编辑评论数据','admin/bbs.comment/addedit','admin','bbs.comment','addedit',0,0),(48,21,0,'删除评论数据','admin/bbs.comment/del','admin','bbs.comment','del',0,1),(49,21,0,'审核评论数据','admin/bbs.comment/changestatus','admin','bbs.comment','changestatus',0,1),(50,6,1,'用户等级','admin/system.level/userlevel','admin','system.level','userlevel',0,1);
/*!40000 ALTER TABLE `oeynet_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_auth_user_group`
--

DROP TABLE IF EXISTS `oeynet_auth_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_auth_user_group` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  `sort` int(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_auth_user_group`
--

LOCK TABLES `oeynet_auth_user_group` WRITE;
/*!40000 ALTER TABLE `oeynet_auth_user_group` DISABLE KEYS */;
INSERT INTO `oeynet_auth_user_group` VALUES (1,1,0),(62,3,0),(0,3,0),(1,4,0),(1,3,0),(1,2,0),(64,3,0),(63,3,0);
/*!40000 ALTER TABLE `oeynet_auth_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_bbs_attach`
--

DROP TABLE IF EXISTS `oeynet_bbs_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_bbs_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_bbs_attach`
--

LOCK TABLES `oeynet_bbs_attach` WRITE;
/*!40000 ALTER TABLE `oeynet_bbs_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `oeynet_bbs_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_bbs_attach_buy`
--

DROP TABLE IF EXISTS `oeynet_bbs_attach_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_bbs_attach_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `attach_id` int(11) NOT NULL,
  `pay_type` int(11) NOT NULL,
  `pay_amount` decimal(10,2) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_bbs_attach_buy`
--

LOCK TABLES `oeynet_bbs_attach_buy` WRITE;
/*!40000 ALTER TABLE `oeynet_bbs_attach_buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `oeynet_bbs_attach_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_bbs_category`
--

DROP TABLE IF EXISTS `oeynet_bbs_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_bbs_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mark` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_bbs_category`
--

LOCK TABLES `oeynet_bbs_category` WRITE;
/*!40000 ALTER TABLE `oeynet_bbs_category` DISABLE KEYS */;
INSERT INTO `oeynet_bbs_category` VALUES (31,'PHP','',0,1),(32,'Python','',0,1),(33,'Node.Js','',0,1),(34,'Golang','',0,1),(35,'前端框架','',0,1),(36,'PHP框架','',0,1),(37,'Docker','',0,1),(38,'UI','',0,1),(39,'Devops','',0,1),(40,'云计算','',0,1),(41,'kubernetes','',0,1),(42,'容器技术','',0,1),(43,'Linux','',0,1),(44,'服务器架构','',0,1),(45,'Runtime Libs','',0,1),(46,'中间件','',0,1),(47,'工具','',0,1);
/*!40000 ALTER TABLE `oeynet_bbs_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_bbs_comment`
--

DROP TABLE IF EXISTS `oeynet_bbs_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_bbs_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `post_id` int(11) NOT NULL COMMENT '相关帖子ID',
  `user_id` int(11) NOT NULL COMMENT '发送的用户ID',
  `to_uid` int(11) NOT NULL COMMENT '发送给谁的 @',
  `content` text NOT NULL,
  `md_content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_bbs_comment`
--

LOCK TABLES `oeynet_bbs_comment` WRITE;
/*!40000 ALTER TABLE `oeynet_bbs_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `oeynet_bbs_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_bbs_file`
--

DROP TABLE IF EXISTS `oeynet_bbs_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_bbs_file`
--

LOCK TABLES `oeynet_bbs_file` WRITE;
/*!40000 ALTER TABLE `oeynet_bbs_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `oeynet_bbs_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_bbs_picture`
--

DROP TABLE IF EXISTS `oeynet_bbs_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_bbs_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `desc` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `md5` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `size` double DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL COMMENT '父Path',
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_bbs_picture`
--

LOCK TABLES `oeynet_bbs_picture` WRITE;
/*!40000 ALTER TABLE `oeynet_bbs_picture` DISABLE KEYS */;
INSERT INTO `oeynet_bbs_picture` VALUES (65,1,'head.jpg',NULL,1503284111,'55/246bad0f730efe24a3b7e017964d6a.jpg','55246bad0f730efe24a3b7e017964d6a',31114,'jpg',NULL,'image/jpeg'),(66,1,'QQ图片20160730202834.jpg',NULL,1503292792,'5a/c5c33b15337b5ded9cf87e25953fd2.jpg','5ac5c33b15337b5ded9cf87e25953fd2',56182,'jpg',NULL,'image/jpeg');
/*!40000 ALTER TABLE `oeynet_bbs_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_bbs_post`
--

DROP TABLE IF EXISTS `oeynet_bbs_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_bbs_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `md_content` text COMMENT 'markdown Codes',
  `create_time` int(255) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `re_count` int(11) NOT NULL DEFAULT '0' COMMENT '推荐数量',
  `like_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数量',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '访问量',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_bbs_post`
--

LOCK TABLES `oeynet_bbs_post` WRITE;
/*!40000 ALTER TABLE `oeynet_bbs_post` DISABLE KEYS */;
INSERT INTO `oeynet_bbs_post` VALUES (54,1,43,'LVM挂载方案和同VG名称问题','','',1503284479,1503285164,NULL,0,0,1,1,0);
/*!40000 ALTER TABLE `oeynet_bbs_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_bbs_tags`
--

DROP TABLE IF EXISTS `oeynet_bbs_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_bbs_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '标签名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `content` text NOT NULL COMMENT '描述信息',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_bbs_tags`
--

LOCK TABLES `oeynet_bbs_tags` WRITE;
/*!40000 ALTER TABLE `oeynet_bbs_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `oeynet_bbs_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_black_home`
--

DROP TABLE IF EXISTS `oeynet_black_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_black_home` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '小黑屋',
  `create_time` int(11) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_black_home`
--

LOCK TABLES `oeynet_black_home` WRITE;
/*!40000 ALTER TABLE `oeynet_black_home` DISABLE KEYS */;
/*!40000 ALTER TABLE `oeynet_black_home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_friend_links`
--

DROP TABLE IF EXISTS `oeynet_friend_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_friend_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `mark` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_friend_links`
--

LOCK TABLES `oeynet_friend_links` WRITE;
/*!40000 ALTER TABLE `oeynet_friend_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `oeynet_friend_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_system_config`
--

DROP TABLE IF EXISTS `oeynet_system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_system_config`
--

LOCK TABLES `oeynet_system_config` WRITE;
/*!40000 ALTER TABLE `oeynet_system_config` DISABLE KEYS */;
INSERT INTO `oeynet_system_config` VALUES (1,'系统名称','WEB_SITE_TITLE','Godtoy的博客',1,'网站显示名',1970,0),(2,'单页条数','SYSTEM_PAGE_LIMIT','5',1,'分页单页的显示条',1970,0),(3,'网站默认SEO描述','WEB_SITE_DESC','Godtoy的博客,zhaojunlike的博客,运维工程师',1,'网站默认SEO描述',NULL,0),(4,'网站默认SEO关键词','WEB_SITE_KEYWORDS','	Godtoy的博客,zhaojunlike的博客,运维工程师',1,'网站默认SEO关键词',NULL,0),(5,'前台单页条数','WEB_INDEX_PAGE_LIMIT','50',1,'前台单页条数',NULL,0),(6,'帖子自动审核通过','BBS_AUTH_STATUS_TRUE','1',1,'帖子自动审核通过（0:关闭,1开启）',NULL,0),(7,'评论自动审核通过','BBS_AUTH_COMMENT_STATUS_TRUE','1',1,'评论自动审核通过（0:关闭,1开启）',1970,0),(8,'默认游客组号','SYSTEM_DEFAULT_VIEWER_GROUP_ID','2',1,'默认游客组号(游客相关权限)',NULL,0),(9,'新注册用户默认组别','SYSTEM_USER_SIGNUP_GROUP_ID','3',1,'新注册用户默认组别(用户权限)',NULL,0),(10,'管理员联系方式','WEB_ADMINER_CONTACT','1716771371',1,'管理员联系方式',NULL,0),(11,'用户自动审核通过','USER_SIGNUP_STATUS','1',1,'用户审核状态',0,0);
/*!40000 ALTER TABLE `oeynet_system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_user`
--

DROP TABLE IF EXISTS `oeynet_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(30) NOT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `password` char(32) NOT NULL,
  `pwd_salt` char(5) NOT NULL COMMENT '不需要，备用',
  `email` varchar(50) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `reg_time` int(11) NOT NULL,
  `reg_ip` varchar(25) DEFAULT NULL,
  `mark` varchar(45) DEFAULT NULL,
  `head_pic_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_user`
--

LOCK TABLES `oeynet_user` WRITE;
/*!40000 ALTER TABLE `oeynet_user` DISABLE KEYS */;
INSERT INTO `oeynet_user` VALUES (1,'admin','SB222','d3c9c2ffb8ee26f7965abff2f178209f','',NULL,NULL,NULL,0,NULL,NULL,66,1),(61,'zhaojun','123123','84cc99dd01b647a3d26f5bd541656f95','',NULL,NULL,NULL,0,NULL,'',NULL,1),(62,'zhaojun1','HelloWorld','de0fd65cf2b6ced0dc310e899e6907f7','',NULL,NULL,NULL,0,NULL,NULL,NULL,1),(63,'zhaojun3','674674','ebb5767a586f80b1592fe3b2d3c0d4e1','',NULL,NULL,NULL,0,NULL,'',NULL,0),(64,'zhaojun12','','27025e3d19df0c923e649ff926e272f7','','zhaojun@qq.com',NULL,NULL,1503132415,'192.168.197.1','',NULL,1);
/*!40000 ALTER TABLE `oeynet_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_user_level`
--

DROP TABLE IF EXISTS `oeynet_user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:经验等级',
  `name` char(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_user_level`
--

LOCK TABLES `oeynet_user_level` WRITE;
/*!40000 ALTER TABLE `oeynet_user_level` DISABLE KEYS */;
INSERT INTO `oeynet_user_level` VALUES (1,200,4,1,'团长'),(2,0,1,1,'步兵'),(3,10,2,1,'小排长'),(4,100,3,1,'营长'),(5,500,5,1,'独立团李云龙'),(6,1000,6,1,'蒋介石');
/*!40000 ALTER TABLE `oeynet_user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_user_profile`
--

DROP TABLE IF EXISTS `oeynet_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_user_profile` (
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_user_profile`
--

LOCK TABLES `oeynet_user_profile` WRITE;
/*!40000 ALTER TABLE `oeynet_user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `oeynet_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_user_score_log`
--

DROP TABLE IF EXISTS `oeynet_user_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_user_score_log`
--

LOCK TABLES `oeynet_user_score_log` WRITE;
/*!40000 ALTER TABLE `oeynet_user_score_log` DISABLE KEYS */;
INSERT INTO `oeynet_user_score_log` VALUES (1,1,'用户回复帖子获取积分',1,1500188296,2,'192.168.99.1'),(2,1,'用户回复帖子获取积分',1,1500188327,2,'192.168.99.1'),(3,1,'用户回复帖子获取积分',1,1500188331,2,'192.168.99.1'),(4,1,'用户回复帖子获取积分',1,1500188334,2,'192.168.99.1'),(5,1,'用户回复帖子获取积分',1,1500188343,2,'192.168.99.1'),(6,1,'用户回复帖子获取积分',1,1500188348,2,'192.168.99.1'),(7,1,'用户回复帖子获取积分',1,1500188354,2,'192.168.99.1'),(8,1,'用户回复帖子获取积分',1,1500188356,2,'192.168.99.1'),(9,1,'用户回复帖子获取积分',1,1500188358,2,'192.168.99.1'),(10,1,'用户回复帖子获取积分',1,1500188360,2,'192.168.99.1'),(11,1,'用户回复帖子获取积分',1,1500188361,2,'192.168.99.1'),(12,1,'用户回复帖子获取积分',1,1500188363,2,'192.168.99.1'),(13,1,'用户回复帖子获取积分',1,1500188364,2,'192.168.99.1'),(14,1,'用户回复帖子获取积分',1,1500188366,2,'192.168.99.1'),(15,1,'用户回复帖子获取积分',1,1500188368,2,'192.168.99.1'),(16,1,'用户回复帖子获取积分',1,1500188372,2,'192.168.99.1'),(17,1,'用户回复帖子获取积分',1,1500188377,2,'192.168.99.1'),(18,1,'用户回复帖子获取积分',1,1500188381,2,'192.168.99.1'),(19,1,'用户回复帖子获取积分',1,1500188384,2,'192.168.99.1'),(20,1,'用户回复帖子获取积分',1,1500188389,2,'192.168.99.1'),(21,63,'用户今日首次登陆积分',1,1500191824,5,'192.168.99.1'),(22,63,'用户回复帖子获取积分',1,1500191838,2,'192.168.99.1'),(23,63,'用户回复帖子获取积分',1,1500191943,2,'192.168.99.1'),(24,63,'用户回复帖子获取积分',1,1500191948,2,'192.168.99.1'),(25,63,'用户回复帖子获取积分',1,1500191954,2,'192.168.99.1');
/*!40000 ALTER TABLE `oeynet_user_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeynet_user_wallet`
--

DROP TABLE IF EXISTS `oeynet_user_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_user_wallet` (
  `uid` int(11) NOT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_user_wallet`
--

LOCK TABLES `oeynet_user_wallet` WRITE;
/*!40000 ALTER TABLE `oeynet_user_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `oeynet_user_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'package_v1'
--

--
-- Dumping routines for database 'package_v1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-21 13:52:05
