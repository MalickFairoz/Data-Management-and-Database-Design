CREATE DATABASE  IF NOT EXISTS `dvdrentals` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dvdrentals`;
-- MySQL dump 10.13  Distrib 5.7.15, for Win64 (x86_64)
--
-- Host: localhost    Database: dvdrentals
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `MeetingDate` date DEFAULT NULL,
  `Location` varchar(200) DEFAULT NULL,
  `MemberAttended` char(1) DEFAULT NULL,
  `MemberId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  KEY `LocationID_idx` (`LocationId`),
  KEY `member_fk_idx` (`MemberId`),
  CONSTRAINT `locationid_fk` FOREIGN KEY (`LocationId`) REFERENCES `location` (`LocationId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `member_fk` FOREIGN KEY (`MemberId`) REFERENCES `memberdetails` (`MemberId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES ('2004-01-01',NULL,'Y',1,2),('2004-01-01',NULL,'N',2,2),('2004-01-01',NULL,'Y',3,2),('2004-01-01',NULL,'N',4,2),('2004-01-01',NULL,'Y',5,2),('2004-01-01',NULL,'Y',6,2),('2004-03-01',NULL,'Y',1,1),('2004-03-01',NULL,'N',2,1),('2004-03-01',NULL,'Y',3,1),('2004-03-01',NULL,'Y',4,1),('2004-03-01',NULL,'N',5,1),('2004-03-01',NULL,'N',6,1);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CategoryId` int(11) NOT NULL,
  `Category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Thriller'),(2,'Romance'),(3,'Horror'),(4,'War'),(5,'Sci-fi'),(6,'Historical'),(7,'Comedy'),(9,'Film Noir');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `CustID` smallint(6) NOT NULL AUTO_INCREMENT,
  `CustFN` varchar(20) NOT NULL,
  `CustMN` varchar(20) DEFAULT NULL,
  `CustLN` varchar(20) NOT NULL,
  PRIMARY KEY (`CustID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Ralph','Frederick','Johnson'),(2,'Hubert','T.','Weatherby'),(3,'Anne',NULL,'Thomas'),(4,'Mona','J.','Cavenaugh'),(5,'Peter',NULL,'Taylor'),(6,'Ginger','Meagan','Delaney');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvdparticipant`
--

DROP TABLE IF EXISTS `dvdparticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dvdparticipant` (
  `DVDID` smallint(6) NOT NULL,
  `PartID` smallint(6) NOT NULL,
  `RoleID` varchar(4) NOT NULL,
  PRIMARY KEY (`DVDID`,`PartID`,`RoleID`),
  KEY `PartID` (`PartID`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `dvdparticipant_ibfk_1` FOREIGN KEY (`DVDID`) REFERENCES `dvds` (`DVDID`),
  CONSTRAINT `dvdparticipant_ibfk_2` FOREIGN KEY (`PartID`) REFERENCES `participants` (`PartID`),
  CONSTRAINT `dvdparticipant_ibfk_3` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvdparticipant`
--

LOCK TABLES `dvdparticipant` WRITE;
/*!40000 ALTER TABLE `dvdparticipant` DISABLE KEYS */;
INSERT INTO `dvdparticipant` VALUES (3,1,'r102'),(3,1,'r103'),(3,2,'r101'),(3,3,'r101'),(3,4,'r108'),(2,5,'r107'),(4,6,'r101'),(1,7,'r101'),(1,8,'r101'),(1,9,'r108'),(1,10,'r102'),(1,11,'r101');
/*!40000 ALTER TABLE `dvdparticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvds`
--

DROP TABLE IF EXISTS `dvds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dvds` (
  `DVDID` smallint(6) NOT NULL AUTO_INCREMENT,
  `DVDName` varchar(60) NOT NULL,
  `NumDisks` tinyint(4) NOT NULL DEFAULT '1',
  `YearRlsd` year(4) NOT NULL,
  `MTypeID` varchar(4) NOT NULL,
  `StudID` varchar(4) NOT NULL,
  `RatingID` varchar(4) NOT NULL,
  `FormID` char(2) NOT NULL,
  `StatID` char(3) NOT NULL,
  PRIMARY KEY (`DVDID`),
  KEY `MTypeID` (`MTypeID`),
  KEY `StudID` (`StudID`),
  KEY `RatingID` (`RatingID`),
  KEY `FormID` (`FormID`),
  KEY `StatID` (`StatID`),
  CONSTRAINT `dvds_ibfk_1` FOREIGN KEY (`MTypeID`) REFERENCES `movietypes` (`MTypeID`),
  CONSTRAINT `dvds_ibfk_2` FOREIGN KEY (`StudID`) REFERENCES `studios` (`StudID`),
  CONSTRAINT `dvds_ibfk_3` FOREIGN KEY (`RatingID`) REFERENCES `ratings` (`RatingID`),
  CONSTRAINT `dvds_ibfk_4` FOREIGN KEY (`FormID`) REFERENCES `formats` (`FormID`),
  CONSTRAINT `dvds_ibfk_5` FOREIGN KEY (`StatID`) REFERENCES `status` (`StatID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvds`
--

LOCK TABLES `dvds` WRITE;
/*!40000 ALTER TABLE `dvds` DISABLE KEYS */;
INSERT INTO `dvds` VALUES (1,'White Christmas',1,2000,'mt16','s105','NR','f1','s1'),(2,'What\'s Up, Doc?',1,2001,'mt12','s103','G','f1','s2'),(3,'Out of Africa',1,2000,'mt11','s101','PG','f1','s1'),(4,'The Maltese Falcon',1,2000,'mt11','s103','NR','f1','s2'),(5,'Amadeus',1,1997,'mt11','s103','PG','f1','s2'),(6,'The Rocky Horror Picture Show',2,2000,'mt12','s106','NR','f1','s2'),(7,'A Room with a View',1,2000,'mt11','s107','NR','f1','s1'),(8,'Mash',2,2001,'mt12','s106','R','f1','s2');
/*!40000 ALTER TABLE `dvds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `EmpID` smallint(6) NOT NULL AUTO_INCREMENT,
  `EmpFN` varchar(20) NOT NULL,
  `EmpMN` varchar(20) DEFAULT NULL,
  `EmpLN` varchar(20) NOT NULL,
  PRIMARY KEY (`EmpID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'John','P.','Smith'),(2,'Robert',NULL,'Schroader'),(3,'Mary','Marie','Michaels'),(4,'John',NULL,'Laguci'),(5,'Rita','C.','Carter'),(6,'George',NULL,'Brooks');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favcategory`
--

DROP TABLE IF EXISTS `favcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favcategory` (
  `CategoryId` int(11) NOT NULL,
  `MemberId` int(11) NOT NULL,
  KEY `memberid_fk_idx` (`MemberId`),
  KEY `categoryid_fk_idx` (`CategoryId`),
  CONSTRAINT `categoryid_fkey` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `memberid_fk` FOREIGN KEY (`MemberId`) REFERENCES `memberdetails` (`MemberId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favcategory`
--

LOCK TABLES `favcategory` WRITE;
/*!40000 ALTER TABLE `favcategory` DISABLE KEYS */;
INSERT INTO `favcategory` VALUES (1,3),(1,5),(1,2),(1,3),(2,1),(2,3),(3,3),(4,6),(4,1),(5,2),(5,3),(5,4),(9,2),(9,3),(9,5),(7,6),(7,4);
/*!40000 ALTER TABLE `favcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `films` (
  `FilmId` int(11) NOT NULL,
  `FilmName` varchar(100) DEFAULT NULL,
  `YearReleased` int(11) DEFAULT NULL,
  `PlotSummary` text,
  `AvailableOnDVD` char(1) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `DVDPrice` decimal(12,1) DEFAULT NULL,
  PRIMARY KEY (`FilmId`),
  KEY `categoryid_fk_idx` (`CategoryId`),
  CONSTRAINT `categoryid_fk` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'The Dirty Half Dozen',1987,'Six men go to war wearing unwashed uniforms.  The horror!','N',2,4,NULL),(2,'On Golden Puddle',1967,'A couple find love while wading through a puddle','Y',4,2,13.0),(3,'The Lion, the Witch, and the Chest of Drawers',1977,'A fun film for all those interested in zoo/magic/furniture drama','N',1,3,NULL),(4,'Nightmare on Oak Street, Part 23',1997,'The murderous Terry stalks Oak Street','Y',2,3,10.0),(5,'The Wide Brimmed Hat',2005,'Fascinating life story of a wide brimmed hat','N',1,5,NULL),(6,'Sense and Insensitivity',2001,'She longs for a new life with Mr Arcy, he longs for a small cottage in the Hamptons','Y',3,6,16.0),(7,'Planet of the Japes',1967,'Earth has been destroyed, to be taken over by a species of comedians','Y',5,4,13.0),(8,'The Maltese Poodle',1947,'A mysterious bite mark, a guilty looking poodle. 1st class thriller','Y',1,1,3.0),(9,'15th Late Afternoon',1989,'One of Shakespeare\'s lesser known plays','N',5,6,13.0),(10,'Soylent Yellow',1967,'Detective Billy Brambles discovers Soylent Yellow is made of Soya Bean.  Ewwww!','Y',5,5,13.0);
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formats`
--

DROP TABLE IF EXISTS `formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formats` (
  `FormID` char(2) NOT NULL,
  `FormDescrip` varchar(15) NOT NULL,
  PRIMARY KEY (`FormID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formats`
--

LOCK TABLES `formats` WRITE;
/*!40000 ALTER TABLE `formats` DISABLE KEYS */;
INSERT INTO `formats` VALUES ('f1','Widescreen'),('f2','Fullscreen');
/*!40000 ALTER TABLE `formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `LocationId` int(11) NOT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `City` varchar(75) DEFAULT NULL,
  `State` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Main Steet','Big Apple City','New State'),(2,'Winding Road','Windy Village','Golden State'),(3,'Tiny Terrace','Big City','Small State');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberdetails`
--

DROP TABLE IF EXISTS `memberdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberdetails` (
  `MemberId` int(11) NOT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `City` varchar(75) DEFAULT NULL,
  `State` varchar(75) DEFAULT NULL,
  `ZipCode` varchar(12) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `DateOfJoining` date DEFAULT NULL,
  PRIMARY KEY (`MemberId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberdetails`
--

LOCK TABLES `memberdetails` WRITE;
/*!40000 ALTER TABLE `memberdetails` DISABLE KEYS */;
INSERT INTO `memberdetails` VALUES (1,'Katie','Smith','1977-01-09','Main Road','Townsville','Stateside','123456','katie@mail.com','2004-02-23'),(2,'Bob','Robson','1987-01-09','Little Street','Big City','Small State','34565','rob@mail.com','2004-03-13'),(3,'Sandra','Jakes','1957-05-15','The Avenue','Windy Village','Golden State','65423','sandra@her_mail.com','2004-04-13'),(4,'Steve','Gee','1967-10-05','45 Upper Road','New Town','New State','99112','steve@gee.com','2004-02-22'),(5,'John','Jones','1952-10-05','New Lane','Big Apple City','New State','88776','jj@jonesmail.org','2005-01-02'),(6,'Jenny','Jones','1953-08-25','New Lane','Big Apple City','New State','88776','jj@jonesmail.org','2005-01-02');
/*!40000 ALTER TABLE `memberdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movietypes`
--

DROP TABLE IF EXISTS `movietypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movietypes` (
  `MTypeID` varchar(4) NOT NULL,
  `MTypeDescrip` varchar(30) NOT NULL,
  PRIMARY KEY (`MTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movietypes`
--

LOCK TABLES `movietypes` WRITE;
/*!40000 ALTER TABLE `movietypes` DISABLE KEYS */;
INSERT INTO `movietypes` VALUES ('mt10','Action'),('mt11','Drama'),('mt12','Comedy'),('mt13','Romantic Comedy'),('mt14','Science Fiction/Fantasy'),('mt15','Documentary'),('mt16','Musical');
/*!40000 ALTER TABLE `movietypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustID` smallint(6) NOT NULL,
  `EmpID` smallint(6) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustID` (`CustID`),
  KEY `EmpID` (`EmpID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustID`) REFERENCES `customers` (`CustID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`EmpID`) REFERENCES `employees` (`EmpID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,3),(2,1,2),(3,2,5),(4,3,6),(5,4,1),(6,3,3),(7,5,2),(8,6,4),(9,4,5),(10,6,2),(11,3,1),(12,1,6),(13,5,4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants` (
  `PartID` smallint(6) NOT NULL AUTO_INCREMENT,
  `PartFN` varchar(20) NOT NULL,
  `PartMN` varchar(20) DEFAULT NULL,
  `PartLN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PartID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (1,'Sydney',NULL,'Pollack'),(2,'Robert',NULL,'Redford'),(3,'Meryl',NULL,'Streep'),(4,'John',NULL,'Barry'),(5,'Henry',NULL,'Buck'),(6,'Humphrey',NULL,'Bogart'),(7,'Danny',NULL,'Kaye'),(8,'Rosemary',NULL,'Clooney'),(9,'Irving',NULL,'Berlin'),(10,'Michael',NULL,'Curtiz'),(11,'Bing',NULL,'Crosby');
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `RatingID` varchar(4) NOT NULL,
  `RatingDescrip` varchar(30) NOT NULL,
  PRIMARY KEY (`RatingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES ('G','General audiences'),('NR','Not rated'),('PG','Parental guidance suggested'),('PG13','Parents strongly cautioned'),('R','Under 17 requires adult'),('X','No one 17 and under');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `RoleID` varchar(4) NOT NULL,
  `RoleDescrip` varchar(30) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('r101','Actor'),('r102','Director'),('r103','Producer'),('r104','Executive Producer'),('r105','Co-Producer'),('r106','Assistant Producer'),('r107','Screenwriter'),('r108','Composer');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `StatID` char(3) NOT NULL,
  `StatDescrip` varchar(20) NOT NULL,
  PRIMARY KEY (`StatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES ('s1','Checked out'),('s2','Available'),('s3','Damaged'),('s4','Lost');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studios`
--

DROP TABLE IF EXISTS `studios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studios` (
  `StudID` varchar(4) NOT NULL,
  `StudDescrip` varchar(40) NOT NULL,
  PRIMARY KEY (`StudID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studios`
--

LOCK TABLES `studios` WRITE;
/*!40000 ALTER TABLE `studios` DISABLE KEYS */;
INSERT INTO `studios` VALUES ('s101','Universal Studios'),('s102','Warner Brothers'),('s103','Time Warner'),('s104','Columbia Pictures'),('s105','Paramount Pictures'),('s106','Twentieth Century Fox'),('s107','Merchant Ivory Production');
/*!40000 ALTER TABLE `studios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templocation`
--

DROP TABLE IF EXISTS `templocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templocation` (
  `LocationId` int(11) NOT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `City` varchar(75) DEFAULT NULL,
  `State` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templocation`
--

LOCK TABLES `templocation` WRITE;
/*!40000 ALTER TABLE `templocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `templocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `TransID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `DVDID` smallint(6) NOT NULL,
  `DateOut` date NOT NULL,
  `DateDue` date NOT NULL,
  `DateIn` date DEFAULT NULL,
  PRIMARY KEY (`TransID`),
  KEY `OrderID` (`OrderID`),
  KEY `DVDID` (`DVDID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`DVDID`) REFERENCES `dvds` (`DVDID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,1,'2016-10-07','2016-10-10',NULL),(2,1,4,'2016-10-07','2016-10-10',NULL),(3,1,8,'2016-10-07','2016-10-10',NULL),(4,2,3,'2016-10-07','2016-10-10',NULL),(5,3,4,'2016-10-07','2016-10-10',NULL),(6,3,1,'2016-10-07','2016-10-10',NULL),(7,3,7,'2016-10-07','2016-10-10',NULL),(8,4,4,'2016-10-07','2016-10-10',NULL),(9,5,3,'2016-10-07','2016-10-10',NULL),(10,6,2,'2016-10-07','2016-10-10',NULL),(11,6,1,'2016-10-07','2016-10-10',NULL),(12,7,4,'2016-10-07','2016-10-10',NULL),(13,8,2,'2016-10-07','2016-10-10',NULL),(14,8,1,'2016-10-07','2016-10-10',NULL),(15,8,3,'2016-10-07','2016-10-10',NULL),(16,9,7,'2016-10-07','2016-10-10',NULL),(17,9,1,'2016-10-07','2016-10-10',NULL),(18,10,5,'2016-10-07','2016-10-10',NULL),(19,11,6,'2016-10-07','2016-10-10',NULL),(20,11,2,'2016-10-07','2016-10-10',NULL),(21,11,8,'2016-10-07','2016-10-10',NULL),(22,12,5,'2016-10-07','2016-10-10',NULL),(23,13,7,'2016-10-07','2016-10-10',NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-07 15:40:17
