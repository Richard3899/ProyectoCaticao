-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para caticao
CREATE DATABASE IF NOT EXISTS `caticao` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `caticao`;

-- Volcando estructura para tabla caticao.almacen
CREATE TABLE IF NOT EXISTS `almacen` (
  `idAlmacen` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAlmacen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.almacen: ~0 rows (aproximadamente)
DELETE FROM `almacen`;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.consumoenergia
CREATE TABLE IF NOT EXISTS `consumoenergia` (
  `idConsumoEnergia` int(11) NOT NULL AUTO_INCREMENT,
  `potenciaHP` decimal(10,2) DEFAULT NULL,
  `potenciawatts` decimal(10,2) DEFAULT NULL,
  `potenciaKw` decimal(10,2) DEFAULT NULL,
  `horasTrabajoBatch` decimal(10,2) DEFAULT NULL,
  `consumoKwh` decimal(10,2) DEFAULT NULL,
  `tarifaKwh` decimal(10,2) DEFAULT NULL,
  `pagoPorBatch` decimal(10,2) DEFAULT NULL,
  `idMaquina` int(11) DEFAULT NULL,
  `idTipoCosto` int(11) DEFAULT NULL,
  `idUnidadMedida` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConsumoEnergia`),
  KEY `idMaquina` (`idMaquina`),
  KEY `idTipoCosto` (`idTipoCosto`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  CONSTRAINT `consumoenergia_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`),
  CONSTRAINT `consumoenergia_ibfk_2` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`),
  CONSTRAINT `consumoenergia_ibfk_3` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.consumoenergia: ~0 rows (aproximadamente)
DELETE FROM `consumoenergia`;
/*!40000 ALTER TABLE `consumoenergia` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumoenergia` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.consumoenergiareceta
CREATE TABLE IF NOT EXISTS `consumoenergiareceta` (
  `idConsumoEnergiaReceta` int(11) NOT NULL AUTO_INCREMENT,
  `idConsumoEnergia` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConsumoEnergiaReceta`),
  KEY `idConsumoEnergia` (`idConsumoEnergia`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `consumoenergiareceta_ibfk_1` FOREIGN KEY (`idConsumoEnergia`) REFERENCES `consumoenergia` (`idConsumoEnergia`),
  CONSTRAINT `consumoenergiareceta_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.consumoenergiareceta: ~0 rows (aproximadamente)
DELETE FROM `consumoenergiareceta`;
/*!40000 ALTER TABLE `consumoenergiareceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumoenergiareceta` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.consumogas
CREATE TABLE IF NOT EXISTS `consumogas` (
  `idConsumoGas` int(11) NOT NULL AUTO_INCREMENT,
  `pesogas` decimal(10,2) DEFAULT NULL,
  `horastrabajoporbatch` time DEFAULT NULL,
  `tarifagasporkg` decimal(10,2) DEFAULT NULL,
  `idEquipo` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConsumoGas`),
  KEY `idEquipo` (`idEquipo`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `consumogas_ibfk_1` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`),
  CONSTRAINT `consumogas_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.consumogas: ~0 rows (aproximadamente)
DELETE FROM `consumogas`;
/*!40000 ALTER TABLE `consumogas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumogas` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.costomarketing
CREATE TABLE IF NOT EXISTS `costomarketing` (
  `idCostoMarketing` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idTipoUnidad` int(11) DEFAULT NULL,
  `idTipoCosto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCostoMarketing`),
  KEY `idTipoUnidad` (`idTipoUnidad`),
  KEY `idTipoCosto` (`idTipoCosto`),
  CONSTRAINT `costomarketing_ibfk_1` FOREIGN KEY (`idTipoUnidad`) REFERENCES `tipounidad` (`idTipoUnidad`),
  CONSTRAINT `costomarketing_ibfk_2` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.costomarketing: ~0 rows (aproximadamente)
DELETE FROM `costomarketing`;
/*!40000 ALTER TABLE `costomarketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `costomarketing` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.costooperativo
CREATE TABLE IF NOT EXISTS `costooperativo` (
  `idCostoOperativo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idTipoUnidad` int(11) DEFAULT NULL,
  `idTipoCosto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCostoOperativo`),
  KEY `idTipoUnidad` (`idTipoUnidad`),
  KEY `idTipoCosto` (`idTipoCosto`),
  CONSTRAINT `costooperativo_ibfk_1` FOREIGN KEY (`idTipoUnidad`) REFERENCES `tipounidad` (`idTipoUnidad`),
  CONSTRAINT `costooperativo_ibfk_2` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.costooperativo: ~0 rows (aproximadamente)
DELETE FROM `costooperativo`;
/*!40000 ALTER TABLE `costooperativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `costooperativo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.costorecetapormes
CREATE TABLE IF NOT EXISTS `costorecetapormes` (
  `idCostorecetaporMes` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `mes` varchar(45) DEFAULT NULL,
  `costototalrecetapormes` decimal(10,2) DEFAULT NULL,
  `idGastoAdministrativopormes` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCostorecetaporMes`),
  KEY `idGastoAdministrativopormes` (`idGastoAdministrativopormes`),
  CONSTRAINT `costorecetapormes_ibfk_1` FOREIGN KEY (`idGastoAdministrativopormes`) REFERENCES `gastoadministrativopormes` (`idGastoAdministrativopormes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.costorecetapormes: ~0 rows (aproximadamente)
DELETE FROM `costorecetapormes`;
/*!40000 ALTER TABLE `costorecetapormes` DISABLE KEYS */;
/*!40000 ALTER TABLE `costorecetapormes` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.costoventa
CREATE TABLE IF NOT EXISTS `costoventa` (
  `idCostoVenta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idTipoUnidad` int(11) DEFAULT NULL,
  `idTipoCosto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCostoVenta`),
  KEY `idTipoUnidad` (`idTipoUnidad`),
  KEY `idTipoCosto` (`idTipoCosto`),
  CONSTRAINT `costoventa_ibfk_1` FOREIGN KEY (`idTipoUnidad`) REFERENCES `tipounidad` (`idTipoUnidad`),
  CONSTRAINT `costoventa_ibfk_2` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.costoventa: ~0 rows (aproximadamente)
DELETE FROM `costoventa`;
/*!40000 ALTER TABLE `costoventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `costoventa` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.depreciacion
CREATE TABLE IF NOT EXISTS `depreciacion` (
  `idDepreciacion` int(11) NOT NULL AUTO_INCREMENT,
  `importe` decimal(10,2) DEFAULT NULL,
  `vidaUtil` int(11) DEFAULT NULL,
  `depreciacionAnual` decimal(10,2) DEFAULT NULL,
  `depreciacionMensual` decimal(10,2) DEFAULT NULL,
  `depreciacionHora` decimal(10,2) DEFAULT NULL,
  `tiempoDeUso` decimal(10,2) DEFAULT NULL,
  `depreciacionPorBatch` decimal(10,2) DEFAULT NULL,
  `idMaquina` int(11) DEFAULT NULL,
  `idTipoCosto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDepreciacion`),
  KEY `idMaquina` (`idMaquina`),
  KEY `idTipoCosto` (`idTipoCosto`),
  CONSTRAINT `depreciacion_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`),
  CONSTRAINT `depreciacion_ibfk_2` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.depreciacion: ~0 rows (aproximadamente)
DELETE FROM `depreciacion`;
/*!40000 ALTER TABLE `depreciacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `depreciacion` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.depreciacionreceta
CREATE TABLE IF NOT EXISTS `depreciacionreceta` (
  `idDepreciacionReceta` int(11) NOT NULL AUTO_INCREMENT,
  `idDepreciacion` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDepreciacionReceta`),
  KEY `idDepreciacion` (`idDepreciacion`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `depreciacionreceta_ibfk_1` FOREIGN KEY (`idDepreciacion`) REFERENCES `depreciacion` (`idDepreciacion`),
  CONSTRAINT `depreciacionreceta_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.depreciacionreceta: ~0 rows (aproximadamente)
DELETE FROM `depreciacionreceta`;
/*!40000 ALTER TABLE `depreciacionreceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `depreciacionreceta` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `tipoDocumento` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `cargo_empresa` varchar(45) DEFAULT NULL,
  `horario_trabajo` varchar(45) DEFAULT NULL,
  `hora_dias` int(11) DEFAULT NULL,
  `sueldo_dia` decimal(10,2) DEFAULT NULL,
  `sueldo_mes` decimal(10,2) DEFAULT NULL,
  `idTipoSueldo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `idTipoSueldo` (`idTipoSueldo`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idTipoSueldo`) REFERENCES `tiposueldo` (`idTipoSueldo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.empleado: ~0 rows (aproximadamente)
DELETE FROM `empleado`;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.equipo
CREATE TABLE IF NOT EXISTS `equipo` (
  `idEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `año_compra` int(11) DEFAULT NULL,
  `capacidad` decimal(10,2) DEFAULT NULL,
  `potencia` decimal(10,2) DEFAULT NULL,
  `vida_util` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.equipo: ~0 rows (aproximadamente)
DELETE FROM `equipo`;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.gastoadmin
CREATE TABLE IF NOT EXISTS `gastoadmin` (
  `idGastoAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `idUnidadMedida` int(11) DEFAULT NULL,
  `idTipoCosto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGastoAdmin`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  KEY `idTipoCosto` (`idTipoCosto`),
  CONSTRAINT `gastoadmin_ibfk_1` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  CONSTRAINT `gastoadmin_ibfk_2` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.gastoadmin: ~0 rows (aproximadamente)
DELETE FROM `gastoadmin`;
/*!40000 ALTER TABLE `gastoadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastoadmin` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.gastoadministrativo
CREATE TABLE IF NOT EXISTS `gastoadministrativo` (
  `idGastoAdministrativo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idTipoUnidad` int(11) DEFAULT NULL,
  `idTipoCosto` int(11) DEFAULT NULL,
  `idGastoAdministrativopormes` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGastoAdministrativo`),
  KEY `idTipoUnidad` (`idTipoUnidad`),
  KEY `idTipoCosto` (`idTipoCosto`),
  KEY `idGastoAdministrativopormes` (`idGastoAdministrativopormes`),
  CONSTRAINT `gastoadministrativo_ibfk_1` FOREIGN KEY (`idTipoUnidad`) REFERENCES `tipounidad` (`idTipoUnidad`),
  CONSTRAINT `gastoadministrativo_ibfk_2` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`),
  CONSTRAINT `gastoadministrativo_ibfk_3` FOREIGN KEY (`idGastoAdministrativopormes`) REFERENCES `gastoadministrativopormes` (`idGastoAdministrativopormes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.gastoadministrativo: ~0 rows (aproximadamente)
DELETE FROM `gastoadministrativo`;
/*!40000 ALTER TABLE `gastoadministrativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastoadministrativo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.gastoadministrativopormes
CREATE TABLE IF NOT EXISTS `gastoadministrativopormes` (
  `idGastoAdministrativopormes` int(11) NOT NULL AUTO_INCREMENT,
  `requerimiento` decimal(10,2) DEFAULT NULL,
  `costos` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idGastoAdministrativopormes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.gastoadministrativopormes: ~0 rows (aproximadamente)
DELETE FROM `gastoadministrativopormes`;
/*!40000 ALTER TABLE `gastoadministrativopormes` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastoadministrativopormes` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.gastoadminproceso
CREATE TABLE IF NOT EXISTS `gastoadminproceso` (
  `idGastoAdminProceso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `idProceso` int(11) DEFAULT NULL,
  `idGastoAdmin` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGastoAdminProceso`),
  KEY `idProceso` (`idProceso`),
  KEY `idGastoAdmin` (`idGastoAdmin`),
  CONSTRAINT `gastoadminproceso_ibfk_1` FOREIGN KEY (`idProceso`) REFERENCES `proceso` (`idProceso`),
  CONSTRAINT `gastoadminproceso_ibfk_2` FOREIGN KEY (`idGastoAdmin`) REFERENCES `gastoadmin` (`idGastoAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.gastoadminproceso: ~0 rows (aproximadamente)
DELETE FROM `gastoadminproceso`;
/*!40000 ALTER TABLE `gastoadminproceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastoadminproceso` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.gastoadminreceta
CREATE TABLE IF NOT EXISTS `gastoadminreceta` (
  `idGastosAdminReceta` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `idGastoAdmin` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGastosAdminReceta`),
  KEY `idGastoAdmin` (`idGastoAdmin`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `gastoadminreceta_ibfk_1` FOREIGN KEY (`idGastoAdmin`) REFERENCES `gastoadmin` (`idGastoAdmin`),
  CONSTRAINT `gastoadminreceta_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.gastoadminreceta: ~0 rows (aproximadamente)
DELETE FROM `gastoadminreceta`;
/*!40000 ALTER TABLE `gastoadminreceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastoadminreceta` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.insumo
CREATE TABLE IF NOT EXISTS `insumo` (
  `idInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `idTipoUnidad` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInsumo`),
  KEY `idTipoUnidad` (`idTipoUnidad`),
  KEY `idMarca` (`idMarca`),
  CONSTRAINT `insumo_ibfk_1` FOREIGN KEY (`idTipoUnidad`) REFERENCES `tipounidad` (`idTipoUnidad`),
  CONSTRAINT `insumo_ibfk_2` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.insumo: ~0 rows (aproximadamente)
DELETE FROM `insumo`;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.inventarioequipo
CREATE TABLE IF NOT EXISTS `inventarioequipo` (
  `idInventarioEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `stock` decimal(10,2) DEFAULT NULL,
  `idEquipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInventarioEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.inventarioequipo: ~0 rows (aproximadamente)
DELETE FROM `inventarioequipo`;
/*!40000 ALTER TABLE `inventarioequipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventarioequipo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.inventarioinsumo
CREATE TABLE IF NOT EXISTS `inventarioinsumo` (
  `idInventarioInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `stock` decimal(10,2) DEFAULT NULL,
  `idInsumo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInventarioInsumo`),
  KEY `idInsumo` (`idInsumo`),
  CONSTRAINT `inventarioinsumo_ibfk_1` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idInsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.inventarioinsumo: ~0 rows (aproximadamente)
DELETE FROM `inventarioinsumo`;
/*!40000 ALTER TABLE `inventarioinsumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventarioinsumo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.inventariomaterial
CREATE TABLE IF NOT EXISTS `inventariomaterial` (
  `idInventarioMaterial` int(11) NOT NULL AUTO_INCREMENT,
  `stock` decimal(10,2) DEFAULT NULL,
  `idMaterial` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInventarioMaterial`),
  KEY `idMaterial` (`idMaterial`),
  CONSTRAINT `inventariomaterial_ibfk_1` FOREIGN KEY (`idMaterial`) REFERENCES `material` (`idMaterial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.inventariomaterial: ~0 rows (aproximadamente)
DELETE FROM `inventariomaterial`;
/*!40000 ALTER TABLE `inventariomaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventariomaterial` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.inventarioproducto
CREATE TABLE IF NOT EXISTS `inventarioproducto` (
  `idInventarioProducto` int(11) NOT NULL AUTO_INCREMENT,
  `stock` decimal(10,2) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInventarioProducto`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `inventarioproducto_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.inventarioproducto: ~0 rows (aproximadamente)
DELETE FROM `inventarioproducto`;
/*!40000 ALTER TABLE `inventarioproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventarioproducto` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.lote
CREATE TABLE IF NOT EXISTS `lote` (
  `idLote` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLote`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.lote: ~0 rows (aproximadamente)
DELETE FROM `lote`;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.manodeobra
CREATE TABLE IF NOT EXISTS `manodeobra` (
  `idManodeObra` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `idUnidadMedida` int(11) DEFAULT NULL,
  `idTipoCosto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idManodeObra`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  KEY `idTipoCosto` (`idTipoCosto`),
  CONSTRAINT `manodeobra_ibfk_1` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  CONSTRAINT `manodeobra_ibfk_2` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.manodeobra: ~0 rows (aproximadamente)
DELETE FROM `manodeobra`;
/*!40000 ALTER TABLE `manodeobra` DISABLE KEYS */;
/*!40000 ALTER TABLE `manodeobra` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.manodeobraproceso
CREATE TABLE IF NOT EXISTS `manodeobraproceso` (
  `idManodeObraProceso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `idProceso` int(11) DEFAULT NULL,
  `idManodeObra` int(11) DEFAULT NULL,
  PRIMARY KEY (`idManodeObraProceso`),
  KEY `idProceso` (`idProceso`),
  KEY `idManodeObra` (`idManodeObra`),
  CONSTRAINT `manodeobraproceso_ibfk_1` FOREIGN KEY (`idProceso`) REFERENCES `proceso` (`idProceso`),
  CONSTRAINT `manodeobraproceso_ibfk_2` FOREIGN KEY (`idManodeObra`) REFERENCES `manodeobra` (`idManodeObra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.manodeobraproceso: ~0 rows (aproximadamente)
DELETE FROM `manodeobraproceso`;
/*!40000 ALTER TABLE `manodeobraproceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `manodeobraproceso` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.manodeobrareceta
CREATE TABLE IF NOT EXISTS `manodeobrareceta` (
  `idManodeObraReceta` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `idManodeObra` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idManodeObraReceta`),
  KEY `idReceta` (`idReceta`),
  KEY `idManodeObra` (`idManodeObra`),
  CONSTRAINT `manodeobrareceta_ibfk_1` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`),
  CONSTRAINT `manodeobrareceta_ibfk_2` FOREIGN KEY (`idManodeObra`) REFERENCES `manodeobra` (`idManodeObra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.manodeobrareceta: ~0 rows (aproximadamente)
DELETE FROM `manodeobrareceta`;
/*!40000 ALTER TABLE `manodeobrareceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `manodeobrareceta` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.manoobra
CREATE TABLE IF NOT EXISTS `manoobra` (
  `idManoObra` int(11) NOT NULL AUTO_INCREMENT,
  `requerimiento` time DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idEquipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idManoObra`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idEquipo` (`idEquipo`),
  CONSTRAINT `manoobra_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `manoobra_ibfk_2` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.manoobra: ~0 rows (aproximadamente)
DELETE FROM `manoobra`;
/*!40000 ALTER TABLE `manoobra` DISABLE KEYS */;
/*!40000 ALTER TABLE `manoobra` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.maquina
CREATE TABLE IF NOT EXISTS `maquina` (
  `idMaquina` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idMaquina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.maquina: ~0 rows (aproximadamente)
DELETE FROM `maquina`;
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.marca: ~0 rows (aproximadamente)
DELETE FROM `marca`;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`idMarca`, `descripcion`) VALUES
	(1, 'Amazonica');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.materia
CREATE TABLE IF NOT EXISTS `materia` (
  `idMateria` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `idUnidadMedida` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL,
  `idTipoMateria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMateria`),
  KEY `idTipoMateria` (`idTipoMateria`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  KEY `idMarca` (`idMarca`),
  CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`idTipoMateria`) REFERENCES `tipomateria` (`idTipoMateria`),
  CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  CONSTRAINT `materia_ibfk_3` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.materia: ~0 rows (aproximadamente)
DELETE FROM `materia`;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.materiacosto
CREATE TABLE IF NOT EXISTS `materiacosto` (
  `idMateriaCostos` int(11) NOT NULL AUTO_INCREMENT,
  `precioUnitario` decimal(18,2) DEFAULT NULL,
  `idMateria` int(11) DEFAULT NULL,
  `idTipoCosto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMateriaCostos`),
  KEY `idMateria` (`idMateria`),
  KEY `idTipoCosto` (`idTipoCosto`),
  CONSTRAINT `materiacosto_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`),
  CONSTRAINT `materiacosto_ibfk_2` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.materiacosto: ~0 rows (aproximadamente)
DELETE FROM `materiacosto`;
/*!40000 ALTER TABLE `materiacosto` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiacosto` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.material
CREATE TABLE IF NOT EXISTS `material` (
  `idMaterial` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `idTipoUnidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMaterial`),
  KEY `idTipoUnidad` (`idTipoUnidad`),
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`idTipoUnidad`) REFERENCES `tipounidad` (`idTipoUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.material: ~0 rows (aproximadamente)
DELETE FROM `material`;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.materiaproceso
CREATE TABLE IF NOT EXISTS `materiaproceso` (
  `idMateriaProceso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `idProceso` int(11) DEFAULT NULL,
  `idMateria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMateriaProceso`),
  KEY `idProceso` (`idProceso`),
  KEY `idMateria` (`idMateria`),
  CONSTRAINT `materiaproceso_ibfk_1` FOREIGN KEY (`idProceso`) REFERENCES `proceso` (`idProceso`),
  CONSTRAINT `materiaproceso_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.materiaproceso: ~0 rows (aproximadamente)
DELETE FROM `materiaproceso`;
/*!40000 ALTER TABLE `materiaproceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiaproceso` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.modulo
CREATE TABLE IF NOT EXISTS `modulo` (
  `idModulo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idModulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.modulo: ~0 rows (aproximadamente)
DELETE FROM `modulo`;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.movimiento
CREATE TABLE IF NOT EXISTS `movimiento` (
  `idMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `idTipoMovimiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMovimiento`),
  KEY `idTipoMovimiento` (`idTipoMovimiento`),
  CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`idTipoMovimiento`) REFERENCES `tipomovimiento` (`idTipoMovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.movimiento: ~0 rows (aproximadamente)
DELETE FROM `movimiento`;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.movimientoequipo
CREATE TABLE IF NOT EXISTS `movimientoequipo` (
  `idMovimientoEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `lote` varchar(45) DEFAULT NULL,
  `condicion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMovimientoEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.movimientoequipo: ~0 rows (aproximadamente)
DELETE FROM `movimientoequipo`;
/*!40000 ALTER TABLE `movimientoequipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientoequipo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.movimientoinsumo
CREATE TABLE IF NOT EXISTS `movimientoinsumo` (
  `idMovimientoInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `idInsumo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMovimientoInsumo`),
  KEY `idInsumo` (`idInsumo`),
  CONSTRAINT `movimientoinsumo_ibfk_1` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idInsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.movimientoinsumo: ~0 rows (aproximadamente)
DELETE FROM `movimientoinsumo`;
/*!40000 ALTER TABLE `movimientoinsumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientoinsumo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.movimientomateria
CREATE TABLE IF NOT EXISTS `movimientomateria` (
  `idMovimientoMateria` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `idMovimiento` int(11) DEFAULT NULL,
  `idMateria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMovimientoMateria`),
  KEY `idMovimiento` (`idMovimiento`),
  KEY `idMateria` (`idMateria`),
  CONSTRAINT `movimientomateria_ibfk_1` FOREIGN KEY (`idMovimiento`) REFERENCES `movimiento` (`idMovimiento`),
  CONSTRAINT `movimientomateria_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.movimientomateria: ~0 rows (aproximadamente)
DELETE FROM `movimientomateria`;
/*!40000 ALTER TABLE `movimientomateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientomateria` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.movimientomaterial
CREATE TABLE IF NOT EXISTS `movimientomaterial` (
  `idMovimientoMaterial` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `lote` varchar(45) DEFAULT NULL,
  `idMaterial` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMovimientoMaterial`),
  KEY `idMaterial` (`idMaterial`),
  CONSTRAINT `movimientomaterial_ibfk_1` FOREIGN KEY (`idMaterial`) REFERENCES `material` (`idMaterial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.movimientomaterial: ~0 rows (aproximadamente)
DELETE FROM `movimientomaterial`;
/*!40000 ALTER TABLE `movimientomaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientomaterial` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.movimientoproducto
CREATE TABLE IF NOT EXISTS `movimientoproducto` (
  `idMovimientoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `lote` varchar(45) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMovimientoProducto`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `movimientoproducto_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `movimientoproducto_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.movimientoproducto: ~0 rows (aproximadamente)
DELETE FROM `movimientoproducto`;
/*!40000 ALTER TABLE `movimientoproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientoproducto` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.ordenproduccion
CREATE TABLE IF NOT EXISTS `ordenproduccion` (
  `idOrdenProduccion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(80) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOrdenProduccion`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `ordenproduccion_ibfk_1` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.ordenproduccion: ~0 rows (aproximadamente)
DELETE FROM `ordenproduccion`;
/*!40000 ALTER TABLE `ordenproduccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenproduccion` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.ordenproduccionproceso
CREATE TABLE IF NOT EXISTS `ordenproduccionproceso` (
  `idOrdenProducionProceso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(80) DEFAULT NULL,
  `idOrdenProduccion` int(11) DEFAULT NULL,
  `idProceso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOrdenProducionProceso`),
  KEY `idOrdenProduccion` (`idOrdenProduccion`),
  KEY `idProceso` (`idProceso`),
  CONSTRAINT `ordenproduccionproceso_ibfk_1` FOREIGN KEY (`idOrdenProduccion`) REFERENCES `ordenproduccion` (`idOrdenProduccion`),
  CONSTRAINT `ordenproduccionproceso_ibfk_2` FOREIGN KEY (`idProceso`) REFERENCES `proceso` (`idProceso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.ordenproduccionproceso: ~0 rows (aproximadamente)
DELETE FROM `ordenproduccionproceso`;
/*!40000 ALTER TABLE `ordenproduccionproceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenproduccionproceso` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.proceso
CREATE TABLE IF NOT EXISTS `proceso` (
  `idProceso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `idMaquina` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProceso`),
  KEY `idMaquina` (`idMaquina`),
  CONSTRAINT `proceso_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.proceso: ~0 rows (aproximadamente)
DELETE FROM `proceso`;
/*!40000 ALTER TABLE `proceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `proceso` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `idUnidadMedida` int(11) DEFAULT NULL,
  `idTipoProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  KEY `idTipoProducto` (`idTipoProducto`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipoproducto` (`idTipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.producto: ~0 rows (aproximadamente)
DELETE FROM `producto`;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`idProducto`, `codigo`, `nombre`, `descripcion`, `cantidad`, `imagen`, `idUnidadMedida`, `idTipoProducto`) VALUES
	(1, '123456', 'Chocolate con pasa', '50% cacao', 20.00, NULL, 3, 2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `tipoDocumento` int(11) DEFAULT NULL,
  `idTipoProveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `idTipoProveedor` (`idTipoProveedor`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`idTipoProveedor`) REFERENCES `tipoproveedor` (`idTipoProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.proveedor: ~0 rows (aproximadamente)
DELETE FROM `proveedor`;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.receta
CREATE TABLE IF NOT EXISTS `receta` (
  `idReceta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `batch` decimal(10,2) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `fechaincio` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  `lote` varchar(45) DEFAULT NULL,
  `pesoportableta` decimal(10,2) DEFAULT NULL,
  `pesoentableta` decimal(10,2) DEFAULT NULL,
  `merma` decimal(10,2) DEFAULT NULL,
  `reproceso` decimal(10,2) DEFAULT NULL,
  `fechavencimiento` date DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `idproducto` (`idproducto`),
  CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.receta: ~0 rows (aproximadamente)
DELETE FROM `receta`;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.recetacostomarketing
CREATE TABLE IF NOT EXISTS `recetacostomarketing` (
  `idRecetaCostoMarketing` int(11) NOT NULL AUTO_INCREMENT,
  `requerimiento` decimal(10,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  `idCostoMarketing` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRecetaCostoMarketing`),
  KEY `idCostoMarketing` (`idCostoMarketing`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `recetacostomarketing_ibfk_1` FOREIGN KEY (`idCostoMarketing`) REFERENCES `costomarketing` (`idCostoMarketing`),
  CONSTRAINT `recetacostomarketing_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.recetacostomarketing: ~0 rows (aproximadamente)
DELETE FROM `recetacostomarketing`;
/*!40000 ALTER TABLE `recetacostomarketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetacostomarketing` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.recetacostooperativo
CREATE TABLE IF NOT EXISTS `recetacostooperativo` (
  `idRecetaCostoOperativo` int(11) NOT NULL AUTO_INCREMENT,
  `requerimiento` decimal(10,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  `idCostoOperativo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRecetaCostoOperativo`),
  KEY `idCostoOperativo` (`idCostoOperativo`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `recetacostooperativo_ibfk_1` FOREIGN KEY (`idCostoOperativo`) REFERENCES `costooperativo` (`idCostoOperativo`),
  CONSTRAINT `recetacostooperativo_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.recetacostooperativo: ~0 rows (aproximadamente)
DELETE FROM `recetacostooperativo`;
/*!40000 ALTER TABLE `recetacostooperativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetacostooperativo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.recetacostoventa
CREATE TABLE IF NOT EXISTS `recetacostoventa` (
  `idRecetaCostoVenta` int(11) NOT NULL AUTO_INCREMENT,
  `requerimiento` decimal(10,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  `idCostoVenta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRecetaCostoVenta`),
  KEY `idCostoVenta` (`idCostoVenta`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `recetacostoventa_ibfk_1` FOREIGN KEY (`idCostoVenta`) REFERENCES `costoventa` (`idCostoVenta`),
  CONSTRAINT `recetacostoventa_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.recetacostoventa: ~0 rows (aproximadamente)
DELETE FROM `recetacostoventa`;
/*!40000 ALTER TABLE `recetacostoventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetacostoventa` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.recetainsumo
CREATE TABLE IF NOT EXISTS `recetainsumo` (
  `idRecetaInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `pesoneto` decimal(10,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idInsumo` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRecetaInsumo`),
  KEY `idInsumo` (`idInsumo`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `recetainsumo_ibfk_1` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idInsumo`),
  CONSTRAINT `recetainsumo_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.recetainsumo: ~0 rows (aproximadamente)
DELETE FROM `recetainsumo`;
/*!40000 ALTER TABLE `recetainsumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetainsumo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.recetamateria
CREATE TABLE IF NOT EXISTS `recetamateria` (
  `idRecetaMateria` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `idMateria` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRecetaMateria`),
  KEY `idMateria` (`idMateria`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `recetamateria_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`),
  CONSTRAINT `recetamateria_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.recetamateria: ~0 rows (aproximadamente)
DELETE FROM `recetamateria`;
/*!40000 ALTER TABLE `recetamateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetamateria` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.recetamaterial
CREATE TABLE IF NOT EXISTS `recetamaterial` (
  `idRecetaMaterial` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idMaterial` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRecetaMaterial`),
  KEY `idMaterial` (`idMaterial`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `recetamaterial_ibfk_1` FOREIGN KEY (`idMaterial`) REFERENCES `material` (`idMaterial`),
  CONSTRAINT `recetamaterial_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.recetamaterial: ~0 rows (aproximadamente)
DELETE FROM `recetamaterial`;
/*!40000 ALTER TABLE `recetamaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetamaterial` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tarifaenergia
CREATE TABLE IF NOT EXISTS `tarifaenergia` (
  `idTarifaEnergia` int(11) NOT NULL AUTO_INCREMENT,
  `tarifakwh` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idTarifaEnergia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tarifaenergia: ~0 rows (aproximadamente)
DELETE FROM `tarifaenergia`;
/*!40000 ALTER TABLE `tarifaenergia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarifaenergia` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipocosto
CREATE TABLE IF NOT EXISTS `tipocosto` (
  `idTipoCosto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoCosto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipocosto: ~0 rows (aproximadamente)
DELETE FROM `tipocosto`;
/*!40000 ALTER TABLE `tipocosto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocosto` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipodocumento
CREATE TABLE IF NOT EXISTS `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipodocumento: ~0 rows (aproximadamente)
DELETE FROM `tipodocumento`;
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipomateria
CREATE TABLE IF NOT EXISTS `tipomateria` (
  `idTipoMateria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipomateria: ~0 rows (aproximadamente)
DELETE FROM `tipomateria`;
/*!40000 ALTER TABLE `tipomateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomateria` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipomovimiento
CREATE TABLE IF NOT EXISTS `tipomovimiento` (
  `idTipoMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoMovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipomovimiento: ~0 rows (aproximadamente)
DELETE FROM `tipomovimiento`;
/*!40000 ALTER TABLE `tipomovimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomovimiento` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipoproducto
CREATE TABLE IF NOT EXISTS `tipoproducto` (
  `idTipoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipoproducto: ~0 rows (aproximadamente)
DELETE FROM `tipoproducto`;
/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
INSERT INTO `tipoproducto` (`idTipoProducto`, `descripcion`) VALUES
	(1, 'Intermedio'),
	(2, 'Terminado');
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipoproveedor
CREATE TABLE IF NOT EXISTS `tipoproveedor` (
  `idTipoProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipoproveedor: ~0 rows (aproximadamente)
DELETE FROM `tipoproveedor`;
/*!40000 ALTER TABLE `tipoproveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoproveedor` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tiposueldo
CREATE TABLE IF NOT EXISTS `tiposueldo` (
  `idTipoSueldo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoSueldo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tiposueldo: ~0 rows (aproximadamente)
DELETE FROM `tiposueldo`;
/*!40000 ALTER TABLE `tiposueldo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiposueldo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipounidad
CREATE TABLE IF NOT EXISTS `tipounidad` (
  `idTipoUnidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipounidad: ~0 rows (aproximadamente)
DELETE FROM `tipounidad`;
/*!40000 ALTER TABLE `tipounidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipounidad` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.unidadmedida
CREATE TABLE IF NOT EXISTS `unidadmedida` (
  `idUnidadMedida` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUnidadMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.unidadmedida: ~0 rows (aproximadamente)
DELETE FROM `unidadmedida`;
/*!40000 ALTER TABLE `unidadmedida` DISABLE KEYS */;
INSERT INTO `unidadmedida` (`idUnidadMedida`, `descripcion`) VALUES
	(1, 'Kilogramos'),
	(2, 'Litros'),
	(3, 'Unidades');
/*!40000 ALTER TABLE `unidadmedida` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `perfil` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `foto` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.usuario: ~0 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idUsuario`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
	(1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S', 'Administrador', NULL, 1, NULL, '2022-10-18 16:42:18');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.usuariomodulo
CREATE TABLE IF NOT EXISTS `usuariomodulo` (
  `idUsuarioModulo` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `idModulo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuarioModulo`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idModulo` (`idModulo`),
  CONSTRAINT `usuariomodulo_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `usuariomodulo_ibfk_2` FOREIGN KEY (`idModulo`) REFERENCES `modulo` (`idModulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.usuariomodulo: ~0 rows (aproximadamente)
DELETE FROM `usuariomodulo`;
/*!40000 ALTER TABLE `usuariomodulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuariomodulo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
