-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.21


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema zf
--

CREATE DATABASE IF NOT EXISTS zf;
USE zf;

--
-- Definition of table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idDispositivo` int(4) unsigned NOT NULL,
  `valor` double NOT NULL,
  `idComputador` int(4) unsigned NOT NULL,
  `idFactura` int(4) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `articulos`
--

/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;


--
-- Definition of table `caracteristicaplantilla`
--

DROP TABLE IF EXISTS `caracteristicaplantilla`;
CREATE TABLE `caracteristicaplantilla` (
  `idCaracteristicaPlantilla` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idPlantillaDispositivo` int(10) unsigned NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `obligatorio` tinyint(1) NOT NULL,
  `habilitar` tinyint(1) NOT NULL,
  PRIMARY KEY (`idCaracteristicaPlantilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `caracteristicaplantilla`
--

/*!40000 ALTER TABLE `caracteristicaplantilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `caracteristicaplantilla` ENABLE KEYS */;


--
-- Definition of table `comentarios_documentos`
--

DROP TABLE IF EXISTS `comentarios_documentos`;
CREATE TABLE `comentarios_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` longtext NOT NULL,
  `fecha` datetime NOT NULL,
  `items_dos_has_documentos_items_dos_id` int(11) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `comentarios_documentoscol` varchar(45) DEFAULT NULL,
  `comentarios_documentoscol1` varchar(45) DEFAULT NULL,
  `comentarios_documentoscol2` varchar(45) DEFAULT NULL,
  `comentarios_documentoscol3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_comentarios_documentos_items_dos_has_documentos1_idx` (`items_dos_has_documentos_items_dos_id`),
  KEY `fk_comentarios_documentos_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_comentarios_documentos_items_dos_has_documentos1` FOREIGN KEY (`items_dos_has_documentos_items_dos_id`) REFERENCES `items_dos_has_documentos` (`items_dos_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_documentos_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comentarios_documentos`
--

/*!40000 ALTER TABLE `comentarios_documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios_documentos` ENABLE KEYS */;


--
-- Definition of table `comentarios_estados`
--

DROP TABLE IF EXISTS `comentarios_estados`;
CREATE TABLE `comentarios_estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` longtext NOT NULL,
  `fecha` datetime NOT NULL,
  `items_dos_has_estados_estados_id` int(11) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Comentarios_items_dos_has_estados1_idx` (`items_dos_has_estados_estados_id`),
  KEY `fk_comentarios_estados_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_comentarios_estados_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentarios_items_dos_has_estados1` FOREIGN KEY (`items_dos_has_estados_estados_id`) REFERENCES `items_dos_has_estados` (`estados_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comentarios_estados`
--

/*!40000 ALTER TABLE `comentarios_estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios_estados` ENABLE KEYS */;


--
-- Definition of table `computador`
--

DROP TABLE IF EXISTS `computador`;
CREATE TABLE `computador` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) CHARACTER SET latin1 NOT NULL,
  `nombre` varchar(20) CHARACTER SET latin1 NOT NULL,
  `idEmpleado` int(4) unsigned NOT NULL,
  `ubicacion` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `computador`
--

/*!40000 ALTER TABLE `computador` DISABLE KEYS */;
/*!40000 ALTER TABLE `computador` ENABLE KEYS */;


--
-- Definition of table `dispositivo`
--

DROP TABLE IF EXISTS `dispositivo`;
CREATE TABLE `dispositivo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Descripcion` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `dispositivo`
--

/*!40000 ALTER TABLE `dispositivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispositivo` ENABLE KEYS */;


--
-- Definition of table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
CREATE TABLE `documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_corto` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `tipo_mercancia_id` int(11) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombreCorto_UNIQUE` (`nombre_corto`),
  KEY `fk_documentos_tipo_mercancia1_idx` (`tipo_mercancia_id`),
  KEY `fk_documentos_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_documentos_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentos_tipo_mercancia1` FOREIGN KEY (`tipo_mercancia_id`) REFERENCES `ptipos_mercancias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documentos`
--

/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;


--
-- Definition of table `dos`
--

DROP TABLE IF EXISTS `dos`;
CREATE TABLE `dos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DO` varchar(30) DEFAULT NULL,
  `lote` varchar(45) DEFAULT NULL,
  `BL` varchar(45) NOT NULL,
  `observaciones` longtext,
  `entidades_id` int(11) NOT NULL,
  `sucursal_id` int(11) NOT NULL,
  `puerto_id` int(11) NOT NULL,
  `tipo_mercancia_id` int(11) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idDO_UNIQUE` (`id`),
  UNIQUE KEY `DO_UNIQUE` (`DO`),
  KEY `fk_dos_sucursal1_idx` (`sucursal_id`),
  KEY `fk_dos_puerto1_idx` (`puerto_id`),
  KEY `fk_dos_tipo_mercancia1_idx` (`tipo_mercancia_id`),
  KEY `fk_dos_sUsuarios1_idx` (`sUsuarios_id`),
  KEY `fk_dos_entidades1_idx` (`entidades_id`),
  CONSTRAINT `fk_dos_entidades1` FOREIGN KEY (`entidades_id`) REFERENCES `entidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dos_puerto1` FOREIGN KEY (`puerto_id`) REFERENCES `ppuerto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dos_sucursal1` FOREIGN KEY (`sucursal_id`) REFERENCES `psucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dos_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dos_tipo_mercancia1` FOREIGN KEY (`tipo_mercancia_id`) REFERENCES `ptipos_mercancias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dos`
--

/*!40000 ALTER TABLE `dos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dos` ENABLE KEYS */;


--
-- Definition of table `entidades`
--

DROP TABLE IF EXISTS `entidades`;
CREATE TABLE `entidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(150) DEFAULT NULL,
  `segundo_nombre` varchar(150) DEFAULT NULL,
  `primer_apellido` varchar(150) DEFAULT NULL,
  `segundo_apellido` varchar(150) DEFAULT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `identificacion` varchar(45) NOT NULL,
  `razon_social` varchar(300) DEFAULT NULL,
  `pMunicipios_id` varchar(3) NOT NULL,
  `pMunicipios_departamentos_id` varchar(2) NOT NULL,
  `pMunicipios_departamentos_pPaises_id` varchar(3) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_tipo_entidad` int(11) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entidades_sUsuarios2_idx` (`sUsuarios_id`),
  KEY `fk_entidades_pMunicipios2_idx` (`pMunicipios_id`,`pMunicipios_departamentos_id`,`pMunicipios_departamentos_pPaises_id`),
  CONSTRAINT `fk_entidades_pMunicipios2` FOREIGN KEY (`pMunicipios_id`, `pMunicipios_departamentos_id`, `pMunicipios_departamentos_pPaises_id`) REFERENCES `pmunicipios` (`id`, `departamentos_id`, `departamentos_pPaises_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entidades_sUsuarios2` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entidades`
--

/*!40000 ALTER TABLE `entidades` DISABLE KEYS */;
INSERT INTO `entidades` (`id`,`primer_nombre`,`segundo_nombre`,`primer_apellido`,`segundo_apellido`,`id_tipo_documento`,`identificacion`,`razon_social`,`pMunicipios_id`,`pMunicipios_departamentos_id`,`pMunicipios_departamentos_pPaises_id`,`direccion`,`telefono`,`email`,`id_tipo_entidad`,`sUsuarios_id`,`fecha_modificacion`) VALUES 
 (1,'Gilberth','Miguel','Linero','Ariza',1,'1065571485',NULL,'001','13','090','Calle','3135448426','gilberth@adimporexport.com',1,1,'2012-11-29 03:25:00'),
 (2,'Carlos',NULL,'Castillo',NULL,1,'7919989',NULL,'001','13','090','c','1','g',1,1,'2012-12-04 11:18:00');
/*!40000 ALTER TABLE `entidades` ENABLE KEYS */;


--
-- Definition of table `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `nombre_corto` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `tiempo` int(11) NOT NULL,
  `pTipos_mercancias_id` int(11) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estados_tipo_mercancia1_idx` (`pTipos_mercancias_id`),
  KEY `fk_estados_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_estados_pTipos_mercancias1` FOREIGN KEY (`pTipos_mercancias_id`) REFERENCES `ptipos_mercancias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estados_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estados`
--

/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;


--
-- Definition of table `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `idFactura` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numFactura` varchar(40) CHARACTER SET latin1 NOT NULL,
  `idEntidad` int(4) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `factura`
--

/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;


--
-- Definition of table `items_dos`
--

DROP TABLE IF EXISTS `items_dos`;
CREATE TABLE `items_dos` (
  `id` int(11) NOT NULL,
  `cliente_final` varchar(150) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `pedido` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `numero_factura` varchar(10) DEFAULT NULL,
  `dos_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_items_dos_dos1_idx` (`dos_id`),
  KEY `fk_items_dos_proveedor1_idx` (`proveedor_id`),
  KEY `fk_items_dos_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_items_dos_dos1` FOREIGN KEY (`dos_id`) REFERENCES `dos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_dos_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `pproveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_dos_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items_dos`
--

/*!40000 ALTER TABLE `items_dos` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_dos` ENABLE KEYS */;


--
-- Definition of table `items_dos_has_documentos`
--

DROP TABLE IF EXISTS `items_dos_has_documentos`;
CREATE TABLE `items_dos_has_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_dos_id` int(11) NOT NULL,
  `documentos_id` int(11) NOT NULL,
  `fecha_recibido` datetime NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_items_dos_has_documentos_documentos1_idx` (`documentos_id`),
  KEY `fk_items_dos_has_documentos_items_dos1_idx` (`items_dos_id`),
  KEY `fk_items_dos_has_documentos_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_items_dos_has_documentos_documentos1` FOREIGN KEY (`documentos_id`) REFERENCES `documentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_dos_has_documentos_items_dos1` FOREIGN KEY (`items_dos_id`) REFERENCES `items_dos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_dos_has_documentos_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items_dos_has_documentos`
--

/*!40000 ALTER TABLE `items_dos_has_documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_dos_has_documentos` ENABLE KEYS */;


--
-- Definition of table `items_dos_has_estados`
--

DROP TABLE IF EXISTS `items_dos_has_estados`;
CREATE TABLE `items_dos_has_estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_dos_id` int(11) NOT NULL,
  `estados_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_items_dos_has_estados_estados1_idx` (`estados_id`),
  KEY `fk_items_dos_has_estados_items_dos1_idx` (`items_dos_id`),
  KEY `fk_items_dos_has_estados_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_items_dos_has_estados_estados1` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_dos_has_estados_items_dos1` FOREIGN KEY (`items_dos_id`) REFERENCES `items_dos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_dos_has_estados_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items_dos_has_estados`
--

/*!40000 ALTER TABLE `items_dos_has_estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_dos_has_estados` ENABLE KEYS */;


--
-- Definition of table `lauditoria`
--

DROP TABLE IF EXISTS `lauditoria`;
CREATE TABLE `lauditoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `accion` varchar(10) NOT NULL,
  `valor_anterior` longtext,
  `valor_nuevo` longtext,
  `sUsuarios_id` int(11) NOT NULL,
  `sFormularios_id` int(11) NOT NULL,
  `referencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_lAuditoria_sUsuarios1_idx` (`sUsuarios_id`),
  KEY `fk_lAuditoria_sFormularios1_idx` (`sFormularios_id`),
  CONSTRAINT `fk_lAuditoria_sFormularios1` FOREIGN KEY (`sFormularios_id`) REFERENCES `sformularios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lAuditoria_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lauditoria`
--

/*!40000 ALTER TABLE `lauditoria` DISABLE KEYS */;
INSERT INTO `lauditoria` (`id`,`fecha`,`accion`,`valor_anterior`,`valor_nuevo`,`sUsuarios_id`,`sFormularios_id`,`referencia`) VALUES 
 (1,'2012-12-04 16:49:12','Nuevo','','id=006&nombre=ppp',1,1,'006'),
 (2,'2012-12-07 11:21:21','Modificar','nombre=\'pppp\'','nombre=\'ppppp\'',1,1,'006'),
 (3,'2012-12-07 11:29:45','Modificar','nombre=\'ppppp\'','nombre=\'ppp\'',1,1,'006'),
 (4,'2012-12-07 11:29:54','Eliminar','id=006&nombre=ppp','',1,1,'006'),
 (5,'2012-12-07 11:32:41','Nuevo','','id=006&nombre=ppp',1,1,'006'),
 (6,'2012-12-07 11:34:27','Eliminar','id=006&nombre=ppp','',1,1,'006'),
 (7,'2012-12-07 11:34:37','Nuevo','','id=006&nombre=ppp',1,1,'006'),
 (8,'2012-12-11 11:22:28','Eliminar','id=006&nombre=ppp','',1,1,'006'),
 (9,'2012-12-11 11:22:38','Nuevo','','id=007&nombre=popopopo',1,1,'007'),
 (10,'2012-12-11 11:22:51','Modificar','id=\'006\'&nombre=\'ppp\'','id=\'007\'&nombre=\'popopop\'',1,1,'007'),
 (11,'2012-12-11 11:22:58','Eliminar','id=007&nombre=popopop','',1,1,'007'),
 (12,'2012-12-11 16:03:08','Nuevo','','id=01&id_pais=090&nombre=popopo',1,2,'09001'),
 (13,'2012-12-12 15:56:19','Modificar','id_pais=\'090\'','id_pais=\'080\'',1,2,'08001'),
 (14,'2012-12-12 16:00:24','Modificar','nombre=\'popopo\'','nombre=\'popo\'',1,2,'09001'),
 (15,'2012-12-12 16:01:24','Modificar','nombre=\'popo\'','nombre=\'popopu\'',1,2,'09001'),
 (16,'2012-12-12 16:02:32','Modificar','nombre=\'popopu\'','nombre=\'popopupu\'',1,2,'09001'),
 (22,'2012-12-12 16:07:33','Modificar','nombre=\'popopupu\'','nombre=\'popopupupo\'',1,2,'09001'),
 (23,'2012-12-12 16:08:32','Eliminar','id=01&id_pais=090&nombre=popopupupo','',1,2,'09001'),
 (24,'2012-12-13 10:50:49','Nuevo','','id=04&id_pais=005&nombre=pol',1,2,'00504'),
 (25,'2012-12-13 10:53:23','Eliminar','id=04&id_pais=005&nombre=pol','',1,2,'00504'),
 (26,'2012-12-13 10:53:50','Nuevo','','id=02&id_pais=005&nombre=pil',1,2,'00502'),
 (27,'2012-12-13 10:54:02','Modificar','&nombre=\'pil\'','&nombre=\'piloto\'',1,2,'00502'),
 (28,'2012-12-13 10:54:09','Eliminar','id=02&id_pais=005&nombre=piloto','',1,2,'00502'),
 (29,'2012-12-13 10:54:36','Nuevo','','id=002&nombre=pul',1,1,'002'),
 (30,'2012-12-13 10:54:48','Modificar','nombre=\'pul\'','nombre=\'pulto\'',1,1,'002'),
 (31,'2012-12-13 10:54:55','Eliminar','id=002&nombre=pulto','',1,1,'002'),
 (32,'2012-12-13 15:53:25','Nuevo','','id=101id_departamento=13&id_pais=090&nombre=pol',1,3,'09013101'),
 (33,'2012-12-13 16:07:45','Modificar','id_departamento=\'13\'&nombre=\'pol\'','id_departamento=\'null\'&nombre=\'polo\'',1,3,'090null101'),
 (34,'2012-12-13 16:08:50','Modificar','nombre=\'pol\'','nombre=\'polo\'',1,3,'09013101'),
 (35,'2012-12-13 16:09:16','Modificar','nombre=\'polo\'','nombre=\'poloo\'',1,3,'09013101'),
 (36,'2012-12-13 16:09:24','Eliminar','id=101&id_departamento=13&id_pais=090&nombre=poloo','',1,3,'09013101'),
 (37,'2012-12-17 15:34:13','Nuevo','','id=0&nombrCorto=CTG&descripcion=Cartagena',1,5,'0'),
 (38,'2012-12-17 15:38:01','Nuevo','','id=0&nombrCorto=CTG&descripcion=Cartagena',1,5,'0'),
 (39,'2012-12-17 15:39:02','Eliminar','id=2&nombreCorto=CTG&descripcion=Cartagena','',1,5,'2'),
 (40,'2012-12-17 15:44:53','Nuevo','','id=0&nombrCorto=BGT&descripcion=Bogota',1,5,'0'),
 (41,'2012-12-17 16:36:08','Eliminar','id=1&nombreCorto=CTG&descripcion=Cartagena','',1,5,'1'),
 (42,'2012-12-17 16:36:18','Eliminar','id=3&nombreCorto=BGT&descripcion=Bogota','',1,5,'3'),
 (43,'2012-12-17 16:37:20','Nuevo','','id=4&nombrCorto=CTG&descripcion=Cartagena',1,5,'4'),
 (44,'2012-12-17 16:42:28','Modificar','descripcion=\'Cartagena\'','descripcion=\'Cartagenaa\'',1,5,'4'),
 (45,'2012-12-17 16:42:36','Modificar','descripcion=\'Cartagenaa\'','descripcion=\'Cartagena\'',1,5,'4'),
 (46,'2012-12-17 16:42:43','Eliminar','id=4&nombreCorto=CTG&descripcion=Cartagena','',1,5,'4'),
 (47,'2012-12-18 15:46:37','Nuevo','','id=5&nombrCorto=CTG&descripcion=Cartagena',1,5,'5'),
 (48,'2012-12-18 15:48:25','Nuevo','','id=6&nombrCorto=BOG&descripcion=Bogota',1,5,'6'),
 (49,'2012-12-19 14:37:46','Nuevo','','&id=5&nombre_corto=MEB&descripcion=Muelles el Bosque&id_departamento=13&id_pais=090id_Municipio=001id_Sucursal=0',1,4,'5');
/*!40000 ALTER TABLE `lauditoria` ENABLE KEYS */;


--
-- Definition of table `pdepartamentos`
--

DROP TABLE IF EXISTS `pdepartamentos`;
CREATE TABLE `pdepartamentos` (
  `id` varchar(2) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `pPaises_id` varchar(3) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`,`pPaises_id`),
  KEY `fk_departamentos_pPaises1_idx` (`pPaises_id`),
  KEY `fk_departamentos_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_departamentos_pPaises1` FOREIGN KEY (`pPaises_id`) REFERENCES `ppaises` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_departamentos_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pdepartamentos`
--

/*!40000 ALTER TABLE `pdepartamentos` DISABLE KEYS */;
INSERT INTO `pdepartamentos` (`id`,`nombre`,`pPaises_id`,`sUsuarios_id`,`fecha_modificacion`) VALUES 
 ('05','ANTIOQUIA','090',1,'2012-11-29 03:33:00'),
 ('08','ATLANTICO','090',1,'2012-11-29 03:33:00'),
 ('11','BOGOTA','090',1,'2012-11-29 03:33:00'),
 ('13','BOLIVAR','090',1,'2012-11-29 03:33:00'),
 ('15','BOYACA','090',1,'2012-11-29 03:33:00'),
 ('17','CALDAS','090',1,'2012-11-29 03:33:00'),
 ('18','CAQUETA','090',1,'2012-11-29 03:33:00'),
 ('19','CAUCA','090',1,'2012-11-29 03:33:00'),
 ('20','CESAR','090',1,'2012-11-29 03:33:00'),
 ('23','CORDOBA','090',1,'2012-11-29 03:33:00'),
 ('25','CUNDINAMARCA','090',1,'2012-11-29 03:33:00'),
 ('27','CHOCO','090',1,'2012-11-29 03:33:00'),
 ('41','HUILA','090',1,'2012-11-29 03:33:00'),
 ('44','GUAJIRA','090',1,'2012-11-29 03:33:00'),
 ('47','MAGDALENA','090',1,'2012-11-29 03:33:00'),
 ('50','META','090',1,'2012-11-29 03:33:00'),
 ('52','NARIÑO','090',1,'2012-11-29 03:33:00'),
 ('54','NORTE DE SANTANDER','090',1,'2012-11-29 03:33:00'),
 ('63','QUINDIO','090',1,'2012-11-29 03:33:00'),
 ('66','RISARALDA','090',1,'2012-11-29 03:33:00'),
 ('68','SANTANDER','090',1,'2012-11-29 03:33:00'),
 ('70','SUCRE','090',1,'2012-11-29 03:33:00'),
 ('73','TOLIMA','090',1,'2012-11-29 03:33:00'),
 ('76','VALLE DEL CAUCA','090',1,'2012-11-29 03:33:00'),
 ('81','ARAUCA','090',1,'2012-11-29 03:33:00'),
 ('85','CASANARE','090',1,'2012-11-29 03:33:00'),
 ('86','PUTUMAYO','090',1,'2012-11-29 03:33:00'),
 ('88','SAN ANDRES','090',1,'2012-11-29 03:33:00'),
 ('91','AMAZONAS','090',1,'2012-11-29 03:33:00'),
 ('94','GUAINIA','090',1,'2012-11-29 03:33:00'),
 ('95','GUAVIARE','090',1,'2012-11-29 03:33:00'),
 ('97','VAUPES','090',1,'2012-11-29 03:33:00'),
 ('99','VICHADA','090',1,'2012-11-29 03:33:00');
/*!40000 ALTER TABLE `pdepartamentos` ENABLE KEYS */;


--
-- Definition of table `plantilladispositivo`
--

DROP TABLE IF EXISTS `plantilladispositivo`;
CREATE TABLE `plantilladispositivo` (
  `idPlantillaDispositivo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  `serHija` tinyint(1) NOT NULL,
  PRIMARY KEY (`idPlantillaDispositivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plantilladispositivo`
--

/*!40000 ALTER TABLE `plantilladispositivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `plantilladispositivo` ENABLE KEYS */;


--
-- Definition of table `plantilladispositivohija`
--

DROP TABLE IF EXISTS `plantilladispositivohija`;
CREATE TABLE `plantilladispositivohija` (
  `idPlantillaDispositivoHija` int(10) unsigned NOT NULL,
  `idPlantillaDispositivo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idPlantillaDispositivoHija`,`idPlantillaDispositivo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plantilladispositivohija`
--

/*!40000 ALTER TABLE `plantilladispositivohija` DISABLE KEYS */;
/*!40000 ALTER TABLE `plantilladispositivohija` ENABLE KEYS */;


--
-- Definition of table `pmunicipios`
--

DROP TABLE IF EXISTS `pmunicipios`;
CREATE TABLE `pmunicipios` (
  `id` varchar(3) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `departamentos_id` varchar(2) NOT NULL,
  `departamentos_pPaises_id` varchar(3) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`,`departamentos_id`,`departamentos_pPaises_id`) USING BTREE,
  KEY `fk_pMunicipios_departamentos1_idx` (`departamentos_id`,`departamentos_pPaises_id`),
  KEY `fk_pMunicipios_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_pMunicipios_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pmunicipios`
--

/*!40000 ALTER TABLE `pmunicipios` DISABLE KEYS */;
INSERT INTO `pmunicipios` (`id`,`nombre`,`departamentos_id`,`departamentos_pPaises_id`,`sUsuarios_id`,`fecha_modificacion`) VALUES 
 ('001','MEDELLIN','05','090',1,'2012-11-29 03:33:00'),
 ('001','BARRANQUILLA','08','090',1,'2012-11-29 03:33:00'),
 ('001','BOGOTA','11','090',1,'2012-11-29 03:33:00'),
 ('001','CARTAGENA','13','090',1,'2012-11-29 03:33:00'),
 ('001','TUNJA','15','090',1,'2012-11-29 03:33:00'),
 ('001','MANIZALES','17','090',1,'2012-11-29 03:33:00'),
 ('001','FLORENCIA','18','090',1,'2012-11-29 03:33:00'),
 ('001','POPAYAN','19','090',1,'2012-11-29 03:33:00'),
 ('001','VALLEDUPAR','20','090',1,'2012-11-29 03:33:00'),
 ('001','MONTERIA','23','090',1,'2012-11-29 03:33:00'),
 ('001','AGUA DE DIOS','25','090',1,'2012-11-29 03:33:00'),
 ('001','QUIBDO','27','090',1,'2012-11-29 03:33:00'),
 ('001','NEIVA','41','090',1,'2012-11-29 03:33:00'),
 ('001','RIOHACHA','44','090',1,'2012-11-29 03:33:00'),
 ('001','SANTA MARTA','47','090',1,'2012-11-29 03:33:00'),
 ('001','VILLAVICENCIO','50','090',1,'2012-11-29 03:33:00'),
 ('001','PASTO','52','090',1,'2012-11-29 03:33:00'),
 ('001','CUCUTA','54','090',1,'2012-11-29 03:33:00'),
 ('001','ARMENIA','63','090',1,'2012-11-29 03:33:00'),
 ('001','PEREIRA','66','090',1,'2012-11-29 03:33:00'),
 ('001','BUCARAMANGA','68','090',1,'2012-11-29 03:33:00'),
 ('001','SINCELEJO','70','090',1,'2012-11-29 03:33:00'),
 ('001','IBAGUE','73','090',1,'2012-11-29 03:33:00'),
 ('001','CALI','76','090',1,'2012-11-29 03:33:00'),
 ('001','ARAUCA','81','090',1,'2012-11-29 03:33:00'),
 ('001','YOPAL','85','090',1,'2012-11-29 03:33:00'),
 ('001','MOCOA','86','090',1,'2012-11-29 03:33:00'),
 ('001','SAN ANDRES','88','090',1,'2012-11-29 03:33:00'),
 ('001','LETICIA','91','090',1,'2012-11-29 03:33:00'),
 ('001','PUERTO INIRIDA','94','090',1,'2012-11-29 03:33:00'),
 ('001','SAN JOSE DEL GUAVIARE','95','090',1,'2012-11-29 03:33:00'),
 ('001','MITU','97','090',1,'2012-11-29 03:33:00'),
 ('001','PUERTO CARREÑO','99','090',1,'2012-11-29 03:33:00'),
 ('002','ABEJORRAL','05','090',1,'2012-11-29 03:33:00'),
 ('003','ABREGO','54','090',1,'2012-11-29 03:33:00'),
 ('004','ABRIAQUI','05','090',1,'2012-11-29 03:33:00'),
 ('006','ACHI','13','090',1,'2012-11-29 03:33:00'),
 ('006','ACANDI','27','090',1,'2012-11-29 03:33:00'),
 ('006','ACEVEDO','41','090',1,'2012-11-29 03:33:00'),
 ('006','ACACIAS','50','090',1,'2012-11-29 03:33:00'),
 ('010','AGUAZUL','85','090',1,'2012-11-29 03:33:00'),
 ('011','AGUACHICA','20','090',1,'2012-11-29 03:33:00'),
 ('013','AGUADAS','17','090',1,'2012-11-29 03:33:00'),
 ('013','AGUSTIN CODAZZI','20','090',1,'2012-11-29 03:33:00'),
 ('013','AGRADO','41','090',1,'2012-11-29 03:33:00'),
 ('013','AGUADA','68','090',1,'2012-11-29 03:33:00'),
 ('015','CHAMEZA','85','090',1,'2012-11-29 03:33:00'),
 ('015','CALAMAR','95','090',1,'2012-11-29 03:33:00'),
 ('016','AIPE','41','090',1,'2012-11-29 03:33:00'),
 ('019','ALBAN','25','090',1,'2012-11-29 03:33:00'),
 ('019','ALBAN','52','090',1,'2012-11-29 03:33:00'),
 ('020','ALGECIRAS','41','090',1,'2012-11-29 03:33:00'),
 ('020','ALBANIA','68','090',1,'2012-11-29 03:33:00'),
 ('020','ALCALA','76','090',1,'2012-11-29 03:33:00'),
 ('021','ALEJANDRIA','05','090',1,'2012-11-29 03:33:00'),
 ('022','ALMEIDA','15','090',1,'2012-11-29 03:33:00'),
 ('022','ALMAGUER','19','090',1,'2012-11-29 03:33:00'),
 ('022','ALDAÑA','52','090',1,'2012-11-29 03:33:00'),
 ('024','ALPUJARRA','73','090',1,'2012-11-29 03:33:00'),
 ('025','ALTO BAUDO (PIE DE PATO)','27','090',1,'2012-11-29 03:33:00'),
 ('025','EL RETORNO','95','090',1,'2012-11-29 03:33:00'),
 ('026','ALTAMIRA','41','090',1,'2012-11-29 03:33:00'),
 ('026','ALVARADO','73','090',1,'2012-11-29 03:33:00'),
 ('029','ALBANIA','18','090',1,'2012-11-29 03:33:00'),
 ('030','AMAGA','05','090',1,'2012-11-29 03:33:00'),
 ('030','ALTOS DEL ROSARIO','13','090',1,'2012-11-29 03:33:00'),
 ('030','ALGARROBO','47','090',1,'2012-11-29 03:33:00'),
 ('030','AMBALEMA','73','090',1,'2012-11-29 03:33:00'),
 ('031','AMALFI','05','090',1,'2012-11-29 03:33:00'),
 ('032','ASTREA','20','090',1,'2012-11-29 03:33:00'),
 ('034','ANDES','05','090',1,'2012-11-29 03:33:00'),
 ('035','ANAPOIMA','25','090',1,'2012-11-29 03:33:00'),
 ('035','ALBANIA','44','090',1,'2012-11-29 03:33:00'),
 ('036','ANGELOPOLIS','05','090',1,'2012-11-29 03:33:00'),
 ('036','ANCUYA','52','090',1,'2012-11-29 03:33:00'),
 ('036','ANDALUCIA','76','090',1,'2012-11-29 03:33:00'),
 ('038','ANGOSTURA','05','090',1,'2012-11-29 03:33:00'),
 ('040','ANORI','05','090',1,'2012-11-29 03:33:00'),
 ('040','ANOLAIMA','25','090',1,'2012-11-29 03:33:00'),
 ('041','ANSERMANUEVO','76','090',1,'2012-11-29 03:33:00'),
 ('042','ANTIOQUIA','05','090',1,'2012-11-29 03:33:00'),
 ('042','ARENAL','13','090',1,'2012-11-29 03:33:00'),
 ('042','ANSERMA','17','090',1,'2012-11-29 03:33:00'),
 ('043','ANZOATEGUI','73','090',1,'2012-11-29 03:33:00'),
 ('044','ANZA','05','090',1,'2012-11-29 03:33:00'),
 ('045','APARTADO','05','090',1,'2012-11-29 03:33:00'),
 ('045','BECERRIL','20','090',1,'2012-11-29 03:33:00'),
 ('045','APIA','66','090',1,'2012-11-29 03:33:00'),
 ('047','AQUITANIA','15','090',1,'2012-11-29 03:33:00'),
 ('050','ARANZAZU','17','090',1,'2012-11-29 03:33:00'),
 ('050','ARGELIA','19','090',1,'2012-11-29 03:33:00'),
 ('050','ATRATO','27','090',1,'2012-11-29 03:33:00'),
 ('051','ARBOLETES','05','090',1,'2012-11-29 03:33:00'),
 ('051','ARCABUCO','15','090',1,'2012-11-29 03:33:00'),
 ('051','ARBOLEDA','52','090',1,'2012-11-29 03:33:00'),
 ('051','ARBOLEDAS','54','090',1,'2012-11-29 03:33:00'),
 ('051','ARATOCA','68','090',1,'2012-11-29 03:33:00'),
 ('052','ARJONA','13','090',1,'2012-11-29 03:33:00'),
 ('053','ARBELAEZ','25','090',1,'2012-11-29 03:33:00'),
 ('053','ARACATACA','47','090',1,'2012-11-29 03:33:00'),
 ('054','ARGELIA','76','090',1,'2012-11-29 03:33:00'),
 ('055','ARGELIA','05','090',1,'2012-11-29 03:33:00'),
 ('055','ARMERO (GUAYABAL)','73','090',1,'2012-11-29 03:33:00'),
 ('058','ARIGUANI','47','090',1,'2012-11-29 03:33:00'),
 ('059','ARMENIA','05','090',1,'2012-11-29 03:33:00'),
 ('060','BOSCONIA','20','090',1,'2012-11-29 03:33:00'),
 ('062','ARROYOHONDO','13','090',1,'2012-11-29 03:33:00'),
 ('065','ARAUQUITA','81','090',1,'2012-11-29 03:33:00'),
 ('067','ATACO','73','090',1,'2012-11-29 03:33:00'),
 ('068','AYAPEL','23','090',1,'2012-11-29 03:33:00'),
 ('073','BAGADO','27','090',1,'2012-11-29 03:33:00'),
 ('074','BARRANCO DE LOBA','13','090',1,'2012-11-29 03:33:00'),
 ('075','BALBOA','19','090',1,'2012-11-29 03:33:00'),
 ('075','BAHIA SOLANO (MUTIS)','27','090',1,'2012-11-29 03:33:00'),
 ('075','BALBOA','66','090',1,'2012-11-29 03:33:00'),
 ('077','BAJO BAUDO (PIZARRO)','27','090',1,'2012-11-29 03:33:00'),
 ('077','BARBOSA','68','090',1,'2012-11-29 03:33:00'),
 ('078','BARANOA','08','090',1,'2012-11-29 03:33:00'),
 ('078','BARAYA','41','090',1,'2012-11-29 03:33:00'),
 ('078','BARRANCAS','44','090',1,'2012-11-29 03:33:00'),
 ('079','BARBOSA','05','090',1,'2012-11-29 03:33:00'),
 ('079','BUENAVISTA','23','090',1,'2012-11-29 03:33:00'),
 ('079','BARBACOAS','52','090',1,'2012-11-29 03:33:00'),
 ('079','BARICHARA','68','090',1,'2012-11-29 03:33:00'),
 ('081','BARRANCABERMEJA','68','090',1,'2012-11-29 03:33:00'),
 ('083','BELEN','52','090',1,'2012-11-29 03:33:00'),
 ('086','BELMIRA','05','090',1,'2012-11-29 03:33:00'),
 ('086','BELTRAN','25','090',1,'2012-11-29 03:33:00'),
 ('087','BELEN','15','090',1,'2012-11-29 03:33:00'),
 ('088','BELLO','05','090',1,'2012-11-29 03:33:00'),
 ('088','BELALCAZAR','17','090',1,'2012-11-29 03:33:00'),
 ('088','BELEN DE UMBRIA','66','090',1,'2012-11-29 03:33:00'),
 ('090','BERBEO','15','090',1,'2012-11-29 03:33:00'),
 ('090','CANALETE','23','090',1,'2012-11-29 03:33:00'),
 ('090','DIBULLA','44','090',1,'2012-11-29 03:33:00'),
 ('091','BETANIA','05','090',1,'2012-11-29 03:33:00'),
 ('092','BETEITIVA','15','090',1,'2012-11-29 03:33:00'),
 ('092','BETULIA','68','090',1,'2012-11-29 03:33:00'),
 ('093','BETULIA','05','090',1,'2012-11-29 03:33:00'),
 ('094','BELEN ANDAQUIES','18','090',1,'2012-11-29 03:33:00'),
 ('095','BITUIMA','25','090',1,'2012-11-29 03:33:00'),
 ('097','BOAVITA','15','090',1,'2012-11-29 03:33:00'),
 ('098','DISTRACCION','44','090',1,'2012-11-29 03:33:00'),
 ('099','BOJACA','25','090',1,'2012-11-29 03:33:00'),
 ('099','BOJAYA (BELLAVISTA)','27','090',1,'2012-11-29 03:33:00'),
 ('099','BOCHALEMA','54','090',1,'2012-11-29 03:33:00'),
 ('100','BOLIVAR','19','090',1,'2012-11-29 03:33:00'),
 ('100','BOLIVAR','76','090',1,'2012-11-29 03:33:00'),
 ('101','CIUDAD BOLIVAR','05','090',1,'2012-11-29 03:33:00'),
 ('101','BOLIVAR','68','090',1,'2012-11-29 03:33:00'),
 ('104','BOYACA','15','090',1,'2012-11-29 03:33:00'),
 ('106','BRICEÑO','15','090',1,'2012-11-29 03:33:00'),
 ('107','BRICEÑO','05','090',1,'2012-11-29 03:33:00'),
 ('109','BUENAVISTA','15','090',1,'2012-11-29 03:33:00'),
 ('109','BUCARASICA','54','090',1,'2012-11-29 03:33:00'),
 ('109','BUENAVENTURA','76','090',1,'2012-11-29 03:33:00'),
 ('110','BUENOS AIRES','19','090',1,'2012-11-29 03:33:00'),
 ('110','EL MOLINO','44','090',1,'2012-11-29 03:33:00'),
 ('110','BARRANCA DE UPIA','50','090',1,'2012-11-29 03:33:00'),
 ('110','BUESACO','52','090',1,'2012-11-29 03:33:00'),
 ('110','BUENAVISTA','70','090',1,'2012-11-29 03:33:00'),
 ('111','BUENAVISTA','63','090',1,'2012-11-29 03:33:00'),
 ('111','BUGA','76','090',1,'2012-11-29 03:33:00'),
 ('113','BURITICA','05','090',1,'2012-11-29 03:33:00'),
 ('113','BUGALAGRANDE','76','090',1,'2012-11-29 03:33:00'),
 ('114','BUSBANZA','15','090',1,'2012-11-29 03:33:00'),
 ('120','CACERES','05','090',1,'2012-11-29 03:33:00'),
 ('120','CABRERA','25','090',1,'2012-11-29 03:33:00'),
 ('121','CABRERA','68','090',1,'2012-11-29 03:33:00'),
 ('122','CAICEDONIA','76','090',1,'2012-11-29 03:33:00'),
 ('123','CACHIPAY','25','090',1,'2012-11-29 03:33:00'),
 ('124','CABUYARO','50','090',1,'2012-11-29 03:33:00'),
 ('124','CAIMITO','70','090',1,'2012-11-29 03:33:00'),
 ('124','CAJAMARCA','73','090',1,'2012-11-29 03:33:00'),
 ('125','CAICEDO','05','090',1,'2012-11-29 03:33:00'),
 ('125','CACOTA','54','090',1,'2012-11-29 03:33:00'),
 ('125','HATO COROZAL','85','090',1,'2012-11-29 03:33:00'),
 ('126','CAJICA','25','090',1,'2012-11-29 03:33:00'),
 ('126','CALIMA','76','090',1,'2012-11-29 03:33:00'),
 ('128','CACHIRA','54','090',1,'2012-11-29 03:33:00'),
 ('129','CALDAS','05','090',1,'2012-11-29 03:33:00'),
 ('130','CAJIBIO','19','090',1,'2012-11-29 03:33:00'),
 ('130','CALARCA','63','090',1,'2012-11-29 03:33:00'),
 ('130','CANDELARIA','76','090',1,'2012-11-29 03:33:00'),
 ('131','CALDAS','15','090',1,'2012-11-29 03:33:00'),
 ('132','CAMPOALEGRE','41','090',1,'2012-11-29 03:33:00'),
 ('132','CALIFORNIA','68','090',1,'2012-11-29 03:33:00'),
 ('134','CAMPAMENTO','05','090',1,'2012-11-29 03:33:00'),
 ('135','CAMPOHERMOSO','15','090',1,'2012-11-29 03:33:00'),
 ('135','CANTON DE SAN PABLO','27','090',1,'2012-11-29 03:33:00'),
 ('136','LA SALINA','85','090',1,'2012-11-29 03:33:00'),
 ('137','CAMPO DE LA CRUZ','08','090',1,'2012-11-29 03:33:00'),
 ('137','CALDONO','19','090',1,'2012-11-29 03:33:00'),
 ('138','CAÑASGORDAS','05','090',1,'2012-11-29 03:33:00'),
 ('139','MANI','85','090',1,'2012-11-29 03:33:00'),
 ('140','CALAMAR','13','090',1,'2012-11-29 03:33:00'),
 ('141','CANDELARIA','08','090',1,'2012-11-29 03:33:00'),
 ('142','CARACOLI','05','090',1,'2012-11-29 03:33:00'),
 ('142','CALOTO','19','090',1,'2012-11-29 03:33:00'),
 ('145','CARAMANTA','05','090',1,'2012-11-29 03:33:00'),
 ('147','CAREPA','05','090',1,'2012-11-29 03:33:00'),
 ('147','CAPITANEJO','68','090',1,'2012-11-29 03:33:00'),
 ('147','CARTAGO','76','090',1,'2012-11-29 03:33:00'),
 ('148','CARMEN DE VIBORAL','05','090',1,'2012-11-29 03:33:00'),
 ('148','CAPARRAPI','25','090',1,'2012-11-29 03:33:00'),
 ('148','CARMEN APICALA','73','090',1,'2012-11-29 03:33:00'),
 ('150','CAROLINA','05','090',1,'2012-11-29 03:33:00'),
 ('150','CARTAGENA DEL CHAIRA','18','090',1,'2012-11-29 03:33:00'),
 ('150','CARMEN DEL DARIEN','27','090',1,'2012-11-29 03:33:00'),
 ('150','CASTILLA LA NUEVA','50','090',1,'2012-11-29 03:33:00'),
 ('151','CAQUEZA','25','090',1,'2012-11-29 03:33:00'),
 ('152','CARCASI','68','090',1,'2012-11-29 03:33:00'),
 ('152','CASABIANCA','73','090',1,'2012-11-29 03:33:00'),
 ('154','CAUCASIA','05','090',1,'2012-11-29 03:33:00'),
 ('154','CARMEN DE CARUPA','25','090',1,'2012-11-29 03:33:00'),
 ('160','CANTAGALLO','13','090',1,'2012-11-29 03:33:00'),
 ('160','CERTEGUI','27','090',1,'2012-11-29 03:33:00'),
 ('160','CEPITA','68','090',1,'2012-11-29 03:33:00'),
 ('161','CERRO SAN ANTONIO','47','090',1,'2012-11-29 03:33:00'),
 ('161','CARURU','97','090',1,'2012-11-29 03:33:00'),
 ('162','CERINZA','15','090',1,'2012-11-29 03:33:00'),
 ('162','CERETE','23','090',1,'2012-11-29 03:33:00'),
 ('162','CERRITO','68','090',1,'2012-11-29 03:33:00'),
 ('162','MONTERREY','85','090',1,'2012-11-29 03:33:00'),
 ('167','CHARALA','68','090',1,'2012-11-29 03:33:00'),
 ('168','CHIMA','23','090',1,'2012-11-29 03:33:00'),
 ('168','CHAGUANI','25','090',1,'2012-11-29 03:33:00'),
 ('168','CHAPARRAL','73','090',1,'2012-11-29 03:33:00'),
 ('169','CHARTA','68','090',1,'2012-11-29 03:33:00'),
 ('170','CHIVOLO','47','090',1,'2012-11-29 03:33:00'),
 ('170','DOS QUEBRADAS','66','090',1,'2012-11-29 03:33:00'),
 ('172','CHIGORODO','05','090',1,'2012-11-29 03:33:00'),
 ('172','CHINAVITA','15','090',1,'2012-11-29 03:33:00'),
 ('172','CHINACOTA','54','090',1,'2012-11-29 03:33:00'),
 ('174','CHINCHINA','17','090',1,'2012-11-29 03:33:00'),
 ('174','CHITAGA','54','090',1,'2012-11-29 03:33:00'),
 ('175','CHIMICHAGUA','20','090',1,'2012-11-29 03:33:00'),
 ('175','CHIA','25','090',1,'2012-11-29 03:33:00'),
 ('176','CHIQUINQUIRA','15','090',1,'2012-11-29 03:33:00'),
 ('176','CHIMA','68','090',1,'2012-11-29 03:33:00'),
 ('178','CHIRIGUANA','20','090',1,'2012-11-29 03:33:00'),
 ('178','CHIPAQUE','25','090',1,'2012-11-29 03:33:00'),
 ('179','CHIPATA','68','090',1,'2012-11-29 03:33:00'),
 ('180','CHISCAS','15','090',1,'2012-11-29 03:33:00'),
 ('181','CHOACHI','25','090',1,'2012-11-29 03:33:00'),
 ('182','CHINU','23','090',1,'2012-11-29 03:33:00'),
 ('183','CHITA','15','090',1,'2012-11-29 03:33:00'),
 ('183','CHOCONTA','25','090',1,'2012-11-29 03:33:00'),
 ('185','CHITARAQUE','15','090',1,'2012-11-29 03:33:00'),
 ('187','CHIVATA','15','090',1,'2012-11-29 03:33:00'),
 ('188','CICUCO','13','090',1,'2012-11-29 03:33:00'),
 ('189','CIENEGA','15','090',1,'2012-11-29 03:33:00'),
 ('189','CIENAGA DE ORO','23','090',1,'2012-11-29 03:33:00'),
 ('189','CIENAGA','47','090',1,'2012-11-29 03:33:00'),
 ('190','CISNEROS','05','090',1,'2012-11-29 03:33:00'),
 ('190','CIRCASIA','63','090',1,'2012-11-29 03:33:00'),
 ('190','CIMITARRA','68','090',1,'2012-11-29 03:33:00'),
 ('197','COCORNA','05','090',1,'2012-11-29 03:33:00'),
 ('200','COGUA','25','090',1,'2012-11-29 03:33:00'),
 ('200','COELLO','73','090',1,'2012-11-29 03:33:00'),
 ('200','MIRAFLORES','95','090',1,'2012-11-29 03:33:00'),
 ('203','COLON(GENOVA)','52','090',1,'2012-11-29 03:33:00'),
 ('204','COMBITA','15','090',1,'2012-11-29 03:33:00'),
 ('204','COLOSO','70','090',1,'2012-11-29 03:33:00'),
 ('205','CURILLO','18','090',1,'2012-11-29 03:33:00'),
 ('205','CONDOTO','27','090',1,'2012-11-29 03:33:00'),
 ('205','CONCORDIA','47','090',1,'2012-11-29 03:33:00'),
 ('206','CONCEPCION','05','090',1,'2012-11-29 03:33:00'),
 ('206','COLOMBIA','41','090',1,'2012-11-29 03:33:00'),
 ('206','CONVENCION','54','090',1,'2012-11-29 03:33:00'),
 ('207','CONSACA','52','090',1,'2012-11-29 03:33:00'),
 ('207','CONCEPCION','68','090',1,'2012-11-29 03:33:00'),
 ('209','CONCORDIA','05','090',1,'2012-11-29 03:33:00'),
 ('209','CONFINES','68','090',1,'2012-11-29 03:33:00'),
 ('210','CONTADERO','52','090',1,'2012-11-29 03:33:00'),
 ('211','CONTRATACION','68','090',1,'2012-11-29 03:33:00'),
 ('212','COPACABANA','05','090',1,'2012-11-29 03:33:00'),
 ('212','CORDOBA','13','090',1,'2012-11-29 03:33:00'),
 ('212','COPER','15','090',1,'2012-11-29 03:33:00'),
 ('212','CORINTO','19','090',1,'2012-11-29 03:33:00'),
 ('212','CORDOBA','63','090',1,'2012-11-29 03:33:00'),
 ('214','COTA','25','090',1,'2012-11-29 03:33:00'),
 ('215','CORRALES','15','090',1,'2012-11-29 03:33:00'),
 ('215','CORDOBA','52','090',1,'2012-11-29 03:33:00'),
 ('215','COROZAL','70','090',1,'2012-11-29 03:33:00'),
 ('217','COROMORO','68','090',1,'2012-11-29 03:33:00'),
 ('217','COYAIMA','73','090',1,'2012-11-29 03:33:00'),
 ('218','COVARACHIA','15','090',1,'2012-11-29 03:33:00'),
 ('219','COLON','86','090',1,'2012-11-29 03:33:00'),
 ('220','CRAVO NORTE','81','090',1,'2012-11-29 03:33:00'),
 ('221','COVEÑAS','70','090',1,'2012-11-29 03:33:00'),
 ('222','CLEMENCIA','13','090',1,'2012-11-29 03:33:00'),
 ('223','CUBARA','15','090',1,'2012-11-29 03:33:00'),
 ('223','CUBARRAL','50','090',1,'2012-11-29 03:33:00'),
 ('223','CUCUTILLA','54','090',1,'2012-11-29 03:33:00'),
 ('224','CUCAITA','15','090',1,'2012-11-29 03:33:00'),
 ('224','CUCUNUBA','25','090',1,'2012-11-29 03:33:00'),
 ('224','CUASPUD','52','090',1,'2012-11-29 03:33:00'),
 ('225','NUNCHIA','85','090',1,'2012-11-29 03:33:00'),
 ('226','CUITIVA','15','090',1,'2012-11-29 03:33:00'),
 ('226','CUMARAL','50','090',1,'2012-11-29 03:33:00'),
 ('226','CUNDAY','73','090',1,'2012-11-29 03:33:00'),
 ('227','CUMBAL','52','090',1,'2012-11-29 03:33:00'),
 ('228','CURUMANI','20','090',1,'2012-11-29 03:33:00'),
 ('229','CURITI','68','090',1,'2012-11-29 03:33:00'),
 ('230','CHALAN','70','090',1,'2012-11-29 03:33:00'),
 ('230','OROCUE','85','090',1,'2012-11-29 03:33:00'),
 ('232','CHIQUIZA','15','090',1,'2012-11-29 03:33:00'),
 ('233','CUMBITARA','52','090',1,'2012-11-29 03:33:00'),
 ('233','EL ROBLE','70','090',1,'2012-11-29 03:33:00'),
 ('233','DAGUA','76','090',1,'2012-11-29 03:33:00'),
 ('234','DABEIBA','05','090',1,'2012-11-29 03:33:00'),
 ('235','EL CARMEN','68','090',1,'2012-11-29 03:33:00'),
 ('235','GALERAS','70','090',1,'2012-11-29 03:33:00'),
 ('236','CHIVOR','15','090',1,'2012-11-29 03:33:00'),
 ('236','DOLORES','73','090',1,'2012-11-29 03:33:00'),
 ('237','DON MATIAS','05','090',1,'2012-11-29 03:33:00'),
 ('238','DUITAMA','15','090',1,'2012-11-29 03:33:00'),
 ('238','EL COPEY','20','090',1,'2012-11-29 03:33:00'),
 ('239','DURANIA','54','090',1,'2012-11-29 03:33:00'),
 ('240','EBEJICO','05','090',1,'2012-11-29 03:33:00'),
 ('240','CHACHAGUI','52','090',1,'2012-11-29 03:33:00'),
 ('243','EL AGUILA','76','090',1,'2012-11-29 03:33:00'),
 ('244','EL CARMEN DE BOLIVAR','13','090',1,'2012-11-29 03:33:00'),
 ('244','EL COCUY','15','090',1,'2012-11-29 03:33:00'),
 ('244','ELIAS','41','090',1,'2012-11-29 03:33:00'),
 ('245','EL COLEGIO','25','090',1,'2012-11-29 03:33:00'),
 ('245','EL CARMEN','27','090',1,'2012-11-29 03:33:00'),
 ('245','EL BANCO','47','090',1,'2012-11-29 03:33:00'),
 ('245','EL CALVARIO','50','090',1,'2012-11-29 03:33:00'),
 ('245','EL CARMEN','54','090',1,'2012-11-29 03:33:00'),
 ('245','EL GUACAMAYO','68','090',1,'2012-11-29 03:33:00'),
 ('246','EL CAIRO','76','090',1,'2012-11-29 03:33:00'),
 ('247','EL DONCELLO','18','090',1,'2012-11-29 03:33:00'),
 ('248','EL GUAMO','13','090',1,'2012-11-29 03:33:00'),
 ('248','EL ESPINO','15','090',1,'2012-11-29 03:33:00'),
 ('248','EL CERRITO','76','090',1,'2012-11-29 03:33:00'),
 ('250','EL BAGRE','05','090',1,'2012-11-29 03:33:00'),
 ('250','EL PASO','20','090',1,'2012-11-29 03:33:00'),
 ('250','LITORAL DEL SAN JUAN','27','090',1,'2012-11-29 03:33:00'),
 ('250','EL CHARCO','52','090',1,'2012-11-29 03:33:00'),
 ('250','EL TARRA','54','090',1,'2012-11-29 03:33:00'),
 ('250','EL PEÑON','68','090',1,'2012-11-29 03:33:00'),
 ('250','EL DOVIO','76','090',1,'2012-11-29 03:33:00'),
 ('250','PAZ DE ARIPORO','85','090',1,'2012-11-29 03:33:00'),
 ('251','EL CASTILLO','50','090',1,'2012-11-29 03:33:00'),
 ('254','EL PEÑOL','52','090',1,'2012-11-29 03:33:00'),
 ('255','EL PLAYON','68','090',1,'2012-11-29 03:33:00'),
 ('256','EL PAUJIL','18','090',1,'2012-11-29 03:33:00'),
 ('256','EL TAMBO','19','090',1,'2012-11-29 03:33:00'),
 ('256','EL ROSARIO','52','090',1,'2012-11-29 03:33:00'),
 ('258','EL PEÑON','25','090',1,'2012-11-29 03:33:00'),
 ('258','EL PIÑON','47','090',1,'2012-11-29 03:33:00'),
 ('258','EL TABLON','52','090',1,'2012-11-29 03:33:00'),
 ('260','EL ROSAL','25','090',1,'2012-11-29 03:33:00'),
 ('260','EL TAMBO','52','090',1,'2012-11-29 03:33:00'),
 ('261','EL ZULIA','54','090',1,'2012-11-29 03:33:00'),
 ('263','PORE','85','090',1,'2012-11-29 03:33:00'),
 ('264','ENTRERRIOS','05','090',1,'2012-11-29 03:33:00'),
 ('264','ENCINO','68','090',1,'2012-11-29 03:33:00'),
 ('265','GUARANDA','70','090',1,'2012-11-29 03:33:00'),
 ('266','ENVIGADO','05','090',1,'2012-11-29 03:33:00'),
 ('266','ENCISO','68','090',1,'2012-11-29 03:33:00'),
 ('268','EL PEÑON','13','090',1,'2012-11-29 03:33:00'),
 ('268','EL RETEN','47','090',1,'2012-11-29 03:33:00'),
 ('268','ESPINAL','73','090',1,'2012-11-29 03:33:00'),
 ('269','FACATATIVA','25','090',1,'2012-11-29 03:33:00'),
 ('270','EL DORADO','50','090',1,'2012-11-29 03:33:00'),
 ('270','FALAN','73','090',1,'2012-11-29 03:33:00'),
 ('271','FLORIAN','68','090',1,'2012-11-29 03:33:00'),
 ('272','FIRAVITOBA','15','090',1,'2012-11-29 03:33:00'),
 ('272','FILADELFIA','17','090',1,'2012-11-29 03:33:00'),
 ('272','FILANDIA','63','090',1,'2012-11-29 03:33:00'),
 ('275','FLANDES','73','090',1,'2012-11-29 03:33:00'),
 ('275','FLORIDA','76','090',1,'2012-11-29 03:33:00'),
 ('276','FLORESTA','15','090',1,'2012-11-29 03:33:00'),
 ('276','FLORIDABLANCA','68','090',1,'2012-11-29 03:33:00'),
 ('279','FOMEQUE','25','090',1,'2012-11-29 03:33:00'),
 ('279','FONSECA','44','090',1,'2012-11-29 03:33:00'),
 ('279','RECETOR','85','090',1,'2012-11-29 03:33:00'),
 ('281','FOSCA','25','090',1,'2012-11-29 03:33:00'),
 ('282','FREDONIA','05','090',1,'2012-11-29 03:33:00'),
 ('283','FRESNO','73','090',1,'2012-11-29 03:33:00'),
 ('284','FRONTINO','05','090',1,'2012-11-29 03:33:00'),
 ('286','FUNZA','25','090',1,'2012-11-29 03:33:00'),
 ('287','FUENTE DE ORO','50','090',1,'2012-11-29 03:33:00'),
 ('287','FUNES','52','090',1,'2012-11-29 03:33:00'),
 ('288','FUQUENE','25','090',1,'2012-11-29 03:33:00'),
 ('288','FUNDACION','47','090',1,'2012-11-29 03:33:00'),
 ('290','FLORENCIA','19','090',1,'2012-11-29 03:33:00'),
 ('290','FUSAGASUGA','25','090',1,'2012-11-29 03:33:00'),
 ('293','GACHANTIVA','15','090',1,'2012-11-29 03:33:00'),
 ('293','GACHALA','25','090',1,'2012-11-29 03:33:00'),
 ('295','GAMARRA','20','090',1,'2012-11-29 03:33:00'),
 ('295','GACHANCIPA','25','090',1,'2012-11-29 03:33:00'),
 ('296','GALAPA','08','090',1,'2012-11-29 03:33:00'),
 ('296','GAMEZA','15','090',1,'2012-11-29 03:33:00'),
 ('296','GALAN','68','090',1,'2012-11-29 03:33:00'),
 ('297','GACHETA','25','090',1,'2012-11-29 03:33:00'),
 ('298','GARZON','41','090',1,'2012-11-29 03:33:00'),
 ('298','GAMBITA','68','090',1,'2012-11-29 03:33:00'),
 ('299','GARAGOA','15','090',1,'2012-11-29 03:33:00'),
 ('299','GAMA','25','090',1,'2012-11-29 03:33:00'),
 ('300','HATILLO DE LOBA','13','090',1,'2012-11-29 03:33:00'),
 ('300','COTORRA','23','090',1,'2012-11-29 03:33:00'),
 ('300','FORTUL','81','090',1,'2012-11-29 03:33:00'),
 ('300','SABANALARGA','85','090',1,'2012-11-29 03:33:00'),
 ('302','GENOVA','63','090',1,'2012-11-29 03:33:00'),
 ('306','GIRALDO','05','090',1,'2012-11-29 03:33:00'),
 ('306','GIGANTE','41','090',1,'2012-11-29 03:33:00'),
 ('306','GINEBRA','76','090',1,'2012-11-29 03:33:00'),
 ('307','GIRARDOT','25','090',1,'2012-11-29 03:33:00'),
 ('307','GIRON','68','090',1,'2012-11-29 03:33:00'),
 ('308','GIRARDOTA','05','090',1,'2012-11-29 03:33:00'),
 ('310','GOMEZ PLATA','05','090',1,'2012-11-29 03:33:00'),
 ('310','GONZALEZ','20','090',1,'2012-11-29 03:33:00'),
 ('312','GRANADA','25','090',1,'2012-11-29 03:33:00'),
 ('313','GRANADA','05','090',1,'2012-11-29 03:33:00'),
 ('313','GRANADA','50','090',1,'2012-11-29 03:33:00'),
 ('313','GRAMALOTE','54','090',1,'2012-11-29 03:33:00'),
 ('315','GUADALUPE','05','090',1,'2012-11-29 03:33:00'),
 ('315','SACAMA','85','090',1,'2012-11-29 03:33:00'),
 ('317','GUACAMAYAS','15','090',1,'2012-11-29 03:33:00'),
 ('317','GUACHETA','25','090',1,'2012-11-29 03:33:00'),
 ('317','GUACHUCAL','52','090',1,'2012-11-29 03:33:00'),
 ('318','GUARNE','05','090',1,'2012-11-29 03:33:00'),
 ('318','GUAPI','19','090',1,'2012-11-29 03:33:00'),
 ('318','GUAMAL','47','090',1,'2012-11-29 03:33:00'),
 ('318','GUAMAL','50','090',1,'2012-11-29 03:33:00'),
 ('318','GUATICA','66','090',1,'2012-11-29 03:33:00'),
 ('318','GUACA','68','090',1,'2012-11-29 03:33:00'),
 ('318','GUACARI','76','090',1,'2012-11-29 03:33:00'),
 ('319','GUADALUPE','41','090',1,'2012-11-29 03:33:00'),
 ('319','GUAMO','73','090',1,'2012-11-29 03:33:00'),
 ('320','GUADUAS','25','090',1,'2012-11-29 03:33:00'),
 ('320','GUAITARILLA','52','090',1,'2012-11-29 03:33:00'),
 ('320','GUADALUPE','68','090',1,'2012-11-29 03:33:00'),
 ('320','ORITO','86','090',1,'2012-11-29 03:33:00'),
 ('321','GUATAPE','05','090',1,'2012-11-29 03:33:00'),
 ('322','GUATEQUE','15','090',1,'2012-11-29 03:33:00'),
 ('322','GUASCA','25','090',1,'2012-11-29 03:33:00'),
 ('322','GUAPOTA','68','090',1,'2012-11-29 03:33:00'),
 ('323','GUALMATAN','52','090',1,'2012-11-29 03:33:00'),
 ('324','GUATAQUI','25','090',1,'2012-11-29 03:33:00'),
 ('324','GUAVATA','68','090',1,'2012-11-29 03:33:00'),
 ('325','GUAYATA','15','090',1,'2012-11-29 03:33:00'),
 ('325','MAPIRIPAN','50','090',1,'2012-11-29 03:33:00'),
 ('325','SAN LUIS DE PALENQUE','85','090',1,'2012-11-29 03:33:00'),
 ('326','GUATAVITA','25','090',1,'2012-11-29 03:33:00'),
 ('327','GUEPSA','68','090',1,'2012-11-29 03:33:00'),
 ('328','GUAYABAL DE SIQUIMA','25','090',1,'2012-11-29 03:33:00'),
 ('330','MESETAS','50','090',1,'2012-11-29 03:33:00'),
 ('332','GUICAN','15','090',1,'2012-11-29 03:33:00'),
 ('335','GUAYABETAL','25','090',1,'2012-11-29 03:33:00'),
 ('339','GUTIERREZ','25','090',1,'2012-11-29 03:33:00'),
 ('344','HACARI','54','090',1,'2012-11-29 03:33:00'),
 ('344','HATO','68','090',1,'2012-11-29 03:33:00'),
 ('347','HELICONIA','05','090',1,'2012-11-29 03:33:00'),
 ('347','HERRAN','54','090',1,'2012-11-29 03:33:00'),
 ('347','HERVEO','73','090',1,'2012-11-29 03:33:00'),
 ('349','HOBO','41','090',1,'2012-11-29 03:33:00'),
 ('349','HONDA','73','090',1,'2012-11-29 03:33:00'),
 ('350','LA APARTADA','23','090',1,'2012-11-29 03:33:00'),
 ('350','LA MACARENA','50','090',1,'2012-11-29 03:33:00'),
 ('352','ILES','52','090',1,'2012-11-29 03:33:00'),
 ('352','ICONONZO','73','090',1,'2012-11-29 03:33:00'),
 ('353','HISPANIA','05','090',1,'2012-11-29 03:33:00'),
 ('354','IMUES','52','090',1,'2012-11-29 03:33:00'),
 ('355','INZA','19','090',1,'2012-11-29 03:33:00'),
 ('356','IPIALES','52','090',1,'2012-11-29 03:33:00'),
 ('357','IQUIRA','41','090',1,'2012-11-29 03:33:00'),
 ('359','ISNOS','41','090',1,'2012-11-29 03:33:00'),
 ('360','ITAGUI','05','090',1,'2012-11-29 03:33:00'),
 ('361','ITUANGO','05','090',1,'2012-11-29 03:33:00'),
 ('361','ISTMINA','27','090',1,'2012-11-29 03:33:00'),
 ('362','IZA','15','090',1,'2012-11-29 03:33:00'),
 ('364','JARDIN','05','090',1,'2012-11-29 03:33:00'),
 ('364','JAMBALO','19','090',1,'2012-11-29 03:33:00'),
 ('364','JAMUNDI','76','090',1,'2012-11-29 03:33:00'),
 ('367','JENESANO','15','090',1,'2012-11-29 03:33:00'),
 ('368','JERICO','05','090',1,'2012-11-29 03:33:00'),
 ('368','JERICO','15','090',1,'2012-11-29 03:33:00'),
 ('368','JERUSALEN','25','090',1,'2012-11-29 03:33:00'),
 ('368','JESUS MARIA','68','090',1,'2012-11-29 03:33:00'),
 ('370','LA URIBE','50','090',1,'2012-11-29 03:33:00'),
 ('370','JORDAN','68','090',1,'2012-11-29 03:33:00'),
 ('372','JUAN DE ACOSTA','08','090',1,'2012-11-29 03:33:00'),
 ('372','JUNIN','25','090',1,'2012-11-29 03:33:00'),
 ('372','JURADO','27','090',1,'2012-11-29 03:33:00'),
 ('376','LA CEJA','05','090',1,'2012-11-29 03:33:00'),
 ('377','LABRANZAGRANDE','15','090',1,'2012-11-29 03:33:00'),
 ('377','LA CALERA','25','090',1,'2012-11-29 03:33:00'),
 ('377','LABATECA','54','090',1,'2012-11-29 03:33:00'),
 ('377','LA BELLEZA','68','090',1,'2012-11-29 03:33:00'),
 ('377','LA CUMBRE','76','090',1,'2012-11-29 03:33:00'),
 ('378','LA ARGENTINA','41','090',1,'2012-11-29 03:33:00'),
 ('378','HATONUEVO','44','090',1,'2012-11-29 03:33:00'),
 ('378','LA CRUZ','52','090',1,'2012-11-29 03:33:00'),
 ('380','LA ESTRELLA','05','090',1,'2012-11-29 03:33:00'),
 ('380','LA CAPILLA','15','090',1,'2012-11-29 03:33:00'),
 ('380','LA DORADA','17','090',1,'2012-11-29 03:33:00'),
 ('381','LA FLORIDA','52','090',1,'2012-11-29 03:33:00'),
 ('383','LA GLORIA','20','090',1,'2012-11-29 03:33:00'),
 ('383','LA CELIA','66','090',1,'2012-11-29 03:33:00'),
 ('385','LA LLANADA','52','090',1,'2012-11-29 03:33:00'),
 ('385','LA ESPERANZA','54','090',1,'2012-11-29 03:33:00'),
 ('385','LANDAZURI','68','090',1,'2012-11-29 03:33:00'),
 ('386','LA MESA','25','090',1,'2012-11-29 03:33:00'),
 ('388','LA MERCED','17','090',1,'2012-11-29 03:33:00'),
 ('390','LA PINTADA','05','090',1,'2012-11-29 03:33:00'),
 ('390','LA TOLA','52','090',1,'2012-11-29 03:33:00'),
 ('392','LA SIERRA','19','090',1,'2012-11-29 03:33:00'),
 ('394','LA PALMA','25','090',1,'2012-11-29 03:33:00'),
 ('396','LA PLATA','41','090',1,'2012-11-29 03:33:00'),
 ('397','LA VEGA','19','090',1,'2012-11-29 03:33:00'),
 ('397','LA PAZ','68','090',1,'2012-11-29 03:33:00'),
 ('398','LA PEÑA','25','090',1,'2012-11-29 03:33:00'),
 ('398','LA PLAYA','54','090',1,'2012-11-29 03:33:00'),
 ('399','LA UNION','52','090',1,'2012-11-29 03:33:00'),
 ('400','LA UNION','05','090',1,'2012-11-29 03:33:00'),
 ('400','LA JAGUA IBIRICO','20','090',1,'2012-11-29 03:33:00'),
 ('400','LEJANIAS','50','090',1,'2012-11-29 03:33:00'),
 ('400','LA VIRGINIA','66','090',1,'2012-11-29 03:33:00'),
 ('400','LA UNION','70','090',1,'2012-11-29 03:33:00'),
 ('400','LA UNION','76','090',1,'2012-11-29 03:33:00'),
 ('400','TAMARA','85','090',1,'2012-11-29 03:33:00'),
 ('401','LA VICTORIA','15','090',1,'2012-11-29 03:33:00'),
 ('401','LA TEBAIDA','63','090',1,'2012-11-29 03:33:00'),
 ('402','LA VEGA','25','090',1,'2012-11-29 03:33:00'),
 ('403','LA UVITA','15','090',1,'2012-11-29 03:33:00'),
 ('403','LA VICTORIA','76','090',1,'2012-11-29 03:33:00'),
 ('405','LEIVA','52','090',1,'2012-11-29 03:33:00'),
 ('405','LOS PATIOS','54','090',1,'2012-11-29 03:33:00'),
 ('406','LEBRIJA','68','090',1,'2012-11-29 03:33:00'),
 ('407','LEIVA','15','090',1,'2012-11-29 03:33:00'),
 ('407','LENGUAZAQUE','25','090',1,'2012-11-29 03:33:00'),
 ('408','LERIDA','73','090',1,'2012-11-29 03:33:00'),
 ('410','LA MONTAÑITA','18','090',1,'2012-11-29 03:33:00'),
 ('410','TAURAMENA','85','090',1,'2012-11-29 03:33:00'),
 ('411','LIBORINA','05','090',1,'2012-11-29 03:33:00'),
 ('411','LINARES','52','090',1,'2012-11-29 03:33:00'),
 ('411','LIBANO','73','090',1,'2012-11-29 03:33:00'),
 ('413','LLORO','27','090',1,'2012-11-29 03:33:00'),
 ('417','LORICA','23','090',1,'2012-11-29 03:33:00'),
 ('418','LOPEZ','19','090',1,'2012-11-29 03:33:00'),
 ('418','LOS ANDES','52','090',1,'2012-11-29 03:33:00'),
 ('418','LOURDES','54','090',1,'2012-11-29 03:33:00'),
 ('418','LOS SANTOS','68','090',1,'2012-11-29 03:33:00'),
 ('418','LOS PALMITOS','70','090',1,'2012-11-29 03:33:00'),
 ('419','LOS CORDOBAS','23','090',1,'2012-11-29 03:33:00'),
 ('420','LA JAGUA DEL PILAR','44','090',1,'2012-11-29 03:33:00'),
 ('421','LURUACO','08','090',1,'2012-11-29 03:33:00'),
 ('425','MACEO','05','090',1,'2012-11-29 03:33:00'),
 ('425','MACANAL','15','090',1,'2012-11-29 03:33:00'),
 ('425','MEDIO ATRATO','27','090',1,'2012-11-29 03:33:00'),
 ('425','MACARAVITA','68','090',1,'2012-11-29 03:33:00'),
 ('426','MACHETA','25','090',1,'2012-11-29 03:33:00'),
 ('427','MAGUI','52','090',1,'2012-11-29 03:33:00'),
 ('429','MAJAGUAL','70','090',1,'2012-11-29 03:33:00'),
 ('430','MAGANGUE','13','090',1,'2012-11-29 03:33:00'),
 ('430','MADRID','25','090',1,'2012-11-29 03:33:00'),
 ('430','MEDIO BAUDO (BOCA DE PEPE)','27','090',1,'2012-11-29 03:33:00'),
 ('430','MAICAO','44','090',1,'2012-11-29 03:33:00'),
 ('430','TRINIDAD','85','090',1,'2012-11-29 03:33:00'),
 ('432','MALAGA','68','090',1,'2012-11-29 03:33:00'),
 ('433','MALAMBO','08','090',1,'2012-11-29 03:33:00'),
 ('433','MAHATES','13','090',1,'2012-11-29 03:33:00'),
 ('433','MANZANARES','17','090',1,'2012-11-29 03:33:00'),
 ('435','MALLAMA','52','090',1,'2012-11-29 03:33:00'),
 ('436','MANATI','08','090',1,'2012-11-29 03:33:00'),
 ('436','MANTA','25','090',1,'2012-11-29 03:33:00'),
 ('438','MEDINA','25','090',1,'2012-11-29 03:33:00'),
 ('440','MARINILLA','05','090',1,'2012-11-29 03:33:00'),
 ('440','MARGARITA','13','090',1,'2012-11-29 03:33:00'),
 ('440','MARSELLA','66','090',1,'2012-11-29 03:33:00'),
 ('440','VILLANUEVA','85','090',1,'2012-11-29 03:33:00'),
 ('442','MARIA LA BAJA','13','090',1,'2012-11-29 03:33:00'),
 ('442','MARIPI','15','090',1,'2012-11-29 03:33:00'),
 ('442','MARMATO','17','090',1,'2012-11-29 03:33:00'),
 ('443','MANAURE BALCON DEL CESAR','20','090',1,'2012-11-29 03:33:00'),
 ('443','MARIQUITA','73','090',1,'2012-11-29 03:33:00'),
 ('444','MARQUETALIA','17','090',1,'2012-11-29 03:33:00'),
 ('444','MATANZA','68','090',1,'2012-11-29 03:33:00'),
 ('446','MARULANDA','17','090',1,'2012-11-29 03:33:00'),
 ('449','MELGAR','73','090',1,'2012-11-29 03:33:00'),
 ('450','MERCADERES','19','090',1,'2012-11-29 03:33:00'),
 ('450','MEDIO SAN JUAN','27','090',1,'2012-11-29 03:33:00'),
 ('450','PUERTO CONCORDIA','50','090',1,'2012-11-29 03:33:00'),
 ('455','MIRAFLORES','15','090',1,'2012-11-29 03:33:00'),
 ('455','MIRANDA','19','090',1,'2012-11-29 03:33:00'),
 ('456','MISTRATO','66','090',1,'2012-11-29 03:33:00'),
 ('458','MONTECRISTO','13','090',1,'2012-11-29 03:33:00'),
 ('460','MILAN','18','090',1,'2012-11-29 03:33:00'),
 ('460','NUEVA GRANADA','47','090',1,'2012-11-29 03:33:00'),
 ('461','MURILLO','73','090',1,'2012-11-29 03:33:00'),
 ('464','MONGUA','15','090',1,'2012-11-29 03:33:00'),
 ('464','MOMIL','23','090',1,'2012-11-29 03:33:00'),
 ('464','MOGOTES','68','090',1,'2012-11-29 03:33:00'),
 ('466','MONGUI','15','090',1,'2012-11-29 03:33:00'),
 ('466','MONTELIBANO','23','090',1,'2012-11-29 03:33:00'),
 ('467','MONTEBELLO','05','090',1,'2012-11-29 03:33:00'),
 ('468','MOMPOS','13','090',1,'2012-11-29 03:33:00'),
 ('468','MOLAGAVITA','68','090',1,'2012-11-29 03:33:00'),
 ('469','MONIQUIRA','15','090',1,'2012-11-29 03:33:00'),
 ('470','MONTENEGRO','63','090',1,'2012-11-29 03:33:00'),
 ('473','MORALES','13','090',1,'2012-11-29 03:33:00'),
 ('473','MORALES','19','090',1,'2012-11-29 03:33:00'),
 ('473','MOSQUERA','25','090',1,'2012-11-29 03:33:00'),
 ('473','MOSQUERA','52','090',1,'2012-11-29 03:33:00'),
 ('473','MORROA','70','090',1,'2012-11-29 03:33:00'),
 ('475','MURINDO','05','090',1,'2012-11-29 03:33:00'),
 ('476','MOTAVITA','15','090',1,'2012-11-29 03:33:00'),
 ('479','MORELIA','18','090',1,'2012-11-29 03:33:00'),
 ('480','MUTATA','05','090',1,'2012-11-29 03:33:00'),
 ('480','MUZO','15','090',1,'2012-11-29 03:33:00'),
 ('480','NARIÑO','52','090',1,'2012-11-29 03:33:00'),
 ('480','MUTISCUA','54','090',1,'2012-11-29 03:33:00'),
 ('483','NARIÑO','05','090',1,'2012-11-29 03:33:00'),
 ('483','NARIÑO','25','090',1,'2012-11-29 03:33:00'),
 ('483','NATAGA','41','090',1,'2012-11-29 03:33:00'),
 ('483','NATAGAIMA','73','090',1,'2012-11-29 03:33:00'),
 ('486','NEIRA','17','090',1,'2012-11-29 03:33:00'),
 ('486','NEMOCON','25','090',1,'2012-11-29 03:33:00'),
 ('488','NILO','25','090',1,'2012-11-29 03:33:00'),
 ('489','NIMAIMA','25','090',1,'2012-11-29 03:33:00'),
 ('490','NECOCLI','05','090',1,'2012-11-29 03:33:00'),
 ('490','OLAYA HERRERA','52','090',1,'2012-11-29 03:33:00'),
 ('491','NOBSA','15','090',1,'2012-11-29 03:33:00'),
 ('491','NOCAIMA','25','090',1,'2012-11-29 03:33:00'),
 ('491','NOVITA','27','090',1,'2012-11-29 03:33:00'),
 ('494','NUEVO COLON','15','090',1,'2012-11-29 03:33:00'),
 ('495','NECHI','05','090',1,'2012-11-29 03:33:00'),
 ('495','NORCASIA','17','090',1,'2012-11-29 03:33:00'),
 ('495','NUQUI','27','090',1,'2012-11-29 03:33:00'),
 ('497','OBANDO','76','090',1,'2012-11-29 03:33:00'),
 ('498','OCAÑA','54','090',1,'2012-11-29 03:33:00'),
 ('498','OCAMONTE','68','090',1,'2012-11-29 03:33:00'),
 ('500','OICATA','15','090',1,'2012-11-29 03:33:00'),
 ('500','MOÑITOS','23','090',1,'2012-11-29 03:33:00'),
 ('500','OIBA','68','090',1,'2012-11-29 03:33:00'),
 ('501','OLAYA','05','090',1,'2012-11-29 03:33:00'),
 ('502','ONZAGA','68','090',1,'2012-11-29 03:33:00'),
 ('503','OPORAPA','41','090',1,'2012-11-29 03:33:00'),
 ('504','ORTEGA','73','090',1,'2012-11-29 03:33:00'),
 ('506','VENECIA (OSPINA PEREZ)','25','090',1,'2012-11-29 03:33:00'),
 ('506','OSPINA','52','090',1,'2012-11-29 03:33:00'),
 ('507','OTANCHE','15','090',1,'2012-11-29 03:33:00'),
 ('508','OVEJAS','70','090',1,'2012-11-29 03:33:00'),
 ('511','PACHAVITA','15','090',1,'2012-11-29 03:33:00'),
 ('513','PACORA','17','090',1,'2012-11-29 03:33:00'),
 ('513','PADILLA','19','090',1,'2012-11-29 03:33:00'),
 ('513','PACHO','25','090',1,'2012-11-29 03:33:00'),
 ('514','PAEZ','15','090',1,'2012-11-29 03:33:00'),
 ('516','PAIPA','15','090',1,'2012-11-29 03:33:00'),
 ('517','PAEZ','19','090',1,'2012-11-29 03:33:00'),
 ('517','PAILITAS','20','090',1,'2012-11-29 03:33:00'),
 ('518','PAJARITO','15','090',1,'2012-11-29 03:33:00'),
 ('518','PAIME','25','090',1,'2012-11-29 03:33:00'),
 ('518','PAICOL','41','090',1,'2012-11-29 03:33:00'),
 ('518','PAMPLONA','54','090',1,'2012-11-29 03:33:00'),
 ('520','PALMAR DE VARELA','08','090',1,'2012-11-29 03:33:00'),
 ('520','PIZARRO','52','090',1,'2012-11-29 03:33:00'),
 ('520','PAMPLONITA','54','090',1,'2012-11-29 03:33:00'),
 ('520','PALOCABILDO','73','090',1,'2012-11-29 03:33:00'),
 ('520','PALMIRA','76','090',1,'2012-11-29 03:33:00'),
 ('522','PANQUEBA','15','090',1,'2012-11-29 03:33:00'),
 ('522','PALMAR','68','090',1,'2012-11-29 03:33:00'),
 ('523','PALMITO','70','090',1,'2012-11-29 03:33:00'),
 ('524','PALESTINA','17','090',1,'2012-11-29 03:33:00'),
 ('524','PANDI','25','090',1,'2012-11-29 03:33:00'),
 ('524','PALERMO','41','090',1,'2012-11-29 03:33:00'),
 ('524','PALMAS DEL SOCORRO','68','090',1,'2012-11-29 03:33:00'),
 ('524','LA PRIMAVERA','99','090',1,'2012-11-29 03:33:00'),
 ('530','PARATEBUENO','25','090',1,'2012-11-29 03:33:00'),
 ('530','PALESTINA','41','090',1,'2012-11-29 03:33:00'),
 ('531','PAUNA','15','090',1,'2012-11-29 03:33:00'),
 ('532','PATIA(EL BORDO)','19','090',1,'2012-11-29 03:33:00'),
 ('533','PAYA','15','090',1,'2012-11-29 03:33:00'),
 ('533','PIAMONTE','19','090',1,'2012-11-29 03:33:00'),
 ('533','PARAMO','68','090',1,'2012-11-29 03:33:00'),
 ('535','PASCA','25','090',1,'2012-11-29 03:33:00'),
 ('537','PAZ DEL RIO','15','090',1,'2012-11-29 03:33:00'),
 ('540','POLICARPA','52','090',1,'2012-11-29 03:33:00'),
 ('540','PUERTO NARIÑO','91','090',1,'2012-11-29 03:33:00'),
 ('541','PEÑOL','05','090',1,'2012-11-29 03:33:00'),
 ('541','PENSILVANIA','17','090',1,'2012-11-29 03:33:00'),
 ('541','PEDRAZA','47','090',1,'2012-11-29 03:33:00'),
 ('542','PESCA','15','090',1,'2012-11-29 03:33:00'),
 ('543','PEQUE','05','090',1,'2012-11-29 03:33:00'),
 ('545','PIJIÑO DEL CARMEN','47','090',1,'2012-11-29 03:33:00'),
 ('547','PIEDECUESTA','68','090',1,'2012-11-29 03:33:00'),
 ('547','PIEDRAS','73','090',1,'2012-11-29 03:33:00'),
 ('548','PIENDAMO','19','090',1,'2012-11-29 03:33:00'),
 ('548','PITAL','41','090',1,'2012-11-29 03:33:00'),
 ('548','PIJAO','63','090',1,'2012-11-29 03:33:00'),
 ('549','PIOJO','08','090',1,'2012-11-29 03:33:00'),
 ('549','PINILLOS','13','090',1,'2012-11-29 03:33:00'),
 ('549','PINCHOTE','68','090',1,'2012-11-29 03:33:00'),
 ('550','PISBA','15','090',1,'2012-11-29 03:33:00'),
 ('550','PELAYA','20','090',1,'2012-11-29 03:33:00'),
 ('551','PITALITO','41','090',1,'2012-11-29 03:33:00'),
 ('551','PIVIJAY','47','090',1,'2012-11-29 03:33:00'),
 ('553','PUERTO SANTANDER','54','090',1,'2012-11-29 03:33:00'),
 ('555','PLANETA RICA','23','090',1,'2012-11-29 03:33:00'),
 ('555','PLATO','47','090',1,'2012-11-29 03:33:00'),
 ('555','PLANADAS','73','090',1,'2012-11-29 03:33:00'),
 ('558','POLO NUEVO','08','090',1,'2012-11-29 03:33:00'),
 ('560','PONEDERA','08','090',1,'2012-11-29 03:33:00'),
 ('560','MANAURE','44','090',1,'2012-11-29 03:33:00'),
 ('560','POTOSI','52','090',1,'2012-11-29 03:33:00'),
 ('563','PRADO','73','090',1,'2012-11-29 03:33:00'),
 ('563','PRADERA','76','090',1,'2012-11-29 03:33:00'),
 ('564','PROVIDENCIA','88','090',1,'2012-11-29 03:33:00'),
 ('565','PROVIDENCIA','52','090',1,'2012-11-29 03:33:00'),
 ('568','PUERTO GAITAN','50','090',1,'2012-11-29 03:33:00'),
 ('568','PUERTO ASIS','86','090',1,'2012-11-29 03:33:00'),
 ('569','PUERTO CAYCEDO','86','090',1,'2012-11-29 03:33:00'),
 ('570','PUEBLO BELLO','20','090',1,'2012-11-29 03:33:00'),
 ('570','PUEBLO NUEVO','23','090',1,'2012-11-29 03:33:00'),
 ('570','PUEBLOVIEJO','47','090',1,'2012-11-29 03:33:00'),
 ('571','PUERTO GUZMAN','86','090',1,'2012-11-29 03:33:00'),
 ('572','PUERTO BOYACA','15','090',1,'2012-11-29 03:33:00'),
 ('572','PUERTO SALGAR','25','090',1,'2012-11-29 03:33:00'),
 ('572','PUEBLO RICO','66','090',1,'2012-11-29 03:33:00'),
 ('572','PUENTE NACIONAL','68','090',1,'2012-11-29 03:33:00'),
 ('573','PUERTO COLOMBIA','08','090',1,'2012-11-29 03:33:00'),
 ('573','PUERTO TEJADA','19','090',1,'2012-11-29 03:33:00'),
 ('573','PUERTO LOPEZ','50','090',1,'2012-11-29 03:33:00'),
 ('573','PUERRES','52','090',1,'2012-11-29 03:33:00'),
 ('573','PUERTO PARRA','68','090',1,'2012-11-29 03:33:00'),
 ('573','PUERTO LEGUIZAMO','86','090',1,'2012-11-29 03:33:00'),
 ('574','PUERTO ESCONDIDO','23','090',1,'2012-11-29 03:33:00'),
 ('575','PUERTO WILCHES','68','090',1,'2012-11-29 03:33:00'),
 ('576','PUEBLORRICO','05','090',1,'2012-11-29 03:33:00'),
 ('577','PUERTO LLERAS','50','090',1,'2012-11-29 03:33:00'),
 ('579','PUERTO BERRIO','05','090',1,'2012-11-29 03:33:00'),
 ('580','REGIDOR','13','090',1,'2012-11-29 03:33:00'),
 ('580','QUIPAMA','15','090',1,'2012-11-29 03:33:00'),
 ('580','PUERTO LIBERTADOR','23','090',1,'2012-11-29 03:33:00'),
 ('580','PULI','25','090',1,'2012-11-29 03:33:00'),
 ('580','RIO IRO','27','090',1,'2012-11-29 03:33:00'),
 ('585','PUERTO NARE','05','090',1,'2012-11-29 03:33:00'),
 ('585','PURACE','19','090',1,'2012-11-29 03:33:00'),
 ('585','PUPIALES','52','090',1,'2012-11-29 03:33:00'),
 ('585','PURIFICACION','73','090',1,'2012-11-29 03:33:00'),
 ('586','PURISIMA','23','090',1,'2012-11-29 03:33:00'),
 ('590','PUERTO RICO','50','090',1,'2012-11-29 03:33:00'),
 ('591','PUERTO TRIUNFO','05','090',1,'2012-11-29 03:33:00'),
 ('591','PUERTO RONDON','81','090',1,'2012-11-29 03:33:00'),
 ('592','PUERTO RICO','18','090',1,'2012-11-29 03:33:00'),
 ('592','QUEBRADANEGRA','25','090',1,'2012-11-29 03:33:00'),
 ('594','QUETAME','25','090',1,'2012-11-29 03:33:00'),
 ('594','QUIMBAYA','63','090',1,'2012-11-29 03:33:00'),
 ('594','QUINCHIA','66','090',1,'2012-11-29 03:33:00'),
 ('596','QUIPILE','25','090',1,'2012-11-29 03:33:00'),
 ('599','RAMIRIQUI','15','090',1,'2012-11-29 03:33:00'),
 ('599','RAFAEL REYES','25','090',1,'2012-11-29 03:33:00'),
 ('599','RAGONVALIA','54','090',1,'2012-11-29 03:33:00'),
 ('600','RIO VIEJO','13','090',1,'2012-11-29 03:33:00'),
 ('600','RAQUIRA','15','090',1,'2012-11-29 03:33:00'),
 ('600','RIO QUITO','27','090',1,'2012-11-29 03:33:00'),
 ('604','REMEDIOS','05','090',1,'2012-11-29 03:33:00'),
 ('605','REMOLINO','47','090',1,'2012-11-29 03:33:00'),
 ('606','REPELON','08','090',1,'2012-11-29 03:33:00'),
 ('606','RESTREPO','50','090',1,'2012-11-29 03:33:00'),
 ('606','RESTREPO','76','090',1,'2012-11-29 03:33:00'),
 ('607','RETIRO','05','090',1,'2012-11-29 03:33:00'),
 ('610','SAN JOSE DE FRAGUA','18','090',1,'2012-11-29 03:33:00'),
 ('612','RICAURTE','25','090',1,'2012-11-29 03:33:00'),
 ('612','RICAURTE','52','090',1,'2012-11-29 03:33:00'),
 ('614','RIOSUCIO','17','090',1,'2012-11-29 03:33:00'),
 ('614','RIO DE ORO','20','090',1,'2012-11-29 03:33:00'),
 ('615','RIONEGRO','05','090',1,'2012-11-29 03:33:00'),
 ('615','RIOSUCIO','27','090',1,'2012-11-29 03:33:00'),
 ('615','RIVERA','41','090',1,'2012-11-29 03:33:00'),
 ('615','RIONEGRO','68','090',1,'2012-11-29 03:33:00'),
 ('616','RISARALDA','17','090',1,'2012-11-29 03:33:00'),
 ('616','RIOBLANCO','73','090',1,'2012-11-29 03:33:00'),
 ('616','RIOFRIO','76','090',1,'2012-11-29 03:33:00'),
 ('620','SAN CRISTOBAL','13','090',1,'2012-11-29 03:33:00'),
 ('621','RONDON','15','090',1,'2012-11-29 03:33:00'),
 ('621','ROBLES (LA PAZ)','20','090',1,'2012-11-29 03:33:00'),
 ('621','ROBERTO PAYAN','52','090',1,'2012-11-29 03:33:00'),
 ('622','ROSAS','19','090',1,'2012-11-29 03:33:00'),
 ('622','RONCESVALLES','73','090',1,'2012-11-29 03:33:00'),
 ('622','ROLDANILLO','76','090',1,'2012-11-29 03:33:00'),
 ('624','ROVIRA','73','090',1,'2012-11-29 03:33:00'),
 ('624','SANTA ROSALIA','99','090',1,'2012-11-29 03:33:00'),
 ('628','SABANALARGA','05','090',1,'2012-11-29 03:33:00'),
 ('631','SABANETA','05','090',1,'2012-11-29 03:33:00'),
 ('632','SABOYA','15','090',1,'2012-11-29 03:33:00'),
 ('634','SABANAGRANDE','08','090',1,'2012-11-29 03:33:00'),
 ('638','SABANALARGA','08','090',1,'2012-11-29 03:33:00'),
 ('638','SACHICA','15','090',1,'2012-11-29 03:33:00'),
 ('642','SALGAR','05','090',1,'2012-11-29 03:33:00'),
 ('645','SAN  ANTONIO DEL  TEQUENDAMA','25','090',1,'2012-11-29 03:33:00'),
 ('646','SAMACA','15','090',1,'2012-11-29 03:33:00'),
 ('647','SAN ANDRES','05','090',1,'2012-11-29 03:33:00'),
 ('647','SAN ESTANISLAO','13','090',1,'2012-11-29 03:33:00'),
 ('649','SAN CARLOS','05','090',1,'2012-11-29 03:33:00'),
 ('649','SAN BERNARDO','25','090',1,'2012-11-29 03:33:00'),
 ('650','SAN FERNANDO','13','090',1,'2012-11-29 03:33:00'),
 ('650','SAN JUAN DEL CESAR','44','090',1,'2012-11-29 03:33:00'),
 ('652','SAN FRANCISCO','05','090',1,'2012-11-29 03:33:00'),
 ('653','SALAMINA','17','090',1,'2012-11-29 03:33:00'),
 ('653','SAN CAYETANO','25','090',1,'2012-11-29 03:33:00'),
 ('654','SAN JACINTO','13','090',1,'2012-11-29 03:33:00'),
 ('655','SAN JACINTO DEL CAUCA','13','090',1,'2012-11-29 03:33:00'),
 ('655','SABANA DE TORRES','68','090',1,'2012-11-29 03:33:00'),
 ('656','SAN JERONIMO','05','090',1,'2012-11-29 03:33:00'),
 ('657','SAN JUAN NEPOMUCENO','13','090',1,'2012-11-29 03:33:00'),
 ('658','SAN JOSE DE LA MONTAÑA','05','090',1,'2012-11-29 03:33:00'),
 ('658','SAN FRANCISCO','25','090',1,'2012-11-29 03:33:00'),
 ('659','SAN JUAN DE URABA','05','090',1,'2012-11-29 03:33:00'),
 ('660','SAN LUIS','05','090',1,'2012-11-29 03:33:00'),
 ('660','SAN EDUARDO','15','090',1,'2012-11-29 03:33:00'),
 ('660','SAHAGUN','23','090',1,'2012-11-29 03:33:00'),
 ('660','SAN JOSE DEL PALMAR','27','090',1,'2012-11-29 03:33:00'),
 ('660','SALADOBLANCO','41','090',1,'2012-11-29 03:33:00'),
 ('660','SABANAS DE SAN ANGEL','47','090',1,'2012-11-29 03:33:00'),
 ('660','SALAZAR','54','090',1,'2012-11-29 03:33:00'),
 ('662','SAMANA','17','090',1,'2012-11-29 03:33:00'),
 ('662','SAN JUAN DE RIOSECO','25','090',1,'2012-11-29 03:33:00'),
 ('664','SAN PEDRO','05','090',1,'2012-11-29 03:33:00'),
 ('664','SAN JOSE DE PARE','15','090',1,'2012-11-29 03:33:00'),
 ('665','SAN PEDRO DE URABA','05','090',1,'2012-11-29 03:33:00'),
 ('665','SAN JOSE','17','090',1,'2012-11-29 03:33:00'),
 ('666','TARAIRA','97','090',1,'2012-11-29 03:33:00'),
 ('667','SAN RAFAEL','05','090',1,'2012-11-29 03:33:00'),
 ('667','SAN MARTIN DE LOBA','13','090',1,'2012-11-29 03:33:00'),
 ('667','SAN LUIS DE GACENO','15','090',1,'2012-11-29 03:33:00'),
 ('668','SAN AGUSTIN','41','090',1,'2012-11-29 03:33:00'),
 ('669','SAN ANDRES','68','090',1,'2012-11-29 03:33:00'),
 ('670','SAN ROQUE','05','090',1,'2012-11-29 03:33:00'),
 ('670','SAN PABLO','13','090',1,'2012-11-29 03:33:00'),
 ('670','SAN ANDRES SOTAVENTO','23','090',1,'2012-11-29 03:33:00'),
 ('670','SAN CALIXTO','54','090',1,'2012-11-29 03:33:00'),
 ('670','SAMPUES','70','090',1,'2012-11-29 03:33:00'),
 ('670','SAN PEDRO','76','090',1,'2012-11-29 03:33:00'),
 ('671','SALDAÑA','73','090',1,'2012-11-29 03:33:00'),
 ('672','SAN ANTERO','23','090',1,'2012-11-29 03:33:00'),
 ('673','SANTA CATALINA','13','090',1,'2012-11-29 03:33:00'),
 ('673','SAN MATEO','15','090',1,'2012-11-29 03:33:00'),
 ('673','SAN CAYETANO','54','090',1,'2012-11-29 03:33:00'),
 ('673','SAN BENITO','68','090',1,'2012-11-29 03:33:00'),
 ('674','SAN VICENTE','05','090',1,'2012-11-29 03:33:00'),
 ('675','SANTA LUCIA','08','090',1,'2012-11-29 03:33:00'),
 ('675','SAN BERNARDO VIENTO','23','090',1,'2012-11-29 03:33:00'),
 ('675','SALAMINA','47','090',1,'2012-11-29 03:33:00'),
 ('675','SAN ANTONIO','73','090',1,'2012-11-29 03:33:00'),
 ('676','SAN MIGUEL DE SEMA','15','090',1,'2012-11-29 03:33:00'),
 ('676','SANTA MARIA','41','090',1,'2012-11-29 03:33:00'),
 ('678','SAN CARLOS','23','090',1,'2012-11-29 03:33:00'),
 ('678','SAMANIEGO','52','090',1,'2012-11-29 03:33:00'),
 ('678','SAN BENITO ABAD','70','090',1,'2012-11-29 03:33:00'),
 ('678','SAN LUIS','73','090',1,'2012-11-29 03:33:00'),
 ('679','SANTA BARBARA','05','090',1,'2012-11-29 03:33:00'),
 ('679','SAN GIL','68','090',1,'2012-11-29 03:33:00'),
 ('680','SAN CARLOS GUAROA','50','090',1,'2012-11-29 03:33:00'),
 ('680','SANTIAGO','54','090',1,'2012-11-29 03:33:00'),
 ('681','SAN PABLO DE BORBUR','15','090',1,'2012-11-29 03:33:00'),
 ('682','SANTA ROSA DE CABAL','66','090',1,'2012-11-29 03:33:00'),
 ('682','SAN JOAQUIN','68','090',1,'2012-11-29 03:33:00'),
 ('683','SANTA ROSA','13','090',1,'2012-11-29 03:33:00'),
 ('683','SAN  JUAN DE ARAMA','50','090',1,'2012-11-29 03:33:00'),
 ('683','SANDONA','52','090',1,'2012-11-29 03:33:00'),
 ('684','SAN JOSE DE MIRANDA','68','090',1,'2012-11-29 03:33:00'),
 ('685','SANTO TOMAS','08','090',1,'2012-11-29 03:33:00'),
 ('685','SAN BERNARDO','52','090',1,'2012-11-29 03:33:00'),
 ('686','SANTA ROSA DE OSOS','05','090',1,'2012-11-29 03:33:00'),
 ('686','SANTANA','15','090',1,'2012-11-29 03:33:00'),
 ('686','SAN PELAYO','23','090',1,'2012-11-29 03:33:00'),
 ('686','SAN JUANITO','50','090',1,'2012-11-29 03:33:00'),
 ('686','SAN MIGUEL','68','090',1,'2012-11-29 03:33:00'),
 ('686','SANTA ISABEL','73','090',1,'2012-11-29 03:33:00'),
 ('687','SAN LORENZO','52','090',1,'2012-11-29 03:33:00'),
 ('687','SANTUARIO','66','090',1,'2012-11-29 03:33:00'),
 ('688','SANTA ROSA DEL SUR','13','090',1,'2012-11-29 03:33:00'),
 ('689','SAN MARTIN','50','090',1,'2012-11-29 03:33:00'),
 ('689','SAN VICENTE DE CHUCURI','68','090',1,'2012-11-29 03:33:00'),
 ('690','SANTO DOMINGO','05','090',1,'2012-11-29 03:33:00'),
 ('690','SANTA MARIA','15','090',1,'2012-11-29 03:33:00'),
 ('690','SALENTO','63','090',1,'2012-11-29 03:33:00'),
 ('692','SAN SEBASTIAN DE BUENAVISTA','47','090',1,'2012-11-29 03:33:00'),
 ('693','SANTA ROSA DE VITERBO','15','090',1,'2012-11-29 03:33:00'),
 ('693','SAN SEBASTIAN','19','090',1,'2012-11-29 03:33:00'),
 ('693','SAN PABLO','52','090',1,'2012-11-29 03:33:00'),
 ('694','SAN PEDRO DE CARTAGO','52','090',1,'2012-11-29 03:33:00'),
 ('696','SANTA SOFIA','15','090',1,'2012-11-29 03:33:00'),
 ('696','SANTA BARBARA','52','090',1,'2012-11-29 03:33:00'),
 ('697','SANTUARIO','05','090',1,'2012-11-29 03:33:00'),
 ('698','SANTANDER DE QUILICHAO','19','090',1,'2012-11-29 03:33:00'),
 ('699','SANTACRUZ','52','090',1,'2012-11-29 03:33:00'),
 ('701','STA ROSA','19','090',1,'2012-11-29 03:33:00'),
 ('702','SAN JUAN DE BETULIA','70','090',1,'2012-11-29 03:33:00'),
 ('703','SAN ZENON','47','090',1,'2012-11-29 03:33:00'),
 ('705','SANTA BARBARA','68','090',1,'2012-11-29 03:33:00'),
 ('707','SANTA ANA','47','090',1,'2012-11-29 03:33:00'),
 ('708','SAN MARCOS','70','090',1,'2012-11-29 03:33:00'),
 ('710','SAN ALBERTO','20','090',1,'2012-11-29 03:33:00'),
 ('711','VISTA HERMOSA','50','090',1,'2012-11-29 03:33:00'),
 ('713','SAN ONOFRE','70','090',1,'2012-11-29 03:33:00'),
 ('717','SAN PEDRO','70','090',1,'2012-11-29 03:33:00'),
 ('718','SASAIMA','25','090',1,'2012-11-29 03:33:00'),
 ('720','SATIVANORTE','15','090',1,'2012-11-29 03:33:00'),
 ('720','SANTA BARBARA DE PINTO','47','090',1,'2012-11-29 03:33:00'),
 ('720','SAPUYES','52','090',1,'2012-11-29 03:33:00'),
 ('720','SARDINATA','54','090',1,'2012-11-29 03:33:00'),
 ('720','SANTA HELENA','68','090',1,'2012-11-29 03:33:00'),
 ('723','SATIVASUR','15','090',1,'2012-11-29 03:33:00'),
 ('736','SEGOVIA','05','090',1,'2012-11-29 03:33:00'),
 ('736','SESQUILE','25','090',1,'2012-11-29 03:33:00'),
 ('736','SEVILLA','76','090',1,'2012-11-29 03:33:00'),
 ('736','SARAVENA','81','090',1,'2012-11-29 03:33:00'),
 ('740','SIACHOQUE','15','090',1,'2012-11-29 03:33:00'),
 ('740','SIBATE','25','090',1,'2012-11-29 03:33:00'),
 ('742','SINCE','70','090',1,'2012-11-29 03:33:00'),
 ('743','SILVIA','19','090',1,'2012-11-29 03:33:00'),
 ('743','SILVANIA','25','090',1,'2012-11-29 03:33:00'),
 ('743','SILOS','54','090',1,'2012-11-29 03:33:00'),
 ('744','SIMITI','13','090',1,'2012-11-29 03:33:00'),
 ('745','SIMIJACA','25','090',1,'2012-11-29 03:33:00'),
 ('745','SIPI','27','090',1,'2012-11-29 03:33:00'),
 ('745','SITIONUEVO','47','090',1,'2012-11-29 03:33:00'),
 ('745','SIMACOTA','68','090',1,'2012-11-29 03:33:00'),
 ('749','SIBUNDOY','86','090',1,'2012-11-29 03:33:00'),
 ('750','SAN DIEGO','20','090',1,'2012-11-29 03:33:00'),
 ('753','SOATA','15','090',1,'2012-11-29 03:33:00'),
 ('753','SAN  VICENTE DEL CAGUAN','18','090',1,'2012-11-29 03:33:00'),
 ('754','SOACHA','25','090',1,'2012-11-29 03:33:00'),
 ('755','SOCOTA','15','090',1,'2012-11-29 03:33:00'),
 ('755','SOCORRO','68','090',1,'2012-11-29 03:33:00'),
 ('755','SAN FRANCISCO','86','090',1,'2012-11-29 03:33:00'),
 ('756','SONSON','05','090',1,'2012-11-29 03:33:00'),
 ('756','SOLANO','18','090',1,'2012-11-29 03:33:00'),
 ('757','SOCHA','15','090',1,'2012-11-29 03:33:00'),
 ('757','SAN MIGUEL','86','090',1,'2012-11-29 03:33:00'),
 ('758','SOLEDAD','08','090',1,'2012-11-29 03:33:00'),
 ('758','SOPO','25','090',1,'2012-11-29 03:33:00'),
 ('759','SOGAMOSO','15','090',1,'2012-11-29 03:33:00'),
 ('760','SOPLAVIENTO','13','090',1,'2012-11-29 03:33:00'),
 ('760','SOTARA','19','090',1,'2012-11-29 03:33:00'),
 ('760','SANTIAGO','86','090',1,'2012-11-29 03:33:00'),
 ('761','SOPETRAN','05','090',1,'2012-11-29 03:33:00'),
 ('761','SOMONDOCO','15','090',1,'2012-11-29 03:33:00'),
 ('762','SORA','15','090',1,'2012-11-29 03:33:00'),
 ('763','SOTAQUIRA','15','090',1,'2012-11-29 03:33:00'),
 ('764','SORACA','15','090',1,'2012-11-29 03:33:00'),
 ('769','SUBACHOQUE','25','090',1,'2012-11-29 03:33:00'),
 ('770','SUAN','08','090',1,'2012-11-29 03:33:00'),
 ('770','SAN MARTIN','20','090',1,'2012-11-29 03:33:00'),
 ('770','SUAZA','41','090',1,'2012-11-29 03:33:00'),
 ('770','SUAITA','68','090',1,'2012-11-29 03:33:00'),
 ('770','SUAREZ','73','090',1,'2012-11-29 03:33:00'),
 ('771','SUCRE','70','090',1,'2012-11-29 03:33:00'),
 ('772','SUESCA','25','090',1,'2012-11-29 03:33:00'),
 ('773','SUCRE','68','090',1,'2012-11-29 03:33:00'),
 ('773','CUMARIBO','99','090',1,'2012-11-29 03:33:00'),
 ('774','SUSACON','15','090',1,'2012-11-29 03:33:00'),
 ('776','SUTAMARCHAN','15','090',1,'2012-11-29 03:33:00'),
 ('777','SUPIA','17','090',1,'2012-11-29 03:33:00'),
 ('777','SUPATA','25','090',1,'2012-11-29 03:33:00'),
 ('778','SUTATENZA','15','090',1,'2012-11-29 03:33:00'),
 ('779','SUSA','25','090',1,'2012-11-29 03:33:00'),
 ('780','TALAIGUA NUEVO','13','090',1,'2012-11-29 03:33:00'),
 ('780','SUAREZ','19','090',1,'2012-11-29 03:33:00'),
 ('780','SURATA','68','090',1,'2012-11-29 03:33:00'),
 ('781','SUTATAUSA','25','090',1,'2012-11-29 03:33:00'),
 ('785','SOLITA','18','090',1,'2012-11-29 03:33:00'),
 ('785','SUCRE','19','090',1,'2012-11-29 03:33:00'),
 ('785','TABIO','25','090',1,'2012-11-29 03:33:00'),
 ('786','TAMINANGO','52','090',1,'2012-11-29 03:33:00'),
 ('787','TAMALAMEQUE','20','090',1,'2012-11-29 03:33:00'),
 ('787','TADO','27','090',1,'2012-11-29 03:33:00'),
 ('788','TANGUA','52','090',1,'2012-11-29 03:33:00'),
 ('789','TAMESIS','05','090',1,'2012-11-29 03:33:00'),
 ('790','TARAZA','05','090',1,'2012-11-29 03:33:00'),
 ('790','TASCO','15','090',1,'2012-11-29 03:33:00'),
 ('791','TARQUI','41','090',1,'2012-11-29 03:33:00'),
 ('792','TARSO','05','090',1,'2012-11-29 03:33:00'),
 ('793','TAUSA','25','090',1,'2012-11-29 03:33:00'),
 ('794','TAME','81','090',1,'2012-11-29 03:33:00'),
 ('797','TENA','25','090',1,'2012-11-29 03:33:00'),
 ('797','TESALIA','41','090',1,'2012-11-29 03:33:00'),
 ('798','TENZA','15','090',1,'2012-11-29 03:33:00'),
 ('798','TENERIFE','47','090',1,'2012-11-29 03:33:00'),
 ('799','TENJO','25','090',1,'2012-11-29 03:33:00'),
 ('799','TELLO','41','090',1,'2012-11-29 03:33:00'),
 ('800','UNGUIA','27','090',1,'2012-11-29 03:33:00'),
 ('800','TEORAMA','54','090',1,'2012-11-29 03:33:00'),
 ('801','TERUEL','41','090',1,'2012-11-29 03:33:00'),
 ('804','TIBANA','15','090',1,'2012-11-29 03:33:00'),
 ('805','TIBACUY','25','090',1,'2012-11-29 03:33:00'),
 ('806','TIBASOSA','15','090',1,'2012-11-29 03:33:00'),
 ('807','TIMBIO','19','090',1,'2012-11-29 03:33:00'),
 ('807','TIERRALTA','23','090',1,'2012-11-29 03:33:00'),
 ('807','TIBIRITA','25','090',1,'2012-11-29 03:33:00'),
 ('807','TIMANA','41','090',1,'2012-11-29 03:33:00'),
 ('808','TINJACA','15','090',1,'2012-11-29 03:33:00'),
 ('809','TITIRIBI','05','090',1,'2012-11-29 03:33:00'),
 ('809','TIMBIQUI','19','090',1,'2012-11-29 03:33:00'),
 ('810','TIQUISIO','13','090',1,'2012-11-29 03:33:00'),
 ('810','TIPACOQUE','15','090',1,'2012-11-29 03:33:00'),
 ('810','UNION PANAMERICANA','27','090',1,'2012-11-29 03:33:00'),
 ('810','TIBU','54','090',1,'2012-11-29 03:33:00'),
 ('814','TOCA','15','090',1,'2012-11-29 03:33:00'),
 ('815','TOCAIMA','25','090',1,'2012-11-29 03:33:00'),
 ('816','TOGUI','15','090',1,'2012-11-29 03:33:00'),
 ('817','TOCANCIPA','25','090',1,'2012-11-29 03:33:00'),
 ('819','TOLEDO','05','090',1,'2012-11-29 03:33:00'),
 ('820','TOPAGA','15','090',1,'2012-11-29 03:33:00'),
 ('820','TOLEDO','54','090',1,'2012-11-29 03:33:00'),
 ('820','TONA','68','090',1,'2012-11-29 03:33:00'),
 ('820','TOLU','70','090',1,'2012-11-29 03:33:00'),
 ('821','TORIBIO','19','090',1,'2012-11-29 03:33:00'),
 ('822','TOTA','15','090',1,'2012-11-29 03:33:00'),
 ('823','TOPAIPI','25','090',1,'2012-11-29 03:33:00'),
 ('823','TOLUVIEJO','70','090',1,'2012-11-29 03:33:00'),
 ('823','TORO','76','090',1,'2012-11-29 03:33:00'),
 ('824','TOTORO','19','090',1,'2012-11-29 03:33:00'),
 ('828','TRUJILLO','76','090',1,'2012-11-29 03:33:00'),
 ('832','TUBARA','08','090',1,'2012-11-29 03:33:00'),
 ('832','TUNUNGUA','15','090',1,'2012-11-29 03:33:00'),
 ('834','TULUA','76','090',1,'2012-11-29 03:33:00'),
 ('835','TURMEQUE','15','090',1,'2012-11-29 03:33:00'),
 ('835','TUMACO','52','090',1,'2012-11-29 03:33:00'),
 ('836','TURBACO','13','090',1,'2012-11-29 03:33:00'),
 ('837','TURBO','05','090',1,'2012-11-29 03:33:00'),
 ('837','TUTA','15','090',1,'2012-11-29 03:33:00'),
 ('838','TURBANA','13','090',1,'2012-11-29 03:33:00'),
 ('838','TUQUERRES','52','090',1,'2012-11-29 03:33:00'),
 ('839','TUTASA','15','090',1,'2012-11-29 03:33:00'),
 ('839','UBALA','25','090',1,'2012-11-29 03:33:00'),
 ('841','UBAQUE','25','090',1,'2012-11-29 03:33:00'),
 ('842','URAMITA','05','090',1,'2012-11-29 03:33:00'),
 ('842','UMBITA','15','090',1,'2012-11-29 03:33:00'),
 ('843','UBATE','25','090',1,'2012-11-29 03:33:00'),
 ('845','VILLA RICA','19','090',1,'2012-11-29 03:33:00'),
 ('845','UNE','25','090',1,'2012-11-29 03:33:00'),
 ('845','ULLOA','76','090',1,'2012-11-29 03:33:00'),
 ('847','URRAO','05','090',1,'2012-11-29 03:33:00'),
 ('847','URIBIA','44','090',1,'2012-11-29 03:33:00'),
 ('849','USIACURI','08','090',1,'2012-11-29 03:33:00'),
 ('851','UTICA','25','090',1,'2012-11-29 03:33:00'),
 ('854','VALDIVIA','05','090',1,'2012-11-29 03:33:00'),
 ('854','VALLE DE S JUAN','73','090',1,'2012-11-29 03:33:00'),
 ('855','VALENCIA','23','090',1,'2012-11-29 03:33:00'),
 ('855','URUMITA','44','090',1,'2012-11-29 03:33:00'),
 ('855','VALLE SAN JOSE','68','090',1,'2012-11-29 03:33:00'),
 ('856','VALPARAISO','05','090',1,'2012-11-29 03:33:00'),
 ('858','VEGACHI','05','090',1,'2012-11-29 03:33:00'),
 ('860','VALPARAISO','18','090',1,'2012-11-29 03:33:00'),
 ('861','VENECIA','05','090',1,'2012-11-29 03:33:00'),
 ('861','VENTAQUEMADA','15','090',1,'2012-11-29 03:33:00'),
 ('861','VELEZ','68','090',1,'2012-11-29 03:33:00'),
 ('861','VENADILLO','73','090',1,'2012-11-29 03:33:00'),
 ('862','VERGARA','25','090',1,'2012-11-29 03:33:00'),
 ('863','VERSALLES','76','090',1,'2012-11-29 03:33:00'),
 ('865','VALLE DEL GUAMUEZ','86','090',1,'2012-11-29 03:33:00'),
 ('867','VICTORIA','17','090',1,'2012-11-29 03:33:00'),
 ('867','VIANI','25','090',1,'2012-11-29 03:33:00'),
 ('867','VETAS','68','090',1,'2012-11-29 03:33:00'),
 ('869','VIJES','76','090',1,'2012-11-29 03:33:00'),
 ('870','VILLAHERMOSA','73','090',1,'2012-11-29 03:33:00'),
 ('871','VILLAGOMEZ','25','090',1,'2012-11-29 03:33:00'),
 ('871','VILLACARO','54','090',1,'2012-11-29 03:33:00'),
 ('872','VILLAVIEJA','41','090',1,'2012-11-29 03:33:00'),
 ('872','VILLANUEVA','68','090',1,'2012-11-29 03:33:00'),
 ('873','VIGIA DEL FUERTE','05','090',1,'2012-11-29 03:33:00'),
 ('873','VILLANUEVA','13','090',1,'2012-11-29 03:33:00'),
 ('873','VILLAMARIA','17','090',1,'2012-11-29 03:33:00'),
 ('873','VILLAPINZON','25','090',1,'2012-11-29 03:33:00'),
 ('873','VILLARRICA','73','090',1,'2012-11-29 03:33:00'),
 ('874','VILLANUEVA','44','090',1,'2012-11-29 03:33:00'),
 ('874','VILLA DEL ROSARIO','54','090',1,'2012-11-29 03:33:00'),
 ('875','VILLETA','25','090',1,'2012-11-29 03:33:00'),
 ('877','VITERBO','17','090',1,'2012-11-29 03:33:00'),
 ('878','VIOTA','25','090',1,'2012-11-29 03:33:00'),
 ('879','VIRACACHA','15','090',1,'2012-11-29 03:33:00'),
 ('885','YALI','05','090',1,'2012-11-29 03:33:00'),
 ('885','YACOPI','25','090',1,'2012-11-29 03:33:00'),
 ('885','YAGUARA','41','090',1,'2012-11-29 03:33:00'),
 ('885','YACUANQUER','52','090',1,'2012-11-29 03:33:00'),
 ('885','VILLAGARZON','86','090',1,'2012-11-29 03:33:00'),
 ('887','YARUMAL','05','090',1,'2012-11-29 03:33:00'),
 ('890','YOLOMBO','05','090',1,'2012-11-29 03:33:00'),
 ('890','YOTOCO','76','090',1,'2012-11-29 03:33:00'),
 ('892','YUMBO','76','090',1,'2012-11-29 03:33:00'),
 ('893','YONDO','05','090',1,'2012-11-29 03:33:00'),
 ('894','ZAMBRANO','13','090',1,'2012-11-29 03:33:00'),
 ('895','ZARAGOZA','05','090',1,'2012-11-29 03:33:00'),
 ('895','ZAPATOCA','68','090',1,'2012-11-29 03:33:00'),
 ('895','ZARZAL','76','090',1,'2012-11-29 03:33:00'),
 ('897','ZETAQUIRA','15','090',1,'2012-11-29 03:33:00'),
 ('898','ZIPACON','25','090',1,'2012-11-29 03:33:00'),
 ('899','ZIPAQUIRA','25','090',1,'2012-11-29 03:33:00'),
 ('960','ZAPAYAN','47','090',1,'2012-11-29 03:33:00'),
 ('980','ZONA BANANERA','47','090',1,'2012-11-29 03:33:00'),
 ('989','CHICORAL','73','090',1,'2012-11-29 03:33:00');
/*!40000 ALTER TABLE `pmunicipios` ENABLE KEYS */;


--
-- Definition of table `ppaises`
--

DROP TABLE IF EXISTS `ppaises`;
CREATE TABLE `ppaises` (
  `id` varchar(3) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_pPaises_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_pPaises_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ppaises`
--

/*!40000 ALTER TABLE `ppaises` DISABLE KEYS */;
INSERT INTO `ppaises` (`id`,`nombre`,`sUsuarios_id`,`fecha_modificacion`) VALUES 
 ('005','Alemania',1,'2012-12-04 10:49:00'),
 ('010','American Samoa',1,'2012-11-29 03:33:00'),
 ('015','Andorra',1,'2012-11-29 03:33:00'),
 ('020','Antillas Netherlands',1,'2012-11-29 03:33:00'),
 ('025','Argentina',1,'2012-11-29 03:33:00'),
 ('030','Armenia',1,'2012-11-29 03:33:00'),
 ('035','Aruba',1,'2012-11-29 03:33:00'),
 ('040','Australia',1,'2012-11-29 03:33:00'),
 ('045','Austria',1,'2012-11-29 03:33:00'),
 ('050','Bahamas',1,'2012-11-29 03:33:00'),
 ('055','Belgica',1,'2012-11-29 03:33:00'),
 ('060','Bermudas',1,'2012-11-29 03:33:00'),
 ('065','Bolivia',1,'2012-11-29 03:33:00'),
 ('070','Brasil',1,'2012-11-29 03:33:00'),
 ('075','Bulgaria',1,'2012-11-29 03:33:00'),
 ('080','Burundi',1,'2012-11-29 03:33:00'),
 ('085','Canada',1,'2012-11-29 03:33:00'),
 ('090','Colombia',1,'2012-11-29 03:33:00'),
 ('095','Corea',1,'2012-11-29 03:33:00'),
 ('100','Costa Rica',1,'2012-11-29 03:33:00'),
 ('105','Croatia',1,'2012-11-29 03:33:00'),
 ('110','Cuba',1,'2012-11-29 03:33:00'),
 ('115','Chile',1,'2012-11-29 03:33:00'),
 ('120','China',1,'2012-11-29 03:33:00'),
 ('125','Dinamarca',1,'2012-11-29 03:33:00'),
 ('130','Ecuador',1,'2012-11-29 03:33:00'),
 ('135','El Salvador',1,'2012-11-29 03:33:00'),
 ('140','España',1,'2012-11-29 03:33:00'),
 ('145','Estados Unidos',1,'2012-11-29 03:33:00'),
 ('150','Estonia',1,'2012-11-29 03:33:00'),
 ('155','Faroe Islands',1,'2012-11-29 03:33:00'),
 ('160','Filipinas',1,'2012-11-29 03:33:00'),
 ('165','Finlandia',1,'2012-11-29 03:33:00'),
 ('170','Francia',1,'2012-11-29 03:33:00'),
 ('175','Gran Bretaña',1,'2012-11-29 03:33:00'),
 ('180','Grecia',1,'2012-11-29 03:33:00'),
 ('185','Greenland',1,'2012-11-29 03:33:00'),
 ('190','Guatemala',1,'2012-11-29 03:33:00'),
 ('195','Guayana Francesa',1,'2012-11-29 03:33:00'),
 ('200','Honduras',1,'2012-11-29 03:33:00'),
 ('205','Hong Kong',1,'2012-11-29 03:33:00'),
 ('210','Hungria',1,'2012-11-29 03:33:00'),
 ('215','Irlanda',1,'2012-11-29 03:33:00'),
 ('220','Isla de Man',1,'2012-11-29 03:33:00'),
 ('225','Islas Caimanes',1,'2012-11-29 03:33:00'),
 ('230','Islas Virgenes Inglesas',1,'2012-11-29 03:33:00'),
 ('235','Islas Virgenes U.S.',1,'2012-11-29 03:33:00'),
 ('240','Israel',1,'2012-11-29 03:33:00'),
 ('245','Italia',1,'2012-11-29 03:33:00'),
 ('250','Jamaica',1,'2012-11-29 03:33:00'),
 ('255','Japon',1,'2012-11-29 03:33:00'),
 ('260','Jordania',1,'2012-11-29 03:33:00'),
 ('265','Libano',1,'2012-11-29 03:33:00'),
 ('270','Liberia',1,'2012-11-29 03:33:00'),
 ('275','Liechenstein',1,'2012-11-29 03:33:00'),
 ('280','Lithuania',1,'2012-11-29 03:33:00'),
 ('285','Luxemburgo',1,'2012-11-29 03:33:00'),
 ('290','Malaysia',1,'2012-11-29 03:33:00'),
 ('295','Mexico',1,'2012-11-29 03:33:00'),
 ('300','Netherlands',1,'2012-11-29 03:33:00'),
 ('305','Nicaragua',1,'2012-11-29 03:33:00'),
 ('310','Norfolk Island',1,'2012-11-29 03:33:00'),
 ('315','Norway - Noruega',1,'2012-11-29 03:33:00'),
 ('320','Nueva Zelanda',1,'2012-11-29 03:33:00'),
 ('325','Pakistan',1,'2012-11-29 03:33:00'),
 ('330','Panama',1,'2012-11-29 03:33:00'),
 ('335','Paraguay',1,'2012-11-29 03:33:00'),
 ('340','Peru',1,'2012-11-29 03:33:00'),
 ('345','Polonia',1,'2012-11-29 03:33:00'),
 ('350','Portugal',1,'2012-11-29 03:33:00'),
 ('355','Puerto Rico',1,'2012-11-29 03:33:00'),
 ('360','Republica Checa',1,'2012-11-29 03:33:00'),
 ('365','Republica Democratica del congo',1,'2012-11-29 03:33:00'),
 ('370','Republica Dominicana',1,'2012-11-29 03:33:00'),
 ('375','Rumania',1,'2012-11-29 03:33:00'),
 ('380','Rusia',1,'2012-11-29 03:33:00'),
 ('385','Rwanda',1,'2012-11-29 03:33:00'),
 ('390','Singapur',1,'2012-11-29 03:33:00'),
 ('395','Slovakia',1,'2012-11-29 03:33:00'),
 ('400','Sri Lanka',1,'2012-11-29 03:33:00'),
 ('405','Sur Africa',1,'2012-11-29 03:33:00'),
 ('410','Suecia',1,'2012-11-29 03:33:00'),
 ('415','Suiza',1,'2012-11-29 03:33:00'),
 ('420','Taiwan',1,'2012-11-29 03:33:00'),
 ('425','Thailandia',1,'2012-11-29 03:33:00'),
 ('430','Tonga',1,'2012-11-29 03:33:00'),
 ('435','Trinidad y Tobago',1,'2012-11-29 03:33:00'),
 ('440','Turkia',1,'2012-11-29 03:33:00'),
 ('445','Turmenistan',1,'2012-11-29 03:33:00'),
 ('450','Uganda',1,'2012-11-29 03:33:00'),
 ('455','Ukraine',1,'2012-11-29 03:33:00'),
 ('460','Uruguay',1,'2012-11-29 03:33:00'),
 ('465','Venezuela',1,'2012-11-29 03:33:00'),
 ('470','Yugoslavia',1,'2012-11-29 03:33:00'),
 ('475','Zaire',1,'2012-11-29 03:33:00'),
 ('480','Otros Paises',1,'2012-11-29 03:33:00');
/*!40000 ALTER TABLE `ppaises` ENABLE KEYS */;


--
-- Definition of table `pproveedores`
--

DROP TABLE IF EXISTS `pproveedores`;
CREATE TABLE `pproveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_corto` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  UNIQUE KEY `nombreCorto_UNIQUE` (`nombre_corto`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_pProveedores_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_pProveedores_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pproveedores`
--

/*!40000 ALTER TABLE `pproveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `pproveedores` ENABLE KEYS */;


--
-- Definition of table `ppuerto`
--

DROP TABLE IF EXISTS `ppuerto`;
CREATE TABLE `ppuerto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_corto` varchar(5) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `pMunicipios_id` varchar(3) NOT NULL,
  `pMunicipios_departamentos_id` varchar(2) NOT NULL,
  `pMunicipios_departamentos_pPaises_id` varchar(3) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `pSucursales_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombreCorto_UNIQUE` (`nombre_corto`),
  KEY `fk_pPuerto_pMunicipios1_idx` (`pMunicipios_id`,`pMunicipios_departamentos_id`,`pMunicipios_departamentos_pPaises_id`),
  KEY `fk_pPuerto_sUsuarios1_idx` (`sUsuarios_id`),
  KEY `fk_pSucursales1_idx` (`pSucursales_id`),
  CONSTRAINT `fk_pPuerto_pMunicipios1` FOREIGN KEY (`pMunicipios_id`, `pMunicipios_departamentos_id`, `pMunicipios_departamentos_pPaises_id`) REFERENCES `pmunicipios` (`id`, `departamentos_id`, `departamentos_pPaises_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pPuerto_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pSucursales1` FOREIGN KEY (`pSucursales_id`) REFERENCES `psucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ppuerto`
--

/*!40000 ALTER TABLE `ppuerto` DISABLE KEYS */;
INSERT INTO `ppuerto` (`id`,`nombre_corto`,`descripcion`,`pMunicipios_id`,`pMunicipios_departamentos_id`,`pMunicipios_departamentos_pPaises_id`,`sUsuarios_id`,`fecha_modificacion`,`pSucursales_id`) VALUES 
 (5,'MEB','Muelles el Bosque','001','13','090',1,'2012-12-19 14:37:46',NULL);
/*!40000 ALTER TABLE `ppuerto` ENABLE KEYS */;


--
-- Definition of table `psucursales`
--

DROP TABLE IF EXISTS `psucursales`;
CREATE TABLE `psucursales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_corto` varchar(5) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pSucursales_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_pSucursales_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `psucursales`
--

/*!40000 ALTER TABLE `psucursales` DISABLE KEYS */;
INSERT INTO `psucursales` (`id`,`nombre_corto`,`descripcion`,`sUsuarios_id`,`fecha_modificacion`) VALUES 
 (5,'CTG','Cartagena',1,'2012-12-18 15:46:37'),
 (6,'BOG','Bogota',1,'2012-12-18 15:48:25');
/*!40000 ALTER TABLE `psucursales` ENABLE KEYS */;


--
-- Definition of table `ptipos_mercancias`
--

DROP TABLE IF EXISTS `ptipos_mercancias`;
CREATE TABLE `ptipos_mercancias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_corto` varchar(10) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombreCorto_UNIQUE` (`nombre_corto`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_pTipos_mercancias_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_pTipos_mercancias_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ptipos_mercancias`
--

/*!40000 ALTER TABLE `ptipos_mercancias` DISABLE KEYS */;
/*!40000 ALTER TABLE `ptipos_mercancias` ENABLE KEYS */;


--
-- Definition of table `sformularios`
--

DROP TABLE IF EXISTS `sformularios`;
CREATE TABLE `sformularios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `sModulos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_sFormularios_sModulos1_idx` (`sModulos_id`),
  CONSTRAINT `fk_sFormularios_sModulos1` FOREIGN KEY (`sModulos_id`) REFERENCES `smodulos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sformularios`
--

/*!40000 ALTER TABLE `sformularios` DISABLE KEYS */;
INSERT INTO `sformularios` (`id`,`nombre`,`sModulos_id`) VALUES 
 (1,'pais',1),
 (2,'departamento',1),
 (3,'municipio',1),
 (4,'puerto',1),
 (5,'sucursal',1);
/*!40000 ALTER TABLE `sformularios` ENABLE KEYS */;


--
-- Definition of table `smodulos`
--

DROP TABLE IF EXISTS `smodulos`;
CREATE TABLE `smodulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smodulos`
--

/*!40000 ALTER TABLE `smodulos` DISABLE KEYS */;
INSERT INTO `smodulos` (`id`,`nombre`) VALUES 
 (1,'parametros');
/*!40000 ALTER TABLE `smodulos` ENABLE KEYS */;


--
-- Definition of table `sroles`
--

DROP TABLE IF EXISTS `sroles`;
CREATE TABLE `sroles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET latin1 NOT NULL,
  `descripcion` text COLLATE latin1_spanish_ci NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_sRoles_sUsuarios1_idx` (`sUsuarios_id`),
  KEY `fk_sRoles_sUsuarios1_idx1` (`sUsuarios_id`),
  CONSTRAINT `fk_sRoles_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `sroles`
--

/*!40000 ALTER TABLE `sroles` DISABLE KEYS */;
INSERT INTO `sroles` (`id`,`nombre`,`descripcion`,`sUsuarios_id`,`fecha_modificacion`) VALUES 
 (1,'Super Administrador','Tiene todos los permisos',1,'2012-11-29 02:29:00');
/*!40000 ALTER TABLE `sroles` ENABLE KEYS */;


--
-- Definition of table `sroles_permisos`
--

DROP TABLE IF EXISTS `sroles_permisos`;
CREATE TABLE `sroles_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sRoles_id` int(10) NOT NULL,
  `sFormularios_id` int(11) NOT NULL,
  `accion` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `valor` tinyint(4) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sRoles_has_sFormularios_sFormularios1_idx` (`sFormularios_id`),
  KEY `fk_sRoles_has_sFormularios_sRoles1_idx` (`sRoles_id`),
  KEY `fk_sRoles_Permisos_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_sRoles_has_sFormularios_sFormularios1` FOREIGN KEY (`sFormularios_id`) REFERENCES `sformularios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sRoles_has_sFormularios_sRoles1` FOREIGN KEY (`sRoles_id`) REFERENCES `sroles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sRoles_Permisos_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `sroles_permisos`
--

/*!40000 ALTER TABLE `sroles_permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `sroles_permisos` ENABLE KEYS */;


--
-- Definition of table `susuarios`
--

DROP TABLE IF EXISTS `susuarios`;
CREATE TABLE `susuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) CHARACTER SET latin1 NOT NULL,
  `password` blob NOT NULL,
  `identificacion` bigint(20) NOT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `sRoles_id` int(10) NOT NULL,
  `sUsuarios_id` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_sUsuarios_sRoles1_idx` (`sRoles_id`),
  KEY `fk_sUsuarios_sUsuarios1_idx` (`sUsuarios_id`),
  CONSTRAINT `fk_sUsuarios_sRoles1` FOREIGN KEY (`sRoles_id`) REFERENCES `sroles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sUsuarios_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `susuarios`
--

/*!40000 ALTER TABLE `susuarios` DISABLE KEYS */;
INSERT INTO `susuarios` (`id`,`login`,`password`,`identificacion`,`id_tipo_documento`,`sRoles_id`,`sUsuarios_id`,`fecha_modificacion`) VALUES 
 (1,'glinero',0xEC43354DA88F4E44EEF8D8D0E308D692,1065571485,1,1,1,'2012-11-29 02:00:00'),
 (2,'ccastillo',0xEC43354DA88F4E44EEF8D8D0E308D692,7919989,1,1,1,'2012-12-04 11:19:00');
/*!40000 ALTER TABLE `susuarios` ENABLE KEYS */;


--
-- Definition of table `susuarios_permisos`
--

DROP TABLE IF EXISTS `susuarios_permisos`;
CREATE TABLE `susuarios_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sUsuarios_id` int(11) NOT NULL,
  `sFormularios_id` int(11) NOT NULL,
  `accion` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `valor` tinyint(4) NOT NULL,
  `sUsuarios_id1` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sUsuarios_has_sFormularios_sFormularios1_idx` (`sFormularios_id`),
  KEY `fk_sUsuarios_has_sFormularios_sUsuarios1_idx` (`sUsuarios_id`),
  KEY `fk_sUsuarios_Permisos_sUsuarios1_idx` (`sUsuarios_id1`),
  CONSTRAINT `fk_sUsuarios_has_sFormularios_sFormularios1` FOREIGN KEY (`sFormularios_id`) REFERENCES `sformularios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sUsuarios_has_sFormularios_sUsuarios1` FOREIGN KEY (`sUsuarios_id`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sUsuarios_Permisos_sUsuarios1` FOREIGN KEY (`sUsuarios_id1`) REFERENCES `susuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `susuarios_permisos`
--

/*!40000 ALTER TABLE `susuarios_permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `susuarios_permisos` ENABLE KEYS */;


--
-- Definition of table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `tipodocumento`
--

/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;


--
-- Definition of table `tipodocumentoaut`
--

DROP TABLE IF EXISTS `tipodocumentoaut`;
CREATE TABLE `tipodocumentoaut` (
  `idTipoDocumento` int(10) unsigned NOT NULL,
  `campoEntidad` varchar(40) NOT NULL,
  `habilitar` tinyint(1) NOT NULL,
  `obligatorio` tinyint(1) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`,`campoEntidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipodocumentoaut`
--

/*!40000 ALTER TABLE `tipodocumentoaut` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodocumentoaut` ENABLE KEYS */;


--
-- Definition of table `tipoentidad`
--

DROP TABLE IF EXISTS `tipoentidad`;
CREATE TABLE `tipoentidad` (
  `idTipoEntidad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoEntidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoentidad`
--

/*!40000 ALTER TABLE `tipoentidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoentidad` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
