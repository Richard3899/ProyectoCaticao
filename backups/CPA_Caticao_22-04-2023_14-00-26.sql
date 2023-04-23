-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: caticao
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracion` (
  `idConfiguracion` int NOT NULL AUTO_INCREMENT,
  `modoDark` int DEFAULT NULL,
  `contraerBarraLateral` int DEFAULT NULL,
  `ocultarBarraLateral` int DEFAULT NULL,
  PRIMARY KEY (`idConfiguracion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES (1,1,0,0);
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costorecetasgastoadmin`
--

DROP TABLE IF EXISTS `costorecetasgastoadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costorecetasgastoadmin` (
  `idCostoRecetasGastoAdmin` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `mes` date DEFAULT NULL,
  PRIMARY KEY (`idCostoRecetasGastoAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costorecetasgastoadmin`
--

LOCK TABLES `costorecetasgastoadmin` WRITE;
/*!40000 ALTER TABLE `costorecetasgastoadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `costorecetasgastoadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desembolso`
--

DROP TABLE IF EXISTS `desembolso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `desembolso` (
  `idDesembolso` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idDesembolso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desembolso`
--

LOCK TABLES `desembolso` WRITE;
/*!40000 ALTER TABLE `desembolso` DISABLE KEYS */;
INSERT INTO `desembolso` VALUES (1,'Gastos Administrativos'),(2,'Costos de Ventas'),(3,'Costos de Marketing'),(4,'Costos Operativos');
/*!40000 ALTER TABLE `desembolso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `numeroDocumento` varchar(15) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `horarioTrabajo` varchar(50) DEFAULT NULL,
  `horasPorDia` int DEFAULT NULL,
  `sueldoPorDia` decimal(10,2) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `sueldoPorMes` decimal(10,2) DEFAULT NULL,
  `idTipoDocumento` int DEFAULT NULL,
  `idUsuario` int DEFAULT NULL,
  `idTipoCosto` int DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `idTipoCosto` (`idTipoCosto`),
  KEY `idTipoDocumento` (`idTipoDocumento`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`),
  CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Julio','Gonzales','Av. Alfonso Ugarte Lt.12','987654321','julio@gmail.com','432187654','2022-11-03','Empaquetador','8am - 6pm',8,80.00,10.00,1000.00,1,NULL,1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `idEstado` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Iniciado'),(2,'Proceso'),(3,'Terminado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastoadmin`
--

DROP TABLE IF EXISTS `gastoadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastoadmin` (
  `idGastoAdmin` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idUnidadMedida` int DEFAULT NULL,
  `idTipoCosto` int DEFAULT NULL,
  `idDesembolso` int DEFAULT NULL,
  PRIMARY KEY (`idGastoAdmin`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  KEY `idTipoCosto` (`idTipoCosto`),
  KEY `idDesembolso` (`idDesembolso`),
  CONSTRAINT `gastoadmin_ibfk_1` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  CONSTRAINT `gastoadmin_ibfk_2` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`),
  CONSTRAINT `gastoadmin_ibfk_3` FOREIGN KEY (`idDesembolso`) REFERENCES `desembolso` (`idDesembolso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastoadmin`
--

LOCK TABLES `gastoadmin` WRITE;
/*!40000 ALTER TABLE `gastoadmin` DISABLE KEYS */;
INSERT INTO `gastoadmin` VALUES (1,'Gasto Administrativo 1',70.00,1,1,1),(2,'Costo de Venta 1',15.00,3,2,2),(3,'Costo de Marketing 1',10.00,3,2,3),(4,'Costo Operativo 1',12.00,3,1,4);
/*!40000 ALTER TABLE `gastoadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastoadminpormes`
--

DROP TABLE IF EXISTS `gastoadminpormes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastoadminpormes` (
  `idGastoAdminPorMes` int NOT NULL AUTO_INCREMENT,
  `nombreGastoAdmin` varchar(50) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `idGastoAdmin` int DEFAULT NULL,
  `idCostoRecetasGastoAdmin` int DEFAULT NULL,
  PRIMARY KEY (`idGastoAdminPorMes`),
  KEY `idGastoAdmin` (`idGastoAdmin`),
  KEY `idCostoRecetasGastoAdmin` (`idCostoRecetasGastoAdmin`),
  CONSTRAINT `gastoadminpormes_ibfk_1` FOREIGN KEY (`idGastoAdmin`) REFERENCES `gastoadmin` (`idGastoAdmin`),
  CONSTRAINT `gastoadminpormes_ibfk_2` FOREIGN KEY (`idCostoRecetasGastoAdmin`) REFERENCES `costorecetasgastoadmin` (`idCostoRecetasGastoAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastoadminpormes`
--

LOCK TABLES `gastoadminpormes` WRITE;
/*!40000 ALTER TABLE `gastoadminpormes` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastoadminpormes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventariomaquina`
--

DROP TABLE IF EXISTS `inventariomaquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventariomaquina` (
  `idInventarioMaquina` int NOT NULL AUTO_INCREMENT,
  `stock` decimal(10,2) DEFAULT NULL,
  `ultimoMovimiento` timestamp NULL DEFAULT NULL,
  `idMaquina` int DEFAULT NULL,
  PRIMARY KEY (`idInventarioMaquina`),
  KEY `idMaquina` (`idMaquina`),
  CONSTRAINT `inventariomaquina_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventariomaquina`
--

LOCK TABLES `inventariomaquina` WRITE;
/*!40000 ALTER TABLE `inventariomaquina` DISABLE KEYS */;
INSERT INTO `inventariomaquina` VALUES (1,0.00,NULL,1),(2,0.00,NULL,2);
/*!40000 ALTER TABLE `inventariomaquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventariomateria`
--

DROP TABLE IF EXISTS `inventariomateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventariomateria` (
  `idInventarioMateria` int NOT NULL AUTO_INCREMENT,
  `stock` decimal(10,2) DEFAULT NULL,
  `ultimoMovimiento` timestamp NULL DEFAULT NULL,
  `idMateria` int DEFAULT NULL,
  PRIMARY KEY (`idInventarioMateria`),
  KEY `idMateria` (`idMateria`),
  CONSTRAINT `inventariomateria_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventariomateria`
--

LOCK TABLES `inventariomateria` WRITE;
/*!40000 ALTER TABLE `inventariomateria` DISABLE KEYS */;
INSERT INTO `inventariomateria` VALUES (1,250.00,'2022-12-11 15:23:25',1),(2,200.00,'2023-01-08 07:08:42',2),(3,100.00,'2022-12-11 15:23:50',3),(4,90.00,'2023-04-09 23:58:56',4),(5,300.00,'2023-04-09 23:58:47',5),(6,2000.00,'2023-01-08 07:08:52',6);
/*!40000 ALTER TABLE `inventariomateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventarioproducto`
--

DROP TABLE IF EXISTS `inventarioproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventarioproducto` (
  `idInventarioProducto` int NOT NULL AUTO_INCREMENT,
  `stock` decimal(10,2) DEFAULT NULL,
  `ultimoMovimiento` timestamp NULL DEFAULT NULL,
  `idProducto` int DEFAULT NULL,
  PRIMARY KEY (`idInventarioProducto`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `inventarioproducto_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventarioproducto`
--

LOCK TABLES `inventarioproducto` WRITE;
/*!40000 ALTER TABLE `inventarioproducto` DISABLE KEYS */;
INSERT INTO `inventarioproducto` VALUES (1,15.00,'2023-04-09 23:59:56',1);
/*!40000 ALTER TABLE `inventarioproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote` (
  `idLote` int NOT NULL AUTO_INCREMENT,
  `codigoLote` varchar(20) DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `fechaProduccion` date DEFAULT NULL,
  `idProducto` int DEFAULT NULL,
  PRIMARY KEY (`idLote`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (1,'123456','2022-12-11',5.00,'2022-12-10',1),(2,'767','2026-01-28',0.00,'2023-04-09',1),(3,'75745','2022-12-11',10.00,'2023-04-09',1);
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquina`
--

DROP TABLE IF EXISTS `maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquina` (
  `idMaquina` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `añoCompra` int DEFAULT NULL,
  `capacidad` decimal(10,2) DEFAULT NULL,
  `potenciaHP` decimal(10,2) DEFAULT NULL,
  `potenciaWatts` decimal(10,2) DEFAULT NULL,
  `potenciaKw` decimal(10,2) DEFAULT NULL,
  `depreciacionAnual` decimal(10,2) DEFAULT NULL,
  `depreciacionMensual` decimal(10,2) DEFAULT NULL,
  `depreciacionHora` decimal(10,2) DEFAULT NULL,
  `vidaUtil` int DEFAULT NULL,
  PRIMARY KEY (`idMaquina`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquina`
--

LOCK TABLES `maquina` WRITE;
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
INSERT INTO `maquina` VALUES (1,'SL-0002','Seleccionadora','SL9212','MD-2022','Selecciona y limpia la materia prima','KAT',8000.00,2022,60.00,1.00,745.70,0.75,1600.00,133.33,0.22,5),(2,'SLDR001','Selladora','12313123','MD-2022','Sella los empaques','KAT',2100.00,2022,20.00,0.75,559.28,0.56,2100.00,175.00,0.29,1);
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `idMarca` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'GLORIA'),(2,'DULFINA'),(3,'SAFE');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `idMateria` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `idUnidadMedida` int DEFAULT NULL,
  `idMarca` int DEFAULT NULL,
  `idTipoMateria` int DEFAULT NULL,
  PRIMARY KEY (`idMateria`),
  KEY `idTipoMateria` (`idTipoMateria`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  KEY `idMarca` (`idMarca`),
  CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`idTipoMateria`) REFERENCES `tipomateria` (`idTipoMateria`),
  CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  CONSTRAINT `materia_ibfk_3` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'LC-12','LECHE','SIN LACTOSA',55.00,12.00,4.58,'',2,1,1),(2,'CJ-1245','CAJAS','DE CARTON',10.00,10.00,1.00,'',3,3,2),(3,'AG12','AGUA','EVAPORADA',12.00,12.00,1.00,'',2,3,1),(4,'VN001','VAINILLA','DULCE',7.00,12.00,0.58,'',2,1,1),(5,'CC001','CACAO','NATURAL',6.00,56.00,0.11,'',1,3,1),(6,'EMP001','EMPAQUES','GRANDES',30.00,100.00,0.30,'',3,3,2);
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `idModulo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idModulo`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'inicio'),(2,'insumos'),(3,'materiales'),(4,'marcas'),(5,'productos'),(6,'maquinas'),(7,'empleados'),(8,'gastoadmin'),(9,'costoventa'),(10,'costomarketing'),(11,'costooperativo'),(12,'inventarioinsumos'),(13,'inventariomateriales'),(14,'inventarioproductos'),(15,'inventariomaquinas'),(16,'recetas'),(17,'costoreceta'),(18,'costorecetasgastoadmin'),(19,'usuarios'),(20,'reporteinsumos'),(21,'reportemateriales'),(22,'reporteproductos'),(23,'configuracion'),(24,'loteproductos'),(25,'reporterecetas'),(28,'backup'),(29,'salir'),(30,'kardexinsumos'),(31,'kardexmateriales'),(32,'kardexproductos'),(33,'kardexmaquinas'),(34,'recetainsumos'),(35,'recetamateriales'),(36,'recetamanodeobra'),(37,'recetadepreciacion'),(38,'recetaconsumoenergia'),(39,'recetaconsumogas'),(40,'recetacostoventa'),(41,'recetacostomarketing'),(42,'recetacostooperativo'),(43,'costototal'),(44,'gastoadminpormes'),(45,'costototalpormes');
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `idMovimiento` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idMovimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES (1,'Ingreso'),(2,'Salida');
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientomaquina`
--

DROP TABLE IF EXISTS `movimientomaquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientomaquina` (
  `idMovimientoMaquina` int NOT NULL AUTO_INCREMENT,
  `ingreso` decimal(10,2) DEFAULT NULL,
  `salida` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idMaquina` int DEFAULT NULL,
  `idMovimiento` int DEFAULT NULL,
  PRIMARY KEY (`idMovimientoMaquina`),
  KEY `idMaquina` (`idMaquina`),
  KEY `idMovimiento` (`idMovimiento`),
  CONSTRAINT `movimientomaquina_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`),
  CONSTRAINT `movimientomaquina_ibfk_2` FOREIGN KEY (`idMovimiento`) REFERENCES `movimiento` (`idMovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientomaquina`
--

LOCK TABLES `movimientomaquina` WRITE;
/*!40000 ALTER TABLE `movimientomaquina` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientomaquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientomateria`
--

DROP TABLE IF EXISTS `movimientomateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientomateria` (
  `idMovimientoMateria` int NOT NULL AUTO_INCREMENT,
  `ingreso` decimal(10,2) DEFAULT NULL,
  `salida` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `codigoReceta` varchar(20) DEFAULT NULL,
  `hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idMateria` int DEFAULT NULL,
  `idMovimiento` int DEFAULT NULL,
  PRIMARY KEY (`idMovimientoMateria`),
  KEY `idMateria` (`idMateria`),
  KEY `idMovimiento` (`idMovimiento`),
  CONSTRAINT `movimientomateria_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`),
  CONSTRAINT `movimientomateria_ibfk_2` FOREIGN KEY (`idMovimiento`) REFERENCES `movimiento` (`idMovimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientomateria`
--

LOCK TABLES `movimientomateria` WRITE;
/*!40000 ALTER TABLE `movimientomateria` DISABLE KEYS */;
INSERT INTO `movimientomateria` VALUES (1,250.00,0.00,'Produccion','2022-12-17','S-C','2022-12-11 15:23:25',1,1),(2,150.00,0.00,'Produccion','2022-12-31','S-C','2022-12-11 15:23:37',4,1),(3,100.00,0.00,'Produccion','2022-12-10','S-C','2022-12-11 15:23:50',3,1),(4,500.00,0.00,'Produccion','2022-12-17','S-C','2022-12-11 15:24:33',5,1),(5,200.00,0.00,'Produccion','2023-01-26','S-C','2023-01-08 07:08:42',2,1),(6,2000.00,0.00,'Produccion','2023-01-10','S-C','2023-01-08 07:08:52',6,1),(7,0.00,100.00,'Agregado Receta:','2023-04-09','RC001','2023-04-09 23:41:53',5,2),(8,0.00,100.00,'Agregado Receta:','2023-04-09','RC004','2023-04-09 23:58:47',5,2),(9,0.00,60.00,'Agregado Receta:','2023-04-09','RC004','2023-04-09 23:58:56',4,2);
/*!40000 ALTER TABLE `movimientomateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientoproducto`
--

DROP TABLE IF EXISTS `movimientoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientoproducto` (
  `idMovimientoProducto` int NOT NULL AUTO_INCREMENT,
  `ingreso` decimal(10,2) DEFAULT NULL,
  `salida` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idLote` int DEFAULT NULL,
  `idMovimiento` int DEFAULT NULL,
  PRIMARY KEY (`idMovimientoProducto`),
  KEY `idLote` (`idLote`),
  KEY `idMovimiento` (`idMovimiento`),
  CONSTRAINT `movimientoproducto_ibfk_1` FOREIGN KEY (`idLote`) REFERENCES `lote` (`idLote`),
  CONSTRAINT `movimientoproducto_ibfk_2` FOREIGN KEY (`idMovimiento`) REFERENCES `movimiento` (`idMovimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientoproducto`
--

LOCK TABLES `movimientoproducto` WRITE;
/*!40000 ALTER TABLE `movimientoproducto` DISABLE KEYS */;
INSERT INTO `movimientoproducto` VALUES (1,70.00,0.00,'Compra','2023-04-13','2023-04-09 23:41:29',2,1),(2,5.00,0.00,'Productos terminados : RC001','2022-12-10','2023-04-09 23:42:01',1,1),(3,0.00,30.00,'Retiro','2023-04-08','2023-04-09 23:43:42',2,2),(4,20.00,0.00,'Produccion','2023-04-09','2023-04-09 23:55:38',2,1),(5,0.00,60.00,'Retiro','2023-04-09','2023-04-09 23:58:25',2,2),(6,10.00,0.00,'Productos terminados : RC004','2023-04-09','2023-04-09 23:59:56',3,1);
/*!40000 ALTER TABLE `movimientoproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordertable`
--

DROP TABLE IF EXISTS `ordertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordertable` (
  `idOrderTable` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idOrderTable`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertable`
--

LOCK TABLES `ordertable` WRITE;
/*!40000 ALTER TABLE `ordertable` DISABLE KEYS */;
INSERT INTO `ordertable` VALUES (1,'ordertable'),(2,'configuracion'),(3,'marca'),(4,'tipoproducto'),(5,'tipounidad'),(6,'unidadmedida'),(7,'tipomateria'),(8,'tipocosto'),(9,'tipodocumento'),(10,'desembolso'),(11,'movimiento'),(12,'estado'),(13,'perfil'),(14,'usuario'),(15,'modulo'),(16,'usuariomodulo'),(17,'usuariopermiso'),(18,'empleado'),(19,'materia'),(20,'producto'),(21,'lote'),(22,'maquina'),(23,'gastoadmin'),(24,'inventariomateria'),(25,'inventarioproducto'),(26,'inventariomaquina'),(27,'movimientomateria'),(28,'movimientoproducto'),(29,'movimientomaquina'),(30,'receta'),(31,'recetamateria'),(32,'recetamanodeobra'),(33,'recetadepreciacion'),(34,'tarifaenergia'),(35,'recetaconsumoenergia'),(36,'recetaconsumogas'),(37,'recetacostoventa'),(38,'recetacostomarketing'),(39,'recetacostooperativo'),(40,'costorecetasgastoadmin'),(41,'gastoadminpormes'),(42,'loteproductos');
/*!40000 ALTER TABLE `ordertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `idPerfil` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Administrador'),(2,'Vendedor'),(3,'Otro');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `imagen` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `idUnidadMedida` int DEFAULT NULL,
  `idTipoProducto` int DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  KEY `idTipoProducto` (`idTipoProducto`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipoproducto` (`idTipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'123456','Chocolate con pasa','50% cacao',NULL,3,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta` (
  `idReceta` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `batch` decimal(10,2) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `pesoPorTableta` decimal(10,2) DEFAULT NULL,
  `pesoEnTableta` decimal(10,2) DEFAULT NULL,
  `merma` decimal(10,2) DEFAULT NULL,
  `reproceso` decimal(10,2) DEFAULT NULL,
  `codigoLote` varchar(20) DEFAULT NULL,
  `cerrado` int DEFAULT NULL,
  `cantidadTabletas` int DEFAULT NULL,
  `costoTotal` decimal(10,2) DEFAULT NULL,
  `costoPorTableta` decimal(10,2) DEFAULT NULL,
  `idEstado` int DEFAULT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `idEstado` (`idEstado`),
  CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,'RC001','Receta 1',60.00,'2022-12-10','2022-12-10',1.00,1.00,1.00,1.00,'123456',1,5,11.00,2.20,3),(2,'RC004','Receta 4',60.00,'2022-12-10','2023-04-09',1.00,1.00,1.00,1.00,'75745',1,10,45.80,9.16,3);
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetaconsumoenergia`
--

DROP TABLE IF EXISTS `recetaconsumoenergia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetaconsumoenergia` (
  `idRecetaConsumoEnergia` int NOT NULL AUTO_INCREMENT,
  `nombreMaquina` varchar(50) DEFAULT NULL,
  `potenciaKw` decimal(10,2) DEFAULT NULL,
  `horasTrabajoBatch` decimal(10,2) DEFAULT NULL,
  `consumoKwh` decimal(10,2) DEFAULT NULL,
  `tarifaKwh` decimal(10,2) DEFAULT NULL,
  `pagoPorBatch` decimal(10,2) DEFAULT NULL,
  `idTarifaEnergia` int DEFAULT NULL,
  `idMaquina` int DEFAULT NULL,
  `idReceta` int DEFAULT NULL,
  PRIMARY KEY (`idRecetaConsumoEnergia`),
  KEY `idReceta` (`idReceta`),
  KEY `idMaquina` (`idMaquina`),
  KEY `idTarifaEnergia` (`idTarifaEnergia`),
  CONSTRAINT `recetaconsumoenergia_ibfk_1` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`),
  CONSTRAINT `recetaconsumoenergia_ibfk_2` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`),
  CONSTRAINT `recetaconsumoenergia_ibfk_3` FOREIGN KEY (`idTarifaEnergia`) REFERENCES `tarifaenergia` (`idTarifaEnergia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetaconsumoenergia`
--

LOCK TABLES `recetaconsumoenergia` WRITE;
/*!40000 ALTER TABLE `recetaconsumoenergia` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetaconsumoenergia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetaconsumogas`
--

DROP TABLE IF EXISTS `recetaconsumogas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetaconsumogas` (
  `idRecetaConsumoGas` int NOT NULL AUTO_INCREMENT,
  `nombreMaquina` varchar(50) DEFAULT NULL,
  `trabajoPorBatch` decimal(10,2) DEFAULT NULL,
  `pesoBalonGas` decimal(10,2) DEFAULT NULL,
  `tarifaGas` decimal(10,2) DEFAULT NULL,
  `pagoPorBatch` decimal(10,2) DEFAULT NULL,
  `idMaquina` int DEFAULT NULL,
  `idReceta` int DEFAULT NULL,
  PRIMARY KEY (`idRecetaConsumoGas`),
  KEY `idMaquina` (`idMaquina`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `recetaconsumogas_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`),
  CONSTRAINT `recetaconsumogas_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetaconsumogas`
--

LOCK TABLES `recetaconsumogas` WRITE;
/*!40000 ALTER TABLE `recetaconsumogas` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetaconsumogas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetacostomarketing`
--

DROP TABLE IF EXISTS `recetacostomarketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetacostomarketing` (
  `idRecetaCostoMarketing` int NOT NULL AUTO_INCREMENT,
  `nombreCostoMarketing` varchar(50) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `idGastoAdmin` int DEFAULT NULL,
  `idReceta` int DEFAULT NULL,
  PRIMARY KEY (`idRecetaCostoMarketing`),
  KEY `idGastoAdmin` (`idGastoAdmin`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `recetacostomarketing_ibfk_1` FOREIGN KEY (`idGastoAdmin`) REFERENCES `gastoadmin` (`idGastoAdmin`),
  CONSTRAINT `recetacostomarketing_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetacostomarketing`
--

LOCK TABLES `recetacostomarketing` WRITE;
/*!40000 ALTER TABLE `recetacostomarketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetacostomarketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetacostooperativo`
--

DROP TABLE IF EXISTS `recetacostooperativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetacostooperativo` (
  `idRecetaCostoOperativo` int NOT NULL AUTO_INCREMENT,
  `nombreCostoOperativo` varchar(50) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `idGastoAdmin` int DEFAULT NULL,
  `idReceta` int DEFAULT NULL,
  PRIMARY KEY (`idRecetaCostoOperativo`),
  KEY `idGastoAdmin` (`idGastoAdmin`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `recetacostooperativo_ibfk_1` FOREIGN KEY (`idGastoAdmin`) REFERENCES `gastoadmin` (`idGastoAdmin`),
  CONSTRAINT `recetacostooperativo_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetacostooperativo`
--

LOCK TABLES `recetacostooperativo` WRITE;
/*!40000 ALTER TABLE `recetacostooperativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetacostooperativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetacostoventa`
--

DROP TABLE IF EXISTS `recetacostoventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetacostoventa` (
  `idRecetaCostoVenta` int NOT NULL AUTO_INCREMENT,
  `nombreCostoVenta` varchar(50) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `idGastoAdmin` int DEFAULT NULL,
  `idReceta` int DEFAULT NULL,
  PRIMARY KEY (`idRecetaCostoVenta`),
  KEY `idGastoAdmin` (`idGastoAdmin`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `recetacostoventa_ibfk_1` FOREIGN KEY (`idGastoAdmin`) REFERENCES `gastoadmin` (`idGastoAdmin`),
  CONSTRAINT `recetacostoventa_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetacostoventa`
--

LOCK TABLES `recetacostoventa` WRITE;
/*!40000 ALTER TABLE `recetacostoventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetacostoventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetadepreciacion`
--

DROP TABLE IF EXISTS `recetadepreciacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetadepreciacion` (
  `idRecetaDepreciacion` int NOT NULL AUTO_INCREMENT,
  `nombreMaquina` varchar(50) DEFAULT NULL,
  `depreciacionHora` decimal(10,2) DEFAULT NULL,
  `tiempoHoras` decimal(10,2) DEFAULT NULL,
  `depreciacionPorBatch` decimal(10,2) DEFAULT NULL,
  `idMaquina` int DEFAULT NULL,
  `idReceta` int DEFAULT NULL,
  PRIMARY KEY (`idRecetaDepreciacion`),
  KEY `idMaquina` (`idMaquina`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `recetadepreciacion_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`),
  CONSTRAINT `recetadepreciacion_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetadepreciacion`
--

LOCK TABLES `recetadepreciacion` WRITE;
/*!40000 ALTER TABLE `recetadepreciacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetadepreciacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetamanodeobra`
--

DROP TABLE IF EXISTS `recetamanodeobra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetamanodeobra` (
  `idRecetaManodeObra` int NOT NULL AUTO_INCREMENT,
  `nombreEmpleado` varchar(50) DEFAULT NULL,
  `nombreMaquina` varchar(50) DEFAULT NULL,
  `tiempoHoras` decimal(10,2) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `idMaquina` int DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  `idReceta` int DEFAULT NULL,
  PRIMARY KEY (`idRecetaManodeObra`),
  KEY `idReceta` (`idReceta`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idMaquina` (`idMaquina`),
  CONSTRAINT `recetamanodeobra_ibfk_1` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`),
  CONSTRAINT `recetamanodeobra_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `recetamanodeobra_ibfk_3` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetamanodeobra`
--

LOCK TABLES `recetamanodeobra` WRITE;
/*!40000 ALTER TABLE `recetamanodeobra` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetamanodeobra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetamateria`
--

DROP TABLE IF EXISTS `recetamateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetamateria` (
  `idRecetaMateria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `idMateria` int DEFAULT NULL,
  `idReceta` int DEFAULT NULL,
  PRIMARY KEY (`idRecetaMateria`),
  KEY `idMateria` (`idMateria`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `recetamateria_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`),
  CONSTRAINT `recetamateria_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetamateria`
--

LOCK TABLES `recetamateria` WRITE;
/*!40000 ALTER TABLE `recetamateria` DISABLE KEYS */;
INSERT INTO `recetamateria` VALUES (1,'CACAO - SAFE',100.00,0.11,11.00,5,1),(2,'CACAO - SAFE',100.00,0.11,11.00,5,2),(3,'VAINILLA - GLORIA',60.00,0.58,34.80,4,2);
/*!40000 ALTER TABLE `recetamateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifaenergia`
--

DROP TABLE IF EXISTS `tarifaenergia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifaenergia` (
  `idTarifaEnergia` int NOT NULL AUTO_INCREMENT,
  `tarifaKwh` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idTarifaEnergia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifaenergia`
--

LOCK TABLES `tarifaenergia` WRITE;
/*!40000 ALTER TABLE `tarifaenergia` DISABLE KEYS */;
INSERT INTO `tarifaenergia` VALUES (1,0.72);
/*!40000 ALTER TABLE `tarifaenergia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocosto`
--

DROP TABLE IF EXISTS `tipocosto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocosto` (
  `idTipoCosto` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoCosto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocosto`
--

LOCK TABLES `tipocosto` WRITE;
/*!40000 ALTER TABLE `tipocosto` DISABLE KEYS */;
INSERT INTO `tipocosto` VALUES (1,'Fijo'),(2,'Variable');
/*!40000 ALTER TABLE `tipocosto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumento`
--

LOCK TABLES `tipodocumento` WRITE;
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
INSERT INTO `tipodocumento` VALUES (1,'DNI'),(2,'RUC'),(3,'Pasaporte');
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomateria`
--

DROP TABLE IF EXISTS `tipomateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipomateria` (
  `idTipoMateria` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoMateria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomateria`
--

LOCK TABLES `tipomateria` WRITE;
/*!40000 ALTER TABLE `tipomateria` DISABLE KEYS */;
INSERT INTO `tipomateria` VALUES (1,'Insumo'),(2,'Material');
/*!40000 ALTER TABLE `tipomateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoproducto`
--

DROP TABLE IF EXISTS `tipoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoproducto` (
  `idTipoProducto` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoproducto`
--

LOCK TABLES `tipoproducto` WRITE;
/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
INSERT INTO `tipoproducto` VALUES (1,'Intermedio'),(2,'Terminado');
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipounidad`
--

DROP TABLE IF EXISTS `tipounidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipounidad` (
  `idTipoUnidad` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipounidad`
--

LOCK TABLES `tipounidad` WRITE;
/*!40000 ALTER TABLE `tipounidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipounidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidadmedida`
--

DROP TABLE IF EXISTS `unidadmedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidadmedida` (
  `idUnidadMedida` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `idTipoUnidad` int DEFAULT NULL,
  PRIMARY KEY (`idUnidadMedida`),
  KEY `idTipoUnidad` (`idTipoUnidad`),
  CONSTRAINT `unidadmedida_ibfk_1` FOREIGN KEY (`idTipoUnidad`) REFERENCES `tipounidad` (`idTipoUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidadmedida`
--

LOCK TABLES `unidadmedida` WRITE;
/*!40000 ALTER TABLE `unidadmedida` DISABLE KEYS */;
INSERT INTO `unidadmedida` VALUES (1,'Kg',NULL),(2,'L',NULL),(3,'Unid',NULL);
/*!40000 ALTER TABLE `unidadmedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `estado` int DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idPerfil` int DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idPerfil` (`idPerfil`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Administrador','admin','$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S','vistas/img/usuarios/admin/211.png',1,NULL,'2022-10-18 21:42:18',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariomodulo`
--

DROP TABLE IF EXISTS `usuariomodulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariomodulo` (
  `idUsuarioModulo` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  `idModulo` int DEFAULT NULL,
  PRIMARY KEY (`idUsuarioModulo`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idModulo` (`idModulo`),
  CONSTRAINT `usuariomodulo_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `usuariomodulo_ibfk_2` FOREIGN KEY (`idModulo`) REFERENCES `modulo` (`idModulo`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariomodulo`
--

LOCK TABLES `usuariomodulo` WRITE;
/*!40000 ALTER TABLE `usuariomodulo` DISABLE KEYS */;
INSERT INTO `usuariomodulo` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45);
/*!40000 ALTER TABLE `usuariomodulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariopermiso`
--

DROP TABLE IF EXISTS `usuariopermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariopermiso` (
  `idUsuarioPermiso` int NOT NULL AUTO_INCREMENT,
  `insertar` int DEFAULT NULL,
  `editar` int DEFAULT NULL,
  `eliminar` int DEFAULT NULL,
  `idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idUsuarioPermiso`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `usuariopermiso_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariopermiso`
--

LOCK TABLES `usuariopermiso` WRITE;
/*!40000 ALTER TABLE `usuariopermiso` DISABLE KEYS */;
INSERT INTO `usuariopermiso` VALUES (1,1,1,1,1);
/*!40000 ALTER TABLE `usuariopermiso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-22 14:00:26
