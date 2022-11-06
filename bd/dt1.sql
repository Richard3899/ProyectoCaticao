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

-- Volcando datos para la tabla caticao.consumoenergia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `consumoenergia` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumoenergia` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.consumoenergiareceta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `consumoenergiareceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumoenergiareceta` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.consumogas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `consumogas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumogas` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.costorecetapormes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `costorecetapormes` DISABLE KEYS */;
/*!40000 ALTER TABLE `costorecetapormes` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.depreciacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `depreciacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `depreciacion` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.depreciacionreceta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `depreciacionreceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `depreciacionreceta` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.desembolso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `desembolso` DISABLE KEYS */;
INSERT IGNORE INTO `desembolso` (`idDesembolso`, `descripcion`) VALUES
	(1, 'Gastos Administrativos'),
	(2, 'Costo de venta'),
	(3, 'Costo de Marketing'),
	(4, 'Costo Operativo');
/*!40000 ALTER TABLE `desembolso` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.empleado: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT IGNORE INTO `empleado` (`idEmpleado`, `nombre`, `apellido`, `direccion`, `telefono`, `correo`, `numeroDocumento`, `fechaNacimiento`, `cargo`, `horarioTrabajo`, `horasPorDia`, `sueldoPorDia`, `sueldoPorMes`, `idTipoDocumento`, `idUsuario`, `idTipoCosto`) VALUES
	(1, 'Julio', 'Gonzales', 'Av. Alfonso Ugarte Lt.12', 987654321, 'julio@gmail.com', 432187654, '2022-11-03', 'Empaquetador', '8am - 6pm', 8, 30.00, 1000.00, 1, NULL, 1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.gastoadmin: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gastoadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastoadmin` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.gastoadminpormes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gastoadminpormes` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastoadminpormes` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.gastoadminreceta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gastoadminreceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastoadminreceta` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.inventariomaquina: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inventariomaquina` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventariomaquina` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.inventariomateria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inventariomateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventariomateria` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.inventarioproducto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inventarioproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventarioproducto` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.lote: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.manoobra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `manoobra` DISABLE KEYS */;
/*!40000 ALTER TABLE `manoobra` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.manoobrareceta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `manoobrareceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `manoobrareceta` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.maquina: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
INSERT IGNORE INTO `maquina` (`idMaquina`, `codigo`, `nombre`, `serie`, `modelo`, `descripcion`, `marca`, `precio`, `añoCompra`, `capacidad`, `potencia`, `vidaUtil`) VALUES
	(3, 'SL-0002', 'Seleccionadora', 'SL9212', 'MD-2022', 'Selecciona y limpia la materia prima', 'KAT', 15000.00, 2022, 60.00, 1.00, 5);
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.marca: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT IGNORE INTO `marca` (`idMarca`, `descripcion`) VALUES
	(1, 'GLORIA'),
	(2, 'DULFINA'),
	(4, 'SAFE');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.materia: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT IGNORE INTO `materia` (`idMateria`, `codigo`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `idUnidadMedida`, `idMarca`, `idTipoMateria`) VALUES
	(1, 'LC-12', 'LECHE', 'SIN LACTOSA', 55.00, 12.00, '', 2, 1, 1),
	(2, 'CJ-1245', 'CAJAS', 'DE CARTON', 15.00, 100.00, '', 3, 4, 2);
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.modulo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.movimiento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.movimientomaquina: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimientomaquina` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientomaquina` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.movimientomateria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimientomateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientomateria` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.movimientoproducto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimientoproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientoproducto` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.producto: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT IGNORE INTO `producto` (`idProducto`, `codigo`, `nombre`, `descripcion`, `cantidad`, `imagen`, `idUnidadMedida`, `idTipoProducto`) VALUES
	(1, '123456', 'Chocolate con pasa', '50% cacao', 20.00, NULL, 3, 2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.receta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.recetamateria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `recetamateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetamateria` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.tarifaenergia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tarifaenergia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarifaenergia` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.tipocosto: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipocosto` DISABLE KEYS */;
INSERT IGNORE INTO `tipocosto` (`idTipoCosto`, `descripcion`) VALUES
	(1, 'Fijo'),
	(2, 'Variable');
/*!40000 ALTER TABLE `tipocosto` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.tipodocumento: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
INSERT IGNORE INTO `tipodocumento` (`idTipoDocumento`, `descripcion`) VALUES
	(1, 'DNI'),
	(2, 'RUC'),
	(3, 'Pasaporte');
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.tipomateria: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipomateria` DISABLE KEYS */;
INSERT IGNORE INTO `tipomateria` (`idTipoMateria`, `descripcion`) VALUES
	(1, 'Insumo'),
	(2, 'Material');
/*!40000 ALTER TABLE `tipomateria` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.tipomovimiento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipomovimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomovimiento` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.tipoproducto: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
INSERT IGNORE INTO `tipoproducto` (`idTipoProducto`, `descripcion`) VALUES
	(1, 'Intermedio'),
	(2, 'Terminado');
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.tipounidad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipounidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipounidad` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.unidadmedida: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `unidadmedida` DISABLE KEYS */;
INSERT IGNORE INTO `unidadmedida` (`idUnidadMedida`, `descripcion`, `idTipoUnidad`) VALUES
	(1, 'Kilogramos', NULL),
	(2, 'Litros', NULL),
	(3, 'Unidades', NULL);
/*!40000 ALTER TABLE `unidadmedida` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.usuario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT IGNORE INTO `usuario` (`idUsuario`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
	(1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S', 'Administrador', 'vistas/img/usuarios/admin/592.png', 1, '2022-11-06 01:28:04', '2022-10-18 16:42:18');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando datos para la tabla caticao.usuariomodulo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuariomodulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuariomodulo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
