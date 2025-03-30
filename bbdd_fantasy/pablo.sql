-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: spfantasydb
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contraofertas`
--

DROP TABLE IF EXISTS `contraofertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contraofertas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oferta_original_id` bigint(20) NOT NULL,
  `jugador_id` bigint(20) NOT NULL,
  `comprador_id` bigint(20) NOT NULL,
  `vendedor_id` bigint(20) NOT NULL,
  `monto_oferta` decimal(10,2) NOT NULL,
  `estado` enum('PENDIENTE','ACEPTADA','RECHAZADA') DEFAULT 'PENDIENTE',
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `oferta_original_id` (`oferta_original_id`),
  CONSTRAINT `contraofertas_ibfk_1` FOREIGN KEY (`oferta_original_id`) REFERENCES `ofertas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contraofertas`
--

LOCK TABLES `contraofertas` WRITE;
/*!40000 ALTER TABLE `contraofertas` DISABLE KEYS */;
/*!40000 ALTER TABLE `contraofertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Los Angeles','Lakers'),(2,'Chicago','Bulls'),(3,'Boston','Celtics');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos_chat`
--

DROP TABLE IF EXISTS `grupos_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos_chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `password_grupo` varchar(255) DEFAULT NULL,
  `creador_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `UKeqfgxwkjtxvj4abpetk62a2uh` (`nombre`),
  KEY `creador_id` (`creador_id`),
  CONSTRAINT `FKjfl36ww6c87ko4foufj1x7l4q` FOREIGN KEY (`creador_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `grupos_chat_ibfk_1` FOREIGN KEY (`creador_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos_chat`
--

LOCK TABLES `grupos_chat` WRITE;
/*!40000 ALTER TABLE `grupos_chat` DISABLE KEYS */;
INSERT INTO `grupos_chat` VALUES (4,'qweqeqw','eqeqweqwe','qwewqweqe',1),(5,'pepe','fwefwefw','1234',11);
/*!40000 ALTER TABLE `grupos_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `posicion` varchar(255) DEFAULT NULL,
  `equipo_id` bigint(20) NOT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `rendimiento` decimal(5,2) DEFAULT NULL,
  `puntos_totales` int(11) NOT NULL DEFAULT 0,
  `foto_url` varchar(255) NOT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT 1,
  `es_titular` tinyint(1) NOT NULL DEFAULT 1,
  `Pts` int(11) DEFAULT 0,
  `Min` int(11) DEFAULT 0,
  `TL` int(11) DEFAULT 0,
  `T2` int(11) DEFAULT 0,
  `T3` int(11) DEFAULT 0,
  `Fp` int(11) DEFAULT 0,
  `propietario_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpgvjfh3sggymha61n8qjoic5t` (`equipo_id`),
  KEY `fk_propietario` (`propietario_id`),
  CONSTRAINT `FKpgvjfh3sggymha61n8qjoic5t` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`),
  CONSTRAINT `fk_propietario` FOREIGN KEY (`propietario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'Miguel Martinez Gutierrez','Base',1,1000000.00,95.00,2500,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741516119/11_i52pdu.jpg',0,1,22,19,1,6,7,0,1),(2,'Hector San Miguel Gonzalez','Pivot',1,1200000.00,94.50,2400,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515977/5_zxy3fr.jpg',1,0,24,22,3,13,5,4,NULL),(3,'Pablo Martinez Fernandez','Ala-Pivot',1,1100000.00,96.20,2600,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515977/4_kbreqh.jpg',0,1,27,37,9,12,4,2,1),(4,'Pablo Elizalde Roldan','Alero',1,1250000.00,97.50,2700,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515976/3_xiy42d.jpg',0,0,6,27,7,10,3,1,1),(5,'Daniel Puente Fernandez','Base',1,1300000.00,98.00,2800,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515976/2_yqwmus.jpg',0,1,0,37,6,7,5,1,11),(6,'Ricardo Eduardo Fraguas Bringas','Pivot',1,950000.00,90.50,2000,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515977/1_ak2xhy.jpg',0,1,1,4,4,1,0,4,1),(7,'Samuel Cuerno Fernandez','Base',1,950000.00,90.50,2000,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515977/7_vwgdqz.jpg',0,1,11,10,1,13,0,3,11),(8,'Hugo Michelena Garcia','Pivot',1,950000.00,90.50,2000,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515978/8_airguv.jpg',0,1,0,4,5,2,4,4,1),(9,'Juan Verde Merayo','Escolta',1,950000.00,90.50,2000,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515977/9_iqgpoi.jpg',0,1,17,22,0,7,4,3,1),(10,'Jose Pacho Ubis','Escolta',1,950000.00,90.50,2000,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515978/10_qmxecl.jpg',0,0,12,34,0,6,2,4,1),(11,'Hugo Piñeiro Cotera','Alero',1,950000.00,90.50,2000,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515978/11_jstk5p.jpg',0,0,11,19,2,11,9,3,1),(12,'Mario Alvarez Perez','Ala-Pivot',1,950000.00,90.50,2000,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515978/13_j0lvct.jpg',0,1,20,9,0,11,5,1,11),(13,'Ignacio Zalba Iriarte','Pivot',1,950000.00,90.50,2000,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515979/14_thg71u.jpg',1,0,1,11,2,5,0,1,NULL),(14,'Rodrigo Oxinalde Perez','Ala-Pivot',1,950000.00,90.50,2000,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515979/15_qkwpit.jpg',0,0,2,23,7,1,0,1,1),(15,'Pablo Gonzalez Cruz','Alero',1,950000.00,90.50,2000,'https://res.cloudinary.com/dkyitqoor/image/upload/v1741515979/16_w7riyc.jpg',0,1,22,7,6,7,8,2,11);
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores_liga`
--

DROP TABLE IF EXISTS `jugadores_liga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores_liga` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jugador_base_id` bigint(20) NOT NULL,
  `liga_id` bigint(20) NOT NULL,
  `propietario_id` bigint(20) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT 1,
  `es_titular` tinyint(1) DEFAULT 1,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `puntos_totales` int(11) DEFAULT NULL,
  `pts` int(11) DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `tl` int(11) DEFAULT NULL,
  `t2` int(11) DEFAULT NULL,
  `t3` int(11) DEFAULT NULL,
  `fp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jugador_base_id` (`jugador_base_id`),
  KEY `liga_id` (`liga_id`),
  KEY `propietario_id` (`propietario_id`),
  CONSTRAINT `jugadores_liga_ibfk_1` FOREIGN KEY (`jugador_base_id`) REFERENCES `jugadores` (`id`),
  CONSTRAINT `jugadores_liga_ibfk_2` FOREIGN KEY (`liga_id`) REFERENCES `ligas` (`id`),
  CONSTRAINT `jugadores_liga_ibfk_3` FOREIGN KEY (`propietario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores_liga`
--

LOCK TABLES `jugadores_liga` WRITE;
/*!40000 ALTER TABLE `jugadores_liga` DISABLE KEYS */;
INSERT INTO `jugadores_liga` VALUES (1,1,1,11,0,0,1000000.00,2500,22,19,1,6,7,0),(2,2,1,12,0,0,1200000.00,2400,24,22,3,13,5,4),(3,3,1,12,0,0,1100000.00,2600,27,37,9,12,4,2),(4,4,1,11,0,0,1250000.00,2700,6,27,7,10,3,1),(5,5,1,12,0,0,1300000.00,2800,0,37,6,7,5,1),(6,6,1,11,0,0,950000.00,2000,1,4,4,1,0,4),(7,7,1,11,0,0,950000.00,2000,11,10,1,13,0,3),(8,8,1,11,0,0,950000.00,2000,0,4,5,2,4,4),(9,9,1,11,0,0,950000.00,2000,17,22,0,7,4,3),(10,10,1,12,0,0,950000.00,2000,12,34,0,6,2,4),(11,11,1,11,0,0,950000.00,2000,11,19,2,11,9,3),(12,12,1,11,0,0,950000.00,2000,20,9,0,11,5,1),(13,13,1,11,0,0,950000.00,2000,1,11,2,5,0,1),(14,14,1,11,0,0,950000.00,2000,2,23,7,1,0,1),(15,15,1,12,0,0,950000.00,2000,22,7,6,7,8,2);
/*!40000 ALTER TABLE `jugadores_liga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligas`
--

DROP TABLE IF EXISTS `ligas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ligas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `codigo_invitacion` varchar(255) NOT NULL,
  `creador_id` bigint(20) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `iniciada` tinyint(1) DEFAULT 0,
  `max_participantes` int(11) DEFAULT 10,
  `contrasena` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_invitacion` (`codigo_invitacion`),
  KEY `creador_id` (`creador_id`),
  CONSTRAINT `ligas_ibfk_1` FOREIGN KEY (`creador_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligas`
--

LOCK TABLES `ligas` WRITE;
/*!40000 ALTER TABLE `ligas` DISABLE KEYS */;
INSERT INTO `ligas` VALUES (1,'Liga de Prueba','ABC123',1,'2025-03-30 18:39:07',0,15,'secreta123');
/*!40000 ALTER TABLE `ligas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `destinatario_id` bigint(20) DEFAULT NULL,
  `grupo_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `remitente_id` bigint(20) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `contenido` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3g336a9ui7web8l7t133q1k5s` (`destinatario_id`),
  KEY `FKnv816anhr4nhpaxta9ij39hq1` (`grupo_id`),
  KEY `FKlfsfnt3bahk64b9mjwy04eqx4` (`remitente_id`),
  CONSTRAINT `FK3g336a9ui7web8l7t133q1k5s` FOREIGN KEY (`destinatario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKlfsfnt3bahk64b9mjwy04eqx4` FOREIGN KEY (`remitente_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKnv816anhr4nhpaxta9ij39hq1` FOREIGN KEY (`grupo_id`) REFERENCES `grupos_chat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` VALUES (11,NULL,195,1,'2025-03-26 18:20:09.387148','hola admin'),(12,NULL,196,1,'2025-03-26 18:20:15.434263','que tal admin'),(12,NULL,197,1,'2025-03-26 18:23:47.976222','hola user'),(12,NULL,198,1,'2025-03-26 18:28:23.260446','hola'),(11,NULL,199,1,'2025-03-26 18:29:39.851839','hola'),(11,NULL,200,1,'2025-03-26 18:31:06.115578','hola admin'),(11,NULL,201,1,'2025-03-26 18:32:19.164045','hola'),(12,NULL,202,1,'2025-03-26 18:32:27.745791','hola'),(11,NULL,203,1,'2025-03-26 18:34:29.257105','hola'),(1,NULL,204,11,'2025-03-26 18:34:54.368682','hola que tal'),(1,NULL,205,11,'2025-03-26 18:35:46.441379','estas bvien?'),(11,NULL,206,1,'2025-03-26 18:36:07.656146','si claro'),(1,NULL,207,11,'2025-03-26 18:38:04.966705','ah bueno'),(11,NULL,208,1,'2025-03-26 18:40:45.836781','todo bien?'),(NULL,4,209,1,'2025-03-26 18:41:06.932572','heyy'),(NULL,4,210,1,'2025-03-26 18:41:09.396316','que tal'),(11,NULL,211,1,'2025-03-26 18:44:30.826310','hola'),(1,NULL,212,11,'2025-03-27 13:17:00.977103','hola pablo'),(NULL,4,213,11,'2025-03-27 13:17:31.111899','hola gente'),(NULL,5,214,11,'2025-03-27 13:17:54.432326','hola gente'),(NULL,5,215,11,'2025-03-27 13:18:08.767396','hola gente'),(NULL,4,216,11,'2025-03-27 13:18:16.200628','hola'),(NULL,4,217,11,'2025-03-27 13:24:35.539193','hola que tal'),(NULL,4,218,11,'2025-03-27 13:24:44.955273','he vuelto a escribir'),(NULL,4,219,1,'2025-03-27 13:36:23.516070','hola'),(NULL,4,220,1,'2025-03-27 13:36:24.619646','gwr'),(NULL,4,221,1,'2025-03-27 13:36:24.947872','wfgee'),(NULL,5,222,1,'2025-03-27 13:47:15.228022','hola que tal'),(NULL,5,223,1,'2025-03-27 14:02:32.129649','hola grupo desde Pablo'),(NULL,4,224,11,'2025-03-27 14:11:42.955466','hola gente del grupo'),(NULL,4,225,11,'2025-03-27 14:23:18.540601','hola gente soy aDMIN ESTA ES PRUEBA 1000'),(11,NULL,226,1,'2025-03-27 14:56:06.614183','hola'),(11,NULL,227,1,'2025-03-27 15:04:01.352220','hola admin'),(NULL,5,228,1,'2025-03-27 15:04:04.678650','hebqwfbu9w'),(1,NULL,229,11,'2025-03-27 15:59:34.113921','eqweq'),(1,NULL,230,11,'2025-03-27 15:59:34.859225','eqwewqwqe'),(1,NULL,231,11,'2025-03-27 15:59:35.023162','qw'),(1,NULL,232,11,'2025-03-27 15:59:35.182911','eqwe'),(1,NULL,233,11,'2025-03-27 15:59:35.343005','wqwe'),(1,NULL,234,11,'2025-03-27 15:59:35.495244','qqwe'),(1,NULL,235,11,'2025-03-27 15:59:35.642437','qwe'),(1,NULL,236,11,'2025-03-27 15:59:35.782776','qw'),(1,NULL,237,11,'2025-03-27 15:59:35.906534','qwe'),(1,NULL,238,11,'2025-03-27 15:59:41.913518','gvefwfwefw'),(1,NULL,239,11,'2025-03-27 15:59:42.059124','wf'),(1,NULL,240,11,'2025-03-27 15:59:42.183171','w'),(1,NULL,241,11,'2025-03-27 15:59:42.320319','few'),(1,NULL,242,11,'2025-03-27 15:59:42.442216','wfee'),(1,NULL,243,11,'2025-03-27 15:59:42.561201','wff'),(1,NULL,244,11,'2025-03-27 15:59:43.753551','weef'),(1,NULL,245,11,'2025-03-27 15:59:43.921794','wef'),(1,NULL,246,11,'2025-03-27 15:59:44.063020','ew'),(1,NULL,247,11,'2025-03-27 15:59:44.191200','few'),(1,NULL,248,11,'2025-03-27 15:59:44.321152','we'),(12,NULL,249,11,'2025-03-27 16:01:05.408944','eqwewq'),(12,NULL,250,11,'2025-03-27 16:01:06.001263','qeqw'),(12,NULL,251,11,'2025-03-27 16:01:06.264012','ewqeqw'),(12,NULL,252,11,'2025-03-27 16:01:06.470772','ewqe'),(12,NULL,253,11,'2025-03-27 16:01:06.621953','wqe'),(12,NULL,254,11,'2025-03-27 16:01:06.784802','wqe'),(12,NULL,255,11,'2025-03-27 16:01:06.937420','qwe'),(12,NULL,256,11,'2025-03-27 16:01:07.085736','wqe'),(12,NULL,257,11,'2025-03-27 16:01:07.240490','wqewqe'),(12,NULL,258,11,'2025-03-27 16:01:07.402354','qe'),(12,NULL,259,11,'2025-03-27 16:01:07.560437','qe'),(12,NULL,260,11,'2025-03-27 16:01:07.736712','qe'),(12,NULL,261,11,'2025-03-27 16:01:07.910584','qe'),(12,NULL,262,11,'2025-03-27 16:01:08.085712','qeq'),(12,NULL,263,11,'2025-03-27 16:01:08.236673','eq'),(12,NULL,264,11,'2025-03-27 16:01:08.390176','eq'),(12,NULL,265,11,'2025-03-27 16:01:08.551366','eq'),(12,NULL,266,11,'2025-03-27 16:01:08.702967','ewq'),(12,NULL,267,11,'2025-03-27 16:01:08.880329','ewqw'),(12,NULL,268,11,'2025-03-27 16:01:09.040262','eqw'),(12,NULL,269,11,'2025-03-27 16:01:16.776175','eqe'),(NULL,4,270,11,'2025-03-27 16:04:53.446783','eqeqw'),(NULL,5,271,11,'2025-03-27 16:07:17.972788','wewedqwdqw'),(NULL,5,272,11,'2025-03-27 16:07:18.137860','qw'),(NULL,5,273,11,'2025-03-27 16:07:18.276261','dq'),(NULL,5,274,11,'2025-03-27 16:07:18.409834','wdqw'),(NULL,5,275,11,'2025-03-27 16:07:18.537926','dqw'),(NULL,5,276,11,'2025-03-27 16:07:18.666312','dq'),(NULL,4,277,11,'2025-03-28 11:00:23.966294','hola'),(NULL,4,278,11,'2025-03-28 11:00:25.574123','gwegw'),(NULL,4,279,11,'2025-03-28 11:00:26.996247','wgegw'),(NULL,4,280,1,'2025-03-28 11:00:45.307866','qeqwewqe'),(NULL,4,281,1,'2025-03-28 11:00:45.683513','eqw'),(NULL,4,282,1,'2025-03-28 11:00:46.076409','eqwewqeqw'),(NULL,5,283,1,'2025-03-28 11:00:51.579923','eqw'),(NULL,5,284,1,'2025-03-28 11:00:52.579271','qweq'),(NULL,4,285,1,'2025-03-28 11:00:57.749732','ee'),(11,NULL,286,1,'2025-03-28 11:01:04.443341','hola admin'),(NULL,5,287,1,'2025-03-28 11:18:08.506383','hola'),(NULL,4,288,1,'2025-03-28 11:18:14.946878','eqeqweq'),(NULL,4,289,1,'2025-03-28 11:18:16.646657','qweq'),(11,NULL,290,1,'2025-03-28 11:18:39.137845','hola admin que tal');
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticias` (
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contenido` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
INSERT INTO `noticias` VALUES (NULL,1,'liyltkurgtuioñiudg','tfurk'),(NULL,2,'qweq','eqeqweq');
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofertas`
--

DROP TABLE IF EXISTS `ofertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofertas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jugador_id` bigint(20) NOT NULL,
  `comprador_id` bigint(20) NOT NULL,
  `vendedor_id` bigint(20) NOT NULL,
  `monto_oferta` decimal(10,2) NOT NULL,
  `estado` enum('PENDIENTE','ACEPTADA','RECHAZADA','CONTRAOFERTA') DEFAULT 'PENDIENTE',
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `leida_por_vendedor` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `jugador_id` (`jugador_id`),
  KEY `comprador_id` (`comprador_id`),
  KEY `vendedor_id` (`vendedor_id`),
  CONSTRAINT `ofertas_ibfk_1` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ofertas_ibfk_2` FOREIGN KEY (`comprador_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ofertas_ibfk_3` FOREIGN KEY (`vendedor_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofertas`
--

LOCK TABLES `ofertas` WRITE;
/*!40000 ALTER TABLE `ofertas` DISABLE KEYS */;
INSERT INTO `ofertas` VALUES (53,1,12,1,1111.00,'PENDIENTE','2025-03-28 19:49:23',0);
/*!40000 ALTER TABLE `ofertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plantilla_jugadores`
--

DROP TABLE IF EXISTS `plantilla_jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plantilla_jugadores` (
  `jugador_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  KEY `FKlgfth7jj1kkyqrj7i0h3ky52f` (`jugador_id`),
  KEY `FK72lc7ohrjs3mxlw0mcm41kach` (`usuario_id`),
  CONSTRAINT `FK72lc7ohrjs3mxlw0mcm41kach` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKlgfth7jj1kkyqrj7i0h3ky52f` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantilla_jugadores`
--

LOCK TABLES `plantilla_jugadores` WRITE;
/*!40000 ALTER TABLE `plantilla_jugadores` DISABLE KEYS */;
INSERT INTO `plantilla_jugadores` VALUES (6,1),(3,1),(1,1),(8,1),(9,1),(10,1),(11,1),(14,1),(4,1),(2,12),(15,11),(12,11),(3,11),(5,11),(7,11);
/*!40000 ALTER TABLE `plantilla_jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','usuario','vip') NOT NULL DEFAULT 'usuario',
  `dinero` decimal(10,2) NOT NULL DEFAULT 10000.00,
  `puntos` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `UKkfsp0s1tflm1cwlj8idhqsad0` (`email`),
  UNIQUE KEY `UKm2dvbwfge291euvmk6vkkocao` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'pablo','pablo@example.com','$2a$10$0XiYy7At11YPEDjRf6JyPuOjcUB9bTlEgYW/8jZrA/nZxxF7GV/RC','usuario',5061311.00,0),(11,'admin','admin@email.com','$2b$12$fUrYZKrDmgmOgmgnE5zRyeFkZBqDlCYVJGdizCcgmrrriBoqkn0lW','admin',43950000.00,11),(12,'user','user@gmail.com','$2a$10$nXbOg.6J34.tEDnf50kQUuIR4zhFD.q75.ICyfaMOP.ITtwL6FTny','usuario',7776667.00,0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_grupos`
--

DROP TABLE IF EXISTS `usuarios_grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_grupos` (
  `grupo_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  PRIMARY KEY (`grupo_id`,`usuario_id`),
  KEY `FKm3qhj4o3gwf1l0qub0kddvldd` (`usuario_id`),
  CONSTRAINT `FKm3qhj4o3gwf1l0qub0kddvldd` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKrhqfmagypochpkrg8pb8foaf` FOREIGN KEY (`grupo_id`) REFERENCES `grupos_chat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_grupos`
--

LOCK TABLES `usuarios_grupos` WRITE;
/*!40000 ALTER TABLE `usuarios_grupos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_liga`
--

DROP TABLE IF EXISTS `usuarios_liga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_liga` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `liga_id` bigint(20) NOT NULL,
  `fecha_union` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`,`liga_id`),
  KEY `liga_id` (`liga_id`),
  CONSTRAINT `usuarios_liga_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `usuarios_liga_ibfk_2` FOREIGN KEY (`liga_id`) REFERENCES `ligas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_liga`
--

LOCK TABLES `usuarios_liga` WRITE;
/*!40000 ALTER TABLE `usuarios_liga` DISABLE KEYS */;
INSERT INTO `usuarios_liga` VALUES (1,1,1,'2025-03-30 16:39:07'),(8,11,1,'2025-03-30 17:10:55'),(9,12,1,'2025-03-30 17:11:21');
/*!40000 ALTER TABLE `usuarios_liga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'spfantasydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-30 21:47:14
