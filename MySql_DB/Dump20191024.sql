CREATE DATABASE  IF NOT EXISTS `sgpc_leave` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sgpc_leave`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: sgpc_leave
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `approval_actings`
--

DROP TABLE IF EXISTS `approval_actings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `approval_actings` (
  `approve_acting` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dl_leave_id` bigint(20) unsigned NOT NULL,
  `emp_act_id` bigint(20) unsigned NOT NULL,
  KEY `approval_actings_dl_leave_id_foreign` (`dl_leave_id`),
  KEY `approval_actings_emp_act_id_foreign` (`emp_act_id`),
  CONSTRAINT `approval_actings_dl_leave_id_foreign` FOREIGN KEY (`dl_leave_id`) REFERENCES `day_leaves` (`dl_leave_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `approval_actings_emp_act_id_foreign` FOREIGN KEY (`emp_act_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_actings`
--

LOCK TABLES `approval_actings` WRITE;
/*!40000 ALTER TABLE `approval_actings` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_actings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_supervises`
--

DROP TABLE IF EXISTS `approval_supervises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `approval_supervises` (
  `leave_id` int(11) NOT NULL,
  `leave_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approve_supervise` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `supervising_officer` bigint(20) unsigned NOT NULL,
  KEY `approval_supervises_supervising_officer_foreign` (`supervising_officer`),
  CONSTRAINT `approval_supervises_supervising_officer_foreign` FOREIGN KEY (`supervising_officer`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_supervises`
--

LOCK TABLES `approval_supervises` WRITE;
/*!40000 ALTER TABLE `approval_supervises` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_supervises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_leaves`
--

DROP TABLE IF EXISTS `day_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `day_leaves` (
  `dl_leave_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `leave_size` double(3,2) NOT NULL,
  `request_date` date NOT NULL,
  `leave_desc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `on_leave_address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `legger_page` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`dl_leave_id`),
  KEY `day_leaves_user_id_foreign` (`user_id`),
  CONSTRAINT `day_leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_leaves`
--

LOCK TABLES `day_leaves` WRITE;
/*!40000 ALTER TABLE `day_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `day_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employees` (
  `emp_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nic` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joined_date` date NOT NULL,
  `nine_month` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `job_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `employees_job_id_foreign` (`job_id`),
  KEY `employees_user_id_foreign` (`user_id`),
  CONSTRAINT `employees_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_roles` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Mr.','Pushpamal','male','911991268','0716342667','pushpamal0012@gmail.com','2019-10-01',0,0,'2019-10-23 08:24:01','2019-10-24 09:28:00',9,1),(2,'Ms','Sewvandi','female','897676765','0714255299','sev@gmail.com','2019-10-01',1,0,'2019-10-23 09:31:11','2019-10-23 09:31:11',8,2);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `head_leave_approves`
--

DROP TABLE IF EXISTS `head_leave_approves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `head_leave_approves` (
  `leave_id` int(11) NOT NULL,
  `leave_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_approve` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  KEY `head_leave_approves_user_id_foreign` (`user_id`),
  CONSTRAINT `head_leave_approves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `head_leave_approves`
--

LOCK TABLES `head_leave_approves` WRITE;
/*!40000 ALTER TABLE `head_leave_approves` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_leave_approves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_roles`
--

DROP TABLE IF EXISTS `job_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_roles` (
  `job_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_title` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_rank` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `user_data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  UNIQUE KEY `job_rank_UNIQUE` (`job_rank`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_roles`
--

LOCK TABLES `job_roles` WRITE;
/*!40000 ALTER TABLE `job_roles` DISABLE KEYS */;
INSERT INTO `job_roles` VALUES (1,'Deputy Chief Secretary (Planning)',1,0,'Admin','2019-06-10 01:49:05','2019-06-10 01:49:05'),(2,'Director (Planning)',2,0,'Admin','2019-06-10 07:21:13','2019-06-10 07:21:13'),(3,'Assistant Director',3,0,'Admin','2019-06-12 10:14:36','2019-06-12 10:14:36'),(4,'Statistician',4,0,'Admin','2019-06-13 05:57:50','2019-06-13 05:57:50'),(5,'Chief Management Assistant',5,0,'Admin','2019-06-18 03:55:23','2019-06-18 03:55:23'),(6,'Statistical Officer',6,0,'Admin','2019-06-18 03:55:54','2019-06-18 03:55:54'),(7,'Draftsman',7,0,'Admin','2019-06-18 03:56:22','2019-06-18 03:56:22'),(8,'Development Officer',8,0,'Admin','2019-06-18 03:56:43','2019-06-18 03:56:43'),(9,'ICT Assistant',9,0,'Admin','2019-06-18 03:57:05','2019-06-18 03:57:05'),(10,'Management Assistant',10,0,'Admin','2019-06-18 03:57:23','2019-06-18 03:57:23'),(11,'Office Assistant',11,0,'Admin','2019-06-18 03:57:35','2019-06-18 03:57:35'),(12,'Driver',12,0,'Admin','2019-06-18 03:57:42','2019-06-18 03:57:42');
/*!40000 ALTER TABLE `job_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_06_07_053036_create_job__roles_table',2),(15,'2016_06_01_000001_create_oauth_auth_codes_table',7),(16,'2016_06_01_000002_create_oauth_access_tokens_table',7),(17,'2016_06_01_000003_create_oauth_refresh_tokens_table',7),(18,'2016_06_01_000004_create_oauth_clients_table',7),(19,'2016_06_01_000005_create_oauth_personal_access_clients_table',7),(24,'2019_06_07_060754_create_employees_table',8),(25,'2019_06_07_062549_create_day__leaves_table',8),(26,'2019_06_07_091657_create_short__leaves_table',8),(27,'2019_06_07_095523_create_official__leaves_table',8),(28,'2019_06_07_064718_create_day__leave__approves_table',9),(29,'2019_06_12_121142_create_approval__actings_table',9),(30,'2019_06_12_121658_create_approval__supervises_table',9),(31,'2019_10_23_092819_create_roles_table',10);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('0cdbbc91bdc89a7352af2e3541d35807bd67789ce86bfdaffc187e8bd9c17bacc375ef30e7d31c40',1,2,NULL,'[\"show\"]',0,'2019-10-23 10:10:46','2019-10-23 10:10:46','2020-10-23 15:40:46'),('6926b53505036d07afdf5e4b93a07d2704097d0e8e0e51a2b1cd72c4205c895c1d3f7d0c8bb951d6',1,2,NULL,'[\"show\"]',0,'2019-10-23 09:29:03','2019-10-23 09:29:03','2020-10-23 14:59:03'),('6af85c57e6fb5bd46704d7251a2567b793af0668e2f60ea5cc49aa38c4915f264d132a8592ed6893',2,2,NULL,'[\"report\",\"create\",\"edit\",\"delete\",\"show\",\"view\"]',0,'2019-10-24 08:58:33','2019-10-24 08:58:33','2020-10-24 14:28:33'),('7199256c0a09d9c5741db546486cfd97378ed93f5d0ec10b45edc10901641eef6bd03406cd7ae077',1,2,NULL,'[\"show\"]',0,'2019-10-23 10:12:06','2019-10-23 10:12:06','2020-10-23 15:42:06'),('8b57f0c05552f565f1497db8a7ca497b845041a92b1e5de9fb5290c61d645431ef17fae44b54d348',2,2,NULL,'[\"report\",\"create\",\"edit\",\"delete\",\"show\",\"view\"]',0,'2019-10-24 02:58:15','2019-10-24 02:58:15','2020-10-24 08:28:15'),('b750e5c15d80d22a591ede1e3292d06742d7ead86cb7dac484b6706b76db1b453c922c635d3fff5b',2,2,NULL,'[\"report\",\"create\",\"edit\",\"delete\",\"show\",\"view\"]',0,'2019-10-23 09:34:34','2019-10-23 09:34:34','2020-10-23 15:04:34'),('cf2f863ab196d9b9cdfbb72c401d498152a0ef2869159206945cb48d477b2feb037e633351d3a88a',2,2,NULL,'[\"report\"]',0,'2019-10-23 09:31:38','2019-10-23 09:31:38','2020-10-23 15:01:38'),('e277fac70e88eeec118a61073e8b5d71b94fb905147f1e35bad86277f6878d4186025251ae896bcf',2,2,NULL,'[\"report\",\"create\",\"edit\",\"delete\",\"show\",\"view\"]',0,'2019-10-23 10:09:24','2019-10-23 10:09:24','2020-10-23 15:39:24'),('f588df6984d38affb62d192f6f77b7444e74bfdb06a59a5c4714fca74bad1ae7b28de58420e468f9',2,2,NULL,'[\"report\",\"create\",\"edit\",\"delete\",\"show\",\"view\"]',0,'2019-10-23 09:32:25','2019-10-23 09:32:25','2020-10-23 15:02:25');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','XudgCDQTrGll1z5NQiUGeArXNqPAFYDhjEEpttUF','http://localhost',1,0,0,'2019-07-12 09:18:30','2019-07-12 09:18:30'),(2,NULL,'Laravel Password Grant Client','0T5mVqn15v5hbW52XG5GeWh4G6CltWFyxbhc60Ge','http://localhost',0,1,0,'2019-07-12 09:18:31','2019-07-12 09:18:31'),(3,NULL,'Laravel Personal Access Client','SvF2NUBOPIqL0uEqIxFATMdhq0HRt3J63dN2i281','http://localhost',1,0,0,'2019-07-22 06:37:59','2019-07-22 06:37:59'),(4,NULL,'Laravel Password Grant Client','H7RCMwWEV2BBjJP98ag86qQv1a1ZgJnoHCc28LQV','http://localhost',0,1,0,'2019-07-22 06:37:59','2019-07-22 06:37:59');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2019-07-12 09:18:30','2019-07-12 09:18:30'),(2,3,'2019-07-22 06:37:59','2019-07-22 06:37:59');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES ('0071b2c32f1c918eda8d8c7de9c3cd29e7bd5b1a6b33accb65716c26bc150c6f0d2d4b311195a189','0cdbbc91bdc89a7352af2e3541d35807bd67789ce86bfdaffc187e8bd9c17bacc375ef30e7d31c40',0,'2020-10-23 15:40:46'),('2b5fbbced9b37c1e50d4e7db3162ab4ece1002bdff5983527231055a304af38ea379b4ea60f51507','cf2f863ab196d9b9cdfbb72c401d498152a0ef2869159206945cb48d477b2feb037e633351d3a88a',0,'2020-10-23 15:01:38'),('2badaa20fd92995ab69b7f722b7f27f4d7d703e90678338f5eb42502bf00f7ef555a25935648c796','b750e5c15d80d22a591ede1e3292d06742d7ead86cb7dac484b6706b76db1b453c922c635d3fff5b',0,'2020-10-23 15:04:34'),('5b51fdc5f653e75f8b00eaf1f250bdb081225cc0ee1ae888237e5b9aaa3397a9af6cc2bccd48eaa1','8b57f0c05552f565f1497db8a7ca497b845041a92b1e5de9fb5290c61d645431ef17fae44b54d348',0,'2020-10-24 08:28:16'),('85f07cdb0673fca2d72208092583e5b9227742bc1e8cff83b346c14a5967f281994930d63ba33ebc','6af85c57e6fb5bd46704d7251a2567b793af0668e2f60ea5cc49aa38c4915f264d132a8592ed6893',0,'2020-10-24 14:28:33'),('af994d2d653efc8709e4b65dae78186920ab44464ff88fcc0d403df36bcbd905c003494f93a34705','e277fac70e88eeec118a61073e8b5d71b94fb905147f1e35bad86277f6878d4186025251ae896bcf',0,'2020-10-23 15:39:24'),('bb3103d6bbe02af02dc511b7c83d3f023b063125666eaf92eab1b91a93d060113ee694f1c86fe006','f588df6984d38affb62d192f6f77b7444e74bfdb06a59a5c4714fca74bad1ae7b28de58420e468f9',0,'2020-10-23 15:02:25'),('eff0474a4f5de4899d71d46431288286db145e0a49f8e18ef8e5e4278e5e1ae043613a820bf25a7c','7199256c0a09d9c5741db546486cfd97378ed93f5d0ec10b45edc10901641eef6bd03406cd7ae077',0,'2020-10-23 15:42:06'),('f7764aae3524a35078a3792a3071c727fa0e0af16091e095c77f2753b912f36ce2eef48c781aa5a6','6926b53505036d07afdf5e4b93a07d2704097d0e8e0e51a2b1cd72c4205c895c1d3f7d0c8bb951d6',0,'2020-10-23 14:59:03');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `official_leaves`
--

DROP TABLE IF EXISTS `official_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `official_leaves` (
  `ol_leave_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_date` date NOT NULL,
  `leave_desc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dates` date NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`ol_leave_id`),
  KEY `official_leaves_user_id_foreign` (`user_id`),
  CONSTRAINT `official_leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `official_leaves`
--

LOCK TABLES `official_leaves` WRITE;
/*!40000 ALTER TABLE `official_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `official_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `role_id` bigint(5) unsigned NOT NULL,
  `role_name` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'developer'),(2,'admin'),(3,'super_user'),(4,'user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `short_leaves`
--

DROP TABLE IF EXISTS `short_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `short_leaves` (
  `sl_leave_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_date` date NOT NULL,
  `leave_desc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`sl_leave_id`),
  KEY `short_leaves_user_id_foreign` (`user_id`),
  CONSTRAINT `short_leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `short_leaves`
--

LOCK TABLES `short_leaves` WRITE;
/*!40000 ALTER TABLE `short_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `short_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `for_idx` (`role_id`),
  CONSTRAINT `for` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Pushpamal','pushpamal0012@gmail.com',NULL,'$2y$10$imkxtTnc9H5AXTH2H8U9ze9Xxy153QK3n3g7f2Bafp/IkfWiEfsLi',NULL,'2019-10-23 08:23:21','2019-10-23 08:23:21',4),(2,'sewwandi','sev@gmail.com',NULL,'$2y$10$MSyosJgmslNCp9ROf4nwr.e5155vIIBAQL3DOH1Y9Pb3fKELjWlGa',NULL,'2019-10-23 09:30:36','2019-10-23 09:30:36',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-24 15:36:01
