-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: enacal_app
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `averias`
--

DROP TABLE IF EXISTS `averias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `averias` (
  `id_averia` int NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(100) DEFAULT NULL,
  `tipo_averia` enum('Agua Potable','Aguas Negras') NOT NULL,
  `id_departamento` int DEFAULT NULL,
  `id_municipio` int DEFAULT NULL,
  `id_distrito` int DEFAULT NULL,
  `comarca` varchar(150) DEFAULT NULL,
  `barrio` varchar(150) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `latitud` decimal(10,6) DEFAULT NULL,
  `longitud` decimal(10,6) DEFAULT NULL,
  `evidencia` varchar(255) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_averia`),
  KEY `id_distrito` (`id_distrito`),
  KEY `averias_ibfk_1` (`id_departamento`),
  KEY `averias_ibfk_2` (`id_municipio`),
  CONSTRAINT `averias_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`),
  CONSTRAINT `averias_ibfk_2` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`),
  CONSTRAINT `averias_ibfk_3` FOREIGN KEY (`id_distrito`) REFERENCES `distritos` (`id_distrito`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `averias`
--

LOCK TABLES `averias` WRITE;
/*!40000 ALTER TABLE `averias` DISABLE KEYS */;
INSERT INTO `averias` VALUES (1,NULL,'Agua Potable',12,93,4,'','prueba','prueba',NULL,NULL,'3e575d8524beaba51789c1736fb89d9d,2b63aaa7e8b505f9c0aba4f376df6acf','2025-09-23 05:28:31'),(2,NULL,'Agua Potable',2,8,NULL,'prueba','prueba','prueba',NULL,NULL,'bd375a62f9548879b1bdc2abf49cd55e,c8b483903bba99bd25958bed40f93435','2025-09-23 05:53:11'),(3,NULL,'Agua Potable',12,93,4,'','Prueba','Prueba',NULL,NULL,'9e2c19daccc4915776e63aaac32c2313','2025-09-23 06:03:57'),(4,NULL,'Agua Potable',1,5,NULL,'prueba','prueba','prueba',NULL,NULL,'8418933dd7ca3bd30b6f5c2707d33e80','2025-09-23 06:06:05'),(5,NULL,'Agua Potable',1,5,NULL,'prueba','prueba','prueba',NULL,NULL,'e91a7378d8d30641f1717f63d7231733','2025-09-23 06:09:36'),(6,NULL,'Agua Potable',1,2,NULL,'[object HTMLInputElement]','[object HTMLInputElement]','[object HTMLTextAreaElement]',NULL,NULL,NULL,'2025-09-23 06:16:08'),(7,NULL,'Agua Potable',3,17,NULL,'[object HTMLInputElement]','[object HTMLInputElement]','[object HTMLTextAreaElement]',NULL,NULL,NULL,'2025-09-23 06:18:45'),(8,NULL,'Agua Potable',3,17,NULL,'[object HTMLInputElement]','[object HTMLInputElement]','[object HTMLTextAreaElement]',NULL,NULL,NULL,'2025-09-23 06:20:03'),(9,NULL,'Agua Potable',5,40,NULL,'d','d','s',NULL,NULL,NULL,'2025-09-23 06:20:28'),(10,NULL,'Agua Potable',12,92,NULL,'jhjvj','jhkj','jhbjh',NULL,NULL,'78d05042ad93f6c9bbd64d9b0fcce40b,abb191c3d5fcfffe38b6ac55f8e1315d','2025-09-23 18:51:54'),(11,NULL,'Agua Potable',12,93,4,'','djflskjfv','dscnlszkjdnk',NULL,NULL,NULL,'2025-09-27 17:09:36'),(12,NULL,'Agua Potable',12,93,4,'','prueba','prueba',NULL,NULL,NULL,'2025-09-28 21:38:41'),(13,NULL,'Agua Potable',12,93,4,'','Prueba prueba','prueba prueba',NULL,NULL,NULL,'2025-09-28 21:59:43'),(14,NULL,'Agua Potable',12,93,4,'','prueba prueba prueba','prueba prueba prueba',NULL,NULL,NULL,'2025-09-28 22:04:29'),(15,NULL,'Agua Potable',12,93,4,'','ququququququ','uwuwuwuwuwuwuw',NULL,NULL,NULL,'2025-09-28 22:36:42'),(16,NULL,'Agua Potable',12,93,4,'','fkwhflwehrflewr','kwrhfewrglewgrblkwrhtow',NULL,NULL,'fac813cc868174976a44a662d0cdfe79,0c0a56e1a1ccfe9dcb267687881aba98','2025-09-28 22:37:58'),(17,NULL,'Agua Potable',3,17,NULL,'ueueueueueue','jjfjfjfjfjf','yeydyhfrnrjdifd',NULL,NULL,NULL,'2025-10-01 04:08:02'),(18,NULL,'Aguas Negras',NULL,NULL,NULL,NULL,NULL,'jfjfjfjdjdjdjdjdjsjsjs',12.144515,-86.236782,NULL,'2025-10-01 04:41:18'),(19,NULL,'Agua Potable',12,93,4,'','Prueba','Prueba',NULL,NULL,NULL,'2025-10-01 05:24:15'),(20,NULL,'Agua Potable',NULL,NULL,NULL,NULL,NULL,'Prueba',12.143999,-86.236711,NULL,'2025-10-01 05:25:21'),(21,NULL,'Agua Potable',NULL,NULL,NULL,NULL,NULL,'kkkkk',12.141207,-86.307418,NULL,'2025-10-01 19:05:56'),(22,NULL,'Agua Potable',12,93,4,'','Colonia Maestro Gabriel','colonia prueba 01/10/2025',NULL,NULL,'557634ccdd67733c260eedc5cd0920c0,123b791d7b0fd92d0b2a127a6e6cf248,b8640720e31bc079aae677b7b966a5b1,18a40f26695addc2b7a003cf051aed1e,73c6b52ef2e9ed37691efca50344a6b3,086ffcc64423003f5e172f05d905bbbe','2025-10-02 02:42:44'),(23,NULL,'Agua Potable',4,30,NULL,'prueba2','prueba','no se',NULL,NULL,'8980324ed2fd814355755f2735f7011a,cacc5de6b727a34e033c2cbaf271586d','2025-10-02 03:02:41'),(24,NULL,'Aguas Negras',NULL,NULL,NULL,NULL,NULL,'ahorita',12.144151,-86.236799,NULL,'2025-10-02 03:06:06'),(25,NULL,'Agua Potable',12,93,1,'','mhgjh',',jhhk',NULL,NULL,NULL,'2025-10-04 17:16:59'),(26,NULL,'Agua Potable',NULL,NULL,NULL,NULL,NULL,'',12.125219,-86.271558,NULL,'2025-10-04 17:17:47'),(27,NULL,'Agua Potable',NULL,NULL,NULL,NULL,NULL,'',12.125227,-86.271548,NULL,'2025-10-11 17:54:40'),(28,NULL,'Agua Potable',2,7,NULL,'Otra Prueba','Probando','Prueba',NULL,NULL,NULL,'2025-10-15 04:00:32'),(29,NULL,'Agua Potable',4,29,NULL,'wwwwwww','wwwww','wwwwwwwww',NULL,NULL,NULL,'2025-10-15 04:04:09'),(30,NULL,'Agua Potable',9,65,NULL,'oooooo','ooooo','ooooooo',NULL,NULL,NULL,'2025-10-15 04:21:26'),(31,'null','Agua Potable',6,46,NULL,'iouiyu','iouiyu','iouiyu',NULL,NULL,NULL,'2025-10-15 04:35:33'),(32,'null','Agua Potable',11,83,NULL,'qwe','wer','ert',NULL,NULL,NULL,'2025-10-15 04:41:30'),(33,'1','Agua Potable',1,5,NULL,'eutvj','kjhgf','jndjcue8ch',NULL,NULL,NULL,'2025-10-15 05:04:34'),(34,NULL,'Aguas Negras',NULL,NULL,NULL,NULL,NULL,'poojgfdr',12.144248,-86.236652,NULL,'2025-10-15 05:13:03'),(35,NULL,'Aguas Negras',NULL,NULL,NULL,NULL,NULL,'',12.144209,-86.236669,NULL,'2025-10-15 05:24:29'),(36,'1','Aguas Negras',NULL,NULL,NULL,NULL,NULL,'ddddddd',12.143978,-86.236615,NULL,'2025-10-15 05:35:11'),(37,'1','Aguas Negras',NULL,NULL,NULL,NULL,NULL,'wwwwwwww',12.143978,-86.236615,NULL,'2025-10-15 05:39:07'),(38,'1','Aguas Negras',NULL,NULL,NULL,NULL,NULL,'eerrrttyyy',12.143978,-86.236615,NULL,'2025-10-15 05:39:33'),(39,'1','Agua Potable',12,93,NULL,'','jhbjhvb','jvhvhv',NULL,NULL,'639897631dc9c8b9c534239095e5ed32','2025-10-16 03:46:52'),(40,'1','Agua Potable',NULL,NULL,NULL,NULL,NULL,'jhguhgu',12.144270,-86.236697,NULL,'2025-10-16 03:51:57'),(41,'1','Agua Potable',3,18,NULL,'ooooooooo','ppppppppppp','aaaaaaaaaa',NULL,NULL,NULL,'2025-10-17 03:43:26'),(42,'1','Agua Potable',4,33,NULL,'dcdcdcdc','azazazaz','sxadc',NULL,NULL,NULL,'2025-10-17 04:18:34'),(43,'1','Agua Potable',1,2,NULL,'hdhdhdhdhd','trtrtrtrtrtr','dhdhdhdhdhdhdhdh',NULL,NULL,NULL,'2025-10-18 16:54:33'),(44,'7','Aguas Negras',NULL,NULL,NULL,NULL,NULL,'aqui',12.125191,-86.271544,NULL,'2025-10-18 17:06:24'),(45,'1','Aguas Negras',NULL,NULL,NULL,NULL,NULL,'',12.125194,-86.271544,NULL,'2025-10-18 17:25:04'),(46,'1','Agua Potable',12,93,2,'',',mmk','jjjuh',NULL,NULL,NULL,'2025-10-18 17:28:21'),(47,'1','Agua Potable',10,76,NULL,'asxz','azxs','sxaz',NULL,NULL,NULL,'2025-10-19 05:16:47'),(48,'1','Agua Potable',12,93,NULL,'','oefowiejr','skisfdsa',NULL,NULL,NULL,'2025-10-21 03:18:47'),(49,'1','Agua Potable',12,93,1,'','eeerere','geer',NULL,NULL,'5a0f3d77ceb0ea08bdc74247509ac584','2025-10-21 03:29:11'),(50,'1','Agua Potable',NULL,NULL,NULL,NULL,NULL,'',12.144693,-86.236824,NULL,'2025-10-21 03:51:18'),(51,'1','Agua Potable',12,93,5,'','kjhkihuyuyt8','khigiu',NULL,NULL,'8e20102ccf0dc9b55504987570346d53','2025-10-21 13:36:22'),(52,'1','Agua Potable',NULL,NULL,NULL,NULL,NULL,'igiut',12.137729,-86.308631,NULL,'2025-10-21 13:39:51'),(53,'1','Agua Potable',2,7,NULL,'prueba','prueba','prueba',NULL,NULL,NULL,'2025-10-26 00:54:16'),(54,'1','Agua Potable',12,94,NULL,'aaaaaa','jjjj','fffffff',NULL,NULL,'e93b3f300b6d9734ac463a58cbc9c219','2025-10-28 05:21:46'),(55,'1','Aguas Negras',NULL,NULL,NULL,NULL,NULL,'dddd',12.144609,-86.236696,'054633579550fa86fcc0e7d28574d63e','2025-10-28 05:53:59');
/*!40000 ALTER TABLE `averias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id_departamento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Boaco'),(2,'Carazo'),(3,'Chinandega'),(4,'Chontales'),(5,'Costa Caribe Norte'),(6,'Costa Caribe Sur'),(7,'Estelí'),(8,'Granada'),(9,'Jinotega'),(10,'León'),(11,'Madriz'),(12,'Managua'),(13,'Masaya'),(14,'Matagalpa'),(15,'Nueva Segovia'),(16,'Río San Juan'),(17,'Rivas');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distritos`
--

