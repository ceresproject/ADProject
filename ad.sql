-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: ad
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `account_profile`
--

DROP TABLE IF EXISTS `account_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `account_profile_user_id_bdd52018_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_profile`
--

LOCK TABLES `account_profile` WRITE;
/*!40000 ALTER TABLE `account_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',4,'add_group'),(10,'Can change group',4,'change_group'),(11,'Can delete group',4,'delete_group'),(12,'Can view group',4,'view_group'),(13,'Can add user',2,'add_user'),(14,'Can change user',2,'change_user'),(15,'Can delete user',2,'delete_user'),(16,'Can view user',2,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add book mark',9,'add_bookmark'),(30,'Can change book mark',9,'change_bookmark'),(31,'Can delete book mark',9,'delete_bookmark'),(32,'Can view book mark',9,'view_bookmark'),(33,'Can add profile',8,'add_profile'),(34,'Can change profile',8,'change_profile'),(35,'Can delete profile',8,'delete_profile'),(36,'Can view profile',8,'view_profile'),(37,'Can add image',11,'add_image'),(38,'Can change image',11,'change_image'),(39,'Can delete image',11,'delete_image'),(40,'Can view image',11,'view_image'),(41,'Can add location tag',13,'add_locationtag'),(42,'Can change location tag',13,'change_locationtag'),(43,'Can delete location tag',13,'delete_locationtag'),(44,'Can view location tag',13,'view_locationtag'),(45,'Can add type',14,'add_type'),(46,'Can change type',14,'change_type'),(47,'Can delete type',14,'delete_type'),(48,'Can view type',14,'view_type'),(49,'Can add article post',10,'add_articlepost'),(50,'Can change article post',10,'change_articlepost'),(51,'Can delete article post',10,'delete_articlepost'),(52,'Can view article post',10,'view_articlepost'),(53,'Can add user follow',12,'add_userfollow'),(54,'Can change user follow',12,'change_userfollow'),(55,'Can delete user follow',12,'delete_userfollow'),(56,'Can view user follow',12,'view_userfollow'),(57,'Can add rank',15,'add_rank'),(58,'Can change rank',15,'change_rank'),(59,'Can delete rank',15,'delete_rank'),(60,'Can view rank',15,'view_rank'),(61,'Can add book mark',16,'add_bookmark'),(62,'Can change book mark',16,'change_bookmark'),(63,'Can delete book mark',16,'delete_bookmark'),(64,'Can view book mark',16,'view_bookmark'),(65,'Can add read record',17,'add_readrecord'),(66,'Can change read record',17,'change_readrecord'),(67,'Can delete read record',17,'delete_readrecord'),(68,'Can view read record',17,'view_readrecord');
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
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$D0K5gYktHaH4$irOBn0OrqSoGEHLWX0rQUn6Hdnbpbro3zyF1DARD8e0=',NULL,1,'qintianqi','','','929245755@qq.com',1,1,'2019-04-13 14:03:04.610771'),(2,'pbkdf2_sha256$150000$HuzmJE7lHfAx$uV5irLsth6EyzwMkpDYZBVe2qBDNmfi2Ca37Tux9+aE=','2019-04-26 01:42:00.143467',1,'admin','','','',1,1,'2019-04-13 14:03:54.709494'),(3,'pbkdf2_sha256$150000$FuIOFRDVxwJA$K86hTVx9RnUvS/vbwAZQX4W/gYYZoACTE9DfJKVTQuI=',NULL,0,'Tinchy','','','',0,1,'2019-04-14 12:49:23.304263');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('0706584da342ce99d4ca6022e95062ae269e6b2f','2019-04-25 15:19:10.165307',2);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-04-13 14:11:07.397467','1','shopping centre',1,'[{\"added\": {}}]',14,2),(2,'2019-04-13 14:21:57.985773','1','uploads/6052d746-917d-4182-8b9c-de86cfe88045Singapore_Supreme_Court_and_City_Hall_aerial_view.jpg',1,'[{\"added\": {}}]',11,2),(3,'2019-04-13 14:22:05.941511','1','city hall',1,'[{\"added\": {}}]',13,2),(4,'2019-04-13 14:29:11.674118','2','bugis',1,'[{\"added\": {}}]',13,2),(5,'2019-04-14 00:34:00.139376','2','food',1,'[{\"added\": {}}]',14,2),(6,'2019-04-14 00:34:44.188169','2','uploads/8859a39b-1478-4032-9daf-ae6c850152eaflat-3840x2160-forest-deer-4k-5k-iphone-wall_HXzvjAi.jpg',1,'[{\"added\": {}}]',11,2),(7,'2019-04-14 00:34:46.009659','1','McDonald\'s (Raffles City)',1,'[{\"added\": {}}]',10,2),(8,'2019-04-14 02:21:28.954587','2','uploads/8859a39b-1478-4032-9daf-ae6c850152eaflat-3840x2160-forest-deer-4k-5k-iphone-wall_HXzvjAi.jpg',3,'',11,2),(9,'2019-04-14 02:21:28.959924','1','uploads/6052d746-917d-4182-8b9c-de86cfe88045Singapore_Supreme_Court_and_City_Hall_aerial_view.jpg',3,'',11,2),(10,'2019-04-14 02:21:37.668227','1','McDonald\'s (Raffles City)',3,'',10,2),(11,'2019-04-14 02:21:50.699921','3','images/aa38f3a9-cf71-4613-9bc1-da026bf8c3faSingapore_Supreme_Court_and_City_Hall_aerial_view.jpg',1,'[{\"added\": {}}]',11,2),(12,'2019-04-14 02:21:52.885246','2','bugis',2,'[{\"changed\": {\"fields\": [\"images\"]}}]',13,2),(13,'2019-04-14 02:21:56.708732','1','city hall',2,'[{\"changed\": {\"fields\": [\"images\"]}}]',13,2),(14,'2019-04-15 01:16:16.371158','3','Bishan',1,'[{\"added\": {}}]',13,2),(15,'2019-04-15 01:19:29.984058','3','Attractions',1,'[{\"added\": {}}]',14,2),(16,'2019-04-15 01:21:23.258958','2','Kong Meng San Phor Kark See Monastery',1,'[{\"added\": {}}]',10,2),(17,'2019-04-15 01:22:01.894848','4','images/a26d7bbb-730e-4d9f-b86d-15152d0bec77111.png',1,'[{\"added\": {}}]',11,2),(18,'2019-04-15 01:22:16.029003','2','Kong Meng San Phor Kark See Monastery',2,'[{\"changed\": {\"fields\": [\"images\"]}}]',10,2),(19,'2019-04-15 01:23:52.635764','1','Shopping',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',14,2),(20,'2019-04-15 01:23:58.250924','2','Food',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',14,2),(21,'2019-04-15 02:40:28.050955','4','Wei Jie Lin',1,'[{\"added\": {}}]',14,2),(22,'2019-04-15 02:41:35.402282','1','City Hall',2,'[{\"changed\": {\"fields\": [\"tag\", \"type\"]}}]',13,2),(23,'2019-04-15 02:41:46.266139','2','bugis',3,'',13,2),(24,'2019-04-15 02:42:54.528983','4','Jurorg East',1,'[{\"added\": {}}]',13,2),(25,'2019-04-15 02:43:30.187225','5','Paya Laber',1,'[{\"added\": {}}]',13,2),(26,'2019-04-15 02:46:27.111116','1','Rank object (1)',1,'[{\"added\": {}}]',15,2),(27,'2019-04-15 02:50:11.575782','2','Kong Meng San Phor Kark See Monastery',2,'[]',10,2),(28,'2019-04-17 01:45:42.275955','5','images/8ba24800-98f4-43e5-bbbf-0a8bbbc9f5f6Bishan_Ang_Mo_Kio_Park.jpg',1,'[{\"added\": {}}]',11,2),(29,'2019-04-17 01:47:06.586448','3','Bishan-Ang Mo Kio Park',1,'[{\"added\": {}}]',10,2),(30,'2019-04-17 02:40:43.226815','6','images/0a87b6e9-0e4a-4b19-9df3-d00a7812ca5eJunction_8.jpg',1,'[{\"added\": {}}]',11,2),(31,'2019-04-17 02:41:20.583885','4','Junction 8',1,'[{\"added\": {}}]',10,2),(32,'2019-04-17 02:41:43.770771','7','images/734912df-6c03-4d96-aae3-8ea6c51b0c8bBishan_North_Shopping_Mall.jpg',1,'[{\"added\": {}}]',11,2),(33,'2019-04-17 02:42:06.411660','5','Bishan North Shopping Mall',1,'[{\"added\": {}}]',10,2),(34,'2019-04-17 02:42:37.235573','8','images/df496257-8df9-4e60-ad94-73832089e662Thomson_Plaza.jpg',1,'[{\"added\": {}}]',11,2),(35,'2019-04-17 02:43:25.323727','6','Thomson Plaza',1,'[{\"added\": {}}]',10,2),(36,'2019-04-17 02:44:13.936265','9','images/39e7f8da-85fa-4848-99d1-fc835e16d871Ming_Kee_Chicken_Rice.jpg',1,'[{\"added\": {}}]',11,2),(37,'2019-04-17 02:44:23.147681','10','images/62c3cbe4-e4f0-47e3-960d-fcb3b0007c6aMing_Kee_Chicken_Rice2.jpg',1,'[{\"added\": {}}]',11,2),(38,'2019-04-17 02:46:18.526516','7','Ming Kee Chicken Rice',1,'[{\"added\": {}}]',10,2),(39,'2019-04-17 02:46:51.028886','11','images/1f2a6665-e675-45cf-aacf-5a7455b7ab34Washoku_Goen.jpg',1,'[{\"added\": {}}]',11,2),(40,'2019-04-17 02:47:00.710374','12','images/b3b8f2ee-c0b8-40d0-b93d-3314cbfcb286Washoku_Goen2.jpg',1,'[{\"added\": {}}]',11,2),(41,'2019-04-17 02:47:25.618106','8','Washoku Goen',1,'[{\"added\": {}}]',10,2),(42,'2019-04-17 02:48:08.223671','13','images/b0116ffc-f4c2-44db-8690-c67dfcc978c5Kagurazaka_Saryo.jpg',1,'[{\"added\": {}}]',11,2),(43,'2019-04-17 02:48:14.821135','14','images/f56a3f07-e365-48b1-926a-4c5122ef3c24Kagurazaka_Saryo2.jpg',1,'[{\"added\": {}}]',11,2),(44,'2019-04-17 02:48:38.876549','9','Kagurazaka Saryo',1,'[{\"added\": {}}]',10,2),(45,'2019-04-17 02:49:08.577787','15','images/7fc3b27f-4b90-48e6-b69f-a2c5e2ac6155Chef_Recipe.jpg',1,'[{\"added\": {}}]',11,2),(46,'2019-04-17 02:49:16.494787','16','images/db16ca96-ffa4-4d76-ad29-3020f9e29210Chef_Recipe2.jpg',1,'[{\"added\": {}}]',11,2),(47,'2019-04-17 02:49:44.842472','10','Chef Recipe',1,'[{\"added\": {}}]',10,2),(48,'2019-04-17 02:50:42.481122','17','images/62922310-b564-4491-ab8a-e7e813e150f7Science_Centre_Singapore.jpg',1,'[{\"added\": {}}]',11,2),(49,'2019-04-17 02:50:50.591702','11','Science Centre Singapore',1,'[{\"added\": {}}]',10,2),(50,'2019-04-17 02:51:38.735738','18','images/1e37499e-d2ff-4380-b8ba-41cdfd8c1f25Jurong_Bird_Park.jpg',1,'[{\"added\": {}}]',11,2),(51,'2019-04-17 02:51:41.505349','12','Jurong Bird Park',1,'[{\"added\": {}}]',10,2),(52,'2019-04-17 02:52:06.028500','19','images/ab5f8318-f815-4a51-a7cb-cf22dee00ad1Jurong_East_Swimming_Complex_and_Water_Park.jpg',1,'[{\"added\": {}}]',11,2),(53,'2019-04-17 02:52:21.644203','13','Jurong East Swimming Complex and Water Park',1,'[{\"added\": {}}]',10,2),(54,'2019-04-17 02:52:57.115831','20','images/812c0f41-002e-4f0e-902c-5883e6e1ff33Snow_Venture_Pte_Ltd.jpg',1,'[{\"added\": {}}]',11,2),(55,'2019-04-17 02:53:27.358916','14','Snow Venture Pte Ltd',1,'[{\"added\": {}}]',10,2),(56,'2019-04-17 02:54:12.341165','21','images/0a9d48da-2049-4008-8190-b66ef0f549feJem.jpg',1,'[{\"added\": {}}]',11,2),(57,'2019-04-17 02:54:15.543591','15','Jem',1,'[{\"added\": {}}]',10,2),(58,'2019-04-17 02:54:58.123583','22','images/56c3eebb-9090-4bbd-b22c-34530845679bWestGate.jpg',1,'[{\"added\": {}}]',11,2),(59,'2019-04-17 02:55:00.996583','16','WestGate',1,'[{\"added\": {}}]',10,2),(60,'2019-04-17 02:55:33.584843','23','images/6206ddbb-ea14-42b6-93dc-9dd53254d599IMM.jpg',1,'[{\"added\": {}}]',11,2),(61,'2019-04-17 02:55:47.285675','17','IMM',1,'[{\"added\": {}}]',10,2),(62,'2019-04-17 02:56:00.385360','17','IMM',2,'[]',10,2),(63,'2019-04-17 02:56:35.783892','24','images/dcd887b2-9ba4-4565-81c9-da9f1d9009f7FLO.jpg',1,'[{\"added\": {}}]',11,2),(64,'2019-04-17 02:56:48.904731','18','FLO',1,'[{\"added\": {}}]',10,2),(65,'2019-04-17 02:57:45.049198','25','images/dc3c4389-5e5d-4d25-bfb7-84ae2dc71b4aMIAM_MIAM.jpg',1,'[{\"added\": {}}]',11,2),(66,'2019-04-17 02:58:19.101282','19','MIAM MIAM',1,'[{\"added\": {}}]',10,2),(67,'2019-04-17 02:59:38.839199','26','images/70c19df6-a120-47dd-b96e-b2d421f2ad43POPPY_POPS.jpg',1,'[{\"added\": {}}]',11,2),(68,'2019-04-17 02:59:42.548626','20','POPPY POPS',1,'[{\"added\": {}}]',10,2),(69,'2019-04-17 03:00:15.761894','27','images/ff7df403-d922-4905-a02b-368b96474866The_Carving_Board.jpg',1,'[{\"added\": {}}]',11,2),(70,'2019-04-17 03:00:56.705727','21','The Carving Board',1,'[{\"added\": {}}]',10,2),(71,'2019-04-17 03:05:40.649113','28','images/1381cc73-38e1-4d79-9bdc-b56ffe05cf79Former_City_Hall.jpg',1,'[{\"added\": {}}]',11,2),(72,'2019-04-17 03:05:47.037579','22','Former City Hall',1,'[{\"added\": {}}]',10,2),(73,'2019-04-17 03:06:37.227099','29','images/d2966946-8d70-4044-97d3-717bd78634efArtScience_Museum.jpg',1,'[{\"added\": {}}]',11,2),(74,'2019-04-17 03:07:49.614371','23','ArtScience Museum',1,'[{\"added\": {}}]',10,2),(75,'2019-04-17 03:09:27.534653','30','images/00383282-247c-4367-a30d-06893fba0a48Singapore_Flyer.jpg',1,'[{\"added\": {}}]',11,2),(76,'2019-04-17 03:09:40.425891','24','Singapore Flyer',1,'[{\"added\": {}}]',10,2),(77,'2019-04-17 03:10:32.513633','31','images/1dc92591-b470-4ea4-bacd-3cb85681a12fSuntec_City.jpg',1,'[{\"added\": {}}]',11,2),(78,'2019-04-17 03:10:33.655762','25','Suntec City',1,'[{\"added\": {}}]',10,2),(79,'2019-04-17 03:11:38.375553','32','images/92d8f1ca-47e9-48fd-9ad7-1eb7f035cad6Raffles_City_Shopping_Centre.jpg',1,'[{\"added\": {}}]',11,2),(80,'2019-04-17 03:11:44.373573','26','Raffles City Shopping Centre',1,'[{\"added\": {}}]',10,2),(81,'2019-04-17 03:12:55.132420','33','images/34bd18ad-fa00-4520-a862-337de3d323f6Peninsula_Shopping_Centre_Singapore.jpg',1,'[{\"added\": {}}]',11,2),(82,'2019-04-17 03:12:57.503958','27','Peninsula Shopping Centre Singapore',1,'[{\"added\": {}}]',10,2),(83,'2019-04-17 03:13:54.983899','34','images/4be97a97-b7f6-4d35-b693-e284f1f65489Vatos_Urban_Tacos_South_Beach.jpg',1,'[{\"added\": {}}]',11,2),(84,'2019-04-17 03:14:01.749006','35','images/6ec349d6-af83-4c91-b865-c5023129ba1bVatos_Urban_Tacos_South_Beach2.jpg',1,'[{\"added\": {}}]',11,2),(85,'2019-04-17 03:14:06.129723','28','Vatos Urban Tacos (South Beach)',1,'[{\"added\": {}}]',10,2),(86,'2019-04-17 03:14:29.854084','36','images/d2c99942-e131-4d0c-9104-59ef1ba2b8beThe_Stamford_Brasserie.jpg',1,'[{\"added\": {}}]',11,2),(87,'2019-04-17 03:14:38.678360','37','images/84ca3ebc-d326-440e-8680-db0e49aaf36eThe_Stamford_Brasserie2.jpg',1,'[{\"added\": {}}]',11,2),(88,'2019-04-17 03:15:25.996157','29','The Stamford Brasserie',1,'[{\"added\": {}}]',10,2),(89,'2019-04-17 03:16:07.927155','38','images/c5c178e9-eb99-4bb6-bb48-8804da708c0fMatsuya_Dining.jpg',1,'[{\"added\": {}}]',11,2),(90,'2019-04-17 03:17:11.609161','39','images/c02d2607-2abb-49af-8afe-65a0a29b90d1Matsuya_Dining2.jpg',1,'[{\"added\": {}}]',11,2),(91,'2019-04-17 03:17:15.035142','30','Matsuya Dining',1,'[{\"added\": {}}]',10,2),(92,'2019-04-17 03:18:02.396991','40','images/040e807a-282b-4512-bb0e-48e73046a9e3TAP_One_Raffles_Link.jpg',1,'[{\"added\": {}}]',11,2),(93,'2019-04-17 03:18:11.901440','41','images/30a55f7b-bc36-41b1-b1a2-cad59141407aTAP_One_Raffles_Link2.jpg',1,'[{\"added\": {}}]',11,2),(94,'2019-04-17 03:18:28.599072','31','TAP (One Raffles Link)',1,'[{\"added\": {}}]',10,2),(95,'2019-04-17 03:18:35.687064','31','TAP (One Raffles Link)',2,'[]',10,2),(96,'2019-04-17 03:19:19.589646','42','images/2f9798e0-98c0-4b05-997a-0a7cf8574bdbAir_Force_Museum.jpg',1,'[{\"added\": {}}]',11,2),(97,'2019-04-17 03:20:01.265714','32','Air Force Museum',1,'[{\"added\": {}}]',10,2),(98,'2019-04-17 03:20:31.498267','43','images/57262975-42de-4c45-8984-4c008adecddbAlkaff_Lake_Gardens.jpg',1,'[{\"added\": {}}]',11,2),(99,'2019-04-17 03:22:14.185369','33','Alkaff Lake Gardens',1,'[{\"added\": {}}]',10,2),(100,'2019-04-17 03:22:45.320798','44','images/7534e520-0100-474e-9e3d-654ea3abc522KINEX.jpg',1,'[{\"added\": {}}]',11,2),(101,'2019-04-17 03:23:04.457046','34','KINEX',1,'[{\"added\": {}}]',10,2),(102,'2019-04-17 03:23:47.539193','45','images/11c0c868-161a-437f-94fa-5c1fb1190766City_Plaza.jpg',1,'[{\"added\": {}}]',11,2),(103,'2019-04-17 03:23:55.002111','35','City Plaza',1,'[{\"added\": {}}]',10,2),(104,'2019-04-17 03:24:48.302274','46','images/d3d0efb8-c8f0-4081-98f2-dc43d0371a64Tanjong_Katong_Complex.jpg',1,'[{\"added\": {}}]',11,2),(105,'2019-04-17 03:24:59.858548','36','Tanjong Katong Complex',1,'[{\"added\": {}}]',10,2),(106,'2019-04-17 03:25:51.260933','47','images/6ced3cec-0adf-4f4c-8983-12903ddb14d5Paya_Lebar_Square.jpg',1,'[{\"added\": {}}]',11,2),(107,'2019-04-17 03:25:53.303529','37','Paya Lebar Square',1,'[{\"added\": {}}]',10,2),(108,'2019-04-17 03:26:33.560525','48','images/6d68fec0-7eb0-46b7-87bb-1e67b1e01258Poon_Nah_City_Home_Made_Noodle.jpg',1,'[{\"added\": {}}]',11,2),(109,'2019-04-17 03:26:43.977034','49','images/6b1c9380-1a7a-45c3-90db-b2409a4339efPoon_Nah_City_Home_Made_Noodle2.jpg',1,'[{\"added\": {}}]',11,2),(110,'2019-04-17 03:26:54.880564','38','Poon Nah City Home Made Noodle',1,'[{\"added\": {}}]',10,2),(111,'2019-04-17 03:27:28.174631','50','images/42d97e56-a59b-4ca6-aa1b-4178aab088ccDapur_Penyet.jpg',1,'[{\"added\": {}}]',11,2),(112,'2019-04-17 03:28:21.244190','39','Dapur Penyet',1,'[{\"added\": {}}]',10,2),(113,'2019-04-17 03:29:25.802460','51','images/188c82a6-7f88-4f01-9161-cbce336be876Little_Bears.jpg',1,'[{\"added\": {}}]',11,2),(114,'2019-04-17 03:29:31.826267','52','images/c79eaf61-d030-4298-86a0-3de009389108Little_Bears2.jpg',1,'[{\"added\": {}}]',11,2),(115,'2019-04-17 03:29:35.719098','40','Little Bears',1,'[{\"added\": {}}]',10,2),(116,'2019-04-17 03:30:52.693205','53','images/d9fa4dbc-51ac-40b7-ac2b-11c4444d4436Do.Main.jpg',1,'[{\"added\": {}}]',11,2),(117,'2019-04-17 03:31:02.547715','54','images/4eb12cee-e87b-4688-83b3-245ba3cd5fafDo.Main2.jpg',1,'[{\"added\": {}}]',11,2),(118,'2019-04-17 03:31:15.714642','41','Do.Main',1,'[{\"added\": {}}]',10,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'account','bookmark'),(8,'account','profile'),(1,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(2,'auth','user'),(7,'authtoken','token'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(10,'travelResources','articlepost'),(16,'travelResources','bookmark'),(11,'travelResources','image'),(13,'travelResources','locationtag'),(15,'travelResources','rank'),(17,'travelResources','readrecord'),(14,'travelResources','type'),(12,'travelResources','userfollow');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-13 14:01:32.394171'),(2,'auth','0001_initial','2019-04-13 14:01:32.488890'),(3,'travelResources','0001_initial','2019-04-13 14:01:32.799526'),(4,'travelResources','0002_image','2019-04-13 14:01:32.876339'),(5,'travelResources','0003_locationtag_content','2019-04-13 14:01:32.922268'),(6,'travelResources','0004_locationtag_create_date','2019-04-13 14:01:32.961543'),(7,'travelResources','0005_auto_20190412_0212','2019-04-13 14:01:33.050497'),(8,'account','0001_initial','2019-04-13 14:01:33.080166'),(9,'account','0002_bookmark','2019-04-13 14:01:33.137125'),(10,'account','0003_profile_location','2019-04-13 14:01:33.195678'),(11,'admin','0001_initial','2019-04-13 14:01:33.222884'),(12,'admin','0002_logentry_remove_auto_add','2019-04-13 14:01:33.749044'),(13,'admin','0003_logentry_add_action_flag_choices','2019-04-13 14:01:33.761073'),(14,'contenttypes','0002_remove_content_type_name','2019-04-13 14:01:33.825346'),(15,'auth','0002_alter_permission_name_max_length','2019-04-13 14:01:33.842706'),(16,'auth','0003_alter_user_email_max_length','2019-04-13 14:01:33.863514'),(17,'auth','0004_alter_user_username_opts','2019-04-13 14:01:33.874730'),(18,'auth','0005_alter_user_last_login_null','2019-04-13 14:01:33.910933'),(19,'auth','0006_require_contenttypes_0002','2019-04-13 14:01:33.913232'),(20,'auth','0007_alter_validators_add_error_messages','2019-04-13 14:01:33.925234'),(21,'auth','0008_alter_user_username_max_length','2019-04-13 14:01:33.952557'),(22,'auth','0009_alter_user_last_name_max_length','2019-04-13 14:01:33.968238'),(23,'auth','0010_alter_group_name_max_length','2019-04-13 14:01:33.991407'),(24,'auth','0011_update_proxy_permissions','2019-04-13 14:01:34.022710'),(25,'authtoken','0001_initial','2019-04-13 14:01:34.053822'),(26,'authtoken','0002_auto_20160226_1747','2019-04-13 14:01:34.159278'),(27,'sessions','0001_initial','2019-04-13 14:01:34.177298'),(28,'travelResources','0006_tagimage','2019-04-13 14:01:34.208454'),(29,'travelResources','0007_auto_20190412_0251','2019-04-13 14:01:34.331507'),(30,'travelResources','0008_auto_20190412_0252','2019-04-13 14:01:34.624358'),(31,'travelResources','0009_auto_20190413_0531','2019-04-13 14:01:34.732744'),(32,'travelResources','0010_auto_20190415_0104','2019-04-15 01:04:47.797725'),(33,'account','0004_delete_bookmark','2019-04-18 02:01:31.464650'),(34,'travelResources','0002_readrecord','2019-04-19 05:25:12.445616');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('29e2uzs6t50tzzjcalk4kxjicoix70uj','YjhkMWE2OTFlMGMwZDM0YzUyZDI1MDM4MTJlZGRkMDc0ZTcwMmFiYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNzQxMzYyMjc0OWZkNzM0ODM5ZmU0ZGJkZWMyMWZiNGU2ODBjYTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-04-29 02:36:56.016884'),('4tvduflkhsvkdmytpt8h90awsxorj252','YjFkMjc0ZWYxYTc0M2EzN2U4ODBkMTU5OTVlNDdiZjI4ZmIyZGRjZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDI3NDEzNjIyNzQ5ZmQ3MzQ4MzlmZTRkYmRlYzIxZmI0ZTY4MGNhNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-05-10 01:42:00.147287'),('eqrv1r427qugha9woj2annd8icq6yczn','YTFhYTVkNTg5ZWI2MTVjYzdmM2E3YThjYTg3YzVmOTYzNWVjMDg5OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjc0MTM2MjI3NDlmZDczNDgzOWZlNGRiZGVjMjFmYjRlNjgwY2E0In0=','2019-04-29 00:39:58.661667'),('pn2jlfhonp7ss0sc6uqv058a4xt3zui1','YTFhYTVkNTg5ZWI2MTVjYzdmM2E3YThjYTg3YzVmOTYzNWVjMDg5OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjc0MTM2MjI3NDlmZDczNDgzOWZlNGRiZGVjMjFmYjRlNjgwY2E0In0=','2019-04-28 07:03:04.714097'),('sj2iym3t07by4bzyawav8mw4a2bxjuw3','YjhkMWE2OTFlMGMwZDM0YzUyZDI1MDM4MTJlZGRkMDc0ZTcwMmFiYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNzQxMzYyMjc0OWZkNzM0ODM5ZmU0ZGJkZWMyMWZiNGU2ODBjYTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-05-01 01:31:19.594381'),('xskusu2zhijczhgfdwc0h4bffyigmwhl','YTFhYTVkNTg5ZWI2MTVjYzdmM2E3YThjYTg3YzVmOTYzNWVjMDg5OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjc0MTM2MjI3NDlmZDczNDgzOWZlNGRiZGVjMjFmYjRlNjgwY2E0In0=','2019-05-09 06:42:18.501068');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelResources_articlepost`
--

DROP TABLE IF EXISTS `travelResources_articlepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelResources_articlepost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `read_times` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `travelResources_arti_tag_id_2d4ed63b_fk_travelRes` (`tag_id`),
  KEY `travelResources_articlepost_user_id_37b104fe_fk_auth_user_id` (`user_id`),
  CONSTRAINT `travelResources_arti_tag_id_2d4ed63b_fk_travelRes` FOREIGN KEY (`tag_id`) REFERENCES `travelResources_locationtag` (`id`),
  CONSTRAINT `travelResources_articlepost_user_id_37b104fe_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelResources_articlepost`
--

LOCK TABLES `travelResources_articlepost` WRITE;
/*!40000 ALTER TABLE `travelResources_articlepost` DISABLE KEYS */;
INSERT INTO `travelResources_articlepost` VALUES (2,'Kong Meng San Phor Kark See Monastery','Kong Meng San Phor Kark See Monastery (KMSPKS) is a spiritual sanctuary in urban Singapore where one can learn the Buddha’s teachings of wisdom and compassion; practise mindfulness; develop gratitude and bring happiness to all. Founded in 1921, KMSPKS is one of the first traditional Chinese forest monasteries in Singapore. Today, the monastery sits on 75,470 square metres – equivalent to the size of almost 11 football fields – and is one of the most significant and renowned monasteries in Southeast Asia. Over the years, it has grown dynamically in Dharma propagation, community involvement and religious harmony efforts. Today, it is a community of Buddhists who come together to learn, practise and share the teachings of the Buddha.','2019-04-15 01:21:23.252578',3,574117,40,3),(3,'Bishan-Ang Mo Kio Park','Bishan-Ang Mo Kio Park is one of the largest urban parks in central Singapore, covering\r\na full 62 hectares of unique waterways and greenery. Under PUB’s Active, Beautiful\r\nand Clean (ABC) Waters programme, the old concrete canal has been deconcretised\r\nand naturalised into a beautiful 3km meandering river with lush banks of wildflowers.\r\nThe river is now home to a wide array of interesting fauna and flora. Its transformation\r\nhas created a seamless blue-green recreational network which is well-integrated with\r\nnearby residential areas.\r\nWith the Pond Gardens and River Plains, the park offers a variety of spaces for the\r\ncommunity to enjoy. It is a popular choice for cycling, jogging and family gatherings,\r\nwith the open lawns and gently sloping grassy banks along either side of the river.\r\nThere are spots for the individual to explore and learn.','2019-04-17 01:47:06.574488',3,569930,3,2),(4,'Junction 8','Junction 8 is located in Bishan Town Centre, between the Bishan Mass Rapid Transit station and Bishan Bus Interchange. It is easily accessible via the expressways and public transports.\r\n\r\nThe mall extends its reach well beyond its immediate vicinity. As the only shopping mall in Bishan, Junction 8 is positioned as a one-stop shopping, dining and entertainment destination catering to the needs of residents from the surrounding estates, office workers in the area and students from nearby schools.\r\n\r\nIt comprises of five retail floors, including a basement level and two levels of basement carpark. Key tenants include FairPrice Finest, BHG Department Store, Best Denki, Food Junction and Golden Village.','2019-04-17 02:41:20.578740',3,579837,2,2),(5,'Bishan North Shopping Mall','Bishan North Shopping Mall is accessible from Bishan Road or Marymount Road. You can find a wide variety of goods and services here. There are Chinese medical halls, mini-mart, clinics, pharmacy, beauty salon, bakery, and plenty of eating outlets. The Shopping Mall is integrated with a multi-storey carpark to provide convenience to shoppers.\r\n\r\nSalvation Army Command Headquarters and Bishan North Community Centre are just opposite this Mall.','2019-04-17 02:42:06.400433',3,570282,5,2),(6,'Thomson Plaza','Thomson Plaza is a suburban shopping centre under MCST, located in the heart of private & public residential estates at Upper Thomson Road. With 3 shopping levels and a basement carpark, Thomson Plaza has a GFA of approximately 467,298 square feet and NLA of approximately 239,316 square feet.\r\n\r\nCurrently, it has 180 tenants and home to many popular brands such as FairPrice Finest, Yamaha Music School, Amore Fitness & Boutique Spa, Popular Book Store, Sushi Tei, Swensen’s, Paradise Inn, KFC, Pizza Hut, Starbucks, Koufu, Natural Healings and many more. The carpark has a total of 410 lots and 3 handicapped parking lots. Free valet parking is available* on fridays, weekends and public holidays.','2019-04-17 02:43:25.318004',3,574408,2,2),(7,'Ming Kee Chicken Rice','If there’s one food spot which Bishan is consistently associated with, it’s probably Ming Kee Chicken Rice .\r\n\r\nThis popular chicken rice stall is known for its ice-bathed chicken. It has truly stood the test of time, after relocating from Bugis Street to Kim San Leng Food Centre in Bishan, where it has stayed for many years.','2019-04-17 02:46:18.512578',3,570511,0,2),(8,'Washoku Goen','If you tend to struggle with finishing what’s on your plate, consider sharing a plate of Japanese Chicken Katsu Omelet Original Curry Rice (S$8.10) from Washoku Goen at Food Junction in Junction 8.\r\n\r\nThe portions are incredibly huge here, which makes them perfect for sharing.\r\nOr if you’re feeling particularly hungry, get the Japanese Double Katsu Original Curry Rice (S$10.90) instead for double the portion of meat. Other meat options such as tonkatsu (pork) and fish katsu are available too.','2019-04-17 02:47:25.602217',3,579837,5,2),(9,'Kagurazaka Saryo','Hailing from Tokyo, Japan, Kagurazaka Saryo in Junction 8 offers Cha-nabe (one-pot) dishes and absolutely Insta-worthy desserts.\r\nTheir Cha-nabe dishes start from S$11.90 a la carte and from S$14.90 per set. However, most people actually go there for their beautiful matcha desserts.\r\nTheir Matcha Fondue with Assorted Sides (S$14.90), Matcha Frozen Smore (S$9.90) and Matcha Kakigori (S$11.90) will surely earn you some extra ‘likes’ on your Instagram profile.','2019-04-17 02:48:38.863279',3,579837,2,2),(10,'Chef Recipe','If you’re going for a low-cost meal, Chef Recipe at S11 coffeeshop will definitely fit comfortably within your budget.\r\nThe Chef Recipe Salmon (S$10.50) was delicious, with full marks for presentation. Moist and thick cuts of salmon each sat on top of a hill of mashed potatoes.\r\n\r\nThe unbelievably succulent Chef Recipe Kurobuta Pork (S$12.80) is one of their signature dishes. Even with three huge slabs of pork on the plate, its oozing juiciness had me craving for more.\r\nEvery main dish also comes with two generous servings of side dishes, one that’s fixed and one of your choice.','2019-04-17 02:49:44.836608',3,579837,0,2),(11,'Science Centre Singapore','The Science Centre Singapore prides itself on making science an aspiring and exciting experience for people of all ages.\r\nThe Centre has been a custodian of creativity and innovation, capturing the evolution scientific developments through unique and relevant exhibitions and shows and continues to ignite young minds and foster new generations of scientifically savvy Singaporeans.\r\nThe Centre houses 14 exhibition galleries with more than 1,000 exhibits covering a wide range of topics related to science, technology and mathematics.\r\nThe Centre also offer a wide range of enrichment programmes for students aimed at complementing the school’s formal science education as well as enriching and fun events, competitions and outreach activities for everyone.','2019-04-17 02:50:50.581507',4,609080,3,2),(12,'Jurong Bird Park','Opened in 1971, Jurong Bird Park is Asia’s largest bird park, offering a 20.2-hectare hillside haven for close to 3,500 birds across 400 species, of which 20 per cent are threatened. The bird park is famed for its large and immersive walk-in aviaries such as Lory Loft, Jungle Jewels and the recently revamped Waterfall Aviary. Other unique exhibits include Penguin Coast and Pelican Cove. Jurong Bird Park sees approximately 850,000 visitors annually.\r\nCommitted towards conservation, the bird park is the first in the world to breed the Malayan black hornbill (1995) and the twelve-wired bird of paradise (2001) in captivity for which it received the Breeders’ Award from the American Pheasant and Waterfowl Society. Jurong Bird Park is part of Wildlife Reserves Singapore and is the only park in the Asia Pacific to have an Avian Hospital.','2019-04-17 02:51:41.494589',4,628925,2,2),(13,'Jurong East Swimming Complex and Water Park','Jurong East Swimming Complex is a public swimming complex managed by Sport Singapore.\r\nBeing the first one-stop integrated centre, Jurong East Sport Centre, formerly known as Jurong East Sport and Recreation Centre, marks a milestone in Sport Singapore’s facilities development when it opened in 2000. It was the first pool to offer a lazy river, wave pool and fun slides to the masses at an affordable rate.\r\nThere are no shortage of water play areas and swimming pools in Singapore, but few come at such a bargain. For less than $2 (and less than $1 for children), visitors can choose to dive into the wave pool, cruise down the lazy river, conquer the water slides, relax in the whirlpool or watch the little ones splash down at the Kiddy Fun Station.','2019-04-17 02:52:21.638969',4,609517,1,2),(14,'Snow Venture Pte Ltd','Snow City is Singapore’s first permanent indoor snow centre. A family-centric attraction centre, Snow City receives an average patronage of some 250,000 visitors from around the world! A snow chamber that delivers snow experience all year round; and snow professionals that create not only fun and enriching educational programmes, but magic out of thin air as well!\r\nLaunched in June 2000 and revamped in 2007, the Snow City is owned and managed by Snow Venture Pte Ltd, a subsidiary of Science Centre Holdings Pte Ltd. It has a three-storey high and 60-metres long snow slope for visitors to snow tube.\r\n \r\nIt is also popular among locals and tourists who are unable to experience sub-zero temperatures back in homelands.\r\nThis cool collection of ice sculpting is being housed in the new Ice Gallery whereby visitors to the Snow City can swing by to see before or after their snow play. The new ice exhibition will be a nice educational corner for all children and dinosaurs fans. New educational programmes will be added to make the visit to Snow City and Ice Gallery more complete and fruitful to all visitors.','2019-04-17 02:53:27.350877',4,609433,25,2),(15,'Jem','Jem® is the first lifestyle hub in Singapore’s west where mid to mid-plus shopping meets entertainment; functionality meets experience and where community culture meets city inspiration. Jem’s name is a wordplay reference of the mall as the crown jewel of Jurong and Singapore’s west.\r\n\r\nJem® is Singapore’s third largest suburban mall housing 240 units over 818,000 square feet of retail space across six levels. Jem® is directly connected to the Jurong East MRT interchange station and located at the junction of Jurong Gateway Road and Boon Lay Way.\r\n\r\nMajor retailers include Robinsons, FairPrice Xtra, Cathay Cineplexes, Cookhouse by Koufu, H&M, Uniqlo, Marks & Spencer and Courts.','2019-04-17 02:54:15.533501',4,608549,2,2),(16,'WestGate','Strategically located in Jurong Gateway, Singapore\'s upcoming second Central Business District, Westgate is a premier family and lifestyle mall in the west of Singapore. The mall enjoys direct connectivity to both the Jurong East MRT interchange station and bus interchange, and amenities such as the Ng Teng Fong General Hospital.\r\nIt offers a city lifestyle shopping experience with many popular brands. In addition, the mall offers a holistic shopping experience with unique features such as The Courtyard, which is naturally ventilated and offers alfresco dining options, and thematic children\'s playground. Westgate, IMM and JCube together creates a \'3-in-1\' mega mall that brings lifestyle, value and entertainment experiences to our shoppers.','2019-04-17 02:55:00.991094',4,608531,2,2),(17,'IMM','IMM is now Singapore’s largest outlet mall with more than 90 outlet stores, offering up to 80% discount all year round. Outlet stores were introduced to extend everyday savings and value to shoppers. Some of the outlet stores include adidas, Calvin Klein Jeans, Club 21, COACH, Cole Haan, Converse, ECCO, FitFlop, Furla, G-SHOCK, GEOX, Hush Puppies, Kate Spade New York, Michael Kors, New Balance, Nike, Onitsuka Tiger, Puma, Sacoor, Samsonite, Timberland, TUMI and Under Armour.\r\n\r\nIMM is conveniently located near Jurong East MRT Interchange (NE1/ EW24) and Jurong East Bus Interchange. It is also easily accessible from other parts of Singapore via the Pan Island Expressway (PIE) and Ayer Rajah Expressway (AYE).\r\n\r\nIMM building consists of unique composition of retail and warehouse spaces that spread over 5 levels. The availability of spacious warehouse facilities within the same building proves an added advantage to retailers and companies by enhancing cost efficiency accrued to storage provision. This unique leasing arrangement is available to over 600 companies housed in IMM. Parking is never a hassle at IMM since in excess of 1,300 car park lots are available.\r\n\r\nAside from warehouse space, there is more than 407,000 sq feet of retail space - occupied by more than 220 retailers providing a wide range of products and services. A one-stop mall for furniture and interior design; almost all home renovation essentials, furnishings, furniture and fittings can be found under one roof at IMM. The presence of Giant hypermarket and several other lifestyle stores like Best Denki, Daiso and Sony cater to just about every shopping whim and need.','2019-04-17 02:55:47.279934',4,609601,1,2),(18,'FLO','Halal-certified FLO is short for Food Lovers Only. The open space cafe in IMM offers Western-Korean inspired dishes including all-day breakfast sets, mains, waffles and desserts.\r\nTheir menu is constantly updated to keep customers coming back for more and some of their recent creations include Bulgogi Rice, Korean Bulgogi Pasta, Chicken Salad Bibimbap and Kimchi Pancake.','2019-04-17 02:56:48.893193',4,609601,21,2),(19,'MIAM MIAM','Miam Miam offers fresh flavours and ingredients of Japanese cuisine, together with French artisanal cooking techniques, Highlights include the signature desserts such as French Toast, Plain Pancake and Oven Baked French Soufflés.\r\nMileslife is our favourite app to accumulate miles through everyday spending. You can earn 1 miles for every dollar spent at this restaurant. Download and try Mileslife out now! You can use our code ‘Ladyironchef‘ upon your first spending to get 1,000 miles.','2019-04-17 02:58:19.095957',4,608532,1,2),(20,'POPPY POPS','Most of us who live in the West should have already visited JEM, but how many of us are actually familiar with JEM inside and out? No one mentioned a hidden eatery located above Cookhouse by Koufu. If you think the fifth storey is the highest level in JEM, think again.\r\nPoppy Pops actually sits on the sixth floor and is only accessible through the food court or the breezy rooftop located at the top of the shopping mall. If you are seeking a place with tranquil ambiance, sunlight and pleasant bites whenever you feel peckish, take a seat and grab a Poppy Classic along with the café’s Maple Butter Waffle.','2019-04-17 02:59:42.543447',4,608549,1,2),(21,'The Carving Board','The Carving Board is a Western stall within a busy coffee shop at Yuhua Village in Jurong East which has made a name for its affordable Western food (most of the mains are priced between S$10 to S$15) and beers on-tap.\r\nWe highly recommend their Seafood Aglio Olio (S$11), Battered Fish and Chips (S$9.50) and Classic Grilled Beef Cheeseburger (S$11.50). Its wallet-friendly prices and relaxed atmosphere make The Carving Board an ideal dining destination for groups who are looking to have a fuss-free dinner together.','2019-04-17 03:00:56.700399',4,600254,1,2),(22,'Former City Hall','Located in the heart of the civic district, the former City Hall served as an important government office in Singapore. The impressive building bears witness to Singapore’s colonial past and the Japanese Occupation (1942–45) as well as several milestones on its way to independence.\r\nThe building was renamed City Hall when King George VI granted city status to Singapore on 22 September 1951.23 After the victory of the People’s Action Party in the 1959 Legislative Assembly general election, the first prime minister, Lee Kuan Yew, and his eight cabinet ministers were sworn in at City Hall, forming the first fully elected government in Singapore. On 3 December 1959, large crowds congregated outside City Hall to witness the installation of Yusof bin Ishak as Singapore’s first Malayan-born Yang di-Pertuan Negara (Malay for “Head of State”). The state anthem,“Majulah Singapura”, state crest and state flag were also unveiled to the public then.\r\nOn 16 September 1963, Lee recited the Proclamation of Malaysia from the steps of City Hall, announcing the end of colonial rule and the formation of the Federation of Malaysia with Singapore as a member state. After Singapore became a sovereign state on 9 August 1965, the edifice housed various government offices such as the Prime Minister’s Office, Ministry of Foreign Affairs, Ministry of Culture and offices of the Judiciary. It also remained the venue for swearing-in ceremonies of high government office-holders.','2019-04-17 03:05:47.025714',1,179100,1,2),(23,'ArtScience Museum','The ArtScience Museum is a key permanent attraction of the Marina Bay Sands Integrated Resort located at Bayfront Avenue. The largest private museum in Singapore, it focuses on the connections between art and science through hi-tech exhibits that push disciplinary boundaries.Designed by world-renown architect Moshe Safdie, the museum is in the shape of a lotus with  irregular petals. It opened its doors to the public on 19 February 2011, and can accommodate about 3,500 visitors at any one time.\r\nThe museum’s inaugural permanent showcase was an interactive exhibition entitled ArtScience: A Journey Through Creativity. The exhibition comprised three galleries called Curiosity, Inspiration and Expression. Leonardo da Vinci’s flying machine and a Kongming lantern were some of the objects on display. The galleries were accessible through a set of “Floating Stairs”,  and visitors could use interactive touch screens and computerised role-playing to create designs and upload them to an online collage.\r\nTravelling exhibitions are also an important part of the museum. These displays are brought in through collaborations with other organisations such as the American Museum of Natural History, Smithsonian Institute, Singapore Tourism Board and National Heritage Board. The museum opened with three such exhibitions: Genghis Khan: The Exhibition, Travelling the Silk Road: Ancient Pathway to the Modern World andShipwrecked: Tang Treasures and Monsoon Winds.\r\nThe three inaugural travelling exhibitions were followed by exhibitions on Impressionist painter Vincent Van Gogh, and surrealist artist Salvador Dali. While the exhibits were based on visual art, the museum incorporated technology to enhance visitors’ appreciation of the art. For example, the Van Gogh exhibition did not display his actual paintings. Instead, projectors beamed images of Van Gogh’s works onto gallery walls and ceilings to make visitors feel that they were part of an Impressionist canvas.The Dali exhibition featured over 250 works by the Spanish artist, including his famous melted clocks. Three bronze sculptures by Dali were sold at a show held in the museum.','2019-04-17 03:07:49.609053',1,18974,1,2),(24,'Singapore Flyer','The Singapore Flyer is a giant Ferris wheel in Singapore. Described by its operators as an observation wheel, it opened in 2008, construction having taken about 2½ years. It carried its first paying passengers on 11 February, opened to the public on 1 March, and was officially opened on 15 April. It has 28 air-conditioned capsules, each able to accommodate 28 passengers, and incorporates a three-storey terminal building.\r\nThe Flyer has an overall height of 165 metres (541 ft) and was the world\'s tallest Ferris wheel until the 167.6 m (550 ft) High Roller, which is 2.6 m (9 ft) taller than the Flyer,opened on the Las Vegas Stripin Nevada, US, on 31 March 2014.The previous record holder, the Star of Nanchang, in Jiangxi, China, is 160 m (525 ft) tall, although its 153 m (502 ft) diameter wheel is larger than the Flyer\'s 150 m (492 ft) wheel.','2019-04-17 03:09:40.420477',1,39804,3,2),(25,'Suntec City','Suntec City is one of Singapore’s largest malls and an exciting shopping destination nestled in the heart of the bustling Marina Bay precinct.\r\nThe mall is flanked by 2 Mass Rapid Transit (MRT) stations, the Esplanade and Promenade MRT stations, and boasts more than 380 retail establishments across three levels and a basement. Shoppers are spoilt for dining options with over 100 Food & Beverage outlets located within the mall and the charming Sky Garden offering alfresco dining. Suntec City offers a unique one-stop shopping, dining, lifestyle and entertainment experience for all.\r\nSuntec City is segmented into four zones, the North, East and West Wings, as well as the Fountain Court. It is also home to The Fountain of Wealth, an icon of Singapore that embodies vibrancy in bringing people together for the celebration of wealth and good health.','2019-04-17 03:10:33.650441',1,38983,2,2),(26,'Raffles City Shopping Centre','Raffles City Singapore is a premier integrated complex comprising retail, commercial, hotels and convention centre space in the heart of Singapore\'s Central Business District. Designed by world-renowned architect I M Pei to be \"the city within a city\", Raffles City opened in 1986 and links the tourist and shopping artery of Orchard Road with the commercial and financial area in and around Raffles Place. The complex consists of Raffles City Shopping Centre, Raffles City Tower, Raffles City Convention Centre, Swissotel The Stamford and Fairmont Singapore.\r\nRaffles City Shopping Centre is a prime retail mall spread over five floors on storeys 1, 2, 3 and basement 1 & 2. Anchored by Robinsons Department Store and Raffles City Market Place – a gourmet supermarket, Raffles City Shopping Centre currently houses over 200 specialty shops. Raffles City Shopping Centre is linked directly to the City Hall MRT interchange station and the Esplanade MRT station along the Circle Line.','2019-04-17 03:11:44.361956',1,179103,299,2),(27,'Peninsula Shopping Centre Singapore','Known widely as the ‘Little Burma’ of Singapore, Peninsula Plaza stands out with its distinctive arched façade. A privately commissioned reinterpretation of the podium and tower typology, it has since been appropriated by the local migrant Burmese population, filled with shops and services akin to that of their homeland.\r\nThe distinctive image of Peninsula Plaza is engendered by the synergy of form and function. The 32 storey office block was designed with a system of perimeter columns, which, together with a framed internal structure, creates an interior that is almost column free for ease of internal reconfiguration. This tower sits atop a 6 storey podium block, with a delicately articulated façade of interconnected arches, interacting visually with the coconut trees lining its promenade.\r\nThe expression of column arches and three-dimensional motifs forms a dialogue with the St Andrew’s Cathedral opposite. The Gothic forms, borrowed and re-interpreted, perpetuate the historicity of its milieu. The division of the overall mass into three separate volumes also demonstrates a keen sensitivity to neighbouring buildings. Facing the street, the height of the 6 storey podium block abides the scale of street set up by City Hall and the old Supreme Court. From levels 6 to 9, the intermediate volume not only mitigates the severe height difference between podium and tower block, but aligns itself elegantly to the tower at St Andrew’s Cathedral.','2019-04-17 03:12:57.494032',1,179804,2,2),(28,'Vatos Urban Tacos (South Beach)','One of Korea’s hottest restaurants, Vatos Urban Tacos, has come to Singapore. Influenced by Mexican street tacos in Los Angeles and home-cooked Korean meals, the menu consists of creations like the Kimchi Carnitas Fries, Galbi Tacos, and Spicy Chicken Quesadillas. Vatos Urban Tacos has since garnered praise for providing exciting new tastes using only the freshest ingredients. CNN named Vatos the “Hottest New Restaurant in Seoul,” and The Daily Meal chose Vatos as one of the “10 Best American Restaurants Outside of the States”. Vatos Singapore is located in the beautiful former National Armoury Building in South Beach and can seat up to 80 people indoors and another 30 people outdoors.','2019-04-17 03:14:06.124520',1,189766,17,2),(29,'The Stamford Brasserie','The Stamford Brasserie is an all-in-one dining destination that brings to life the charm and exuberance of a classic French brasserie. The stylish tri-concept outlet, first in the hotel to run completely plastic-free, is conveniently located on the ground floor of Equinox Complex and comprises a Grab-and-Go, All-day Dining Restaurant and Beer Bar. The venue’s tasteful décor is a feast for the eyes, featuring a mix of traditional vintage appeal interspersed with industrial-chic contemporary touches. Also incorporated is an open kitchen and bar, where diners can witness lively bistro cooking in action.','2019-04-17 03:15:25.988689',1,178882,2,2),(30,'Matsuya Dining','Omakase means \"I\'ll leave it up to you\". It is often for the courageous as we seek for them \"to entrust\" their meal to us. Be surprised by the innovation and enjoy the likened-artistic performance by the Chef. Matsuya Dining also presents the classic Japanese selection in our ala carte menu. Guests can enjoy a cosy ambience in our 48-seater space. The newly renovated place have 2 private rooms that are perfect for family or friends gathering, as well as for corporate discussions.','2019-04-17 03:17:15.024912',1,189677,2,2),(31,'TAP (One Raffles Link)','Inspired by American tap rooms, TAP Craft Beer Bar is one of the first concepts in Singapore to boast 20 craft beers on tap at any time and a selection of 80 different bottled varieties. Core breweries include Modern Times Brewery, Lost Coast Brewery and Strand Brewing Co, as well as other renowned international craft breweries. TAP Craft Beer Bar also offers tasting flights, beer floats and a curated food menu for an ideal pairing with its beers.','2019-04-17 03:18:28.593446',1,39393,12,2),(32,'Air Force Museum','The Air Force Museum is a physical embodiment of the history, heritage, and values of the Republic of Singapore Air Force. Since its inception at Changi Air Base on 1 September 1988, the museum has come a long way. Today, it stands in a compound next to Paya Lebar Air Base and creatively combines original artefacts with interactive media. The museum provides an engaging hands-on experience that breathes new life into the RSAF story for all ages.\r\nThe museum has 6 galleries and these are:\r\nGallery A – Taking Flight\r\nThis gallery is dedicated to the history of Singapore Air Force and takes visitors from the early days to the full perfectly operation military machine that Air Force is today.\r\nGallery B – Scaling New Heights\r\nAs you walk further you will learn about the variety of technical equipment and the diverse air fleet that the Air Force possesses. This gallery is all about RSAF capabilities that include air platforms, land based systems and advanced military equipment.\r\nGallery C – Beyond Safeguarding Our Skies\r\nOne of the missions of RSAF is connected to establishing peace not only in Singapore but around the world. This gallery is dedicated to peacetime and security missions that the RSAF was ever involved in.\r\nGallery D – Above All\r\nWhen the Singaporean authorities were facing the task of developing its own Air Force, a lot of emphasis was put on training people. And still, people force is considered the bedrock of the Air Force. Here you will learn how people are trained and why professionalism and commitment are valued so much in the Air Force.\r\nGallery E – Air Force Insights\r\nAir Force is not a faceless organization, even though it is a serious establishment. People form the core of the Air Force and their personal stories are part of it too. The stories of people in the Air Force are inspiring and heartwarming and you can hear all about them in this gallery.\r\nThe Outdoor Gallery\r\nThis is probably the most exciting part of the museum. You will see the real fighter jets, missiles and anti-aircraft systems used in the Air Force along with elaborate details on how they’re used and stories that make some of these artifact extremely unique.\r\nAlthough Singapore Air Force Museum is small compared to other museums, it’s a feast for the eyes of adventure and history lovers. The interactive exhibitions will keep the kids entertained, while adults will enjoy the plethora of learning materials, that truly engage and educate the visitors.','2019-04-17 03:20:01.257780',5,534234,4,2),(33,'Alkaff Lake Gardens','The Alkaff Lake Gardens was located off MacPherson Road, at what is now the Sennett Estate and Cedar Girls’ Secondary School. The Japanese-styled garden was developed by Syed Shaik Alkaff of the Alkaff family.\r\nThe Alkaffs were a prominent Arab family of merchants and property developers. They owned holiday bungalows in Pasir Panjang and Pender Road, as well as the famous Hotel de L’Europe, and The Arcade at Raffles Place.\r\nThe Alkaff Lake Gardens was the first Japanese garden built in Singapore.  A Japanese landscape expert was called in by the Alkaff family to develop the garden, which was opened to the public in 1929.\r\nThe garden became a place of attraction for both visitors and residents.It had a lake for rowing boats, neatly landscaped paths, and picnic tables under shady trees. There were also tea houses that could be rented by anyone who visited the park.\r\nThe garden was requisitioned by the British military during World War II, following which the Singapore Volunteer Field Ambulance Corps used it as their headquarters. A huge Red Cross sign was laid on the grass and recognised by the Japanese air force who did not bomb the site. The garden, however, was bombed and shelled after the corps moved out.\r\nThe garden remained closed to the public during the Japanese Occupation of Singapore (1942–45). An armed guard was posted outside of the garden, and it was unclear what the site was used for during the period.\r\nAfter the war, the Alkaffs decided to get back to their core business of trading, and thus sold away much of their property.\r\nIn 1949, Alkaff Lake Gardens was bought over by the Sennett Realty Company for $2 million to develop the Sennett Estate. Vestiges of the gardens had remained for some years after the housing project was completed. Then in 1964, the lake was filled and artificial hills levelled.\r\nThe Willow Avenue Secondary School was constructed on the main site of the garden, which is currently occupied by Cedar Girls’ Secondary School.','2019-04-17 03:22:14.179923',5,340115,47,2),(34,'KINEX','A community-centric mall for fun-loving individuals leading an active and vibrant lifestyle. A mall that allows everyone to EXPERIENCE, EXCITE and EXPLORE the passions that they have in life!','2019-04-17 03:23:04.451710',5,437157,97,2),(35,'City Plaza','City Plaza is an 18-storey high-rise building that was completed in 1972. Its heydays were the 80s and 90s. Many people have, now, ignored this mall because it looks a little run down outside. However, it is a haven inside with so much to offer.\r\nFive-storied shopping paradise for fashion and food lovers: One of the oldest shopping malls in the country, City Plaza houses a number of fashion shops, beauty salons, jewelry shops and photo stores. The mall also has an entire floor dedicated to restaurants and fast food chains where foodies can enjoy delicious food like the flavorful chicken from Arnold’s Fried Chicken and ban mian from Poon Nah\r\nPre-loved fashion at a bargain: Refash and PEONY Collection on level three and Whitefiction on level four are some of the shops that offer great collections of pre-loved clothes, shoes, bags and accessories. You can get dresses, tops and pants at the prices from $5-$15. These shops also buy pre-owned clothes from shoppers who are willing to sell clothing items for a decent sum of money.\r\nA hub for fashion at wholesale prices: The affordable wholesale shops in City Plaza are where many fashion bloggers and retailers buy unique fashion items in bulk for their shops. So shopping at City Plaza helps you save a lot, prices can be just half the amount spending for the same items from blog shops. Stores like Posh Allure, Maker’s Mart and My Beautiful Shoes offer wholesale prices when you buy 12 or more items.\r\nGateway to the past: The mall has shops for vintage toys and cameras. Power Photo Store sells vintage games from around $10. You can buy some of these and have a piece of history with you.','2019-04-17 03:23:54.991103',5,409286,20,2),(36,'Tanjong Katong Complex','Tanjong Katong Complex is located at 845 Geylang Road. It is known for its wide array of traditional clothing and textiles. Its anchor tenant is the supermarket Giant. Other tenants include furniture stores and interior design agencies. The mall is frequented by mostly Malays families.','2019-04-17 03:24:59.852351',5,400845,29,2),(37,'Paya Lebar Square','It is a commercial property on a 99-year leasehold. Its purpose is to serve as office rental, sale, and other commercial purposes. It has 556 office units and 159 shops seated over 159,000 ft1. It is a 13-storey building with the first three floors designated for 159 shops while the remaining ten floors above them are for premium office spaces.\r\nThere are schools that within a reasonable distance from Paya Lebar Square; among these schools are Geylang Methodist School, Kong Hwa School, and Eton House International Primary School and Preschool.\r\nNumerous eateries are located in and outside the building like Singapore Post Centre, Geylang Serai Market and Food Centre, and City Plaza, which are all around Paya Lebar Square.','2019-04-17 03:25:53.298258',5,409051,57,2),(38,'Poon Nah City Home Made Noodle','Located in City Plaza which is a short walk away from Paya Lebar MRT, Poon Nah City Banmian is one of the most popular banmian stalls in Singapore. The highlight here is their noodles, which are soft and chewy. The broth here is clear without any eggy bits. That doesn’t mean that it’s less tasty though! They use wolfberry leaves in their dishes, which are supposed to be ‘cooling’ for the body. Its also an excellent source of Vitamin E! The chilli sauce stands out as well. Diners have a choice of ban mian, you mian, mee sua, and even bean flour noodles. Our favourite order would be the classic ban mian with minced pork or sliced fish!','2019-04-17 03:26:54.872737',5,409286,1,2),(39,'Dapur Penyet','Dapur Penyet is owned by Edy Ongkowijaya who is known as the person who brought the lip-smackingly good ayam penyet to Singapore. Here, authentic Indonesian spices, herbs and ingredients are used.\r\nWe tried the classic Ayam Penyet ($9.50), which comes with boiled kang kong, a piece of tempeh (fermented soya bean cake) and beancurd. They also have a grand total of 5 different types of sambal! They come in varying levels of spice and originate from different parts of Indonesia. Other than Ayam Penyet, they also have a grilled chicken dish, the Ayam Bakar Kecap ($9.70) which is sweeter and less oily.','2019-04-17 03:28:21.238980',5,238844,22,2),(40,'Little Bears','You don’t have to fly to Taiwan to get your fix of Taiwanese street snacks. 5 Little Bears is a Taiwanese eatery selling classics like Braised Pork Belly Rice, Oyster Vermicelli and more. We got the affordably-priced Braised Pork Rice Set ($5.90) which comes with a choice of wintermelon tea, black tea or green tea. Cut into small pieces, the braised pork belly has the right ratio of fat and lean meat. It also comes with some preserved vegetables on the side which helps to cut through the rich dish.\r\nEnd your meal on a sweet note with Eight Treasures Ice ($6), a colourful looking Taiwanese dessert that has 8 different types of ingredients – coconut jelly, corn, pearl jelly, red bean, sweet potato, green bean and yam.','2019-04-17 03:29:35.707794',5,409051,87,2),(41,'Do.Main','Do.Main is set up by French pastry chef Frederic Deshayes. It was started in December 2014 and combines the best offerings from a French bakery and a French patisserie. The bread, pastries and desserts are made using classic French techniques. We tried the Red Wine Oxtail Stew Pie ($12) which features soft and tender shredded oxtail wrapped in a flaky and buttery crust. The dessert selection comprises Bourdaloue Pear & Almond Tart ($5), Salted Caramel Eclair ($5), White Coffee Cake ($8) Royal Chocolate Cake ($8) and more.','2019-04-17 03:31:15.708772',5,437015,19,2);
/*!40000 ALTER TABLE `travelResources_articlepost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelResources_articlepost_images`
--

DROP TABLE IF EXISTS `travelResources_articlepost_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelResources_articlepost_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articlepost_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `travelResources_articlep_articlepost_id_image_id_40fdb182_uniq` (`articlepost_id`,`image_id`),
  KEY `travelResources_arti_image_id_7c942e98_fk_travelRes` (`image_id`),
  CONSTRAINT `travelResources_arti_articlepost_id_93366195_fk_travelRes` FOREIGN KEY (`articlepost_id`) REFERENCES `travelResources_articlepost` (`id`),
  CONSTRAINT `travelResources_arti_image_id_7c942e98_fk_travelRes` FOREIGN KEY (`image_id`) REFERENCES `travelResources_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelResources_articlepost_images`
--

LOCK TABLES `travelResources_articlepost_images` WRITE;
/*!40000 ALTER TABLE `travelResources_articlepost_images` DISABLE KEYS */;
INSERT INTO `travelResources_articlepost_images` VALUES (3,2,4),(4,3,5),(5,4,6),(6,5,7),(7,6,8),(8,7,9),(9,7,10),(10,8,11),(11,8,12),(12,9,13),(13,9,14),(15,10,15),(14,10,16),(16,11,17),(17,12,18),(18,13,19),(19,14,20),(20,15,21),(21,16,22),(22,17,23),(23,18,24),(24,19,25),(25,20,26),(26,21,27),(27,22,28),(28,23,29),(29,24,30),(30,25,31),(31,26,32),(32,27,33),(33,28,34),(34,28,35),(35,29,36),(36,29,37),(37,30,38),(38,30,39),(39,31,40),(40,31,41),(41,32,42),(42,33,43),(43,34,44),(44,35,45),(45,36,46),(46,37,47),(47,38,48),(48,38,49),(49,39,50),(50,40,51),(51,40,52),(52,41,53),(53,41,54);
/*!40000 ALTER TABLE `travelResources_articlepost_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelResources_articlepost_type`
--

DROP TABLE IF EXISTS `travelResources_articlepost_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelResources_articlepost_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articlepost_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `travelResources_articlep_articlepost_id_type_id_5eaa7d5d_uniq` (`articlepost_id`,`type_id`),
  KEY `travelResources_arti_type_id_7e89e36d_fk_travelRes` (`type_id`),
  CONSTRAINT `travelResources_arti_articlepost_id_4d527e9f_fk_travelRes` FOREIGN KEY (`articlepost_id`) REFERENCES `travelResources_articlepost` (`id`),
  CONSTRAINT `travelResources_arti_type_id_7e89e36d_fk_travelRes` FOREIGN KEY (`type_id`) REFERENCES `travelResources_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelResources_articlepost_type`
--

LOCK TABLES `travelResources_articlepost_type` WRITE;
/*!40000 ALTER TABLE `travelResources_articlepost_type` DISABLE KEYS */;
INSERT INTO `travelResources_articlepost_type` VALUES (2,2,3),(3,3,3),(4,4,1),(5,5,1),(6,6,1),(7,7,2),(8,8,2),(9,9,2),(10,10,2),(11,11,3),(12,12,3),(13,13,3),(14,14,3),(15,15,1),(16,16,1),(17,17,1),(18,18,2),(19,19,2),(20,20,2),(21,21,2),(22,22,3),(23,23,3),(24,24,3),(25,25,1),(26,26,1),(27,27,1),(28,28,2),(29,29,2),(30,30,2),(31,31,2),(32,32,3),(33,33,3),(34,34,1),(35,35,1),(36,36,1),(37,37,1),(38,38,2),(39,39,2),(40,40,2),(41,41,2);
/*!40000 ALTER TABLE `travelResources_articlepost_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelResources_image`
--

DROP TABLE IF EXISTS `travelResources_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelResources_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelResources_image`
--

LOCK TABLES `travelResources_image` WRITE;
/*!40000 ALTER TABLE `travelResources_image` DISABLE KEYS */;
INSERT INTO `travelResources_image` VALUES (3,'images/aa38f3a9-cf71-4613-9bc1-da026bf8c3faSingapore_Supreme_Court_and_City_Hall_aerial_view.jpg'),(4,'images/a26d7bbb-730e-4d9f-b86d-15152d0bec77111.png'),(5,'images/8ba24800-98f4-43e5-bbbf-0a8bbbc9f5f6Bishan_Ang_Mo_Kio_Park.jpg'),(6,'images/0a87b6e9-0e4a-4b19-9df3-d00a7812ca5eJunction_8.jpg'),(7,'images/734912df-6c03-4d96-aae3-8ea6c51b0c8bBishan_North_Shopping_Mall.jpg'),(8,'images/df496257-8df9-4e60-ad94-73832089e662Thomson_Plaza.jpg'),(9,'images/39e7f8da-85fa-4848-99d1-fc835e16d871Ming_Kee_Chicken_Rice.jpg'),(10,'images/62c3cbe4-e4f0-47e3-960d-fcb3b0007c6aMing_Kee_Chicken_Rice2.jpg'),(11,'images/1f2a6665-e675-45cf-aacf-5a7455b7ab34Washoku_Goen.jpg'),(12,'images/b3b8f2ee-c0b8-40d0-b93d-3314cbfcb286Washoku_Goen2.jpg'),(13,'images/b0116ffc-f4c2-44db-8690-c67dfcc978c5Kagurazaka_Saryo.jpg'),(14,'images/f56a3f07-e365-48b1-926a-4c5122ef3c24Kagurazaka_Saryo2.jpg'),(15,'images/7fc3b27f-4b90-48e6-b69f-a2c5e2ac6155Chef_Recipe.jpg'),(16,'images/db16ca96-ffa4-4d76-ad29-3020f9e29210Chef_Recipe2.jpg'),(17,'images/62922310-b564-4491-ab8a-e7e813e150f7Science_Centre_Singapore.jpg'),(18,'images/1e37499e-d2ff-4380-b8ba-41cdfd8c1f25Jurong_Bird_Park.jpg'),(19,'images/ab5f8318-f815-4a51-a7cb-cf22dee00ad1Jurong_East_Swimming_Complex_and_Water_Park.jpg'),(20,'images/812c0f41-002e-4f0e-902c-5883e6e1ff33Snow_Venture_Pte_Ltd.jpg'),(21,'images/0a9d48da-2049-4008-8190-b66ef0f549feJem.jpg'),(22,'images/56c3eebb-9090-4bbd-b22c-34530845679bWestGate.jpg'),(23,'images/6206ddbb-ea14-42b6-93dc-9dd53254d599IMM.jpg'),(24,'images/dcd887b2-9ba4-4565-81c9-da9f1d9009f7FLO.jpg'),(25,'images/dc3c4389-5e5d-4d25-bfb7-84ae2dc71b4aMIAM_MIAM.jpg'),(26,'images/70c19df6-a120-47dd-b96e-b2d421f2ad43POPPY_POPS.jpg'),(27,'images/ff7df403-d922-4905-a02b-368b96474866The_Carving_Board.jpg'),(28,'images/1381cc73-38e1-4d79-9bdc-b56ffe05cf79Former_City_Hall.jpg'),(29,'images/d2966946-8d70-4044-97d3-717bd78634efArtScience_Museum.jpg'),(30,'images/00383282-247c-4367-a30d-06893fba0a48Singapore_Flyer.jpg'),(31,'images/1dc92591-b470-4ea4-bacd-3cb85681a12fSuntec_City.jpg'),(32,'images/92d8f1ca-47e9-48fd-9ad7-1eb7f035cad6Raffles_City_Shopping_Centre.jpg'),(33,'images/34bd18ad-fa00-4520-a862-337de3d323f6Peninsula_Shopping_Centre_Singapore.jpg'),(34,'images/4be97a97-b7f6-4d35-b693-e284f1f65489Vatos_Urban_Tacos_South_Beach.jpg'),(35,'images/6ec349d6-af83-4c91-b865-c5023129ba1bVatos_Urban_Tacos_South_Beach2.jpg'),(36,'images/d2c99942-e131-4d0c-9104-59ef1ba2b8beThe_Stamford_Brasserie.jpg'),(37,'images/84ca3ebc-d326-440e-8680-db0e49aaf36eThe_Stamford_Brasserie2.jpg'),(38,'images/c5c178e9-eb99-4bb6-bb48-8804da708c0fMatsuya_Dining.jpg'),(39,'images/c02d2607-2abb-49af-8afe-65a0a29b90d1Matsuya_Dining2.jpg'),(40,'images/040e807a-282b-4512-bb0e-48e73046a9e3TAP_One_Raffles_Link.jpg'),(41,'images/30a55f7b-bc36-41b1-b1a2-cad59141407aTAP_One_Raffles_Link2.jpg'),(42,'images/2f9798e0-98c0-4b05-997a-0a7cf8574bdbAir_Force_Museum.jpg'),(43,'images/57262975-42de-4c45-8984-4c008adecddbAlkaff_Lake_Gardens.jpg'),(44,'images/7534e520-0100-474e-9e3d-654ea3abc522KINEX.jpg'),(45,'images/11c0c868-161a-437f-94fa-5c1fb1190766City_Plaza.jpg'),(46,'images/d3d0efb8-c8f0-4081-98f2-dc43d0371a64Tanjong_Katong_Complex.jpg'),(47,'images/6ced3cec-0adf-4f4c-8983-12903ddb14d5Paya_Lebar_Square.jpg'),(48,'images/6d68fec0-7eb0-46b7-87bb-1e67b1e01258Poon_Nah_City_Home_Made_Noodle.jpg'),(49,'images/6b1c9380-1a7a-45c3-90db-b2409a4339efPoon_Nah_City_Home_Made_Noodle2.jpg'),(50,'images/42d97e56-a59b-4ca6-aa1b-4178aab088ccDapur_Penyet.jpg'),(51,'images/188c82a6-7f88-4f01-9161-cbce336be876Little_Bears.jpg'),(52,'images/c79eaf61-d030-4298-86a0-3de009389108Little_Bears2.jpg'),(53,'images/d9fa4dbc-51ac-40b7-ac2b-11c4444d4436Do.Main.jpg'),(54,'images/4eb12cee-e87b-4688-83b3-245ba3cd5fafDo.Main2.jpg');
/*!40000 ALTER TABLE `travelResources_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelResources_locationtag`
--

DROP TABLE IF EXISTS `travelResources_locationtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelResources_locationtag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `create_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelResources_locationtag`
--

LOCK TABLES `travelResources_locationtag` WRITE;
/*!40000 ALTER TABLE `travelResources_locationtag` DISABLE KEYS */;
INSERT INTO `travelResources_locationtag` VALUES (1,'City Hall','This is a shopping centre','2019-04-13 14:22:05.933992'),(3,'Bishan','sww','2019-04-15 01:16:16.364835'),(4,'Jurorg East','This is the eastern area of Singapore','2019-04-15 02:42:54.517213'),(5,'Paya Laber','East of SG','2019-04-15 02:43:30.174950');
/*!40000 ALTER TABLE `travelResources_locationtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelResources_locationtag_images`
--

DROP TABLE IF EXISTS `travelResources_locationtag_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelResources_locationtag_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locationtag_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `travelResources_location_locationtag_id_image_id_a63c1086_uniq` (`locationtag_id`,`image_id`),
  KEY `travelResources_loca_image_id_8f1a0b9c_fk_travelRes` (`image_id`),
  CONSTRAINT `travelResources_loca_image_id_8f1a0b9c_fk_travelRes` FOREIGN KEY (`image_id`) REFERENCES `travelResources_image` (`id`),
  CONSTRAINT `travelResources_loca_locationtag_id_c36080c0_fk_travelRes` FOREIGN KEY (`locationtag_id`) REFERENCES `travelResources_locationtag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelResources_locationtag_images`
--

LOCK TABLES `travelResources_locationtag_images` WRITE;
/*!40000 ALTER TABLE `travelResources_locationtag_images` DISABLE KEYS */;
INSERT INTO `travelResources_locationtag_images` VALUES (4,1,3),(5,3,3),(6,4,3),(7,5,3);
/*!40000 ALTER TABLE `travelResources_locationtag_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelResources_locationtag_type`
--

DROP TABLE IF EXISTS `travelResources_locationtag_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelResources_locationtag_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locationtag_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `travelResources_location_locationtag_id_type_id_75636547_uniq` (`locationtag_id`,`type_id`),
  KEY `travelResources_loca_type_id_b896c2c3_fk_travelRes` (`type_id`),
  CONSTRAINT `travelResources_loca_locationtag_id_0b69ea91_fk_travelRes` FOREIGN KEY (`locationtag_id`) REFERENCES `travelResources_locationtag` (`id`),
  CONSTRAINT `travelResources_loca_type_id_b896c2c3_fk_travelRes` FOREIGN KEY (`type_id`) REFERENCES `travelResources_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelResources_locationtag_type`
--

LOCK TABLES `travelResources_locationtag_type` WRITE;
/*!40000 ALTER TABLE `travelResources_locationtag_type` DISABLE KEYS */;
INSERT INTO `travelResources_locationtag_type` VALUES (1,1,1),(4,1,2),(5,1,3),(3,3,1),(6,4,1),(7,4,2),(8,4,3),(9,5,1),(10,5,2),(11,5,3);
/*!40000 ALTER TABLE `travelResources_locationtag_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelResources_rank`
--

DROP TABLE IF EXISTS `travelResources_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelResources_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` double NOT NULL,
  `content` longtext NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `travelResources_rank_post_id_dc55d88d_fk_travelRes` (`post_id`),
  KEY `travelResources_rank_user_id_da1345c9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `travelResources_rank_post_id_dc55d88d_fk_travelRes` FOREIGN KEY (`post_id`) REFERENCES `travelResources_articlepost` (`id`),
  CONSTRAINT `travelResources_rank_user_id_da1345c9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelResources_rank`
--

LOCK TABLES `travelResources_rank` WRITE;
/*!40000 ALTER TABLE `travelResources_rank` DISABLE KEYS */;
INSERT INTO `travelResources_rank` VALUES (1,1,'Null','2019-04-15 02:46:27.110607',2,1);
/*!40000 ALTER TABLE `travelResources_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelResources_readrecord`
--

DROP TABLE IF EXISTS `travelResources_readrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelResources_readrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `read_date` datetime(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `travelResources_read_article_id_9df5bb5c_fk_travelRes` (`article_id`),
  KEY `travelResources_readrecord_user_id_65630cb9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `travelResources_read_article_id_9df5bb5c_fk_travelRes` FOREIGN KEY (`article_id`) REFERENCES `travelResources_articlepost` (`id`),
  CONSTRAINT `travelResources_readrecord_user_id_65630cb9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=470 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelResources_readrecord`
--

LOCK TABLES `travelResources_readrecord` WRITE;
/*!40000 ALTER TABLE `travelResources_readrecord` DISABLE KEYS */;
INSERT INTO `travelResources_readrecord` VALUES (1,'2019-04-19 05:26:44.591898',5,2),(2,'2019-04-19 05:28:14.841681',6,2),(3,'2019-04-19 05:28:23.869022',14,2),(4,'2019-04-19 05:31:01.420267',2,2),(5,'2019-04-19 05:35:37.048549',2,2),(6,'2019-04-19 05:39:26.561695',2,2),(7,'2019-04-19 05:45:48.025796',2,2),(8,'2019-04-19 05:45:52.971536',2,2),(9,'2019-04-19 05:45:56.881647',2,2),(10,'2019-04-20 06:54:17.444090',2,2),(11,'2019-04-23 02:15:28.494288',26,2),(12,'2019-04-23 02:15:31.418279',26,2),(13,'2019-04-23 02:19:27.748627',26,2),(14,'2019-04-23 02:19:51.424438',26,2),(15,'2019-04-23 02:20:07.862360',26,2),(16,'2019-04-23 02:25:01.030958',26,2),(17,'2019-04-23 02:28:52.692876',26,2),(18,'2019-04-23 02:28:52.697110',26,2),(19,'2019-04-23 02:30:50.175397',26,2),(20,'2019-04-23 02:30:50.197591',26,2),(21,'2019-04-23 02:31:18.955306',26,2),(22,'2019-04-23 02:31:18.985642',26,2),(23,'2019-04-23 02:31:24.393044',26,2),(24,'2019-04-23 02:31:24.443612',26,2),(25,'2019-04-23 02:32:28.534251',26,2),(26,'2019-04-23 02:32:38.725467',26,2),(27,'2019-04-23 02:33:13.273607',26,2),(28,'2019-04-23 02:34:20.874897',26,2),(29,'2019-04-23 02:34:31.281602',26,2),(30,'2019-04-23 02:35:03.155343',26,2),(31,'2019-04-23 02:35:09.154005',26,2),(32,'2019-04-23 02:35:23.476050',26,2),(33,'2019-04-23 02:35:49.110680',26,2),(34,'2019-04-23 02:36:22.995328',26,2),(35,'2019-04-23 02:36:56.392108',26,2),(36,'2019-04-23 02:37:00.716056',26,2),(37,'2019-04-23 02:37:57.484461',26,2),(38,'2019-04-23 02:38:46.461331',26,2),(39,'2019-04-23 02:39:15.602359',26,2),(40,'2019-04-23 02:39:18.281240',26,2),(41,'2019-04-23 02:40:02.389400',26,2),(42,'2019-04-23 02:40:54.370288',26,2),(43,'2019-04-23 02:41:38.599392',26,2),(44,'2019-04-23 02:41:49.908553',26,2),(45,'2019-04-23 02:43:04.720058',26,2),(46,'2019-04-23 02:43:32.573662',26,2),(47,'2019-04-23 02:44:02.560681',26,2),(48,'2019-04-23 02:44:07.469756',26,2),(49,'2019-04-23 02:44:56.991487',26,2),(50,'2019-04-23 02:44:59.627128',26,2),(51,'2019-04-23 02:45:28.691169',26,2),(52,'2019-04-23 02:45:50.312908',26,2),(53,'2019-04-23 02:45:52.234653',26,2),(54,'2019-04-23 02:46:15.979915',26,2),(55,'2019-04-23 02:46:19.587301',26,2),(56,'2019-04-23 02:47:26.903480',26,2),(57,'2019-04-23 02:47:28.808078',26,2),(58,'2019-04-23 02:49:22.027374',26,2),(59,'2019-04-23 02:50:05.535683',26,2),(60,'2019-04-23 02:50:20.942303',26,2),(61,'2019-04-23 02:50:41.641309',26,2),(62,'2019-04-23 02:51:00.002116',26,2),(63,'2019-04-23 02:51:03.357021',26,2),(64,'2019-04-23 02:51:28.119997',26,2),(65,'2019-04-23 02:52:01.515210',26,2),(66,'2019-04-23 02:52:16.707776',26,2),(67,'2019-04-23 02:52:33.476968',26,2),(68,'2019-04-23 02:52:39.113440',26,2),(69,'2019-04-23 02:53:36.756416',26,2),(70,'2019-04-23 02:53:42.489560',26,2),(71,'2019-04-23 02:54:33.106483',26,2),(72,'2019-04-23 02:54:44.926200',26,2),(73,'2019-04-23 02:56:53.354793',26,2),(74,'2019-04-23 02:56:57.214381',26,2),(75,'2019-04-23 02:57:11.718785',26,2),(76,'2019-04-23 02:57:14.631527',26,2),(77,'2019-04-23 02:57:19.840622',26,2),(78,'2019-04-23 02:57:22.029728',26,2),(79,'2019-04-23 02:58:17.195510',26,2),(80,'2019-04-23 02:58:20.555748',26,2),(81,'2019-04-23 02:59:28.323730',26,2),(82,'2019-04-23 02:59:29.726647',26,2),(83,'2019-04-23 03:00:01.391805',26,2),(84,'2019-04-23 03:00:05.111989',26,2),(85,'2019-04-23 03:00:47.872966',26,2),(86,'2019-04-23 03:01:12.408694',26,2),(87,'2019-04-23 03:01:13.103743',26,2),(88,'2019-04-23 03:01:35.248713',26,2),(89,'2019-04-23 03:02:19.304860',26,2),(90,'2019-04-23 03:02:23.263450',26,2),(91,'2019-04-23 03:02:38.429759',26,2),(92,'2019-04-23 03:02:42.786331',26,2),(93,'2019-04-23 03:03:24.774386',26,2),(94,'2019-04-23 03:03:29.218102',26,2),(95,'2019-04-23 03:04:04.308358',26,2),(96,'2019-04-23 03:04:10.968909',26,2),(97,'2019-04-23 03:05:37.693140',26,2),(98,'2019-04-23 03:05:50.056302',26,2),(99,'2019-04-23 03:06:24.808920',26,2),(100,'2019-04-23 03:06:39.299291',26,2),(101,'2019-04-23 03:06:42.362573',26,2),(102,'2019-04-23 03:07:13.472059',26,2),(103,'2019-04-23 03:08:04.337322',26,2),(104,'2019-04-23 03:15:42.059452',26,2),(105,'2019-04-23 03:15:42.085421',26,2),(106,'2019-04-23 03:16:27.464385',26,2),(107,'2019-04-23 03:16:27.465527',26,2),(108,'2019-04-23 03:16:44.657168',26,2),(109,'2019-04-23 03:16:44.697826',26,2),(110,'2019-04-23 03:17:30.821084',26,2),(111,'2019-04-23 03:17:48.347256',26,2),(112,'2019-04-23 03:17:55.743704',26,2),(113,'2019-04-23 03:18:05.037572',26,2),(114,'2019-04-23 03:20:05.242769',26,2),(115,'2019-04-23 03:20:22.738068',26,2),(116,'2019-04-23 03:20:25.688459',26,2),(117,'2019-04-23 03:21:04.505566',26,2),(118,'2019-04-23 03:22:15.123851',26,2),(119,'2019-04-23 03:22:20.258305',26,2),(120,'2019-04-23 03:23:18.800249',26,2),(121,'2019-04-23 03:23:29.824104',26,2),(122,'2019-04-23 03:23:30.918911',26,2),(123,'2019-04-23 03:23:57.330590',26,2),(124,'2019-04-23 03:24:10.549860',26,2),(125,'2019-04-23 03:24:32.189363',26,2),(126,'2019-04-23 03:25:28.978015',26,2),(127,'2019-04-23 03:26:53.574327',26,2),(128,'2019-04-23 03:27:29.540953',26,2),(129,'2019-04-23 03:27:58.489452',26,2),(130,'2019-04-23 03:29:07.992680',26,2),(131,'2019-04-23 03:29:50.548989',26,2),(132,'2019-04-23 03:30:21.835508',26,2),(133,'2019-04-23 03:30:25.183404',26,2),(134,'2019-04-23 03:31:30.633493',26,2),(135,'2019-04-23 03:31:49.366796',26,2),(136,'2019-04-23 03:32:19.849210',26,2),(137,'2019-04-23 03:32:34.700455',26,2),(138,'2019-04-23 03:36:19.154613',26,2),(139,'2019-04-23 03:36:22.910086',26,2),(140,'2019-04-23 03:37:40.417859',26,2),(141,'2019-04-23 03:38:22.142932',26,2),(142,'2019-04-23 03:39:48.730060',26,2),(143,'2019-04-23 03:40:52.475380',26,2),(144,'2019-04-23 03:42:08.326998',26,2),(145,'2019-04-23 03:42:18.381020',26,2),(146,'2019-04-23 03:43:27.809427',26,2),(147,'2019-04-23 03:43:37.942404',26,2),(148,'2019-04-23 03:44:02.561676',26,2),(149,'2019-04-23 03:44:12.685389',26,2),(150,'2019-04-23 03:44:18.153703',26,2),(151,'2019-04-23 03:44:31.500101',26,2),(152,'2019-04-23 03:45:11.324495',26,2),(153,'2019-04-23 03:45:25.050171',26,2),(154,'2019-04-23 03:48:28.159374',26,2),(155,'2019-04-23 03:51:24.113869',26,2),(156,'2019-04-23 03:51:40.334476',26,2),(157,'2019-04-23 03:52:09.530132',26,2),(158,'2019-04-23 03:52:23.903404',26,2),(159,'2019-04-23 03:52:31.745819',26,2),(160,'2019-04-23 03:52:34.417079',26,2),(161,'2019-04-23 03:52:36.610908',2,2),(162,'2019-04-23 03:52:45.635028',2,2),(163,'2019-04-23 03:52:46.064147',2,2),(164,'2019-04-23 03:52:50.209907',14,2),(165,'2019-04-23 03:52:55.440789',26,2),(166,'2019-04-23 03:52:58.505413',2,2),(167,'2019-04-23 03:53:03.645108',2,2),(168,'2019-04-23 03:53:06.509535',2,2),(169,'2019-04-23 03:53:17.663493',26,2),(170,'2019-04-23 03:54:14.479505',26,2),(171,'2019-04-23 03:54:19.107065',26,2),(172,'2019-04-23 03:54:21.135901',26,2),(173,'2019-04-23 03:55:54.736668',26,2),(174,'2019-04-23 03:56:09.650370',26,2),(175,'2019-04-23 03:56:18.276353',26,2),(176,'2019-04-23 03:56:21.174830',26,2),(177,'2019-04-23 03:56:49.330327',26,2),(178,'2019-04-23 03:56:49.866562',26,2),(179,'2019-04-23 03:56:57.296640',14,2),(180,'2019-04-23 03:57:01.061654',32,2),(181,'2019-04-23 03:57:05.262086',32,2),(182,'2019-04-23 03:57:21.455541',26,2),(183,'2019-04-23 03:57:59.240963',26,2),(184,'2019-04-23 03:58:01.744301',26,2),(185,'2019-04-23 03:58:10.971459',26,2),(186,'2019-04-23 03:58:27.708253',26,2),(187,'2019-04-23 03:58:37.311929',26,2),(188,'2019-04-23 03:59:15.339578',26,2),(189,'2019-04-23 03:59:45.015398',2,2),(190,'2019-04-23 03:59:51.838124',14,2),(191,'2019-04-23 04:00:13.757692',26,2),(192,'2019-04-23 04:22:07.801260',26,2),(193,'2019-04-23 04:22:16.302108',14,2),(194,'2019-04-23 04:22:19.481527',26,2),(195,'2019-04-23 05:02:20.164206',14,2),(196,'2019-04-24 00:19:51.678789',26,2),(197,'2019-04-24 00:20:40.944513',26,2),(198,'2019-04-24 00:21:10.539861',26,2),(199,'2019-04-24 00:32:05.779161',26,2),(200,'2019-04-24 00:33:44.598113',26,2),(201,'2019-04-24 00:33:46.656899',26,2),(202,'2019-04-24 00:35:17.783213',26,2),(203,'2019-04-24 00:35:19.057597',26,2),(204,'2019-04-24 00:37:31.912398',26,2),(205,'2019-04-24 00:37:36.742849',26,2),(206,'2019-04-24 00:37:57.772492',26,2),(207,'2019-04-24 00:38:21.077636',26,2),(208,'2019-04-24 00:38:27.830278',26,2),(209,'2019-04-24 00:38:36.307125',26,2),(210,'2019-04-24 00:39:07.107448',26,2),(211,'2019-04-24 00:39:29.233868',26,2),(212,'2019-04-24 00:39:53.116200',26,2),(213,'2019-04-24 00:39:57.346958',26,2),(214,'2019-04-24 00:39:58.218598',26,2),(215,'2019-04-24 00:40:09.367400',26,2),(216,'2019-04-24 00:40:14.010061',26,2),(217,'2019-04-24 00:42:37.802886',26,2),(218,'2019-04-24 00:44:29.567269',26,2),(219,'2019-04-24 00:44:29.594660',26,2),(220,'2019-04-24 00:46:09.357156',26,2),(221,'2019-04-24 00:46:09.405290',26,2),(222,'2019-04-24 00:46:16.679052',26,2),(223,'2019-04-24 00:46:16.704653',26,2),(224,'2019-04-24 00:47:50.442666',26,2),(225,'2019-04-24 00:47:50.472499',26,2),(226,'2019-04-24 00:49:40.344114',26,2),(227,'2019-04-24 00:50:25.496249',26,2),(228,'2019-04-24 00:51:16.464560',26,2),(229,'2019-04-24 00:52:54.272479',26,2),(230,'2019-04-24 00:55:22.661932',26,2),(231,'2019-04-24 00:55:50.737599',26,2),(232,'2019-04-24 00:56:33.300491',26,2),(233,'2019-04-24 00:56:37.297645',2,2),(234,'2019-04-24 00:58:56.479241',26,2),(235,'2019-04-24 00:59:19.640784',26,2),(236,'2019-04-24 01:00:02.810853',26,2),(237,'2019-04-24 01:00:04.124555',2,2),(238,'2019-04-24 01:02:47.149637',26,2),(239,'2019-04-24 01:03:19.360900',26,2),(240,'2019-04-24 01:06:30.714804',31,2),(241,'2019-04-24 01:07:01.524582',31,2),(242,'2019-04-24 01:07:12.377706',26,2),(243,'2019-04-24 01:07:15.394901',2,2),(244,'2019-04-24 01:07:18.260318',28,2),(245,'2019-04-24 01:07:21.696035',31,2),(246,'2019-04-24 01:07:26.529274',24,2),(247,'2019-04-24 01:07:54.219726',28,2),(248,'2019-04-24 01:07:54.269119',28,2),(249,'2019-04-24 01:11:02.486938',28,2),(250,'2019-04-24 01:11:09.182436',26,2),(251,'2019-04-24 01:11:14.740785',28,2),(252,'2019-04-24 01:13:33.049405',26,2),(253,'2019-04-24 01:13:37.487421',2,2),(254,'2019-04-24 01:13:40.860696',2,2),(255,'2019-04-24 01:16:14.863755',26,2),(256,'2019-04-24 01:16:24.529652',31,2),(257,'2019-04-24 01:16:37.447410',26,2),(258,'2019-04-24 01:17:53.131020',26,2),(259,'2019-04-24 01:19:39.751616',26,2),(260,'2019-04-24 01:19:47.281059',26,2),(261,'2019-04-24 01:19:54.897051',26,2),(262,'2019-04-24 01:23:03.915553',26,2),(263,'2019-04-24 01:23:39.492884',26,2),(264,'2019-04-24 01:25:22.818291',26,2),(265,'2019-04-24 01:25:59.628914',14,2),(266,'2019-04-24 01:27:12.820871',26,2),(267,'2019-04-24 01:28:21.677659',26,2),(268,'2019-04-24 01:54:21.096692',32,2),(269,'2019-04-24 01:55:14.643946',26,2),(270,'2019-04-24 02:03:31.318923',26,2),(271,'2019-04-24 02:08:29.887453',26,2),(272,'2019-04-24 02:09:07.966980',26,2),(273,'2019-04-24 02:11:10.345810',26,2),(274,'2019-04-24 02:13:00.015110',26,2),(275,'2019-04-24 02:14:59.679203',26,2),(276,'2019-04-24 02:16:06.538733',26,2),(277,'2019-04-24 02:18:35.825000',26,2),(278,'2019-04-24 02:20:02.600592',26,2),(279,'2019-04-24 02:21:50.719535',26,2),(280,'2019-04-24 02:23:00.084762',26,2),(281,'2019-04-24 02:25:26.494248',26,2),(282,'2019-04-24 02:26:38.772836',26,2),(283,'2019-04-24 02:29:57.884501',26,2),(284,'2019-04-24 02:31:23.410739',26,2),(285,'2019-04-24 02:31:46.880477',26,2),(286,'2019-04-24 02:33:38.149808',26,2),(287,'2019-04-24 02:36:13.257644',26,2),(288,'2019-04-24 02:36:51.560450',26,2),(289,'2019-04-24 02:37:20.170250',26,2),(290,'2019-04-24 02:37:20.834097',26,2),(291,'2019-04-24 02:38:08.728912',26,2),(292,'2019-04-24 02:38:26.417550',26,2),(293,'2019-04-24 02:38:50.323459',26,2),(294,'2019-04-24 02:39:31.069991',26,2),(295,'2019-04-24 02:39:52.761501',26,2),(296,'2019-04-24 02:45:10.573237',26,2),(297,'2019-04-24 02:45:21.903540',26,2),(298,'2019-04-24 02:46:14.995637',26,2),(299,'2019-04-24 02:47:14.051728',26,2),(300,'2019-04-24 02:47:33.027934',26,2),(301,'2019-04-24 02:48:04.218160',26,2),(302,'2019-04-24 02:48:32.939003',26,2),(303,'2019-04-24 02:51:23.183747',26,2),(304,'2019-04-24 02:52:13.553650',26,2),(305,'2019-04-24 02:52:56.267346',26,2),(306,'2019-04-24 02:53:52.686362',26,2),(307,'2019-04-24 02:54:07.901154',26,2),(308,'2019-04-24 02:54:32.592780',26,2),(309,'2019-04-24 02:54:54.699230',2,2),(310,'2019-04-24 02:55:01.042538',14,2),(311,'2019-04-24 02:55:01.337202',31,2),(312,'2019-04-24 02:55:08.366648',31,2),(313,'2019-04-24 02:55:22.171964',31,2),(314,'2019-04-24 02:56:50.120968',31,2),(315,'2019-04-24 02:56:51.187603',14,2),(316,'2019-04-24 02:56:58.154581',27,2),(317,'2019-04-24 02:57:06.837124',28,2),(318,'2019-04-24 02:57:10.597370',14,2),(319,'2019-04-24 02:57:14.551679',2,2),(320,'2019-04-24 02:57:21.440904',9,2),(321,'2019-04-24 02:57:34.863163',3,2),(322,'2019-04-24 03:41:24.913547',25,2),(323,'2019-04-24 04:08:26.662865',5,2),(324,'2019-04-24 04:08:29.505110',5,2),(325,'2019-04-24 04:08:32.135889',2,2),(326,'2019-04-24 04:08:33.975388',8,2),(327,'2019-04-24 04:08:36.014846',8,2),(328,'2019-04-24 04:08:38.139051',8,2),(329,'2019-04-25 01:33:01.900362',26,2),(330,'2019-04-25 01:40:30.732694',9,2),(331,'2019-04-25 01:40:34.606873',14,2),(332,'2019-04-25 01:40:49.271231',18,2),(333,'2019-04-25 01:40:51.267524',18,2),(334,'2019-04-25 01:40:52.922770',18,2),(335,'2019-04-25 01:40:54.984843',18,2),(336,'2019-04-25 01:40:56.670872',18,2),(337,'2019-04-25 01:40:58.299218',18,2),(338,'2019-04-25 01:41:06.152417',18,2),(339,'2019-04-25 01:41:08.984672',18,2),(340,'2019-04-25 01:41:10.244213',18,2),(341,'2019-04-25 01:41:11.108544',18,2),(342,'2019-04-25 01:41:12.896632',18,2),(343,'2019-04-25 01:41:13.962227',18,2),(344,'2019-04-25 01:41:15.316650',18,2),(345,'2019-04-25 01:41:16.349785',18,2),(346,'2019-04-25 01:42:59.317224',2,2),(347,'2019-04-25 01:46:53.948985',14,2),(348,'2019-04-25 01:46:56.546085',18,2),(349,'2019-04-25 01:47:01.147780',11,2),(350,'2019-04-25 01:52:50.720842',18,2),(351,'2019-04-25 02:05:14.514987',3,2),(352,'2019-04-25 02:05:21.253368',9,2),(353,'2019-04-25 02:05:29.802840',10,2),(354,'2019-04-25 02:05:38.577133',4,2),(355,'2019-04-25 02:05:41.681041',4,2),(356,'2019-04-25 02:05:44.301288',4,2),(357,'2019-04-25 02:07:32.286547',7,2),(358,'2019-04-25 02:10:00.220430',26,2),(359,'2019-04-25 02:10:03.372780',28,2),(360,'2019-04-25 02:10:09.174967',15,2),(361,'2019-04-25 02:11:16.992416',15,2),(362,'2019-04-25 02:11:19.577789',16,2),(363,'2019-04-25 02:11:32.408209',14,2),(364,'2019-04-25 02:11:34.572603',18,2),(365,'2019-04-25 02:11:36.424160',11,2),(366,'2019-04-25 02:11:43.558614',12,2),(367,'2019-04-25 02:12:08.430018',28,2),(368,'2019-04-25 02:12:10.653492',22,2),(369,'2019-04-25 02:12:12.963099',25,2),(370,'2019-04-25 02:12:14.819149',27,2),(371,'2019-04-25 02:12:19.576152',12,2),(372,'2019-04-25 02:12:40.769248',17,2),(373,'2019-04-25 02:12:54.732574',16,2),(374,'2019-04-25 02:12:58.061798',13,2),(375,'2019-04-25 02:13:01.396596',18,2),(376,'2019-04-25 02:14:14.818439',19,2),(377,'2019-04-25 02:14:17.057959',20,2),(378,'2019-04-25 02:14:19.909708',18,2),(379,'2019-04-25 02:14:29.973775',11,2),(380,'2019-04-25 02:21:20.322172',21,2),(381,'2019-04-25 02:21:23.523315',26,2),(382,'2019-04-25 02:21:25.928088',31,2),(383,'2019-04-25 02:21:27.967724',29,2),(384,'2019-04-25 02:21:31.735599',29,2),(385,'2019-04-25 02:21:34.512576',30,2),(386,'2019-04-25 02:21:38.861262',24,2),(387,'2019-04-25 02:22:05.675394',31,2),(388,'2019-04-25 02:22:20.000246',2,2),(389,'2019-04-25 02:22:22.782317',23,2),(390,'2019-04-25 02:22:25.631814',8,2),(391,'2019-04-25 02:22:28.105304',28,2),(392,'2019-04-25 02:22:30.744559',31,2),(393,'2019-04-25 02:22:40.580086',30,2),(394,'2019-04-25 02:22:50.415992',24,2),(395,'2019-04-25 02:22:58.917955',31,2),(396,'2019-04-25 02:23:05.809778',28,2),(397,'2019-04-25 02:23:08.775165',28,2),(398,'2019-04-25 02:23:11.127245',28,2),(399,'2019-04-25 02:23:13.603142',28,2),(400,'2019-04-25 02:23:23.130913',2,2),(401,'2019-04-25 02:23:26.607374',5,2),(402,'2019-04-25 02:23:29.688396',6,2),(403,'2019-04-25 02:24:00.872133',26,2),(404,'2019-04-25 02:24:18.618759',18,2),(405,'2019-04-25 02:24:20.935796',14,2),(406,'2019-04-25 02:24:23.609253',14,2),(407,'2019-04-25 02:24:25.919013',14,2),(408,'2019-04-25 02:24:28.195891',14,2),(409,'2019-04-25 02:24:31.102902',14,2),(410,'2019-04-25 02:24:33.243720',14,2),(411,'2019-04-25 02:24:35.423416',14,2),(412,'2019-04-25 02:24:37.917290',14,2),(413,'2019-04-25 02:24:40.472557',14,2),(414,'2019-04-25 02:24:42.456181',14,2),(415,'2019-04-25 02:25:07.487169',26,2),(416,'2019-04-25 02:25:09.590870',26,2),(417,'2019-04-25 02:27:16.031510',26,2),(418,'2019-04-25 02:27:16.377692',26,2),(419,'2019-04-25 02:28:38.226646',26,2),(420,'2019-04-25 02:28:44.286616',26,2),(421,'2019-04-25 02:28:52.796400',26,2),(422,'2019-04-25 02:29:05.285095',26,2),(423,'2019-04-25 02:29:29.996110',2,2),(424,'2019-04-25 02:29:47.044799',26,2),(425,'2019-04-25 02:29:50.037096',2,2),(426,'2019-04-25 02:29:53.468159',2,2),(427,'2019-04-25 02:29:59.453301',26,2),(428,'2019-04-25 02:45:21.966649',26,2),(429,'2019-04-25 02:45:36.842620',2,2),(430,'2019-04-25 02:45:47.715456',32,2),(431,'2019-04-25 02:46:01.163662',26,2),(432,'2019-04-25 02:46:04.467634',26,2),(433,'2019-04-25 02:46:38.080638',26,2),(434,'2019-04-25 14:05:43.288443',14,2),(435,'2019-04-25 14:06:04.011986',2,2),(436,'2019-04-25 14:07:21.118754',2,2),(437,'2019-04-25 14:08:26.444782',28,2),(438,'2019-04-25 14:08:56.095729',2,2),(439,'2019-04-25 14:09:25.455047',18,2),(440,'2019-04-25 14:11:00.182096',2,2),(441,'2019-04-25 14:11:05.021184',5,2),(442,'2019-04-25 14:11:37.327665',2,2),(443,'2019-04-25 14:11:41.201764',8,2),(444,'2019-04-25 14:12:27.833071',2,2),(445,'2019-04-25 14:12:50.539551',28,2),(446,'2019-04-25 14:16:32.303486',26,2),(447,'2019-04-25 14:16:56.066504',28,2),(448,'2019-04-25 14:17:16.866296',3,2),(449,'2019-04-25 14:20:16.233450',26,2),(450,'2019-04-25 14:36:13.405188',14,2),(451,'2019-04-25 14:42:16.932086',2,2),(452,'2019-04-25 14:44:41.643806',2,2),(453,'2019-04-25 14:45:44.060596',26,2),(454,'2019-04-25 14:46:13.975287',26,2),(455,'2019-04-25 14:46:44.546390',26,2),(456,'2019-04-25 14:50:25.053231',26,2),(457,'2019-04-25 14:51:06.453491',26,2),(458,'2019-04-25 14:51:40.590218',26,2),(459,'2019-04-25 14:52:26.335865',26,2),(460,'2019-04-25 14:54:13.827538',26,2),(461,'2019-04-25 14:54:45.411261',26,2),(462,'2019-04-25 14:55:32.403782',2,2),(463,'2019-04-25 14:56:08.919510',38,2),(464,'2019-04-25 15:09:39.538217',2,2),(465,'2019-04-26 00:55:11.469130',26,2),(466,'2019-04-26 00:55:16.756059',28,2),(467,'2019-04-26 00:55:30.764277',2,2),(468,'2019-04-26 00:55:38.540554',26,2),(469,'2019-04-26 01:04:10.999621',26,2);
/*!40000 ALTER TABLE `travelResources_readrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelResources_type`
--

DROP TABLE IF EXISTS `travelResources_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelResources_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelResources_type`
--

LOCK TABLES `travelResources_type` WRITE;
/*!40000 ALTER TABLE `travelResources_type` DISABLE KEYS */;
INSERT INTO `travelResources_type` VALUES (1,'Shopping'),(2,'Food'),(3,'Attractions'),(4,'Wei Jie Lin');
/*!40000 ALTER TABLE `travelResources_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelResources_userfollow`
--

DROP TABLE IF EXISTS `travelResources_userfollow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelResources_userfollow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `travelResources_userfollow_user_id_5a0dd6c9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `travelResources_userfollow_user_id_5a0dd6c9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelResources_userfollow`
--

LOCK TABLES `travelResources_userfollow` WRITE;
/*!40000 ALTER TABLE `travelResources_userfollow` DISABLE KEYS */;
/*!40000 ALTER TABLE `travelResources_userfollow` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-26  9:47:51
