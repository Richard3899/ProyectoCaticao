-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.31 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando datos para la tabla caticao.movimientomateria: ~5 rows (aproximadamente)
INSERT INTO `movimientomateria` (`idMovimientoMateria`, `ingreso`, `salida`, `observacion`, `fecha`, `hora`, `idMateria`, `idMovimiento`) VALUES
	(1, 250.00, 0.00, 'Produccion', '2022-12-17', '2022-12-11 10:23:25', 1, 1),
	(2, 150.00, 0.00, 'Produccion', '2022-12-31', '2022-12-11 10:23:37', 4, 1),
	(3, 100.00, 0.00, 'Produccion', '2022-12-10', '2022-12-11 10:23:50', 3, 1),
	(4, 500.00, 0.00, 'Produccion', '2022-12-10', '2022-12-11 10:24:03', 3, 1),
	(5, 500.00, 0.00, 'Produccion', '2022-12-17', '2022-12-11 10:24:33', 5, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
