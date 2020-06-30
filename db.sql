CREATE DATABASE  IF NOT EXISTS `h2tdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `h2tdb`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: h2tdb
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `attendanceID` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(45) NOT NULL,
  `calendarID` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attendanceID`),
  KEY `userAttendance_idx` (`userID`),
  KEY `calendarID_idx` (`calendarID`),
  CONSTRAINT `calendarID` FOREIGN KEY (`calendarID`) REFERENCES `calendars` (`calendarID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userAttendance` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendars`
--

DROP TABLE IF EXISTS `calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendars` (
  `calendarID` int NOT NULL AUTO_INCREMENT,
  `classID` varchar(45) NOT NULL,
  `Time` datetime NOT NULL,
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`calendarID`),
  KEY `classID_idx` (`classID`),
  CONSTRAINT `classID` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendars`
--

LOCK TABLES `calendars` WRITE;
/*!40000 ALTER TABLE `calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `classID` varchar(45) NOT NULL,
  `className` varchar(45) NOT NULL,
  `courseID` varchar(45) NOT NULL,
  `teacherID` varchar(45) NOT NULL,
  PRIMARY KEY (`classID`),
  KEY `courseID_idx` (`courseID`),
  KEY `teacherID_idx` (`teacherID`),
  CONSTRAINT `courseID` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacherID` FOREIGN KEY (`teacherID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `courseID` varchar(45) NOT NULL,
  `courseName` varchar(45) NOT NULL,
  `price` int DEFAULT NULL,
  `mainTeacher` varchar(45) DEFAULT NULL,
  `ageFrom` int DEFAULT NULL,
  `ageTo` int DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`courseID`),
  UNIQUE KEY `courseID_UNIQUE` (`courseID`),
  KEY `mainTeacherID_idx` (`mainTeacher`),
  CONSTRAINT `mainTeacherID` FOREIGN KEY (`mainTeacher`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `fileID` int NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) DEFAULT NULL,
  `source` varchar(255) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`fileID`),
  UNIQUE KEY `fileID_UNIQUE` (`fileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listpermissions`
--

DROP TABLE IF EXISTS `listpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listpermissions` (
  `listPermissionID` int NOT NULL,
  `perrmissionID` int NOT NULL,
  PRIMARY KEY (`listPermissionID`),
  KEY `permissionlist_idx` (`perrmissionID`),
  CONSTRAINT `permissionlist` FOREIGN KEY (`perrmissionID`) REFERENCES `permissions` (`permissionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listpermissions`
--

LOCK TABLES `listpermissions` WRITE;
/*!40000 ALTER TABLE `listpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `listpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liststudent`
--

DROP TABLE IF EXISTS `liststudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liststudent` (
  `index` int NOT NULL AUTO_INCREMENT,
  `studentID` varchar(45) NOT NULL,
  `classID` varchar(45) NOT NULL,
  PRIMARY KEY (`index`),
  KEY `classIDofList_idx` (`classID`),
  KEY `studentID_idx` (`studentID`),
  CONSTRAINT `classIDofList` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentID` FOREIGN KEY (`studentID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liststudent`
--

LOCK TABLES `liststudent` WRITE;
/*!40000 ALTER TABLE `liststudent` DISABLE KEYS */;
/*!40000 ALTER TABLE `liststudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `Index` int NOT NULL AUTO_INCREMENT,
  `Action` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  `Note` varchar(500) DEFAULT NULL,
  `User` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Index`),
  KEY `UseActionr_idx` (`User`),
  CONSTRAINT `UseActionr` FOREIGN KEY (`User`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notificationID` int NOT NULL AUTO_INCREMENT,
  `classID` varchar(45) NOT NULL,
  `content` varchar(500) NOT NULL,
  `title` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`notificationID`),
  KEY `classID_idx` (`classID`),
  CONSTRAINT `classIDnotification` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `permissionID` int NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`permissionID`),
  UNIQUE KEY `permissionID_UNIQUE` (`permissionID`),
  UNIQUE KEY `permissionName_UNIQUE` (`permissionName`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (4,'Attendance_EditAttendance'),(2,'Attendance_History'),(3,'Attendance_TakeAttendance'),(9,'ClassSupport_AgencyChange'),(11,'ClassSupport_CheckinCheckout'),(12,'ClassSupport_EditAttendance'),(10,'ClassSupport_EditCalendar'),(13,'ClassSupport_HistoryLogs'),(15,'CreateClass'),(1,'FileManagement'),(8,'Grade_Calculate'),(14,'Notification'),(18,'Report_Analysis'),(17,'Report_CreateCourse'),(16,'Report_CreateStudent'),(19,'RootPage'),(6,'Topic_EditGrade'),(5,'Topic_Grade'),(7,'Topic_NewGrade');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `roleID` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleID`),
  UNIQUE KEY `roleID_UNIQUE` (`roleID`),
  UNIQUE KEY `roleName_UNIQUE` (`roleName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (4,'admin'),(5,'parent'),(3,'staff_1'),(2,'student'),(1,'teacher');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submitions`
--

DROP TABLE IF EXISTS `submitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submitions` (
  `submitID` int NOT NULL AUTO_INCREMENT,
  `studentID` varchar(45) NOT NULL,
  `topicID` int NOT NULL,
  `fileID` int NOT NULL,
  `submitTime` datetime NOT NULL,
  `grade` int DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `gradeTime` datetime DEFAULT NULL,
  `updatedGradeTime` datetime DEFAULT NULL,
  PRIMARY KEY (`submitID`),
  KEY `studentID_idx` (`studentID`),
  KEY `topicId_idx` (`topicID`),
  KEY `fileSubmmit_idx` (`fileID`),
  CONSTRAINT `fileSubmmit` FOREIGN KEY (`fileID`) REFERENCES `files` (`fileID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentIDSummit` FOREIGN KEY (`studentID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `topicIdSummit` FOREIGN KEY (`topicID`) REFERENCES `topics` (`topicID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submitions`
--

LOCK TABLES `submitions` WRITE;
/*!40000 ALTER TABLE `submitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `submitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topics` (
  `topicID` int NOT NULL AUTO_INCREMENT,
  `topicName` varchar(45) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `dateDeadline` datetime DEFAULT NULL,
  `fileAttachID` int DEFAULT NULL,
  `classID` varchar(45) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`topicID`),
  KEY `fileAttachID_idx` (`fileAttachID`),
  KEY `classIDofTopic_idx` (`classID`),
  CONSTRAINT `classIDofTopic` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fileAttachID` FOREIGN KEY (`fileAttachID`) REFERENCES `files` (`fileID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` varchar(45) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `password` char(32) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `birthday` date DEFAULT NULL,
  `roleID` int DEFAULT NULL,
  `listPermissionID` int DEFAULT NULL,
  `avatarFileID` int DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`),
  KEY `roleUser_idx` (`roleID`),
  KEY `listPermissionUser_idx` (`listPermissionID`),
  KEY `fileID_idx` (`avatarFileID`),
  CONSTRAINT `avatarUser` FOREIGN KEY (`avatarFileID`) REFERENCES `files` (`fileID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `listPermissionUser` FOREIGN KEY (`listPermissionID`) REFERENCES `listpermissions` (`listPermissionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleUser` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('gch18077','Ha Ngoc Linh','123456','linhhngch18077@fpt.edu.vn',NULL,NULL,NULL,NULL),('sch18099','Nguyen Thu Trang','123456','thutrangnguyen108@gmail.com ',NULL,NULL,NULL,NULL),('tch18088','Le Manh Hung','123456','harnet.linh@gmail.com',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'h2tdb'
--

--
-- Dumping routines for database 'h2tdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-30 11:48:20