DROP TABLE IF EXISTS `distritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distritos` (
  `id_distrito` int NOT NULL AUTO_INCREMENT,
  `id_municipio` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_distrito`),
  KEY `id_municipio` (`id_municipio`),
  CONSTRAINT `distritos_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distritos`
--

LOCK TABLES `distritos` WRITE;
/*!40000 ALTER TABLE `distritos` DISABLE KEYS */;
INSERT INTO `distritos` VALUES (1,93,'Distrito I'),(2,93,'Distrito II'),(3,93,'Distrito III'),(4,93,'Distrito IV'),(5,93,'Distrito V'),(6,93,'Distrito VI'),(7,93,'Distrito VII');
/*!40000 ALTER TABLE `distritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipios` (
  `id_municipio` int NOT NULL AUTO_INCREMENT,
  `id_departamento` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_municipio`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,1,'Boaco'),(2,1,'Camoapa'),(3,1,'San José de los Remates'),(4,1,'San Lorenzo'),(5,1,'Santa Lucía'),(6,1,'Teustepe'),(7,2,'Diriamba'),(8,2,'Dolores'),(9,2,'El Rosario'),(10,2,'Jinotepe'),(11,2,'La Conquista'),(12,2,'La Paz de Carazo'),(13,2,'San Marcos'),(14,2,'Santa Teresa'),(15,3,'Chichigalpa'),(16,3,'Chinandega'),(17,3,'Cinco Pinos'),(18,3,'Corinto'),(19,3,'El Realejo'),(20,3,'El Viejo'),(21,3,'Posoltega'),(22,3,'Puerto Morazán'),(23,3,'San Francisco del Norte'),(24,3,'San Pedro del Norte'),(25,3,'Somotillo'),(26,3,'Villanueva'),(27,4,'Acoyapa'),(28,4,'Comalapa'),(29,4,'Cuapa'),(30,4,'El Coral'),(31,4,'Juigalpa'),(32,4,'La Libertad'),(33,4,'San Francisco de Cuapa'),(34,4,'San Pedro de Lóvago'),(35,4,'Santo Domingo'),(36,4,'Santo Tomás'),(37,4,'Villa Sandino'),(38,5,'Bonanza'),(39,5,'Mulukukú'),(40,5,'Prinzapolka'),(41,5,'Puerto Cabezas'),(42,5,'Siuna'),(43,5,'Waslala'),(44,5,'Waspam'),(45,6,'Bluefields'),(46,6,'Corn Island'),(47,6,'Desembocadura de Río Grande'),(48,6,'El Ayote'),(49,6,'Kukra Hill'),(50,6,'Laguna de Perlas'),(51,6,'Muelle de los Bueyes'),(52,6,'Nueva Guinea'),(53,6,'Paiwas'),(54,6,'Rama'),(55,7,'Condega'),(56,7,'Estelí'),(57,7,'La Trinidad'),(58,7,'Pueblo Nuevo'),(59,7,'San Juan de Limay'),(60,7,'San Nicolás'),(61,8,'Diriá'),(62,8,'Diriomo'),(63,8,'Granada'),(64,8,'Nandaime'),(65,9,'El Cuá'),(66,9,'Jinotega'),(67,9,'La Concordia'),(68,9,'San José de Bocay'),(69,9,'San Rafael del Norte'),(70,9,'San Sebastián de Yalí'),(71,9,'Santa María de Pantasma'),(72,9,'Wiwilí de Jinotega'),(73,10,'Achuapa'),(74,10,'El Jicaral'),(75,10,'El Sauce'),(76,10,'La Paz Centro'),(77,10,'Larreynaga'),(78,10,'León'),(79,10,'Nagarote'),(80,10,'Quezalguaque'),(81,10,'Santa Rosa del Peñón'),(82,10,'Telica'),(83,11,'Las Sabanas'),(84,11,'Palacagüina'),(85,11,'San José de Cusmapa'),(86,11,'San Juan de Río Coco'),(87,11,'Somoto'),(88,11,'Telpaneca'),(89,11,'Totogalpa'),(90,11,'Yalagüina'),(91,12,'Ciudad Sandino'),(92,12,'El Crucero'),(93,12,'Managua'),(94,12,'Mateare'),(95,12,'San Francisco Libre'),(96,12,'San Rafael del Sur'),(97,12,'Ticuantepe'),(98,12,'Tipitapa'),(99,12,'Villa El Carmen'),(100,13,'Catarina'),(101,13,'La Concepción'),(102,13,'Masatepe'),(103,13,'Masaya'),(104,13,'Nandasmo'),(105,13,'Nindirí'),(106,13,'Niquinohomo'),(107,13,'San Juan de Oriente'),(108,13,'Tisma'),(109,14,'Ciudad Darío'),(110,14,'El Tuma-La Dalia'),(111,14,'Esquipulas'),(112,14,'Matagalpa'),(113,14,'Matiguás'),(114,14,'Muy Muy'),(115,14,'Rancho Grande'),(116,14,'Río Blanco'),(117,14,'San Dionisio'),(118,14,'San Isidro'),(119,14,'San Ramón'),(120,14,'Sébaco'),(121,14,'Terrabona'),(122,15,'Ciudad Antigua'),(123,15,'Dipilto'),(124,15,'El Jícaro'),(125,15,'Jalapa'),(126,15,'Macuelizo'),(127,15,'Mozonte'),(128,15,'Murra'),(129,15,'Ocotal'),(130,15,'Quilalí'),(131,15,'San Fernando'),(132,15,'Santa María'),(133,15,'Wiwilí de Nueva Segovia'),(134,16,'El Almendro'),(135,16,'El Castillo'),(136,16,'Morrito'),(137,16,'San Carlos'),(138,16,'San Juan del Norte'),(139,16,'San Miguelito'),(140,17,'Altagracia'),(141,17,'Belén'),(142,17,'Buenos Aires'),(143,17,'Cárdenas'),(144,17,'Moyogalpa'),(145,17,'Potosí'),(146,17,'Rivas'),(147,17,'San Jorge'),(148,17,'San Juan del Sur'),(149,17,'Tola');
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre1` varchar(50) DEFAULT NULL,
  `nombre2` varchar(50) DEFAULT NULL,
  `apellido1` varchar(50) DEFAULT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono1` varchar(15) DEFAULT NULL,
  `telefono2` varchar(15) DEFAULT NULL,
  `correo` varchar(55) DEFAULT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `tipoid` varchar(15) DEFAULT NULL,
  `numeroid` varchar(15) DEFAULT NULL,
  `contrasena` varchar(15) DEFAULT NULL,
  `Fecha_Registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `Correo_Electrónico` (`correo`),
  UNIQUE KEY `Número_de_Identificación` (`numeroid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Miguel','Jerónimo','Ruiz','Obando','Managua 1','12345678','87654321','mruiz@gmail.com','1234','Cédula','1110099887766j','prueba1.','2025-09-18 05:29:50'),(2,'Arlen','Maria','Bolaños','Cerda','Colonia Maestro Gabriel','88887777','','prueba1@gmail.com','123456','DPI','1234567890a','prueba5*','2025-09-20 04:10:27'),(3,'Juan','Carlos','Perez','Perez','Managua 3','22223333','','prueba2@gmail.com','23456','Pasaporte','44477777dddgg','prueba6*','2025-09-20 04:26:01'),(4,'Pedro','Pablo','Lopez','Lopez','Managua10','44445555','','prueba10@gmail.com','121212','DPI','2143658709a','prueba8*','2025-09-20 05:02:56'),(5,'Benito','Javier','Lopez','Torres','Calle de prueba','4567890','','blopez@gmail.com','333333','DPI','3344556677u','lamisma1.','2025-10-15 03:50:46'),(6,'Abi','Priscila','Ruiz','Bolaños','probando probando','11111111','','abi@gmail.com','222222','Cedula','2222222222i','chavo8.','2025-10-15 03:55:24'),(7,'carlos','carlitos','carlangas','charls','No se','33333333333','4444444444','carlo@gmail.com','00009','Cedula','888888888882','eee','2025-10-18 17:05:39'),(8,'Carlos','Mannuel','Romero','Garcia','por alli','34567890','','cromero@gmail.com','00008','Cedula','0987654321e','aaa','2025-10-28 03:03:15');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-28 20:41:47
