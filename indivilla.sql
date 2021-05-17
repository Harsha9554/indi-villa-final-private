-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: indivilla
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agencies_agency`
--

DROP TABLE IF EXISTS `agencies_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencies_agency` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies_agency`
--

LOCK TABLES `agencies_agency` WRITE;
/*!40000 ALTER TABLE `agencies_agency` DISABLE KEYS */;
INSERT INTO `agencies_agency` VALUES (1,'INDI-VILLA','K L University, Green Fields, Vaddeswaram,  Guntur, Andhra Pradesh , India','office@indivilla.com'),(2,'T-Agency','14, No 125, A Block, Sribalaji Complex, Sultanpet, Bengaluru, Karnataka','office@tagency.com'),(3,'WorldWise Agency','92 B, Part 2, Vinoba Puri Ground Floor, Lajpat Nagar, Delhi','office@worldwise.com');
/*!40000 ALTER TABLE `agencies_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents_agent`
--

DROP TABLE IF EXISTS `agents_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents_agent` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `agency_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agents_agent_agency_id_43ca874e_fk_agencies_agency_id` (`agency_id`),
  CONSTRAINT `agents_agent_agency_id_43ca874e_fk_agencies_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agencies_agency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents_agent`
--

LOCK TABLES `agents_agent` WRITE;
/*!40000 ALTER TABLE `agents_agent` DISABLE KEYS */;
INSERT INTO `agents_agent` VALUES (1,'Ravi Kumar Sharma','photos/2021/05/08/2.jpg','Providing guidance and assisting sellers and buyers in marketing and purchasing property for the right price under the best term','91-935-5579-342','ravikumar@gmail.com','2020-03-04 07:59:52.000000',1),(2,'Sakshi Gupta','photos/2021/05/08/4.jpg','Determining clients’ needs and financials abilities to propose solutions that suit them','91-855-5137-117','sakshigupta@gmail.com','2019-02-02 08:02:58.000000',2),(3,'Gowtham Chowdhary','photos/2021/05/08/1.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','91-755-5690-350','gowtham@gmail.com','2020-05-08 08:04:24.000000',3),(4,'Kesav Anand Reddy','photos/2021/05/08/3.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','91-965-5561-546','kesav@gmail.com','2019-04-09 08:07:36.000000',1),(5,'Apurva Shetty','photos/2021/05/08/5.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','91-755-5410-350','apurva@gmail.com','2021-03-03 08:09:00.000000',3);
/*!40000 ALTER TABLE `agents_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add listing',7,'add_listing'),(26,'Can change listing',7,'change_listing'),(27,'Can delete listing',7,'delete_listing'),(28,'Can view listing',7,'view_listing'),(29,'Can add agent',8,'add_agent'),(30,'Can change agent',8,'change_agent'),(31,'Can delete agent',8,'delete_agent'),(32,'Can view agent',8,'view_agent'),(33,'Can add agency',9,'add_agency'),(34,'Can change agency',9,'change_agency'),(35,'Can delete agency',9,'delete_agency'),(36,'Can view agency',9,'view_agency');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$nIu4rRGxwKPG8iblpU68ih$CEAV08AamppyB8avtEJyidZkuzuVCUagAJfrUlufhFs=','2021-05-10 06:50:38.717111',1,'harsha','','','harsha@gmail.com',1,1,'2021-05-06 15:23:23.316530');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-05-08 07:56:23.091630','1','INDI-VILLA',1,'[{\"added\": {}}]',9,1),(2,'2021-05-08 07:58:50.447490','2','T-Agency',1,'[{\"added\": {}}]',9,1),(3,'2021-05-08 07:59:30.179014','3','WorldWise Agency',1,'[{\"added\": {}}]',9,1),(4,'2021-05-08 08:02:58.113387','1','Ravi Kumar Sharma',1,'[{\"added\": {}}]',8,1),(5,'2021-05-08 08:04:24.011919','2','Sakshi Gupta',1,'[{\"added\": {}}]',8,1),(6,'2021-05-08 08:07:36.539318','3','Gowtham Chowdhary',1,'[{\"added\": {}}]',8,1),(7,'2021-05-08 08:09:00.486443','4','Kesav Anand Reddy',1,'[{\"added\": {}}]',8,1),(8,'2021-05-08 08:10:54.632278','5','Apurva Shetty',1,'[{\"added\": {}}]',8,1),(9,'2021-05-08 10:29:38.561417','1','Solaris City',1,'[{\"added\": {}}]',7,1),(10,'2021-05-08 10:38:21.342257','2','Avirat Silver Luxuria',1,'[{\"added\": {}}]',7,1),(11,'2021-05-08 10:46:58.158816','3','Concorde Auriga',1,'[{\"added\": {}}]',7,1),(12,'2021-05-08 11:00:34.503074','4','Brigade Signature Tower',1,'[{\"added\": {}}]',7,1),(13,'2021-05-08 11:05:28.600008','5','Grand Majestic Commercial Centre',1,'[{\"added\": {}}]',7,1),(14,'2021-05-08 11:10:55.643006','6','APR Praveens Crystal Avenue',1,'[{\"added\": {}}]',7,1),(15,'2021-05-08 11:14:50.445430','7','Meenazi Elite',1,'[{\"added\": {}}]',7,1),(16,'2021-05-08 11:19:47.585995','8','JB\'s Serene City',1,'[{\"added\": {}}]',7,1),(17,'2021-05-08 11:23:15.067419','8','JB\'s Serene City',2,'[{\"changed\": {\"fields\": [\"Listing category\"]}}]',7,1),(18,'2021-05-08 19:18:10.251944','7','Meenazi Elite',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',7,1),(19,'2021-05-08 19:18:20.436135','5','Grand Majestic Commercial Centre',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',7,1),(20,'2021-05-08 19:47:19.146971','4','Brigade Signature Tower',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',7,1),(21,'2021-05-08 19:47:19.545339','3','Concorde Auriga',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',7,1),(22,'2021-05-08 19:47:19.967019','2','Avirat Silver Luxuria',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',7,1),(23,'2021-05-08 19:48:12.914306','5','Grand Majestic Commercial Centre',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',7,1),(24,'2021-05-08 19:52:17.054122','6','APR Praveens Crystal Avenue',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',7,1),(25,'2021-05-08 19:52:17.341207','3','Concorde Auriga',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',7,1),(26,'2021-05-08 19:59:32.154504','3','Concorde Auriga',2,'[{\"changed\": {\"fields\": [\"Address\"]}}]',7,1),(27,'2021-05-09 09:47:32.294765','6','APR Praveens Crystal Avenue',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',7,1),(28,'2021-05-09 09:47:32.657172','5','Grand Majestic Commercial Centre',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',7,1),(29,'2021-05-09 09:47:32.760024','4','Brigade Signature Tower',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',7,1),(30,'2021-05-09 09:47:32.876530','2','Avirat Silver Luxuria',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',7,1),(31,'2021-05-09 09:48:03.685659','6','APR Crystal Avenue',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(32,'2021-05-09 09:48:21.704816','5','Majestic Commercial Centre',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(33,'2021-05-10 15:45:55.514157','4','Brigade Signature Tower',2,'[{\"changed\": {\"fields\": [\"Address\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'agencies','agency'),(8,'agents','agent'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'listings','listing'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-05-06 11:59:17.049785'),(2,'auth','0001_initial','2021-05-06 12:00:39.670194'),(3,'admin','0001_initial','2021-05-06 12:01:31.505745'),(4,'admin','0002_logentry_remove_auto_add','2021-05-06 12:01:32.619254'),(5,'admin','0003_logentry_add_action_flag_choices','2021-05-06 12:01:33.732457'),(6,'contenttypes','0002_remove_content_type_name','2021-05-06 12:02:03.766679'),(7,'auth','0002_alter_permission_name_max_length','2021-05-06 12:02:23.927929'),(8,'auth','0003_alter_user_email_max_length','2021-05-06 12:02:26.572880'),(9,'auth','0004_alter_user_username_opts','2021-05-06 12:02:28.818490'),(10,'auth','0005_alter_user_last_login_null','2021-05-06 12:02:47.756949'),(11,'auth','0006_require_contenttypes_0002','2021-05-06 12:02:49.031579'),(12,'auth','0007_alter_validators_add_error_messages','2021-05-06 12:02:49.867025'),(13,'auth','0008_alter_user_username_max_length','2021-05-06 12:03:09.841142'),(14,'auth','0009_alter_user_last_name_max_length','2021-05-06 12:03:33.070158'),(15,'auth','0010_alter_group_name_max_length','2021-05-06 12:03:39.087810'),(16,'auth','0011_update_proxy_permissions','2021-05-06 12:03:40.047705'),(17,'auth','0012_alter_user_first_name_max_length','2021-05-06 12:03:56.022903'),(26,'agencies','0001_initial','2021-05-06 18:52:42.874179'),(27,'agents','0001_initial','2021-05-06 18:52:45.400396'),(28,'listings','0001_initial','2021-05-06 18:52:49.319628'),(29,'sessions','0001_initial','2021-05-06 18:52:52.177781'),(30,'agencies','0002_alter_agency_options','2021-05-06 19:06:15.699833'),(31,'listings','0002_alter_listing_listing_category','2021-05-08 11:22:57.836083');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1yziu8qkkjds8nh1m8icfyepmld5ba20','.eJxVjDsOwjAUBO_iGln-JP5Q0nMGa_1s4wBypDipEHeHSCmg3ZnZFwvY1hq2npcwJXZmkp1-twh65LaDdEe7zZzmti5T5LvCD9r5dU75eTncv4OKXr-1tlYVlyQJgWK9zwJwcGokOGu1cYDWRDoKVcqAZKTwwowwJSo7GMfeH9-oN58:1lfo4v:n35V2vTEOShqIvuTItJZFtrjJEU2pZvgwHWwlWgXqDo','2021-05-23 18:22:57.468685'),('bc972zyd7aournpycr5dplnxp0g29fby','.eJxVjDsOwjAUBO_iGln-JP5Q0nMGa_1s4wBypDipEHeHSCmg3ZnZFwvY1hq2npcwJXZmkp1-twh65LaDdEe7zZzmti5T5LvCD9r5dU75eTncv4OKXr-1tlYVlyQJgWK9zwJwcGokOGu1cYDWRDoKVcqAZKTwwowwJSo7GMfeH9-oN58:1lfRj7:5DY7QlS76-zUFmP-od_XUEbfUAPqpU7R8Autw_17NhQ','2021-05-22 18:30:57.052235'),('jfh5trzk33t6p5q8dxxbpw5dpqtpo25c','.eJxVjDsOwjAUBO_iGln-JP5Q0nMGa_1s4wBypDipEHeHSCmg3ZnZFwvY1hq2npcwJXZmkp1-twh65LaDdEe7zZzmti5T5LvCD9r5dU75eTncv4OKXr-1tlYVlyQJgWK9zwJwcGokOGu1cYDWRDoKVcqAZKTwwowwJSo7GMfeH9-oN58:1lfRYl:XsGh89zL9PKf7aA8LW_D2IceySNVXzCteDpDlV79uhg','2021-05-22 18:20:15.129900'),('k9gsumc8p1qelc44566xui5bu9io23fr','.eJxVjDsOwjAUBO_iGln-JP5Q0nMGa_1s4wBypDipEHeHSCmg3ZnZFwvY1hq2npcwJXZmkp1-twh65LaDdEe7zZzmti5T5LvCD9r5dU75eTncv4OKXr-1tlYVlyQJgWK9zwJwcGokOGu1cYDWRDoKVcqAZKTwwowwJSo7GMfeH9-oN58:1lfMX1:o7aUohQmPwtzbzFSl1-Sshh2m2WOa-CpZ0Kt5yI1NC8','2021-05-22 12:58:07.141344'),('lkkfukan52g3ftkeg65e0xbnwpt3fcak','.eJxVjDsOwjAUBO_iGln-JP5Q0nMGa_1s4wBypDipEHeHSCmg3ZnZFwvY1hq2npcwJXZmkp1-twh65LaDdEe7zZzmti5T5LvCD9r5dU75eTncv4OKXr-1tlYVlyQJgWK9zwJwcGokOGu1cYDWRDoKVcqAZKTwwowwJSo7GMfeH9-oN58:1lfRYh:PMbTg7IrGXp_lgTIYbq0KHRqp6qx8DXIUsrwDTUoIFM','2021-05-22 18:20:11.733955'),('zigl9r65z8nkcjfhzxw8omrabm0leqzh','.eJxVjDsOwjAUBO_iGln-JP5Q0nMGa_1s4wBypDipEHeHSCmg3ZnZFwvY1hq2npcwJXZmkp1-twh65LaDdEe7zZzmti5T5LvCD9r5dU75eTncv4OKXr-1tlYVlyQJgWK9zwJwcGokOGu1cYDWRDoKVcqAZKTwwowwJSo7GMfeH9-oN58:1lfzkU:ZszY-8Rl0n9xiSfYb99SfbXkFcyeJ7zPgsKt7Glvz0k','2021-05-24 06:50:38.794731');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listings_listing`
--

DROP TABLE IF EXISTS `listings_listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listings_listing` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` int NOT NULL,
  `bedrooms` int NOT NULL,
  `bathrooms` int NOT NULL,
  `garage` int NOT NULL,
  `building_area` int NOT NULL,
  `listing_category` varchar(15) NOT NULL,
  `listing_type` varchar(15) NOT NULL,
  `listing_current_status` varchar(25) NOT NULL,
  `listing_buy_status` varchar(15) NOT NULL,
  `photo_main` varchar(100) NOT NULL,
  `photo_1` varchar(100) NOT NULL,
  `photo_2` varchar(100) NOT NULL,
  `photo_3` varchar(100) NOT NULL,
  `photo_4` varchar(100) NOT NULL,
  `photo_5` varchar(100) NOT NULL,
  `photo_6` varchar(100) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `list_date` datetime(6) NOT NULL,
  `agent_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listings_listing_agent_id_6e7e81b4_fk_agents_agent_id` (`agent_id`),
  CONSTRAINT `listings_listing_agent_id_6e7e81b4_fk_agents_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `agents_agent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings_listing`
--

LOCK TABLES `listings_listing` WRITE;
/*!40000 ALTER TABLE `listings_listing` DISABLE KEYS */;
INSERT INTO `listings_listing` VALUES (1,'Solaris City','Nagarbhavi, Bengaluru, Karnataka','Bengaluru','Karnataka','Solaris City Serampore is more than a home. It is greener way of life. It makes the best use of light, space, aspect and energy and blends them with modern amenities. All this just for you. Dream homes that are 3-sides open ensure that you have abundant light and air in cross-ventilated rooms, The in-wall hanging wardrobes in every bedroom allow the luxury of using extra space more efficiently and innovatively.',1240000,3,2,1,943,'Apartment','Residential','Under-Construction','Sale','photos/2021/05/08/1.png','photos/2021/05/08/2_sub.png','photos/2021/05/08/3_sub.png','photos/2021/05/08/4_sub.png','photos/2021/05/08/5_sub.png','photos/2021/05/08/6_sub.png','photos/2021/05/08/7_sub.png',1,'2020-05-12 09:58:35.000000',1),(2,'Avirat Silver Luxuria','Kulshekar, Mangaluru, Karnataka','Mangaluru','Karnataka','Avirat Silver Luxuria is a residential development in Jagatpur, Ahmedabad North. The project is built by Avirat Infrastructure. They provide 4BHK apartments with all necessities.',16000000,4,3,2,4150,'Apartment','Residential','Completed','Sale','photos/2021/05/08/2.png','photos/2021/05/08/2_sub_oFJkYNN.png','photos/2021/05/08/3_sub_F4jaOnL.png','photos/2021/05/08/4_sub_Y0uLeZc.png','photos/2021/05/08/5_sub_eIXbqdq.png','photos/2021/05/08/6_sub_neVPLLJ.png','photos/2021/05/08/7_sub_cVOkC6V.png',1,'2018-08-07 10:34:31.000000',2),(3,'Concorde Auriga','Old Madras Road, Bangalore East','Bengaluru','Karnataka','Concorde Auriga in Old Madras Road, Bangalore East by Concorde is a residential project.Highlights of project : Home Automation. Uninterrupted Lake Views.',4900000,2,2,1,1485,'Apartment','Residential','Under-Construction','Sale','photos/2021/05/08/3.png','photos/2021/05/08/2_sub_uk0NDvK.png','photos/2021/05/08/3_sub_m61452K.png','photos/2021/05/08/4_sub_1AvHVTF.png','photos/2021/05/08/5_sub_LBq1EsV.png','photos/2021/05/08/6_sub_Vsc5da9.png','photos/2021/05/08/7_sub_gEV0Fvt.png',1,'2020-11-08 10:40:02.000000',3),(4,'Brigade Signature Tower','Old Airport Road, Bangalore East','Bengaluru','Karnataka','Brigade Signature Tower is a commercial development of Brigade Group and Krishil Capital Holdings,located in Bangalore. The project offers office spaces at very competitive and affordable price.Its a part of Brigade Golden Triangle. The project is well equipped with all modern amenities and 24X7 security service to facilitate the business needs.',18800000,0,0,2,12800,'Office','Commercial','Completed','Sale','photos/2021/05/08/4.png','photos/2021/05/08/2_sub_K9fxiYu.png','photos/2021/05/08/3_sub_AfIroPa.png','photos/2021/05/08/4_sub_IB0I3au.png','photos/2021/05/08/5_sub_bHqU4Cs.png','photos/2021/05/08/6_sub_p7zA1PA.png','photos/2021/05/08/7_sub_s4XVR2f.png',1,'2021-03-21 10:56:48.000000',4),(5,'Majestic Commercial Centre','Gandhi Nagar, Bangalore Central , Bengaluru , Karnataka','Bengaluru','Karnataka','Grand Majestic Commercial Centre, is a fully integrated office and retail complex of 85,000 Sq.Ft, located in the heart of Gandhinagar, Bangalore, less than 500m from Canara Bank, Majestic Metro Station, Railway Station & KSRTC Bus Stand. Grand Majestic is ideally situated for both retail and office space requirements in the heart of Bangalore city ranging from 200 Sq.Ft to 4,000 Sq.Ft. The project has received OC.',1880000,0,0,3,2230,'Office','Commercial','Completed','Sale','photos/2021/05/08/5.png','photos/2021/05/08/2_sub_O8YdC5t.png','photos/2021/05/08/3_sub_lHGW1hm.png','photos/2021/05/08/4_sub_ISw5ZdW.png','photos/2021/05/08/5_sub_P7XkDQX.png','photos/2021/05/08/6_sub_S6a0MUR.png','photos/2021/05/08/7_sub_hJ7QljS.png',1,'2018-12-05 11:02:25.000000',5),(6,'APR Crystal Avenue','Vanasthalipuram, Hyderabad, Telangana','Hyderabad','Telangana','APR Praveens Crystal Avenue in Vanasthalipuram, Hyderabad by APR Group is a residential project.',15100000,3,3,1,2865,'House','Residential','Completed','Sale','photos/2021/05/08/6.png','photos/2021/05/08/2_sub_UzPMvdR.png','photos/2021/05/08/3_sub_6ZEtZaS.png','photos/2021/05/08/4_sub_59SvsD5.png','photos/2021/05/08/5_sub_UM2AZqa.png','photos/2021/05/08/6_sub_54cZB0J.png','photos/2021/05/08/7_sub_WHqWxvU.png',1,'2020-02-04 11:08:17.000000',1),(7,'Meenazi Elite','Kismathpur, Hyderabad, Telangana','Hyderabad','Telangana','Meenazi Elite in Kismathpur, Hyderabad by Elite Constructions is a residential project.\r\n\r\nThe project offers Apartment with perfect combination of contemporary architecture and features to provide comfortable living.',5400000,3,2,1,1310,'Apartment','Residential','Under-Construction','Sale','photos/2021/05/08/7.png','photos/2021/05/08/2_sub_cr1ZKAX.png','photos/2021/05/08/3_sub_gMQM1nf.png','photos/2021/05/08/4_sub_HX5OuuB.png','photos/2021/05/08/5_sub_KpweFGm.png','photos/2021/05/08/6_sub_QTotq6C.png','photos/2021/05/08/7_sub_iQv4bII.png',1,'2020-07-26 11:10:56.000000',2),(8,'JB\'s Serene City','Adibatla, Hyderabad, Telangana','Hyderabad','Telangana','JBs Serene City in Adibatla, Hyderabad by JB Infra Projects is a residential project.\r\n\r\nThe project offers Land and Villa with perfect combination of contemporary architecture and features to provide comfortable living.',12500000,4,3,1,2500,'Villa','Residential','Completed','Sale','photos/2021/05/08/8.png','photos/2021/05/08/2_sub_bQxyvvM.png','photos/2021/05/08/3_sub_Hqah349.png','photos/2021/05/08/4_sub_FPbwgqg.png','photos/2021/05/08/5_sub_f0np2UJ.png','photos/2021/05/08/6_sub_6GZcon8.png','photos/2021/05/08/7_sub_BIliZ7r.png',1,'2021-05-08 11:15:34.000000',3);
/*!40000 ALTER TABLE `listings_listing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-12  1:43:29
