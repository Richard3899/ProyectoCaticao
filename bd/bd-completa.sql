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
  `idTipoCostos` int(11) DEFAULT NULL,
  `idUnidadMedida` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConsumoEnergia`),
  KEY `idMaquina` (`idMaquina`),
  KEY `idTipoCostos` (`idTipoCostos`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  CONSTRAINT `consumoenergia_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`),
  CONSTRAINT `consumoenergia_ibfk_2` FOREIGN KEY (`idTipoCostos`) REFERENCES `tipocostos` (`idTipoCostos`),
  CONSTRAINT `consumoenergia_ibfk_3` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.consumoenergia: ~0 rows (aproximadamente)
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
/*!40000 ALTER TABLE `consumoenergiareceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumoenergiareceta` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.consumo_energia
CREATE TABLE IF NOT EXISTS `consumo_energia` (
  `idConsumo_Energia` int(11) NOT NULL AUTO_INCREMENT,
  `horasporbatch` time DEFAULT NULL,
  `idTarifa_Energia` int(11) DEFAULT NULL,
  `idEquipos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConsumo_Energia`),
  KEY `idEquipos` (`idEquipos`),
  KEY `idTarifa_Energia` (`idTarifa_Energia`),
  CONSTRAINT `consumo_energia_ibfk_1` FOREIGN KEY (`idEquipos`) REFERENCES `equipos` (`idEquipos`),
  CONSTRAINT `consumo_energia_ibfk_2` FOREIGN KEY (`idTarifa_Energia`) REFERENCES `tarifa_energia` (`idTarifa_Energia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.consumo_energia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `consumo_energia` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumo_energia` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.consumo_gas
CREATE TABLE IF NOT EXISTS `consumo_gas` (
  `idConsumo_Gas` int(11) NOT NULL AUTO_INCREMENT,
  `peso_gas` decimal(10,2) DEFAULT NULL,
  `horastrabajoporbatch` time DEFAULT NULL,
  `tarifagasporkg` decimal(10,2) DEFAULT NULL,
  `idEquipos` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConsumo_Gas`),
  KEY `idEquipos` (`idEquipos`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `consumo_gas_ibfk_1` FOREIGN KEY (`idEquipos`) REFERENCES `equipos` (`idEquipos`),
  CONSTRAINT `consumo_gas_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.consumo_gas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `consumo_gas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumo_gas` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.costos_receta_por_mes
CREATE TABLE IF NOT EXISTS `costos_receta_por_mes` (
  `idCostos_Gastos_Administrativos` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `mes` varchar(45) DEFAULT NULL,
  `costototalrecetapormes` decimal(10,2) DEFAULT NULL,
  `idGastos_Administrativos_por_mes` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCostos_Gastos_Administrativos`),
  KEY `idGastos_Administrativos_por_mes` (`idGastos_Administrativos_por_mes`),
  CONSTRAINT `costos_receta_por_mes_ibfk_1` FOREIGN KEY (`idGastos_Administrativos_por_mes`) REFERENCES `gastos_administrativos_por_mes` (`idGastos_Administrativos_por_mes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.costos_receta_por_mes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `costos_receta_por_mes` DISABLE KEYS */;
/*!40000 ALTER TABLE `costos_receta_por_mes` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.costo_marketing
CREATE TABLE IF NOT EXISTS `costo_marketing` (
  `idCosto_Marketing` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idTipo_Unidad` int(11) DEFAULT NULL,
  `idTipo_Costo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCosto_Marketing`),
  KEY `idTipo_Unidad` (`idTipo_Unidad`),
  KEY `idTipo_Costo` (`idTipo_Costo`),
  CONSTRAINT `costo_marketing_ibfk_1` FOREIGN KEY (`idTipo_Unidad`) REFERENCES `tipo_unidad` (`idTipo_Unidad`),
  CONSTRAINT `costo_marketing_ibfk_2` FOREIGN KEY (`idTipo_Costo`) REFERENCES `tipo_costo` (`idTipo_Costo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.costo_marketing: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `costo_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `costo_marketing` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.costo_operativos
CREATE TABLE IF NOT EXISTS `costo_operativos` (
  `idCosto_Operativos` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idTipo_Unidad` int(11) DEFAULT NULL,
  `idTipo_Costo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCosto_Operativos`),
  KEY `idTipo_Unidad` (`idTipo_Unidad`),
  KEY `idTipo_Costo` (`idTipo_Costo`),
  CONSTRAINT `costo_operativos_ibfk_1` FOREIGN KEY (`idTipo_Unidad`) REFERENCES `tipo_unidad` (`idTipo_Unidad`),
  CONSTRAINT `costo_operativos_ibfk_2` FOREIGN KEY (`idTipo_Costo`) REFERENCES `tipo_costo` (`idTipo_Costo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.costo_operativos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `costo_operativos` DISABLE KEYS */;
/*!40000 ALTER TABLE `costo_operativos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.costo_ventas
CREATE TABLE IF NOT EXISTS `costo_ventas` (
  `idCosto_Ventas` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idTipo_Unidad` int(11) DEFAULT NULL,
  `idTipo_Costo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCosto_Ventas`),
  KEY `idTipo_Unidad` (`idTipo_Unidad`),
  KEY `idTipo_Costo` (`idTipo_Costo`),
  CONSTRAINT `costo_ventas_ibfk_1` FOREIGN KEY (`idTipo_Unidad`) REFERENCES `tipo_unidad` (`idTipo_Unidad`),
  CONSTRAINT `costo_ventas_ibfk_2` FOREIGN KEY (`idTipo_Costo`) REFERENCES `tipo_costo` (`idTipo_Costo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.costo_ventas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `costo_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `costo_ventas` ENABLE KEYS */;

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
  `idTipoCostos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDepreciacion`),
  KEY `idMaquina` (`idMaquina`),
  KEY `idTipoCostos` (`idTipoCostos`),
  CONSTRAINT `depreciacion_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`),
  CONSTRAINT `depreciacion_ibfk_2` FOREIGN KEY (`idTipoCostos`) REFERENCES `tipocostos` (`idTipoCostos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.depreciacion: ~0 rows (aproximadamente)
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
/*!40000 ALTER TABLE `depreciacionreceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `depreciacionreceta` ENABLE KEYS */;

-- Volcando estructura para procedimiento caticao.editar_usuario
DELIMITER //
CREATE PROCEDURE `editar_usuario`(     in nombreE VARCHAR(45),
                                        in usuarioE VARCHAR(45),
                                        in passwordE VARCHAR(100),
                                        in perfilE VARCHAR(45),
                                        in fotoE VARCHAR(100))
BEGIN
	update usuario set nombre=nombreE,
                        usuario=usuarioE,
                        password=passwordE,
                        perfil=perfilE,
                        foto=fotoE
				where usuario=usuarioE;
END//
DELIMITER ;

-- Volcando estructura para procedimiento caticao.eliminar_usuario
DELIMITER //
CREATE PROCEDURE `eliminar_usuario`(in idUsuarioE int)
BEGIN
	delete from usuario
    where idUsuario=idUsuarioE;
END//
DELIMITER ;

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
  `idTipo_Sueldo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `idTipo_Sueldo` (`idTipo_Sueldo`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idTipo_Sueldo`) REFERENCES `tipo_sueldo` (`idTipo_Sueldo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.empleado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.equipos
CREATE TABLE IF NOT EXISTS `equipos` (
  `idEquipos` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`idEquipos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.equipos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.gastosadmin
CREATE TABLE IF NOT EXISTS `gastosadmin` (
  `idGastosAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `idUnidadMedida` int(11) DEFAULT NULL,
  `idTipoCostos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGastosAdmin`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  KEY `idTipoCostos` (`idTipoCostos`),
  CONSTRAINT `gastosadmin_ibfk_1` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  CONSTRAINT `gastosadmin_ibfk_2` FOREIGN KEY (`idTipoCostos`) REFERENCES `tipocostos` (`idTipoCostos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.gastosadmin: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gastosadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastosadmin` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.gastosadminproceso
CREATE TABLE IF NOT EXISTS `gastosadminproceso` (
  `idGastosAdminProceso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `idProceso` int(11) DEFAULT NULL,
  `idGastosAdmin` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGastosAdminProceso`),
  KEY `idProceso` (`idProceso`),
  KEY `idGastosAdmin` (`idGastosAdmin`),
  CONSTRAINT `gastosadminproceso_ibfk_1` FOREIGN KEY (`idProceso`) REFERENCES `proceso` (`idProceso`),
  CONSTRAINT `gastosadminproceso_ibfk_2` FOREIGN KEY (`idGastosAdmin`) REFERENCES `gastosadmin` (`idGastosAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.gastosadminproceso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gastosadminproceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastosadminproceso` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.gastosadminreceta
CREATE TABLE IF NOT EXISTS `gastosadminreceta` (
  `idGastosAdminReceta` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `idGastosAdmin` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGastosAdminReceta`),
  KEY `idGastosAdmin` (`idGastosAdmin`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `gastosadminreceta_ibfk_1` FOREIGN KEY (`idGastosAdmin`) REFERENCES `gastosadmin` (`idGastosAdmin`),
  CONSTRAINT `gastosadminreceta_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.gastosadminreceta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gastosadminreceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastosadminreceta` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.gastos_administrativos
CREATE TABLE IF NOT EXISTS `gastos_administrativos` (
  `idGastos_Administrativos` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idTipo_Unidad` int(11) DEFAULT NULL,
  `idTipo_Costo` int(11) DEFAULT NULL,
  `idGastos_Administrativos_por_mes` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGastos_Administrativos`),
  KEY `idTipo_Unidad` (`idTipo_Unidad`),
  KEY `idTipo_Costo` (`idTipo_Costo`),
  KEY `idGastos_Administrativos_por_mes` (`idGastos_Administrativos_por_mes`),
  CONSTRAINT `gastos_administrativos_ibfk_1` FOREIGN KEY (`idTipo_Unidad`) REFERENCES `tipo_unidad` (`idTipo_Unidad`),
  CONSTRAINT `gastos_administrativos_ibfk_2` FOREIGN KEY (`idTipo_Costo`) REFERENCES `tipo_costo` (`idTipo_Costo`),
  CONSTRAINT `gastos_administrativos_ibfk_3` FOREIGN KEY (`idGastos_Administrativos_por_mes`) REFERENCES `gastos_administrativos_por_mes` (`idGastos_Administrativos_por_mes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.gastos_administrativos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gastos_administrativos` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastos_administrativos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.gastos_administrativos_por_mes
CREATE TABLE IF NOT EXISTS `gastos_administrativos_por_mes` (
  `idGastos_Administrativos_por_mes` int(11) NOT NULL AUTO_INCREMENT,
  `requerimiento` decimal(10,2) DEFAULT NULL,
  `costos` decimal(10,2) DEFAULT NULL,
  `Gastos_Administrativos_por_mescol` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idGastos_Administrativos_por_mes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.gastos_administrativos_por_mes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gastos_administrativos_por_mes` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastos_administrativos_por_mes` ENABLE KEYS */;

-- Volcando estructura para procedimiento caticao.insertar_usuario
DELIMITER //
CREATE PROCEDURE `insertar_usuario`(   in nombreI VARCHAR(45),
                                        in usuarioI VARCHAR(45),
                                        in passwordI VARCHAR(100),
                                        in perfilI VARCHAR(45),
                                        in fotoI VARCHAR(100))
BEGIN
	insert into usuario (nombre,usuario,password,perfil,foto,estado)
				  values (nombreI,usuarioI,passwordI,perfilI,fotoI,1);
END//
DELIMITER ;

-- Volcando estructura para tabla caticao.insumos
CREATE TABLE IF NOT EXISTS `insumos` (
  `idInsumos` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `idTipo_Unidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInsumos`),
  KEY `idTipo_Unidad` (`idTipo_Unidad`),
  CONSTRAINT `insumos_ibfk_1` FOREIGN KEY (`idTipo_Unidad`) REFERENCES `tipo_unidad` (`idTipo_Unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.insumos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.inventario_equipos
CREATE TABLE IF NOT EXISTS `inventario_equipos` (
  `idInventario_Materiales` int(11) NOT NULL AUTO_INCREMENT,
  `stock` decimal(10,2) DEFAULT NULL,
  `idEquipos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInventario_Materiales`),
  KEY `idEquipos` (`idEquipos`),
  CONSTRAINT `inventario_equipos_ibfk_1` FOREIGN KEY (`idEquipos`) REFERENCES `equipos` (`idEquipos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.inventario_equipos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inventario_equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario_equipos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.inventario_insumos
CREATE TABLE IF NOT EXISTS `inventario_insumos` (
  `idInventario_Insumos` int(11) NOT NULL AUTO_INCREMENT,
  `stock` decimal(10,2) DEFAULT NULL,
  `idInsumos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInventario_Insumos`),
  KEY `idInsumos` (`idInsumos`),
  CONSTRAINT `inventario_insumos_ibfk_1` FOREIGN KEY (`idInsumos`) REFERENCES `insumos` (`idInsumos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.inventario_insumos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inventario_insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario_insumos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.inventario_materiales
CREATE TABLE IF NOT EXISTS `inventario_materiales` (
  `idInventario_Materiales` int(11) NOT NULL AUTO_INCREMENT,
  `stock` decimal(10,2) DEFAULT NULL,
  `idMateriales` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInventario_Materiales`),
  KEY `idMateriales` (`idMateriales`),
  CONSTRAINT `inventario_materiales_ibfk_1` FOREIGN KEY (`idMateriales`) REFERENCES `materiales` (`idMateriales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.inventario_materiales: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inventario_materiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario_materiales` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.inventario_productos
CREATE TABLE IF NOT EXISTS `inventario_productos` (
  `idInventario_Productos` int(11) NOT NULL AUTO_INCREMENT,
  `stock` decimal(10,2) DEFAULT NULL,
  `idProductos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInventario_Productos`),
  KEY `idProductos` (`idProductos`),
  CONSTRAINT `inventario_productos_ibfk_1` FOREIGN KEY (`idProductos`) REFERENCES `productos` (`idProductos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.inventario_productos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inventario_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario_productos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.lote
CREATE TABLE IF NOT EXISTS `lote` (
  `idLote` int(11) NOT NULL AUTO_INCREMENT,
  `numeroLote` int(11) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLote`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.lote: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.manodeobra
CREATE TABLE IF NOT EXISTS `manodeobra` (
  `idManodeObra` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `idUnidadMedida` int(11) DEFAULT NULL,
  `idTipoCostos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idManodeObra`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  KEY `idTipoCostos` (`idTipoCostos`),
  CONSTRAINT `manodeobra_ibfk_1` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  CONSTRAINT `manodeobra_ibfk_2` FOREIGN KEY (`idTipoCostos`) REFERENCES `tipocostos` (`idTipoCostos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.manodeobra: ~0 rows (aproximadamente)
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
/*!40000 ALTER TABLE `manodeobrareceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `manodeobrareceta` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.mano_obra
CREATE TABLE IF NOT EXISTS `mano_obra` (
  `idMano_Obra` int(11) NOT NULL AUTO_INCREMENT,
  `requerimiento` time DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idEquipos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMano_Obra`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idEquipos` (`idEquipos`),
  CONSTRAINT `mano_obra_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `mano_obra_ibfk_2` FOREIGN KEY (`idEquipos`) REFERENCES `equipos` (`idEquipos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.mano_obra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mano_obra` DISABLE KEYS */;
/*!40000 ALTER TABLE `mano_obra` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.maquina
CREATE TABLE IF NOT EXISTS `maquina` (
  `idMaquina` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idMaquina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.maquina: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.marca: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.materia
CREATE TABLE IF NOT EXISTS `materia` (
  `idMateria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `idTipoMateria` int(11) DEFAULT NULL,
  `idUnidadMedida` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMateria`),
  KEY `idTipoMateria` (`idTipoMateria`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  KEY `idMarca` (`idMarca`),
  CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`idTipoMateria`) REFERENCES `tipomateria` (`idTipoMateria`),
  CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  CONSTRAINT `materia_ibfk_3` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.materia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.materiacostos
CREATE TABLE IF NOT EXISTS `materiacostos` (
  `idMateriaCostos` int(11) NOT NULL AUTO_INCREMENT,
  `precioUnitario` decimal(18,2) DEFAULT NULL,
  `idMateria` int(11) DEFAULT NULL,
  `idTipoCostos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMateriaCostos`),
  KEY `idMateria` (`idMateria`),
  KEY `idTipoCostos` (`idTipoCostos`),
  CONSTRAINT `materiacostos_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`),
  CONSTRAINT `materiacostos_ibfk_2` FOREIGN KEY (`idTipoCostos`) REFERENCES `tipocostos` (`idTipoCostos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.materiacostos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `materiacostos` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiacostos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.materiales
CREATE TABLE IF NOT EXISTS `materiales` (
  `idMateriales` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `idTipo_Unidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMateriales`),
  KEY `idTipo_Unidad` (`idTipo_Unidad`),
  CONSTRAINT `materiales_ibfk_1` FOREIGN KEY (`idTipo_Unidad`) REFERENCES `tipo_unidad` (`idTipo_Unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.materiales: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `materiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiales` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `materiaproceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiaproceso` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.modulos
CREATE TABLE IF NOT EXISTS `modulos` (
  `idModulos` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idModulos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.modulos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;

-- Volcando estructura para procedimiento caticao.mostrar_usuarios
DELIMITER //
CREATE PROCEDURE `mostrar_usuarios`()
BEGIN
	select * from usuario;
END//
DELIMITER ;

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
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `movimientomateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientomateria` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.movimientoproducto
CREATE TABLE IF NOT EXISTS `movimientoproducto` (
  `idMovimientoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `numeroMovimiento` int(11) DEFAULT NULL,
  `valorUnitario` decimal(18,2) DEFAULT NULL,
  `idProductos` int(11) DEFAULT NULL,
  `idMovimiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMovimientoProducto`),
  KEY `idProductos` (`idProductos`),
  KEY `idMovimiento` (`idMovimiento`),
  CONSTRAINT `movimientoproducto_ibfk_1` FOREIGN KEY (`idProductos`) REFERENCES `productos` (`idProductos`),
  CONSTRAINT `movimientoproducto_ibfk_2` FOREIGN KEY (`idMovimiento`) REFERENCES `movimiento` (`idMovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.movimientoproducto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimientoproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientoproducto` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.movimiento_equipos
CREATE TABLE IF NOT EXISTS `movimiento_equipos` (
  `idEquipos` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `lote` varchar(45) DEFAULT NULL,
  `condicion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEquipos`),
  CONSTRAINT `movimiento_equipos_ibfk_1` FOREIGN KEY (`idEquipos`) REFERENCES `equipos` (`idEquipos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.movimiento_equipos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimiento_equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento_equipos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.movimiento_insumos
CREATE TABLE IF NOT EXISTS `movimiento_insumos` (
  `idMovimiento_Insumos` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `idInsumos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMovimiento_Insumos`),
  KEY `idInsumos` (`idInsumos`),
  CONSTRAINT `movimiento_insumos_ibfk_1` FOREIGN KEY (`idInsumos`) REFERENCES `insumos` (`idInsumos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.movimiento_insumos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimiento_insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento_insumos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.movimiento_materiales
CREATE TABLE IF NOT EXISTS `movimiento_materiales` (
  `idMovimiento_Materiales` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `lote` varchar(45) DEFAULT NULL,
  `idMateriales` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMovimiento_Materiales`),
  KEY `idMateriales` (`idMateriales`),
  CONSTRAINT `movimiento_materiales_ibfk_1` FOREIGN KEY (`idMateriales`) REFERENCES `materiales` (`idMateriales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.movimiento_materiales: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimiento_materiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento_materiales` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.movimiento_productos
CREATE TABLE IF NOT EXISTS `movimiento_productos` (
  `idMovimiento_Insumos` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `lote` varchar(45) DEFAULT NULL,
  `idProductos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMovimiento_Insumos`),
  KEY `idProductos` (`idProductos`),
  CONSTRAINT `movimiento_productos_ibfk_1` FOREIGN KEY (`idProductos`) REFERENCES `productos` (`idProductos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.movimiento_productos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimiento_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento_productos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.ordenproduccion
CREATE TABLE IF NOT EXISTS `ordenproduccion` (
  `idOrdenProduccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOrdenProduccion`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `ordenproduccion_ibfk_1` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.ordenproduccion: ~0 rows (aproximadamente)
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
/*!40000 ALTER TABLE `proceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `proceso` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `idProductos` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `idTipo_Unidad` int(11) DEFAULT NULL,
  `idTipo_Productos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProductos`),
  KEY `idTipo_Unidad` (`idTipo_Unidad`),
  KEY `idTipo_Productos` (`idTipo_Productos`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idTipo_Unidad`) REFERENCES `tipo_unidad` (`idTipo_Unidad`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idTipo_Productos`) REFERENCES `tipo_productos` (`idTipo_Productos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.productos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.receta
CREATE TABLE IF NOT EXISTS `receta` (
  `idReceta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `batch` decimal(10,2) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `fecha_incio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `lote` varchar(45) DEFAULT NULL,
  `pesoportableta` decimal(10,2) DEFAULT NULL,
  `pesoentableta` decimal(10,2) DEFAULT NULL,
  `merma` decimal(10,2) DEFAULT NULL,
  `reproceso` decimal(10,2) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `idproductos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `idproductos` (`idproductos`),
  CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`idproductos`) REFERENCES `productos` (`idProductos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.receta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `recetamateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetamateria` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.receta_costo_marketing
CREATE TABLE IF NOT EXISTS `receta_costo_marketing` (
  `idReceta_Costo_Marketing` int(11) NOT NULL AUTO_INCREMENT,
  `requerimiento` decimal(10,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  `idCosto_Marketing` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReceta_Costo_Marketing`),
  KEY `idCosto_Marketing` (`idCosto_Marketing`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `receta_costo_marketing_ibfk_1` FOREIGN KEY (`idCosto_Marketing`) REFERENCES `costo_marketing` (`idCosto_Marketing`),
  CONSTRAINT `receta_costo_marketing_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.receta_costo_marketing: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `receta_costo_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_costo_marketing` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.receta_costo_operativos
CREATE TABLE IF NOT EXISTS `receta_costo_operativos` (
  `idReceta_Costo_Operativos` int(11) NOT NULL AUTO_INCREMENT,
  `requerimiento` decimal(10,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  `idCosto_Operativos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReceta_Costo_Operativos`),
  KEY `idCosto_Operativos` (`idCosto_Operativos`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `receta_costo_operativos_ibfk_1` FOREIGN KEY (`idCosto_Operativos`) REFERENCES `costo_operativos` (`idCosto_Operativos`),
  CONSTRAINT `receta_costo_operativos_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.receta_costo_operativos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `receta_costo_operativos` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_costo_operativos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.receta_costo_ventas
CREATE TABLE IF NOT EXISTS `receta_costo_ventas` (
  `idReceta_Costo_Ventas` int(11) NOT NULL AUTO_INCREMENT,
  `requerimiento` decimal(10,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  `idCosto_Ventas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReceta_Costo_Ventas`),
  KEY `idCosto_Ventas` (`idCosto_Ventas`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `receta_costo_ventas_ibfk_1` FOREIGN KEY (`idCosto_Ventas`) REFERENCES `costo_ventas` (`idCosto_Ventas`),
  CONSTRAINT `receta_costo_ventas_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.receta_costo_ventas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `receta_costo_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_costo_ventas` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.receta_insumos
CREATE TABLE IF NOT EXISTS `receta_insumos` (
  `idReceta_Insumos` int(11) NOT NULL AUTO_INCREMENT,
  `peso_neto` decimal(10,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idInsumos` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReceta_Insumos`),
  KEY `idInsumos` (`idInsumos`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `receta_insumos_ibfk_1` FOREIGN KEY (`idInsumos`) REFERENCES `insumos` (`idInsumos`),
  CONSTRAINT `receta_insumos_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.receta_insumos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `receta_insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_insumos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.receta_materiales
CREATE TABLE IF NOT EXISTS `receta_materiales` (
  `idReceta_Materiales` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `idMateriales` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReceta_Materiales`),
  KEY `idMateriales` (`idMateriales`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `receta_materiales_ibfk_1` FOREIGN KEY (`idMateriales`) REFERENCES `materiales` (`idMateriales`),
  CONSTRAINT `receta_materiales_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.receta_materiales: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `receta_materiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_materiales` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tarifa_energia
CREATE TABLE IF NOT EXISTS `tarifa_energia` (
  `idTarifa_Energia` int(11) NOT NULL AUTO_INCREMENT,
  `tarifakwh` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idTarifa_Energia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tarifa_energia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tarifa_energia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarifa_energia` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipocostos
CREATE TABLE IF NOT EXISTS `tipocostos` (
  `idTipoCostos` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoCostos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipocostos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipocostos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocostos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipodocumento
CREATE TABLE IF NOT EXISTS `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipodocumento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipomateria
CREATE TABLE IF NOT EXISTS `tipomateria` (
  `idTipoMateria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipomateria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipomateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomateria` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipomovimiento
CREATE TABLE IF NOT EXISTS `tipomovimiento` (
  `idTipoMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoMovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipomovimiento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipomovimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomovimiento` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipoproducto
CREATE TABLE IF NOT EXISTS `tipoproducto` (
  `idTipoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionTP` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipoproducto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipoproveedor
CREATE TABLE IF NOT EXISTS `tipoproveedor` (
  `idTipoProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipoproveedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipoproveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoproveedor` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipo_costo
CREATE TABLE IF NOT EXISTS `tipo_costo` (
  `idTipo_Costo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipo_Costo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipo_costo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_costo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_costo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipo_productos
CREATE TABLE IF NOT EXISTS `tipo_productos` (
  `idTipo_Productos` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipo_Productos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipo_productos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_productos` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipo_sueldo
CREATE TABLE IF NOT EXISTS `tipo_sueldo` (
  `idTipo_Sueldo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipo_Sueldo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipo_sueldo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_sueldo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_sueldo` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.tipo_unidad
CREATE TABLE IF NOT EXISTS `tipo_unidad` (
  `idTipo_Unidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipo_Unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.tipo_unidad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_unidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_unidad` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.unidadmedida
CREATE TABLE IF NOT EXISTS `unidadmedida` (
  `idUnidadMedida` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `TipoMedida` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.unidadmedida: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `unidadmedida` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idUsuario`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
	(1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S', 'Vendedor', 'vistas/img/usuarios/admin/408.png', 1, '2022-10-23 00:52:44', '2022-10-18 16:42:18'),
	(2, 'carlos', 'carlos123', '$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy', 'Vendedor', '', 1, NULL, '2022-10-23 00:53:24');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla caticao.usuario_modulos
CREATE TABLE IF NOT EXISTS `usuario_modulos` (
  `idUsuario_Modulos` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `idModulos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario_Modulos`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idModulos` (`idModulos`),
  CONSTRAINT `usuario_modulos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `usuario_modulos_ibfk_2` FOREIGN KEY (`idModulos`) REFERENCES `modulos` (`idModulos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla caticao.usuario_modulos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_modulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_modulos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
