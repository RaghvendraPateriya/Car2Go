-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: car2go
-- ------------------------------------------------------
-- Server version	5.5.55-0ubuntu0.14.04.1

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `street` varchar(30) NOT NULL,
  `pin` int(11) NOT NULL,
  `contact_no` int(11) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (100,'MP','IN','street address 100',123123,100100100),(101,'MH','IN','street address 101',123124,100100101),(102,'UP','IN','street address 102',123125,100100102),(103,'HP','IN','street address 103',123126,100100103);
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BookingHistory`
--

DROP TABLE IF EXISTS `BookingHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BookingHistory` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `status` varchar(1) NOT NULL,
  `car_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `BookingHistory_car_id_36f36bd6_fk_Car_car_id` (`car_id`),
  KEY `BookingHistory_user_id_8132bd98_fk_Users_id` (`user_id`),
  CONSTRAINT `BookingHistory_user_id_8132bd98_fk_Users_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `BookingHistory_car_id_36f36bd6_fk_Car_car_id` FOREIGN KEY (`car_id`) REFERENCES `Car` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookingHistory`
--

LOCK TABLES `BookingHistory` WRITE;
/*!40000 ALTER TABLE `BookingHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `BookingHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Car`
--

DROP TABLE IF EXISTS `Car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Car` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_name` varchar(30) NOT NULL,
  `seater` int(11) NOT NULL,
  `fule_type` varchar(1) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`car_id`),
  KEY `main_car_company_id_e0482226_fk_main_company_company_id` (`company_id`),
  CONSTRAINT `main_car_company_id_e0482226_fk_main_company_company_id` FOREIGN KEY (`company_id`) REFERENCES `Company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car`
--

LOCK TABLES `Car` WRITE;
/*!40000 ALTER TABLE `Car` DISABLE KEYS */;
INSERT INTO `Car` VALUES (1,'indica',4,'P',111),(2,'xylo',6,'P',112),(3,'innova',6,'P',113);
/*!40000 ALTER TABLE `Car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address_id` int(11) NOT NULL,
  `doc_id_id` int(11) NOT NULL,
  PRIMARY KEY (`company_id`),
  KEY `main_company_address_id_26379935_fk_main_address_address_id` (`address_id`),
  KEY `main_company_doc_id_id_697b273e_fk_main_document_doc_id` (`doc_id_id`),
  CONSTRAINT `main_company_address_id_26379935_fk_main_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`),
  CONSTRAINT `main_company_doc_id_id_697b273e_fk_main_document_doc_id` FOREIGN KEY (`doc_id_id`) REFERENCES `Document` (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
INSERT INTO `Company` VALUES (111,'TCS',100,4),(112,'sony',101,5),(113,'A2Z',102,6);
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Document`
--

DROP TABLE IF EXISTS `Document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Document` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_type` varchar(1) NOT NULL,
  `doc_url` varchar(50) NOT NULL,
  PRIMARY KEY (`doc_id`),
  KEY `main_document123_doc_url_46fa016e` (`doc_url`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Document`
--

LOCK TABLES `Document` WRITE;
/*!40000 ALTER TABLE `Document` DISABLE KEYS */;
INSERT INTO `Document` VALUES (1,'p','http://doc_url/1'),(2,'D','http://doc_url/2'),(3,'V','http://doc_url/3'),(4,'T','http://doc_url/4'),(5,'T','http://doc_url/5'),(6,'T','http://doc_url/6');
/*!40000 ALTER TABLE `Document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransactinHistory`
--

DROP TABLE IF EXISTS `TransactinHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransactinHistory` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment` decimal(3,1) NOT NULL,
  `status` varchar(1) NOT NULL,
  `datetime` datetime NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `main_transactinhisto_booking_id_b2a3f20a_fk_main_boki` (`booking_id`),
  CONSTRAINT `TransactinHistory_booking_id_be78e9c8_fk_BookingHi` FOREIGN KEY (`booking_id`) REFERENCES `BookingHistory` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransactinHistory`
--

LOCK TABLES `TransactinHistory` WRITE;
/*!40000 ALTER TABLE `TransactinHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransactinHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `address_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `main_users_address_id_616db0e4_fk_main_address_address_id` (`address_id`),
  KEY `main_users_doc_id_448fb999_fk_main_document_doc_id` (`doc_id`),
  CONSTRAINT `main_users_address_id_616db0e4_fk_main_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`),
  CONSTRAINT `main_users_doc_id_448fb999_fk_main_document_doc_id` FOREIGN KEY (`doc_id`) REFERENCES `Document` (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (2,'passwd',NULL,0,'raghu@gmail.com','raghu','pateriya','raghu@gmail.com',0,1,'0000-00-00 00:00:00',100,1),(3,'passwd',NULL,0,'rohit@gmail.com','rohit','kasarla','rohit@gmail.com',0,1,'0000-00-00 00:00:00',100,2),(4,'passwd',NULL,0,'faruk@gmail.com','faruk','md','faruk@gmail.com',0,1,'0000-00-00 00:00:00',100,3);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users_groups`
--

DROP TABLE IF EXISTS `Users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_users_groups_users_id_group_id_bf40853e_uniq` (`users_id`,`group_id`),
  KEY `main_users_groups_group_id_fd3d265b_fk_auth_group_id` (`group_id`),
  CONSTRAINT `main_users_groups_group_id_fd3d265b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `main_users_groups_users_id_13456f18_fk_main_users_id` FOREIGN KEY (`users_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users_groups`
--

LOCK TABLES `Users_groups` WRITE;
/*!40000 ALTER TABLE `Users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users_user_permissions`
--

DROP TABLE IF EXISTS `Users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_users_user_permissions_users_id_permission_id_6af251f7_uniq` (`users_id`,`permission_id`),
  KEY `main_users_user_perm_permission_id_3981309e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `main_users_user_permissions_users_id_0b060920_fk_main_users_id` FOREIGN KEY (`users_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `main_users_user_perm_permission_id_3981309e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users_user_permissions`
--

LOCK TABLES `Users_user_permissions` WRITE;
/*!40000 ALTER TABLE `Users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add address',6,'add_address'),(17,'Can change address',6,'change_address'),(18,'Can delete address',6,'delete_address'),(19,'Can add transactin history',7,'add_transactinhistory'),(20,'Can change transactin history',7,'change_transactinhistory'),(21,'Can delete transactin history',7,'delete_transactinhistory'),(22,'Can add document123',8,'add_document123'),(23,'Can change document123',8,'change_document123'),(24,'Can delete document123',8,'delete_document123'),(25,'Can add company',9,'add_company'),(26,'Can change company',9,'change_company'),(27,'Can delete company',9,'delete_company'),(28,'Can add user',10,'add_users'),(29,'Can change user',10,'change_users'),(30,'Can delete user',10,'delete_users'),(31,'Can add car',11,'add_car'),(32,'Can change car',11,'change_car'),(33,'Can delete car',11,'delete_car'),(34,'Can add boking history',12,'add_bokinghistory'),(35,'Can change boking history',12,'change_bokinghistory'),(36,'Can delete boking history',12,'delete_bokinghistory'),(37,'Can add document',8,'add_document'),(38,'Can change document',8,'change_document'),(39,'Can delete document',8,'delete_document'),(40,'Can add booking history',13,'add_bookinghistory'),(41,'Can change booking history',13,'change_bookinghistory'),(42,'Can delete booking history',13,'delete_bookinghistory');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_main_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_main_users_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'contenttypes','contenttype'),(6,'main','address'),(12,'main','bokinghistory'),(13,'main','bookinghistory'),(11,'main','car'),(9,'main','company'),(8,'main','document'),(7,'main','transactinhistory'),(10,'main','users'),(5,'sessions','session');
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
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-05-21 07:35:54'),(2,'contenttypes','0002_remove_content_type_name','2017-05-21 07:35:54'),(3,'auth','0001_initial','2017-05-21 07:35:54'),(4,'auth','0002_alter_permission_name_max_length','2017-05-21 07:35:54'),(5,'auth','0003_alter_user_email_max_length','2017-05-21 07:35:54'),(6,'auth','0004_alter_user_username_opts','2017-05-21 07:35:54'),(7,'auth','0005_alter_user_last_login_null','2017-05-21 07:35:54'),(8,'auth','0006_require_contenttypes_0002','2017-05-21 07:35:54'),(9,'auth','0007_alter_validators_add_error_messages','2017-05-21 07:35:54'),(10,'auth','0008_alter_user_username_max_length','2017-05-21 07:35:54'),(11,'main','0001_initial','2017-05-21 07:35:55'),(12,'admin','0001_initial','2017-05-21 07:35:55'),(13,'admin','0002_logentry_remove_auto_add','2017-05-21 07:35:55'),(14,'sessions','0001_initial','2017-05-21 07:35:55'),(15,'main','0002_auto_20170521_0736','2017-05-21 07:36:31'),(16,'main','0003_auto_20170521_0806','2017-05-21 08:06:41'),(17,'main','0004_auto_20170522_1136','2017-05-22 06:06:15');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-22 12:03:27
