-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: carrent
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `cars` (
                      `ID` int(11) NOT NULL AUTO_INCREMENT,
                      `Marka` varchar(45) DEFAULT NULL,
                      `Number` varchar(45) DEFAULT NULL,
                      `Fullness` varchar(45) DEFAULT NULL,
                      `Transmission` varchar(45) DEFAULT NULL,
                      `Cost` double DEFAULT NULL,
                      `ImagePath` varchar(100) DEFAULT NULL,
                      PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'Fiat','2345AE-8','6','Automatic',123,'carLoad.jpg');
INSERT INTO `cars` VALUES (7,'Renault','3542WE-5','7','Automatic',128,'car2.jpg');
INSERT INTO `cars` VALUES (10,'Citroen','2651EE-3','4','Automatic',150,'car5.jpg');
INSERT INTO `cars` VALUES (11,'BMW','1387EA-2','5','Automatic',290,'car22.jpg');
INSERT INTO `cars` VALUES (12,'Opel','3467EE-3','6','Mechanic',260,'car222.jpg');
INSERT INTO `cars` VALUES (19,'Citroen','8932AD-7','7','Automatic',160,'carLoad.jpg');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rents`
--

DROP TABLE IF EXISTS `rents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `rents` (
                       `ID` int(11) NOT NULL AUTO_INCREMENT,
                       `IDuser` int(11) NOT NULL,
                       `IDcar` int(11) NOT NULL,
                       `DateStart` date DEFAULT NULL,
                       `DateEnd` date DEFAULT NULL,
                       `Status` varchar(45) DEFAULT NULL,
                       `Total` double DEFAULT NULL,
                       PRIMARY KEY (`ID`,`IDuser`,`IDcar`),
                       KEY `IDuser_idx` (`IDuser`),
                       KEY `IDcar_idx` (`IDcar`),
                       CONSTRAINT `IDcar` FOREIGN KEY (`IDcar`) REFERENCES `cars` (`ID`),
                       CONSTRAINT `IDuser` FOREIGN KEY (`IDuser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rents`
--

LOCK TABLES `rents` WRITE;
/*!40000 ALTER TABLE `rents` DISABLE KEYS */;
INSERT INTO `rents` VALUES (1,1,1,'2019-08-07','2020-08-07','Returned',567.9);
INSERT INTO `rents` VALUES (2,11,7,'2019-09-02','2019-09-17','Rent',987.2);
INSERT INTO `rents` VALUES (6,6,10,'2019-07-18','2019-07-27','Request',1350);
INSERT INTO `rents` VALUES (7,6,11,'2019-07-10','2019-07-26','Denied',4640);
INSERT INTO `rents` VALUES (8,11,7,'2019-07-18','2019-07-26','Request',1024);
/*!40000 ALTER TABLE `rents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
                       `id` int(11) NOT NULL AUTO_INCREMENT,
                       `name` varchar(100) NOT NULL,
                       PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER');
INSERT INTO `roles` VALUES (2,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `user_roles` (
                            `user_id` int(11) NOT NULL,
                            `role_id` int(11) NOT NULL,
                            UNIQUE KEY `user_id` (`user_id`,`role_id`),
                            KEY `role_id` (`role_id`),
                            CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                            CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (3,1);
INSERT INTO `user_roles` VALUES (4,1);
INSERT INTO `user_roles` VALUES (5,1);
INSERT INTO `user_roles` VALUES (6,1);
INSERT INTO `user_roles` VALUES (7,1);
INSERT INTO `user_roles` VALUES (8,1);
INSERT INTO `user_roles` VALUES (9,1);
INSERT INTO `user_roles` VALUES (10,1);
INSERT INTO `user_roles` VALUES (11,1);
INSERT INTO `user_roles` VALUES (1,2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
                       `id` int(11) NOT NULL AUTO_INCREMENT,
                       `username` varchar(255) NOT NULL,
                       `password` varchar(255) NOT NULL,
                       `firstname` varchar(45) NOT NULL,
                       `lastname` varchar(45) NOT NULL,
                       `birth` date NOT NULL,
                       `passport` varchar(45) NOT NULL,
                       PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'proselyte','$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG','Lyte','Prose','1998-03-10','KH67123');
INSERT INTO `users` VALUES (3,'dianaivanova','$2a$11$Z1DnKiKKnyiMbdTr05nc3.3cn47H3Rud8XbDaXHoEs62N3rV6u4za','Diana','Ivanova','1994-11-18','KH89034');
INSERT INTO `users` VALUES (4,'mariannapetrova','$2a$11$k4tyfNgzRPXuwmESMRkXWuqbuf8tG6xdFluh/BRxNlI45n5ac.guC','Marianna','Petrova','1999-05-08','KH12936');
INSERT INTO `users` VALUES (5,'olgauvarova','$2a$11$s/O1niFoE10Hc9F2.e9oAeVeN7Qg9JwA4pqd0HjimW8mDCGLnmo92','Olga','Uvarova','2000-07-22','KH76543');
INSERT INTO `users` VALUES (6,'paulinaandreeva','$2a$11$GTV2VLXwKfyTEeAyi8S8H.RJF85ya.ttRxTSAE/4CI4S0l.X0z5ym','Paulina','Andreeva','1992-04-20','KN65131');
INSERT INTO `users` VALUES (7,'evelinasokolova','$2a$11$IcRzAD9VNgCddHyFDlzIUeQiqnQjNKvV65aetpFjvNE1EVnYW9joa','Evelina','Sokolova','1996-10-23','KH91537');
INSERT INTO `users` VALUES (8,'elenaskvorcova','$2a$11$kC/4aS/WYjYk5xYHOgEu4.Tk3Gs3wpuNtKIFqEO/gqCNJ3iGXJSty','Elena','Skvorcova','1971-12-29','KN89315');
INSERT INTO `users` VALUES (9,'ivanovasvetlana','$2a$11$hSuMUniwn6yB9Fw/uXHXW.u4GQWYZ2jsslMJr7Qo/Wty3bUCLnb2W','Svetlana','Ivanova','1994-02-11','KH90342');
INSERT INTO `users` VALUES (10,'popovatatyna','$2a$11$TMgk.DUBqpv9Rt4A6eXEQeaE5hDsMHpbGW7UUoGcG66s71rFdzoZG','Tatyana','Popova','1993-11-29','KH76284');
INSERT INTO `users` VALUES (11,'MargaritaTotot','$2a$11$TG5GgJ5JDgHf8FGPYDCpU.aAxosOmClWbnLLtNlHC/TYiMcdnQXNW','Margarita','Totot','1999-08-07','KH89342');
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

-- Dump completed on 2019-07-04  9:26:00
