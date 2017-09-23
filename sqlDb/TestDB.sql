-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: programminghub
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.9-MariaDB

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(100) DEFAULT NULL,
  `category_sequence` int(11) DEFAULT NULL,
  `feature_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feature_id_idx` (`feature_id`),
  CONSTRAINT `feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Front',1,2),(2,'Back',5,4),(3,'Db',7,6);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` VALUES (1,'ABC'),(2,'XYZ'),(3,'PQR'),(4,'MNL'),(5,'CBDG'),(6,'ABHI');
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'Java'),(2,'Javascript'),(3,'DotNet'),(4,'Mysql'),(5,'Mongodb'),(6,'Python'),(7,'C++'),(8,'Objective C'),(9,'Ruby'),(10,'Shell'),(11,'C#');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(100) DEFAULT NULL,
  `program_description` varchar(500) DEFAULT NULL,
  `program_category_id` int(11) DEFAULT NULL,
  `description_image_base64` varchar(1000) DEFAULT NULL,
  `description_image_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `program_category_id_idx` (`program_category_id`),
  CONSTRAINT `program_category_id` FOREIGN KEY (`program_category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'Fibonaucci','maths',1,NULL,NULL),(2,'Prime Number','maths',3,NULL,NULL),(3,'Swap','mathss',2,NULL,NULL),(4,'Kishan Maheshwary',NULL,2,NULL,NULL),(5,'Abhinav Rajpurohit','IndiaNIC',1,NULL,NULL),(6,'Abhinav Rajpurohit','IndiaNIC',3,NULL,NULL),(7,'Milan Rajpurohit','IndiaNIC123',3,NULL,NULL),(8,'Milan Rajpurohit','IndiaNIC123',3,NULL,NULL),(9,'Milan Rajpurohit','IndiaNIC123',1,NULL,NULL);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_details`
--

DROP TABLE IF EXISTS `program_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  `code` mediumtext,
  `codewithoutcomments` mediumtext,
  `codewithoutlogic` mediumtext,
  `exampleoutput` mediumtext,
  `difficultylevel` int(11) DEFAULT NULL,
  `exampleoutputtype` varchar(100) DEFAULT NULL,
  `isrunnable` varchar(45) DEFAULT NULL,
  `canbeusedforchallenges` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lang_id_idx` (`lang_id`),
  KEY `program_id_idx` (`program_id`),
  CONSTRAINT `lang_id` FOREIGN KEY (`lang_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `program_id` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_details`
--

LOCK TABLES `program_details` WRITE;
/*!40000 ALTER TABLE `program_details` DISABLE KEYS */;
INSERT INTO `program_details` VALUES (1,4,2,'Hello my name is Abhinav','Hello!!!','Follow','Yes',4,'Correct','Yes','Yes'),(3,5,1,'Moon','Sub','Airplane','Not',5,'Correct','No','Yes'),(4,1,2,'Ballh','g','Train','No',3,'Wrong','Yes','No'),(5,1,1,'Ballw','fb','rbfg','No',3,'Wrong','Yes','No'),(6,1,3,'Ballx','ff','fh','No',3,'Wrong','Yes','No'),(7,1,2,'Ballsd','rh','vb','No',3,'Wrong','Yes','No'),(8,1,3,'Ball','Bat','Train','No',3,'Wrong','Yes','No'),(9,NULL,6,'My',NULL,NULL,'Ahmedabad',4,NULL,'Hello',NULL),(10,NULL,7,'My SELF',NULL,NULL,'AhmedabadBBBBB',5,NULL,'HOLA',NULL),(11,NULL,8,'My SELF',NULL,NULL,'AhmedabadBBBBB',5,NULL,'HOLA',NULL),(12,NULL,9,'My SELF',NULL,NULL,'AhmedabadBBBBB',5,NULL,'HOLA',NULL);
/*!40000 ALTER TABLE `program_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_io`
--

DROP TABLE IF EXISTS `program_io`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_io` (
  `id` int(11) NOT NULL,
  `program_details_id` int(11) DEFAULT NULL,
  `input` varchar(500) DEFAULT NULL,
  `output` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `program_details_id_idx` (`program_details_id`),
  CONSTRAINT `program_details_id` FOREIGN KEY (`program_details_id`) REFERENCES `program_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_io`
--

LOCK TABLES `program_io` WRITE;
/*!40000 ALTER TABLE `program_io` DISABLE KEYS */;
INSERT INTO `program_io` VALUES (0,9,'bdsjfbks','wuyeriuewrugueigduide'),(1,3,'number','string'),(2,1,'char','float'),(3,8,'string','parse'),(4,5,'stringsdf','parserty'),(5,7,'stringwer','parsegh'),(6,8,'stringcvcx','parseopi'),(7,4,'stringqa','parsexcv');
/*!40000 ALTER TABLE `program_io` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestlog`
--

DROP TABLE IF EXISTS `requestlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionno` int(11) DEFAULT NULL,
  `client` varchar(50) DEFAULT NULL,
  `appname` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestlog`
--

LOCK TABLES `requestlog` WRITE;
/*!40000 ALTER TABLE `requestlog` DISABLE KEYS */;
INSERT INTO `requestlog` VALUES (1,123,'android','learn java','Java','0000-00-00 00:00:00'),(2,123,'android','learn java','Java','0000-00-00 00:00:00'),(3,123,'android','learn java','Java','2017-09-23 17:22:52');
/*!40000 ALTER TABLE `requestlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'programminghub'
--
/*!50003 DROP PROCEDURE IF EXISTS `saveprogram` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveprogram`(param_program_name varchar(100), param_program_description varchar(100), param_cat_name varchar(100), param_code mediumtext, param_exampleoutput mediumtext, param_difficultylevel int(11), param_isrunnable varchar(45), param_input varchar(500), param_output varchar(500))
BEGIN


INSERT INTO program(program_name, program_description, program_category_id) VALUES (param_program_name, param_program_description, (select id from category where cat_name=param_cat_name)  );

INSERT INTO program_details(program_id, code, exampleoutput, difficultylevel, isrunnable) VALUES (LAST_INSERT_ID(), param_code, param_exampleoutput, param_difficultylevel, param_isrunnable);

INSERT INTO program_io(program_details_id, input, output) VALUES (LAST_INSERT_ID(), param_input, param_output);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-23 18:41:21
