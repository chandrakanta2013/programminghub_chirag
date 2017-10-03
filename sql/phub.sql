CREATE DATABASE  IF NOT EXISTS `programming_hub` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `programming_hub`;
-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: programming_hub
-- ------------------------------------------------------
-- Server version	5.7.18

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
  `category_name` varchar(100) NOT NULL,
  `category_sequence` int(11) DEFAULT NULL,
  `feature_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feature_id_idx` (`feature_id`),
  CONSTRAINT `feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'Algorithms',1,NULL),(5,'Data Structures',2,NULL);
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
  `feature_name` varchar(100) NOT NULL,
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
  `language_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'Java'),(2,'Javascript'),(3,'DotNet'),(4,'Mysql'),(5,'Mongodb'),(6,'Python'),(7,'C++'),(8,'Objective C'),(9,'Ruby'),(10,'Shell'),(11,'C#'),(12,'Php');
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
  `program_name` varchar(100) NOT NULL,
  `program_description` varchar(500) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `description_image_base64` varchar(1000) DEFAULT NULL,
  `description_image_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `program_category_id_idx` (`category_id`),
  CONSTRAINT `program_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (64,'Multiplication','It does multiplication',4,NULL,NULL),(65,'Sum','It does sum',4,NULL,NULL);
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
  `language_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `code` mediumtext NOT NULL,
  `code_without_comments` mediumtext,
  `code_without_logic` mediumtext,
  `example_output` mediumtext,
  `difficulty_level` tinyint(1) NOT NULL DEFAULT '1',
  `example_output_type` varchar(100) DEFAULT NULL,
  `is_runnable` char(1) NOT NULL COMMENT '''Y'' => Yes, ''N'' => No',
  `can_be_used_for_challenges` char(1) NOT NULL DEFAULT 'N' COMMENT '''Y'' => Yes, ''N'' => No',
  PRIMARY KEY (`id`),
  KEY `lang_id_idx` (`language_id`),
  KEY `program_id_idx` (`program_id`),
  CONSTRAINT `lang_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `program_id` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_details`
--

LOCK TABLES `program_details` WRITE;
/*!40000 ALTER TABLE `program_details` DISABLE KEYS */;
INSERT INTO `program_details` VALUES (43,12,64,'<?php function mul(a, b) { return a * b; } ?>',NULL,NULL,'12',1,NULL,'Y','N'),(44,12,65,'<?php function sum(a, b) { return a + b; } ?>',NULL,NULL,' 6 + 6 => 12',1,NULL,'Y','N');
/*!40000 ALTER TABLE `program_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_io`
--

DROP TABLE IF EXISTS `program_io`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_io` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_details_id` int(11) NOT NULL,
  `input` varchar(500) DEFAULT NULL,
  `output` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `program_details_id_idx` (`program_details_id`),
  CONSTRAINT `program_details_id` FOREIGN KEY (`program_details_id`) REFERENCES `program_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_io`
--

LOCK TABLES `program_io` WRITE;
/*!40000 ALTER TABLE `program_io` DISABLE KEYS */;
INSERT INTO `program_io` VALUES (50,43,'3,4','12'),(51,43,'9,3','27'),(52,43,'3,2','6'),(53,44,'3,4','7'),(54,44,'9,3','12'),(55,44,'3,2','5');
/*!40000 ALTER TABLE `program_io` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_log`
--

DROP TABLE IF EXISTS `request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_no` int(11) DEFAULT NULL,
  `client` varchar(50) DEFAULT NULL,
  `app_name` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_log`
--

LOCK TABLES `request_log` WRITE;
/*!40000 ALTER TABLE `request_log` DISABLE KEYS */;
INSERT INTO `request_log` VALUES (117,123,'android','TEST Learn Java','php','2017-10-03 12:00:33');
/*!40000 ALTER TABLE `request_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'programming_hub'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_program` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_program`(param_version_no int(11), param_client varchar(50), param_app_name varchar(100), param_lang_name varchar(45), param_from int(11), param_to int(11))
BEGIN

# Error handling.
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	GET DIAGNOSTICS CONDITION 1
	@sql_state = RETURNED_SQLSTATE, @err_no = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @error_message = @text;
END;

# log request
INSERT INTO request_log (`version_no`, `client`, `app_name`, `language`) 
VALUES (param_version_no, param_client, param_app_name, param_lang_name);

# fetch result
SET @sql = "
	SELECT 
			l.id,
			l.language_name AS `language`,
            c.category_name AS `category`,
            p.program_name AS `name`,
            p.program_description AS `desc`,
            pd.code AS program,
            pi.output,
            pi.input,
            pd.is_runnable AS runnable,
			GROUP_CONCAT(input SEPARATOR '-') AS input,
			GROUP_CONCAT(output SEPARATOR '-') AS output
    FROM
        language AS l
    INNER JOIN program_details AS pd ON pd.language_id = l.id
    INNER JOIN program AS p ON p.id = pd.program_id
    INNER JOIN category AS c ON c.id = p.category_id
    LEFT JOIN program_io AS pi ON pi.program_details_id = pd.id
    WHERE
        language_name = ? 
	GROUP BY p.id
";

IF param_to IS NOT NULL THEN
	SET @sql = CONCAT(@sql, " LIMIT ", param_to);

	IF param_from IS NOT NULL THEN
		SET @sql = CONCAT(@sql, " OFFSET ", param_from);
	END IF;

END IF;

SET @search = param_lang_name;

PREPARE STMT FROM @sql;
EXECUTE STMT USING @search;
DEALLOCATE PREPARE STMT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `save_program` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `save_program`(param_program_name varchar(100), param_program_description varchar(100), param_category_name varchar(100), param_language_name varchar(100), param_desc_image_base64 varchar(1000), param_desc_image_url varchar(500), param_code mediumtext, param_example_output mediumtext, param_difficulty_level int(11), param_is_runnable varchar(45), param_input_output varchar(500))
BEGIN

# Declare variables
DECLARE category_id INT DEFAULT 0;
DECLARE language_id INT DEFAULT 0;


# Error handling.
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	GET DIAGNOSTICS CONDITION 1
	@sql_state = RETURNED_SQLSTATE, @err_no = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @error_message = @text;
	ROLLBACK;
END;

# Logic
START TRANSACTION;

SET category_id = (SELECT id FROM `category` WHERE category_name = param_category_name);
SET language_id = (SELECT id FROM `language` WHERE language_name = param_language_name);

IF category_id IS NULL THEN
	SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Category not found.';
END IF;

IF language_id IS NULL THEN
	SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Language not found.';
END IF;

INSERT INTO program(`program_name`, `program_description`, `category_id`, `description_image_base64`, `description_image_url`) 
VALUES (param_program_name, param_program_description, category_id, param_desc_image_base64, param_desc_image_url);

INSERT INTO program_details(`program_id`, `language_id`, `code`, `example_output`, `difficulty_level`, `is_runnable`) 
VALUES (LAST_INSERT_ID(), language_id, param_code, param_example_output, param_difficulty_level, param_is_runnable);

IF param_input_output IS NOT NULL THEN
	SET @input_output = REPLACE(param_input_output, '::PD_ID::', LAST_INSERT_ID());
	SET @sql = CONCAT("INSERT INTO program_io(`program_details_id`, `input`, `output`) VALUES ", @input_output);
	PREPARE STMT FROM @sql;
	EXECUTE STMT;
	DEALLOCATE PREPARE STMT;
END IF;

COMMIT;

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

-- Dump completed on 2017-10-03 12:14:27
