-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: prakumup.mysql.pythonanywhere-services.com    Database: prakumup$nakshatra
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add students',1,'add_students'),(2,'Can change students',1,'change_students'),(3,'Can delete students',1,'delete_students'),(4,'Can view students',1,'view_students'),(5,'Can add registration photo',2,'add_registrationphoto'),(6,'Can change registration photo',2,'change_registrationphoto'),(7,'Can delete registration photo',2,'delete_registrationphoto'),(8,'Can view registration photo',2,'view_registrationphoto'),(9,'Can add college',3,'add_college'),(10,'Can change college',3,'change_college'),(11,'Can delete college',3,'delete_college'),(12,'Can view college',3,'view_college'),(13,'Can add user college',4,'add_usercollege'),(14,'Can change user college',4,'change_usercollege'),(15,'Can delete user college',4,'delete_usercollege'),(16,'Can view user college',4,'view_usercollege'),(17,'Can add shirt',5,'add_shirt'),(18,'Can change shirt',5,'change_shirt'),(19,'Can delete shirt',5,'delete_shirt'),(20,'Can view shirt',5,'view_shirt'),(21,'Can add log entry',6,'add_logentry'),(22,'Can change log entry',6,'change_logentry'),(23,'Can delete log entry',6,'delete_logentry'),(24,'Can view log entry',6,'view_logentry'),(25,'Can add group',7,'add_group'),(26,'Can change group',7,'change_group'),(27,'Can delete group',7,'delete_group'),(28,'Can view group',7,'view_group'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add permission',9,'add_permission'),(34,'Can change permission',9,'change_permission'),(35,'Can delete permission',9,'delete_permission'),(36,'Can view permission',9,'view_permission'),(37,'Can add content type',10,'add_contenttype'),(38,'Can change content type',10,'change_contenttype'),(39,'Can delete content type',10,'delete_contenttype'),(40,'Can view content type',10,'view_contenttype'),(41,'Can add session',11,'add_session'),(42,'Can change session',11,'change_session'),(43,'Can delete session',11,'delete_session'),(44,'Can view session',11,'view_session');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$6uOzsOPK6ldj$DbEwYbj7fjrIeYYMc5KSfbkNxfOtU9NPicXvW3iDvmk=','2018-12-25 13:58:35.673571',1,'admin','','','prakum.633@gmail.com',1,1,'2018-12-22 16:43:38.016708'),(2,'pbkdf2_sha256$120000$7zBBVqadPoyy$vFSMn4tpdYEnql0VMJ1ywOaKNfzIfhJ4Od4SwG5VV3U=',NULL,1,'nakshatra','','','prakum.633@gmail.com',1,1,'2018-12-22 16:46:44.718997'),(5,'pbkdf2_sha256$120000$I9xfTHUgaUGi$1U/LL+eaAoWNzhYDoIKcfM17UzTlHbXdLSKlsunAhI4=',NULL,0,'rahul','','','pra@gmaill.com',0,1,'2018-12-22 20:29:23.824030'),(6,'pbkdf2_sha256$120000$u1mlTudXnGXs$P2j2Ewxdc36Sb88zcSjEzwz0WqyrhON9ryZoxJV6Kp8=','2018-12-23 11:45:57.923734',0,'Praveen','','','prakum633@gmail.com',0,1,'2018-12-23 11:45:46.515377'),(7,'pbkdf2_sha256$120000$acSkyYf3UPWd$oaF2+1Q7QzYm3ligWqDkVMKoQj3W7j7b4Z5x7+HjTfg=','2018-12-23 12:44:51.275255',0,'manoj','','','manoj.biswas68@gmail.com',0,1,'2018-12-23 12:44:14.609544'),(10,'pbkdf2_sha256$120000$b0eGvsSDX2YI$Orbg11K3/wy/YAklwbmY6d+nKaLjbnfjuwqGfFBbtJk=',NULL,0,'Robin','','','robinfuncy@gmail.com',0,1,'2018-12-24 09:28:28.596976');
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
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-12-22 18:18:03.932939','3','\"Administrative Management College',3,'',3,1),(2,'2018-12-22 18:18:03.939483','5','\"AMC Engineering College',3,'',3,1),(3,'2018-12-22 18:18:03.946908','6','\"Amity University',3,'',3,1),(4,'2018-12-22 18:18:03.953011','7','\"Amrita Vishwa Vidyapeetham Kochi Campus',3,'',3,1),(5,'2018-12-22 18:18:03.959272','8','\"Anna University',3,'',3,1),(6,'2018-12-22 18:18:03.966131','11','\"AWH Engineering College',3,'',3,1),(7,'2018-12-22 18:18:03.973209','14','\"BANGALORE INSTITUTE OF TECHNOLOGY - [BIT]',3,'',3,1),(8,'2018-12-22 18:18:03.979287','15','\"Bangalore University Jnanbharathi Campus',3,'',3,1),(9,'2018-12-22 18:18:03.985178','16','\"bapuji institute of engineering & technology',3,'',3,1),(10,'2018-12-22 18:18:03.991327','21','\"BMS College Of Engineering',3,'',3,1),(11,'2018-12-22 18:18:03.997634','24','\"Cambridge Institute Of Technology',3,'',3,1),(12,'2018-12-22 18:18:04.004121','26','\"Chinmaya Institute of Technology',3,'',3,1),(13,'2018-12-22 18:18:04.010614','27','\"Christ University',3,'',3,1),(14,'2018-12-22 18:18:04.017244','28','\"CMR Institute Of Management Studies',3,'',3,1),(15,'2018-12-22 18:18:04.023715','30','\"College Of Applied Science IHRD',3,'',3,1),(16,'2018-12-22 18:18:04.029624','31','\"College of Engineering',3,'',3,1),(17,'2018-12-22 18:18:04.035935','32','\"Dayananda Sagar College of Engineering (DSCE)',3,'',3,1),(18,'2018-12-22 18:18:04.042145','33','\"Dr Ambedkar Institute of Technology',3,'',3,1),(19,'2018-12-22 18:18:04.048320','36','\"Gandhigram Rural College',3,'',3,1),(20,'2018-12-22 18:18:04.054498','39','\"Government College of Engineering',3,'',3,1),(21,'2018-12-22 18:18:04.060555','42','\"International Institute of Professional Studies',3,'',3,1),(22,'2018-12-22 18:18:04.066529','45','\"Jain University',3,'',3,1),(23,'2018-12-22 18:18:04.073040','47','\"jawaharlal nehru national college of engineering',3,'',3,1),(24,'2018-12-22 18:18:04.079084','49','\"Jawaharlal Nehru Technological University',3,'',3,1),(25,'2018-12-22 18:18:04.084955','48','\"Jawaharlal Nehru Technological University',3,'',3,1),(26,'2018-12-22 18:18:04.090863','53','\"JYOTI NIVAS COLLEGE (AUTONOMOUS) - [JNC]',3,'',3,1),(27,'2018-12-22 18:18:04.096845','58','\"Karpagam University',3,'',3,1),(28,'2018-12-22 18:18:04.102913','63','\"KLS Gogte Institute of Technology',3,'',3,1),(29,'2018-12-22 18:18:04.108908','65','\"KRISTU JAYANTI COLLEGE',3,'',3,1),(30,'2018-12-22 18:18:04.115104','70','\"M. S. RAMAIAH INSTITUTE OF TECHNOLOGY - [MSRIT]',3,'',3,1),(31,'2018-12-22 18:18:04.122990','76','\"malnad college of engineering',3,'',3,1),(32,'2018-12-22 18:18:04.131284','77','\"MAM College of Engineering',3,'',3,1),(33,'2018-12-22 18:18:04.138005','80','\"Mar Athanasius College of Engineering',3,'',3,1),(34,'2018-12-22 18:18:04.148180','82','\"MES College of Engineering',3,'',3,1),(35,'2018-12-22 18:18:04.156315','90','\"National Institute of Technology',3,'',3,1),(36,'2018-12-22 18:18:04.163096','89','\"National Institute of Technology',3,'',3,1),(37,'2018-12-22 18:18:04.170585','88','\"National Institute of Technology',3,'',3,1),(38,'2018-12-22 18:18:04.177385','87','\"National Institute of Technology',3,'',3,1),(39,'2018-12-22 18:18:04.184302','86','\"National Institute of Technology Karnataka',3,'',3,1),(40,'2018-12-22 18:18:04.191525','96','\"Nitte Mahalinga Adyanthaya Memorial Institute of Technology',3,'',3,1),(41,'2018-12-22 18:18:04.198266','98','\"Oxford College of Science',3,'',3,1),(42,'2018-12-22 18:18:04.204975','102','\"PES INSTITUTE OF TECHNOLOGY - [PESIT]',3,'',3,1),(43,'2018-12-22 18:18:04.211954','108','\"Presidency College',3,'',3,1),(44,'2018-12-22 18:18:04.229144','110','\"Priyadarshini Engineering College',3,'',3,1),(45,'2018-12-22 18:18:04.237327','112','\"PSG College of Arts and Science',3,'',3,1),(46,'2018-12-22 18:18:04.244088','113','\"PSG College of Technology',3,'',3,1),(47,'2018-12-22 18:18:04.252405','118','\"Rajiv Gandhi Institute of Technology',3,'',3,1),(48,'2018-12-22 18:18:04.258562','119','\"Rashtreeya Vidyalaya College of Engineering',3,'',3,1),(49,'2018-12-22 18:18:04.264562','122','\"Sambhram Institute of Technology',3,'',3,1),(50,'2018-12-22 18:18:04.270584','123','\"Santhigiri College',3,'',3,1),(51,'2018-12-22 18:18:04.276911','126','\"School of Computer Science',3,'',3,1),(52,'2018-12-22 18:18:04.282848','128','\"Shanmugha Arts - Science - Technology & Research Academy(SASTRA)',3,'',3,1),(53,'2018-12-22 18:18:04.289056','130','\"Siddaganga Institute of Technology',3,'',3,1),(54,'2018-12-22 18:18:04.295564','132','\"Sona College',3,'',3,1),(55,'2018-12-22 18:18:04.305654','133','\"Sree Narayana Gurukulam College of Engineering - [SNGCE] Kadayiruppu',3,'',3,1),(56,'2018-12-22 18:18:04.312009','134','\"Sree Narayana Institute of Technology',3,'',3,1),(57,'2018-12-22 18:18:04.319651','146','\"Thangal Kunju Musaliar College of Engineering',3,'',3,1),(58,'2018-12-22 18:18:04.327364','148','\"The National Institute of Engineering',3,'',3,1),(59,'2018-12-22 18:18:04.333986','1','Adhiyamaan College of Engineering\r',3,'',3,1),(60,'2018-12-22 18:18:04.341412','2','Aditya Engineering College\r',3,'',3,1),(61,'2018-12-22 18:18:04.347880','4','Alagappa Chettiar College of Engineering and Technology\r',3,'',3,1),(62,'2018-12-22 18:18:04.354831','9','Annamalai university\r',3,'',3,1),(63,'2018-12-22 18:18:04.361039','10','Annasaheb Chudaman Patil College of Engineering\r',3,'',3,1),(64,'2018-12-22 18:18:04.367018','12','B. S. Abdur Rahman University\r',3,'',3,1),(65,'2018-12-22 18:18:04.373207','13','B.P.H.E. Societys Institute of Management Studies Career Dev & Research\r',3,'',3,1),(66,'2018-12-22 18:18:04.379827','17','Bharathiar University\r',3,'',3,1),(67,'2018-12-22 18:18:04.385713','18','Bharathidasan University\r',3,'',3,1),(68,'2018-12-22 18:18:04.391624','19','Bharatratna Indira Gandhi College of Engineering\r',3,'',3,1),(69,'2018-12-22 18:18:04.397609','20','Bhoomaraddi College of Engineering and Technology\r',3,'',3,1),(70,'2018-12-22 18:18:04.403497','22','Bullayya College Grounds\r',3,'',3,1),(71,'2018-12-22 18:18:04.409306','23','Calicut University\r',3,'',3,1),(72,'2018-12-22 18:18:04.415376','25','Chadalawada Ramanamma Engineering College\r',3,'',3,1),(73,'2018-12-22 18:18:04.421208','29','Cochin University College of Engineering Kuttanad\r',3,'',3,1),(74,'2018-12-22 18:18:04.427254','34','DY Patil Institute of Engineering & Technology\r',3,'',3,1),(75,'2018-12-22 18:18:04.433214','35','Ehiraj College For Women\r',3,'',3,1),(76,'2018-12-22 18:18:04.439918','37','Government College of Engineering Aurangabad\r',3,'',3,1),(77,'2018-12-22 18:18:04.446883','38','Government College of Engineering Karad\r',3,'',3,1),(78,'2018-12-22 18:18:04.453441','40','Hindusthan College Of Engineering And Technology\r',3,'',3,1),(79,'2018-12-22 18:18:04.459662','41','Indira Group of Institutes\r',3,'',3,1),(80,'2018-12-22 18:18:04.466099','43','J. J. College of Engineering and Technology\r',3,'',3,1),(81,'2018-12-22 18:18:04.472383','44','Jai Bhavani Shikshan Prasarak Mandals Apex Institute of Computer & Management Studies\r',3,'',3,1),(82,'2018-12-22 18:18:04.478271','46','Jawaharlal Nehru Engineering College\r',3,'',3,1),(83,'2018-12-22 18:18:04.484490','50','Jaya Engineering College\r',3,'',3,1),(84,'2018-12-22 18:18:04.490807','51','Jayawant Institute of Management Studies\r',3,'',3,1),(85,'2018-12-22 18:18:04.497488','52','Jerusalem College of Engineering\r',3,'',3,1),(86,'2018-12-22 18:18:04.503882','54','K K Wagh Institute of Engineering Education & Research\r',3,'',3,1),(87,'2018-12-22 18:18:04.510568','55','K. L. N. College of Engineering\r',3,'',3,1),(88,'2018-12-22 18:18:04.517108','56','K. S. Rangasamy College of Technology\r',3,'',3,1),(89,'2018-12-22 18:18:04.523654','57','Kalyani MCA College\r',3,'',3,1),(90,'2018-12-22 18:18:04.530235','59','Kavikulguru Institute of Technology & Science\r',3,'',3,1),(91,'2018-12-22 18:18:04.536507','60','KCE Societys Institute of Management & Research\r',3,'',3,1),(92,'2018-12-22 18:18:04.543944','61','KITs Institute of Management Education & Research\r',3,'',3,1),(93,'2018-12-22 18:18:04.550569','62','KJ Somaiya Institute of Management Studies and Research\r',3,'',3,1),(94,'2018-12-22 18:18:04.557276','64','Kongu Engineering College\r',3,'',3,1),(95,'2018-12-22 18:18:04.563867','66','Kumaraguru College of Technology\r',3,'',3,1),(96,'2018-12-22 18:18:04.570369','67','Late Pandharinath Patil Institute of Management Studies & Information Technology\r',3,'',3,1),(97,'2018-12-22 18:18:04.576646','68','Lokmanya Tilak College of Engineering\r',3,'',3,1),(98,'2018-12-22 18:18:04.582965','69','Loyola College\r',3,'',3,1),(99,'2018-12-22 18:18:04.588959','71','Madras Christian College\r',3,'',3,1),(100,'2018-12-22 18:18:04.594844','72','Madurai Kamaraj University\r',3,'',3,1),(101,'2018-12-22 18:18:04.601118','73','Maharashtra Academy of Engineering\r',3,'',3,1),(102,'2018-12-22 18:18:04.607461','74','Mahatma Gandhi Missions Institute of Management Aurangabad\r',3,'',3,1),(103,'2018-12-22 18:18:04.613426','75','Mahatma Phule Institute Of Management and Computer Studies\r',3,'',3,1),(104,'2018-12-22 18:18:04.619754','78','MANIPAL INSTITUTE OF TECHNOLOGY\r',3,'',3,1),(105,'2018-12-22 18:18:04.626163','79','MANIT BHOPAL\r',3,'',3,1),(106,'2018-12-22 18:18:04.632791','81','Maratha Shikshan Sansthas Institute of Management Studies & Information Technology\r',3,'',3,1),(107,'2018-12-22 18:18:04.638835','83','MET Institute of Engineering\r',3,'',3,1),(108,'2018-12-22 18:18:04.644873','84','MNNIT ALLAHBAD\r',3,'',3,1),(109,'2018-12-22 18:18:04.651316','85','Mukesh Patel School of Technology Management & Engineering\r',3,'',3,1),(110,'2018-12-22 18:18:04.657806','91','NCRDs Sterling Institute of Management Studies\r',3,'',3,1),(111,'2018-12-22 18:18:04.664174','92','NIT AGARTALA\r',3,'',3,1),(112,'2018-12-22 18:18:04.670654','93','NIT DURGAPUR\r',3,'',3,1),(113,'2018-12-22 18:18:04.676749','94','NIT RAIPUR\r',3,'',3,1),(114,'2018-12-22 18:18:04.682743','95','NIT Tiruchirapalli\r',3,'',3,1),(115,'2018-12-22 18:18:04.688873','158','NSS College Of Engineering Palakkad\r',3,'',3,1),(116,'2018-12-22 18:18:04.695054','97','NYSS Institute of Management & Research\r',3,'',3,1),(117,'2018-12-22 18:18:04.701117','99','Panimalar Engineering College\r',3,'',3,1),(118,'2018-12-22 18:18:04.707113','100','PE Societys Institute of Management & Career Development\r',3,'',3,1),(119,'2018-12-22 18:18:04.713111','101','Periyar University\r',3,'',3,1),(120,'2018-12-22 18:18:04.720658','103','PES Modern College of Engineering\r',3,'',3,1),(121,'2018-12-22 18:18:04.726810','104','Pimpri Chinchwad College of Engineering\r',3,'',3,1),(122,'2018-12-22 18:18:04.733210','105','PONDICHERRY UNIVERSITY(KARAIKAL CAMPUS)\r',3,'',3,1),(123,'2018-12-22 18:18:04.739563','106','PONDICHERRY UNIVERSITY(MAIN CAMPUS)\r',3,'',3,1),(124,'2018-12-22 18:18:04.745984','107','PRASAD V POTLURI SIDDHARTHA INSTITUTE OF TECHNOLOGY\r',3,'',3,1),(125,'2018-12-22 18:18:04.753804','109','Priyadarshini College of Engineering\r',3,'',3,1),(126,'2018-12-22 18:18:04.760139','111','Priyadarshini Institute of Engineering and Technology\r',3,'',3,1),(127,'2018-12-22 18:18:04.766338','114','QIS College of Engineering and Technology\r',3,'',3,1),(128,'2018-12-22 18:18:04.772523','115','Rajalakshmi Engineering College\r',3,'',3,1),(129,'2018-12-22 18:18:04.779641','116','Rajarshi Shahu Institute of Management\r',3,'',3,1),(130,'2018-12-22 18:18:04.786025','117','Rajeev Gandhi Memorial college of Engineering and Technology\r',3,'',3,1),(131,'2018-12-22 18:18:04.792480','120','RC Patel Institute of Management\r',3,'',3,1),(132,'2018-12-22 18:18:04.798928','121','RVR & JC College of Engineering\r',3,'',3,1),(133,'2018-12-22 18:18:04.804760','124','Sathyabama Institute of Science and Technology\r',3,'',3,1),(134,'2018-12-22 18:18:04.810657','125','Saveetha Engineering College\r',3,'',3,1),(135,'2018-12-22 18:18:04.816955','127','SCMS School of Engineering and Technology\r',3,'',3,1),(136,'2018-12-22 18:18:04.823183','129','Shri Ramdeobaba Kamla Nehru Engineering College\r',3,'',3,1),(137,'2018-12-22 18:18:04.829209','131','SIES College of Management Studies\r',3,'',3,1),(138,'2018-12-22 18:18:04.835290','135','Sree Vidyanikethan Engineering College\r',3,'',3,1),(139,'2018-12-22 18:18:04.841117','136','Sri Krishna College of Engineering & Technology\r',3,'',3,1),(140,'2018-12-22 18:18:04.847558','137','Sri Sai Ram Institute of Technology\r',3,'',3,1),(141,'2018-12-22 18:18:04.854896','138','Sri Shakthi Institute of Engineering & Technology\r',3,'',3,1),(142,'2018-12-22 18:18:04.861696','139','Sri Venkateswara College Of Computer Sciences\r',3,'',3,1),(143,'2018-12-22 18:18:04.867878','140','SSN College of Engineering\r',3,'',3,1),(144,'2018-12-22 18:18:04.873777','141','St. Aloysius Institute of Management and info. technology\r',3,'',3,1),(145,'2018-12-22 18:18:04.879692','142','ST. Joseph Engineering College\r',3,'',3,1),(146,'2018-12-22 18:18:04.885646','143','St. Josephs College of Engineering\r',3,'',3,1),(147,'2018-12-22 18:18:04.892504','144','Swarnandhra College of Engineering and Technology\r',3,'',3,1),(148,'2018-12-22 18:18:04.899621','145','Tamil Nadu College of Engineering\r',3,'',3,1),(149,'2018-12-22 18:18:04.906237','147','The L F College of Engineering & Management\r',3,'',3,1),(150,'2018-12-22 18:18:04.912484','149','Thiagarajar School of Management\r',3,'',3,1),(151,'2018-12-22 18:18:04.918758','150','University of Hyderabad(HCU)\r',3,'',3,1),(152,'2018-12-22 18:18:04.925849','151','University of Madras\r',3,'',3,1),(153,'2018-12-22 18:18:04.933603','157','University School of Information and Communication Technology\r',3,'',3,1),(154,'2018-12-22 18:18:04.940316','152','Veermata Jijabai Technological Institute\r',3,'',3,1),(155,'2018-12-22 18:18:04.948491','153','Velagapudi Ramakrishna Siddhartha Engineering College\r',3,'',3,1),(156,'2018-12-22 18:18:04.955263','154','VIT Pune\r',3,'',3,1),(157,'2018-12-22 18:18:04.961169','155','VIT University\r',3,'',3,1),(158,'2018-12-22 18:18:04.967354','156','Vivekanand Education Societys Institute of Technology\r',3,'',3,1),(159,'2018-12-22 20:29:17.976897','4','rahul',3,'',8,1),(160,'2018-12-24 09:28:21.096545','9','Robin',3,'',8,1),(161,'2018-12-24 09:28:21.102879','8','Shivam',3,'',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(7,'auth','group'),(9,'auth','permission'),(8,'auth','user'),(10,'contenttypes','contenttype'),(11,'sessions','session'),(3,'users','college'),(2,'users','registrationphoto'),(5,'users','shirt'),(1,'users','students'),(4,'users','usercollege');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-22 16:37:38.817897'),(2,'auth','0001_initial','2018-12-22 16:37:40.763433'),(3,'admin','0001_initial','2018-12-22 16:37:42.735858'),(4,'admin','0002_logentry_remove_auto_add','2018-12-22 16:37:43.417200'),(5,'admin','0003_logentry_add_action_flag_choices','2018-12-22 16:37:44.117083'),(6,'contenttypes','0002_remove_content_type_name','2018-12-22 16:37:45.718162'),(7,'auth','0002_alter_permission_name_max_length','2018-12-22 16:37:46.153325'),(8,'auth','0003_alter_user_email_max_length','2018-12-22 16:37:46.818004'),(9,'auth','0004_alter_user_username_opts','2018-12-22 16:37:47.817249'),(10,'auth','0005_alter_user_last_login_null','2018-12-22 16:37:48.418866'),(11,'auth','0006_require_contenttypes_0002','2018-12-22 16:37:48.522757'),(12,'auth','0007_alter_validators_add_error_messages','2018-12-22 16:37:49.120300'),(13,'auth','0008_alter_user_username_max_length','2018-12-22 16:37:49.918030'),(14,'auth','0009_alter_user_last_name_max_length','2018-12-22 16:37:50.618216'),(15,'sessions','0001_initial','2018-12-22 16:37:50.933502'),(16,'users','0001_initial','2018-12-22 16:37:52.821689'),(17,'users','0002_auto_20181220_2319','2018-12-22 16:37:56.306287'),(18,'users','0003_auto_20181220_2336','2018-12-22 16:37:58.117013'),(19,'users','0004_shirt','2018-12-22 16:37:58.389745'),(20,'users','0005_auto_20181221_2158','2018-12-22 16:37:58.634409'),(21,'users','0006_auto_20181221_2203','2018-12-22 16:37:58.917135'),(22,'users','0007_auto_20181222_2032','2018-12-22 16:38:01.454578');
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
INSERT INTO `django_session` VALUES ('52scfossq8qtc80fqfasu57ojrb0j74f','ODljZjNlNDVmODk3OWZkYTZjOGNkNGIwZDVmOWNlNGUwNDBiZjU0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWMxODFlM2QyYzkxZGVmMzkzODg0MjhiMDY0ZmQ0ZTRiZDI1NjVmNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-01-08 13:58:35.680485'),('6msfmodw91quz2dbmdgosauepzed3lo0','YjE3MzMzYjZmM2Q4YWQ1Y2EzOWNjOTFmNWY5ODQ2ZjQ2ZWYyMGY3Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFjMTgxZTNkMmM5MWRlZjM5Mzg4NDI4YjA2NGZkNGU0YmQyNTY1ZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-05 17:34:07.511765'),('z0ktsepd5l7uct3rcgaws6bcw9csprrz','ODljZjNlNDVmODk3OWZkYTZjOGNkNGIwZDVmOWNlNGUwNDBiZjU0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWMxODFlM2QyYzkxZGVmMzkzODg0MjhiMDY0ZmQ0ZTRiZDI1NjVmNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-01-08 12:55:50.603498');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_college`
--

DROP TABLE IF EXISTS `users_college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `college_name` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_college`
--

LOCK TABLES `users_college` WRITE;
/*!40000 ALTER TABLE `users_college` DISABLE KEYS */;
INSERT INTO `users_college` VALUES (1,'Adhiyamaan College of Engineering\r'),(2,'Aditya Engineering College\r'),(3,'Administrative Management College'),(4,'Alagappa Chettiar College of Engineering and Technology\r'),(5,'AMC Engineering College'),(6,'Amity University'),(7,'Amrita Vishwa Vidyapeetham Kochi Campus'),(8,'Anna University'),(9,'Annamalai university\r'),(10,'Annasaheb Chudaman Patil College of Engineering\r'),(11,'AWH Engineering College'),(12,'B. S. Abdur Rahman University\r'),(13,'B.P.H.E. Societys Institute of Management Studies Career Dev & Research\r'),(14,'BANGALORE INSTITUTE OF TECHNOLOGY - [BIT]'),(15,'Bangalore University Jnanbharathi Campus'),(16,'bapuji institute of engineering & technology'),(17,'Bharathiar University\r'),(18,'Bharathidasan University\r'),(19,'Bharatratna Indira Gandhi College of Engineering\r'),(20,'Bhoomaraddi College of Engineering and Technology\r'),(21,'BMS College Of Engineering'),(22,'Bullayya College Grounds\r'),(23,'Calicut University\r'),(24,'Cambridge Institute Of Technology'),(25,'Chadalawada Ramanamma Engineering College\r'),(26,'Chinmaya Institute of Technology'),(27,'Christ University'),(28,'CMR Institute Of Management Studies'),(29,'Cochin University College of Engineering Kuttanad\r'),(30,'College Of Applied Science IHRD'),(31,'College of Engineering'),(32,'Dayananda Sagar College of Engineering (DSCE)'),(33,'Dr Ambedkar Institute of Technology'),(34,'DY Patil Institute of Engineering & Technology\r'),(35,'Ehiraj College For Women\r'),(36,'Gandhigram Rural College'),(37,'Government College of Engineering Aurangabad\r'),(38,'Government College of Engineering Karad\r'),(39,'Government College of Engineering'),(40,'Hindusthan College Of Engineering And Technology\r'),(41,'Indira Group of Institutes\r'),(42,'International Institute of Professional Studies'),(43,'J. J. College of Engineering and Technology\r'),(44,'Jai Bhavani Shikshan Prasarak Mandals Apex Institute of Computer & Management Studies\r'),(45,'Jain University'),(46,'Jawaharlal Nehru Engineering College\r'),(47,'jawaharlal nehru national college of engineering'),(48,'Jawaharlal Nehru Technological University'),(49,'Jawaharlal Nehru Technological University'),(50,'Jaya Engineering College\r'),(51,'Jayawant Institute of Management Studies\r'),(52,'Jerusalem College of Engineering\r'),(53,'JYOTI NIVAS COLLEGE (AUTONOMOUS) - [JNC]'),(54,'K K Wagh Institute of Engineering Education & Research\r'),(55,'K. L. N. College of Engineering\r'),(56,'K. S. Rangasamy College of Technology\r'),(57,'Kalyani MCA College\r'),(58,'Karpagam University'),(59,'Kavikulguru Institute of Technology & Science\r'),(60,'KCE Societys Institute of Management & Research\r'),(61,'KITs Institute of Management Education & Research\r'),(62,'KJ Somaiya Institute of Management Studies and Research\r'),(63,'KLS Gogte Institute of Technology'),(64,'Kongu Engineering College\r'),(65,'KRISTU JAYANTI COLLEGE'),(66,'Kumaraguru College of Technology\r'),(67,'Late Pandharinath Patil Institute of Management Studies & Information Technology\r'),(68,'Lokmanya Tilak College of Engineering\r'),(69,'Loyola College\r'),(70,'M. S. RAMAIAH INSTITUTE OF TECHNOLOGY - [MSRIT]'),(71,'Madras Christian College\r'),(72,'Madurai Kamaraj University\r'),(73,'Maharashtra Academy of Engineering\r'),(74,'Mahatma Gandhi Missions Institute of Management Aurangabad\r'),(75,'Mahatma Phule Institute Of Management and Computer Studies\r'),(76,'malnad college of engineering'),(77,'MAM College of Engineering'),(78,'MANIPAL INSTITUTE OF TECHNOLOGY\r'),(79,'MANIT BHOPAL\r'),(80,'Mar Athanasius College of Engineering'),(81,'Maratha Shikshan Sansthas Institute of Management Studies & Information Technology\r'),(82,'MES College of Engineering'),(83,'MET Institute of Engineering\r'),(84,'MNNIT ALLAHBAD\r'),(85,'Mukesh Patel School of Technology Management & Engineering\r'),(86,'National Institute of Technology Karnataka'),(87,'National Institute of Technology'),(88,'National Institute of Technology'),(89,'National Institute of Technology'),(90,'National Institute of Technology'),(91,'NCRDs Sterling Institute of Management Studies\r'),(92,'NIT AGARTALA\r'),(93,'NIT DURGAPUR\r'),(94,'NIT RAIPUR\r'),(95,'NIT Tiruchirapalli\r'),(96,'Nitte Mahalinga Adyanthaya Memorial Institute of Technology'),(97,'NYSS Institute of Management & Research\r'),(98,'Oxford College of Science'),(99,'Panimalar Engineering College\r'),(100,'PE Societys Institute of Management & Career Development\r'),(101,'Periyar University\r'),(102,'PES INSTITUTE OF TECHNOLOGY - [PESIT]'),(103,'PES Modern College of Engineering\r'),(104,'Pimpri Chinchwad College of Engineering\r'),(105,'PONDICHERRY UNIVERSITY(KARAIKAL CAMPUS)\r'),(106,'PONDICHERRY UNIVERSITY(MAIN CAMPUS)\r'),(107,'PRASAD V POTLURI SIDDHARTHA INSTITUTE OF TECHNOLOGY\r'),(108,'Presidency College'),(109,'Priyadarshini College of Engineering\r'),(110,'Priyadarshini Engineering College'),(111,'Priyadarshini Institute of Engineering and Technology\r'),(112,'PSG College of Arts and Science'),(113,'PSG College of Technology'),(114,'QIS College of Engineering and Technology\r'),(115,'Rajalakshmi Engineering College\r'),(116,'Rajarshi Shahu Institute of Management\r'),(117,'Rajeev Gandhi Memorial college of Engineering and Technology\r'),(118,'Rajiv Gandhi Institute of Technology'),(119,'Rashtreeya Vidyalaya College of Engineering'),(120,'RC Patel Institute of Management\r'),(121,'RVR & JC College of Engineering\r'),(122,'Sambhram Institute of Technology'),(123,'Santhigiri College'),(124,'Sathyabama Institute of Science and Technology\r'),(125,'Saveetha Engineering College\r'),(126,'School of Computer Science'),(127,'SCMS School of Engineering and Technology\r'),(128,'Shanmugha Arts - Science - Technology & Research Academy(SASTRA)'),(129,'Shri Ramdeobaba Kamla Nehru Engineering College\r'),(130,'Siddaganga Institute of Technology'),(131,'SIES College of Management Studies\r'),(132,'Sona College'),(133,'Sree Narayana Gurukulam College of Engineering - [SNGCE] Kadayiruppu'),(134,'Sree Narayana Institute of Technology'),(135,'Sree Vidyanikethan Engineering College\r'),(136,'Sri Krishna College of Engineering & Technology\r'),(137,'Sri Sai Ram Institute of Technology\r'),(138,'Sri Shakthi Institute of Engineering & Technology\r'),(139,'Sri Venkateswara College Of Computer Sciences\r'),(140,'SSN College of Engineering\r'),(141,'St. Aloysius Institute of Management and info. technology\r'),(142,'ST. Joseph Engineering College\r'),(143,'St. Josephs College of Engineering\r'),(144,'Swarnandhra College of Engineering and Technology\r'),(145,'Tamil Nadu College of Engineering\r'),(146,'Thangal Kunju Musaliar College of Engineering'),(147,'The L F College of Engineering & Management\r'),(148,'The National Institute of Engineering'),(149,'Thiagarajar School of Management\r'),(150,'University of Hyderabad(HCU)\r'),(151,'University of Madras\r'),(152,'Veermata Jijabai Technological Institute\r'),(153,'Velagapudi Ramakrishna Siddhartha Engineering College\r'),(154,'VIT Pune\r'),(155,'VIT University\r'),(156,'Vivekanand Education Societys Institute of Technology\r'),(157,'University School of Information and Communication Technology\r'),(158,'NSS College Of Engineering Palakkad\r');
/*!40000 ALTER TABLE `users_college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_registrationphoto`
--

DROP TABLE IF EXISTS `users_registrationphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_registrationphoto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(100) NOT NULL,
  `contact` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `desc` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_registrationphoto_user_id_cc965683_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_registrationphoto`
--

LOCK TABLES `users_registrationphoto` WRITE;
/*!40000 ALTER TABLE `users_registrationphoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_registrationphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_shirt`
--

DROP TABLE IF EXISTS `users_shirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_shirt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roll_no` varchar(10) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `shirt_size` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_shirt_roll_no_c9790362_uniq` (`roll_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_shirt`
--

LOCK TABLES `users_shirt` WRITE;
/*!40000 ALTER TABLE `users_shirt` DISABLE KEYS */;
INSERT INTO `users_shirt` VALUES (1,'M170569CA','Pra','xl'),(2,'M180569CA','Pra','xl');
/*!40000 ALTER TABLE `users_shirt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_students`
--

DROP TABLE IF EXISTS `users_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_name` varchar(100) DEFAULT NULL,
  `college_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_students_college_id_b4ee780f_fk_users_usercollege_id` (`college_id`),
  CONSTRAINT `users_students_college_id_b4ee780f_fk_users_usercollege_id` FOREIGN KEY (`college_id`) REFERENCES `users_usercollege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_students`
--

LOCK TABLES `users_students` WRITE;
/*!40000 ALTER TABLE `users_students` DISABLE KEYS */;
INSERT INTO `users_students` VALUES (6,'sad',2),(7,'dsa',2),(8,'dsa',2),(9,'dsad',2),(10,'sda',2),(11,'F',3),(12,'Gu',3),(13,'Gg',3),(14,'Gg',3),(15,'Gh',3),(16,'asd',4),(17,'dsf',4),(18,'fdsf',4),(19,'dsf',4),(20,'fs',4),(31,'Dvdv',7),(32,'hrbr',7),(33,'Brbfh',7),(34,'Bddb',7),(35,'dhdh',7);
/*!40000 ALTER TABLE `users_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_usercollege`
--

DROP TABLE IF EXISTS `users_usercollege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_usercollege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `college_name_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `college_name_id` (`college_name_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_usercollege_college_name_id_ae697cee_fk_users_college_id` FOREIGN KEY (`college_name_id`) REFERENCES `users_college` (`id`),
  CONSTRAINT `users_usercollege_user_id_e36e370e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_usercollege`
--

LOCK TABLES `users_usercollege` WRITE;
/*!40000 ALTER TABLE `users_usercollege` DISABLE KEYS */;
INSERT INTO `users_usercollege` VALUES (2,1,5),(3,6,6),(4,9,7),(7,25,10);
/*!40000 ALTER TABLE `users_usercollege` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-25 18:19:17
