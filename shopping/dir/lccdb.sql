-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: lccdb
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add wheel',8,'add_wheel'),(23,'Can change wheel',8,'change_wheel'),(24,'Can delete wheel',8,'delete_wheel'),(25,'Can add goods list',9,'add_goodslist'),(26,'Can change goods list',9,'change_goodslist'),(27,'Can delete goods list',9,'delete_goodslist'),(28,'Can add goods',10,'add_goods'),(29,'Can change goods',10,'change_goods'),(30,'Can delete goods',10,'delete_goods'),(31,'Can add products',11,'add_products'),(32,'Can change products',11,'change_products'),(33,'Can delete products',11,'delete_products'),(34,'Can add computers',12,'add_computers'),(35,'Can change computers',12,'change_computers'),(36,'Can delete computers',12,'delete_computers'),(37,'Can add cart',13,'add_cart'),(38,'Can change cart',13,'change_cart'),(39,'Can delete cart',13,'delete_cart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(4,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(13,'lcc','cart'),(12,'lcc','computers'),(10,'lcc','goods'),(9,'lcc','goodslist'),(11,'lcc','products'),(7,'lcc','user'),(8,'lcc','wheel'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-10 09:46:25.119000'),(2,'auth','0001_initial','2019-01-10 09:46:25.569223'),(3,'admin','0001_initial','2019-01-10 09:46:25.656005'),(4,'admin','0002_logentry_remove_auto_add','2019-01-10 09:46:25.679821'),(5,'contenttypes','0002_remove_content_type_name','2019-01-10 09:46:25.756853'),(6,'auth','0002_alter_permission_name_max_length','2019-01-10 09:46:25.787639'),(7,'auth','0003_alter_user_email_max_length','2019-01-10 09:46:25.835354'),(8,'auth','0004_alter_user_username_opts','2019-01-10 09:46:25.871835'),(9,'auth','0005_alter_user_last_login_null','2019-01-10 09:46:25.909171'),(10,'auth','0006_require_contenttypes_0002','2019-01-10 09:46:25.912979'),(11,'auth','0007_alter_validators_add_error_messages','2019-01-10 09:46:25.923986'),(12,'auth','0008_alter_user_username_max_length','2019-01-10 09:46:25.958590'),(13,'lcc','0001_initial','2019-01-10 09:46:25.986450'),(14,'sessions','0001_initial','2019-01-10 09:46:26.017730'),(15,'lcc','0002_auto_20190110_0954','2019-01-10 09:54:28.945242'),(16,'lcc','0003_auto_20190111_0108','2019-01-11 01:08:39.014739'),(17,'lcc','0004_wheel','2019-01-11 13:23:36.660258'),(18,'lcc','0005_auto_20190111_1338','2019-01-11 13:38:20.839395'),(19,'lcc','0006_goodslist','2019-01-12 08:42:11.231615'),(20,'lcc','0006_goods','2019-01-14 08:55:21.735856'),(21,'lcc','0007_auto_20190114_0900','2019-01-14 09:00:10.353041'),(22,'lcc','0006_products','2019-01-14 09:41:13.575592'),(23,'lcc','0006_computers','2019-01-14 11:47:24.022107'),(24,'lcc','0007_auto_20190115_0816','2019-01-15 08:16:23.592000'),(25,'lcc','0008_auto_20190115_0918','2019-01-15 09:18:55.677477'),(26,'lcc','0009_auto_20190115_1200','2019-01-15 12:00:27.949657'),(27,'lcc','0010_cart','2019-01-16 09:29:05.657179'),(28,'lcc','0011_auto_20190116_0930','2019-01-16 09:30:17.305868'),(29,'lcc','0012_auto_20190116_1101','2019-01-16 11:01:47.344183'),(30,'lcc','0013_auto_20190116_1239','2019-01-16 12:39:47.926933'),(31,'lcc','0014_auto_20190116_1243','2019-01-16 12:43:46.637457'),(32,'lcc','0015_auto_20190116_1244','2019-01-16 12:44:30.294168');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0hwv2if7wq6r6z26qryspqrftwoogp8j','OTVlZGI2YTUxNWM4OTY5NjBlZGY3ZDA0ZGVmNjhiMDI0MzNiNDEzYTp7InRva2VuIjoiZTNjYmYwZGEzM2RkZWZmNDM3ZmU1NDFkM2VlNDJkMDYiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-10 11:43:10.325969'),('22lizwvo9ob1eyyabpdd73s06vomyf31','ODc4ZTczYzIzOWViYzdlODU0OGYzZWM5OGM1MzA0ZTAwYTg2OTlkODp7InRva2VuIjoiOGRlNDMyYWY0OGEzYzczYzRjMDc5ZDNmZTVmYWJiMmEiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-14 06:01:13.219524'),('3e84rwhw4ksxzhw7acajnxmng946bvwt','YWFkMzg5YjU3NWJjY2FlNmJlZWEwOTUyZjQ2MDljOTI5YzIxNmFkMTp7Il9zZXNzaW9uX2V4cGlyeSI6MTAsInRva2VuIjoiZjUwMDhkOGQ1ODhmOTIzMDg2ZTVmYzA1NjE2MzY5ZTgifQ==','2019-01-11 07:38:25.233599'),('4mmrp2bvl0dl4nz6h3l0ux5j4snuedgj','MTViOTcwOWQ5OTI1YjVkMTU3MzBlOGVlY2VjNTZlMzNjNmE4ODk3Zjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwidG9rZW4iOiIxZWU5Mzk5ZjQ4ZmY1ZTU3OTY5MTU3ZDYxNTdiYTkwZSJ9','2019-01-31 02:14:55.852837'),('75idw2ttpbqibov72pcy36crwyjg8idu','NWQ3YzVhZjhmNmVmNDI1MmZjOGMxNzRkNTgzNzZkZGFmNzYzNjdiZTp7Il9zZXNzaW9uX2V4cGlyeSI6MTAsInRva2VuIjoiZmE1OWVmNTY5MjBjYWQwZjA0NTRlZGI0MzQ1NjkyOGIifQ==','2019-01-11 08:59:25.507626'),('9ej0omrcdlqvo9ulao70ydsr4pd1rt3m','MGNkNTU1MGFiNGYzNDBkYmI4N2ZhYmMxNjE3MGJlYjUxZDJiMjU2Zjp7InRva2VuIjoiOGRlNDMyYWY0OGEzYzczYzRjMDc5ZDNmZTVmYWJiMmEifQ==','2019-01-28 12:53:07.444360'),('az0w4u5djygvh2vmbljamrhj1cv6krpz','ODc4ZTczYzIzOWViYzdlODU0OGYzZWM5OGM1MzA0ZTAwYTg2OTlkODp7InRva2VuIjoiOGRlNDMyYWY0OGEzYzczYzRjMDc5ZDNmZTVmYWJiMmEiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-14 06:27:55.864367'),('dzn09fz64bif0jby82x1z55u9yf9a3x5','MGQzZDczNDNjNjNlZDYzZGZlYmY2OTJjYmRjYWM2Y2IzYmRkMGEwNjp7Il9zZXNzaW9uX2V4cGlyeSI6MTAsInRva2VuIjoiYTg5MWU2NzkzZjBkNDQxYTE4ZjU0N2ZkYzFkMmNiMjMifQ==','2019-01-11 01:10:01.036510'),('eu54ymr87y4q5tkcd7x6rwjn76gzmb9b','ZmM4NThlMGM0MTFkNDBjOTVhNzFlNGFmZjc1ZDc4Zjk1MTc1N2E1OTp7InRva2VuIjoiZGFkZWZhOTZmNzg5MDE0M2MxZTJiY2VkNDg2NWRmNTYiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-10 11:10:36.619490'),('f7u6bc1jmp2t3xx9lca2bfhe48qhot95','ODc4ZTczYzIzOWViYzdlODU0OGYzZWM5OGM1MzA0ZTAwYTg2OTlkODp7InRva2VuIjoiOGRlNDMyYWY0OGEzYzczYzRjMDc5ZDNmZTVmYWJiMmEiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-14 06:00:10.686725'),('ia4cjwhrcpgxv3y873vq4eeph0wf4xbm','ODc4ZTczYzIzOWViYzdlODU0OGYzZWM5OGM1MzA0ZTAwYTg2OTlkODp7InRva2VuIjoiOGRlNDMyYWY0OGEzYzczYzRjMDc5ZDNmZTVmYWJiMmEiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-14 06:00:44.518700'),('ijheq21tk9k3k27nshialt2brnp6dz9u','OTVlZGI2YTUxNWM4OTY5NjBlZGY3ZDA0ZGVmNjhiMDI0MzNiNDEzYTp7InRva2VuIjoiZTNjYmYwZGEzM2RkZWZmNDM3ZmU1NDFkM2VlNDJkMDYiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-10 11:31:44.702717'),('jygvcc71l276ody7mhcv4orixngirnr8','ZTM2ODRhYjcyYjA0ZTRlNGMxOGE1MzRhMDhhNzc3NzI4ZThiNWU4Zjp7Il9zZXNzaW9uX2V4cGlyeSI6MTAsInRva2VuIjoiYjllMmY1MjM4NmI5ODk5Y2U2ZWE0MzkyZTBkYjZiNzIifQ==','2019-01-11 11:17:12.926334'),('jz6u22f6mruzggzw034hzymfxbiki62x','OTIyYmNkMTMxYTI4ZTJmZmU5ODZmOWRjMzAzMzA1NGY2ZGM2MmMwYzp7Il9zZXNzaW9uX2V4cGlyeSI6MTAsInRva2VuIjoiOGRlNDMyYWY0OGEzYzczYzRjMDc5ZDNmZTVmYWJiMmEifQ==','2019-01-14 03:56:29.421280'),('lyb8bgvn3gj1ks9hcll0bdldsnvodumu','ODc4ZTczYzIzOWViYzdlODU0OGYzZWM5OGM1MzA0ZTAwYTg2OTlkODp7InRva2VuIjoiOGRlNDMyYWY0OGEzYzczYzRjMDc5ZDNmZTVmYWJiMmEiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-14 12:51:20.989306'),('mt53yiqvitex4lm9su4oykwgxw4brsnf','NDM0ZmRhODZkM2Y2NzAzZGExYWUxODVmZGFkOWY0NzdhMmJiMDg2Nzp7InRva2VuIjoiZGJiNjg2ZDAwNGU0MWJhNzVlNjE3ZDQxMmIzYjFiZmUiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-11 11:43:07.048014'),('nsclxwyx22h0q7mqpadc3yd0zlnp915w','MWMxOTQwYjU2OWFjNzI4NjA0N2Y1ODI0OGE5ZTA2ODczZmVlMzM5Njp7InRva2VuIjoiYjVhYjYzZDllNzViYTA1YTRlNjQ3MDJiZDZjNWU4NDIiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2019-01-30 15:08:57.947763'),('qv8y60i8am4v94n0abbm2k39u0os09nl','OTIyYmNkMTMxYTI4ZTJmZmU5ODZmOWRjMzAzMzA1NGY2ZGM2MmMwYzp7Il9zZXNzaW9uX2V4cGlyeSI6MTAsInRva2VuIjoiOGRlNDMyYWY0OGEzYzczYzRjMDc5ZDNmZTVmYWJiMmEifQ==','2019-01-14 03:56:40.680690'),('u7ll3z4itzox9ipbeak0pem1q7ujjmvk','OTVlZGI2YTUxNWM4OTY5NjBlZGY3ZDA0ZGVmNjhiMDI0MzNiNDEzYTp7InRva2VuIjoiZTNjYmYwZGEzM2RkZWZmNDM3ZmU1NDFkM2VlNDJkMDYiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-10 13:49:06.329944'),('vtb1uxkp8vpzv6r7waf8s79xj0kjjjbg','NDAzN2ZhMjE0NjYwODA3NTQ2YTg1ODMyNjBmMmQxODI4YjFiYTdiZTp7InRva2VuIjoiOGRhYTJjYjllMzExMWJmOWEyYjMwN2I4OGVlM2E0YzIiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-11 11:29:11.094821'),('x0o3xm1smaqtjzqqnoa60fvev9tyxm8y','OTIyYmNkMTMxYTI4ZTJmZmU5ODZmOWRjMzAzMzA1NGY2ZGM2MmMwYzp7Il9zZXNzaW9uX2V4cGlyeSI6MTAsInRva2VuIjoiOGRlNDMyYWY0OGEzYzczYzRjMDc5ZDNmZTVmYWJiMmEifQ==','2019-01-14 03:54:45.221909'),('yx1iohklgppvumqocbqzcr2zezdnupqo','OGUwOTg3OTRiNDFkNTZkYTZiNjJjMTY0NDEzOTUwYzBkMTIwNDc2Mzp7InRva2VuIjoiYTg5MWU2NzkzZjBkNDQxYTE4ZjU0N2ZkYzFkMmNiMjMiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-11 03:51:10.313700'),('z0re9a4uo6weyf5sjdmoy8q6bbvwlo6q','NTc3Y2Y4NDU1MTJlNjkwYWJmYTMwMDBjY2ZjMjY3ZWFmOWIwYTRkZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwidG9rZW4iOiJjYTI5YzVjMmZjOTYwZmI4ZDY0YWI3NzM1MzY1MmEzMSJ9','2019-01-31 01:31:13.344196'),('z2hpywd9ntor0as0vitrengnfzks9ot8','ODc4ZTczYzIzOWViYzdlODU0OGYzZWM5OGM1MzA0ZTAwYTg2OTlkODp7InRva2VuIjoiOGRlNDMyYWY0OGEzYzczYzRjMDc5ZDNmZTVmYWJiMmEiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-14 06:28:23.290499'),('z8h09pk3158l6cw4hggx122pg5lmpddm','ODc4ZTczYzIzOWViYzdlODU0OGYzZWM5OGM1MzA0ZTAwYTg2OTlkODp7InRva2VuIjoiOGRlNDMyYWY0OGEzYzczYzRjMDc5ZDNmZTVmYWJiMmEiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==','2019-01-14 09:51:01.092955'),('zmwzo0l0azhdos7ze1829rq4o8wxt8bv','YmU1OTMzNmNjN2Q5OTczYWJlZGMxYzY3ODE2Yjk1NDg4NjA2M2NhZTp7InRva2VuIjoiZjhlNTE0OTU0MGQ0MDNlOTc4YmQ0YzRkMTY0MWNhMjYiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2019-01-30 09:42:13.114023');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcc_cart`
--

DROP TABLE IF EXISTS `lcc_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcc_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `computers_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lcc_cart_user_id_97f91594_fk_lcc_user_id` (`user_id`),
  KEY `lcc_cart_computers_id_b4417f74_fk_lcc_computers_id` (`computers_id`),
  CONSTRAINT `lcc_cart_computers_id_b4417f74_fk_lcc_computers_id` FOREIGN KEY (`computers_id`) REFERENCES `lcc_computers` (`id`),
  CONSTRAINT `lcc_cart_user_id_97f91594_fk_lcc_user_id` FOREIGN KEY (`user_id`) REFERENCES `lcc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcc_cart`
--

LOCK TABLES `lcc_cart` WRITE;
/*!40000 ALTER TABLE `lcc_cart` DISABLE KEYS */;
INSERT INTO `lcc_cart` VALUES (1,6,1,1,19),(2,10,1,2,19),(3,9,1,1,25),(4,2,1,2,25),(5,3,1,1,26),(6,2,1,2,26),(7,6,1,1,27),(8,4,1,2,27),(9,1,1,1,28),(11,3,1,1,29),(12,2,1,2,31);
/*!40000 ALTER TABLE `lcc_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcc_computers`
--

DROP TABLE IF EXISTS `lcc_computers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcc_computers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `img1` varchar(500) NOT NULL,
  `img2` varchar(500) NOT NULL,
  `img3` varchar(500) NOT NULL,
  `img4` varchar(500) NOT NULL,
  `introduce` varchar(300) NOT NULL,
  `price` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcc_computers`
--

LOCK TABLES `lcc_computers` WRITE;
/*!40000 ALTER TABLE `lcc_computers` DISABLE KEYS */;
INSERT INTO `lcc_computers` VALUES (1,'小米笔记本Air 13.3','https://wx4.sinaimg.cn/mw690/0073poJQgy1fz7c5h1fofj307p07dab4.jpg','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547550325958&di=6b4229ea7cabcdc4de677632717ee395&imgtype=0&src=http%3A%2F%2Fnres.ingdan.com%2Fuploads%2F20160729%2F14697577652532.jpg','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547550142293&di=076b52ae481456c7e27974ba1a219fb7&imgtype=0&src=http%3A%2F%2Fnres.ingdan.com%2Fuploads%2F20160729%2F1469757775723.jpg','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547550169375&di=1ff9ff2d4618957200007275edebdb32&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20160802%2F153886f7c8a54f52bd9487d5d35735a0_th.jpg','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547550193044&di=61c03dd1893a57e68b14454c3fda5711&imgtype=0&src=http%3A%2F%2Fwww.qingdaonews.com%2Fimages%2Fattachement%2Fjpg%2Fsite1%2F20160728%2F506313c3fc421903316705.jpg','小米笔记本Air 13.3 四核增强版 高性能轻薄笔记本 设计制图、运行大型 3D 游戏，复杂任务也可以轻松驾驭。 配置第八代酷睿四核 i7 处理器 / i5处理器 ','4999.00'),(2,'小米游戏本','https://wx3.sinaimg.cn/mw690/0073poJQgy1fz7c5gvta0j307o079q43.jpg','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547550481185&di=f3e752251380f4b2708db87ca54c26d7&imgtype=0&src=http%3A%2F%2Fp0.ifengimg.com%2Fpmop%2F2018%2F0808%2FA030292073F09CFD2B904F09A69F5D789F99F76D_size83_w600_h400.png','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547550510768&di=70151ab857adb88d016b84601f687a66&imgtype=0&src=http%3A%2F%2Fimg1.mydrivers.com%2Fimg%2F20180327%2Fb3833574802346c48a8ec477e7e50f9b.jpg','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547550524717&di=8ab6f16131016acb1cb15152c490610f&imgtype=0&src=http%3A%2F%2Fnews.mydrivers.com%2Fimg%2F20180327%2F19b51c1e2cc44a7f8ed04cfbacb94877.jpg','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547550545310&di=21297d10f02d76c60792722ac960ca98&imgtype=0&src=http%3A%2F%2Fimg1.mydrivers.com%2Fimg%2F20180327%2F12806f45abf347faa29716cbce1ae2d5.jpg','让你在游戏的世界里恣意闯荡，亦可在游戏之外更加专注极致地创作，这是我们的初衷。为此，我们邀请多 领域的业内专家，从配置、散热，到键盘、屏幕、音效等进行了系统级的重塑，历经两年，终于将这款小米 游戏本呈现给你。','6699.00');
/*!40000 ALTER TABLE `lcc_computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcc_user`
--

DROP TABLE IF EXISTS `lcc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `img` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lcc_user_phone_f05d2891_uniq` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcc_user`
--

LOCK TABLES `lcc_user` WRITE;
/*!40000 ALTER TABLE `lcc_user` DISABLE KEYS */;
INSERT INTO `lcc_user` VALUES (19,'13333333333','688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6','327484d06acb66fc2acb7eeb3f3630cc','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547563523328&di=454d5a9af6531d6a5737be1faad62291&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201705%2F24%2F002346yjf4j61jmcepjjzg.jpg'),(25,'14444444444','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','82994bf4966744e2a69035be2b7e2a64','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547563523328&di=454d5a9af6531d6a5737be1faad62291&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201705%2F24%2F002346yjf4j61jmcepjjzg.jpg'),(26,'15555555555','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','501f3b4e10a28596dd8080f3d9dc3856','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547563523328&di=454d5a9af6531d6a5737be1faad62291&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201705%2F24%2F002346yjf4j61jmcepjjzg.jpg'),(27,'16666666666','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','64cb92dcbbc7f06e31606e390442e8e2','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547563523328&di=454d5a9af6531d6a5737be1faad62291&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201705%2F24%2F002346yjf4j61jmcepjjzg.jpg'),(28,'17777777777','5fd924625f6ab16a19cc9807c7c506ae1813490e4ba675f843d5a10e0baacdb8','825cdf8d8f2880a3fc724077df6e1351','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547563523328&di=454d5a9af6531d6a5737be1faad62291&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201705%2F24%2F002346yjf4j61jmcepjjzg.jpg'),(29,'19999999999','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','e1faf68b755e11dad6630a02c2c3facc','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547563523328&di=454d5a9af6531d6a5737be1faad62291&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201705%2F24%2F002346yjf4j61jmcepjjzg.jpg'),(31,'18888888888','5fd924625f6ab16a19cc9807c7c506ae1813490e4ba675f843d5a10e0baacdb8','1ee9399f48ff5e57969157d6157ba90e','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547563523328&di=454d5a9af6531d6a5737be1faad62291&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201705%2F24%2F002346yjf4j61jmcepjjzg.jpg');
/*!40000 ALTER TABLE `lcc_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcc_wheel`
--

DROP TABLE IF EXISTS `lcc_wheel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcc_wheel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(500) NOT NULL,
  `name` varchar(50) NOT NULL,
  `trackid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcc_wheel`
--

LOCK TABLES `lcc_wheel` WRITE;
/*!40000 ALTER TABLE `lcc_wheel` DISABLE KEYS */;
INSERT INTO `lcc_wheel` VALUES (1,'//i1.mifile.cn/f/i/18/mibookair/13/index_slider00.jpg','小米1','21870'),(2,'//i1.mifile.cn/f/i/18/mibookair/13/index_slider01.jpg','小米2','21869'),(3,'//i1.mifile.cn/f/i/18/mibookair/13/index_slider02.jpg','小米3','21862');
/*!40000 ALTER TABLE `lcc_wheel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-17 14:38:08
