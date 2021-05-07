-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: contactdatabase
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `permit`
--

DROP TABLE IF EXISTS `permit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permit` (
  `PermitNumber` int NOT NULL AUTO_INCREMENT,
  `businessid` varchar(255) DEFAULT NULL,
  `idnumber` int DEFAULT NULL,
  `destination` int DEFAULT NULL,
  `departure` int DEFAULT NULL,
  `permitdate` date DEFAULT NULL,
  `reason` text,
  `status` varchar(20) DEFAULT NULL,
  `permittype` char(2) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  PRIMARY KEY (`PermitNumber`),
  KEY `businessid` (`businessid`),
  KEY `idnumber` (`idnumber`),
  KEY `departure` (`departure`),
  KEY `destination` (`destination`),
  CONSTRAINT `permit_ibfk_1` FOREIGN KEY (`businessid`) REFERENCES `business` (`businessid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permit_ibfk_2` FOREIGN KEY (`idnumber`) REFERENCES `individual` (`idnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permit_ibfk_3` FOREIGN KEY (`departure`) REFERENCES `town` (`townid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permit_ibfk_4` FOREIGN KEY (`destination`) REFERENCES `town` (`townid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permit_chk_2` CHECK (((`status` = _utf8mb4'Approved') or (`status` = _utf8mb4'Deny') or (`status` = _utf8mb4''))),
  CONSTRAINT `permit_chk_3` CHECK (((`permittype` = _utf8mb4'IB') or (`permittype` = _utf8mb4'CG') or (`permittype` = _utf8mb4'IN')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permit`
--

LOCK TABLES `permit` WRITE;
/*!40000 ALTER TABLE `permit` DISABLE KEYS */;
/*!40000 ALTER TABLE `permit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-07 16:35:22
