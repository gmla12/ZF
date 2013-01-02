CREATE DATABASE  IF NOT EXISTS `zf` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `zf`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: zf
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt

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
-- Table structure for table `bls`
--

DROP TABLE IF EXISTS `bls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bls` (
  `idBLs` int(11) NOT NULL auto_increment,
  `BL` varchar(50) default NULL,
  `motonave` varchar(45) default NULL,
  `eta` datetime default NULL,
  `lote` varchar(50) default NULL,
  `fmm` varchar(50) default NULL,
  `susuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `cliente` varchar(50) default NULL,
  PRIMARY KEY  (`idBLs`),
  KEY `fk_bls_susuarios1_idx` (`susuarios_id`),
  CONSTRAINT `fk_bls_susuarios1` FOREIGN KEY (`susuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bls`
--

LOCK TABLES `bls` WRITE;
/*!40000 ALTER TABLE `bls` DISABLE KEYS */;
INSERT INTO `bls` VALUES (2,'prueba','1','2012-12-31 19:00:00','2','pppp',1,'2013-01-01 20:06:52','123');
/*!40000 ALTER TABLE `bls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidades`
--

DROP TABLE IF EXISTS `entidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidades` (
  `id` int(11) NOT NULL auto_increment,
  `primer_nombre` varchar(150) default NULL,
  `segundo_nombre` varchar(150) default NULL,
  `primer_apellido` varchar(150) default NULL,
  `segundo_apellido` varchar(150) default NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `identificacion` varchar(45) NOT NULL,
  `razon_social` varchar(300) default NULL,
  `pMunicipios_id` varchar(3) NOT NULL,
  `pMunicipios_departamentos_id` varchar(2) NOT NULL,
  `pMunicipios_departamentos_pPaises_id` varchar(3) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `telefono` varchar(20) default NULL,
  `email` varchar(50) default NULL,
  `id_tipo_entidad` int(11) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_entidades_sUsuarios2_idx` (`sUsuarios_id`),
  KEY `fk_entidades_pMunicipios2_idx` (`pMunicipios_id`,`pMunicipios_departamentos_id`,`pMunicipios_departamentos_pPaises_id`),
  CONSTRAINT `fk_entidades_pMunicipios2` FOREIGN KEY (`pMunicipios_id`, `pMunicipios_departamentos_id`, `pMunicipios_departamentos_pPaises_id`) REFERENCES `pmunicipios` (`id`, `departamentos_id`, `departamentos_pPaises_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entidades_sUsuarios2` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidades`
--

LOCK TABLES `entidades` WRITE;
/*!40000 ALTER TABLE `entidades` DISABLE KEYS */;
INSERT INTO `entidades` VALUES (1,'Gilberth','Miguel','Linero','Ariza',1,'1065571485',NULL,'001','13','090','Calle','3135448426','gilberth@adimporexport.com',1,1,'2012-11-29 03:25:00'),(2,'Carlos',NULL,'Castillo',NULL,1,'7919989',NULL,'001','13','090','c','1','g',1,1,'2012-12-04 11:18:00');
/*!40000 ALTER TABLE `entidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lauditoria`
--

DROP TABLE IF EXISTS `lauditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lauditoria` (
  `id` int(11) NOT NULL auto_increment,
  `fecha` datetime NOT NULL,
  `accion` varchar(20) NOT NULL,
  `valor_anterior` longtext,
  `valor_nuevo` longtext,
  `sUsuarios_id` int(11) NOT NULL,
  `sFormularios_id` int(11) NOT NULL,
  `referencia` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_lAuditoria_sUsuarios1_idx` (`sUsuarios_id`),
  KEY `fk_lAuditoria_sFormularios1_idx` (`sFormularios_id`),
  CONSTRAINT `fk_lAuditoria_sFormularios1` FOREIGN KEY (`sFormularios_id`) REFERENCES `sformularios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lAuditoria_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lauditoria`
--

LOCK TABLES `lauditoria` WRITE;
/*!40000 ALTER TABLE `lauditoria` DISABLE KEYS */;
INSERT INTO `lauditoria` VALUES (1,'2012-12-04 16:49:12','Nuevo','','id=006&nombre=ppp',1,1,'006'),(2,'2012-12-07 11:21:21','Modificar','nombre=\'pppp\'','nombre=\'ppppp\'',1,1,'006'),(3,'2012-12-07 11:29:45','Modificar','nombre=\'ppppp\'','nombre=\'ppp\'',1,1,'006'),(4,'2012-12-07 11:29:54','Eliminar','id=006&nombre=ppp','',1,1,'006'),(5,'2012-12-07 11:32:41','Nuevo','','id=006&nombre=ppp',1,1,'006'),(6,'2012-12-07 11:34:27','Eliminar','id=006&nombre=ppp','',1,1,'006'),(7,'2012-12-07 11:34:37','Nuevo','','id=006&nombre=ppp',1,1,'006'),(8,'2012-12-11 11:22:28','Eliminar','id=006&nombre=ppp','',1,1,'006'),(9,'2012-12-11 11:22:38','Nuevo','','id=007&nombre=popopopo',1,1,'007'),(10,'2012-12-11 11:22:51','Modificar','id=\'006\'&nombre=\'ppp\'','id=\'007\'&nombre=\'popopop\'',1,1,'007'),(11,'2012-12-11 11:22:58','Eliminar','id=007&nombre=popopop','',1,1,'007'),(12,'2012-12-11 16:03:08','Nuevo','','id=01&id_pais=090&nombre=popopo',1,2,'09001'),(13,'2012-12-12 15:56:19','Modificar','id_pais=\'090\'','id_pais=\'080\'',1,2,'08001'),(14,'2012-12-12 16:00:24','Modificar','nombre=\'popopo\'','nombre=\'popo\'',1,2,'09001'),(15,'2012-12-12 16:01:24','Modificar','nombre=\'popo\'','nombre=\'popopu\'',1,2,'09001'),(16,'2012-12-12 16:02:32','Modificar','nombre=\'popopu\'','nombre=\'popopupu\'',1,2,'09001'),(22,'2012-12-12 16:07:33','Modificar','nombre=\'popopupu\'','nombre=\'popopupupo\'',1,2,'09001'),(23,'2012-12-12 16:08:32','Eliminar','id=01&id_pais=090&nombre=popopupupo','',1,2,'09001'),(24,'2012-12-13 10:50:49','Nuevo','','id=04&id_pais=005&nombre=pol',1,2,'00504'),(25,'2012-12-13 10:53:23','Eliminar','id=04&id_pais=005&nombre=pol','',1,2,'00504'),(26,'2012-12-13 10:53:50','Nuevo','','id=02&id_pais=005&nombre=pil',1,2,'00502'),(27,'2012-12-13 10:54:02','Modificar','&nombre=\'pil\'','&nombre=\'piloto\'',1,2,'00502'),(28,'2012-12-13 10:54:09','Eliminar','id=02&id_pais=005&nombre=piloto','',1,2,'00502'),(29,'2012-12-13 10:54:36','Nuevo','','id=002&nombre=pul',1,1,'002'),(30,'2012-12-13 10:54:48','Modificar','nombre=\'pul\'','nombre=\'pulto\'',1,1,'002'),(31,'2012-12-13 10:54:55','Eliminar','id=002&nombre=pulto','',1,1,'002'),(32,'2012-12-13 15:53:25','Nuevo','','id=101id_departamento=13&id_pais=090&nombre=pol',1,3,'09013101'),(33,'2012-12-13 16:07:45','Modificar','id_departamento=\'13\'&nombre=\'pol\'','id_departamento=\'null\'&nombre=\'polo\'',1,3,'090null101'),(34,'2012-12-13 16:08:50','Modificar','nombre=\'pol\'','nombre=\'polo\'',1,3,'09013101'),(35,'2012-12-13 16:09:16','Modificar','nombre=\'polo\'','nombre=\'poloo\'',1,3,'09013101'),(36,'2012-12-13 16:09:24','Eliminar','id=101&id_departamento=13&id_pais=090&nombre=poloo','',1,3,'09013101'),(37,'2012-12-17 15:34:13','Nuevo','','id=0&nombrCorto=CTG&descripcion=Cartagena',1,5,'0'),(38,'2012-12-17 15:38:01','Nuevo','','id=0&nombrCorto=CTG&descripcion=Cartagena',1,5,'0'),(39,'2012-12-17 15:39:02','Eliminar','id=2&nombreCorto=CTG&descripcion=Cartagena','',1,5,'2'),(40,'2012-12-17 15:44:53','Nuevo','','id=0&nombrCorto=BGT&descripcion=Bogota',1,5,'0'),(41,'2012-12-17 16:36:08','Eliminar','id=1&nombreCorto=CTG&descripcion=Cartagena','',1,5,'1'),(42,'2012-12-17 16:36:18','Eliminar','id=3&nombreCorto=BGT&descripcion=Bogota','',1,5,'3'),(43,'2012-12-17 16:37:20','Nuevo','','id=4&nombrCorto=CTG&descripcion=Cartagena',1,5,'4'),(44,'2012-12-17 16:42:28','Modificar','descripcion=\'Cartagena\'','descripcion=\'Cartagenaa\'',1,5,'4'),(45,'2012-12-17 16:42:36','Modificar','descripcion=\'Cartagenaa\'','descripcion=\'Cartagena\'',1,5,'4'),(46,'2012-12-17 16:42:43','Eliminar','id=4&nombreCorto=CTG&descripcion=Cartagena','',1,5,'4'),(47,'2012-12-18 15:46:37','Nuevo','','id=5&nombrCorto=CTG&descripcion=Cartagena',1,5,'5'),(48,'2012-12-18 15:48:25','Nuevo','','id=6&nombrCorto=BOG&descripcion=Bogota',1,5,'6'),(49,'2012-12-19 14:37:46','Nuevo','','&id=5&nombre_corto=MEB&descripcion=Muelles el Bosque&id_departamento=13&id_pais=090id_Municipio=001id_Sucursal=0',1,4,'5'),(54,'2012-12-29 20:40:39','Nuevo','','id=1&bl=123&cliente=1234&motonave=12345&eta=29/12/2012&lote=123456&fmm=1234567',1,6,'1'),(55,'2012-12-31 10:30:28','Modificar','bl=1234567&eta=29/12/2012 00:00 AM','bl=123&eta=29/12/2012 11:18 AM',1,6,'1'),(56,'2012-12-31 10:36:31','Modificar','bl=1234567&eta=29/12/2012 00:00 AM','bl=123&eta=29/12/2012 7:00 PM',1,6,'1'),(57,'2012-12-31 11:31:04','Modificar','bl=1234567&eta=29/12/2012 00:00 AM','bl=123&eta=29/12/2012 7:00 PM',1,6,'1'),(58,'2012-12-31 11:34:33','Modificar','eta=29/12/2012 07:00 PM','eta=29/12/2012 7:00 AM',1,6,'1'),(59,'2012-12-31 11:36:44','Modificar','bl=1234567&eta=29/12/2012 07:00 AM','bl=123&eta=29/12/2012 7:35 AM',1,6,'1'),(60,'2012-12-31 11:38:54','Modificar','bl=1234567&eta=29/12/2012 07:35 AM','bl=123&eta=31/12/2012 11:35 AM',1,6,'1'),(61,'2012-12-31 15:12:31','Eliminar','id=1&bl=123&cliente=1234&motonave=12345&eta=31/12/2012 11:35 AM&lote=123456&fmm=1234567','',1,6,'1'),(62,'2012-12-31 18:42:26','Nuevo','','id=1&bl=prueba&cliente=123&motonave=1&eta=31/12/2012 7:00 PM&lote=2&fmm=3',1,6,'2'),(63,'2013-01-01 11:31:10','Nuevo Vin','','id=2&bl=prueba&idVin=1&vin=2&referencia=1&codigo=3&factura=5&descripcion=6&valorFob=7.0&color=8&huerfano=true&despachado=false&pedido=4&fmmi=11&fmms=12',1,6,'2'),(64,'2013-01-01 14:41:07','Nuevo Vin','','id=2&bl=prueba&idVin=2&vin=3&referencia=2&codigo=4&factura=6&descripcion=7&valorFob=8.0&color=9&huerfano=false&despachado=true&pedido=5&fmmi=13&fmms=14',1,6,'2'),(65,'2013-01-01 18:47:29','Nuevo Vin','','id=2&bl=prueba&idVin=3&vin=4&referencia=3&codigo=5&factura=7&descripcion=8&valorFob=9.0&color=10&huerfano=true&despachado=true&pedido=6&fmmi=14&fmms=15',1,6,'2'),(66,'2013-01-01 18:48:22','Modificar','eta=31/12/2012 07:00 PM&fmm=3','eta=31/12/2012 7:00 PM&fmm=pppp',1,6,'2'),(67,'2013-01-01 18:57:12','Modificar','eta=31/12/2012 07:00 PM','eta=31/12/2012 7:00 PM',1,6,'2'),(68,'2013-01-01 19:51:41','Modificar Vin','idVin=1&descripcion=6','idVin=11&descripcion=prueba',1,6,'2'),(69,'2013-01-01 19:55:46','Modificar Vin','idVin=1&descripcion=6','idVin=12&descripcion=prueba',1,6,'2'),(70,'2013-01-01 19:56:35','Modificar Vin','descripcion=6','descripcion=prueba',1,6,'2'),(71,'2013-01-01 19:58:15','Eliminar Vin','id=2&bl=prueba&idVin=1&vin=2&referencia=1&codigo=3&factura=5&descripcion=prueba&valorFob=7.0&color=8&huerfano=true&despachado=false&pedido=4&fmmi=11&fmms=12','',1,6,'2'),(72,'2013-01-01 20:01:10','Eliminar Vin','id=2&bl=prueba&idVin=2&vin=3&referencia=2&codigo=4&factura=6&descripcion=7&valorFob=8.0&color=9&huerfano=false&despachado=true&pedido=5&fmmi=13&fmms=14','',1,6,'2'),(73,'2013-01-01 20:02:00','Modificar Vin','idVin=11&referencia=1','idVin=1&referencia=2',1,6,'2'),(74,'2013-01-01 20:05:14','Modificar Vin','idVin=11&referencia=2','idVin=1&referencia=5',1,6,'2'),(75,'2013-01-01 20:06:52','Modificar Vin','referencia=5','referencia=6',1,6,'2');
/*!40000 ALTER TABLE `lauditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sformularios`
--

DROP TABLE IF EXISTS `sformularios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sformularios` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(45) NOT NULL,
  `sModulos_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_sFormularios_sModulos1_idx` (`sModulos_id`),
  CONSTRAINT `fk_sFormularios_sModulos1` FOREIGN KEY (`sModulos_id`) REFERENCES `smodulos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sformularios`
--

LOCK TABLES `sformularios` WRITE;
/*!40000 ALTER TABLE `sformularios` DISABLE KEYS */;
INSERT INTO `sformularios` VALUES (1,'pais',1),(2,'departamento',1),(3,'municipio',1),(4,'puerto',1),(5,'sucursal',1),(6,'bl',2);
/*!40000 ALTER TABLE `sformularios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smodulos`
--

DROP TABLE IF EXISTS `smodulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smodulos` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smodulos`
--

LOCK TABLES `smodulos` WRITE;
/*!40000 ALTER TABLE `smodulos` DISABLE KEYS */;
INSERT INTO `smodulos` VALUES (2,'operaciones'),(1,'parametros');
/*!40000 ALTER TABLE `smodulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sroles`
--

DROP TABLE IF EXISTS `sroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sroles` (
  `id` int(10) NOT NULL auto_increment,
  `nombre` varchar(45) character set latin1 NOT NULL,
  `descripcion` text collate latin1_spanish_ci NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_sRoles_sUsuarios1_idx` (`sUsuarios_id`),
  KEY `fk_sRoles_sUsuarios1_idx1` (`sUsuarios_id`),
  CONSTRAINT `fk_sRoles_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sroles`
--

LOCK TABLES `sroles` WRITE;
/*!40000 ALTER TABLE `sroles` DISABLE KEYS */;
INSERT INTO `sroles` VALUES (1,'Super Administrador','Tiene todos los permisos',1,'2012-11-29 02:29:00');
/*!40000 ALTER TABLE `sroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `susuarios`
--

DROP TABLE IF EXISTS `susuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `susuarios` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(30) character set latin1 NOT NULL,
  `password` blob NOT NULL,
  `identificacion` bigint(20) NOT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `sRoles_id` int(10) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_sUsuarios_sRoles1_idx` (`sRoles_id`),
  KEY `fk_sUsuarios_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_sUsuarios_sRoles1` FOREIGN KEY (`sRoles_id`) REFERENCES `sroles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sUsuarios_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `susuarios`
--

LOCK TABLES `susuarios` WRITE;
/*!40000 ALTER TABLE `susuarios` DISABLE KEYS */;
INSERT INTO `susuarios` VALUES (1,'glinero','ÏC5M®èNDÓ¯ÿ–„÷í',1065571485,1,1,1,'2012-11-29 02:00:00'),(2,'ccastillo','ÔøΩC5MÔøΩÔøΩNDÔøΩÔøΩÔøΩÔøΩÔøΩ÷í',7919989,1,1,1,'2012-12-04 11:19:00');
/*!40000 ALTER TABLE `susuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vines`
--

DROP TABLE IF EXISTS `vines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vines` (
  `idVines` int(11) NOT NULL auto_increment,
  `vin` varchar(45) default NULL,
  `referencia` varchar(45) default NULL,
  `codigo` varchar(45) default NULL,
  `factura` varchar(45) default NULL,
  `descripcion` longtext,
  `valor_fob` float default NULL,
  `color` int(11) default NULL,
  `huerfano` tinyint(1) default NULL,
  `despachado` tinyint(1) default NULL,
  `pedido` varchar(50) default NULL,
  `FMMI` varchar(50) default NULL,
  `FMMS` varchar(50) default NULL,
  `BLs_idBLs` int(11) NOT NULL,
  `susuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY  (`idVines`),
  KEY `fk_Vines_BLs1` (`BLs_idBLs`),
  KEY `fk_vines_susuarios1_idx` (`susuarios_id`),
  CONSTRAINT `fk_Vines_BLs1` FOREIGN KEY (`BLs_idBLs`) REFERENCES `bls` (`idBLs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vines_susuarios1` FOREIGN KEY (`susuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vines`
--

LOCK TABLES `vines` WRITE;
/*!40000 ALTER TABLE `vines` DISABLE KEYS */;
INSERT INTO `vines` VALUES (3,'4','3','5','7','8',9,10,1,1,'6','14','15',2,1,'2013-01-01 18:47:29'),(11,'2','6','3','5','prueba',7,8,1,0,'4','11','12',2,1,'2013-01-01 20:06:52'),(12,'2','1','3','5','prueba',7,8,1,0,'4','11','12',2,1,'2013-01-01 19:55:46');
/*!40000 ALTER TABLE `vines` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-01 20:17:07
