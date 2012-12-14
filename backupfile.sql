-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: exercises
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.04.2

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
-- Table structure for table `Articles`
--

DROP TABLE IF EXISTS `Articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Articles` (
  `article_name` varchar(30) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Articles`
--

LOCK TABLES `Articles` WRITE;
/*!40000 ALTER TABLE `Articles` DISABLE KEYS */;
INSERT INTO `Articles` VALUES ('wifi','user3','IT'),('ozone depletion','user2','environment'),('recycle','user1','environment'),('ivy bridge processor','user3','IT'),('Artificial Intelligence','admin2','Machines'),('memory enhancer','admin2','Machines'),('Green Revolution in India','admin1','environment'),('Shooting stars','user2','space'),('India against Corruption','user3','politics');
/*!40000 ALTER TABLE `Articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comments` (
  `article_name` varchar(30) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES ('Green Revolution in India','very good','user2'),('wifi','good','user1'),('ivy bridge processor','good efforts','admin1'),('Green Revolution in India','great!','user3'),('memory enhancer','amazing!','user2'),('recycle','great efforts!','user2'),('ivy bridge processor','great going','admin2'),('wifi','good efforts but need little enhancement','admin2'),('ivy bridge processor','very nicely written sir!','user2'),('Green Revolution in India','one more comment','user2');
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `bcode` varchar(10) NOT NULL,
  `librarian` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('b1','john smith','2 Angesea Rd'),('b2','mary johns','34 pearse St'),('b3','francis owens','grange X');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holdings`
--

DROP TABLE IF EXISTS `holdings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holdings` (
  `branch` varchar(10) NOT NULL DEFAULT '',
  `title` varchar(20) NOT NULL DEFAULT '',
  `copies` int(11) DEFAULT NULL,
  PRIMARY KEY (`branch`,`title`),
  KEY `title` (`title`),
  CONSTRAINT `holdings_ibfk_1` FOREIGN KEY (`branch`) REFERENCES `branch` (`bcode`),
  CONSTRAINT `holdings_ibfk_2` FOREIGN KEY (`title`) REFERENCES `titles` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holdings`
--

LOCK TABLES `holdings` WRITE;
/*!40000 ALTER TABLE `holdings` DISABLE KEYS */;
INSERT INTO `holdings` VALUES ('b1','A history of dublin',1),('b1','how to fish',2),('b1','susannah',3),('b2','Computers',2),('b2','how to fish',4),('b2','The Wife',3),('b3','A history of dublin',1),('b3','Computers',4),('b3','susannah',3),('b3','The Wife',1);
/*!40000 ALTER TABLE `holdings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `lname` varchar(20) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES ('buttery',7023421,'college St'),('lincoln',6834523,'lincoln place'),('O\'neils',674134,'Pearse St'),('old nag',7678132,'Dame St');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sandwiches`
--

DROP TABLE IF EXISTS `sandwiches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sandwiches` (
  `location` varchar(50) NOT NULL DEFAULT '',
  `bread` varchar(20) NOT NULL DEFAULT '',
  `filing` varchar(20) NOT NULL DEFAULT '',
  `price` float DEFAULT NULL,
  PRIMARY KEY (`location`,`bread`,`filing`),
  CONSTRAINT `Fk_loc` FOREIGN KEY (`location`) REFERENCES `locations` (`lname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sandwiches`
--

LOCK TABLES `sandwiches` WRITE;
/*!40000 ALTER TABLE `sandwiches` DISABLE KEYS */;
INSERT INTO `sandwiches` VALUES ('buttery','white','cheese',1),('buttery','white','ham',1.1),('lincoln','rye','beef',1.35),('lincoln','rye','ham',1.25),('lincoln','white','ham',1.3),('O\'neils','white','cheese',1.2),('O\'neils','white','turkey',1.35),('O\'neils','whole','ham',1.25),('old nag','rye','beef',1.35),('old nag','rye','ham',1.4);
/*!40000 ALTER TABLE `sandwiches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastes`
--

DROP TABLE IF EXISTS `tastes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastes` (
  `name` varchar(20) NOT NULL,
  `filing` varchar(20) NOT NULL,
  PRIMARY KEY (`name`,`filing`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastes`
--

LOCK TABLES `tastes` WRITE;
/*!40000 ALTER TABLE `tastes` DISABLE KEYS */;
INSERT INTO `tastes` VALUES ('brown','beef'),('brown','ham'),('brown','turkey'),('green','beef'),('green','cheese'),('green','turkey'),('jones','cheese');
/*!40000 ALTER TABLE `tastes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testing_table`
--

DROP TABLE IF EXISTS `testing_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testing_table` (
  `username` varchar(20) DEFAULT NULL,
  `roll_no` int(11) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testing_table`
--

LOCK TABLES `testing_table` WRITE;
/*!40000 ALTER TABLE `testing_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `testing_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `title` varchar(20) NOT NULL,
  `author` varchar(20) DEFAULT NULL,
  `publisher` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES ('A history of dublin','David Little','Wiley'),('Computers','Blaise Pascal','Applewoods'),('how to fish','Amy Fly','Stop Press'),('susannah','Ann Brown','Macmillan'),('The Wife','Ann Brown','Macmillan');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-14 16:07:41
