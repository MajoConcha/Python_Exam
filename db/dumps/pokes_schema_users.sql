CREATE DATABASE  IF NOT EXISTS `pokes_schema` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pokes_schema`;
-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: pokes_schema
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(1024) NOT NULL,
  `dob` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Oliver Rosales','Oliver','joliver@email.com','$2b$12$zq31uFqBYy16OnHQQRhtM.UnBPpvV04NchwGLVLF8VnkiVDfT37kG','1990-03-13','2023-03-13 20:11:22','2023-03-13 20:11:22'),(2,'Diane Sue','Diane','dsue@email.com','$2b$12$CL0qCLUAUwq4WATpqTR5wO0mgMukg4IbLISc45aG33hq5O2JO/6/O','2000-12-06','2023-03-13 20:13:00','2023-03-13 20:13:00'),(3,'Jerry Tonel','Jerry','jtonel@email.com','$2b$12$guHV551Nc4AjB3PwQozq3u0xz7aQ00N6CxR/39xN8Oo5XFxUwVXOO','1984-02-28','2023-03-13 20:13:59','2023-03-13 20:13:59'),(5,'Olivia Winters','Livy','owinters@email.com','$2b$12$7qZTgaPm9fLRREU4W7r2UOKV3tNmsbQzaUJ76LQckl/bugjf3yqeu','1995-05-28','2023-03-13 20:18:54','2023-03-13 20:18:54'),(6,'Maria Concha','Majo','mconcha@email.com','$2b$12$o0poeJhBVyxlU6irzZH1xeajqFXpUNAnACB8UqLKhERR0jWNq5.1i','1987-11-25','2023-03-13 20:19:47','2023-03-13 20:19:47'),(7,'Jorge Gonzales','Koke','jgonzalez@email.com','$2b$12$pc37N/qe/uX/Yi2BNadSDunNkjjppdOtOYAPWmfJKF0a4Lp1PZuBK','1985-07-14','2023-03-13 20:20:32','2023-03-13 20:20:32'),(8,'Samuel Valdes','Samu','svaldea@email.com','$2b$12$napnkj20em3ugoe8i36r6eeGMUg.oh3lSud0PvDQP1kEURRJnkbWi','1980-10-09','2023-03-13 20:21:47','2023-03-13 20:21:47'),(9,'Neil Sanders','Neil','nsanders@email.com','$2b$12$ex/al9K/XmWyentafO7owue0MGt3P8WvmBa53Jobzdg3mT86dZ7bm','1988-09-12','2023-03-13 20:23:00','2023-03-13 20:23:00'),(10,'Daniel Ulloa','Dani','dulloa@email.com','$2b$12$cFZbd8OzEiSAKN307ZAUVePuDxYQHriwjjDDQJgZE1phiUnEPnsVq','1995-06-06','2023-03-13 20:24:06','2023-03-13 20:24:06'),(11,'Paul Smith','Paul','psmith@email.com','$2b$12$D/2k5lF/EZdplTV7CBjmL.EB/WUsbVhk08EqJosySVsaGAnfgrFC6','1994-03-14','2023-03-14 01:02:27','2023-03-14 01:02:27'),(12,'Claudia Marin','Clau','cmarin@email.com','$2b$12$F2YNlbbl/YO/nlEAOGqxhe5a9gIoJjXlGN4QTTZV5WvMhOLS.ZEPu','1998-12-03','2023-03-14 11:59:26','2023-03-14 11:59:26');
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

-- Dump completed on 2023-03-14 12:02:24
