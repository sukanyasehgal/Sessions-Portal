CREATE DATABASE  IF NOT EXISTS `lm_courses` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lm_courses`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: lm_courses
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `june_sessions`
--

DROP TABLE IF EXISTS `june_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `june_sessions` (
  `code` varchar(20) NOT NULL,
  `category` varchar(30) default NULL,
  `day` varchar(9) default NULL,
  `length_min` int(3) default NULL,
  `level` int(3) default NULL,
  `prerequisites` varchar(500) default NULL,
  `room` varchar(10) default NULL,
  `start_time` time default NULL,
  `track` varchar(500) default NULL,
  `url` varchar(100) default NULL,
  `speaker` varchar(30) default NULL,
  `image_url` varchar(200) default NULL,
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `june_sessions`
--

LOCK TABLES `june_sessions` WRITE;
/*!40000 ALTER TABLE `june_sessions` DISABLE KEYS */;
INSERT INTO `june_sessions` VALUES ('AD-302-M','Spotlight','Wednesday',90,200,'Knowledge of SQL Server database architecture and data warehouse concepts','TH-2','09:00:00','Application & Database Development','www.aricent.com','Raj Kumar','Application & Database Development3.jpg'),('AD-399','Spotlight','Monday',75,200,'Prior experience with SQL Server and T-SQL. A good working knowledge of the basics of T-SQL','TH-3','10:00:00','Application & Database Development','www.aricent.com','Tanmoy Bandyopadhyay','Application & Database Development2.jpg'),('BIA-302','Regular','Wednesday',60,300,'An understanding of installing the Database Engine','TH-1','08:00:00','BI Platform Architecture, Development & Administration','www.aricent.com','Tanmoy Bandyopadhyay','BI Platform Architecture, Development & Administration.jpg'),('BIA-305','Regular','Tuesday',75,100,'Understanding of basic Hadoop terminology such as HDFS and MapReduce','TH-3','09:45:00','BI Platform Architecture, Development & Administration','www.aricent.com','Swati Mukhopadhyay','BI Platform Architecture, Development & Administration2.jpg'),('BID-307-M','Pre-Conference','Thursday',75,100,'None','TH-3','09:45:00','BI Information Delivery','www.aricent.com','Raj Kumar','BI Information Delivery.jpg'),('CLD-305','Regular','Friday',60,400,'To understand the load test demo, understanding of performance monitoring tools, such as Profiler, would be helpful','TH-6','08:30:00','Cloud Application Development & Deployment','www.aricent.com','Raj Kumar','Cloud Application Development & Deployment.png'),('CLD-307-M','Spotlight','Tuesday',75,400,'None','TH-5','09:45:00','Cloud Application Development & Deployment','www.aricent.com','Raj Kumar','Cloud Application Development & Deployment2.jpg'),('DBA-122','Regular','Monday',75,400,'General Understanding of SQL Server','TH-3','09:45:00','Enterprise Database Administration & Deployment','www.aricent.com','Raj Kumar','Enterprise Database Administration & Deployment.png'),('DBA-322-S','Pre-Conference','Friday',60,400,'None','TH-3','09:45:00','Enterprise Database Administration & Deployment','www.aricent.com','Swati Mukhopadhyay','Enterprise Database Administration & Deployment2.png'),('LT-102','Regular','Monday',75,400,'None','TH-3','09:45:00','Application & Database Development','www.aricent.com','Raj Kumar','Application & Database Development.jpg'),('PD-102','Spotlight','Thursday',60,100,'None','TH-3','09:45:00','Professional Development','www.aricent.com','Tanmoy Bandyopadhayay','Professional Development.jpg');
/*!40000 ALTER TABLE `june_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_registrations`
--

DROP TABLE IF EXISTS `session_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_registrations` (
  `session_code` varchar(20) NOT NULL default '',
  `employee_id` int(5) NOT NULL default '0',
  `employee_name` varchar(30) default NULL,
  `employee_phone_number` bigint(10) default NULL,
  `email_id` varchar(30) default NULL,
  PRIMARY KEY  (`session_code`,`employee_id`),
  CONSTRAINT `session_registrations_ibfk_1` FOREIGN KEY (`session_code`) REFERENCES `june_sessions` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_registrations`
--

LOCK TABLES `session_registrations` WRITE;
/*!40000 ALTER TABLE `session_registrations` DISABLE KEYS */;
INSERT INTO `session_registrations` VALUES ('BIA-302',23222,'Sukanya ',9899999999,'sukanya.sahgal@gmail.com'),('BIA-302',44608,'Sukanya ',8777777777,'sukanya.sahgal@gmail.com');
/*!40000 ALTER TABLE `session_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_details`
--

DROP TABLE IF EXISTS `admin_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_details` (
  `admin_username` varchar(20) NOT NULL default '',
  `admin_password` varchar(20) default NULL,
  PRIMARY KEY  (`admin_username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_details`
--

LOCK TABLES `admin_details` WRITE;
/*!40000 ALTER TABLE `admin_details` DISABLE KEYS */;
INSERT INTO `admin_details` VALUES ('admin','admin');
/*!40000 ALTER TABLE `admin_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-04  9:58:14
