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
INSERT INTO `oeynet_auth_user_group` VALUES (1,1,0),(62,3,0),(0,3,0),(1,4,0),(1,3,0),(1,2,0),(64,3,0),(63,3,0),(65,3,0);
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
INSERT INTO `oeynet_bbs_category` VALUES (31,'PHP','',0,1),(32,'Python','',0,1),(33,'Node.Js','',0,1),(34,'Golang','',0,1),(35,'前端框架','',0,1),(36,'PHP框架','',0,1),(37,'Docker','',0,1),(38,'Tools','',0,1),(39,'Devops','',0,1),(40,'云计算','',0,1),(41,'kubernetes','',0,1),(42,'容器技术','',0,1),(43,'Linux','',0,1),(44,'服务器架构','',0,1),(45,'Runtime Libs','',0,1),(46,'中间件','',0,1),(47,'其他','',0,1);
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
  `sign_id` int(11) DEFAULT '0' COMMENT '个性签名',
  `md_content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_bbs_comment`
--

LOCK TABLES `oeynet_bbs_comment` WRITE;
/*!40000 ALTER TABLE `oeynet_bbs_comment` DISABLE KEYS */;
INSERT INTO `oeynet_bbs_comment` VALUES (17,NULL,75,1,0,0,'![e76b785284b5954789cd98a6291d0c7a.png](/upload/editor/20170821/e76b785284b5954789cd98a6291d0c7a.png)\n![6bbdcdaecf98a04afbb23ce35d3481d8.png](/upload/editor/20170821/6bbdcdaecf98a04afbb23ce35d3481d8.png)\n![7ed54672c0f906a3c037d26125d5beec.png](/upload/editor/20170821/7ed54672c0f906a3c037d26125d5beec.png)',1503305487,1503305556,NULL,1),(18,NULL,73,1,0,0,'```shell\nroot@ubuntu-docker:/server/nodejs# docker images\nREPOSITORY                                             TAG                 IMAGE ID            CREATED             SIZE\nnode-hello                                             latest              58a5182bd055        40 seconds ago      56.34 MB\nroot@ubuntu-docker:/server/nodejs# docker run -d -p 3001:3001 node-hello\n0af03634720b3572e860b9d353fd140b88f729e938713f3c4fc694cfda3ec065\nroot@ubuntu-docker:/server/nodejs# curl localhost:3001\nHello World\nroot@ubuntu-docker:/server/nodejs#\n```\n```shell\nroot@ubuntu-docker:/server/nodejs# docker images\nREPOSITORY                                             TAG                 IMAGE ID            CREATED             SIZE\nnode-hello                                             latest              58a5182bd055        40 seconds ago      56.34 MB\nroot@ubuntu-docker:/server/nodejs# docker run -d -p 3001:3001 node-hello\n0af03634720b3572e860b9d353fd140b88f729e938713f3c4fc694cfda3ec065\nroot@ubuntu-docker:/server/nodejs# curl localhost:3001\nHello World\nroot@ubuntu-docker:/server/nodejs#\n```',1503308533,1503308619,NULL,1),(19,NULL,71,1,0,0,'```javascript\nroot@ubuntu-docker:~/.docker/machine/cache# docker-machine create -d virtualbox mh-keystore\nRunning pre-create checks...\nCreating machine...\n(mh-keystore) Copying /root/.docker/machine/cache/boot2docker.iso to /root/.docker/machine/machines/mh-keystore/boot2docker.iso...\n(mh-keystore) Creating VirtualBox VM...\n(mh-keystore) Creating SSH key...\n(mh-keystore) Starting the VM...\n(mh-keystore) Check network to re-create if needed...\n(mh-keystore) Found a new host-only adapter: \"vboxnet0\"\n(mh-keystore) Waiting for an IP...\nWaiting for machine to be running, this may take a few minutes...\nDetecting operating system of created instance...\nWaiting for SSH to be available...\nDetecting the provisioner...\nProvisioning with boot2docker...\nCopying certs to the local machine directory...\nCopying certs to the remote machine...\nSetting Docker configuration on the remote daemon...\nChecking connection to Docker...\nDocker is up and running!\nTo see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: docker-machine env mh-keystore\nroot@ubuntu-docker:~/.docker/machine/cache# docker-machine create -d virtualbox mh-keystore\nRunning pre-create checks...\nCreating machine...\n(mh-keystore) Copying /root/.docker/machine/cache/boot2docker.iso to /root/.docker/machine/machines/mh-keystore/boot2docker.iso...\n(mh-keystore) Creating VirtualBox VM...\n(mh-keystore) Creating SSH key...\n(mh-keystore) Starting the VM...\n(mh-keystore) Check network to re-create if needed...\n(mh-keystore) Found a new host-only adapter: \"vboxnet0\"\n(mh-keystore) Waiting for an IP...\nWaiting for machine to be running, this may take a few minutes...\nDetecting operating system of created instance...\nWaiting for SSH to be available...\nDetecting the provisioner...\nProvisioning with boot2docker...\nCopying certs to the local machine directory...\nCopying certs to the remote machine...\nSetting Docker configuration on the remote daemon...\nChecking connection to Docker...\nDocker is up and running!\nTo see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: docker-machine env mh-keystore\nroot@ubuntu-docker:~/.docker/machine/cache# docker-machine create -d virtualbox mh-keystore\nRunning pre-create checks...\nCreating machine...\n(mh-keystore) Copying /root/.docker/machine/cache/boot2docker.iso to /root/.docker/machine/machines/mh-keystore/boot2docker.iso...\n(mh-keystore) Creating VirtualBox VM...\n(mh-keystore) Creating SSH key...\n(mh-keystore) Starting the VM...\n(mh-keystore) Check network to re-create if needed...\n(mh-keystore) Found a new host-only adapter: \"vboxnet0\"\n(mh-keystore) Waiting for an IP...\nWaiting for machine to be running, this may take a few minutes...\nDetecting operating system of created instance...\nWaiting for SSH to be available...\nDetecting the provisioner...\nProvisioning with boot2docker...\nCopying certs to the local machine directory...\nCopying certs to the remote machine...\nSetting Docker configuration on the remote daemon...\nChecking connection to Docker...\nDocker is up and running!\nTo see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: docker-machine env mh-keystore\nroot@ubuntu-docker:~/.docker/machine/cache# docker-machine create -d virtualbox mh-keystore\nRunning pre-create checks...\nCreating machine...\n(mh-keystore) Copying /root/.docker/machine/cache/boot2docker.iso to /root/.docker/machine/machines/mh-keystore/boot2docker.iso...\n(mh-keystore) Creating VirtualBox VM...\n(mh-keystore) Creating SSH key...\n(mh-keystore) Starting the VM...\n(mh-keystore) Check network to re-create if needed...\n(mh-keystore) Found a new host-only adapter: \"vboxnet0\"\n(mh-keystore) Waiting for an IP...\nWaiting for machine to be running, this may take a few minutes...\nDetecting operating system of created instance...\nWaiting for SSH to be available...\nDetecting the provisioner...\nProvisioning with boot2docker...\nCopying certs to the local machine directory...\nCopying certs to the remote machine...\nSetting Docker configuration on the remote daemon...\nChecking connection to Docker...\nDocker is up and running!\nTo see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: docker-machine env mh-keystore\n```',1503309512,1503309512,NULL,1),(20,NULL,74,1,0,0,'![screenshots.png](/upload/editor/20170822/dc4e94744e8f6f18ba748feeb9d90e5d.png)\n## 哈哈哈\n![screenshots.png](/upload/editor/20170822/6b6aeda52306068b26d921d45b11658c.png)\n### ？？？\n![screenshots.png](/upload/editor/20170822/efd37320dd2285fd0fddb6aaefdc4526.png)\n![screenshots.png](/upload/editor/20170822/6fcf95ab4407fedfc3602653a62fd9ee.png)',1503370207,1503370239,NULL,1),(21,NULL,73,65,0,0,'234',1503485659,1503485802,NULL,1),(22,NULL,73,65,0,0,'123',1503485731,1503485731,NULL,1),(23,NULL,73,65,0,0,'',1503485736,1503485736,NULL,1),(24,NULL,73,65,0,0,'123',1503485868,1503485868,NULL,1),(25,NULL,73,65,0,0,'123',1503485871,1503485871,NULL,1),(26,NULL,73,65,0,0,'123',1503485878,1503485878,NULL,1),(27,NULL,73,65,0,0,'123',1503485920,1503485920,NULL,1),(28,NULL,73,65,0,0,'123',1503486074,1503486074,NULL,1),(29,NULL,73,65,0,0,'123',1503486084,1503486084,NULL,1),(30,NULL,73,65,0,0,'123',1503486153,1503486153,NULL,1),(31,NULL,73,65,0,0,'123',1503486233,1503486233,NULL,1),(32,NULL,73,65,0,0,'123',1503486258,1503486258,NULL,1),(33,NULL,73,65,0,0,'123',1503486312,1503486312,NULL,1),(34,NULL,73,65,0,0,'123123',1503535119,1503535119,NULL,1),(35,NULL,73,65,0,0,'123',1503535211,1503535211,NULL,1),(36,NULL,73,65,0,0,'1234',1503535297,1503535297,NULL,1),(37,NULL,77,65,0,0,'asd',1503536283,1503536283,NULL,1),(38,NULL,77,65,0,0,'asdasdasd',1503536288,1503536288,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_bbs_picture`
--

LOCK TABLES `oeynet_bbs_picture` WRITE;
/*!40000 ALTER TABLE `oeynet_bbs_picture` DISABLE KEYS */;
INSERT INTO `oeynet_bbs_picture` VALUES (65,1,'head.jpg',NULL,1503284111,'55/246bad0f730efe24a3b7e017964d6a.jpg','55246bad0f730efe24a3b7e017964d6a',31114,'jpg',NULL,'image/jpeg'),(85,1,'e76b785284b5954789cd98a6291d0c7a.png',NULL,1503305479,'/upload/editor/20170821/e76b785284b5954789cd98a6291d0c7a.png','e76b785284b5954789cd98a6291d0c7a',9127,'png',NULL,'images/png'),(86,1,'6bbdcdaecf98a04afbb23ce35d3481d8.png',NULL,1503305547,'/upload/editor/20170821/6bbdcdaecf98a04afbb23ce35d3481d8.png','6bbdcdaecf98a04afbb23ce35d3481d8',1274,'png',NULL,'images/png'),(87,1,'7ed54672c0f906a3c037d26125d5beec.png',NULL,1503305554,'/upload/editor/20170821/7ed54672c0f906a3c037d26125d5beec.png','7ed54672c0f906a3c037d26125d5beec',147128,'png',NULL,'images/png'),(88,1,'76be30e333ea17dc421f3f409dbc7664.png',NULL,1503305869,'/upload/editor/20170821/76be30e333ea17dc421f3f409dbc7664.png','76be30e333ea17dc421f3f409dbc7664',7466,'png',NULL,'images/png'),(89,1,'4f9e92a313b3dec8a8a11c92acc47060.png',NULL,1503305943,'/upload/editor/20170821/4f9e92a313b3dec8a8a11c92acc47060.png','4f9e92a313b3dec8a8a11c92acc47060',5744,'png',NULL,'images/png'),(90,1,'873c1dfcfb81c711f88feede7269849c.png',NULL,1503305983,'/upload/editor/20170821/873c1dfcfb81c711f88feede7269849c.png','873c1dfcfb81c711f88feede7269849c',32620,'png',NULL,'images/png'),(91,1,'873c1dfcfb81c711f88feede7269849c.png',NULL,1503305988,'/upload/editor/20170821/873c1dfcfb81c711f88feede7269849c.png','873c1dfcfb81c711f88feede7269849c',32620,'png',NULL,'images/png'),(92,1,'head.jpg',NULL,1503308656,'29/de70223fae23cbcf0f80a2d65fb60e.jpg','29de70223fae23cbcf0f80a2d65fb60e',20872,'jpg',NULL,'image/jpeg'),(93,1,'9336db33176bc5ea9fc49735d467d33f.png',NULL,1503368066,'/upload/editor/20170822/9336db33176bc5ea9fc49735d467d33f.png','9336db33176bc5ea9fc49735d467d33f',1043,'png',NULL,'images/png'),(94,1,'5682bd4e63dc63e87583fb2ec5192b4b.png',NULL,1503368703,'/upload/editor/20170822/5682bd4e63dc63e87583fb2ec5192b4b.png','5682bd4e63dc63e87583fb2ec5192b4b',4237,'png',NULL,'images/png'),(95,1,'60d22547988b4a621e622c85bf0d5010.png',NULL,1503368935,'/upload/editor/20170822/60d22547988b4a621e622c85bf0d5010.png','60d22547988b4a621e622c85bf0d5010',486,'png',NULL,'images/png'),(96,1,'1e0e4c5ad6c694353a7a8866a761c9e2.png',NULL,1503368997,'/upload/editor/20170822/1e0e4c5ad6c694353a7a8866a761c9e2.png','1e0e4c5ad6c694353a7a8866a761c9e2',2803,'png',NULL,'images/png'),(97,1,'dc4e94744e8f6f18ba748feeb9d90e5d.png',NULL,1503369989,'/upload/editor/20170822/dc4e94744e8f6f18ba748feeb9d90e5d.png','dc4e94744e8f6f18ba748feeb9d90e5d',68846,'png',NULL,'images/png'),(98,1,'dc4e94744e8f6f18ba748feeb9d90e5d.png',NULL,1503369994,'/upload/editor/20170822/dc4e94744e8f6f18ba748feeb9d90e5d.png','dc4e94744e8f6f18ba748feeb9d90e5d',68846,'png',NULL,'images/png'),(99,1,'dc4e94744e8f6f18ba748feeb9d90e5d.png',NULL,1503370134,'/upload/editor/20170822/dc4e94744e8f6f18ba748feeb9d90e5d.png','dc4e94744e8f6f18ba748feeb9d90e5d',68846,'png',NULL,'images/png'),(100,1,'dc4e94744e8f6f18ba748feeb9d90e5d.png',NULL,1503370151,'/upload/editor/20170822/dc4e94744e8f6f18ba748feeb9d90e5d.png','dc4e94744e8f6f18ba748feeb9d90e5d',68846,'png',NULL,'images/png'),(101,1,'dc4e94744e8f6f18ba748feeb9d90e5d.png',NULL,1503370190,'/upload/editor/20170822/dc4e94744e8f6f18ba748feeb9d90e5d.png','dc4e94744e8f6f18ba748feeb9d90e5d',68846,'png',NULL,'images/png'),(102,1,'dc4e94744e8f6f18ba748feeb9d90e5d.png',NULL,1503370200,'/upload/editor/20170822/dc4e94744e8f6f18ba748feeb9d90e5d.png','dc4e94744e8f6f18ba748feeb9d90e5d',68846,'png',NULL,'images/png'),(103,1,'6b6aeda52306068b26d921d45b11658c.png',NULL,1503370205,'/upload/editor/20170822/6b6aeda52306068b26d921d45b11658c.png','6b6aeda52306068b26d921d45b11658c',45976,'png',NULL,'images/png'),(104,1,'efd37320dd2285fd0fddb6aaefdc4526.png',NULL,1503370226,'/upload/editor/20170822/efd37320dd2285fd0fddb6aaefdc4526.png','efd37320dd2285fd0fddb6aaefdc4526',1733,'png',NULL,'images/png'),(105,1,'6fcf95ab4407fedfc3602653a62fd9ee.png',NULL,1503370237,'/upload/editor/20170822/6fcf95ab4407fedfc3602653a62fd9ee.png','6fcf95ab4407fedfc3602653a62fd9ee',10826,'png',NULL,'images/png');
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
  `md_content` text COMMENT 'markdown Codes',
  `create_time` int(255) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `re_count` int(11) NOT NULL DEFAULT '0' COMMENT '推荐数量',
  `like_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数量',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '访问量',
  `sort` int(11) NOT NULL DEFAULT '0',
  `position` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='位置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_bbs_post`
--

LOCK TABLES `oeynet_bbs_post` WRITE;
/*!40000 ALTER TABLE `oeynet_bbs_post` DISABLE KEYS */;
INSERT INTO `oeynet_bbs_post` VALUES (54,1,43,'LVM挂载方案和同VG名称问题','',1503284479,1503285164,1503297839,0,0,1,0,NULL,1),(60,1,33,'WPF实现DataGrid内部画线','需要实现如下效果图\n![GIF.gif](http://upload-images.jianshu.io/upload_images/3100692-fc07287fda809fdb.gif?imageMogr2/auto-orient/strip)\n\n\n主要就是用到了模版，还有获取模版里面带有name的子元素\n\n\n布局文件\n```\n<Window\n        xmlns=\"http://schemas.microsoft.com/winfx/2006/xaml/presentation\"\n        xmlns:x=\"http://schemas.microsoft.com/winfx/2006/xaml\"\n        xmlns:d=\"http://schemas.microsoft.com/expression/blend/2008\"\n        xmlns:mc=\"http://schemas.openxmlformats.org/markup-compatibility/2006\"\n        xmlns:local=\"clr-namespace:WpfApp1\"\n        xmlns:Themes=\"clr-namespace:Microsoft.Windows.Themes;assembly=PresentationFramework.Aero2\" x:Class=\"WpfApp1.MainWindow\"\n        mc:Ignorable=\"d\"\n        Title=\"MainWindow\" WindowStartupLocation=\"CenterScreen\"\n        WindowState=\"Maximized\" SnapsToDevicePixels=\"True\">\n    <Window.Resources>\n        <Style TargetType=\"{x:Type TextBlock}\">\n            <Setter Property=\"HorizontalAlignment\" Value=\"Center\"/>\n            <Setter Property=\"TextAlignment\" Value=\"Center\"/>\n            <Setter Property=\"VerticalAlignment\" Value=\"Center\"></Setter>\n        </Style>\n\n        <Style TargetType=\"{x:Type DataGrid}\">\n            <Setter Property=\"Padding\" Value=\"0\"></Setter>\n        </Style>\n\n        <Style TargetType=\"{x:Type TextBlock}\" x:Key=\"DataTimerHeadTextTime\">\n            <Setter Property=\"Width\" Value=\"Auto\"></Setter>\n            <Setter Property=\"TextAlignment\" Value=\"Center\"/>\n            <Setter Property=\"Grid.ColumnSpan\" Value=\"2\"/>\n            <Setter Property=\"VerticalAlignment\" Value=\"Center\"></Setter>\n        </Style>\n\n        <Style TargetType=\"{x:Type DataGridColumnHeader}\" x:Key=\"DataTimerColumnStyle\">\n            <Setter Property=\"Template\">\n                <Setter.Value>\n                    <ControlTemplate TargetType=\"{x:Type DataGridColumnHeader}\">\n                        <Border x:Name=\"buttonBorderOuter\"\n                        BorderBrush=\"#fff\"\n                        BorderThickness=\"1\"\n                        Background=\"#FFF\"\n                        Width=\"Auto\"\n                        Padding=\"0\">\n                            <ContentPresenter>\n                            </ContentPresenter>\n                            <Border.Triggers>\n                                <EventTrigger RoutedEvent=\"MouseEnter\">\n                                    <BeginStoryboard>\n                                        <Storyboard>\n                                        </Storyboard>\n                                    </BeginStoryboard>\n                                </EventTrigger>\n                                <EventTrigger RoutedEvent=\"MouseLeave\">\n                                    <BeginStoryboard>\n                                        <Storyboard>\n\n                                        </Storyboard>\n                                    </BeginStoryboard>\n                                </EventTrigger>\n                            </Border.Triggers>\n                        </Border>\n                    </ControlTemplate>\n                </Setter.Value>\n            </Setter>\n        </Style>\n\n        <DataTemplate x:Key=\"DataTimerTpl\">\n            <Grid>\n                <Grid.ColumnDefinitions>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                </Grid.ColumnDefinitions>\n                <Border Grid.Row=\"0\" Grid.Column=\"0\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"1\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"2\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"3\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"4\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"5\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"6\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"7\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"8\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"9\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"10\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"11\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"12\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"13\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"14\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"15\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"16\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Border Grid.Column=\"17\" BorderBrush=\"Black\" BorderThickness=\"0,0,1,0\" ></Border>\n                <Grid Name=\"line\" Grid.ColumnSpan=\"18\">\n                    <Canvas VerticalAlignment=\"Center\" Name=\"lineShow\">\n                    </Canvas>\n                </Grid>\n            </Grid>\n        </DataTemplate>\n\n        <DataTemplate x:Key=\"DataTimerHeader\">\n            <Grid Width=\"Auto\">\n                <Grid.RowDefinitions>\n                    <RowDefinition></RowDefinition>\n                    <RowDefinition></RowDefinition>\n                </Grid.RowDefinitions>\n                <Grid.ColumnDefinitions>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                    <ColumnDefinition Width=\"30\"></ColumnDefinition>\n                </Grid.ColumnDefinitions>\n                <TextBlock Grid.Row=\"0\" Grid.Column=\"0\" Grid.ColumnSpan=\"7\" TextAlignment=\"Center\">8:00</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"0\" Grid.Row=\"1\">0</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"1\" Grid.Row=\"1\">10</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"2\" Grid.Row=\"1\">20</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"3\" Grid.Row=\"1\">30</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"4\" Grid.Row=\"1\">40</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"5\" Grid.Row=\"1\">50</TextBlock>\n                <TextBlock Grid.Row=\"0\" Grid.Column=\"6\" Grid.ColumnSpan=\"7\" TextAlignment=\"Center\">09:00</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"6\" Grid.Row=\"1\">0</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"7\" Grid.Row=\"1\">10</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"8\" Grid.Row=\"1\">20</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"9\" Grid.Row=\"1\">30</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"10\" Grid.Row=\"1\">40</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"11\" Grid.Row=\"1\">50</TextBlock>\n                <TextBlock Grid.Row=\"0\" Grid.Column=\"12\" Grid.ColumnSpan=\"7\" TextAlignment=\"Center\">10:00</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"12\" Grid.Row=\"1\">0</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"13\" Grid.Row=\"1\">10</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"14\" Grid.Row=\"1\">20</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"15\" Grid.Row=\"1\">30</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"16\" Grid.Row=\"1\">40</TextBlock>\n                <TextBlock Style=\"{StaticResource DataTimerHeadTextTime}\" Grid.Column=\"17\" Grid.Row=\"1\">50</TextBlock>\n            </Grid>\n        </DataTemplate>\n\n    </Window.Resources>\n\n    <Grid>\n        <Grid.RowDefinitions>\n            <RowDefinition Height=\"100\"></RowDefinition>\n            <RowDefinition/>\n            <RowDefinition/>\n        </Grid.RowDefinitions>\n        <Grid.ColumnDefinitions>\n            <ColumnDefinition/>\n        </Grid.ColumnDefinitions>\n        <Grid Grid.Row=\"0\">\n            <Line VerticalAlignment=\"Center\" X1=\"0\" Y1=\"0\" X2=\"100\" Y2=\"0\" StrokeThickness=\"2\" Stroke=\"Red\"></Line>\n        </Grid>\n        <Grid Grid.Row=\"1\">\n            <DataGrid x:Name=\"dataGrid\" AutoGenerateColumns=\"False\" CanUserAddRows=\"False\">\n                <DataGrid.Columns>\n                    <DataGridTextColumn Header=\"序号\"/>\n                    <DataGridTextColumn Header=\"型号\"/>\n                    <DataGridTextColumn Header=\"类别\"/>\n                    <DataGridTextColumn Header=\"姓名\" Binding=\"{Binding Username}\"/>\n                    <DataGridTextColumn Header=\"代号\" Binding=\"{Binding Number}\"/>\n                    <DataGridTemplateColumn  Width=\"Auto\" \n                                             HeaderStyle=\"{StaticResource DataTimerColumnStyle}\" \n                                           IsReadOnly=\"True\"\n                                            CellTemplate=\"{StaticResource DataTimerTpl}\"\n                                            HeaderTemplate=\"{StaticResource DataTimerHeader}\"></DataGridTemplateColumn>\n                </DataGrid.Columns>\n            </DataGrid>\n        </Grid>\n    </Grid>\n</Window>\n\n```\n\n\n\nC#处理文件\n```csharp\nusing System;\nusing System.Collections.Generic;\nusing System.Linq;\nusing System.Text;\nusing System.Threading.Tasks;\nusing System.Timers;\nusing System.Windows;\nusing System.Windows.Controls;\nusing System.Windows.Data;\nusing System.Windows.Documents;\nusing System.Windows.Input;\nusing System.Windows.Media;\nusing System.Windows.Media.Imaging;\nusing System.Windows.Navigation;\nusing System.Windows.Shapes;\nusing WpfApp1.Models;\n\nnamespace WpfApp1\n{\n\n    /// <summary>\n    /// MainWindow.xaml 的交互逻辑\n    /// </summary>\n    public partial class MainWindow : Window\n    {\n\n        private Timer updateTimer;\n        private float _lineSpeed = 10;\n\n        public MainWindow()\n        {\n            InitializeComponent();\n            this._init();\n            this.createTmpData();\n\n\n\n        }\n        private void createTmpData()\n        {\n            List<TableDataModel> models = new List<TableDataModel>();\n\n            TableDataModel model1 = new TableDataModel();\n            model1.Number = 1;\n            model1.Username = \"赵俊\";\n            TableDataModel model2 = new TableDataModel();\n            model2.Number = 3;\n            model2.Username = \"张三\";\n            TableDataModel model3 = new TableDataModel();\n            model3.Number = 4;\n            model3.Username = \"李四\";\n\n            TableDataModel model4 = new TableDataModel();\n            model4.Number = 5;\n            model4.Username = \"王五\";\n\n\n            models.Add(model1);\n            models.Add(model2);\n            models.Add(model3);\n            models.Add(model4);\n            dataGrid.ItemsSource = models;\n\n        }\n\n        private void _init()\n        {\n\n            this.updateTimer = new Timer();\n            updateTimer.Elapsed += Timer_Elapsed;\n            updateTimer.Interval = 1000;\n            updateTimer.Start();\n        }\n\n        /// <summary>\n        /// 自动画线\n        /// </summary>\n        /// <param name=\"sender\"></param>\n        /// <param name=\"e\"></param>\n        private void Timer_Elapsed(object sender, ElapsedEventArgs e)\n        {\n            this.Dispatcher.Invoke(new Action(() =>\n            {\n                TableDataModel model = dataGrid.Items.GetItemAt(1) as TableDataModel;\n                Canvas obj = this.GetRowCanvas(1);\n\n                if (model.Lines.Count <= 0)\n                {\n                    Line nline = CreateNewLine(30, 0, Brushes.Blue);\n                    model.SwitchBrush();\n                    model.Lines.Push(nline);\n                    obj.Children.Add(nline);\n                    return;\n                }\n                else\n                {\n                    Line oldLine = (Line)model.Lines.Peek();\n                    oldLine.X2 += _lineSpeed;\n                }\n            }));\n        }\n\n        private TableDataModel GetDataGridModel(int index)\n        {\n            TableDataModel model = dataGrid.Items.GetItemAt(index) as TableDataModel;\n            return model;\n        }\n\n\n        private Canvas GetRowCanvas(int itemIndex)\n        {\n            FrameworkElement item = dataGrid.Columns[5].GetCellContent(dataGrid.Items[itemIndex]);\n            DataGridTemplateColumn temp = (dataGrid.Columns[5] as DataGridTemplateColumn);\n            Canvas obj = temp.CellTemplate.FindName(\"lineShow\", item) as Canvas;\n            return obj;\n        }\n\n        private Line CreateNewLine(double x1, double len, Brush brush)\n        {\n            //默认一条蓝色的线条\n            Line nLine = new Line();\n            nLine.Stroke = brush;\n            nLine.StrokeThickness = 5;\n            nLine.X1 = x1;  // count-2  保证 line的起始点为点集合中的倒数第二个点。  \n            nLine.Y1 = 0;\n            // 终点X,Y 为当前point的X,Y  \n            nLine.X2 = x1 + len;\n            nLine.Y2 = 0;\n            nLine.Cursor = Cursors.Hand;\n            nLine.MouseLeftButtonDown += NLine_MouseLeftButtonDown;\n            nLine.VerticalAlignment = VerticalAlignment.Center;\n            return nLine;\n        }\n\n        private void NLine_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)\n        {\n            //获取上调先\n            TableDataModel model = GetDataGridModel(1);\n            Canvas obj = this.GetRowCanvas(1);\n            Line oldLine = (Line)model.Lines.Peek();\n            Line nline = CreateNewLine(oldLine.X2, 10, model.LineBrush);\n            model.SwitchBrush();\n            model.Lines.Push(nline);\n            obj.Children.Add(nline);\n\n\n        }\n\n        private void Grid_KeyDown(object sender, KeyEventArgs e)\n        {\n            //停止\n            this.updateTimer.Stop();\n\n        }\n    }\n}\n\n```',1503297865,NULL,NULL,0,0,2,0,NULL,1),(61,1,43,'ubuntu使用Git fatal: Unable to find remote helper for \'https\'','错误如下：\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-732a493e6cb312c5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\nroot@ubuntu-docker:/server# git clone https://github.com/zhaojunlike/nodejs-spider-shangbiao2.git\n正克隆到 \'nodejs-spider-shangbiao2\'...\nfatal: Unable to find remote helper for \'https\'\n\n我本地的ubuntu虚拟机，尝试克隆的时候报错，我翻阅了一下google的答案，下面是其中一个可行的方案总结。\n\n```\n#apt remove git\n#apt install git-core\n```\n我们在/usr/lib/git-core可以发现一堆git可执行文件，我们需要让 git-remote-https可用，我需要把这个路径加入到我们的PATH\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-f45b9cbc02e43d1d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n```\n#vim /etc/profile\n或者\n#echo \"export PATH=/usr/lib/git-core:\\$PATH\">>/etc/profile\n让环境变量生效\n#source /etc/profile\n```\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-8a50b42f2724362d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n\n在修改好path以后，git已经可以克隆\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-4311cdfbd95c4d57.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)',1503297900,NULL,NULL,0,0,1,0,NULL,1),(62,1,47,'YAML语法','中文：[http://www.ruanyifeng.com/blog/2016/07/yaml.html?f=tt]\n\n```\n---\n# Collection Types #############################################################\n################################################################################\n\n# http://yaml.org/type/map.html -----------------------------------------------#\n\nmap:\n  # Unordered set of key: value pairs.\n  Block style: !!map\n    Clark : Evans\n    Ingy  : döt Net\n    Oren  : Ben-Kiki\n  Flow style: !!map { Clark: Evans, Ingy: döt Net, Oren: Ben-Kiki }\n\n# http://yaml.org/type/omap.html ----------------------------------------------#\n\nomap:\n  # Explicitly typed ordered map (dictionary).\n  Bestiary: !!omap\n    - aardvark: African pig-like ant eater. Ugly.\n    - anteater: South-American ant eater. Two species.\n    - anaconda: South-American constrictor snake. Scaly.\n    # Etc.\n  # Flow style\n  Numbers: !!omap [ one: 1, two: 2, three : 3 ]\n\n# http://yaml.org/type/pairs.html ---------------------------------------------#\n\npairs:\n  # Explicitly typed pairs.\n  Block tasks: !!pairs\n    - meeting: with team.\n    - meeting: with boss.\n    - break: lunch.\n    - meeting: with client.\n  Flow tasks: !!pairs [ meeting: with team, meeting: with boss ]\n\n# http://yaml.org/type/set.html -----------------------------------------------#\n\nset:\n  # Explicitly typed set.\n  baseball players: !!set\n    ? Mark McGwire\n    ? Sammy Sosa\n    ? Ken Griffey\n  # Flow style\n  baseball teams: !!set { Boston Red Sox, Detroit Tigers, New York Yankees }\n\n# http://yaml.org/type/seq.html -----------------------------------------------#\n\nseq:\n  # Ordered sequence of nodes\n  Block style: !!seq\n  - Mercury   # Rotates - no light/dark sides.\n  - Venus     # Deadliest. Aptly named.\n  - Earth     # Mostly dirt.\n  - Mars      # Seems empty.\n  - Jupiter   # The king.\n  - Saturn    # Pretty.\n  - Uranus    # Where the sun hardly shines.\n  - Neptune   # Boring. No rings.\n  - Pluto     # You call this a planet?\n  Flow style: !!seq [ Mercury, Venus, Earth, Mars,      # Rocks\n                      Jupiter, Saturn, Uranus, Neptune, # Gas\n                      Pluto ]                           # Overrated\n\n\n# Scalar Types #################################################################\n################################################################################\n\n# http://yaml.org/type/bool.html ----------------------------------------------#\n\nbool:\n  - true\n  - True\n  - TRUE\n  - false\n  - False\n  - FALSE\n\n# http://yaml.org/type/float.html ---------------------------------------------#\n\nfloat:\n  canonical: 6.8523015e+5\n  exponentioal: 685.230_15e+03\n  fixed: 685_230.15\n  sexagesimal: 190:20:30.15\n  negative infinity: -.inf\n  not a number: .NaN\n\n# http://yaml.org/type/int.html -----------------------------------------------#\n\nint:\n  canonical: 685230\n  decimal: +685_230\n  octal: 02472256\n  hexadecimal: 0x_0A_74_AE\n  binary: 0b1010_0111_0100_1010_1110\n  sexagesimal: 190:20:30\n\n# http://yaml.org/type/merge.html ---------------------------------------------#\n\nmerge:\n  - &CENTER { x: 1, y: 2 }\n  - &LEFT { x: 0, y: 2 }\n  - &BIG { r: 10 }\n  - &SMALL { r: 1 }\n  \n  # All the following maps are equal:\n  \n  - # Explicit keys\n    x: 1\n    y: 2\n    r: 10\n    label: nothing\n  \n  - # Merge one map\n    << : *CENTER\n    r: 10\n    label: center\n  \n  - # Merge multiple maps\n    << : [ *CENTER, *BIG ]\n    label: center/big\n  \n  - # Override\n    << : [ *BIG, *LEFT, *SMALL ]\n    x: 1\n    label: big/left/small\n\n# http://yaml.org/type/null.html ----------------------------------------------#\n\nnull:\n  # This mapping has four keys,\n  # one has a value.\n  empty:\n  canonical: ~\n  english: null\n  ~: null key\n  # This sequence has five\n  # entries, two have values.\n  sparse:\n    - ~\n    - 2nd entry\n    -\n    - 4th entry\n    - Null\n\n# http://yaml.org/type/str.html -----------------------------------------------#\n\nstring: abcd\n\n# http://yaml.org/type/timestamp.html -----------------------------------------#\n\ntimestamp:\n  canonical:        2001-12-15T02:59:43.1Z\n  valid iso8601:    2001-12-14t21:59:43.10-05:00\n  space separated:  2001-12-14 21:59:43.10 -5\n  no time zone (Z): 2001-12-15 2:59:43.10\n  date (00:00:00Z): 2002-12-14\n\n\n# JavaScript Specific Types ####################################################\n################################################################################\n\n# https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/RegExp\n\nregexp:\n  simple: !!js/regexp      foobar\n  modifiers: !!js/regexp   /foobar/mi\n\n# https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/undefined\n\nundefined: !!js/undefined ~\n\n# https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Function\n\nfunction: !!js/function >\n  function foobar() {\n    return \'Wow! JS-YAML Rocks!\';\n  }\n\n\n# Custom types #################################################################\n################################################################################\n\n\n# JS-YAML allows you to specify a custom YAML types for your structures.\n# This is a simple example of custom constructor defined in `js/demo.js` for\n# custom `!sexy` type:\n#\n# var SexyYamlType = new jsyaml.Type(\'!sexy\', {\n#   kind: \'sequence\',\n#   construct: function (data) {\n#     return data.map(function (string) { return \'sexy \' + string; });\n#   }\n# });\n#\n# var SEXY_SCHEMA = jsyaml.Schema.create([ SexyYamlType ]);\n#\n# result = jsyaml.load(yourData, { schema: SEXY_SCHEMA });\n\nfoobar: !sexy\n  - bunny\n  - chocolate\n\n```',1503297953,NULL,NULL,0,0,1,0,NULL,1),(63,1,37,'01-Docker入门基础篇','##Step1：了解Docker\n>开源的容器平台:Golang https://github.com/docker/docker\n>Docker Hub: 用于分享、管理 Docker 容器的 Docker SaaS 平台 -- Docker Hub Docker 使用客户端-服务器 (C/S) 架构模式。Docker 客户端会与 Docker 守护进程进行通信。Docker 守护进程会处理复杂繁重的任务，例如建立、运行、发布你的 Docker 容器。Docker 客户端和守护进程可以运行在同一个系统上，当然你也可以使用 Docker 客户端去连接一个远程的 Docker 守护进程。Docker 客户端和守护进程之间通过 socket 或者 >    RESTful API 进行通信。\n>##安装\n>我的是centos7.2安装请参考官方的Install的文字文档\n\n\n##Step2：Docker基本命令\n\n>查看\n>$docker search centos\n>下载\n>$docker pull centos\n>使用阿里云的镜像 [阿里云镜像](https://dev.aliyun.com/search.html)\n>```\n>- 打开管理界面\n>- 我的加速器\n> 	$sudo cp -n /lib/systemd/system/docker.service /etc/systemd/system/docker.service\n> 	$sudo sed -i \"s|ExecStart=/usr/bin/docker daemon|ExecStart=/usr/bin/$docker daemon --registry-> mirror=https://***.mirror.aliyuncs.com|g\" /etc/systemd/system/docker.service\n> 	$sudo systemctl daemon-reload\n> 	$sudo service docker restart\n> \n>```\n\n\n##Step3：创建容器\n>```\n> 	#docker run centos\n> 	#docker run 镜像(如果没有这个镜像，就回去自动下载它)\n> 	创建容器并执行一个命令\n> 	#docker run centos ls\n> 	查看正在运行的容器\n> 	#docker ps\n> 	查看所有得容器\n> 	#docker ps -a(-all)\n> \n>```\n\n##Step4：管理容器\n>```\n> 	*基于一个镜像可以创建很多容器\n> 	创建容器加名字\n> 	#docker run --name demo-server centos /bin/echo \'demo\'\n> 	查看容器\n> 	#docker ps -a\n> 	移除容器\n> 	#docker rm (容器ID|name)\n> 	查看日志\n> 	#docker logs demo-server(容器名字)\n>```\n>	官方的命令文档：[Doc](https://docs.docker.com/engine/reference/commandline/#/container-commands) \n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/01/ps-a-cmd.png)\n\n##Step5：带互动的容器\n>```\n> 	Docker Run\n> 	使用方法:  docker run [OPTIONS] IMAGE [COMMAND] [ARG...]\n> 	创建一个新的容器\n> \n> 	#参数optios：\n> 	\n> 	 带互动的容器，可以进入容器运行内部：\n> 	 -i, --interactive                 Keep STDIN open even if not attached\n>     大家都知道tty是什么东西了吧\n>	 -t, --tty                         Allocate a pseudo-TTY\n>	\n>	官方一个互动案例：\n>```\n>我的\n>\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/01/run-it-cmd.png)\n>官方案例：\n>\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/01/auth-it-cmd.png)\n\n##Step6：后台运行一个容器\n>```\n>   运行后台:\n>	-d, --detach                      Run container in background and print container ID	\n>	停止运行\n>	#docker stop (id|name)\n>	删除所有已经停止的容器\n>	#docker rm $(docker ps -a -q)\n>```\n\n##Step7：退出容器后，重新进入可交互的容器\n>```\n>退出容器\n>#exit\n>退出后重新进入可以交互的container\n>#docker attach (id|name)\n>```	\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/01/rename-attach-cmd.png)\n\n\n##Step8：基于当前centos的nodejs环境进行提交容器\n>```\n>##添加\n>[官方文档](https://docs.docker.com/engine/reference/commandline/commit/)\n>当我们修改了容器后，我们想把这个作为一个新的镜像进行发布\n>这里我把centos安装了nodejs环境的作为一个images进行提交\n>\n>#！当然如果你想学习Nodejs，那么在我的博客中请转移到Nodejs分类目录；\n>\n>#docker commit -a zhaojunlike -m \'test-commit nodejs\' nodejs-test zhaojunlike/nodejs-test:latest\n>#\n>```\n>##移除\n>[官方文档](https://docs.docker.com/engine/reference/commandline/rmi/)\n>```\n>#docker rmi [id|name]\n>```\n>\n>###文档部分提交镜像说明\n>```\n>Usage:  docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]\n>\n>Create a new image from a container\'s changes\n>\n>Options:\n>  -a, --author string    Author (e.g., \"John Hannibal Smith <hannibal@a-team.com>\")\n>  -c, --change value     Apply Dockerfile instruction to the created image (default [])\n>      --help             Print usage\n>  -m, --message string   Commit message\n>  -p, --pause            Pause container during commit (default true)\n>```\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/01/docker-new-image.png)\n>##查看镜像\n>```\n>#docker images\n>接下来我们使用自己的镜像\n>#docker run zhaojunlike/nodejs-test node -e \'console.log(1)\'\n>输出结果：1\n>#\n>```\n##Step9：如何使用Dockerfile 创建镜像\n>[官方文档](https://docs.docker.com/engine/reference/builder/)\n>\n>Dockerfile中，我们使用指令去指定一些操作的配置，建议对比官方文档，没毛病\n>\n>指令说明：\n>-  FROM:\n>```\n>- FROM <image>\n>- FROM <image>:<tag>\n>- FROM <image>@<digest>\n>```\n>-  MAINTAINER\n>```\n>作者\n>```\n>-  RUN\n>```\n>-  RUN <command> (shell form, the command is run in a shell, which by default is /bin/sh -c on Linux or cmd /S /C on Windows)\n>-  RUN [\"executable\", \"param1\", \"param2\"] (exec form)\n>```\n>-  CMD\n>```\n>```\n>指令太多了，官方文档每一个解释都相当完善\n>\n>现在我写好了一个Dockerfile文件我们去构建他\n>[官方文档](https://docs.docker.com/engine/reference/commandline/build/)\n>>由于个人愚昧，我贴了一端安装nginx的代码\n>>```\n>>#FROM 基于馁个镜像进行创建，这里我们基于我们已经安装好的centos\n>>  FROM centos\n>>  MAINTAINER zhaojunlike\n>>  #当然这里肯定不是这么写的，我只是测试一下\n>>  RUN yum install zlib-devel pcre-devel gcc wget make -y\n>>  RUN wget http://nginx.org/download/nginx-1.10.2.tar.gz\n>>  RUN mkdir /home/tmp\n>>  RUN tar -zxf /nginx-1.10.2.tar.gz -C /home/tmp\n>>  RUN cd /home/tmp/nginx-1.10.2 && ./configure --prefix=/usr/local/nginx1.10.2/\n>>  RUN cd /home/tmp/nginx-1.10.2 &&  make && make install\n>>  RUN /usr/local/nginx1.10.2/sbin/nginx\n>>```\n>然后进行镜像构建\n>```\n>#[root@localhost myDocker]# docker build --tag zhaojunlike:centos-nginx-install .\n>之所以是. docker会自动去当前目录找Dockerfile这个文件\n>```\n>>当中的过程就是把sh全部丢进去了。\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/01/docker-build-suc.png)\n>在build成功后我们可以\n>```\n>#docker images 就可以看到我们的镜像了\n>```\n>but这些是什么鬼，可能是我在build很多次都不成功产生的cache\n>我要去rmi掉\n>```\n># docker rm $(docker ps -a -q)\n>```\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/01/docker-some-other.png)\n>然后我们看看馁\n>docker真心爽\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/01/docker-is-so-smarty.png)\n>妈妈再也不容担心，环境安装麻烦啦。\n>不过接下来得问题，是让我自己去访问这个镜像里面得nginx web,那么下一篇应该是如何守护进程跑容器，如何进行网络管理了吧\n\n\n##附页\n>docker hub 成千上万的容器，大部分都是其他开发者上传的，我们也去上传一个。\n>\n>[官方文档](https://docs.docker.com/engine/reference/commandline/login/)\n>\n>具体工作请看完文档吧',1503297990,NULL,NULL,0,0,1,0,NULL,1),(64,1,37,'02-Docker入门网络篇','#基础入门之网络容器篇\n>####Author:zhaojunlike@\n>####Email：zhaojunlike@gmail.com\n>####本篇文章来自于官方基于文档的指南学习整理\n>####如果英语好的同学其实可以看文档，更加详细。[传送门](https://docs.docker.com/engine/tutorials/networkingcontainers/)\n\n##Step1：网络容器\n>##1.部署一个默认网络容器\n>```\n>查看网络列表\n>#docker network ls\n>我们看到我们有3个network，bridge是一个特殊的网络，docker默认的在这个网络中启动我们的容器。\n>```\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/02/docker-network-ls.png)\n>```\n>Step1:创建一个后台运行的容器，如果您不了解这些命令那么您可以回到第一节blog文章里面查看\n>#docker run -itd --name=network-test centos\n>Step2:查看容器的ip地址\n>#docker network inspect bridge\n>Step3:从一个网络中移除一个容器(后面一个参数|the name is faster)\n>#docker network disconnect bridge [id|name]\n>```\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/02/docker-network-rm.png)\n>###咦，好像我们docker network还不知道有哪些，我们来help一下\n>```\n>#docker network \n>Usage:    docker network COMMAND\n>\n>Manage Docker networks\n>\n>Options:\n>      --help   Print usage\n\n>Commands:\n>  connect     Connect a container to a network(让一个容器链接一个网络)\n>  create      Create a network(创建一个网络)\n>  disconnect  Disconnect a container from a network（取消链接）\n>  inspect     Display detailed information on one or more networks（显示网络详细）\n>  ls          List networks（网络列表）\n>  rm          Remove one or more networks（移除网络）\n>\n>Run \'docker network COMMAND --help\' for more information on a command.\n>\n>```\n>好，我们已经知道了网络的命令我们来试一试\n>##2.创建一个网络\n>我们还是查看一下docker network create --help\n>```\n>Usage:    docker network create [OPTIONS] NETWORK\n>\n>Create a network\n>\n>Options:\n>      --aux-address value    Auxiliary IPv4 or IPv6 addresses used by Network driver (default map[])\n>  -d, --driver string        Driver to manage the Network (default \"bridge\")\n>      --gateway value        IPv4 or IPv6 Gateway for the master subnet (default [])\n>      --help                 Print usage\n>      --internal             Restrict external access to the network\n>      --ip-range value       Allocate container ip from a sub-range (default [])\n>      --ipam-driver string   IP Address Management Driver (default \"default\")\n>      --ipam-opt value       Set IPAM driver specific options (default map[])\n>      --ipv6                 Enable IPv6 networking\n>      --label value          Set metadata on a network (default [])\n>  -o, --opt value            Set driver specific options (default map[])\n>      --subnet value         Subnet in CIDR format that represents a network segment (default [])\n>\n>```\n>###let\'s go\n>```\n>创建网络\n>#docker network create my-test-d-network\n>创建一个容器，加入这个网络\n>#docker run -d --network=my-test-d-network --name my-network-test-c centos\n>```\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/02/docker-network-create-d.png)\n>我们查看一下刚才创建的容器的网络配置\n>```\n>#docker inspect --format=\'{{json .NetworkSettings.Networks}}\' my-network-test-c\n>  \n>```\n>好了，到这儿，我们去跟着官方实战一下吧，之前我build了一个已经安装好了nginx的容器，那么现在我将使用这个容器去配置。\n>\n>```\n>Open a shell into the db application again and try the ping command. This time just use the container name web rather than the IP Address.\n>#使用容器的名称，而不使用地址\n>[root@0037207f115d home]# wget c-test-3\n>```\n>###从一个网络中，移除一个容器\n>```\n>#docker network disconnect [network] [container]\n>```\n\n##整理一下思路\n>###Step1:创建一个网络\n>```\n>我们取个名字叫test-network\n>[root]#docker network create test-network\n>```\n>###Step2:查看创建网络的信息\n>```\n>[root]#docker network inspect test-network\n>```\n>###Step3:创建2个容器\n>```\n>[root]#docker run -dit --name=test-1 centos\n>[root]#docker run -dit --name=test-2 centos\n>当然官方也有直接使用一个--network来配置网络的\n>```\n>###Step4:把2个容器加入网络\n>```\n>我们先看看帮助\n>[root]# docker network connect --help\n>接下来我们加入2个容器\n>[root@localhost myDocker]# docker network connect test-network test-1\n>[root@localhost myDocker]# docker network connect test-network test-2\n>```\n>\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/02/docker-network-connect-help.png)\n>\n>```\n>接下来我们再查看一下网络的详细\n>[root]#docker network inspect test-network\n>这样我们就确定了我们的容器已经加入了这个网络，我们看到2个容器在同一个网段里面，接下来我们去ping一下\n>```\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/02/docker-network-inspect-test-network.png)\n>###Step5:测试网络\n>docker有一个这样得方法，去运行我们的容器\n>```\n>[root]#docker exec -it test-1 bash\n>[root]#docker exec -it test-2 bash\n>我们是用test-1 ping test-2\n>这里我们不是直接去使用ip地址，而是使用docker的名称\n>```\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/02/docker-ping-test-1.png)\n###补充：端口\n>如果我们需要将容器的端口给外界访问，那么我们应该去指定一个端口映射，let\'s go\n>```\n>在docker中有一个 port 的命令 ，我们去help一下\n>[root]#docker port --help\n>如图便是port的映射，我们去开放我们的test-1的80端口，随便映射到一个端口上。\n>```\n>But 好像port指令无法进行端口的配置，然后我们来到之前的一个文档中，看到在run一个镜像的时候，有一个指定开放端口，我们去看下\n>\n>尴尬\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/02/docker-port-setting.png)\n>我们查看#docker run -help\n>```\n>发布所有暴露端口随机端口。\n>  -P, --publish-all                 Publish all exposed ports to random ports\n>我们看官方的提示，可以使用p参数进行端口指定\n>  docker run -d -p 80:5000 training/webapp python app.py\n>```\n>我们去试一试，现在我去pull了一个nginx的镜像，接下来我们去创建一个开放了80端口的容器\n>```\n>[root]#docker run -d -p=9999:80 --name=test-5 nginx \n>[root]#docker ps -a \n>```\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/02/docker-run-p-test.png)\n>我们看到已经把centos本机的9999端口 映射到了容器test-5得80端口上，因为test-5上面的nginx已经启动了，并且在centos 9999得端口已经开放，我们使用ip去访问一下这个端口\n>![](https://raw.githubusercontent.com/zhaojunlike/blogs/master/docker/images/02/docker-view-port-suc.png)\n>这样就说明成功啦，是不是有点小激动。！！\n\n##网络篇结束,下面是我在学习途中遇到的一些问题而寻找的答案。\n>Docker run -d：err not running => http://blog.csdn.net/meegomeego/article/details/50707532\n>docker port set =>http://blog.csdn.net/libraryhu/article/details/52443447',1503298010,NULL,NULL,0,0,1,0,NULL,1),(65,1,37,'01-01 DockerPull太慢，换阿里云镜像','1. 地址【https://dev.aliyun.com/search.html】\n\n2.\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-31f1b114251834d7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n\n3.\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-b3b48313d6f0c43f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n\n4.\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-3103d6975c4bf2a7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n\n5.\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-db3a715f6cc9a2d4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)',1503298029,NULL,NULL,0,0,1,0,NULL,1),(66,1,37,'Docker创建容器无法访问外网问题','在我自建容器的时候。出现如下图问题\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-18abc7ceb0083fb0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n看图应该是容器内网络问题，接着我创建了一个互动容器。\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-5f7af17998b44768.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n证实确实是容器内部网络链接问题。接着我百度搜了一下答案，大家也都提出了解决方案，那么到底是为什么呢，我在官网找到了问题的答案。\n\nhttps://docs.docker.com/engine/userguide/networking/#the-default-bridge-network-in-detail\n\n\n测试：\n1.清除所有开启的容器\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-ecb963059c2ca1fa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n2.使用不带net参数\n创建两个容器,查看网络\n```\n#docker run -itd centos\n# docker network inspect bridge\n\n```\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-42c4c32c5515c90e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n这里容器只能ping通内部网络，在docker默认创建的时候如果不加上net参数，docker会默认的去创建一个桥接网络分配给docker。\n\n首先如果我们要理解几种网络模式\nhttp://www.cnblogs.com/ggjucheng/archive/2012/08/19/2646007.html\n\n\n\n>第二天早上，我重启了虚拟机，但是发现我启动的容器又能ping外网了，靠什么鬼。。。。昨天的问题还没解决呢\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-dc1460cca0815305.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n其实我心里的问题，应该是容器被创建的时候后没有网关的\n\n如下启动的两个默认的网络容器\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-68e14d4be44c8b62.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)',1503298046,NULL,NULL,0,0,1,0,NULL,1),(67,1,37,'Docker笔记-attach进入容器，退出后容器停止运行','官方文档：\nhttps://docs.docker.com/engine/reference/commandline/attach/\n\n用法实例：\n```\n创建一个后台运行可以互动的容器\n#docker run -itd --name test-attach-1 centos\n查看正在运行的容器\n#docker ps \nattach命令进入容器\n#docker attach test-attach-1\n```\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-d1c5416d00b76c68.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n```\n我们常用户退出终端命令，exit\ndocker ps 发现容器退出了。\n```\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-7320d3f6f48a516d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n官方文档描述\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-73f716ba90fc8bb0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n```\n如果使用<code>CTRL+C</code>会发送一个SINKILL信号，所以如果我们不想我们的容器退出，我们可以是用\nCTRL-p CTRL-q\n```',1503298058,NULL,NULL,0,0,2,0,NULL,1),(68,1,37,'03-Docker入门存储篇','#Docker的数据存储\n>Author:zhaojunlike@\n>\n>Email：zhaojunlike@gmail.com\n>\n>本篇文章来自于官方基于文档的指南学习整理\n>\n>如果英语好的同学其实可以看文档，更加详细。[数据管理传送门](https://docs.docker.com/engine/tutorials/dockervolumes/)\n\n\n##Docker的存储原理\n在docker的管理中,一个容器是很轻易的创建或者销毁的，如果我们直接创建一份容器，当在销毁他的时候，容器里面得数据配置，也变得不存在了，那么这个时候我们就需要一个共享的数据盘来存储已经管理我们的数据。\n<code>#docker volume --help</code>\n\n\n##给容器创建一个数据卷\n\n```\n$docker run -d -P --name web1 -v /server/webapp:/webapp nginx\n```\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-b62b7edf5eb64256.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n```\n查看容器详细\n$docker inspect web1\n我们可以看到有一个Mounts\n```\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-ce50a1655e5a4959.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n##挂载只读数据卷\n```\n$docker run -d -P --name web2 -v /server/webapp/:/usr/share/nginx/html:ro centos\n```\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-e47a44494b322213.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n\n\n##多个容器之间管理挂载数据卷\n>1.使用共享卷的好处是它们与主机无关。\n2.使用卷驱动程序的一种方法是通过docker运行命令。卷驱动程序通过名称创建卷，而不是像其他示例中的路径。\n\n我们可以看到在Docker中给我们提供了一个Docker volume命令可以创建管理我们的数据卷\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-4d123d514da6d1fd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n我们看到了当中有一个Driver参数，那么Docker的volume中的driver是什么呢？\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-e2145a9cbf44899b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n\n##创建一个数据卷容器\n\n```\nroot@ubuntu-docker:~# docker create -v /server/dbdata/ --name dbstore ubuntu\nroot@ubuntu-docker:~# docker ps\nCONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES\nd72d1d94e546        ubuntu              \"/bin/bash\"         About a minute ago   Up About a minute                       determined_goldstine\nroot@ubuntu-docker:~# docker run -it --rm --volumes-from dbstore ubuntu\nroot@8b12671bffe7:/# df -h\nFilesystem      Size  Used Avail Use% Mounted on\nnone             19G   13G  4.9G  73% /\ntmpfs           2.0G     0  2.0G   0% /dev\ntmpfs           2.0G     0  2.0G   0% /sys/fs/cgroup\n/dev/sda1        19G   13G  4.9G  73% /dbdata\nshm              64M     0   64M   0% /dev/shm\nroot@8b12671bffe7:/# \n\n```',1503298076,NULL,NULL,0,0,1,0,NULL,1),(69,1,37,'Docker问题-启动的mongo等容器启动失败','![image.png](http://upload-images.jianshu.io/upload_images/3100692-295c72f6ddd75027.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n启动Mariadb或者Mongo的，run了发现容器就自己死掉了\n下面是日志信息\n```\n$docker logs db-1\n\nchown: changing ownership of \'/proc/1/fd/1\': Permission denied\nchown: changing ownership of \'/proc/1/fd/2\': Permission denied\nabout to fork child process, waiting until server is ready for connections.\nforked process: 19\nERROR: child process failed, exited with error number 1\nchown: changing ownership of \'/proc/1/fd/1\': Permission denied\nchown: changing ownership of \'/proc/1/fd/2\': Permission denied\nabout to fork child process, waiting until server is ready for connections.\nforked process: 18\nERROR: child process failed, exited with error number 1\n\n```\n\n找了半天解决方案如下：\n1.http://www.cnblogs.com/YDDMAX/p/6184100.html\n2.在mongo官方文档中，也有这样得一行说明\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-c60306f1074354cb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n\n在关闭了SELINUX后，终于跑起来啦。\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-ebbadf85f0affb41.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n\n##WHY？\n我一直都有一个只想解决问题，从不去知所以然，不过这次我要去看看所以然了',1503298088,NULL,NULL,0,0,1,0,2,1),(70,1,37,'Docker Rancher启动失败','```\ndocker run -d --restart=unless-stopped -p 8080:8080 rancher/server\n45f69f2069fa5a5163ac7cad8a84067bc57ea8a1e4d278054816ca2666d6fb53\ndocker: Error response from daemon: driver failed programming external connectivity on endpoint elegant_meitner (1d7f0019e0cdab0edbe751d6e93c821a8933a1e23e962c4de606fb6a7be1bd2b): iptables failed: iptables --wait -t nat -A DOCKER -p tcp -d 0/0 --dport 8080 -j DNAT --to-destination 172.17.0.2:8080 ! -i docker0: iptables: No chain/target/match by that name.\n```\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-6dd3af34bdaa36a2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n如上问题，主要错误信息：\n```\niptables failed: iptables --wait -t nat -A DOCKER -p tcp -d 0/0 --dport 8080 -j DNAT --to-destination 172.17.0.2:8080\n```\ndocker依赖iptables策略。\n我尝试着去重启docker网络\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-be303a8fbe30eeeb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-348f2e302831dfc5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n在启动最后重启docker服务，然后接着测试了一下那个报错的信息当中的命令\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-cb2e765049b3cdb6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n发现成功了，说明的确是网络故障，也就说明之前我文章中得出现网络问题的原因也和之前的问题有一些关联。\n\n最后解决这个问题就是删除一下我添加的策略重新启动一下rancher容器就可以了，\n\n\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-3be9a7b70e22324f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n\n\n\n\n\n参考文章：\n\nhttp://fp-moon.iteye.com/blog/1468650\nhttp://www.linuxidc.com/Linux/2015-02/113141.htm\nhttp://docs.rancher.com/rancher/v1.5/en/',1503298101,NULL,NULL,0,0,1,0,2,1),(71,1,37,'17.04.14  docker-machine 工具使用总结(1)','>参考：\n- https://github.com/docker/machine/\n- https://docs.docker.com/machine/overview/\n- http://lizhenliang.blog.51cto.com/7876557/1730028\n- https://www.oschina.net/news/50591/docker-0-10\n- http://www.csdn.net/article/2015-08-11/2825438\n\n\n##概述\n官方概述3点：\n-  Install and run Docker on Mac or Windows\n-  Provision and manage multiple remote Docker hosts\n-  Provision Swarm clusters\n如果是windows和macos的用户，便默认已经带有docker-machine了，linux用户用它主要来做集群管理，管理docker等一系列的操作工具。\n\ndocker machine 是一个简化的Docker安装的命令工具，通过简单命令来进行响应平台的docker安装，比如virtualbox，microsoft azure。举个如果你有多个操作系统，ubuntu windows centos macos，那么我都需要按照官网文档上的来一步一步的学习安装，不同的操作系统安装步骤也都不一样，所以有了machine以后，它通过ssh来链接到主机，我们只需要几个简单的命令就可以让主机安装docker，这对集群来说是非常方便的。\n\n简单来说docker解决了一下几个问题\n-  Docker Machine简化了部署的复杂度，无论是在本机的虚拟机上还是在公有云平台，只需要一条命令便可搭建好Docker主机\n- Docker Machine提供了多平台多Docker主机的集中管理\n-  Docker Machine 使应用由本地迁移到云端变得简单，只需要修改一下环境变量即可和任意Docker主机通信部署应用\n\n##安装docker-machine\n\n安装过程请参考：https://github.com/docker/machine/\n在安装过程中，可能会遇到,curl下载不下来的情况,所以我们可以自己去git上去下载，选择自己得操作系统版本\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-4e48877243251ce3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n我们可以使用windows翻墙或者用代理的方式去下载好machine传入给linux操作系统\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-1b1613f8855db51d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n后面发现,之所以慢，原来。。。。\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-32f96d99f122cc38.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n在我翻墙或者使用迅雷下载以后\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-83ffbd82a8882069.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n这个时候我们使用 docker-machine 命令就可以查看到此工具的帮助信息了\n\n##附加（安装docker-machine bash自动完成脚本）\n-  命令自动完成\n- 在shell提示符中显示活动的机器\n- 一个函数包装器，它添加了docker-machine use子命令来切换活动的计算机\n\nhttps://github.com/docker/machine/tree/master/contrib/completion/bash\n\n##Docker machine运行原理\n\n这张图是官网介绍图，docker-machine是更方便集群管理的，就和你得服务器管理员一样，无论是做监控还是做操作，通过docker-machine便可以去管理一片docker主机，在使用过程中，我们可以去使用virtualbox来安装多个虚拟机器来安装docker，并且使用docker-machine来管理这些机器\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-a5015304294482a3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n##命令解析\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-23d46fa95e242fe9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n##使用Docker Machine和本地虚拟机的docker主机\nhttps://docs.docker.com/machine/get-started/\n如果是linux的用户，在我们已经确保服务器含有[ VirtualBox ](https://docs.docker.com/machine/drivers/virtualbox/)软件后（如果没有装virtualbox我们使用<code>#apt install virtualbox</code>）， 我们可以直接安装docker提供的一个 [Boot2Docker](https://github.com/boot2docker/boot2docker)，Boot2Docker是一个专门用于运行Docker容器的轻量级Linux发行版，这样可以保证我们的本地电脑资源尽可能的少被我们不需要的程序浪费掉。\nDocker-machine在创建一个虚拟主机的时候会直接去下载boot2docker。\n\n- 初探运行一个包含docker的虚拟主机\n如果遇到如下问题\n```\nrror with pre-create check: \"Get https://github-\ncloud.s3.amazonaws.com/releases/14930729/2a7d9b36-1aba-11e7-951b-a7c27f5bb4fd.iso?X-\nAmz-Algorithm=AWS4-HMAC-SHA256&X-Amz-\nCredential=AKIAISTNZFOVBIJMK3TQ%2F20170414%2Fus-east-1%2Fs3%2Faws4_request&X-\nAmz-Date=20170414T013059Z&X-Amz-Expires=300&X-Amz-\nSignature=b4fb1737c6bc10503dec6f45e0bf6de269336fdf1f939eca6657fa207cb4c87b&X-Amz-\nSignedHeaders=host&actor_id=0&response-content-\ndisposition=attachment%3B%20filename%3Dboot2docker.iso&response-content-\ntype=application%2Foctet-stream: dial tcp 52.216.64.200:443: getsockopt: connection refused\"\n```\n我们可以手动的去下载此镜像，然后放到docker-machine能找到的地方\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-5340b222c10b3368.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n为了确保你不重复工作，请下载最新的boot2docker版本\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-8a17586289c6af83.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n\n- 安装Boot2Docker\nhttps://github.com/boot2docker/boot2docker/releases\n\n-  首秀测试 \n```\nroot@ubuntu-docker:/home# docker-machine create -d virtualbox mh-keystore\nRunning pre-create checks...\nError with pre-create check: \"This computer doesn\'t have VT-X/AMD-v enabled. Enabling it in the BIOS is mandatory\"\n```\n我的ubuntu-docker是运行在windows10宿主机上的Vmware里面的一个Ubuntu16的操作系统。下面是我查询到的一些问题，解决方案就是在vmware当中开启虚拟化引擎就可以了\nhttps://github.com/docker/machine/issues/2256\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-3963225f0397a8d3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n接着测试，如果出现以下结果，就说明virtualbox安装成功了\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-a1e17517463c56e0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n```\nroot@ubuntu-docker:~/.docker/machine/cache# docker-machine create -d virtualbox mh-keystore\nRunning pre-create checks...\nCreating machine...\n(mh-keystore) Copying /root/.docker/machine/cache/boot2docker.iso to /root/.docker/machine/machines/mh-keystore/boot2docker.iso...\n(mh-keystore) Creating VirtualBox VM...\n(mh-keystore) Creating SSH key...\n(mh-keystore) Starting the VM...\n(mh-keystore) Check network to re-create if needed...\n(mh-keystore) Found a new host-only adapter: \"vboxnet0\"\n(mh-keystore) Waiting for an IP...\nWaiting for machine to be running, this may take a few minutes...\nDetecting operating system of created instance...\nWaiting for SSH to be available...\nDetecting the provisioner...\nProvisioning with boot2docker...\nCopying certs to the local machine directory...\nCopying certs to the remote machine...\nSetting Docker configuration on the remote daemon...\nChecking connection to Docker...\nDocker is up and running!\nTo see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: docker-machine env mh-keystore\n```\n这样我们就创建了一个新的含有docker虚拟主机的环境\n不得不说我的环境确实奇葩（windows10宿主机>Vmware(Ubuntu Linux)>VirtualBox(boot2docker)）\n\n##docker-machine的详细使用\n在我们已经搭建docker-machine要使用的virtual-box和boot2docker后，我们已经成功的运行了一个虚拟的主机操作系统并且已经内置了docker\n\n- 1.查看已经启动的机器\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-981d694fbf3559d4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n- 2.查看主机上的环境\n```\nroot@ubuntu-docker:/# docker-machine env mh-keystore\nexport DOCKER_TLS_VERIFY=\"1\"\nexport DOCKER_HOST=\"tcp://192.168.99.100:2376\"\nexport DOCKER_CERT_PATH=\"/root/.docker/machine/machines/mh-keystore\"\nexport DOCKER_MACHINE_NAME=\"mh-keystore\"\n# Run this command to configure your shell: \n# eval $(docker-machine env mh-keystore)\n```\n- 3.链接到主机的shell,如果没有任何的报错，就说明链接成功了\n```\n#eval \"$(docker-machine env my-machine)\"\n```\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-91e04dfcaaa550aa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n- 4.查看主机的IP地址\n```\n $ docker run -d -p 8000:80 nginx\n```\n\n\n##案例，在主机my-host中创建一个nginx的webserver\n```\n\n```',1503298114,1503309739,NULL,0,0,1,0,NULL,1),(72,1,37,'17.04.14  docker-machine 工具使用总结(2)','上篇：http://www.jianshu.com/p/bde12f45e75c 已经记录到了再docker-machine学习中遇到的问题，但是大部分都是安装的问题，还有在运行过程中遇到的问题，这篇我将记录docker-machine详细得操作。\n\n参考：\nhttp://dockone.io/question/520\nhttps://docs.docker.com/machine/reference/create/#specifying-configuration-options-for-the-created-docker-engine\n\n引用：\n```\ndocker-machine env dev\n会输出几行shell语句，例如\nexport DOCKER_TLS_VERIFY=\"1\"\nexport DOCKER_HOST=\"tcp://192.168.99.100:2376\"\nexport DOCKER_CERT_PATH=\"/Users/Eason/.docker/machine/machines/default\"\nexport DOCKER_MACHINE_NAME=\"default\"\nRun this command to configure your shell:\n\neval \"$(docker-machine env default)\"\n\n\n\n\neval \"$(docker-machine env dev)\" 的意思就是把上面的输出当做shell 命令在当前shell下执行。\n\n最终的结果就是当前shell下多了几个环境变量，docker client就是靠着这些环境变量来决定和docker daemon交互的行为的。\n```\n\n\n##ls##\n查看主机的数量和状态\n```\n$docker-machine ls\n```\n\n##active##\n查看那个一个主机被激活，在没有使用某一个主机的环境时候，docker-machine ls 中的active都是-值\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-39b7c0bb32740ac6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n##config##\n打印链接主机信息\n```\nroot@ubuntu-docker:/workspace/docker_1# docker-machine config my-host\n--tlsverify\n--tlscacert=\"/root/.docker/machine/machines/my-host/ca.pem\"\n--tlscert=\"/root/.docker/machine/machines/my-host/cert.pem\"\n--tlskey=\"/root/.docker/machine/machines/my-host/key.pem\"\n-H=tcp://192.168.99.101:2376\nroot@ubuntu-docker:/workspace/docker_1# \n```\n\n##create*##\ncreate是docker-machine最重要的命令，他可以进行主机的创建，在创建使用参数来指定使用的驱动环境\n在前文最后，我们使用create创建了一个my-host的docker虚拟主机环境，并使用virtualbox作为虚拟机，boot2docker作为操作系统\n```\n$docker-machine create --driver virtualbox my-host\n```\n-  查看帮助信息\n```\n$docker-machine create\n```\n- docker-machine允许以下命令查看具体得帮助信息\n```\n$docker-machine create --driver virtualbox --help\n```\n- 指定配置信息来创建主机\n```\n docker-machine create -d virtualbox \\\n    --engine-label foo=bar \\\n    --engine-label spam=eggs \\\n    --engine-storage-driver overlay \\\n    --engine-insecure-registry registry.myco.com \\\n    foobarmachine\n```\n\n\n##env##\n设置环境变量来告诉docker-machine进行那一台机器的操作\n```\n$ env | grep DOCKER\n$ eval \"$(docker-machine env dev)\"\n$ env | grep DOCKER\nDOCKER_HOST=tcp://192.168.99.101:2376\nDOCKER_CERT_PATH=/Users/nathanleclaire/.docker/machines/.client\nDOCKER_TLS_VERIFY=1\nDOCKER_MACHINE_NAME=dev\n$ # If you run a docker command, now it will run against that host.\n$ eval \"$(docker-machine env -u)\"\n$ env | grep DOCKER\n$ # The environment variables have been unset.\n```\n\n##inspect##\n查看主机的详细信息\n##ip##\n查看ip地址\n##kill##\n杀掉一个主机\n##SSH##\n通过SSH链接一台主机\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-f59db38544717079.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n##status##\n查看主机状态\n\n##url##\n获取主机的url\n\n##scp##\n将文件从本地主机复制到机器，从机器到机器，或从机器复制到本地主机.',1503298138,NULL,NULL,0,0,1,0,NULL,1),(73,1,37,'01-Docker实战,搭建NodeJs环境','##目的\n>实现简单的docker的nodejs容器，使用Dockerfile构建我们的使用nodejs开发的系统\n\n\n\n##技术栈\n- Docker\n- Nodejs\n- Express\n- Linux\n\n##step1 下拉nodejs基础容器 node:\n本次我需要使用基础alpine操作系统构建的node基础容器\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-ea883d1f23e6fbdd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n##step2  创建项目文件夹\n创建一个空目录，并且创建如下文件\n```PHP\nroot@ubuntu-docker:/server/nodejs# ls\nDockerfile  package.json  server.js\n```\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-7749cb7ec4606fce.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\nDockerfile内容\n```Dockerfile\nFROM node:6.10.2-alpine\nADD . /server/www/\nWORKDIR /server/www/\nRUN cd /server/www && npm install\nEXPOSE 3001\nCMD [\"node\",\"server.js\"]\n```\npackage.json内容\n```JSON\n{\n  \"name\": \"docker-node-hello\",\n  \"private\": true,\n  \"version\": \"0.0.1\",\n  \"description\": \"Node.js with docker\",\n  \"author\": \"zhaojunlike@gmail.com\",\n  \"dependencies\": {\n    \"express\": \"3.2.4\"\n  }\n}\n```\n\nserver.js app的入口文件\n```javascript\nvar express = require(\'express\');\n\n// Constants\nvar PORT = 3001;\n\n// App\nvar app = express();\napp.get(\'/\', function (req, res) {\n  res.send(\'Hello World\\n\');\n});\n\napp.listen(PORT)\nconsole.log(\'Running on http://localhost:\' + PORT);\n\n```\n\n##step3 build\n使用以下命令来构建node-app容器\n```\n#docker build -t node-hello ./\n```\n\n![image.png](http://upload-images.jianshu.io/upload_images/3100692-c25e54b67f566906.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\n\n##step4 运行测试\n```\nroot@ubuntu-docker:/server/nodejs# docker images\nREPOSITORY                                             TAG                 IMAGE ID            CREATED             SIZE\nnode-hello                                             latest              58a5182bd055        40 seconds ago      56.34 MB\nroot@ubuntu-docker:/server/nodejs# docker run -d -p 3001:3001 node-hello\n0af03634720b3572e860b9d353fd140b88f729e938713f3c4fc694cfda3ec065\nroot@ubuntu-docker:/server/nodejs# curl localhost:3001\nHello World\nroot@ubuntu-docker:/server/nodejs# \n\n```\n\n本节学习源码：https://github.com/zhaojunlike/docker-node-hello',1503298150,1503308644,NULL,0,0,3,0,2,1),(74,1,37,'docker下安装typecho建立自己得博客系统（1）dockerfile篇','\n![screenshots.png](/upload/editor/20170822/dc4e94744e8f6f18ba748feeb9d90e5d.png)',1503298162,1503370193,NULL,0,0,4,0,1,1),(75,1,31,'PHP小结大全',NULL,1503298183,1503308237,NULL,0,0,2,0,NULL,1),(76,65,33,'qwerqe','qweqweqweqwerqweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeqweqweqweqweqwe\nerqwer\nqwer\nqwer\nqwerqwerqwe\nrq\nwer\nqwer\nqwe\nr\nasdfasdf\nas\ndf\nasdf\nasd\nf',1503536212,1503536247,NULL,0,0,1,0,NULL,1),(77,65,31,'demo','demodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemodemo',1503536279,NULL,NULL,0,0,1,0,NULL,1);
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
INSERT INTO `oeynet_system_config` VALUES (1,'系统名称','WEB_SITE_TITLE','Godtoy的博客',1,'网站显示名',1970,0),(2,'单页条数','SYSTEM_PAGE_LIMIT','5',1,'分页单页的显示条',1970,0),(3,'网站默认SEO描述','WEB_SITE_DESC','Godtoy的博客,zhaojunlike的博客,运维工程师',1,'网站默认SEO描述',NULL,0),(4,'网站默认SEO关键词','WEB_SITE_KEYWORDS','	Godtoy的博客,zhaojunlike的博客,运维工程师',1,'网站默认SEO关键词',NULL,0),(5,'前台单页条数','WEB_INDEX_PAGE_LIMIT','20',1,'前台单页条数',NULL,0),(6,'帖子自动审核通过','BBS_AUTH_STATUS_TRUE','1',1,'帖子自动审核通过（0:关闭,1开启）',NULL,0),(7,'评论自动审核通过','BBS_AUTH_COMMENT_STATUS_TRUE','1',1,'评论自动审核通过（0:关闭,1开启）',1970,0),(8,'默认游客组号','SYSTEM_DEFAULT_VIEWER_GROUP_ID','2',1,'默认游客组号(游客相关权限)',NULL,0),(9,'新注册用户默认组别','SYSTEM_USER_SIGNUP_GROUP_ID','3',1,'新注册用户默认组别(用户权限)',NULL,0),(10,'管理员联系方式','WEB_ADMINER_CONTACT','1716771371',1,'管理员联系方式',NULL,0),(11,'用户自动审核通过','USER_SIGNUP_STATUS','1',1,'用户审核状态',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_user`
--

LOCK TABLES `oeynet_user` WRITE;
/*!40000 ALTER TABLE `oeynet_user` DISABLE KEYS */;
INSERT INTO `oeynet_user` VALUES (1,'admin','zhaojunlike','d3c9c2ffb8ee26f7965abff2f178209f','',NULL,NULL,NULL,0,NULL,NULL,92,1),(61,'zhaojun','123123','84cc99dd01b647a3d26f5bd541656f95','',NULL,NULL,NULL,0,NULL,'',NULL,1),(62,'zhaojun1','HelloWorld','de0fd65cf2b6ced0dc310e899e6907f7','',NULL,NULL,NULL,0,NULL,NULL,NULL,1),(63,'zhaojun3','674674','ebb5767a586f80b1592fe3b2d3c0d4e1','',NULL,NULL,NULL,0,NULL,'',NULL,0),(64,'zhaojun12','','27025e3d19df0c923e649ff926e272f7','','zhaojun@qq.com',NULL,NULL,1503132415,'192.168.197.1','',NULL,1),(65,'zhaojunlike','zhaojunlike_6666','cb49510c7b9b919fae66aaacd8ac076c','','zhaojunlike@qq.com',NULL,NULL,1503484223,'192.168.197.1',NULL,NULL,1);
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
-- Table structure for table `oeynet_user_notice`
--

DROP TABLE IF EXISTS `oeynet_user_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oeynet_user_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL COMMENT '把这个构建成一个html格式就行了',
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户消息通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeynet_user_notice`
--

LOCK TABLES `oeynet_user_notice` WRITE;
/*!40000 ALTER TABLE `oeynet_user_notice` DISABLE KEYS */;
INSERT INTO `oeynet_user_notice` VALUES (1,65,1503486312,NULL,'用户<a href=\'\'>zhaojunlike</a>评论了您的文章<a>01-Docker实战,搭建NodeJs环境</a>',0),(2,65,1503535119,NULL,'用户<a href=\'/index/user.user/detail/id/65.html\'>zhaojunlike</a>评论了您的文章<a href=\'/post/73.html#comment_34\'>01-Docker实战,搭建NodeJs环境</a>',0),(3,65,1503535211,NULL,'用户<a href=\'/index/user.user/detail/id/65.html\'>zhaojunlike</a>评论了您的文章<a href=\'/post/73.html#comment_35\'>01-Docker实战,搭建NodeJs环境</a>',0),(4,65,1503535297,NULL,'用户<a href=\'/user/home/65.html\'>zhaojunlike</a>评论了您的文章<a href=\'/post/73.html#comment_36\'>01-Docker实战,搭建NodeJs环境</a>',0),(5,65,1503536283,NULL,'用户<a href=\'/user/home/65.html\'>zhaojunlike</a>评论了您的文章<a href=\'/post/77.html#comment_37\'>demo</a>',0),(6,65,1503536288,NULL,'用户<a href=\'/user/home/65.html\'>zhaojunlike</a>评论了您的文章<a href=\'/post/77.html#comment_38\'>demo</a>',0);
/*!40000 ALTER TABLE `oeynet_user_notice` ENABLE KEYS */;
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

-- Dump completed on 2017-08-24  9:02:49
