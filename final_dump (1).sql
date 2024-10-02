-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 172.16.7.85    Database: univer008_Grits_Grits
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `#director` int NOT NULL AUTO_INCREMENT,
  `dirname` varchar(25) NOT NULL,
  `facult` varchar(10) NOT NULL,
  PRIMARY KEY (`#director`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Гейбука','ИФМИТО'),(2,'Агавелян','ИД'),(3,'Архипова','ИМИСК'),(4,'Булыгина','ИФМИП');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `#employee` int NOT NULL AUTO_INCREMENT,
  `empname` varchar(25) NOT NULL,
  `director_#director` int NOT NULL,
  `post_postname` varchar(15) NOT NULL,
  PRIMARY KEY (`#employee`),
  KEY `fk_employee_director1_idx` (`director_#director`),
  KEY `fk_employee_post1_idx` (`post_postname`),
  CONSTRAINT `fk_employee_director1` FOREIGN KEY (`director_#director`) REFERENCES `director` (`#director`),
  CONSTRAINT `fk_employee_post1` FOREIGN KEY (`post_postname`) REFERENCES `post` (`postname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Наталья',1,'Доктор наук'),(2,'Дмитрий',2,'Доцент'),(3,'София',3,'Кандидант наук'),(4,'Елена',4,'Старший педагог');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_has_subject`
--

DROP TABLE IF EXISTS `employee_has_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_has_subject` (
  `employee_#employee` int NOT NULL,
  `subject_#subj` int NOT NULL,
  PRIMARY KEY (`employee_#employee`,`subject_#subj`),
  KEY `fk_employee_has_subject_subject1_idx` (`subject_#subj`),
  KEY `fk_employee_has_subject_employee1_idx` (`employee_#employee`),
  CONSTRAINT `fk_employee_has_subject_employee1` FOREIGN KEY (`employee_#employee`) REFERENCES `employee` (`#employee`),
  CONSTRAINT `fk_employee_has_subject_subject1` FOREIGN KEY (`subject_#subj`) REFERENCES `subject` (`#subj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_has_subject`
--

LOCK TABLES `employee_has_subject` WRITE;
/*!40000 ALTER TABLE `employee_has_subject` DISABLE KEYS */;
INSERT INTO `employee_has_subject` VALUES (4,1),(3,2),(2,3),(1,4);
/*!40000 ALTER TABLE `employee_has_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gruop`
--

DROP TABLE IF EXISTS `gruop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gruop` (
  `#gr` char(10) NOT NULL,
  `napr` mediumtext NOT NULL,
  `profil` mediumtext,
  PRIMARY KEY (`#gr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gruop`
--

LOCK TABLES `gruop` WRITE;
/*!40000 ALTER TABLE `gruop` DISABLE KEYS */;
INSERT INTO `gruop` VALUES ('3.001.1','ИСИТ','Овсайинт'),('3.002.2','ИСИТ','ИСИТВО'),('3.003.3','ПМиИ','АДиИС'),('3.004.4','БИ','АП');
/*!40000 ALTER TABLE `gruop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessontype`
--

DROP TABLE IF EXISTS `lessontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessontype` (
  `lessonname` varchar(12) NOT NULL,
  PRIMARY KEY (`lessonname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessontype`
--

LOCK TABLES `lessontype` WRITE;
/*!40000 ALTER TABLE `lessontype` DISABLE KEYS */;
INSERT INTO `lessontype` VALUES ('Лабораторная'),('Лекция'),('Практика');
/*!40000 ALTER TABLE `lessontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `postname` varchar(15) NOT NULL,
  PRIMARY KEY (`postname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('Доктор наук'),('Доцент'),('Кандидант наук'),('Старший педагог');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `#week` int NOT NULL,
  `day` char(3) NOT NULL,
  `gruop_#gr` char(10) NOT NULL,
  `subject_#subj` int NOT NULL,
  `lessontype_lessonname` varchar(12) NOT NULL,
  `#room` char(3) NOT NULL,
  PRIMARY KEY (`#week`,`day`,`gruop_#gr`,`subject_#subj`,`lessontype_lessonname`),
  KEY `fk_gruop_has_subject_subject1_idx` (`subject_#subj`),
  KEY `fk_gruop_has_subject_gruop1_idx` (`gruop_#gr`),
  KEY `fk_gruop_has_subject_lessontype1_idx` (`lessontype_lessonname`),
  CONSTRAINT `fk_gruop_has_subject_gruop1` FOREIGN KEY (`gruop_#gr`) REFERENCES `gruop` (`#gr`),
  CONSTRAINT `fk_gruop_has_subject_lessontype1` FOREIGN KEY (`lessontype_lessonname`) REFERENCES `lessontype` (`lessonname`),
  CONSTRAINT `fk_gruop_has_subject_subject1` FOREIGN KEY (`subject_#subj`) REFERENCES `subject` (`#subj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'Вт','3.002.2',1,'Практика','102'),(1,'Пн','3.003.3',2,'Лабораторная','101'),(1,'Пт','3.003.3',1,'Лекция','105'),(1,'Сб','3.001.1',2,'Практика','106'),(1,'Ср','3.001.1',3,'Лекция','103'),(1,'Чт','3.002.2',4,'Лабораторная','104'),(2,'Вт','3.004.4',2,'Лекция','108'),(2,'Пн','3.002.2',1,'Лекция','107'),(2,'Пт','3.003.3',1,'Лекция','105'),(2,'Сб','3.001.1',4,'Лекция','104'),(2,'Ср','3.001.1',3,'Практика','101'),(2,'Чт','3.004.4',4,'Лекция','102'),(3,'Вт','3.001.1',2,'Лекция','103'),(3,'Пн','3.004.4',1,'Практика','106'),(3,'Пт','3.001.1',1,'Лекция','110'),(3,'Сб','3.004.4',2,'Лекция','109'),(3,'Ср','3.002.2',3,'Лекция','105'),(3,'Чт','3.003.3',4,'Лекция','101'),(4,'Вт','3.001.1',4,'Практика','107'),(4,'Пн','3.003.3',3,'Практика','108');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `#stud` int NOT NULL AUTO_INCREMENT,
  `studname` varchar(25) NOT NULL,
  `director_#director` int NOT NULL,
  `gruop_#gr` char(10) DEFAULT NULL,
  PRIMARY KEY (`#stud`),
  KEY `fk_student_director_idx` (`director_#director`),
  KEY `fk_student_gruop1_idx` (`gruop_#gr`),
  CONSTRAINT `fk_student_director` FOREIGN KEY (`director_#director`) REFERENCES `director` (`#director`),
  CONSTRAINT `fk_student_gruop1` FOREIGN KEY (`gruop_#gr`) REFERENCES `gruop` (`#gr`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Бобовников',1,'3.003.3'),(2,'Попов',3,'3.001.1'),(3,'Сабуров',1,'3.003.3'),(4,'Ерохин',3,'3.001.1'),(5,'Иванов',2,'3.002.2'),(6,'Иванов',4,'3.004.4'),(7,'Бубнов',3,'3.001.1'),(8,'Севат',1,'3.003.3'),(9,'Гагарин',2,'3.002.2'),(10,'Лисица',4,'3.004.4'),(11,'Цегоев',1,'3.003.3'),(12,'Коев',3,'3.001.1'),(13,'Кокк',2,'3.002.2'),(14,'Штин',4,'3.004.4'),(15,'Уиллис',2,'3.002.2'),(16,'Зимин',4,'3.004.4');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `#subj` int NOT NULL AUTO_INCREMENT,
  `subjname` varchar(85) NOT NULL,
  `subjinfo` mediumtext,
  PRIMARY KEY (`#subj`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Алгебра','Считать цифры'),(2,'Геометрия','Читать графики'),(3,'Русский','Учить орфографию'),(4,'Изо','Учить Рисовать');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vedomost`
--

DROP TABLE IF EXISTS `vedomost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vedomost` (
  `date` date NOT NULL,
  `student_#stud` int NOT NULL,
  `employee_#employee` int NOT NULL,
  `subject_#subj` int NOT NULL,
  `mark` varchar(14) NOT NULL,
  PRIMARY KEY (`date`,`student_#stud`,`employee_#employee`,`subject_#subj`),
  KEY `fk_student_has_employee_employee1_idx` (`employee_#employee`),
  KEY `fk_student_has_employee_student1_idx` (`student_#stud`),
  KEY `fk_student_has_employee_subject1_idx` (`subject_#subj`),
  CONSTRAINT `fk_student_has_employee_employee1` FOREIGN KEY (`employee_#employee`) REFERENCES `employee` (`#employee`),
  CONSTRAINT `fk_student_has_employee_student1` FOREIGN KEY (`student_#stud`) REFERENCES `student` (`#stud`),
  CONSTRAINT `fk_student_has_employee_subject1` FOREIGN KEY (`subject_#subj`) REFERENCES `subject` (`#subj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vedomost`
--

LOCK TABLES `vedomost` WRITE;
/*!40000 ALTER TABLE `vedomost` DISABLE KEYS */;
INSERT INTO `vedomost` VALUES ('2024-09-12',1,2,4,'Зачтено'),('2024-09-12',1,3,4,'Зачтено'),('2024-09-12',2,4,4,'Зачтено'),('2024-09-12',11,1,3,'Зачтено'),('2024-09-12',12,3,1,'Не зачтено'),('2024-09-12',12,4,4,'Зачтено'),('2024-09-12',14,2,2,'Зачтено'),('2024-09-15',5,2,4,'Не зачтено'),('2024-09-22',6,2,4,'Зачтено');
/*!40000 ALTER TABLE `vedomost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-02 13:21:19
