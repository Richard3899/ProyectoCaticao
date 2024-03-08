-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-03-2024 a las 16:03:39
-- Versión del servidor: 10.6.16-MariaDB-cll-lve
-- Versión de PHP: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `caticaoc_bd2`
--

DELIMITER $$
--
-- Procedimientos
--
$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `idConfiguracion` int(11) NOT NULL,
  `modoDark` int(11) DEFAULT NULL,
  `contraerBarraLateral` int(11) DEFAULT NULL,
  `ocultarBarraLateral` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`idConfiguracion`, `modoDark`, `contraerBarraLateral`, `ocultarBarraLateral`) VALUES
(1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `numeroDocumento` varchar(15) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `horarioTrabajo` varchar(50) DEFAULT NULL,
  `horasPorDia` int(11) DEFAULT NULL,
  `sueldoPorDia` decimal(10,2) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `sueldoPorMes` decimal(10,2) DEFAULT NULL,
  `idTipoDocumento` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idTipoCosto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `nombre`, `apellido`, `direccion`, `telefono`, `correo`, `numeroDocumento`, `fechaNacimiento`, `cargo`, `horarioTrabajo`, `horasPorDia`, `sueldoPorDia`, `precioUnitario`, `sueldoPorMes`, `idTipoDocumento`, `idUsuario`, `idTipoCosto`) VALUES
(1, 'Julio ', 'Granado Perez', 'Av. Lima Mz.A N°12', '980959938', 'juliogranado@gmail.com', '784034959', '1990-06-01', 'Operario', '9am-6pm', 8, 60.00, 7.50, 1320.00, 1, NULL, 1),
(2, 'Mario', 'Cardenas Luján', 'Av.Peru Mz.C N°153', '983949299', 'mariocardenas@gmail.com', '73908392', '1985-06-22', 'Operario', '9am-6pm', 8, 60.00, 7.50, 1320.00, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idEstado`, `descripcion`) VALUES
(1, 'Iniciado'),
(2, 'Proceso'),
(3, 'Terminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastoadmin`
--

CREATE TABLE `gastoadmin` (
  `idGastoAdmin` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `idTipoGasto` int(11) DEFAULT NULL,
  `idUnidadMedida` int(11) DEFAULT NULL,
  `idTipoCosto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gastoadmin`
--

INSERT INTO `gastoadmin` (`idGastoAdmin`, `codigo`, `descripcion`, `idTipoGasto`, `idUnidadMedida`, `idTipoCosto`) VALUES
(1, 'GA-001', 'GASTO ADMIN 1-INTERNET', 1, 3, 1),
(3, 'CM-001', 'COSTO MARKETING 1-PUBLICIDAD', 3, 3, 1),
(4, 'CO-001', 'COSTO OPERATIVO 1', 4, 3, 1),
(5, 'GA-002', 'GASTOS ADMIN 2-ALCOHOL', 1, 3, 2),
(6, 'CM-002', 'COSTO MARKETING 2-AFICHES', 3, 3, 1),
(7, 'GA-003', 'GASTOS ADMIN 3-ALQUILER DE LOCAL', 1, 3, 1),
(8, 'GA-004', 'GASTO ADMIN 4-UTILICES DE OFICINA', 1, 3, 2),
(9, 'GA-005', 'GASTOS ADMIN 5- LIMPIEZA DE OFICINA', 1, 3, 1),
(10, 'CO-002', 'COSTO OPERATIVO 2-MUEBLES PARA PERSONAL', 4, 3, 1),
(11, 'CO-003', 'AGUA POTABLE', 4, 2, 2),
(12, 'GA-006', 'JEFE DE PLANTA', 1, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastoadminpormes`
--

CREATE TABLE `gastoadminpormes` (
  `idGastoAdminPorMes` int(11) NOT NULL,
  `nombreGastoAdmin` varchar(50) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `idGastoAdmin` int(11) DEFAULT NULL,
  `idMesGasto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gastoadminpormes`
--

INSERT INTO `gastoadminpormes` (`idGastoAdminPorMes`, `nombreGastoAdmin`, `cantidad`, `precio`, `total`, `idGastoAdmin`, `idMesGasto`) VALUES
(3, 'GASTO ADMIN 1-INTERNET', 1.00, 200.00, 200.00, 1, 3),
(4, 'GASTOS ADMIN 3-ALQUILER DE LOCAL', 1.00, 1500.00, 1500.00, 7, 3),
(5, 'GASTO ADMIN 4-UTILICES DE OFICINA', 1.00, 200.00, 200.00, 8, 3),
(6, 'GASTOS ADMIN 5- LIMPIEZA DE OFICINA', 1.00, 500.00, 500.00, 9, 3),
(7, 'GASTOS ADMIN 2-ALCOHOL', 1.00, 10.00, 10.00, 5, 3),
(8, 'COSTO MARKETING 1-PUBLICIDAD', 1.00, 750.00, 750.00, 3, 3),
(9, 'COSTO MARKETING 2-AFICHES', 1.00, 80.00, 80.00, 6, 3),
(10, 'AGUA POTABLE', 1.00, 300.00, 300.00, 11, 3),
(11, 'JEFE DE PLANTA', 1.00, 1400.00, 1400.00, 12, 3),
(12, 'GASTO ADMIN 1-INTERNET', 1.00, 200.00, 200.00, 1, 4),
(13, 'GASTOS ADMIN 3-ALQUILER DE LOCAL', 1.00, 1500.00, 1500.00, 7, 4),
(14, 'GASTO ADMIN 4-UTILICES DE OFICINA', 1.00, 200.00, 200.00, 8, 4),
(15, 'GASTOS ADMIN 5- LIMPIEZA DE OFICINA', 1.00, 500.00, 500.00, 9, 4),
(16, 'GASTOS ADMIN 2-ALCOHOL', 1.00, 10.00, 10.00, 5, 4),
(17, 'COSTO MARKETING 1-PUBLICIDAD', 1.00, 750.00, 750.00, 3, 4),
(18, 'COSTO MARKETING 2-AFICHES', 1.00, 80.00, 80.00, 6, 4),
(19, 'AGUA POTABLE', 1.00, 400.00, 400.00, 11, 4),
(20, 'JEFE DE PLANTA', 1.00, 1400.00, 1400.00, 12, 4),
(121, 'GASTO ADMIN 1-INTERNET', 1.00, 200.00, 200.00, 1, 5),
(122, 'GASTOS ADMIN 3-ALQUILER DE LOCAL', 1.00, 1500.00, 1500.00, 7, 5),
(123, 'GASTO ADMIN 4-UTILICES DE OFICINA', 1.00, 200.00, 200.00, 8, 5),
(124, 'GASTOS ADMIN 5- LIMPIEZA DE OFICINA', 1.00, 500.00, 500.00, 9, 5),
(125, 'GASTOS ADMIN 2-ALCOHOL', 1.00, 10.00, 10.00, 5, 5),
(126, 'COSTO MARKETING 1-PUBLICIDAD', 1.00, 850.00, 850.00, 3, 5),
(127, 'COSTO MARKETING 2-AFICHES', 1.00, 80.00, 80.00, 6, 5),
(128, 'AGUA POTABLE', 1.00, 450.00, 450.00, 11, 5),
(129, 'JEFE DE PLANTA', 1.00, 1400.00, 1400.00, 12, 5),
(136, 'GASTO ADMIN 1-INTERNET', 1.00, 200.00, 200.00, 1, 6),
(137, 'GASTOS ADMIN 3-ALQUILER DE LOCAL', 1.00, 1500.00, 1500.00, 7, 6),
(138, 'GASTO ADMIN 4-UTILICES DE OFICINA', 1.00, 200.00, 200.00, 8, 6),
(139, 'GASTOS ADMIN 5- LIMPIEZA DE OFICINA', 1.00, 500.00, 500.00, 9, 6),
(140, 'GASTOS ADMIN 2-ALCOHOL', 1.00, 10.00, 10.00, 5, 6),
(141, 'COSTO MARKETING 1-PUBLICIDAD', 1.00, 750.00, 750.00, 3, 6),
(142, 'COSTO MARKETING 2-AFICHES', 1.00, 80.00, 80.00, 6, 6),
(144, 'JEFE DE PLANTA', 1.00, 1400.00, 1400.00, 12, 6),
(151, 'AGUA POTABLE', 1.00, 430.00, 430.00, 11, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventariomaquina`
--

CREATE TABLE `inventariomaquina` (
  `idInventarioMaquina` int(11) NOT NULL,
  `stock` decimal(10,2) DEFAULT NULL,
  `ultimoMovimiento` timestamp NULL DEFAULT NULL,
  `idMaquina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventariomaquina`
--

INSERT INTO `inventariomaquina` (`idInventarioMaquina`, `stock`, `ultimoMovimiento`, `idMaquina`) VALUES
(1, 1.00, '2023-05-01 14:44:08', 1),
(2, 2.00, '2023-05-01 14:46:41', 2),
(3, 1.00, '2023-05-01 14:52:08', 3),
(4, 1.00, '2023-05-01 14:46:20', 4),
(5, 3.00, '2023-05-01 14:49:17', 5),
(6, 1.00, '2023-05-01 14:54:15', 6),
(7, 2.00, '2023-05-01 14:48:10', 7),
(8, 1.00, '2023-05-01 14:49:53', 8),
(9, 1.00, '2023-05-01 14:48:35', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventariomateria`
--

CREATE TABLE `inventariomateria` (
  `idInventarioMateria` int(11) NOT NULL,
  `stock` decimal(10,2) DEFAULT NULL,
  `ultimoMovimiento` timestamp NULL DEFAULT NULL,
  `idMateria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventariomateria`
--

INSERT INTO `inventariomateria` (`idInventarioMateria`, `stock`, `ultimoMovimiento`, `idMateria`) VALUES
(1, 6.60, '2023-11-08 22:38:57', 1),
(2, 28.15, '2023-08-17 14:15:36', 2),
(3, 24.30, '2023-08-23 13:19:34', 3),
(4, 42.10, '2023-11-08 22:38:57', 4),
(5, 1360.00, '2023-11-08 22:38:57', 5),
(6, 5360.00, '2023-11-08 22:38:57', 6),
(7, 35.00, '2023-08-07 14:30:36', 7),
(8, 29.50, '2023-08-16 14:30:10', 8),
(9, 8.00, '2023-08-07 14:25:45', 9),
(10, 31.15, '2023-11-08 22:38:57', 10),
(11, 37.35, '2023-08-09 14:23:11', 11),
(12, 41.90, '2023-08-04 14:41:27', 12),
(13, 51.15, '2023-08-17 14:12:14', 13),
(14, 31.15, '2023-08-04 14:50:20', 14),
(15, 27.15, '2023-08-21 13:23:32', 15),
(16, 32.90, '2023-08-19 12:59:19', 16),
(17, 37.70, '2023-08-24 13:15:34', 17),
(18, 2860.00, '2023-11-08 22:38:57', 18),
(19, 35.75, '2023-08-01 14:11:29', 19),
(20, 435.00, '2023-11-08 22:38:57', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarioproducto`
--

CREATE TABLE `inventarioproducto` (
  `idInventarioProducto` int(11) NOT NULL,
  `stock` decimal(10,2) DEFAULT NULL,
  `ultimoMovimiento` timestamp NULL DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventarioproducto`
--

INSERT INTO `inventarioproducto` (`idInventarioProducto`, `stock`, `ultimoMovimiento`, `idProducto`) VALUES
(1, 20.00, '2023-08-19 22:46:31', 1),
(2, 240.00, '2023-10-28 00:55:43', 2),
(3, 35.00, '2023-08-22 19:16:50', 3),
(4, 240.00, '2023-08-21 06:01:06', 4),
(5, 240.00, '2023-07-21 16:01:01', 5),
(6, 280.00, '2023-08-23 19:22:29', 6),
(7, 0.00, NULL, 7),
(8, 55.00, '2023-08-11 15:36:47', 8),
(10, 240.00, '2023-08-07 19:04:32', 10),
(11, 240.00, '2023-08-24 19:22:39', 11),
(12, 7.00, '2023-08-19 17:50:41', 12),
(13, 5.00, '2023-08-11 22:16:19', 13),
(14, 160.00, '2023-06-19 16:33:06', 14),
(15, 15.00, '2023-08-17 16:56:02', 15),
(16, 320.00, '2023-06-29 16:00:04', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `idLote` int(11) NOT NULL,
  `codigoLote` varchar(20) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `fechaProduccion` date DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`idLote`, `codigoLote`, `cantidad`, `precioUnitario`, `fechaProduccion`, `fechaVencimiento`, `idProducto`) VALUES
(2, '1', 0.00, 8.27, '2023-05-09', '2024-04-28', 1),
(3, '2', 0.00, 8.27, '2023-05-10', '2024-04-28', 1),
(4, '3', 0.00, 8.62, '2023-05-11', '2024-04-28', 1),
(5, '4', 0.00, 8.62, '2023-05-16', '2024-04-28', 1),
(6, '5', 40.00, 7.95, '2023-05-01', '2024-04-28', 16),
(7, '6', 40.00, 8.66, '2023-05-12', '2024-05-10', 10),
(8, '7', 40.00, 8.66, '2023-05-15', '2024-05-10', 10),
(9, '8', 40.00, 7.95, '2023-05-02', '2024-04-28', 16),
(10, '9', 40.00, 7.95, '2023-05-03', '2024-04-28', 16),
(15, '10', 40.00, 8.49, '2023-05-23', '2024-05-10', 4),
(16, '11', 40.00, 7.95, '2023-05-04', '2024-04-28', 16),
(17, '12', 40.00, 7.95, '2023-05-05', '2024-04-28', 16),
(19, '13', 0.00, 8.59, '2023-05-19', '2024-05-10', 13),
(20, '14', 5.00, 8.59, '2023-05-20', '2024-05-10', 13),
(21, '15', 0.00, 8.66, '2023-05-26', '2024-05-10', 12),
(22, '16', 7.00, 8.66, '2023-05-29', '2024-05-10', 12),
(23, '17', 40.00, 8.49, '2023-05-24', '2024-05-10', 4),
(24, '18', 0.00, 8.42, '2023-05-31', '2024-05-10', 15),
(25, '19', 0.00, 8.42, '2023-06-01', '2024-05-10', 15),
(26, '20', 40.00, 8.90, '2023-06-02', '2024-05-10', 11),
(27, '21', 40.00, 8.90, '2023-06-05', '2024-05-10', 11),
(28, '22', 40.00, 8.90, '2023-06-06', '2024-05-10', 11),
(29, '23', 40.00, 8.90, '2023-06-07', '2024-05-10', 11),
(30, '24', 40.00, 9.32, '2023-06-08', '2024-05-10', 6),
(31, '25', 40.00, 9.32, '2023-06-09', '2024-05-10', 6),
(32, '26', 40.00, 9.32, '2023-06-12', '2024-05-10', 6),
(33, '27', 40.00, 9.32, '2023-06-13', '2024-05-10', 6),
(34, '28', 40.00, 9.08, '2023-06-14', '2024-05-10', 14),
(35, '29', 40.00, 9.08, '2023-06-15', '2024-05-10', 14),
(36, '30', 40.00, 9.08, '2023-06-16', '2024-05-10', 14),
(37, '31', 40.00, 9.08, '2023-06-19', '2024-05-10', 14),
(38, '32', 0.00, 9.21, '2023-06-20', '2024-05-10', 1),
(39, '33', 0.00, 9.21, '2023-06-11', '2024-05-10', 1),
(40, '34', 0.00, 9.21, '2023-06-22', '2024-05-10', 1),
(41, '35', 0.00, 9.21, '2023-06-23', '2024-05-10', 1),
(42, '36', 40.00, 8.90, '2023-06-26', '2024-05-10', 5),
(43, '37', 40.00, 8.03, '2023-06-26', '2024-04-28', 16),
(45, '39', 40.00, 8.03, '2023-06-29', '2024-04-28', 16),
(48, '40', 0.00, 10.83, '2023-07-05', '2024-04-28', 3),
(49, '41', 0.00, 10.83, '2023-07-06', '2024-04-28', 3),
(50, '42', 35.00, 10.83, '2023-07-07', '2024-04-28', 3),
(51, '43', 0.00, 10.83, '2023-07-10', '2024-04-28', 3),
(53, '44', 40.00, 10.83, '2023-07-11', '2024-04-28', 5),
(54, '45', 40.00, 10.83, '2023-07-12', '2024-04-28', 5),
(55, '46', 40.00, 10.83, '2023-07-13', '2024-04-28', 5),
(56, '47', 40.00, 10.83, '2023-07-14', '2024-04-28', 5),
(58, '48', 15.00, 10.83, '2023-07-20', '2024-04-28', 15),
(59, '49', 40.00, 10.83, '2023-07-21', '2024-04-28', 5),
(61, '50', 40.00, 12.20, '2023-07-24', '2024-04-28', 4),
(62, '51', 40.00, 10.83, '2023-07-26', '2024-04-28', 4),
(63, '52', 40.00, 10.83, '2023-07-27', '2024-04-28', 4),
(64, '53', 40.00, 10.83, '2023-07-28', '2024-04-28', 4),
(65, '54', 0.00, 7.86, '2023-05-16', '2024-04-17', 8),
(66, '55', 40.00, 2.81, '2023-08-02', '2024-04-28', 10),
(67, '56', 0.00, 7.86, '2023-05-17', '2024-04-17', 8),
(68, '57', 40.00, 2.40, '2023-08-03', '2024-04-28', 10),
(69, '58', 40.00, 2.81, '2023-08-04', '2024-04-28', 10),
(70, '59', 40.00, 2.81, '2023-08-07', '2024-04-28', 10),
(72, '60', 15.00, 0.00, '2023-08-10', '2024-04-28', 8),
(73, '61', 40.00, 0.00, '2023-08-11', '2024-04-28', 8),
(74, '62', 0.00, 0.00, '2023-08-15', '2024-04-28', 1),
(75, '63', 0.00, 0.00, '2023-08-16', '2024-04-28', 1),
(76, '64', 0.00, 0.00, '2023-08-17', '2024-04-28', 1),
(77, '65', 20.00, 0.00, '2023-08-18', '2024-04-28', 1),
(78, '66', 40.00, 0.00, '2023-08-21', '2024-04-28', 6),
(79, '67', 40.00, 0.00, '2023-08-22', '2024-04-28', 6),
(80, '68', 40.00, 0.00, '2023-08-23', '2024-04-28', 6),
(81, '69', 40.00, 0.00, '2023-08-24', '2024-04-28', 11),
(82, '70', 40.00, 0.00, '2023-08-25', '2024-04-28', 11),
(83, '71', 40.00, 0.00, '2023-08-14', '2024-04-28', 2),
(84, '72', 40.00, 0.00, '2023-08-18', '2024-04-28', 2),
(85, '73', 40.00, 0.00, '2023-08-21', '2024-04-28', 2),
(86, '74', 40.00, 0.00, '2023-08-21', '2024-04-28', 2),
(87, '38', 40.00, 8.03, '2023-06-28', '2024-04-28', 16),
(89, '65868', 40.00, 0.00, '2023-10-21', '2024-04-28', 2),
(90, '98649', 40.00, 0.00, '2023-11-16', '2024-04-28', 2),
(91, '24145', 0.00, 0.00, NULL, '2024-04-28', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina`
--

CREATE TABLE `maquina` (
  `idMaquina` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `añoCompra` int(11) DEFAULT NULL,
  `capacidad` decimal(10,2) DEFAULT NULL,
  `potenciaHP` decimal(10,2) DEFAULT NULL,
  `potenciaWatts` decimal(10,2) DEFAULT NULL,
  `potenciaKw` decimal(10,2) DEFAULT NULL,
  `depreciacionAnual` decimal(10,2) DEFAULT NULL,
  `depreciacionMensual` decimal(10,2) DEFAULT NULL,
  `depreciacionHora` decimal(10,2) DEFAULT NULL,
  `vidaUtil` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `maquina`
--

INSERT INTO `maquina` (`idMaquina`, `codigo`, `nombre`, `serie`, `modelo`, `descripcion`, `marca`, `precio`, `añoCompra`, `capacidad`, `potenciaHP`, `potenciaWatts`, `potenciaKw`, `depreciacionAnual`, `depreciacionMensual`, `depreciacionHora`, `vidaUtil`) VALUES
(1, 'SL-001', 'SELECCIONADORA', 'SL-1234', 'SL-0000', '-', 'CAT', 8000.00, 2022, 60.00, 1.00, 745.70, 0.75, 1600.00, 133.33, 0.22, 5),
(2, 'TS-001', 'TOSTADORA', 'TS-1234', 'TS-0000', '-', 'CAT', 12500.00, 2022, 60.00, 1.00, 745.70, 0.75, 2500.00, 208.33, 0.35, 5),
(3, 'BM-001', 'BAÑO MARIA', 'BM-1234', 'BM-0000', '-', 'CAT', 150.00, 2022, 1.00, 1.00, 745.70, 0.75, 150.00, 12.50, 0.02, 1),
(4, 'DS-001', 'DESCASCARILLADORA', 'DS-1234', 'DS-0000', '-', 'CAT', 14000.00, 2022, 80.00, 2.50, 1864.25, 1.86, 2800.00, 233.33, 0.39, 5),
(5, 'MP-001', 'MOLINOS DE PIEDRA', 'MP-1234', 'MP-0000', '-', 'CAT', 18000.00, 2022, 40.00, 3.00, 2237.10, 2.24, 3600.00, 300.00, 0.50, 5),
(6, 'MB-001', 'MOLINO DE BILLAS', 'MB-1234', 'MB-0000', '-', 'CAT', 27000.00, 2022, 60.00, 3.50, 2609.95, 2.61, 5400.00, 450.00, 0.75, 5),
(7, 'AA-001', 'AIRE ACONDICIONADO', 'AA-1234', 'AA-0000', '-', 'CAT', 3000.00, 2022, 80.00, 2.00, 1491.40, 1.49, 600.00, 50.00, 0.08, 5),
(8, 'CF-001', 'CAMARA FRÍO', 'CF-1234', 'CF-0000', '-', 'CAT', 3000.00, 2022, 65.00, 2.50, 1864.25, 1.86, 600.00, 50.00, 0.08, 5),
(9, 'SD-001', 'SELLADORA', 'SD-1234', 'SD-000', '-', 'CAT', 2100.00, 2022, 1400.00, 0.75, 559.28, 0.56, 2100.00, 175.00, 0.29, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `descripcion`) VALUES
(1, 'SIN MARCA'),
(2, 'VILLA NATURA'),
(3, 'GLORIA'),
(4, 'COSTEÑO'),
(6, 'CARTAVIO'),
(7, 'SAN DIEGO'),
(8, 'BRYMAR'),
(9, 'DULCINITA'),
(10, 'SEMILLA VERDE'),
(11, 'MANUTATA'),
(12, 'TOTTUS'),
(13, 'BELL\'S'),
(14, 'DEL CAMPO A TU CASA'),
(15, 'ORGANIX'),
(16, 'KENT'),
(17, 'LA BOLIVIANA'),
(18, 'PEGAFAN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idMateria` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `idUnidadMedida` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL,
  `idTipoMateria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`idMateria`, `codigo`, `nombre`, `descripcion`, `precio`, `cantidad`, `precioUnitario`, `imagen`, `idUnidadMedida`, `idMarca`, `idTipoMateria`) VALUES
(1, 'CC-001', 'CACAO', 'DE LA SELVA', 400.00, 100.00, 4.00, 'vistas/img/insumos/CC-001/175.jpg', 1, 1, 1),
(2, 'PS-001', 'PASAS', 'DULCE', 40.00, 1.50, 26.67, 'vistas/img/insumos/PS-001/214.png', 1, 2, 1),
(3, 'LC-001', 'LECHE', 'ENTERA', 52.00, 10.00, 5.20, 'vistas/img/insumos/LC-001/881.jpg', 2, 3, 1),
(4, 'AZ-001', 'AZUCAR', 'BLANCA', 112.00, 50.00, 2.24, 'vistas/img/insumos/AZ-001/991.jpg', 1, 6, 1),
(5, 'CJ-001', 'CAJAS', 'DE CARTON', 30.00, 100.00, 0.30, 'vistas/img/materiales/CJ-001/938.jpg', 3, 1, 2),
(6, 'BBL-001', 'BOLSAS BILAMINADO', '-', 3.00, 100.00, 0.03, 'vistas/img/materiales/BBL-001/796.png', 3, 1, 2),
(7, 'LC_002', 'LECHE', 'EN POLVO', 105.00, 25.00, 4.20, 'vistas/img/insumos/LC_002/194.png', 1, 7, 1),
(8, 'LS_001', 'LECITINA', 'DE SOYA', 80.00, 1.00, 80.00, 'vistas/img/insumos/LS_001/681.jpg', 1, 8, 1),
(9, 'VN_001', 'VAINILLA', 'GALÓN', 17.00, 4.00, 4.25, 'vistas/img/insumos/VN_001/274.jpg', 2, 9, 1),
(10, 'PC-001', 'PECANAS', '-', 29.90, 0.25, 119.60, 'vistas/img/insumos/PC-001/838.png', 1, 10, 1),
(11, 'CS-001', 'CASTAÑAS', 'CROCANTES', 16.00, 0.20, 80.00, 'vistas/img/insumos/CS-001/707.png', 1, 11, 1),
(12, 'QN-001', 'QUINUA', '-', 12.50, 1.00, 12.50, 'vistas/img/insumos/QN-001/282.png', 1, 12, 1),
(13, 'AG-001', 'AGUAYMANTO', '-', 3.50, 0.20, 17.50, 'vistas/img/insumos/AG-001/878.png', 1, 13, 1),
(14, 'AR-001', 'ARÁNDANOS', 'FRESCOS', 14.99, 0.50, 29.98, 'vistas/img/insumos/AR-001/997.png', 1, 13, 1),
(15, 'CÑ-001', 'CAÑIHUA', 'ECOLÓGICA', 14.00, 0.40, 35.00, 'vistas/img/insumos/CÑ-001/597.jpg', 1, 14, 1),
(16, 'KW-001', 'KIWICHA', 'ORGÁNICA', 24.90, 1.00, 24.90, 'vistas/img/insumos/KW-001/980.png', 1, 15, 1),
(17, 'MG-001', 'MANGO', '-', 4.10, 1.00, 4.10, 'vistas/img/insumos/MG-001/558.png', 1, 16, 1),
(18, 'ET-001', 'ETIQUETAS', '-', 0.01, 1.00, 0.01, 'vistas/img/materiales/ET-001/427.png', 3, 1, 2),
(19, 'ST-001', 'STEVIA', '-', 20.50, 0.25, 82.00, 'vistas/img/insumos/ST-001/299.png', 1, 17, 1),
(20, 'CT-001', 'CINTA', 'CINTA DE EMBALAJE', 105.00, 15.00, 7.00, 'vistas/img/materiales/CT-001/352.jpg', 3, 18, 2),
(21, 'A123213', 'dsfds', 'fsdf', 3.00, 3.00, 1.00, '', 2, 13, 1),
(22, '4234', 'fsdf', 'sdf', 4.00, 2.00, 2.00, '', 2, 13, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesgasto`
--

CREATE TABLE `mesgasto` (
  `idMesGasto` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `mes` date DEFAULT NULL,
  `cerradoMes` int(11) DEFAULT NULL,
  `ocultoMes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mesgasto`
--

INSERT INTO `mesgasto` (`idMesGasto`, `descripcion`, `mes`, `cerradoMes`, `ocultoMes`) VALUES
(3, 'MAYO DEL 2023', '2023-05-01', 1, 1),
(4, 'JUNIO DEL 2023', '2023-06-01', 1, 1),
(5, 'JULIO DEL 2023', '2023-07-01', 1, 1),
(6, 'AGOSTO DEL 2023', '2023-08-01', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `idModulo` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`idModulo`, `descripcion`) VALUES
(1, 'inicio'),
(2, 'insumos'),
(3, 'materiales'),
(4, 'marcas'),
(5, 'productos'),
(6, 'maquinas'),
(7, 'empleados'),
(8, 'gastoadmin'),
(12, 'inventarioinsumos'),
(13, 'inventariomateriales'),
(14, 'inventarioproductos'),
(15, 'inventariomaquinas'),
(16, 'recetas'),
(17, 'costoreceta'),
(18, 'mesgasto'),
(19, 'usuarios'),
(20, 'reporteinsumos'),
(21, 'reportemateriales'),
(22, 'reporteproductos'),
(23, 'configuracion'),
(24, 'loteproductos'),
(25, 'reporterecetas'),
(28, 'backup'),
(29, 'salir'),
(30, 'kardexinsumos'),
(31, 'kardexmateriales'),
(32, 'kardexproductos'),
(33, 'kardexmaquinas'),
(34, 'recetainsumos'),
(35, 'recetamateriales'),
(36, 'recetamanodeobra'),
(37, 'recetadepreciacion'),
(38, 'recetaconsumoenergia'),
(39, 'recetaconsumogas'),
(43, 'costototal'),
(44, 'gastoadminpormes'),
(45, 'costototalpormes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `idMovimiento` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`idMovimiento`, `descripcion`) VALUES
(1, 'Ingreso'),
(2, 'Salida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientomaquina`
--

CREATE TABLE `movimientomaquina` (
  `idMovimientoMaquina` int(11) NOT NULL,
  `ingreso` decimal(10,2) DEFAULT NULL,
  `salida` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` timestamp NULL DEFAULT current_timestamp(),
  `idMaquina` int(11) DEFAULT NULL,
  `idMovimiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientomaquina`
--

INSERT INTO `movimientomaquina` (`idMovimientoMaquina`, `ingreso`, `salida`, `observacion`, `fecha`, `hora`, `idMaquina`, `idMovimiento`) VALUES
(3, 1.00, 0.00, 'Compra', '2023-05-01', '2023-05-01 14:44:08', 1, 1),
(4, 1.00, 0.00, 'Compra', '2023-05-01', '2023-05-01 14:46:20', 4, 1),
(5, 2.00, 0.00, 'Compra', '2023-05-01', '2023-05-01 14:46:41', 2, 1),
(6, 2.00, 0.00, 'Compra', '2023-05-01', '2023-05-01 14:48:10', 7, 1),
(7, 1.00, 0.00, 'Compra', '2023-05-01', '2023-05-01 14:48:35', 9, 1),
(8, 3.00, 0.00, 'Compra', '2023-05-01', '2023-05-01 14:49:17', 5, 1),
(9, 1.00, 0.00, 'Compra', '2023-05-01', '2023-05-01 14:49:53', 8, 1),
(10, 1.00, 0.00, 'Compra', '2023-05-01', '2023-05-01 06:52:08', 3, 1),
(11, 1.00, 0.00, 'Compra', '2023-05-01', '2023-08-16 14:54:15', 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientomateria`
--

CREATE TABLE `movimientomateria` (
  `idMovimientoMateria` int(11) NOT NULL,
  `ingreso` decimal(10,2) DEFAULT NULL,
  `salida` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `codigoReceta` varchar(20) DEFAULT NULL,
  `hora` timestamp NULL DEFAULT current_timestamp(),
  `idMateria` int(11) DEFAULT NULL,
  `idMovimiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientomateria`
--

INSERT INTO `movimientomateria` (`idMovimientoMateria`, `ingreso`, `salida`, `observacion`, `fecha`, `codigoReceta`, `hora`, `idMateria`, `idMovimiento`) VALUES
(12, 10.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 13:43:24', 11, 1),
(13, 10.00, 0.00, 'Compra', '2023-05-15', 'S-C', '2023-05-15 14:48:34', 11, 1),
(14, 5.00, 0.00, 'Compra', '2023-06-10', 'S-C', '2023-06-10 14:19:05', 11, 1),
(15, 5.00, 0.00, 'Compra', '2023-06-20', 'S-C', '2023-06-20 14:51:19', 11, 1),
(16, 8.00, 0.00, 'Compra', '2023-07-23', 'S-C', '2023-07-23 14:21:43', 11, 1),
(17, 25.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 13:54:36', 1, 1),
(18, 20.00, 0.00, 'Compra', '2023-05-20', 'S-C', '2023-05-20 14:55:04', 1, 1),
(19, 30.00, 0.00, 'Compra', '2023-06-05', 'S-C', '2023-06-05 14:25:40', 1, 1),
(20, 25.00, 0.00, 'Compra', '2023-06-24', 'S-C', '2023-06-24 14:46:36', 1, 1),
(21, 27.00, 0.00, 'Compra', '2023-07-21', 'S-C', '2023-07-16 14:17:31', 1, 1),
(22, 28.00, 0.00, 'Compra', '2023-08-12', 'S-C', '2023-08-12 14:47:58', 1, 1),
(23, 7.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 13:59:45', 12, 1),
(24, 9.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 13:05:49', 17, 1),
(25, 8.00, 0.00, 'Compra', '2023-05-29', 'S-C', '2023-05-29 14:10:10', 17, 1),
(26, 7.00, 0.00, 'Compra', '2023-06-12', 'S-C', '2023-06-12 14:17:39', 17, 1),
(27, 10.00, 0.00, 'Compra', '2023-06-20', 'S-C', '2023-06-20 13:13:11', 17, 1),
(28, 7.00, 0.00, 'Compra', '2023-08-01', 'S-C', '2023-08-01 14:17:54', 17, 1),
(29, 8.00, 0.00, 'Compra', '2023-05-02', 'S-C', '2023-05-02 14:26:15', 13, 1),
(30, 6.00, 0.00, 'Compra', '2023-05-19', 'S-C', '2023-05-19 14:34:46', 13, 1),
(31, 9.00, 0.00, 'Compra', '2023-06-07', 'S-C', '2023-06-07 13:27:06', 13, 1),
(32, 9.00, 0.00, 'Compra', '2023-07-14', 'S-C', '2023-07-14 14:29:31', 13, 1),
(33, 8.00, 0.00, 'Compra', '2023-07-27', 'S-C', '2023-07-27 14:31:47', 13, 1),
(34, 5.00, 0.00, 'Compra', '2023-08-10', 'S-C', '2023-08-10 14:32:03', 13, 1),
(35, 3.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 14:51:34', 2, 1),
(36, 2.00, 0.00, 'Compra', '2023-05-19', 'S-C', '2023-05-19 13:53:27', 2, 1),
(37, 5.00, 0.00, 'Compra', '2023-06-07', 'S-C', '2023-06-07 14:54:00', 2, 1),
(38, 8.00, 0.00, 'Compra', '2023-06-19', 'S-C', '2023-06-19 14:26:03', 2, 1),
(39, 8.00, 0.00, 'Compra', '2023-07-14', 'S-C', '2023-07-14 14:46:35', 2, 1),
(40, 7.00, 0.00, 'Compra', '2023-08-10', 'S-C', '2023-08-10 14:57:02', 2, 1),
(41, 6.00, 0.00, 'Compra', '2023-05-02', 'S-C', '2023-05-02 14:58:59', 16, 1),
(42, 5.00, 0.00, 'Compra', '2023-08-19', 'S-C', '2023-08-19 12:59:19', 16, 1),
(43, 7.00, 0.00, 'Compra', '2023-06-07', 'S-C', '2023-06-07 13:00:19', 16, 1),
(44, 5.00, 0.00, 'Compra', '2023-06-19', 'S-C', '2023-06-19 14:10:59', 16, 1),
(45, 6.00, 0.00, 'Compra', '2023-07-14', 'S-C', '2023-07-14 14:19:26', 16, 1),
(46, 5.00, 0.00, 'Compra', '2023-08-10', 'S-C', '2023-08-10 14:01:53', 16, 1),
(47, 5.00, 0.00, 'Compra', '2023-05-21', 'S-C', '2023-05-21 14:19:15', 12, 1),
(48, 8.00, 0.00, 'Compra', '2023-06-07', 'S-C', '2023-06-07 14:19:37', 12, 1),
(49, 9.00, 0.00, 'Compra', '2023-06-22', 'S-C', '2023-06-22 14:29:47', 12, 1),
(50, 6.00, 0.00, 'Compra', '2023-07-11', 'S-C', '2023-07-11 14:21:11', 12, 1),
(51, 8.00, 0.00, 'Compra', '2023-08-04', 'S-C', '2023-08-04 14:41:27', 12, 1),
(52, 6.00, 0.00, 'Compra', '2023-05-02', 'S-C', '2023-05-02 14:41:21', 15, 1),
(53, 5.00, 0.00, 'Compra', '2023-05-22', 'S-C', '2023-05-22 13:41:59', 15, 1),
(54, 5.00, 0.00, 'Compra', '2023-06-08', 'S-C', '2023-06-08 14:42:34', 15, 1),
(55, 6.00, 0.00, 'Compra', '2023-06-21', 'S-C', '2023-06-21 14:43:04', 15, 1),
(56, 4.00, 0.00, 'Compra', '2023-07-12', 'S-C', '2023-07-12 14:43:43', 15, 1),
(57, 5.00, 0.00, 'Compra', '2023-08-14', 'S-C', '2023-08-14 13:44:03', 15, 1),
(58, 12.00, 0.00, 'Compra', '2023-05-02', 'S-C', '2023-05-02 14:51:36', 4, 1),
(59, 5.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 13:52:15', 10, 1),
(60, 5.00, 0.00, 'Compra', '2023-05-18', 'S-C', '2023-05-18 14:42:41', 10, 1),
(61, 10.00, 0.00, 'Compra', '2023-06-07', 'S-C', '2023-06-07 14:23:07', 10, 1),
(62, 14.00, 0.00, 'Compra', '2023-05-25', 'S-C', '2023-05-25 14:53:42', 4, 1),
(63, 10.00, 0.00, 'Compra', '2023-07-03', 'S-C', '2023-07-03 14:11:49', 10, 1),
(64, 5.00, 0.00, 'Compra', '2023-07-17', 'S-C', '2023-07-17 14:25:07', 10, 1),
(65, 10.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 14:56:47', 19, 1),
(66, 5.00, 0.00, 'Compra', '2023-05-22', 'S-C', '2023-05-22 14:17:19', 19, 1),
(67, 15.00, 0.00, 'Compra', '2023-06-09', 'S-C', '2023-06-09 13:57:36', 4, 1),
(68, 5.00, 0.00, 'Compra', '2023-07-14', 'S-C', '2023-07-14 14:58:20', 4, 1),
(69, 10.00, 0.00, 'Compra', '2023-06-05', 'S-C', '2023-06-05 14:28:47', 19, 1),
(70, 10.00, 0.00, 'Compra', '2023-07-07', 'S-C', '2023-07-07 14:39:45', 19, 1),
(71, 5.00, 0.00, 'Compra', '2023-07-17', 'S-C', '2023-07-17 14:00:09', 19, 1),
(72, 5.00, 0.00, 'Compra', '2023-07-24', 'S-C', '2023-07-24 14:00:14', 4, 1),
(73, 5.00, 0.00, 'Compra', '2023-08-14', 'S-C', '2023-08-14 14:00:32', 4, 1),
(74, 5.00, 0.00, 'Compra', '2023-08-01', 'S-C', '2023-08-01 14:11:29', 19, 1),
(75, 8.00, 0.00, 'Compra', '2023-05-02', 'S-C', '2023-05-02 13:02:11', 8, 1),
(76, 10.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 14:06:07', 14, 1),
(77, 9.00, 0.00, 'Compra', '2023-05-19', 'S-C', '2023-05-19 14:06:44', 8, 1),
(78, 5.00, 0.00, 'Compra', '2023-05-23', 'S-C', '2023-05-23 14:17:01', 14, 1),
(79, 6.00, 0.00, 'Compra', '2023-06-04', 'S-C', '2023-06-05 14:07:25', 8, 1),
(80, 5.00, 0.00, 'Compra', '2023-06-20', 'S-C', '2023-06-20 14:08:37', 8, 1),
(81, 10.00, 0.00, 'Compra', '2023-06-05', 'S-C', '2023-06-05 14:09:04', 14, 1),
(82, 5.00, 0.00, 'Compra', '2023-07-06', 'S-C', '2023-07-06 14:49:29', 14, 1),
(83, 5.00, 0.00, 'Compra', '2023-07-21', 'S-C', '2023-07-21 14:10:11', 14, 1),
(84, 10.00, 0.00, 'Compra', '2023-08-17', 'S-C', '2023-08-17 14:12:14', 13, 1),
(85, 10.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 14:16:11', 3, 1),
(86, 5.00, 0.00, 'Compra', '2023-07-14', 'S-C', '2023-07-14 14:16:57', 8, 1),
(87, 5.00, 0.00, 'Compra', '2023-05-23', 'S-C', '2023-05-23 14:18:04', 3, 1),
(88, 10.00, 0.00, 'Compra', '2023-06-05', 'S-C', '2023-06-05 14:29:27', 3, 1),
(89, 5.00, 0.00, 'Compra', '2023-07-06', 'S-C', '2023-07-06 14:40:26', 3, 1),
(90, 5.00, 0.00, 'Compra', '2023-07-21', 'S-C', '2023-07-21 14:21:00', 3, 1),
(91, 10.00, 0.00, 'Compra', '2023-08-07', 'S-C', '2023-08-07 14:51:17', 3, 1),
(92, 1.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 14:22:20', 9, 1),
(93, 2.00, 0.00, 'Compra', '2023-05-22', 'S-C', '2023-05-22 14:42:45', 9, 1),
(94, 1.00, 0.00, 'Compra', '2023-06-05', 'S-C', '2023-06-05 14:23:07', 9, 1),
(95, 2.00, 0.00, 'Compra', '2023-07-05', 'S-C', '2023-07-05 14:33:31', 9, 1),
(96, 1.00, 0.00, 'Compra', '2023-07-21', 'S-C', '2023-07-21 14:14:52', 9, 1),
(97, 1.00, 0.00, 'Compra', '2023-08-07', 'S-C', '2023-08-07 14:25:45', 9, 1),
(98, 10.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 14:26:41', 7, 1),
(99, 5.00, 0.00, 'Compra', '2023-05-22', 'S-C', '2023-05-22 14:07:57', 7, 1),
(100, 10.00, 0.00, 'Compra', '2023-06-05', 'S-C', '2023-06-05 14:28:47', 3, 1),
(101, 5.00, 0.00, 'Compra', '2023-07-03', 'S-C', '2023-07-03 14:29:15', 7, 1),
(102, 5.00, 0.00, 'Compra', '2023-07-21', 'S-C', '2023-07-21 14:15:45', 7, 1),
(103, 8.00, 0.00, 'Compra', '2023-08-16', 'S-C', '2023-08-16 14:30:10', 8, 1),
(104, 10.00, 0.00, 'Compra', '2023-08-07', 'S-C', '2023-08-07 14:30:36', 7, 1),
(105, 2000.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 14:00:08', 6, 1),
(106, 1000.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 14:02:33', 18, 1),
(107, 2000.00, 0.00, 'Compra', '2023-06-02', 'S-C', '2023-06-02 14:10:41', 6, 1),
(108, 1000.00, 0.00, 'Compra', '2023-06-02', 'S-C', '2023-06-02 14:21:06', 18, 1),
(109, 1000.00, 0.00, 'Compra', '2023-06-21', 'S-C', '2023-06-21 14:31:24', 18, 1),
(110, 2000.00, 0.00, 'Compra', '2023-07-03', 'S-C', '2023-07-03 14:21:39', 6, 1),
(111, 1000.00, 0.00, 'Compra', '2023-07-03', 'S-C', '2023-07-03 14:01:42', 18, 1),
(112, 2000.00, 0.00, 'Compra', '2023-08-01', 'S-C', '2023-08-01 14:42:01', 6, 1),
(113, 1000.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 14:02:44', 5, 1),
(114, 1500.00, 0.00, 'Compra', '2023-08-02', 'S-C', '2023-08-02 14:13:01', 18, 1),
(115, 100.00, 0.00, 'Compra', '2023-05-01', 'S-C', '2023-05-01 14:01:39', 20, 1),
(116, 1000.00, 0.00, 'Compra', '2023-06-01', 'S-C', '2023-06-01 14:14:33', 5, 1),
(117, 1000.00, 0.00, 'Compra', '2023-07-03', 'S-C', '2023-07-03 14:35:54', 5, 1),
(118, 1000.00, 0.00, 'Compra', '2023-08-01', 'S-C', '2023-08-01 14:26:11', 5, 1),
(119, 150.00, 0.00, 'Compra', '2023-06-06', 'S-C', '2023-06-06 14:16:36', 20, 1),
(120, 100.00, 0.00, 'Compra', '2023-07-13', 'S-C', '2023-07-13 14:27:05', 20, 1),
(121, 150.00, 0.00, 'Compra', '2023-08-01', 'S-C', '2023-08-01 14:37:20', 20, 1),
(123, 0.00, 0.60, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00001', '2023-06-19 13:16:51', 4, 2),
(126, 0.00, 0.50, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00001', '2023-06-19 13:16:51', 2, 2),
(128, 0.00, 2.40, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00001', '2023-06-19 13:16:51', 1, 2),
(129, 0.00, 0.50, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00001', '2023-06-19 13:16:51', 3, 2),
(130, 0.00, 0.20, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00001', '2023-06-19 13:16:51', 8, 2),
(131, 0.00, 80.00, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00001', '2023-06-19 13:16:51', 6, 2),
(132, 0.00, 80.00, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00001', '2023-06-19 13:16:51', 18, 2),
(133, 0.00, 80.00, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00001', '2023-06-19 13:16:51', 5, 2),
(134, 0.00, 1.00, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00001', '2023-06-19 13:16:51', 20, 2),
(135, 0.00, 0.60, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00002', '2023-06-20 13:20:52', 4, 2),
(136, 0.00, 0.50, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00002', '2023-06-20 13:20:52', 2, 2),
(137, 0.00, 2.40, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00002', '2023-06-20 13:20:52', 1, 2),
(138, 0.00, 0.50, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00002', '2023-06-20 13:20:52', 3, 2),
(139, 0.00, 0.20, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00002', '2023-06-20 13:20:52', 8, 2),
(140, 0.00, 80.00, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00002', '2023-06-20 13:20:52', 6, 2),
(141, 0.00, 80.00, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00002', '2023-06-20 13:20:52', 18, 2),
(142, 0.00, 80.00, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00002', '2023-06-20 13:20:52', 5, 2),
(143, 0.00, 1.00, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00002', '2023-06-20 13:20:52', 20, 2),
(152, 0.00, 2.40, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00003', '2023-06-21 15:12:21', 1, 2),
(158, 0.00, 1.00, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00003', '2023-06-21 15:12:21', 20, 2),
(165, 0.00, 0.30, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00003', '2023-06-21 15:12:21', 19, 2),
(166, 0.00, 0.80, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00003', '2023-06-21 15:12:21', 3, 2),
(167, 0.00, 0.30, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00003', '2023-06-21 15:12:21', 8, 2),
(168, 0.00, 0.55, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00003', '2023-06-21 15:12:21', 2, 2),
(169, 0.00, 20.00, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00003', '2023-06-21 15:12:21', 5, 2),
(170, 0.00, 20.00, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00003', '2023-06-21 15:12:21', 6, 2),
(171, 0.00, 20.00, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00003', '2023-06-21 15:12:21', 18, 2),
(172, 0.00, 2.40, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00004', '2023-06-22 14:26:23', 1, 2),
(173, 0.00, 1.00, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00004', '2023-06-22 14:26:23', 20, 2),
(174, 0.00, 0.30, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00004', '2023-06-22 14:26:23', 19, 2),
(175, 0.00, 0.80, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00004', '2023-06-22 14:26:23', 3, 2),
(176, 0.00, 0.30, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00004', '2023-06-22 14:26:23', 8, 2),
(177, 0.00, 0.55, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00004', '2023-06-22 14:26:23', 2, 2),
(178, 0.00, 20.00, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00004', '2023-06-22 14:26:23', 5, 2),
(179, 0.00, 20.00, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00004', '2023-06-22 14:26:23', 6, 2),
(180, 0.00, 20.00, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00004', '2023-06-22 14:26:23', 18, 2),
(190, 0.00, 0.50, 'Agregado Receta:', '2023-05-01', 'CHTAZA-100-00001', '2023-05-01 14:45:20', 3, 2),
(191, 0.00, 0.20, 'Agregado Receta:', '2023-05-01', 'CHTAZA-100-00001', '2023-05-01 14:45:20', 8, 2),
(192, 0.00, 80.00, 'Agregado Receta:', '2023-05-01', 'CHTAZA-100-00001', '2023-05-01 14:45:20', 6, 2),
(193, 0.00, 80.00, 'Agregado Receta:', '2023-05-01', 'CHTAZA-100-00001', '2023-05-01 14:45:20', 18, 2),
(194, 0.00, 80.00, 'Agregado Receta:', '2023-05-01', 'CHTAZA-100-00001', '2023-05-01 14:45:20', 5, 2),
(195, 0.00, 1.00, 'Agregado Receta:', '2023-05-01', 'CHTAZA-100-00001', '2023-05-01 14:45:20', 20, 2),
(202, 0.00, 2.80, 'Agregado Receta:', '2023-05-01', 'CHTAZA-100-00001', '2023-05-01 14:45:20', 1, 2),
(203, 0.00, 2.40, 'Agregado Receta:', '2023-05-11', 'CHARANDANOS-70-00001', '2023-05-11 13:21:14', 1, 2),
(204, 0.00, 1.00, 'Agregado Receta:', '2023-05-11', 'CHARANDANOS-70-00001', '2023-05-11 13:21:14', 20, 2),
(205, 0.00, 0.30, 'Agregado Receta:', '2023-05-11', 'CHARANDANOS-70-00001', '2023-05-11 13:21:14', 19, 2),
(206, 0.00, 0.80, 'Agregado Receta:', '2023-05-11', 'CHARANDANOS-70-00001', '2023-05-11 13:21:14', 3, 2),
(207, 0.00, 0.30, 'Agregado Receta:', '2023-05-11', 'CHARANDANOS-70-00001', '2023-05-11 13:21:14', 8, 2),
(209, 0.00, 20.00, 'Agregado Receta:', '2023-05-11', 'CHARANDANOS-70-00001', '2023-05-11 13:21:14', 5, 2),
(210, 0.00, 20.00, 'Agregado Receta:', '2023-05-11', 'CHARANDANOS-70-00001', '2023-05-11 13:21:14', 6, 2),
(211, 0.00, 20.00, 'Agregado Receta:', '2023-05-11', 'CHARANDANOS-70-00001', '2023-05-11 13:21:14', 18, 2),
(218, 0.00, 0.55, 'Agregado Receta:', '2023-05-11', 'CHARANDANOS-70-00001', '2023-05-11 13:21:14', 14, 2),
(219, 0.00, 2.40, 'Agregado Receta:', '2023-05-12', 'CHARANDANOS-70-00002', '2023-05-12 13:23:34', 1, 2),
(220, 0.00, 1.00, 'Agregado Receta:', '2023-05-12', 'CHARANDANOS-70-00002', '2023-05-12 13:23:34', 20, 2),
(221, 0.00, 0.30, 'Agregado Receta:', '2023-05-12', 'CHARANDANOS-70-00002', '2023-05-12 13:23:34', 19, 2),
(222, 0.00, 0.80, 'Agregado Receta:', '2023-05-12', 'CHARANDANOS-70-00002', '2023-05-12 13:23:34', 3, 2),
(223, 0.00, 0.30, 'Agregado Receta:', '2023-05-12', 'CHARANDANOS-70-00002', '2023-05-12 13:23:34', 8, 2),
(224, 0.00, 20.00, 'Agregado Receta:', '2023-05-12', 'CHARANDANOS-70-00002', '2023-05-12 13:23:34', 5, 2),
(225, 0.00, 20.00, 'Agregado Receta:', '2023-05-12', 'CHARANDANOS-70-00002', '2023-05-12 13:23:34', 6, 2),
(226, 0.00, 20.00, 'Agregado Receta:', '2023-05-12', 'CHARANDANOS-70-00002', '2023-05-12 13:23:34', 18, 2),
(227, 0.00, 0.55, 'Agregado Receta:', '2023-05-12', 'CHARANDANOS-70-00002', '2023-05-12 13:23:34', 14, 2),
(234, 15.00, 0.00, 'Compra', '2023-05-04', 'S-C', '2023-05-04 14:59:42', 1, 1),
(235, 0.00, 0.50, 'Agregado Receta:', '2023-05-02', 'CHTAZA-100-00002', '2023-05-02 14:06:30', 3, 2),
(236, 0.00, 0.20, 'Agregado Receta:', '2023-05-02', 'CHTAZA-100-00002', '2023-05-02 14:06:30', 8, 2),
(237, 0.00, 80.00, 'Agregado Receta:', '2023-05-02', 'CHTAZA-100-00002', '2023-05-02 14:06:30', 6, 2),
(238, 0.00, 80.00, 'Agregado Receta:', '2023-05-02', 'CHTAZA-100-00002', '2023-05-02 14:06:30', 18, 2),
(239, 0.00, 80.00, 'Agregado Receta:', '2023-05-02', 'CHTAZA-100-00002', '2023-05-02 14:06:30', 5, 2),
(240, 0.00, 1.00, 'Agregado Receta:', '2023-05-02', 'CHTAZA-100-00002', '2023-05-02 14:06:30', 20, 2),
(241, 0.00, 2.80, 'Agregado Receta:', '2023-05-02', 'CHTAZA-100-00002', '2023-05-02 14:06:30', 1, 2),
(242, 0.00, 0.50, 'Agregado Receta:', '2023-05-03', 'CHTAZA-100-00003', '2023-05-03 13:50:40', 3, 2),
(243, 0.00, 0.20, 'Agregado Receta:', '2023-05-03', 'CHTAZA-100-00003', '2023-05-03 13:50:40', 8, 2),
(244, 0.00, 80.00, 'Agregado Receta:', '2023-05-03', 'CHTAZA-100-00003', '2023-05-03 13:50:40', 6, 2),
(245, 0.00, 80.00, 'Agregado Receta:', '2023-05-03', 'CHTAZA-100-00003', '2023-05-03 13:50:40', 18, 2),
(246, 0.00, 80.00, 'Agregado Receta:', '2023-05-03', 'CHTAZA-100-00003', '2023-05-03 13:50:40', 5, 2),
(247, 0.00, 1.00, 'Agregado Receta:', '2023-05-03', 'CHTAZA-100-00003', '2023-05-03 13:50:40', 20, 2),
(248, 0.00, 2.80, 'Agregado Receta:', '2023-05-03', 'CHTAZA-100-00003', '2023-05-03 13:50:40', 1, 2),
(249, 0.00, 2.40, 'Agregado Receta:', '2023-05-22', 'CHAGUAYMANT-99-00001', '2023-05-22 14:53:54', 1, 2),
(250, 0.00, 1.00, 'Agregado Receta:', '2023-05-22', 'CHAGUAYMANT-99-00001', '2023-05-22 14:53:54', 20, 2),
(251, 0.00, 0.30, 'Agregado Receta:', '2023-05-22', 'CHAGUAYMANT-99-00001', '2023-05-22 14:53:54', 19, 2),
(252, 0.00, 0.80, 'Agregado Receta:', '2023-05-22', 'CHAGUAYMANT-99-00001', '2023-05-22 14:53:54', 3, 2),
(253, 0.00, 0.30, 'Agregado Receta:', '2023-05-22', 'CHAGUAYMANT-99-00001', '2023-05-22 14:53:54', 8, 2),
(254, 0.00, 20.00, 'Agregado Receta:', '2023-05-22', 'CHAGUAYMANT-99-00001', '2023-05-22 14:53:54', 5, 2),
(255, 0.00, 20.00, 'Agregado Receta:', '2023-05-22', 'CHAGUAYMANT-99-00001', '2023-05-22 14:53:54', 6, 2),
(256, 0.00, 20.00, 'Agregado Receta:', '2023-05-22', 'CHAGUAYMANT-99-00001', '2023-05-22 14:53:54', 18, 2),
(264, 0.00, 0.50, 'Agregado Receta:', '2023-05-04', 'CHTAZA-100-00004', '2023-05-04 14:50:20', 3, 2),
(265, 0.00, 0.20, 'Agregado Receta:', '2023-05-04', 'CHTAZA-100-00004', '2023-05-04 14:50:20', 8, 2),
(266, 0.00, 80.00, 'Agregado Receta:', '2023-05-04', 'CHTAZA-100-00004', '2023-05-04 14:50:20', 6, 2),
(267, 0.00, 80.00, 'Agregado Receta:', '2023-05-04', 'CHTAZA-100-00004', '2023-05-04 14:50:20', 18, 2),
(268, 0.00, 80.00, 'Agregado Receta:', '2023-05-04', 'CHTAZA-100-00004', '2023-05-04 14:50:20', 5, 2),
(269, 0.00, 1.00, 'Agregado Receta:', '2023-05-04', 'CHTAZA-100-00004', '2023-05-04 14:50:20', 20, 2),
(270, 0.00, 2.80, 'Agregado Receta:', '2023-05-04', 'CHTAZA-100-00004', '2023-05-04 14:50:20', 1, 2),
(271, 0.00, 0.50, 'Agregado Receta:', '2023-05-05', 'CHTAZA-100-00005', '2023-05-05 14:52:24', 3, 2),
(272, 0.00, 0.20, 'Agregado Receta:', '2023-05-05', 'CHTAZA-100-00005', '2023-05-05 14:52:24', 8, 2),
(273, 0.00, 80.00, 'Agregado Receta:', '2023-05-05', 'CHTAZA-100-00005', '2023-05-05 14:52:24', 6, 2),
(274, 0.00, 80.00, 'Agregado Receta:', '2023-05-05', 'CHTAZA-100-00005', '2023-05-05 14:52:24', 18, 2),
(275, 0.00, 80.00, 'Agregado Receta:', '2023-05-05', 'CHTAZA-100-00005', '2023-05-05 14:52:24', 5, 2),
(276, 0.00, 1.00, 'Agregado Receta:', '2023-05-05', 'CHTAZA-100-00005', '2023-05-05 14:52:24', 20, 2),
(277, 0.00, 2.80, 'Agregado Receta:', '2023-05-05', 'CHTAZA-100-00005', '2023-05-05 14:52:24', 1, 2),
(278, 0.00, 2.40, 'Agregado Receta:', '2023-05-18', 'CHKIWICHA-70-00001', '2023-05-18 14:33:55', 1, 2),
(279, 0.00, 1.00, 'Agregado Receta:', '2023-05-18', 'CHKIWICHA-70-00001', '2023-05-18 14:33:55', 20, 2),
(280, 0.00, 0.30, 'Agregado Receta:', '2023-05-18', 'CHKIWICHA-70-00001', '2023-05-18 14:33:55', 19, 2),
(281, 0.00, 0.80, 'Agregado Receta:', '2023-05-18', 'CHKIWICHA-70-00001', '2023-05-18 14:33:55', 3, 2),
(282, 0.00, 0.30, 'Agregado Receta:', '2023-05-18', 'CHKIWICHA-70-00001', '2023-05-18 14:33:55', 8, 2),
(283, 0.00, 20.00, 'Agregado Receta:', '2023-05-18', 'CHKIWICHA-70-00001', '2023-05-18 14:33:55', 5, 2),
(284, 0.00, 20.00, 'Agregado Receta:', '2023-05-18', 'CHKIWICHA-70-00001', '2023-05-18 14:33:55', 6, 2),
(285, 0.00, 20.00, 'Agregado Receta:', '2023-05-18', 'CHKIWICHA-70-00001', '2023-05-18 14:33:55', 18, 2),
(293, 0.00, 0.55, 'Agregado Receta:', '2023-05-18', 'CHKIWICHA-70-00001', '2023-05-18 14:33:55', 16, 2),
(294, 0.00, 2.40, 'Agregado Receta:', '2023-05-19', 'CHKIWICHA-70-00002', '2023-05-19 13:43:54', 1, 2),
(295, 0.00, 1.00, 'Agregado Receta:', '2023-05-19', 'CHKIWICHA-70-00002', '2023-05-19 13:43:54', 20, 2),
(296, 0.00, 0.30, 'Agregado Receta:', '2023-05-19', 'CHKIWICHA-70-00002', '2023-05-19 13:43:54', 19, 2),
(297, 0.00, 0.80, 'Agregado Receta:', '2023-05-19', 'CHKIWICHA-70-00002', '2023-05-19 13:43:54', 3, 2),
(298, 0.00, 0.30, 'Agregado Receta:', '2023-05-19', 'CHKIWICHA-70-00002', '2023-05-19 13:43:54', 8, 2),
(299, 0.00, 20.00, 'Agregado Receta:', '2023-05-19', 'CHKIWICHA-70-00002', '2023-05-19 13:43:54', 5, 2),
(300, 0.00, 20.00, 'Agregado Receta:', '2023-05-19', 'CHKIWICHA-70-00002', '2023-05-19 13:43:54', 6, 2),
(301, 0.00, 20.00, 'Agregado Receta:', '2023-05-19', 'CHKIWICHA-70-00002', '2023-05-19 13:43:54', 18, 2),
(302, 0.00, 0.55, 'Agregado Receta:', '2023-05-19', 'CHKIWICHA-70-00002', '2023-05-19 13:43:54', 16, 2),
(309, 0.00, 2.40, 'Agregado Receta:', '2023-05-26', 'CHARANDANOS-99-00001', '2023-05-26 13:36:24', 1, 2),
(310, 0.00, 1.00, 'Agregado Receta:', '2023-05-26', 'CHARANDANOS-99-00001', '2023-05-26 13:36:24', 20, 2),
(311, 0.00, 0.30, 'Agregado Receta:', '2023-05-26', 'CHARANDANOS-99-00001', '2023-05-26 13:36:24', 19, 2),
(312, 0.00, 0.80, 'Agregado Receta:', '2023-05-26', 'CHARANDANOS-99-00001', '2023-05-26 13:36:24', 3, 2),
(313, 0.00, 0.30, 'Agregado Receta:', '2023-05-26', 'CHARANDANOS-99-00001', '2023-05-26 13:36:24', 8, 2),
(314, 0.00, 20.00, 'Agregado Receta:', '2023-05-26', 'CHARANDANOS-99-00001', '2023-05-26 13:36:24', 5, 2),
(315, 0.00, 20.00, 'Agregado Receta:', '2023-05-26', 'CHARANDANOS-99-00001', '2023-05-26 13:36:24', 6, 2),
(316, 0.00, 20.00, 'Agregado Receta:', '2023-05-26', 'CHARANDANOS-99-00001', '2023-05-26 13:36:24', 18, 2),
(317, 0.00, 0.55, 'Agregado Receta:', '2023-05-26', 'CHARANDANOS-99-00001', '2023-05-26 13:36:24', 14, 2),
(324, 0.00, 0.55, 'Agregado Receta:', '2023-05-22', 'CHAGUAYMANT-99-00001', '2023-05-22 14:53:54', 13, 2),
(325, 0.00, 2.40, 'Agregado Receta:', '2023-05-29', 'CHARANDANOS-99-00002', '2023-05-29 13:31:34', 1, 2),
(326, 0.00, 1.00, 'Agregado Receta:', '2023-05-29', 'CHARANDANOS-99-00002', '2023-05-29 13:31:34', 20, 2),
(327, 0.00, 0.30, 'Agregado Receta:', '2023-05-29', 'CHARANDANOS-99-00002', '2023-05-29 13:31:34', 19, 2),
(328, 0.00, 0.80, 'Agregado Receta:', '2023-05-29', 'CHARANDANOS-99-00002', '2023-05-29 13:31:34', 3, 2),
(329, 0.00, 0.30, 'Agregado Receta:', '2023-05-29', 'CHARANDANOS-99-00002', '2023-05-29 13:31:34', 8, 2),
(330, 0.00, 20.00, 'Agregado Receta:', '2023-05-29', 'CHARANDANOS-99-00002', '2023-05-29 13:31:34', 5, 2),
(331, 0.00, 20.00, 'Agregado Receta:', '2023-05-29', 'CHARANDANOS-99-00002', '2023-05-29 13:31:34', 6, 2),
(332, 0.00, 20.00, 'Agregado Receta:', '2023-05-29', 'CHARANDANOS-99-00002', '2023-05-29 13:31:34', 18, 2),
(333, 0.00, 0.55, 'Agregado Receta:', '2023-05-29', 'CHARANDANOS-99-00002', '2023-05-29 13:31:34', 14, 2),
(340, 0.00, 2.40, 'Agregado Receta:', '2023-05-23', 'CHAGUAYMANT-99-00002', '2023-05-23 14:13:34', 1, 2),
(341, 0.00, 1.00, 'Agregado Receta:', '2023-05-23', 'CHAGUAYMANT-99-00002', '2023-05-23 14:13:34', 20, 2),
(342, 0.00, 0.30, 'Agregado Receta:', '2023-05-23', 'CHAGUAYMANT-99-00002', '2023-05-23 14:13:34', 19, 2),
(343, 0.00, 0.80, 'Agregado Receta:', '2023-05-23', 'CHAGUAYMANT-99-00002', '2023-05-23 14:13:34', 3, 2),
(344, 0.00, 0.30, 'Agregado Receta:', '2023-05-23', 'CHAGUAYMANT-99-00002', '2023-05-23 14:13:34', 8, 2),
(345, 0.00, 20.00, 'Agregado Receta:', '2023-05-23', 'CHAGUAYMANT-99-00002', '2023-05-23 14:13:34', 5, 2),
(346, 0.00, 20.00, 'Agregado Receta:', '2023-05-23', 'CHAGUAYMANT-99-00002', '2023-05-23 14:13:34', 6, 2),
(347, 0.00, 20.00, 'Agregado Receta:', '2023-05-23', 'CHAGUAYMANT-99-00002', '2023-05-23 14:13:34', 18, 2),
(348, 0.00, 0.55, 'Agregado Receta:', '2023-05-23', 'CHAGUAYMANT-99-00002', '2023-05-23 14:13:34', 13, 2),
(371, 0.00, 2.40, 'Agregado Receta:', '2023-07-18', 'CHQUINUA-70-00002', '2023-07-18 14:34:37', 1, 2),
(372, 0.00, 1.00, 'Agregado Receta:', '2023-07-18', 'CHQUINUA-70-00002', '2023-07-18 14:34:37', 20, 2),
(373, 0.00, 0.30, 'Agregado Receta:', '2023-07-18', 'CHQUINUA-70-00002', '2023-07-18 14:34:37', 19, 2),
(374, 0.00, 0.80, 'Agregado Receta:', '2023-07-18', 'CHQUINUA-70-00002', '2023-07-18 14:34:37', 3, 2),
(375, 0.00, 0.30, 'Agregado Receta:', '2023-07-18', 'CHQUINUA-70-00002', '2023-07-18 14:34:37', 8, 2),
(376, 0.00, 20.00, 'Agregado Receta:', '2023-07-18', 'CHQUINUA-70-00002', '2023-07-18 14:34:37', 5, 2),
(377, 0.00, 20.00, 'Agregado Receta:', '2023-07-18', 'CHQUINUA-70-00002', '2023-07-18 14:34:37', 6, 2),
(378, 0.00, 20.00, 'Agregado Receta:', '2023-07-18', 'CHQUINUA-70-00002', '2023-07-18 14:34:37', 18, 2),
(379, 0.00, 0.55, 'Agregado Receta:', '2023-07-18', 'CHQUINUA-70-00002', '2023-07-18 14:34:37', 12, 2),
(386, 0.00, 2.40, 'Agregado Receta:', '2023-06-01', 'CHMANGO-70-00001', '2023-06-01 15:12:55', 1, 2),
(388, 0.00, 0.30, 'Agregado Receta:', '2023-06-01', 'CHMANGO-70-00001', '2023-06-01 15:12:55', 19, 2),
(389, 0.00, 0.80, 'Agregado Receta:', '2023-06-01', 'CHMANGO-70-00001', '2023-06-01 15:12:55', 3, 2),
(390, 0.00, 0.30, 'Agregado Receta:', '2023-06-01', 'CHMANGO-70-00001', '2023-06-01 15:12:55', 8, 2),
(401, 0.00, 0.55, 'Agregado Receta:', '2023-06-01', 'CHMANGO-70-00001', '2023-06-01 15:12:55', 17, 2),
(402, 0.00, 40.00, 'Agregado Receta:', '2023-06-01', 'CHMANGO-70-00001', '2023-06-01 15:12:55', 5, 2),
(403, 0.00, 40.00, 'Agregado Receta:', '2023-06-01', 'CHMANGO-70-00001', '2023-06-01 15:12:55', 6, 2),
(404, 0.00, 40.00, 'Agregado Receta:', '2023-06-01', 'CHMANGO-70-00001', '2023-06-01 15:12:55', 18, 2),
(406, 0.00, 2.40, 'Agregado Receta:', '2023-06-02', 'CHMANGO-70-00002', '2023-06-02 14:12:55', 1, 2),
(407, 0.00, 0.30, 'Agregado Receta:', '2023-06-02', 'CHMANGO-70-00002', '2023-06-02 14:12:55', 19, 2),
(408, 0.00, 0.80, 'Agregado Receta:', '2023-06-02', 'CHMANGO-70-00002', '2023-06-02 14:12:55', 3, 2),
(409, 0.00, 0.30, 'Agregado Receta:', '2023-06-02', 'CHMANGO-70-00002', '2023-06-02 14:12:55', 8, 2),
(410, 0.00, 0.55, 'Agregado Receta:', '2023-06-02', 'CHMANGO-70-00002', '2023-06-02 14:12:55', 17, 2),
(411, 0.00, 40.00, 'Agregado Receta:', '2023-06-02', 'CHMANGO-70-00002', '2023-06-02 14:12:55', 5, 2),
(412, 0.00, 40.00, 'Agregado Receta:', '2023-06-02', 'CHMANGO-70-00002', '2023-06-02 14:12:55', 6, 2),
(413, 0.00, 40.00, 'Agregado Receta:', '2023-06-02', 'CHMANGO-70-00002', '2023-06-02 14:12:55', 18, 2),
(421, 0.00, 2.40, 'Agregado Receta:', '2023-06-05', 'CHMANGO-70-00003', '2023-06-05 15:12:55', 1, 2),
(422, 0.00, 0.30, 'Agregado Receta:', '2023-06-05', 'CHMANGO-70-00003', '2023-06-05 15:12:55', 19, 2),
(423, 0.00, 0.80, 'Agregado Receta:', '2023-06-05', 'CHMANGO-70-00003', '2023-06-05 15:12:55', 3, 2),
(424, 0.00, 0.30, 'Agregado Receta:', '2023-06-05', 'CHMANGO-70-00003', '2023-06-05 15:12:55', 8, 2),
(425, 0.00, 0.55, 'Agregado Receta:', '2023-06-05', 'CHMANGO-70-00003', '2023-06-05 15:12:55', 17, 2),
(426, 0.00, 40.00, 'Agregado Receta:', '2023-06-05', 'CHMANGO-70-00003', '2023-06-05 15:12:55', 5, 2),
(427, 0.00, 40.00, 'Agregado Receta:', '2023-06-05', 'CHMANGO-70-00003', '2023-06-05 15:12:55', 6, 2),
(428, 0.00, 40.00, 'Agregado Receta:', '2023-06-05', 'CHMANGO-70-00003', '2023-06-05 15:12:55', 18, 2),
(436, 0.00, 2.40, 'Agregado Receta:', '2023-06-06', 'CHMANGO-70-00004', '2023-06-06 14:12:55', 1, 2),
(437, 0.00, 0.30, 'Agregado Receta:', '2023-06-06', 'CHMANGO-70-00004', '2023-06-06 14:12:55', 19, 2),
(438, 0.00, 0.80, 'Agregado Receta:', '2023-06-06', 'CHMANGO-70-00004', '2023-06-06 14:12:55', 3, 2),
(439, 0.00, 0.30, 'Agregado Receta:', '2023-06-06', 'CHMANGO-70-00004', '2023-06-06 14:12:55', 8, 2),
(440, 0.00, 0.55, 'Agregado Receta:', '2023-06-06', 'CHMANGO-70-00004', '2023-06-06 14:12:55', 17, 2),
(441, 0.00, 40.00, 'Agregado Receta:', '2023-06-06', 'CHMANGO-70-00004', '2023-06-06 14:12:55', 5, 2),
(442, 0.00, 40.00, 'Agregado Receta:', '2023-06-06', 'CHMANGO-70-00004', '2023-06-06 14:12:55', 6, 2),
(443, 0.00, 40.00, 'Agregado Receta:', '2023-06-06', 'CHMANGO-70-00004', '2023-06-06 14:12:55', 18, 2),
(451, 0.00, 2.40, 'Agregado Receta:', '2023-06-07', 'CHCAÑIHUA-70-00001', '2023-06-07 14:13:54', 1, 2),
(452, 0.00, 0.30, 'Agregado Receta:', '2023-06-07', 'CHCAÑIHUA-70-00001', '2023-06-07 14:13:54', 19, 2),
(453, 0.00, 0.80, 'Agregado Receta:', '2023-06-07', 'CHCAÑIHUA-70-00001', '2023-06-07 14:13:54', 3, 2),
(454, 0.00, 0.30, 'Agregado Receta:', '2023-06-07', 'CHCAÑIHUA-70-00001', '2023-06-07 14:13:54', 8, 2),
(456, 0.00, 40.00, 'Agregado Receta:', '2023-06-07', 'CHCAÑIHUA-70-00001', '2023-06-07 14:13:54', 5, 2),
(457, 0.00, 40.00, 'Agregado Receta:', '2023-06-07', 'CHCAÑIHUA-70-00001', '2023-06-07 14:13:54', 6, 2),
(458, 0.00, 40.00, 'Agregado Receta:', '2023-06-07', 'CHCAÑIHUA-70-00001', '2023-06-07 14:13:54', 18, 2),
(466, 0.00, 0.55, 'Agregado Receta:', '2023-06-07', 'CHCAÑIHUA-70-00001', '2023-06-07 14:13:54', 15, 2),
(467, 0.00, 2.40, 'Agregado Receta:', '2023-06-08', 'CHCAÑIHUA-70-00002', '2023-06-08 14:12:54', 1, 2),
(468, 0.00, 0.30, 'Agregado Receta:', '2023-06-08', 'CHCAÑIHUA-70-00002', '2023-06-08 14:12:54', 19, 2),
(469, 0.00, 0.80, 'Agregado Receta:', '2023-06-08', 'CHCAÑIHUA-70-00002', '2023-06-08 14:12:54', 3, 2),
(470, 0.00, 0.30, 'Agregado Receta:', '2023-06-08', 'CHCAÑIHUA-70-00002', '2023-06-08 14:12:54', 8, 2),
(471, 0.00, 40.00, 'Agregado Receta:', '2023-06-08', 'CHCAÑIHUA-70-00002', '2023-06-08 14:12:54', 5, 2),
(472, 0.00, 40.00, 'Agregado Receta:', '2023-06-08', 'CHCAÑIHUA-70-00002', '2023-06-08 14:12:54', 6, 2),
(473, 0.00, 40.00, 'Agregado Receta:', '2023-06-08', 'CHCAÑIHUA-70-00002', '2023-06-08 14:12:54', 18, 2),
(475, 0.00, 0.55, 'Agregado Receta:', '2023-06-08', 'CHCAÑIHUA-70-00002', '2023-06-08 14:12:54', 15, 2),
(482, 0.00, 2.40, 'Agregado Receta:', '2023-06-09', 'CHCAÑIHUA-70-00003', '2023-06-09 14:11:53', 1, 2),
(483, 0.00, 0.30, 'Agregado Receta:', '2023-06-09', 'CHCAÑIHUA-70-00003', '2023-06-09 14:11:53', 19, 2),
(484, 0.00, 0.80, 'Agregado Receta:', '2023-06-09', 'CHCAÑIHUA-70-00003', '2023-06-09 14:11:53', 3, 2),
(485, 0.00, 0.30, 'Agregado Receta:', '2023-06-09', 'CHCAÑIHUA-70-00003', '2023-06-09 14:11:53', 8, 2),
(486, 0.00, 40.00, 'Agregado Receta:', '2023-06-09', 'CHCAÑIHUA-70-00003', '2023-06-09 14:11:53', 5, 2),
(487, 0.00, 40.00, 'Agregado Receta:', '2023-06-09', 'CHCAÑIHUA-70-00003', '2023-06-09 14:11:53', 6, 2),
(488, 0.00, 40.00, 'Agregado Receta:', '2023-06-09', 'CHCAÑIHUA-70-00003', '2023-06-09 14:11:53', 18, 2),
(490, 0.00, 0.55, 'Agregado Receta:', '2023-06-09', 'CHCAÑIHUA-70-00003', '2023-06-09 14:11:53', 15, 2),
(497, 0.00, 2.40, 'Agregado Receta:', '2023-06-12', 'CHCAÑIHUA-70-00004', '2023-06-12 14:16:51', 1, 2),
(498, 0.00, 0.30, 'Agregado Receta:', '2023-06-12', 'CHCAÑIHUA-70-00004', '2023-06-12 14:16:51', 19, 2),
(499, 0.00, 0.80, 'Agregado Receta:', '2023-06-12', 'CHCAÑIHUA-70-00004', '2023-06-12 14:16:51', 3, 2),
(500, 0.00, 0.30, 'Agregado Receta:', '2023-06-12', 'CHCAÑIHUA-70-00004', '2023-06-12 14:16:51', 8, 2),
(501, 0.00, 40.00, 'Agregado Receta:', '2023-06-12', 'CHCAÑIHUA-70-00004', '2023-06-12 14:16:51', 5, 2),
(502, 0.00, 40.00, 'Agregado Receta:', '2023-06-12', 'CHCAÑIHUA-70-00004', '2023-06-12 14:16:51', 6, 2),
(503, 0.00, 40.00, 'Agregado Receta:', '2023-06-12', 'CHCAÑIHUA-70-00004', '2023-06-12 14:16:51', 18, 2),
(505, 0.00, 0.55, 'Agregado Receta:', '2023-06-12', 'CHCAÑIHUA-70-00004', '2023-06-12 14:16:51', 15, 2),
(512, 0.00, 2.40, 'Agregado Receta:', '2023-06-13', 'CHAGUAYMANT-70-00001', '2023-06-13 14:19:52', 1, 2),
(513, 0.00, 0.30, 'Agregado Receta:', '2023-06-13', 'CHAGUAYMANT-70-00001', '2023-06-13 14:19:52', 19, 2),
(514, 0.00, 0.80, 'Agregado Receta:', '2023-06-13', 'CHAGUAYMANT-70-00001', '2023-06-13 14:19:52', 3, 2),
(515, 0.00, 0.30, 'Agregado Receta:', '2023-06-13', 'CHAGUAYMANT-70-00001', '2023-06-13 14:19:52', 8, 2),
(516, 0.00, 40.00, 'Agregado Receta:', '2023-06-13', 'CHAGUAYMANT-70-00001', '2023-06-13 14:19:52', 5, 2),
(517, 0.00, 40.00, 'Agregado Receta:', '2023-06-13', 'CHAGUAYMANT-70-00001', '2023-06-13 14:19:52', 6, 2),
(518, 0.00, 40.00, 'Agregado Receta:', '2023-06-13', 'CHAGUAYMANT-70-00001', '2023-06-13 14:19:52', 18, 2),
(527, 0.00, 0.55, 'Agregado Receta:', '2023-06-13', 'CHAGUAYMANT-70-00001', '2023-06-13 14:19:52', 13, 2),
(528, 0.00, 2.40, 'Agregado Receta:', '2023-06-14', 'CHAGUAYMANT-70-00002', '2023-06-14 14:20:55', 1, 2),
(529, 0.00, 0.30, 'Agregado Receta:', '2023-06-14', 'CHAGUAYMANT-70-00002', '2023-06-14 14:20:55', 19, 2),
(530, 0.00, 0.80, 'Agregado Receta:', '2023-06-14', 'CHAGUAYMANT-70-00002', '2023-06-14 14:20:55', 3, 2),
(531, 0.00, 0.30, 'Agregado Receta:', '2023-06-14', 'CHAGUAYMANT-70-00002', '2023-06-14 14:20:55', 8, 2),
(532, 0.00, 40.00, 'Agregado Receta:', '2023-06-14', 'CHAGUAYMANT-70-00002', '2023-06-14 14:20:55', 5, 2),
(533, 0.00, 40.00, 'Agregado Receta:', '2023-06-14', 'CHAGUAYMANT-70-00002', '2023-06-14 14:20:55', 6, 2),
(534, 0.00, 40.00, 'Agregado Receta:', '2023-06-14', 'CHAGUAYMANT-70-00002', '2023-06-14 14:20:55', 18, 2),
(536, 0.00, 0.55, 'Agregado Receta:', '2023-06-14', 'CHAGUAYMANT-70-00002', '2023-06-14 14:20:55', 13, 2),
(543, 0.00, 2.40, 'Agregado Receta:', '2023-06-15', 'CHAGUAYMANT-70-00003', '2023-06-15 13:15:55', 1, 2),
(544, 0.00, 0.30, 'Agregado Receta:', '2023-06-15', 'CHAGUAYMANT-70-00003', '2023-06-15 13:15:55', 19, 2),
(545, 0.00, 0.80, 'Agregado Receta:', '2023-06-15', 'CHAGUAYMANT-70-00003', '2023-06-15 13:15:55', 3, 2),
(546, 0.00, 0.30, 'Agregado Receta:', '2023-06-15', 'CHAGUAYMANT-70-00003', '2023-06-15 13:15:55', 8, 2),
(547, 0.00, 40.00, 'Agregado Receta:', '2023-06-15', 'CHAGUAYMANT-70-00003', '2023-06-15 13:15:55', 5, 2),
(548, 0.00, 40.00, 'Agregado Receta:', '2023-06-15', 'CHAGUAYMANT-70-00003', '2023-06-15 13:15:55', 6, 2),
(549, 0.00, 40.00, 'Agregado Receta:', '2023-06-15', 'CHAGUAYMANT-70-00003', '2023-06-15 13:15:55', 18, 2),
(551, 0.00, 0.55, 'Agregado Receta:', '2023-06-15', 'CHAGUAYMANT-70-00003', '2023-06-15 13:15:55', 13, 2),
(558, 0.00, 2.40, 'Agregado Receta:', '2023-06-16', 'CHAGUAYMANT-70-00004', '2023-06-16 13:10:53', 1, 2),
(559, 0.00, 0.30, 'Agregado Receta:', '2023-06-16', 'CHAGUAYMANT-70-00004', '2023-06-16 13:10:53', 19, 2),
(560, 0.00, 0.80, 'Agregado Receta:', '2023-06-16', 'CHAGUAYMANT-70-00004', '2023-06-16 13:10:53', 3, 2),
(561, 0.00, 0.30, 'Agregado Receta:', '2023-06-16', 'CHAGUAYMANT-70-00004', '2023-06-16 13:10:53', 8, 2),
(562, 0.00, 40.00, 'Agregado Receta:', '2023-06-16', 'CHAGUAYMANT-70-00004', '2023-06-16 13:10:53', 5, 2),
(563, 0.00, 40.00, 'Agregado Receta:', '2023-06-16', 'CHAGUAYMANT-70-00004', '2023-06-16 13:10:53', 6, 2),
(564, 0.00, 40.00, 'Agregado Receta:', '2023-06-16', 'CHAGUAYMANT-70-00004', '2023-06-16 13:10:53', 18, 2),
(566, 0.00, 0.55, 'Agregado Receta:', '2023-06-16', 'CHAGUAYMANT-70-00004', '2023-06-16 13:10:53', 13, 2),
(573, 0.00, 2.40, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00005', '2023-06-19 13:06:34', 1, 2),
(574, 0.00, 0.30, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00005', '2023-06-19 13:06:34', 19, 2),
(575, 0.00, 0.80, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00005', '2023-06-19 13:06:34', 3, 2),
(576, 0.00, 0.30, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00005', '2023-06-19 13:06:34', 8, 2),
(577, 0.00, 40.00, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00005', '2023-06-19 13:06:34', 5, 2),
(578, 0.00, 40.00, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00005', '2023-06-19 13:06:34', 6, 2),
(579, 0.00, 40.00, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00005', '2023-06-19 13:06:34', 18, 2),
(588, 0.00, 0.55, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00005', '2023-06-19 13:06:34', 2, 2),
(589, 0.00, 2.40, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00006', '2023-06-20 13:46:14', 1, 2),
(590, 0.00, 0.30, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00006', '2023-06-20 13:46:14', 19, 2),
(591, 0.00, 0.80, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00006', '2023-06-20 13:46:14', 3, 2),
(592, 0.00, 0.30, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00006', '2023-06-20 13:46:14', 8, 2),
(593, 0.00, 40.00, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00006', '2023-06-20 13:46:14', 5, 2),
(594, 0.00, 40.00, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00006', '2023-06-20 13:46:14', 6, 2),
(595, 0.00, 40.00, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00006', '2023-06-20 13:46:14', 18, 2),
(597, 0.00, 0.55, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00006', '2023-06-20 13:46:14', 2, 2),
(604, 0.00, 2.40, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00007', '2023-06-21 14:36:34', 1, 2),
(605, 0.00, 0.30, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00007', '2023-06-21 14:36:34', 19, 2),
(606, 0.00, 0.80, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00007', '2023-06-21 14:36:34', 3, 2),
(607, 0.00, 0.30, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00007', '2023-06-21 14:36:34', 8, 2),
(608, 0.00, 40.00, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00007', '2023-06-21 14:36:34', 5, 2),
(609, 0.00, 40.00, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00007', '2023-06-21 14:36:34', 6, 2),
(610, 0.00, 40.00, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00007', '2023-06-21 14:36:34', 18, 2),
(612, 0.00, 0.55, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00007', '2023-06-21 14:36:34', 2, 2),
(619, 0.00, 2.40, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00008', '2023-06-22 13:56:54', 1, 2),
(620, 0.00, 0.30, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00008', '2023-06-22 13:56:54', 19, 2),
(621, 0.00, 0.80, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00008', '2023-06-22 13:56:54', 3, 2),
(622, 0.00, 0.30, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00008', '2023-06-22 13:56:54', 8, 2),
(623, 0.00, 40.00, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00008', '2023-06-22 13:56:54', 5, 2),
(624, 0.00, 40.00, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00008', '2023-06-22 13:56:54', 6, 2),
(625, 0.00, 40.00, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00008', '2023-06-22 13:56:54', 18, 2),
(627, 0.00, 0.55, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00008', '2023-06-22 13:56:54', 2, 2),
(635, 0.00, 0.30, 'Agregado Receta:', '2023-06-23', 'CHTAZA-100-00006', '2023-06-23 14:09:22', 19, 2),
(636, 0.00, 0.80, 'Agregado Receta:', '2023-06-23', 'CHTAZA-100-00006', '2023-06-23 14:09:22', 3, 2),
(637, 0.00, 0.30, 'Agregado Receta:', '2023-06-23', 'CHTAZA-100-00006', '2023-06-23 14:09:22', 8, 2),
(638, 0.00, 40.00, 'Agregado Receta:', '2023-06-23', 'CHTAZA-100-00006', '2023-06-23 14:09:22', 5, 2),
(639, 0.00, 40.00, 'Agregado Receta:', '2023-06-23', 'CHTAZA-100-00006', '2023-06-23 14:09:22', 6, 2),
(640, 0.00, 40.00, 'Agregado Receta:', '2023-06-23', 'CHTAZA-100-00006', '2023-06-23 14:09:22', 18, 2),
(649, 0.00, 3.00, 'Agregado Receta:', '2023-06-23', 'CHTAZA-100-00006', '2023-06-23 14:09:22', 1, 2),
(650, 0.00, 0.50, 'Agregado Receta:', '2023-06-26', 'CHTAZA-100-00007', '2023-06-26 14:06:20', 3, 2),
(651, 0.00, 0.20, 'Agregado Receta:', '2023-06-26', 'CHTAZA-100-00007', '2023-06-26 14:06:20', 8, 2),
(656, 0.00, 2.80, 'Agregado Receta:', '2023-06-26', 'CHTAZA-100-00007', '2023-06-26 14:06:20', 1, 2),
(657, 0.00, 40.00, 'Agregado Receta:', '2023-06-26', 'CHTAZA-100-00007', '2023-06-26 14:06:20', 5, 2),
(658, 0.00, 40.00, 'Agregado Receta:', '2023-06-26', 'CHTAZA-100-00007', '2023-06-26 14:06:20', 6, 2),
(659, 0.00, 40.00, 'Agregado Receta:', '2023-06-26', 'CHTAZA-100-00007', '2023-06-26 14:06:20', 18, 2),
(660, 0.00, 1.00, 'Agregado Receta:', '2023-06-26', 'CHTAZA-100-00007', '2023-06-26 14:06:20', 20, 2),
(661, 0.00, 0.50, 'Agregado Receta:', '2023-06-27', 'CHTAZA-100-00008', '2023-06-27 14:43:27', 3, 2),
(662, 0.00, 0.20, 'Agregado Receta:', '2023-06-27', 'CHTAZA-100-00008', '2023-06-27 14:43:27', 8, 2),
(663, 0.00, 2.80, 'Agregado Receta:', '2023-06-27', 'CHTAZA-100-00008', '2023-06-27 14:43:27', 1, 2),
(664, 0.00, 40.00, 'Agregado Receta:', '2023-06-27', 'CHTAZA-100-00008', '2023-06-27 14:43:27', 5, 2),
(665, 0.00, 40.00, 'Agregado Receta:', '2023-06-27', 'CHTAZA-100-00008', '2023-06-27 14:43:27', 6, 2),
(666, 0.00, 40.00, 'Agregado Receta:', '2023-06-27', 'CHTAZA-100-00008', '2023-06-27 14:43:27', 18, 2),
(667, 0.00, 1.00, 'Agregado Receta:', '2023-06-27', 'CHTAZA-100-00008', '2023-06-27 14:43:27', 20, 2),
(668, 0.00, 0.50, 'Agregado Receta:', '2023-06-28', 'CHTAZA-100-00009', '2023-06-28 13:52:23', 3, 2),
(669, 0.00, 0.20, 'Agregado Receta:', '2023-06-28', 'CHTAZA-100-00009', '2023-06-28 13:52:23', 8, 2),
(670, 0.00, 2.80, 'Agregado Receta:', '2023-06-28', 'CHTAZA-100-00009', '2023-06-28 13:52:23', 1, 2),
(671, 0.00, 40.00, 'Agregado Receta:', '2023-06-28', 'CHTAZA-100-00009', '2023-06-28 13:52:23', 5, 2),
(672, 0.00, 40.00, 'Agregado Receta:', '2023-06-28', 'CHTAZA-100-00009', '2023-06-28 13:52:23', 6, 2),
(673, 0.00, 40.00, 'Agregado Receta:', '2023-06-28', 'CHTAZA-100-00009', '2023-06-28 13:52:23', 18, 2),
(674, 0.00, 1.00, 'Agregado Receta:', '2023-06-28', 'CHTAZA-100-00009', '2023-06-28 13:52:23', 20, 2),
(675, 0.00, 0.50, 'Agregado Receta:', '2023-07-04', 'CHNIBS-70-00001', '2023-07-04 14:45:21', 3, 2),
(676, 0.00, 0.20, 'Agregado Receta:', '2023-07-04', 'CHNIBS-70-00001', '2023-07-04 14:45:21', 8, 2),
(678, 0.00, 40.00, 'Agregado Receta:', '2023-07-04', 'CHNIBS-70-00001', '2023-07-04 14:45:21', 5, 2),
(679, 0.00, 40.00, 'Agregado Receta:', '2023-07-04', 'CHNIBS-70-00001', '2023-07-04 14:45:21', 6, 2),
(680, 0.00, 40.00, 'Agregado Receta:', '2023-07-04', 'CHNIBS-70-00001', '2023-07-04 14:45:21', 18, 2),
(681, 0.00, 1.00, 'Agregado Receta:', '2023-07-04', 'CHNIBS-70-00001', '2023-07-04 14:45:21', 20, 2),
(682, 0.00, 3.00, 'Agregado Receta:', '2023-07-04', 'CHNIBS-70-00001', '2023-07-04 14:45:21', 1, 2),
(683, 0.00, 0.50, 'Agregado Receta:', '2023-07-05', 'CHNIBS-70-00002', '2023-07-05 13:23:24', 3, 2),
(684, 0.00, 0.20, 'Agregado Receta:', '2023-07-05', 'CHNIBS-70-00002', '2023-07-05 13:23:24', 8, 2),
(685, 0.00, 40.00, 'Agregado Receta:', '2023-07-05', 'CHNIBS-70-00002', '2023-07-05 13:23:24', 5, 2),
(686, 0.00, 40.00, 'Agregado Receta:', '2023-07-05', 'CHNIBS-70-00002', '2023-07-05 13:23:24', 6, 2),
(687, 0.00, 40.00, 'Agregado Receta:', '2023-07-05', 'CHNIBS-70-00002', '2023-07-05 13:23:24', 18, 2),
(688, 0.00, 1.00, 'Agregado Receta:', '2023-07-05', 'CHNIBS-70-00002', '2023-07-05 13:23:24', 20, 2),
(689, 0.00, 3.00, 'Agregado Receta:', '2023-07-05', 'CHNIBS-70-00002', '2023-07-05 13:23:24', 1, 2),
(690, 0.00, 0.50, 'Agregado Receta:', '2023-07-06', 'CHNIBS-70-00003', '2023-07-06 14:42:22', 3, 2),
(691, 0.00, 0.20, 'Agregado Receta:', '2023-07-06', 'CHNIBS-70-00003', '2023-07-06 14:42:22', 8, 2),
(692, 0.00, 40.00, 'Agregado Receta:', '2023-07-06', 'CHNIBS-70-00003', '2023-07-06 14:42:22', 5, 2),
(693, 0.00, 40.00, 'Agregado Receta:', '2023-07-06', 'CHNIBS-70-00003', '2023-07-06 14:42:22', 6, 2),
(694, 0.00, 40.00, 'Agregado Receta:', '2023-07-06', 'CHNIBS-70-00003', '2023-07-06 14:42:22', 18, 2),
(695, 0.00, 1.00, 'Agregado Receta:', '2023-07-06', 'CHNIBS-70-00003', '2023-07-06 14:42:22', 20, 2),
(696, 0.00, 3.00, 'Agregado Receta:', '2023-07-06', 'CHNIBS-70-00003', '2023-07-06 14:42:22', 1, 2),
(719, 0.00, 3.00, 'Agregado Receta:', '2023-07-10', 'CHPOLVO-100-00001', '2023-07-10 14:45:22', 1, 2),
(720, 0.00, 3.00, 'Agregado Receta:', '2023-07-11', 'CHPOLVO-100-00002', '2023-07-11 14:53:21', 1, 2),
(721, 0.00, 3.00, 'Agregado Receta:', '2023-07-12', 'CHPOLVO-100-00003', '2023-07-12 14:42:25', 1, 2),
(722, 0.00, 3.00, 'Agregado Receta:', '2023-07-13', 'CHPOLVO-100-00004', '2023-07-13 14:56:23', 1, 2),
(724, 0.00, 3.00, 'Agregado Receta:', '2023-07-19', 'CHQUINUA-70-00003', '2023-07-19 14:32:25', 1, 2),
(725, 0.00, 3.00, 'Agregado Receta:', '2023-07-20', 'CHQUINUA-70-00004', '2023-07-20 14:56:55', 1, 2),
(728, 0.00, 2.40, 'Agregado Receta:', '2023-07-17', 'CHQUINUA-70-00001', '2023-07-17 14:13:24', 1, 2),
(729, 0.00, 1.00, 'Agregado Receta:', '2023-07-17', 'CHQUINUA-70-00001', '2023-07-17 14:13:24', 20, 2),
(730, 0.00, 0.30, 'Agregado Receta:', '2023-07-17', 'CHQUINUA-70-00001', '2023-07-17 14:13:24', 19, 2),
(731, 0.00, 0.80, 'Agregado Receta:', '2023-07-17', 'CHQUINUA-70-00001', '2023-07-17 14:13:24', 3, 2),
(732, 0.00, 0.30, 'Agregado Receta:', '2023-07-17', 'CHQUINUA-70-00001', '2023-07-17 14:13:24', 8, 2),
(733, 0.00, 20.00, 'Agregado Receta:', '2023-07-17', 'CHQUINUA-70-00001', '2023-07-17 14:13:24', 5, 2),
(734, 0.00, 20.00, 'Agregado Receta:', '2023-07-17', 'CHQUINUA-70-00001', '2023-07-17 14:13:24', 6, 2),
(735, 0.00, 20.00, 'Agregado Receta:', '2023-07-17', 'CHQUINUA-70-00001', '2023-07-17 14:13:24', 18, 2),
(736, 0.00, 0.55, 'Agregado Receta:', '2023-07-17', 'CHQUINUA-70-00001', '2023-07-17 14:13:24', 12, 2),
(743, 0.00, 3.00, 'Agregado Receta:', '2023-07-21', 'CHAGUAYMANT-99-00003', '2023-07-21 14:52:49', 1, 2),
(744, 0.00, 3.00, 'Agregado Receta:', '2023-07-25', 'CHAGUAYMANT-99-00004', '2023-07-25 14:53:29', 1, 2),
(745, 0.00, 3.00, 'Agregado Receta:', '2023-07-26', 'CHAGUAYMANT-99-00005', '2023-07-26 14:23:53', 1, 2),
(746, 0.00, 3.00, 'Agregado Receta:', '2023-07-27', 'CHAGUAYMANT-99-00006', '2023-07-27 14:42:51', 1, 2),
(748, 0.00, 3.00, 'Agregado Receta:', '2023-08-01', 'CHARANDANOS-70-00003', '2023-08-01 13:45:20', 1, 2),
(751, 0.00, 3.00, 'Agregado Receta:', '2023-05-17', 'CHCASTAÑAS-60-00002', '2023-05-17 14:43:54', 1, 2),
(752, 0.00, 0.60, 'Agregado Receta:', '2023-05-17', 'CHCASTAÑAS-60-00002', '2023-05-17 14:43:54', 4, 2),
(753, 0.00, 0.10, 'Agregado Receta:', '2023-05-17', 'CHCASTAÑAS-60-00002', '2023-05-17 14:43:54', 11, 2),
(754, 0.00, 0.50, 'Agregado Receta:', '2023-07-07', 'CHNIBS-70-00004', '2023-07-07 14:34:26', 3, 2),
(755, 0.00, 0.20, 'Agregado Receta:', '2023-07-07', 'CHNIBS-70-00004', '2023-07-07 14:34:26', 8, 2),
(756, 0.00, 40.00, 'Agregado Receta:', '2023-07-07', 'CHNIBS-70-00004', '2023-07-07 14:34:26', 5, 2),
(757, 0.00, 40.00, 'Agregado Receta:', '2023-07-07', 'CHNIBS-70-00004', '2023-07-07 14:34:26', 6, 2),
(758, 0.00, 40.00, 'Agregado Receta:', '2023-07-07', 'CHNIBS-70-00004', '2023-07-07 14:34:26', 18, 2),
(759, 0.00, 1.00, 'Agregado Receta:', '2023-07-07', 'CHNIBS-70-00004', '2023-07-07 14:34:26', 20, 2),
(760, 0.00, 3.00, 'Agregado Receta:', '2023-07-07', 'CHNIBS-70-00004', '2023-07-07 14:34:26', 1, 2),
(761, 0.00, 3.00, 'Agregado Receta:', '2023-08-02', 'CHARANDANOS-70-00004', '2023-08-02 14:06:30', 1, 2),
(762, 0.00, 3.00, 'Agregado Receta:', '2023-08-03', 'CHARANDANOS-70-00005', '2023-08-03 13:50:40', 1, 2),
(763, 0.00, 3.00, 'Agregado Receta:', '2023-08-04', 'CHARANDANOS-70-00006', '2023-08-04 14:50:20', 1, 2),
(765, 0.00, 3.00, 'Agregado Receta:', '2023-08-09', 'CHCASTAÑAS-60-00003', '2023-08-09 14:23:11', 1, 2),
(766, 0.00, 3.00, 'Agregado Receta:', '2023-08-10', 'CHCASTAÑAS-60-00004', '2023-08-10 14:33:21', 1, 2),
(767, 0.00, 3.00, 'Agregado Receta:', '2023-08-14', 'CHPASAS-60-00009', '2023-08-14 14:12:24', 1, 2),
(768, 0.00, 3.00, 'Agregado Receta:', '2023-08-15', 'CHPASAS-60-00010', '2023-08-15 14:11:56', 1, 2),
(769, 0.00, 3.00, 'Agregado Receta:', '2023-08-16', 'CHPASAS-60-00011', '2023-08-16 14:45:46', 1, 2),
(770, 0.00, 3.00, 'Agregado Receta:', '2023-08-17', 'CHPASAS-60-00012', '2023-08-17 14:15:36', 1, 2),
(771, 0.00, 3.00, 'Agregado Receta:', '2023-08-18', 'CHCAÑIHUA-70-00005', '2023-08-18 14:23:53', 1, 2),
(772, 0.00, 3.00, 'Agregado Receta:', '2023-08-19', 'CHCAÑIHUA-70-00006', '2023-08-19 13:53:35', 1, 2),
(773, 0.00, 3.00, 'Agregado Receta:', '2023-08-21', 'CHCAÑIHUA-70-00007', '2023-08-21 13:23:32', 1, 2),
(774, 0.00, 3.00, 'Agregado Receta:', '2023-08-23', 'CHMANGO-70-00005', '2023-08-23 13:19:34', 1, 2),
(775, 30.00, 0.00, 'Compra', '2023-08-18', 'S-C', '2023-08-20 14:23:22', 1, 1),
(776, 0.00, 3.00, 'Agregado Receta:', '2023-08-24', 'CHMANGO-70-00006', '2023-08-24 13:15:34', 1, 2),
(777, 0.00, 0.55, 'Agregado Receta:', '2023-08-01', 'CHARANDANOS-70-00003', '2023-08-01 13:45:20', 4, 2),
(778, 0.00, 0.55, 'Agregado Receta:', '2023-08-02', 'CHARANDANOS-70-00004', '2023-08-02 14:06:30', 4, 2),
(779, 0.00, 0.55, 'Agregado Receta:', '2023-08-03', 'CHARANDANOS-70-00005', '2023-08-03 13:50:40', 4, 2),
(780, 0.00, 0.55, 'Agregado Receta:', '2023-08-04', 'CHARANDANOS-70-00006', '2023-08-04 14:50:20', 4, 2),
(781, 0.00, 0.55, 'Agregado Receta:', '2023-08-09', 'CHCASTAÑAS-60-00003', '2023-08-09 14:23:11', 4, 2),
(782, 0.00, 0.55, 'Agregado Receta:', '2023-08-10', 'CHCASTAÑAS-60-00004', '2023-08-10 14:33:21', 4, 2),
(783, 0.00, 0.55, 'Agregado Receta:', '2023-08-14', 'CHPASAS-60-00009', '2023-08-14 14:12:24', 4, 2),
(784, 0.00, 0.55, 'Agregado Receta:', '2023-08-15', 'CHPASAS-60-00010', '2023-08-15 14:11:56', 4, 2),
(785, 0.00, 0.55, 'Agregado Receta:', '2023-08-16', 'CHPASAS-60-00011', '2023-08-16 14:45:46', 4, 2),
(786, 0.00, 0.55, 'Agregado Receta:', '2023-08-17', 'CHPASAS-60-00012', '2023-08-17 14:15:36', 4, 2),
(787, 0.00, 0.55, 'Agregado Receta:', '2023-08-18', 'CHCAÑIHUA-70-00005', '2023-08-18 14:23:53', 4, 2),
(788, 0.00, 0.55, 'Agregado Receta:', '2023-08-21', 'CHCAÑIHUA-70-00007', '2023-08-21 13:23:32', 4, 2),
(789, 0.00, 0.55, 'Agregado Receta:', '2023-08-23', 'CHMANGO-70-00005', '2023-08-23 13:19:34', 4, 2),
(790, 0.00, 0.55, 'Agregado Receta:', '2023-08-24', 'CHMANGO-70-00006', '2023-08-24 13:15:34', 4, 2),
(792, 0.00, 1.00, 'Agregado Receta:', '2023-06-01', 'CHMANGO-70-00001', '2023-06-01 15:12:55', 20, 2),
(793, 0.00, 1.00, 'Agregado Receta:', '2023-06-02', 'CHMANGO-70-00002', '2023-06-02 14:12:55', 20, 2),
(794, 0.00, 1.00, 'Agregado Receta:', '2023-06-05', 'CHMANGO-70-00003', '2023-06-05 15:12:55', 20, 2),
(795, 0.00, 1.00, 'Agregado Receta:', '2023-06-06', 'CHMANGO-70-00004', '2023-06-06 14:12:55', 20, 2),
(796, 0.00, 1.00, 'Agregado Receta:', '2023-06-07', 'CHCAÑIHUA-70-00001', '2023-06-07 14:13:54', 20, 2),
(797, 0.00, 1.00, 'Agregado Receta:', '2023-06-08', 'CHCAÑIHUA-70-00002', '2023-06-08 14:12:54', 20, 2),
(798, 0.00, 1.00, 'Agregado Receta:', '2023-06-09', 'CHCAÑIHUA-70-00003', '2023-06-09 14:11:53', 20, 2),
(799, 0.00, 1.00, 'Agregado Receta:', '2023-06-12', 'CHCAÑIHUA-70-00004', '2023-06-12 14:16:51', 20, 2),
(800, 0.00, 1.00, 'Agregado Receta:', '2023-06-13', 'CHAGUAYMANT-70-00001', '2023-06-13 14:19:52', 20, 2),
(801, 0.00, 1.00, 'Agregado Receta:', '2023-06-14', 'CHAGUAYMANT-70-00002', '2023-06-14 14:20:55', 20, 2),
(802, 0.00, 1.00, 'Agregado Receta:', '2023-06-15', 'CHAGUAYMANT-70-00003', '2023-06-15 13:15:55', 20, 2),
(803, 0.00, 1.00, 'Agregado Receta:', '2023-06-16', 'CHAGUAYMANT-70-00004', '2023-06-16 13:10:53', 20, 2),
(804, 0.00, 1.00, 'Agregado Receta:', '2023-06-19', 'CHPASAS-60-00005', '2023-06-19 13:06:34', 20, 2),
(805, 0.00, 1.00, 'Agregado Receta:', '2023-06-21', 'CHPASAS-60-00007', '2023-06-21 14:36:34', 20, 2),
(806, 0.00, 1.00, 'Agregado Receta:', '2023-06-20', 'CHPASAS-60-00006', '2023-06-20 13:46:14', 20, 2),
(807, 0.00, 1.00, 'Agregado Receta:', '2023-06-22', 'CHPASAS-60-00008', '2023-06-22 13:56:54', 20, 2);
INSERT INTO `movimientomateria` (`idMovimientoMateria`, `ingreso`, `salida`, `observacion`, `fecha`, `codigoReceta`, `hora`, `idMateria`, `idMovimiento`) VALUES
(808, 0.00, 1.00, 'Agregado Receta:', '2023-06-23', 'CHTAZA-100-00006', '2023-06-23 14:09:22', 20, 2),
(809, 0.00, 3.00, 'Agregado Receta:', '2023-08-11', 'PCHPECANAS-38-00001', '2023-08-11 13:06:34', 1, 2),
(810, 0.00, 0.55, 'Agregado Receta:', '2023-08-11', 'PCHPECANAS-38-00001', '2023-08-11 13:06:34', 4, 2),
(812, 0.00, 3.00, 'Agregado Receta:', '2023-08-17', 'PCHPECANAS-38-00002', '2023-08-17 13:46:14', 1, 2),
(813, 0.00, 0.55, 'Agregado Receta:', '2023-08-17', 'PCHPECANAS-38-00002', '2023-08-17 13:46:14', 4, 2),
(815, 0.00, 3.00, 'Agregado Receta:', '2023-08-18', 'PCHPECANAS-38-00003', '2023-08-18 14:36:34', 1, 2),
(816, 0.00, 0.55, 'Agregado Receta:', '2023-08-18', 'PCHPECANAS-38-00003', '2023-08-18 14:36:34', 4, 2),
(818, 0.00, 3.00, 'Agregado Receta:', '2023-08-22', 'PCHPECANAS-38-00004', '2023-08-22 13:56:54', 1, 2),
(819, 0.00, 0.55, 'Agregado Receta:', '2023-08-22', 'PCHPECANAS-38-00004', '2023-08-22 13:56:54', 4, 2),
(821, 0.00, 0.55, 'Agregado Receta:', '2023-08-11', 'PCHPECANAS-38-00001', '2023-08-11 13:06:34', 10, 2),
(822, 0.00, 0.55, 'Agregado Receta:', '2023-08-17', 'PCHPECANAS-38-00002', '2023-08-17 13:46:14', 10, 2),
(823, 0.00, 0.55, 'Agregado Receta:', '2023-08-18', 'PCHPECANAS-38-00003', '2023-08-18 14:36:34', 10, 2),
(824, 0.00, 0.55, 'Agregado Receta:', '2023-08-22', 'PCHPECANAS-38-00004', '2023-08-22 13:56:54', 10, 2),
(825, 0.00, 0.55, 'Agregado Receta:', '2023-08-24', 'CHMANGO-70-00006', '2023-08-24 13:15:34', 17, 2),
(826, 0.00, 0.55, 'Agregado Receta:', '2023-08-23', 'CHMANGO-70-00005', '2023-08-23 13:19:34', 17, 2),
(827, 0.00, 0.55, 'Agregado Receta:', '2023-08-21', 'CHCAÑIHUA-70-00007', '2023-08-21 13:23:32', 15, 2),
(828, 0.00, 0.55, 'Agregado Receta:', '2023-08-19', 'CHCAÑIHUA-70-00006', '2023-08-19 13:53:35', 15, 2),
(829, 0.00, 0.55, 'Agregado Receta:', '2023-08-19', 'CHCAÑIHUA-70-00006', '2023-08-19 13:53:35', 4, 2),
(830, 0.00, 0.55, 'Agregado Receta:', '2023-08-18', 'CHCAÑIHUA-70-00005', '2023-08-18 14:23:53', 15, 2),
(831, 0.00, 0.55, 'Agregado Receta:', '2023-08-17', 'CHPASAS-60-00012', '2023-08-17 14:15:36', 2, 2),
(832, 0.00, 0.55, 'Agregado Receta:', '2023-08-09', 'CHCASTAÑAS-60-00003', '2023-08-09 14:23:11', 11, 2),
(833, 0.00, 0.55, 'Agregado Receta:', '2023-08-04', 'CHARANDANOS-70-00006', '2023-08-04 14:50:20', 14, 2),
(834, 0.00, 0.55, 'Agregado Receta:', '2023-08-03', 'CHARANDANOS-70-00005', '2023-08-03 13:50:40', 14, 2),
(835, 0.00, 0.55, 'Agregado Receta:', '2023-08-01', 'CHARANDANOS-70-00003', '2023-08-01 13:45:20', 14, 2),
(836, 0.00, 0.55, 'Agregado Receta:', '2023-07-21', 'CHAGUAYMANT-99-00003', '2023-07-21 14:52:49', 19, 2),
(837, 0.00, 0.55, 'Agregado Receta:', '2023-07-21', 'CHAGUAYMANT-99-00003', '2023-07-21 14:52:49', 13, 2),
(838, 15.00, 0.00, 'Compra', '2023-08-23', 'S-C', '2023-08-23 14:39:45', 1, 1),
(840, 0.00, 0.50, 'Agregado Receta:', '2023-08-23', 'CHMANGO-70-00005', '2023-08-23 13:19:34', 3, 2),
(842, 0.00, 40.00, 'Agregado Receta:', '2023-08-01', 'CHARANDANOS-70-00003', '2023-08-01 13:45:20', 5, 2),
(843, 0.00, 40.00, 'Agregado Receta:', '2023-08-01', 'CHARANDANOS-70-00003', '2023-08-01 13:45:20', 6, 2),
(844, 0.00, 40.00, 'Agregado Receta:', '2023-08-01', 'CHARANDANOS-70-00003', '2023-08-01 13:45:20', 18, 2),
(845, 0.00, 1.00, 'Agregado Receta:', '2023-08-01', 'CHARANDANOS-70-00003', '2023-08-01 13:45:20', 20, 2),
(849, 0.00, 40.00, 'Agregado Receta:', '2023-08-02', 'CHARANDANOS-70-00004', '2023-08-02 14:06:30', 5, 2),
(850, 0.00, 40.00, 'Agregado Receta:', '2023-08-02', 'CHARANDANOS-70-00004', '2023-08-02 14:06:30', 6, 2),
(851, 0.00, 40.00, 'Agregado Receta:', '2023-08-02', 'CHARANDANOS-70-00004', '2023-08-02 14:06:30', 18, 2),
(852, 0.00, 1.00, 'Agregado Receta:', '2023-08-02', 'CHARANDANOS-70-00004', '2023-08-02 14:06:30', 20, 2),
(856, 0.00, 40.00, 'Agregado Receta:', '2023-08-03', 'CHARANDANOS-70-00005', '2023-08-03 13:50:40', 5, 2),
(857, 0.00, 40.00, 'Agregado Receta:', '2023-08-03', 'CHARANDANOS-70-00005', '2023-08-03 13:50:40', 6, 2),
(858, 0.00, 40.00, 'Agregado Receta:', '2023-08-03', 'CHARANDANOS-70-00005', '2023-08-03 13:50:40', 18, 2),
(859, 0.00, 1.00, 'Agregado Receta:', '2023-08-03', 'CHARANDANOS-70-00005', '2023-08-03 13:50:40', 20, 2),
(863, 0.00, 40.00, 'Agregado Receta:', '2023-08-04', 'CHARANDANOS-70-00006', '2023-08-04 14:50:20', 5, 2),
(864, 0.00, 40.00, 'Agregado Receta:', '2023-08-04', 'CHARANDANOS-70-00006', '2023-08-04 14:50:20', 6, 2),
(865, 0.00, 40.00, 'Agregado Receta:', '2023-08-04', 'CHARANDANOS-70-00006', '2023-08-04 14:50:20', 18, 2),
(866, 0.00, 1.00, 'Agregado Receta:', '2023-08-04', 'CHARANDANOS-70-00006', '2023-08-04 14:50:20', 20, 2),
(870, 0.00, 40.00, 'Agregado Receta:', '2023-08-09', 'CHCASTAÑAS-60-00003', '2023-08-09 14:23:11', 5, 2),
(871, 0.00, 40.00, 'Agregado Receta:', '2023-08-09', 'CHCASTAÑAS-60-00003', '2023-08-09 14:23:11', 6, 2),
(872, 0.00, 40.00, 'Agregado Receta:', '2023-08-09', 'CHCASTAÑAS-60-00003', '2023-08-09 14:23:11', 18, 2),
(873, 0.00, 1.00, 'Agregado Receta:', '2023-08-09', 'CHCASTAÑAS-60-00003', '2023-08-09 14:23:11', 20, 2),
(877, 0.00, 40.00, 'Agregado Receta:', '2023-08-10', 'CHCASTAÑAS-60-00004', '2023-08-10 14:33:21', 5, 2),
(878, 0.00, 40.00, 'Agregado Receta:', '2023-08-10', 'CHCASTAÑAS-60-00004', '2023-08-10 14:33:21', 6, 2),
(879, 0.00, 40.00, 'Agregado Receta:', '2023-08-10', 'CHCASTAÑAS-60-00004', '2023-08-10 14:33:21', 18, 2),
(880, 0.00, 1.00, 'Agregado Receta:', '2023-08-10', 'CHCASTAÑAS-60-00004', '2023-08-10 14:33:21', 20, 2),
(884, 0.00, 40.00, 'Agregado Receta:', '2023-08-11', 'PCHPECANAS-38-00001', '2023-08-11 13:06:34', 5, 2),
(885, 0.00, 40.00, 'Agregado Receta:', '2023-08-11', 'PCHPECANAS-38-00001', '2023-08-11 13:06:34', 6, 2),
(886, 0.00, 40.00, 'Agregado Receta:', '2023-08-11', 'PCHPECANAS-38-00001', '2023-08-11 13:06:34', 18, 2),
(887, 0.00, 1.00, 'Agregado Receta:', '2023-08-11', 'PCHPECANAS-38-00001', '2023-08-11 13:06:34', 20, 2),
(891, 0.00, 40.00, 'Agregado Receta:', '2023-08-14', 'CHPASAS-60-00009', '2023-08-14 14:12:24', 5, 2),
(892, 0.00, 40.00, 'Agregado Receta:', '2023-08-14', 'CHPASAS-60-00009', '2023-08-14 14:12:24', 6, 2),
(893, 0.00, 40.00, 'Agregado Receta:', '2023-08-14', 'CHPASAS-60-00009', '2023-08-14 14:12:24', 18, 2),
(894, 0.00, 1.00, 'Agregado Receta:', '2023-08-14', 'CHPASAS-60-00009', '2023-08-14 14:12:24', 20, 2),
(898, 0.00, 40.00, 'Agregado Receta:', '2023-08-15', 'CHPASAS-60-00010', '2023-08-15 14:11:56', 5, 2),
(899, 0.00, 40.00, 'Agregado Receta:', '2023-08-15', 'CHPASAS-60-00010', '2023-08-15 14:11:56', 6, 2),
(900, 0.00, 40.00, 'Agregado Receta:', '2023-08-15', 'CHPASAS-60-00010', '2023-08-15 14:11:56', 18, 2),
(901, 0.00, 1.00, 'Agregado Receta:', '2023-08-15', 'CHPASAS-60-00010', '2023-08-15 14:11:56', 20, 2),
(905, 0.00, 40.00, 'Agregado Receta:', '2023-08-16', 'CHPASAS-60-00011', '2023-08-16 14:45:46', 5, 2),
(906, 0.00, 40.00, 'Agregado Receta:', '2023-08-16', 'CHPASAS-60-00011', '2023-08-16 14:45:46', 6, 2),
(907, 0.00, 40.00, 'Agregado Receta:', '2023-08-16', 'CHPASAS-60-00011', '2023-08-16 14:45:46', 18, 2),
(908, 0.00, 1.00, 'Agregado Receta:', '2023-08-16', 'CHPASAS-60-00011', '2023-08-16 14:45:46', 20, 2),
(912, 0.00, 40.00, 'Agregado Receta:', '2023-08-17', 'PCHPECANAS-38-00002', '2023-08-17 13:46:14', 5, 2),
(913, 0.00, 40.00, 'Agregado Receta:', '2023-08-17', 'PCHPECANAS-38-00002', '2023-08-17 13:46:14', 6, 2),
(914, 0.00, 40.00, 'Agregado Receta:', '2023-08-17', 'PCHPECANAS-38-00002', '2023-08-17 13:46:14', 18, 2),
(915, 0.00, 1.00, 'Agregado Receta:', '2023-08-17', 'PCHPECANAS-38-00002', '2023-08-17 13:46:14', 20, 2),
(919, 0.00, 40.00, 'Agregado Receta:', '2023-08-17', 'CHPASAS-60-00012', '2023-08-17 14:15:36', 5, 2),
(920, 0.00, 40.00, 'Agregado Receta:', '2023-08-17', 'CHPASAS-60-00012', '2023-08-17 14:15:36', 6, 2),
(921, 0.00, 40.00, 'Agregado Receta:', '2023-08-17', 'CHPASAS-60-00012', '2023-08-17 14:15:36', 18, 2),
(922, 0.00, 1.00, 'Agregado Receta:', '2023-08-17', 'CHPASAS-60-00012', '2023-08-17 14:15:36', 20, 2),
(926, 0.00, 40.00, 'Agregado Receta:', '2023-08-18', 'CHCAÑIHUA-70-00005', '2023-08-18 14:23:53', 5, 2),
(927, 0.00, 40.00, 'Agregado Receta:', '2023-08-18', 'CHCAÑIHUA-70-00005', '2023-08-18 14:23:53', 6, 2),
(928, 0.00, 40.00, 'Agregado Receta:', '2023-08-18', 'CHCAÑIHUA-70-00005', '2023-08-18 14:23:53', 18, 2),
(929, 0.00, 1.00, 'Agregado Receta:', '2023-08-18', 'CHCAÑIHUA-70-00005', '2023-08-18 14:23:53', 20, 2),
(933, 0.00, 40.00, 'Agregado Receta:', '2023-08-18', 'PCHPECANAS-38-00003', '2023-08-18 14:36:34', 5, 2),
(934, 0.00, 40.00, 'Agregado Receta:', '2023-08-18', 'PCHPECANAS-38-00003', '2023-08-18 14:36:34', 6, 2),
(935, 0.00, 40.00, 'Agregado Receta:', '2023-08-18', 'PCHPECANAS-38-00003', '2023-08-18 14:36:34', 18, 2),
(936, 0.00, 1.00, 'Agregado Receta:', '2023-08-18', 'PCHPECANAS-38-00003', '2023-08-18 14:36:34', 20, 2),
(940, 0.00, 40.00, 'Agregado Receta:', '2023-08-19', 'CHCAÑIHUA-70-00006', '2023-08-19 13:53:35', 5, 2),
(941, 0.00, 40.00, 'Agregado Receta:', '2023-08-19', 'CHCAÑIHUA-70-00006', '2023-08-19 13:53:35', 6, 2),
(942, 0.00, 40.00, 'Agregado Receta:', '2023-08-19', 'CHCAÑIHUA-70-00006', '2023-08-19 13:53:35', 18, 2),
(943, 0.00, 1.00, 'Agregado Receta:', '2023-08-19', 'CHCAÑIHUA-70-00006', '2023-08-19 13:53:35', 20, 2),
(947, 0.00, 40.00, 'Agregado Receta:', '2023-08-21', 'CHCAÑIHUA-70-00007', '2023-08-21 13:23:32', 5, 2),
(948, 0.00, 40.00, 'Agregado Receta:', '2023-08-21', 'CHCAÑIHUA-70-00007', '2023-08-21 13:23:32', 6, 2),
(949, 0.00, 40.00, 'Agregado Receta:', '2023-08-21', 'CHCAÑIHUA-70-00007', '2023-08-21 13:23:32', 18, 2),
(950, 0.00, 1.00, 'Agregado Receta:', '2023-08-21', 'CHCAÑIHUA-70-00007', '2023-08-21 13:23:32', 20, 2),
(954, 0.00, 40.00, 'Agregado Receta:', '2023-08-22', 'PCHPECANAS-38-00004', '2023-08-22 13:56:54', 5, 2),
(955, 0.00, 40.00, 'Agregado Receta:', '2023-08-22', 'PCHPECANAS-38-00004', '2023-08-22 13:56:54', 6, 2),
(956, 0.00, 40.00, 'Agregado Receta:', '2023-08-22', 'PCHPECANAS-38-00004', '2023-08-22 13:56:54', 18, 2),
(957, 0.00, 1.00, 'Agregado Receta:', '2023-08-22', 'PCHPECANAS-38-00004', '2023-08-22 13:56:54', 20, 2),
(961, 0.00, 40.00, 'Agregado Receta:', '2023-08-23', 'CHMANGO-70-00005', '2023-08-23 13:19:34', 5, 2),
(962, 0.00, 40.00, 'Agregado Receta:', '2023-08-23', 'CHMANGO-70-00005', '2023-08-23 13:19:34', 6, 2),
(963, 0.00, 40.00, 'Agregado Receta:', '2023-08-23', 'CHMANGO-70-00005', '2023-08-23 13:19:34', 18, 2),
(964, 0.00, 1.00, 'Agregado Receta:', '2023-08-23', 'CHMANGO-70-00005', '2023-08-23 13:19:34', 20, 2),
(968, 0.00, 40.00, 'Agregado Receta:', '2023-08-24', 'CHMANGO-70-00006', '2023-08-24 13:15:34', 5, 2),
(969, 0.00, 40.00, 'Agregado Receta:', '2023-08-24', 'CHMANGO-70-00006', '2023-08-24 13:15:34', 6, 2),
(970, 0.00, 40.00, 'Agregado Receta:', '2023-08-24', 'CHMANGO-70-00006', '2023-08-24 13:15:34', 18, 2),
(971, 0.00, 1.00, 'Agregado Receta:', '2023-08-24', 'CHMANGO-70-00006', '2023-08-24 13:15:34', 20, 2),
(984, 0.00, 3.00, 'Agregado Receta:', '2023-10-27', 'RC002023', '2023-10-28 00:44:24', 1, 2),
(985, 0.00, 0.55, 'Agregado Receta:', '2023-10-27', 'RC002023', '2023-10-28 00:44:24', 4, 2),
(986, 0.00, 0.55, 'Agregado Receta:', '2023-10-27', 'RC002023', '2023-10-28 00:44:24', 10, 2),
(987, 0.00, 40.00, 'Agregado Receta:', '2023-10-27', 'RC002023', '2023-10-28 00:44:24', 5, 2),
(988, 0.00, 40.00, 'Agregado Receta:', '2023-10-27', 'RC002023', '2023-10-28 00:44:24', 6, 2),
(989, 0.00, 40.00, 'Agregado Receta:', '2023-10-27', 'RC002023', '2023-10-28 00:44:24', 18, 2),
(990, 0.00, 1.00, 'Agregado Receta:', '2023-10-27', 'RC002023', '2023-10-28 00:44:24', 20, 2),
(991, 0.00, 3.00, 'Agregado Receta:', '2023-10-27', 'EC020231', '2023-10-28 00:55:20', 1, 2),
(992, 0.00, 0.55, 'Agregado Receta:', '2023-10-27', 'EC020231', '2023-10-28 00:55:20', 4, 2),
(993, 0.00, 0.55, 'Agregado Receta:', '2023-10-27', 'EC020231', '2023-10-28 00:55:20', 10, 2),
(994, 0.00, 40.00, 'Agregado Receta:', '2023-10-27', 'EC020231', '2023-10-28 00:55:20', 5, 2),
(995, 0.00, 40.00, 'Agregado Receta:', '2023-10-27', 'EC020231', '2023-10-28 00:55:20', 6, 2),
(996, 0.00, 40.00, 'Agregado Receta:', '2023-10-27', 'EC020231', '2023-10-28 00:55:20', 18, 2),
(997, 0.00, 1.00, 'Agregado Receta:', '2023-10-27', 'EC020231', '2023-10-28 00:55:20', 20, 2),
(998, 0.00, 3.00, 'Agregado Receta:', '2023-11-08', '11111111', '2023-11-08 22:38:57', 1, 2),
(999, 0.00, 0.55, 'Agregado Receta:', '2023-11-08', '11111111', '2023-11-08 22:38:57', 4, 2),
(1000, 0.00, 0.55, 'Agregado Receta:', '2023-11-08', '11111111', '2023-11-08 22:38:57', 10, 2),
(1001, 0.00, 40.00, 'Agregado Receta:', '2023-11-08', '11111111', '2023-11-08 22:38:57', 5, 2),
(1002, 0.00, 40.00, 'Agregado Receta:', '2023-11-08', '11111111', '2023-11-08 22:38:57', 6, 2),
(1003, 0.00, 40.00, 'Agregado Receta:', '2023-11-08', '11111111', '2023-11-08 22:38:57', 18, 2),
(1004, 0.00, 1.00, 'Agregado Receta:', '2023-11-08', '11111111', '2023-11-08 22:38:57', 20, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientoproducto`
--

CREATE TABLE `movimientoproducto` (
  `idMovimientoProducto` int(11) NOT NULL,
  `ingreso` decimal(10,2) DEFAULT NULL,
  `salida` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` timestamp NULL DEFAULT current_timestamp(),
  `idLote` int(11) DEFAULT NULL,
  `idMovimiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientoproducto`
--

INSERT INTO `movimientoproducto` (`idMovimientoProducto`, `ingreso`, `salida`, `observacion`, `fecha`, `hora`, `idLote`, `idMovimiento`) VALUES
(2, 80.00, 0.00, 'Productos terminados : CHPASAS-60', '2023-05-09', '2023-05-09 16:42:29', 2, 1),
(3, 40.00, 0.00, 'Productos terminados : CHPASAS-60-00002', '2023-05-10', '2023-05-10 16:49:43', 3, 1),
(4, 20.00, 0.00, 'Productos terminados : CHPASAS-60-00003', '2023-05-11', '2023-05-11 19:55:45', 4, 1),
(5, 80.00, 0.00, 'Productos terminados : CHPASAS-60-00004', '2023-05-16', '2023-05-16 15:15:26', 5, 1),
(6, 40.00, 0.00, 'Productos terminados : CHTAZA-100-00001', '2023-05-01', '2023-05-01 15:04:23', 6, 1),
(7, 40.00, 0.00, 'Productos terminados : CHARANDANOS-70-00001', '2023-05-12', '2023-05-12 16:04:32', 7, 1),
(8, 40.00, 0.00, 'Productos terminados : CHAGUAYMANT-99-00001', '2023-05-23', '2023-05-23 20:04:38', 15, 1),
(9, 40.00, 0.00, 'Productos terminados : CHQUINUA-70-00002', '2023-06-01', '2023-06-01 14:04:44', 25, 1),
(11, 40.00, 0.00, 'Productos terminados : CHQUINUA-70-00001', '2023-05-31', '2023-05-31 20:04:53', 24, 1),
(12, 40.00, 0.00, 'Productos terminados : CHAGUAYMANT-99-00002', '2023-05-24', '2023-05-24 14:05:01', 23, 1),
(13, 40.00, 0.00, 'Productos terminados : CHARANDANOS-99-00002', '2023-05-29', '2023-05-29 16:05:06', 22, 1),
(14, 40.00, 0.00, 'Productos terminados : CHARANDANOS-70-00002', '2023-05-15', '2023-05-15 21:05:15', 8, 1),
(15, 40.00, 0.00, 'Productos terminados : CHKIWICHA-70-00001', '2023-05-19', '2023-05-19 16:05:26', 19, 1),
(16, 40.00, 0.00, 'Productos terminados : CHKIWICHA-70-00002', '2023-05-20', '2023-05-20 14:05:33', 20, 1),
(17, 40.00, 0.00, 'Productos terminados : CHTAZA-100-00005', '2023-05-05', '2023-05-05 16:05:39', 17, 1),
(18, 40.00, 0.00, 'Productos terminados : CHTAZA-100-00004', '2023-05-04', '2023-05-04 14:05:44', 16, 1),
(19, 40.00, 0.00, 'Productos terminados : CHARANDANOS-99-00001', '2023-05-26', '2023-05-26 13:05:50', 21, 1),
(20, 40.00, 0.00, 'Productos terminados : CHTAZA-100-00002', '2023-05-02', '2023-05-03 16:05:59', 9, 1),
(21, 40.00, 0.00, 'Productos terminados : CHTAZA-100-00003', '2023-05-03', '2023-05-03 18:06:06', 10, 1),
(22, 40.00, 0.00, 'Productos terminados : CHCASTAÑAS-60-00001', '2023-05-16', '2023-05-16 23:21:43', 65, 1),
(23, 40.00, 0.00, 'Productos terminados : CHCASTAÑAS-60-00002', '2023-05-17', '2023-05-17 17:21:50', 67, 1),
(24, 40.00, 0.00, 'Productos terminados : CHMANGO-70-00001', '2023-06-02', '2023-06-02 16:30:53', 26, 1),
(25, 40.00, 0.00, 'Productos terminados : CHMANGO-70-00002', '2023-06-05', '2023-06-05 15:31:26', 27, 1),
(26, 40.00, 0.00, 'Productos terminados : CHMANGO-70-00003', '2023-06-06', '2023-06-06 15:51:32', 28, 1),
(27, 40.00, 0.00, 'Productos terminados : CHMANGO-70-00004', '2023-06-07', '2023-06-07 16:31:39', 29, 1),
(28, 40.00, 0.00, 'Productos terminados : CHCAÑIHUA-70-00001', '2023-06-08', '2023-06-08 19:31:46', 30, 1),
(29, 40.00, 0.00, 'Productos terminados : CHCAÑIHUA-70-00002', '2023-06-09', '2023-06-09 18:31:54', 31, 1),
(30, 40.00, 0.00, 'Productos terminados : CHCAÑIHUA-70-00003', '2023-06-12', '2023-06-12 16:32:17', 32, 1),
(31, 40.00, 0.00, 'Productos terminados : CHCAÑIHUA-70-00004', '2023-06-13', '2023-06-13 15:32:24', 33, 1),
(32, 40.00, 0.00, 'Productos terminados : CHAGUAYMANT-70-00001', '2023-06-14', '2023-06-14 22:32:31', 34, 1),
(33, 40.00, 0.00, 'Productos terminados : CHAGUAYMANT-70-00002', '2023-06-15', '2023-06-15 19:32:39', 35, 1),
(34, 40.00, 0.00, 'Productos terminados : CHAGUAYMANT-70-00003', '2023-06-16', '2023-06-16 17:32:47', 36, 1),
(35, 40.00, 0.00, 'Productos terminados : CHAGUAYMANT-70-00004', '2023-06-19', '2023-06-19 16:33:06', 37, 1),
(36, 40.00, 0.00, 'Productos terminados : CHPASAS-60-00005', '2023-06-20', '2023-05-20 16:33:14', 38, 1),
(37, 40.00, 0.00, 'Productos terminados : CHPASAS-60-00006', '2023-06-11', '2023-06-11 21:34:11', 39, 1),
(38, 40.00, 0.00, 'Productos terminados : CHPASAS-60-00007', '2023-06-22', '2023-06-22 20:34:25', 40, 1),
(39, 40.00, 0.00, 'Productos terminados : CHPASAS-60-00008', '2023-06-23', '2023-06-23 21:34:33', 41, 1),
(40, 40.00, 0.00, 'Productos terminados : CHTAZA-100-00006', '2023-06-26', '2023-06-26 05:34:46', 42, 1),
(41, 40.00, 0.00, 'Productos terminados : CHCASTAÑAS-60-00004', '2023-08-11', '2023-08-11 15:36:47', 73, 1),
(42, 40.00, 0.00, 'Productos terminados : CHPASAS-60-00009', '2023-08-15', '2023-08-15 16:36:52', 74, 1),
(43, 40.00, 0.00, 'Productos terminados : CHPASAS-60-00010', '2023-08-16', '2023-08-16 19:37:29', 75, 1),
(44, 40.00, 0.00, 'Productos terminados : CHAGUAYMANT-99-00004', '2023-07-26', '2023-07-26 15:37:35', 62, 1),
(45, 40.00, 0.00, 'Productos terminados : CHPASAS-60-00011', '2023-08-17', '2023-08-17 15:37:40', 76, 1),
(46, 40.00, 0.00, 'Productos terminados : CHAGUAYMANT-99-00005', '2023-07-27', '2023-07-27 21:37:46', 63, 1),
(47, 40.00, 0.00, 'Productos terminados : CHAGUAYMANT-99-00006', '2023-07-28', '2023-07-28 15:37:52', 64, 1),
(48, 40.00, 0.00, 'Productos terminados : CHTAZA-100-00007', '2023-06-26', '2023-06-26 14:41:49', 43, 1),
(49, 40.00, 0.00, 'Productos terminados : CHTAZA-100-00008', '2023-06-28', '2023-06-28 19:59:57', 87, 1),
(50, 40.00, 0.00, 'Productos terminados : CHTAZA-100-00009', '2023-06-29', '2023-06-29 16:00:04', 45, 1),
(51, 40.00, 0.00, 'Productos terminados : CHNIBS-70-00001', '2023-07-05', '2023-07-05 16:00:11', 48, 1),
(52, 40.00, 0.00, 'Productos terminados : CHNIBS-70-00002', '2023-07-06', '2023-07-06 21:00:17', 49, 1),
(53, 40.00, 0.00, 'Productos terminados : CHNIBS-70-00003', '2023-07-07', '2023-07-07 21:40:24', 50, 1),
(54, 40.00, 0.00, 'Productos terminados : CHNIBS-70-00004', '2023-07-10', '2023-07-10 18:00:30', 51, 1),
(55, 40.00, 0.00, 'Productos terminados : CHPOLVO-100-00001', '2023-07-11', '2023-07-11 22:00:35', 53, 1),
(56, 40.00, 0.00, 'Productos terminados : CHPOLVO-100-00002', '2023-07-12', '2023-07-12 21:00:42', 54, 1),
(57, 40.00, 0.00, 'Productos terminados : CHPOLVO-100-00003', '2023-07-13', '2023-07-13 16:00:47', 55, 1),
(58, 40.00, 0.00, 'Productos terminados : CHPOLVO-100-00004', '2023-07-14', '2023-07-14 20:00:52', 56, 1),
(59, 40.00, 0.00, 'Productos terminados : CHQUINUA-70-00003', '2023-07-20', '2023-07-20 23:00:56', 58, 1),
(60, 40.00, 0.00, 'Productos terminados : CHQUINUA-70-00004', '2023-07-21', '2023-07-21 16:01:01', 59, 1),
(61, 40.00, 0.00, 'Productos terminados : CHAGUAYMANT-99-00003', '2023-07-24', '2023-07-24 14:01:06', 61, 1),
(62, 40.00, 0.00, 'Productos terminados : CHARANDANOS-70-00003', '2023-08-02', '2023-08-02 16:04:18', 66, 1),
(63, 40.00, 0.00, 'Productos terminados : CHARANDANOS-70-00004', '2023-08-03', '2023-08-03 15:04:22', 68, 1),
(64, 40.00, 0.00, 'Productos terminados : CHARANDANOS-70-00005', '2023-08-04', '2023-08-04 16:04:27', 69, 1),
(65, 40.00, 0.00, 'Productos terminados : CHARANDANOS-70-00006', '2023-08-07', '2023-08-07 19:04:32', 70, 1),
(66, 40.00, 0.00, 'Productos terminados : CHCASTAÑAS-60-00003', '2023-08-10', '2023-08-10 21:04:37', 72, 1),
(67, 40.00, 0.00, 'Productos terminados : CHPASAS-60-00012', '2023-08-18', '2023-08-18 16:04:44', 77, 1),
(68, 40.00, 0.00, 'Productos terminados : CHCAÑIHUA-70-00005', '2023-08-21', '2023-08-21 16:22:16', 78, 1),
(69, 40.00, 0.00, 'Productos terminados : CHCAÑIHUA-70-00006', '2023-08-22', '2023-07-22 15:22:21', 79, 1),
(70, 40.00, 0.00, 'Productos terminados : CHCAÑIHUA-70-00007', '2023-08-23', '2023-08-23 19:22:29', 80, 1),
(71, 40.00, 0.00, 'Productos terminados : CHMANGO-70-00005', '2023-08-24', '2023-08-24 16:22:34', 81, 1),
(72, 40.00, 0.00, 'Productos terminados : CHMANGO-70-00006', '2023-08-24', '2023-08-24 19:22:39', 82, 1),
(73, 40.00, 0.00, 'Productos terminados : PCHPECANAS-38-00001', '2023-08-14', '2023-08-14 16:22:43', 83, 1),
(74, 40.00, 0.00, 'Productos terminados : PCHPECANAS-38-00002', '2023-08-18', '2023-08-18 06:22:47', 84, 1),
(75, 40.00, 0.00, 'Productos terminados : PCHPECANAS-38-00003', '2023-08-21', '2023-08-21 18:22:51', 85, 1),
(76, 40.00, 0.00, 'Productos terminados : PCHPECANAS-38-00004', '2023-08-21', '2023-08-21 19:22:55', 86, 1),
(77, 0.00, 60.00, 'Venta', '2023-05-12', '2023-05-12 15:59:42', 2, 2),
(78, 0.00, 40.00, 'Venta', '2023-05-13', '2023-05-13 18:12:00', 3, 2),
(79, 0.00, 50.00, 'Venta', '2023-05-17', '2023-05-17 16:42:44', 5, 2),
(80, 0.00, 20.00, 'Venta', '2023-05-22', '2023-05-22 20:44:19', 2, 2),
(81, 0.00, 20.00, 'Venta', '2023-05-22', '2023-05-22 20:59:58', 4, 2),
(82, 0.00, 30.00, 'Venta', '2023-05-22', '2023-05-22 21:15:10', 5, 2),
(83, 0.00, 20.00, 'Venta', '2023-05-23', '2023-05-23 22:50:11', 38, 2),
(84, 0.00, 20.00, 'Venta', '2023-05-24', '2023-05-24 21:10:36', 38, 2),
(85, 0.00, 40.00, 'Venta', '2023-06-12', '2023-06-12 20:52:44', 39, 2),
(86, 0.00, 35.00, 'Venta', '2023-06-24', '2023-06-24 16:53:17', 40, 2),
(87, 0.00, 5.00, 'Venta', '2023-06-27', '2023-06-27 16:20:07', 40, 2),
(88, 0.00, 40.00, 'Venta', '2023-06-27', '2023-06-27 16:58:28', 41, 2),
(89, 0.00, 40.00, 'Venta', '2023-08-17', '2023-08-17 21:59:21', 74, 2),
(90, 0.00, 40.00, 'Venta', '2023-08-19', '2023-08-19 19:03:33', 75, 2),
(91, 0.00, 40.00, 'Venta', '2023-08-19', '2023-08-19 19:10:47', 76, 2),
(92, 0.00, 10.00, 'Venta', '2023-08-19', '2023-08-19 22:06:04', 77, 2),
(93, 0.00, 10.00, 'Venta', '2023-08-19', '2023-08-19 22:46:31', 77, 2),
(94, 0.00, 10.00, 'Venta', '2023-06-07', '2023-06-07 19:13:57', 19, 2),
(95, 0.00, 5.00, 'Venta', '2023-06-14', '2023-06-14 15:14:21', 19, 2),
(96, 0.00, 15.00, 'Venta', '2023-07-12', '2023-07-12 21:14:46', 19, 2),
(97, 0.00, 10.00, 'Venta', '2023-07-20', '2023-07-22 14:15:06', 19, 2),
(98, 0.00, 5.00, 'Venta', '2023-08-02', '2023-08-02 15:15:24', 20, 2),
(99, 0.00, 15.00, 'Venta', '2023-08-05', '2023-08-05 18:15:40', 20, 2),
(100, 0.00, 15.00, 'Venta', '2023-08-11', '2023-08-11 22:16:19', 20, 2),
(101, 0.00, 10.00, 'Venta', '2023-07-10', '2023-07-10 21:37:41', 21, 2),
(102, 0.00, 5.00, 'Venta', '2023-07-21', '2023-07-21 19:38:39', 21, 2),
(103, 0.00, 15.00, 'Venta', '2023-07-27', '2023-07-27 14:39:37', 21, 2),
(104, 0.00, 10.00, 'Venta', '2023-07-31', '2023-07-31 19:39:59', 21, 2),
(105, 0.00, 15.00, 'Venta', '2023-08-04', '2023-08-04 16:41:25', 22, 2),
(106, 0.00, 5.00, 'Venta', '2023-08-10', '2023-08-10 20:41:53', 22, 2),
(107, 0.00, 3.00, 'Venta', '2023-08-19', '2023-08-19 17:42:23', 22, 2),
(108, 0.00, 10.00, 'Venta', '2023-08-19', '2023-08-19 17:50:41', 22, 2),
(109, 0.00, 20.00, 'Venta', '2023-06-05', '2023-06-05 15:54:37', 24, 2),
(110, 0.00, 20.00, 'Venta', '2023-07-25', '2023-07-25 21:55:19', 24, 2),
(111, 0.00, 40.00, 'Venta', '2023-07-19', '2023-07-19 14:55:45', 25, 2),
(112, 0.00, 25.00, 'Venta', '2023-08-17', '2023-08-17 16:56:02', 58, 2),
(113, 0.00, 40.00, 'Venta', '2023-07-14', '2023-07-14 20:00:34', 65, 2),
(114, 0.00, 20.00, 'Venta', '2023-07-25', '2023-07-25 21:01:01', 67, 2),
(115, 0.00, 7.00, 'Venta', '2023-07-28', '2023-07-25 18:01:34', 67, 2),
(116, 0.00, 13.00, 'Venta', '2023-08-04', '2023-08-04 14:01:51', 67, 2),
(117, 0.00, 20.00, 'Venta', '2023-08-10', '2023-08-10 16:02:13', 72, 2),
(118, 0.00, 5.00, 'Venta', '2023-08-10', '2023-08-10 21:02:29', 72, 2),
(119, 0.00, 15.00, 'Venta', '2023-07-12', '2023-07-12 21:08:41', 48, 2),
(120, 0.00, 15.00, 'Venta', '2023-07-17', '2023-07-17 22:09:02', 48, 2),
(121, 0.00, 5.00, 'Venta', '2023-08-01', '2023-08-21 10:12:20', 48, 2),
(122, 0.00, 5.00, 'Venta', '2023-08-03', '2023-08-03 21:12:44', 48, 2),
(123, 0.00, 40.00, 'Venta', '2023-08-07', '2023-08-07 19:13:02', 49, 2),
(124, 0.00, 5.00, 'Venta', '2023-08-21', '2023-08-21 14:13:22', 50, 2),
(125, 0.00, 40.00, 'Venta', '2023-08-22', '2023-08-22 19:16:50', 51, 2),
(126, 40.00, 0.00, 'Productos terminados : RC002023', '2023-10-21', '2023-10-28 00:45:12', 89, 1),
(127, 40.00, 0.00, 'Productos terminados : EC020231', '2023-11-16', '2023-10-28 00:55:43', 90, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordertable`
--

CREATE TABLE `ordertable` (
  `idOrderTable` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ordertable`
--

INSERT INTO `ordertable` (`idOrderTable`, `descripcion`) VALUES
(1, 'ordertable'),
(2, 'configuracion'),
(3, 'marca'),
(4, 'tipoproducto'),
(5, 'tipounidad'),
(6, 'unidadmedida'),
(7, 'tipomateria'),
(8, 'tipocosto'),
(9, 'tipodocumento'),
(10, 'tipogasto'),
(11, 'movimiento'),
(12, 'estado'),
(13, 'perfil'),
(14, 'usuario'),
(15, 'modulo'),
(16, 'usuariomodulo'),
(17, 'usuariopermiso'),
(18, 'empleado'),
(19, 'materia'),
(20, 'producto'),
(21, 'lote'),
(22, 'maquina'),
(23, 'gastoadmin'),
(24, 'inventariomateria'),
(25, 'inventarioproducto'),
(26, 'inventariomaquina'),
(27, 'movimientomateria'),
(28, 'movimientoproducto'),
(29, 'movimientomaquina'),
(30, 'receta'),
(31, 'recetamateria'),
(32, 'recetamanodeobra'),
(33, 'recetadepreciacion'),
(34, 'tarifaenergia'),
(35, 'recetaconsumoenergia'),
(36, 'recetaconsumogas'),
(40, 'mesgasto'),
(41, 'gastoadminpormes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`idPerfil`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Operario'),
(3, 'Vendedor'),
(4, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `imagen` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `idUnidadMedida` int(11) DEFAULT NULL,
  `idTipoProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `codigo`, `nombre`, `descripcion`, `imagen`, `idUnidadMedida`, `idTipoProducto`) VALUES
(1, 'P-001', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', '-', 'vistas/img/productos/P-001/290.jpg', 3, 1),
(2, 'P-002', 'CHOCOLATE CATICAO DE LECHE 38% CON PECANAS', '-', 'vistas/img/productos/P-002/597.jpg', 3, 1),
(3, 'P-003', 'CHOCOLATE CATICAO SEMIDULCE 70% CON NIBS DE CACAO', '-', 'vistas/img/productos/P-003/101.jpg', 3, 1),
(4, 'P-004', 'CHOCOLATE CATICAO DARK 99% Y STEVIA CON AGUAYMANTO', '-', 'vistas/img/productos/P-004/456.jpg', 3, 1),
(5, 'P-005', 'CHOCOLATE INSTANTÁNEO CATICAO 100% CACAO EN POLVO', '-', 'vistas/img/productos/P-005/542.jpg', 3, 1),
(6, 'P-006', 'CHOCOLATE CATICAO SEMIDULCE 70% CON CAÑIHUA', '-', 'vistas/img/productos/P-006/593.jpg', 3, 1),
(7, 'P-007', 'NIBS DE CACAO CATICAO', '-', 'vistas/img/productos/P-007/959.png', 3, 1),
(8, 'P-008', 'CHOCOLATE CATICAO DE LECHE 60% CACAO CON CASTAÑAS ', '-', 'vistas/img/productos/P-008/213.jpg', 3, 1),
(10, 'P-0010', 'CHOCOLATE CATICAO SEMIDULCE 70% CON ARÁNDANOS', '-', 'vistas/img/productos/P-0010/217.jpg', 3, 1),
(11, 'P-0011', 'CHOCOLATE CATICAO SEMIDULCE 70% CON MANGO', '-', 'vistas/img/productos/P-0011/564.jpg', 3, 1),
(12, 'P-0012', 'CHOCOLATE CATICAO DARK 99% Y STEVIA CON ARÁNDANOS', '-', 'vistas/img/productos/P-0012/950.jpg', 3, 1),
(13, 'P-0013', 'CHOCOLATE CATICAO SEMIDULCE 70% CON KIWICHA', '-', 'vistas/img/productos/P-0013/947.jpg', 3, 1),
(14, 'P-0014', 'CHOCOLATE CATICAO SEMIDULCE 70% CON AGUAYMANTO', '-', 'vistas/img/productos/P-0014/498.jpg', 3, 1),
(15, 'P-0015', 'CHOCOLATE CATICAO DE QUINUA CON 70% DE CACAO', '-', 'vistas/img/productos/P-0015/731.jpg', 3, 1),
(16, 'P-0016', 'CHOCOLATE CATICAO A LA TAZA 100% CACAO', '-', 'vistas/img/productos/P-0016/853.jpg', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `idReceta` int(11) NOT NULL,
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
  `cerrado` int(11) DEFAULT NULL,
  `agregadoAdicional` int(11) DEFAULT NULL,
  `ocultoAdicional` int(11) DEFAULT NULL,
  `cantidadTabletas` int(11) DEFAULT NULL,
  `costoTotal` decimal(10,2) DEFAULT NULL,
  `costoPorTableta` decimal(10,2) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`idReceta`, `codigo`, `nombre`, `batch`, `fechaInicio`, `fechaFin`, `pesoPorTableta`, `pesoEnTableta`, `merma`, `reproceso`, `codigoLote`, `cerrado`, `agregadoAdicional`, `ocultoAdicional`, `cantidadTabletas`, `costoTotal`, `costoPorTableta`, `idEstado`) VALUES
(2, 'CHPASAS-60-00001', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', 1.40, '2023-05-08', '2023-05-09', 35.00, 0.03, 0.01, 2.00, '1', 1, 1, 1, 40, 330.94, 8.27, 3),
(3, 'CHPASAS-60-00002', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', 1.40, '2023-05-09', '2023-05-10', 35.00, 0.03, 0.01, 2.00, '2', 1, 1, 1, 40, 330.94, 8.27, 3),
(4, 'CHPASAS-60-00003', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', 1.40, '2023-05-10', '2023-05-11', 35.00, 0.03, 0.01, 2.00, '3', 1, 1, 1, 40, 344.69, 8.62, 3),
(5, 'CHPASAS-60-00004', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', 1.40, '2023-05-15', '2023-05-16', 35.00, 0.03, 0.01, 2.00, '4', 1, 1, 1, 40, 344.69, 8.62, 3),
(6, 'CHTAZA-100-00001', 'CHOCOLATE CATICAO A LA TAZA 100% CACAO', 1.40, '2023-05-01', '2023-05-01', 35.00, 0.03, 0.01, 2.00, '5', 1, 1, 1, 40, 317.86, 7.95, 3),
(7, 'CHARANDANOS-70-00001', 'CHOCOLATE CATICAO SEMIDULCE 70% CON ARÁNDANOS', 1.40, '2023-05-11', '2023-05-12', 35.00, 0.03, 0.01, 2.00, '6', 1, 1, 1, 40, 346.51, 8.66, 3),
(8, 'CHARANDANOS-70-00002', 'CHOCOLATE CATICAO SEMIDULCE 70% CON ARÁNDANOS', 1.40, '2023-05-12', '2023-05-15', 35.00, 0.03, 0.01, 2.00, '7', 1, 1, 1, 40, 346.51, 8.66, 3),
(9, 'CHTAZA-100-00002', 'CHOCOLATE CATICAO A LA TAZA 100% CACAO', 1.40, '2023-05-02', '2023-05-02', 35.00, 0.03, 0.01, 2.00, '8', 1, 1, 1, 40, 317.86, 7.95, 3),
(10, 'CHTAZA-100-00003', 'CHOCOLATE CATICAO A LA TAZA 100% CACAO', 1.40, '2023-05-03', '2023-05-03', 35.00, 0.03, 0.01, 2.00, '9', 1, 1, 1, 40, 317.86, 7.95, 3),
(11, 'CHAGUAYMANT-99-00001', 'CHOCOLATE CATICAO DARK 99% Y STEVIA CON AGUAYMANTO', 1.40, '2023-05-22', '2023-05-23', 35.00, 0.03, 0.01, 2.00, '10', 1, 1, 1, 40, 339.65, 8.49, 3),
(12, 'CHTAZA-100-00004', 'CHOCOLATE CATICAO A LA TAZA 100% CACAO', 1.40, '2023-05-04', '2023-05-04', 35.00, 0.03, 0.01, 2.00, '11', 1, 1, 1, 40, 317.86, 7.95, 3),
(13, 'CHTAZA-100-00005', 'CHOCOLATE CATICAO A LA TAZA 100% CACAO', 1.40, '2023-05-05', '2023-05-05', 35.00, 0.03, 0.01, 2.00, '12', 1, 1, 1, 40, 317.86, 7.95, 3),
(14, 'CHKIWICHA-70-00001', 'CHOCOLATE CATICAO SEMIDULCE 70% CON KIWICHA', 1.40, '2023-05-18', '2023-05-19', 35.00, 0.03, 0.01, 2.00, '13', 1, 1, 1, 40, 343.72, 8.59, 3),
(15, 'CHKIWICHA-70-00002', 'CHOCOLATE CATICAO SEMIDULCE 70% CON KIWICHA', 1.40, '2023-05-19', '2023-05-20', 35.00, 0.03, 0.01, 2.00, '14', 1, 1, 1, 40, 343.72, 8.59, 3),
(16, 'CHARANDANOS-99-00001', 'CHOCOLATE CATICAO DARK 99% Y STEVIA CON ARÁNDANOS', 1.40, '2023-05-26', '2023-05-26', 35.00, 0.03, 0.01, 2.00, '15', 1, 1, 1, 40, 346.51, 8.66, 3),
(17, 'CHARANDANOS-99-00002', 'CHOCOLATE CATICAO DARK 99% Y STEVIA CON ARÁNDANOS-', 1.40, '2023-05-29', '2023-05-29', 35.00, 0.03, 0.01, 2.00, '16', 1, 1, 1, 40, 346.51, 8.66, 3),
(18, 'CHAGUAYMANT-99-00002', 'CHOCOLATE CATICAO DARK 99% Y STEVIA CON AGUAYMANTO', 1.40, '2023-05-23', '2023-05-24', 35.00, 0.03, 0.01, 2.00, '17', 1, 1, 1, 40, 339.65, 8.49, 3),
(19, 'CHQUINUA-70-00001', 'CHOCOLATE CATICAO DE QUINUA CON 70% DE CACAO', 1.40, '2023-05-30', '2023-05-31', 35.00, 0.03, 0.01, 2.00, '18', 1, 1, 1, 40, 336.90, 8.42, 3),
(20, 'CHQUINUA-70-00002', 'CHOCOLATE CATICAO DE QUINUA CON 70% DE CACAO-Dupli', 1.40, '2023-05-31', '2023-06-01', 35.00, 0.03, 0.01, 2.00, '19', 1, 1, 1, 40, 336.90, 8.42, 3),
(21, 'CHMANGO-70-00001', 'CHOCOLATE CATICAO SEMIDULCE 70% CON MANGO', 1.40, '2023-06-01', '2023-06-02', 35.00, 0.03, 0.01, 2.00, '20', 1, 1, 1, 40, 355.84, 8.90, 3),
(22, 'CHMANGO-70-00002', 'CHOCOLATE CATICAO SEMIDULCE 70% CON MANGO', 1.40, '2023-06-02', '2023-06-05', 35.00, 0.03, 0.01, 2.00, '21', 1, 1, 1, 40, 355.84, 8.90, 3),
(23, 'CHMANGO-70-00003', 'CHOCOLATE CATICAO SEMIDULCE 70% CON MANGO', 1.40, '2023-06-05', '2023-06-06', 35.00, 0.03, 0.01, 2.00, '22', 1, 1, 1, 40, 355.84, 8.90, 3),
(24, 'CHMANGO-70-00004', 'CHOCOLATE CATICAO SEMIDULCE 70% CON MANGO', 1.40, '2023-06-06', '2023-06-07', 35.00, 0.03, 0.01, 2.00, '23', 1, 1, 1, 40, 355.84, 8.90, 3),
(25, 'CHCAÑIHUA-70-00001', 'CHOCOLATE CATICAO SEMIDULCE 70% CON CAÑIHUA', 1.40, '2023-06-07', '2023-06-08', 35.00, 0.03, 0.01, 2.00, '24', 1, 1, 1, 40, 372.83, 9.32, 3),
(26, 'CHCAÑIHUA-70-00002', 'CHOCOLATE CATICAO SEMIDULCE 70% CON CAÑIHUA', 1.40, '2023-06-08', '2023-06-09', 35.00, 0.03, 0.01, 2.00, '25', 1, 1, 1, 40, 372.83, 9.32, 3),
(27, 'CHCAÑIHUA-70-00003', 'CHOCOLATE CATICAO SEMIDULCE 70% CON CAÑIHUA', 1.40, '2023-06-09', '2023-06-12', 35.00, 0.03, 0.01, 2.00, '26', 1, 1, 1, 40, 372.83, 9.32, 3),
(28, 'CHCAÑIHUA-70-00004', 'CHOCOLATE CATICAO SEMIDULCE 70% CON CAÑIHUA', 1.40, '2023-06-12', '2023-06-13', 35.00, 0.03, 0.01, 2.00, '27', 1, 1, 1, 40, 372.83, 9.32, 3),
(29, 'CHAGUAYMANT-70-00001', 'CHOCOLATE CATICAO SEMIDULCE 70% CON AGUAYMANTO', 1.40, '2023-06-13', '2023-06-14', 35.00, 0.03, 0.01, 2.00, '28', 1, 1, 1, 40, 363.21, 9.08, 3),
(30, 'CHAGUAYMANT-70-00002', 'CHOCOLATE CATICAO SEMIDULCE 70% CON AGUAYMANTO', 1.40, '2023-06-14', '2023-06-15', 35.00, 0.03, 0.01, 2.00, '29', 1, 1, 1, 40, 363.21, 9.08, 3),
(31, 'CHAGUAYMANT-70-00003', 'CHOCOLATE CATICAO SEMIDULCE 70% CON AGUAYMANTO', 1.40, '2023-06-15', '2023-06-16', 35.00, 0.03, 0.01, 2.00, '30', 1, 1, 1, 40, 363.21, 9.08, 3),
(32, 'CHAGUAYMANT-70-00004', 'CHOCOLATE CATICAO SEMIDULCE 70% CON AGUAYMANTO', 1.40, '2023-06-16', '2023-06-19', 35.00, 0.03, 0.01, 2.00, '31', 1, 1, 1, 40, 363.21, 9.08, 3),
(33, 'CHPASAS-60-00005', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', 1.40, '2023-06-19', '2023-06-20', 35.00, 0.03, 0.01, 2.00, '32', 1, 1, 1, 40, 368.25, 9.21, 3),
(34, 'CHPASAS-60-00006', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', 1.40, '2023-06-20', '2023-06-11', 35.00, 0.03, 0.01, 2.00, '33', 1, 1, 1, 40, 368.25, 9.21, 3),
(35, 'CHPASAS-60-00007', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', 1.40, '2023-06-21', '2023-06-22', 35.00, 0.03, 0.01, 2.00, '34', 1, 1, 1, 40, 368.25, 9.21, 3),
(36, 'CHPASAS-60-00008', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', 1.40, '2023-06-22', '2023-06-23', 35.00, 0.03, 0.01, 2.00, '35', 1, 1, 1, 40, 368.25, 9.21, 3),
(37, 'CHTAZA-100-00006', 'CHOCOLATE CATICAO A LA TAZA 100% CACAO', 1.40, '2023-06-23', '2023-06-26', 35.00, 0.03, 0.01, 2.00, '36', 1, 1, 1, 40, 355.98, 8.90, 3),
(38, 'CHTAZA-100-00007', 'CHOCOLATE CATICAO A LA TAZA 100% CACAO', 1.40, '2023-06-26', '2023-06-26', 35.00, 0.03, 0.01, 2.00, '37', 1, 1, 1, 40, 321.02, 8.03, 3),
(39, 'CHTAZA-100-00008', 'CHOCOLATE CATICAO A LA TAZA 100% CACAO', 1.40, '2023-06-27', '2023-06-28', 35.00, 0.03, 0.01, 2.00, '38', 1, 1, 1, 40, 321.02, 8.03, 3),
(40, 'CHTAZA-100-00009', 'CHOCOLATE CATICAO A LA TAZA 100% CACAO', 1.40, '2023-06-28', '2023-06-29', 35.00, 0.03, 0.01, 2.00, '39', 1, 1, 1, 40, 321.02, 8.03, 3),
(41, 'CHNIBS-70-00001', 'CHOCOLATE CATICAO SEMIDULCE 70% CON NIBS DE CACAO', 1.40, '2023-07-04', '2023-07-05', 35.00, 0.03, 0.01, 2.00, '40', 1, 1, 1, 40, 433.39, 10.83, 3),
(42, 'CHNIBS-70-00002', 'CHOCOLATE CATICAO SEMIDULCE 70% CON NIBS DE CACAO', 1.40, '2023-07-05', '2023-07-06', 35.00, 0.03, 0.01, 2.00, '41', 1, 1, 1, 40, 433.39, 10.83, 3),
(43, 'CHNIBS-70-00003', 'CHOCOLATE CATICAO SEMIDULCE 70% CON NIBS DE CACAO', 1.40, '2023-07-06', '2023-07-07', 35.00, 0.03, 0.01, 2.00, '42', 1, 1, 1, 40, 433.39, 10.83, 3),
(44, 'CHNIBS-70-00004', 'CHOCOLATE CATICAO SEMIDULCE 70% CON NIBS DE CACAO', 1.40, '2023-07-07', '2023-07-10', 35.00, 0.03, 0.01, 2.00, '43', 1, 1, 1, 40, 433.39, 10.83, 3),
(45, 'CHPOLVO-100-00001', 'CHOCOLATE INSTANTÁNEO CATICAO 100% CACAO EN POLVO', 1.40, '2023-07-10', '2023-07-11', 35.00, 0.03, 0.01, 2.00, '44', 1, 1, 1, 40, 433.39, 10.83, 3),
(46, 'CHPOLVO-100-00002', 'CHOCOLATE INSTANTÁNEO CATICAO 100% CACAO EN POLVO-', 1.40, '2023-07-11', '2023-07-12', 35.00, 0.03, 0.01, 2.00, '45', 1, 1, 1, 40, 433.39, 10.83, 3),
(47, 'CHPOLVO-100-00003', 'CHOCOLATE INSTANTÁNEO CATICAO 100% CACAO EN POLVO', 1.40, '2023-07-12', '2023-07-13', 35.00, 0.03, 0.01, 2.00, '46', 1, 1, 1, 40, 433.39, 10.83, 3),
(48, 'CHPOLVO-100-00004', 'CHOCOLATE INSTANTÁNEO CATICAO 100% CACAO EN POLVO', 1.40, '2023-07-13', '2023-07-14', 35.00, 0.03, 0.01, 2.00, '47', 1, 1, 1, 40, 433.39, 10.83, 3),
(49, 'CHQUINUA-70-00003', 'CHOCOLATE CATICAO DE QUINUA CON 70% DE CACAO', 1.40, '2023-07-19', '2023-07-20', 35.00, 0.03, 0.01, 2.00, '48', 1, 1, 1, 40, 433.39, 10.83, 3),
(50, 'CHQUINUA-70-00004', 'CHOCOLATE INSTANTÁNEO CATICAO 100% CACAO EN POLVO', 1.40, '2023-07-20', '2023-07-21', 35.00, 0.03, 0.01, 2.00, '49', 1, 1, 1, 40, 433.39, 10.83, 3),
(51, 'CHAGUAYMANT-99-00003', 'CHOCOLATE CATICAO DARK 99% Y STEVIA CON AGUAYMANTO', 1.40, '2023-07-21', '2023-07-24', 35.00, 0.03, 0.01, 2.00, '50', 1, 1, 1, 40, 488.12, 12.20, 3),
(52, 'CHAGUAYMANT-99-00004', 'CHOCOLATE CATICAO DARK 99% Y STEVIA CON AGUAYMANTO', 1.40, '2023-07-25', '2023-07-26', 35.00, 0.03, 0.01, 2.00, '51', 1, 1, 1, 40, 433.39, 10.83, 3),
(53, 'CHAGUAYMANT-99-00005', 'CHOCOLATE CATICAO DARK 99% Y STEVIA CON AGUAYMANTO', 1.40, '2023-07-26', '2023-07-27', 35.00, 0.03, 0.01, 2.00, '52', 1, 1, 1, 40, 433.39, 10.83, 3),
(54, 'CHAGUAYMANT-99-00006', 'CHOCOLATE CATICAO DARK 99% Y STEVIA CON AGUAYMANTO', 1.40, '2023-07-27', '2023-07-28', 35.00, 0.03, 0.01, 2.00, '53', 1, 1, 1, 40, 433.39, 10.83, 3),
(55, 'CHCASTAÑAS-60-00001', 'CHOCOLATE CATICAO DE LECHE 60% CON CASTAÑAS', 1.40, '2023-05-16', '2023-05-16', 35.00, 0.03, 0.01, 2.00, '54', 1, 1, 1, 40, 314.40, 7.86, 3),
(56, 'CHARANDANOS-70-00003', 'CHOCOLATE CATICAO SEMIDULCE 70% CON ARÁNDANOS', 1.40, '2023-08-01', '2023-08-02', 35.00, 0.03, 0.01, 2.00, '55', 1, 1, 1, 40, 112.54, 2.81, 3),
(57, 'CHCASTAÑAS-60-00002', 'CHOCOLATE CATICAO DE LECHE 60% CON CASTAÑAS', 1.40, '2023-05-17', '2023-05-17', 35.00, 0.03, 0.01, 2.00, '56', 1, 1, 1, 40, 314.40, 7.86, 3),
(58, 'CHARANDANOS-70-00004', 'CHOCOLATE CATICAO SEMIDULCE 70% CON ARÁNDANOS', 1.40, '2023-08-02', '2023-08-03', 35.00, 0.03, 0.01, 2.00, '57', 1, 1, 1, 40, 96.05, 2.40, 3),
(59, 'CHARANDANOS-70-00005', 'CHOCOLATE CATICAO SEMIDULCE 70% CON ARÁNDANOS', 1.40, '2023-08-03', '2023-08-04', 35.00, 0.03, 0.01, 2.00, '58', 1, 1, 1, 40, 112.54, 2.81, 3),
(60, 'CHARANDANOS-70-00006', 'CHOCOLATE CATICAO SEMIDULCE 70% CON ARÁNDANOS', 1.40, '2023-08-04', '2023-08-07', 35.00, 0.03, 0.01, 2.00, '59', 1, 1, 1, 40, 112.54, 2.81, 3),
(61, 'CHCASTAÑAS-60-00003', 'CHOCOLATE CATICAO DE LECHE 60% CACAO CON CASTAÑAS', 1.40, '2023-08-09', '2023-08-10', 35.00, 0.03, 0.01, 2.00, '60', 1, 0, 0, 40, 115.05, 2.88, 3),
(62, 'CHCASTAÑAS-60-00004', 'CHOCOLATE CATICAO DE LECHE 60% CACAO CON CASTAÑAS', 1.40, '2023-08-10', '2023-08-11', 35.00, 0.03, 0.01, 2.00, '61', 1, 0, 0, 40, 71.05, 1.78, 3),
(63, 'CHPASAS-60-00009', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', 1.40, '2023-08-14', '2023-08-15', 35.00, 0.03, 0.01, 2.00, '62', 1, 0, 0, 40, 71.05, 1.78, 3),
(64, 'CHPASAS-60-00010', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', 1.40, '2023-08-15', '2023-08-16', 35.00, 0.03, 0.01, 2.00, '63', 1, 0, 0, 40, 71.05, 1.78, 3),
(65, 'CHPASAS-60-00011', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', 1.40, '2023-08-16', '2023-08-17', 35.00, 0.03, 0.01, 2.00, '64', 1, 0, 0, 40, 71.05, 1.78, 3),
(66, 'CHPASAS-60-00012', 'CHOCOLATE CATICAO DE LECHE 60% CON PASAS', 1.40, '2023-08-17', '2023-08-18', 35.00, 0.03, 0.01, 2.00, '65', 1, 0, 0, 40, 85.72, 2.14, 3),
(67, 'CHCAÑIHUA-70-00005', 'CHOCOLATE CATICAO SEMIDULCE 70% CON CAÑIHUA', 1.40, '2023-08-18', '2023-08-21', 35.00, 0.03, 0.01, 2.00, '66', 1, 0, 0, 40, 90.30, 2.26, 3),
(68, 'CHCAÑIHUA-70-00006', 'CHOCOLATE CATICAO SEMIDULCE 70% CON CAÑIHUA', 1.40, '2023-08-21', '2023-08-22', 35.00, 0.03, 0.01, 2.00, '67', 1, 0, 0, 40, 90.30, 2.26, 3),
(69, 'CHCAÑIHUA-70-00007', 'CHOCOLATE CATICAO SEMIDULCE 70% CON CAÑIHUA', 1.40, '2023-08-22', '2023-08-23', 35.00, 0.03, 0.01, 2.00, '68', 1, 0, 0, 40, 90.30, 2.26, 3),
(70, 'CHMANGO-70-00005', 'CHOCOLATE CATICAO SEMIDULCE 70% CON MANGO', 1.40, '2023-08-23', '2023-08-24', 35.00, 0.03, 0.01, 2.00, '69', 1, 0, 0, 40, 73.31, 1.83, 3),
(71, 'CHMANGO-70-00006', 'CHOCOLATE CATICAO SEMIDULCE 70% CON MANGO', 1.40, '2023-08-24', '2023-08-24', 35.00, 0.03, 0.01, 2.00, '70', 1, 0, 0, 40, 73.31, 1.83, 3),
(72, 'PCHPECANAS-38-00001', 'CHOCOLATE CATICAO DE LECHE 38% CON PECANAS', 1.40, '2023-08-11', '2023-08-14', 35.00, 0.03, 0.01, 2.00, '71', 1, 0, 0, 40, 136.83, 3.42, 3),
(73, 'PCHPECANAS-38-00002', 'CHOCOLATE CATICAO DE LECHE 38% CON PECANAS', 1.40, '2023-08-17', '2023-08-18', 35.00, 0.03, 0.01, 2.00, '72', 1, 0, 0, 40, 136.83, 3.42, 3),
(74, 'PCHPECANAS-38-00003', 'CHOCOLATE CATICAO DE LECHE 38% CON PECANAS', 1.40, '2023-08-18', '2023-08-21', 35.00, 0.03, 0.01, 2.00, '73', 1, 0, 0, 40, 136.83, 3.42, 3),
(75, 'PCHPECANAS-38-00004', 'CHOCOLATE CATICAO DE LECHE 38% CON PECANAS', 1.40, '2023-08-18', '2023-08-21', 35.00, 0.03, 0.01, 2.00, '74', 1, 0, 0, 40, 136.83, 3.42, 3),
(76, 'RC002023', 'CHOCOLATE CATICAO DE LECHE 38% CON PECANAS-Duplica', 1.40, '2023-08-18', '2023-10-21', 35.00, 0.03, 0.01, 2.00, '65868', 1, 0, 0, 40, 136.83, 3.42, 3),
(77, 'EC020231', 'CHOCOLATE CATICAO DE LECHE 38% CON PECANAS-Duplica', 1.40, '2023-08-18', '2023-11-16', 35.00, 0.03, 0.01, 2.00, '98649', 1, 0, 0, 40, 136.83, 3.42, 3),
(78, '11111111', 'CHOCOLATE CATICAO DE LECHE 38% CON PECANAS-Duplica-Duplicado', 1.40, '2023-08-18', '2023-11-16', 35.00, 0.03, 0.01, 2.00, '24145', 0, 0, 0, 40, 136.83, 3.42, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetaconsumoenergia`
--

CREATE TABLE `recetaconsumoenergia` (
  `idRecetaConsumoEnergia` int(11) NOT NULL,
  `nombreMaquina` varchar(50) DEFAULT NULL,
  `potenciaKw` decimal(10,2) DEFAULT NULL,
  `horasTrabajoBatch` decimal(10,2) DEFAULT NULL,
  `consumoKwh` decimal(10,2) DEFAULT NULL,
  `tarifaKwh` decimal(10,2) DEFAULT NULL,
  `pagoPorBatch` decimal(10,2) DEFAULT NULL,
  `idTarifaEnergia` int(11) DEFAULT NULL,
  `idMaquina` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetaconsumoenergia`
--

INSERT INTO `recetaconsumoenergia` (`idRecetaConsumoEnergia`, `nombreMaquina`, `potenciaKw`, `horasTrabajoBatch`, `consumoKwh`, `tarifaKwh`, `pagoPorBatch`, `idTarifaEnergia`, `idMaquina`, `idReceta`) VALUES
(3, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 2),
(4, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 2),
(5, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 2),
(6, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 2),
(7, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 2),
(9, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 2),
(10, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 3),
(11, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 3),
(12, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 3),
(13, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 3),
(14, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 3),
(15, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 3),
(17, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 4),
(18, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 4),
(19, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 4),
(20, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 4),
(21, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 4),
(22, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 4),
(24, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 5),
(25, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 5),
(26, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 5),
(27, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 5),
(28, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 5),
(29, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 5),
(31, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 6),
(32, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 6),
(33, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 6),
(34, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 6),
(35, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 6),
(36, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 6),
(38, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 7),
(39, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 7),
(40, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 7),
(41, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 7),
(42, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 7),
(43, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 7),
(45, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 8),
(46, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 8),
(47, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 8),
(48, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 8),
(49, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 8),
(50, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 8),
(52, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 9),
(53, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 9),
(54, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 9),
(55, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 9),
(56, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 9),
(57, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 9),
(59, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 10),
(60, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 10),
(61, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 10),
(62, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 10),
(63, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 10),
(64, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 10),
(66, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 11),
(67, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 11),
(68, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 11),
(69, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 11),
(70, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 11),
(71, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 11),
(73, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 12),
(74, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 12),
(75, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 12),
(76, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 12),
(77, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 12),
(78, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 12),
(80, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 13),
(81, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 13),
(82, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 13),
(83, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 13),
(84, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 13),
(85, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 13),
(87, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 14),
(88, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 14),
(89, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 14),
(90, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 14),
(91, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 14),
(92, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 14),
(94, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 15),
(95, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 15),
(96, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 15),
(97, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 15),
(98, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 15),
(99, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 15),
(101, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 16),
(102, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 16),
(103, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 16),
(104, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 16),
(105, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 16),
(106, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 16),
(108, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 17),
(109, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 17),
(110, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 17),
(111, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 17),
(112, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 17),
(113, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 17),
(115, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 18),
(116, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 18),
(117, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 18),
(118, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 18),
(119, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 18),
(120, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 18),
(122, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 19),
(123, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 19),
(124, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 19),
(125, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 19),
(126, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 19),
(127, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 19),
(129, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 20),
(130, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 20),
(131, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 20),
(132, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 20),
(133, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 20),
(134, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 20),
(136, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 21),
(137, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 21),
(138, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 21),
(139, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 21),
(140, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 21),
(141, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 21),
(143, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 22),
(144, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 22),
(145, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 22),
(146, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 22),
(147, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 22),
(148, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 22),
(150, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 23),
(151, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 23),
(152, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 23),
(153, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 23),
(154, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 23),
(155, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 23),
(157, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 24),
(158, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 24),
(159, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 24),
(160, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 24),
(161, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 24),
(162, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 24),
(164, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 25),
(165, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 25),
(166, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 25),
(167, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 25),
(168, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 25),
(169, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 25),
(171, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 26),
(172, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 26),
(173, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 26),
(174, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 26),
(175, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 26),
(176, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 26),
(178, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 27),
(179, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 27),
(180, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 27),
(181, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 27),
(182, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 27),
(183, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 27),
(185, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 28),
(186, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 28),
(187, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 28),
(188, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 28),
(189, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 28),
(190, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 28),
(192, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 29),
(193, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 29),
(194, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 29),
(195, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 29),
(196, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 29),
(197, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 29),
(199, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 30),
(200, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 30),
(201, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 30),
(202, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 30),
(203, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 30),
(204, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 30),
(206, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 31),
(207, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 31),
(208, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 31),
(209, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 31),
(210, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 31),
(211, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 31),
(213, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 32),
(214, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 32),
(215, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 32),
(216, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 32),
(217, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 32),
(218, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 32),
(220, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 33),
(221, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 33),
(222, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 33),
(223, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 33),
(224, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 33),
(225, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 33),
(227, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 34),
(228, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 34),
(229, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 34),
(230, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 34),
(231, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 34),
(232, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 34),
(234, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 35),
(235, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 35),
(236, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 35),
(237, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 35),
(238, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 35),
(239, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 35),
(241, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 36),
(242, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 36),
(243, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 36),
(244, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 36),
(245, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 36),
(246, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 36),
(248, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 37),
(249, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 37),
(250, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 37),
(251, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 37),
(252, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 37),
(253, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 37),
(255, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 38),
(256, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 38),
(257, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 38),
(258, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 38),
(259, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 38),
(260, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 38),
(262, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 39),
(263, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 39),
(264, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 39),
(265, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 39),
(266, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 39),
(267, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 39),
(269, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 40),
(270, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 40),
(271, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 40),
(272, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 40),
(273, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 40),
(274, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 40),
(276, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 41),
(277, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 41),
(278, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 41),
(279, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 41),
(280, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 41),
(281, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 41),
(283, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 42),
(284, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 42),
(285, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 42),
(286, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 42),
(287, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 42),
(288, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 42),
(290, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 43),
(291, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 43),
(292, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 43),
(293, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 43),
(294, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 43),
(295, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 43),
(297, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 44),
(298, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 44),
(299, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 44),
(300, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 44),
(301, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 44),
(302, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 44),
(311, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 45),
(312, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 45),
(313, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 45),
(314, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 45),
(315, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 45),
(316, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 45),
(318, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 46),
(319, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 46),
(320, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 46),
(321, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 46),
(322, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 46),
(323, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 46),
(325, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 47),
(326, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 47),
(327, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 47),
(328, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 47),
(329, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 47),
(330, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 47),
(332, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 48),
(333, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 48),
(334, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 48),
(335, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 48),
(336, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 48),
(337, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 48),
(346, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 49),
(347, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 49),
(348, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 49),
(349, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 49),
(350, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 49),
(351, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 49),
(353, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 50),
(354, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 50),
(355, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 50),
(356, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 50),
(357, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 50),
(358, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 50),
(367, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 51),
(368, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 51),
(369, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 51),
(370, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 51),
(371, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 51),
(372, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 51),
(374, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 52),
(375, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 52),
(376, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 52),
(377, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 52),
(378, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 52),
(379, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 52),
(381, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 53),
(382, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 53),
(383, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 53),
(384, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 53),
(385, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 53),
(386, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 53),
(388, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 54),
(389, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 54),
(390, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 54),
(391, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 54),
(392, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 54),
(393, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 54),
(395, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 55),
(396, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 55),
(397, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 55),
(398, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 55),
(399, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 55),
(400, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 55),
(402, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 56),
(403, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 56),
(404, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 56),
(405, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 56),
(406, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 56),
(407, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 56),
(409, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 57),
(410, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 57),
(411, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 57),
(412, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 57),
(413, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 57),
(414, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 57),
(416, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 58),
(417, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 58),
(418, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 58),
(419, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 58),
(420, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 58),
(421, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 58),
(423, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 59),
(424, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 59),
(425, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 59),
(426, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 59),
(427, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 59),
(428, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 59),
(430, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 60),
(431, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 60),
(432, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 60),
(433, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 60),
(434, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 60),
(435, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 60),
(444, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 61),
(445, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 61),
(446, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 61),
(447, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 61),
(448, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 61),
(449, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 61),
(451, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 62),
(452, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 62),
(453, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 62),
(454, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 62),
(455, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 62),
(456, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 62),
(458, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 63),
(459, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 63),
(460, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 63),
(461, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 63),
(462, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 63),
(463, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 63),
(465, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 64),
(466, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 64),
(467, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 64),
(468, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 64),
(469, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 64),
(470, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 64),
(472, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 65),
(473, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 65),
(474, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 65),
(475, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 65),
(476, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 65),
(477, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 65),
(479, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 66),
(480, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 66),
(481, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 66),
(482, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 66),
(483, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 66),
(484, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 66),
(486, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 67),
(487, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 67),
(488, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 67),
(489, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 67),
(490, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 67),
(491, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 67),
(493, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 68),
(494, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 68),
(495, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 68),
(496, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 68),
(497, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 68),
(498, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 68),
(500, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 69),
(501, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 69),
(502, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 69),
(503, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 69),
(504, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 69),
(505, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 69),
(507, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 70),
(508, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 70),
(509, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 70),
(510, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 70),
(511, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 70),
(512, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 70),
(514, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 71),
(515, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 71),
(516, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 71),
(517, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 71),
(518, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 71),
(519, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 71),
(521, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 72),
(522, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 72),
(523, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 72),
(524, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 72),
(525, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 72),
(526, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 72),
(528, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 73),
(529, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 73),
(530, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 73),
(531, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 73),
(532, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 73),
(533, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 73),
(535, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 74),
(536, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 74),
(537, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 74),
(538, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 74),
(539, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 74),
(540, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 74),
(542, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 75),
(543, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 75),
(544, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 75),
(545, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 75),
(546, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 75),
(547, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 75),
(554, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 76),
(555, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 76),
(556, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 76),
(557, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 76),
(558, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 76),
(559, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 76),
(561, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 77),
(562, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 77),
(563, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 77),
(564, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 77),
(565, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 77),
(566, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 77),
(567, 'SELECCIONADORA', 0.75, 0.30, 0.22, 0.72, 0.16, 1, 1, 78),
(568, 'TOSTADORA', 0.75, 0.20, 0.15, 0.72, 0.11, 1, 2, 78),
(569, 'SELLADORA', 0.56, 0.18, 0.10, 0.72, 0.07, 1, 9, 78),
(570, 'DESCASCARILLADORA', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 4, 78),
(571, 'MOLINOS DE PIEDRA', 2.24, 0.15, 0.34, 0.72, 0.24, 1, 5, 78),
(572, 'CAMARA FRÍO', 1.86, 0.20, 0.37, 0.72, 0.27, 1, 8, 78);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetaconsumogas`
--

CREATE TABLE `recetaconsumogas` (
  `idRecetaConsumoGas` int(11) NOT NULL,
  `nombreMaquina` varchar(50) DEFAULT NULL,
  `trabajoPorBatch` decimal(10,2) DEFAULT NULL,
  `pesoBalonGas` decimal(10,2) DEFAULT NULL,
  `tarifaGas` decimal(10,2) DEFAULT NULL,
  `pagoPorBatch` decimal(10,2) DEFAULT NULL,
  `idMaquina` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetaconsumogas`
--

INSERT INTO `recetaconsumogas` (`idRecetaConsumoGas`, `nombreMaquina`, `trabajoPorBatch`, `pesoBalonGas`, `tarifaGas`, `pagoPorBatch`, `idMaquina`, `idReceta`) VALUES
(2, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 2),
(3, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 3),
(4, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 4),
(5, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 5),
(6, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 6),
(7, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 7),
(8, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 8),
(9, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 9),
(10, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 10),
(11, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 11),
(12, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 12),
(13, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 13),
(14, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 14),
(15, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 15),
(16, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 16),
(17, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 17),
(18, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 18),
(19, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 19),
(20, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 20),
(21, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 21),
(22, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 22),
(23, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 23),
(24, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 24),
(25, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 25),
(26, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 26),
(27, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 27),
(28, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 28),
(29, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 29),
(30, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 30),
(31, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 31),
(32, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 32),
(33, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 33),
(34, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 34),
(35, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 35),
(36, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 36),
(37, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 37),
(38, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 38),
(39, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 39),
(40, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 40),
(41, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 41),
(42, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 42),
(43, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 43),
(44, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 44),
(46, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 45),
(47, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 46),
(48, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 47),
(49, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 48),
(51, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 49),
(52, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 50),
(54, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 51),
(55, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 52),
(56, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 53),
(57, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 54),
(58, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 55),
(59, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 56),
(60, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 57),
(61, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 58),
(62, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 59),
(63, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 60),
(65, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 61),
(66, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 62),
(67, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 63),
(68, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 64),
(69, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 65),
(70, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 66),
(71, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 67),
(72, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 68),
(73, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 69),
(74, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 70),
(75, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 71),
(76, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 72),
(77, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 73),
(78, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 74),
(79, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 75),
(81, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 76),
(82, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 77),
(83, 'BAÑO MARIA', 0.12, 2.00, 3.50, 7.00, 3, 78);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetadepreciacion`
--

CREATE TABLE `recetadepreciacion` (
  `idRecetaDepreciacion` int(11) NOT NULL,
  `nombreMaquina` varchar(50) DEFAULT NULL,
  `depreciacionHora` decimal(10,2) DEFAULT NULL,
  `tiempoHoras` decimal(10,2) DEFAULT NULL,
  `depreciacionPorBatch` decimal(10,2) DEFAULT NULL,
  `idMaquina` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetadepreciacion`
--

INSERT INTO `recetadepreciacion` (`idRecetaDepreciacion`, `nombreMaquina`, `depreciacionHora`, `tiempoHoras`, `depreciacionPorBatch`, `idMaquina`, `idReceta`) VALUES
(3, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 2),
(4, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 2),
(5, 'SELLADORA', 0.29, 0.18, 0.05, 9, 2),
(6, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 2),
(7, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 2),
(9, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 2),
(10, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 2),
(11, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 3),
(12, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 3),
(13, 'SELLADORA', 0.29, 0.18, 0.05, 9, 3),
(14, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 3),
(15, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 3),
(16, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 3),
(17, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 3),
(18, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 4),
(19, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 4),
(20, 'SELLADORA', 0.29, 0.18, 0.05, 9, 4),
(21, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 4),
(22, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 4),
(23, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 4),
(24, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 4),
(25, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 5),
(26, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 5),
(27, 'SELLADORA', 0.29, 0.18, 0.05, 9, 5),
(28, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 5),
(29, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 5),
(30, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 5),
(31, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 5),
(32, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 6),
(33, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 6),
(34, 'SELLADORA', 0.29, 0.18, 0.05, 9, 6),
(35, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 6),
(36, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 6),
(37, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 6),
(38, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 6),
(39, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 7),
(40, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 7),
(41, 'SELLADORA', 0.29, 0.18, 0.05, 9, 7),
(42, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 7),
(43, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 7),
(44, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 7),
(45, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 7),
(46, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 8),
(47, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 8),
(48, 'SELLADORA', 0.29, 0.18, 0.05, 9, 8),
(49, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 8),
(50, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 8),
(51, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 8),
(52, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 8),
(53, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 9),
(54, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 9),
(55, 'SELLADORA', 0.29, 0.18, 0.05, 9, 9),
(56, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 9),
(57, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 9),
(58, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 9),
(59, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 9),
(60, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 10),
(61, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 10),
(62, 'SELLADORA', 0.29, 0.18, 0.05, 9, 10),
(63, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 10),
(64, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 10),
(65, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 10),
(66, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 10),
(67, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 11),
(68, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 11),
(69, 'SELLADORA', 0.29, 0.18, 0.05, 9, 11),
(70, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 11),
(71, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 11),
(72, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 11),
(73, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 11),
(74, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 12),
(75, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 12),
(76, 'SELLADORA', 0.29, 0.18, 0.05, 9, 12),
(77, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 12),
(78, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 12),
(79, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 12),
(80, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 12),
(81, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 13),
(82, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 13),
(83, 'SELLADORA', 0.29, 0.18, 0.05, 9, 13),
(84, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 13),
(85, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 13),
(86, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 13),
(87, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 13),
(88, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 14),
(89, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 14),
(90, 'SELLADORA', 0.29, 0.18, 0.05, 9, 14),
(91, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 14),
(92, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 14),
(93, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 14),
(94, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 14),
(95, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 15),
(96, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 15),
(97, 'SELLADORA', 0.29, 0.18, 0.05, 9, 15),
(98, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 15),
(99, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 15),
(100, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 15),
(101, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 15),
(102, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 16),
(103, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 16),
(104, 'SELLADORA', 0.29, 0.18, 0.05, 9, 16),
(105, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 16),
(106, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 16),
(107, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 16),
(108, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 16),
(109, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 17),
(110, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 17),
(111, 'SELLADORA', 0.29, 0.18, 0.05, 9, 17),
(112, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 17),
(113, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 17),
(114, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 17),
(115, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 17),
(116, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 18),
(117, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 18),
(118, 'SELLADORA', 0.29, 0.18, 0.05, 9, 18),
(119, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 18),
(120, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 18),
(121, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 18),
(122, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 18),
(123, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 19),
(124, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 19),
(125, 'SELLADORA', 0.29, 0.18, 0.05, 9, 19),
(126, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 19),
(127, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 19),
(128, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 19),
(129, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 19),
(130, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 20),
(131, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 20),
(132, 'SELLADORA', 0.29, 0.18, 0.05, 9, 20),
(133, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 20),
(134, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 20),
(135, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 20),
(136, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 20),
(137, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 21),
(138, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 21),
(139, 'SELLADORA', 0.29, 0.18, 0.05, 9, 21),
(140, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 21),
(141, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 21),
(142, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 21),
(143, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 21),
(144, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 22),
(145, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 22),
(146, 'SELLADORA', 0.29, 0.18, 0.05, 9, 22),
(147, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 22),
(148, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 22),
(149, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 22),
(150, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 22),
(151, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 23),
(152, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 23),
(153, 'SELLADORA', 0.29, 0.18, 0.05, 9, 23),
(154, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 23),
(155, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 23),
(156, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 23),
(157, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 23),
(158, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 24),
(159, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 24),
(160, 'SELLADORA', 0.29, 0.18, 0.05, 9, 24),
(161, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 24),
(162, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 24),
(163, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 24),
(164, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 24),
(165, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 25),
(166, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 25),
(167, 'SELLADORA', 0.29, 0.18, 0.05, 9, 25),
(168, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 25),
(169, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 25),
(170, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 25),
(171, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 25),
(172, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 26),
(173, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 26),
(174, 'SELLADORA', 0.29, 0.18, 0.05, 9, 26),
(175, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 26),
(176, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 26),
(177, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 26),
(178, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 26),
(179, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 27),
(180, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 27),
(181, 'SELLADORA', 0.29, 0.18, 0.05, 9, 27),
(182, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 27),
(183, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 27),
(184, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 27),
(185, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 27),
(186, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 28),
(187, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 28),
(188, 'SELLADORA', 0.29, 0.18, 0.05, 9, 28),
(189, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 28),
(190, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 28),
(191, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 28),
(192, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 28),
(193, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 29),
(194, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 29),
(195, 'SELLADORA', 0.29, 0.18, 0.05, 9, 29),
(196, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 29),
(197, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 29),
(198, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 29),
(199, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 29),
(200, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 30),
(201, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 30),
(202, 'SELLADORA', 0.29, 0.18, 0.05, 9, 30),
(203, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 30),
(204, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 30),
(205, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 30),
(206, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 30),
(207, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 31),
(208, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 31),
(209, 'SELLADORA', 0.29, 0.18, 0.05, 9, 31),
(210, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 31),
(211, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 31),
(212, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 31),
(213, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 31),
(214, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 32),
(215, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 32),
(216, 'SELLADORA', 0.29, 0.18, 0.05, 9, 32),
(217, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 32),
(218, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 32),
(219, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 32),
(220, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 32),
(221, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 33),
(222, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 33),
(223, 'SELLADORA', 0.29, 0.18, 0.05, 9, 33),
(224, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 33),
(225, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 33),
(226, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 33),
(227, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 33),
(228, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 34),
(229, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 34),
(230, 'SELLADORA', 0.29, 0.18, 0.05, 9, 34),
(231, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 34),
(232, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 34),
(233, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 34),
(234, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 34),
(235, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 35),
(236, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 35),
(237, 'SELLADORA', 0.29, 0.18, 0.05, 9, 35),
(238, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 35),
(239, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 35),
(240, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 35),
(241, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 35),
(242, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 36),
(243, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 36),
(244, 'SELLADORA', 0.29, 0.18, 0.05, 9, 36),
(245, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 36),
(246, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 36),
(247, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 36),
(248, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 36),
(249, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 37),
(250, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 37),
(251, 'SELLADORA', 0.29, 0.18, 0.05, 9, 37),
(252, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 37),
(253, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 37),
(254, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 37),
(255, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 37),
(256, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 38),
(257, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 38),
(258, 'SELLADORA', 0.29, 0.18, 0.05, 9, 38),
(259, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 38),
(260, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 38),
(261, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 38),
(262, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 38),
(263, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 39),
(264, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 39),
(265, 'SELLADORA', 0.29, 0.18, 0.05, 9, 39),
(266, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 39),
(267, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 39),
(268, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 39),
(269, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 39),
(270, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 40),
(271, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 40),
(272, 'SELLADORA', 0.29, 0.18, 0.05, 9, 40),
(273, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 40),
(274, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 40),
(275, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 40),
(276, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 40),
(277, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 41),
(278, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 41),
(279, 'SELLADORA', 0.29, 0.18, 0.05, 9, 41),
(280, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 41),
(281, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 41),
(282, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 41),
(283, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 41),
(284, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 42),
(285, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 42),
(286, 'SELLADORA', 0.29, 0.18, 0.05, 9, 42),
(287, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 42),
(288, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 42),
(289, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 42),
(290, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 42),
(291, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 43),
(292, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 43),
(293, 'SELLADORA', 0.29, 0.18, 0.05, 9, 43),
(294, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 43),
(295, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 43),
(296, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 43),
(297, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 43),
(298, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 44),
(299, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 44),
(300, 'SELLADORA', 0.29, 0.18, 0.05, 9, 44),
(301, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 44),
(302, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 44),
(303, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 44),
(304, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 44),
(312, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 45),
(313, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 45),
(314, 'SELLADORA', 0.29, 0.18, 0.05, 9, 45),
(315, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 45),
(316, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 45),
(317, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 45),
(318, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 45),
(319, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 46),
(320, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 46),
(321, 'SELLADORA', 0.29, 0.18, 0.05, 9, 46),
(322, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 46),
(323, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 46),
(324, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 46),
(325, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 46),
(326, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 47),
(327, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 47),
(328, 'SELLADORA', 0.29, 0.18, 0.05, 9, 47),
(329, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 47),
(330, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 47),
(331, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 47),
(332, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 47),
(333, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 48),
(334, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 48),
(335, 'SELLADORA', 0.29, 0.18, 0.05, 9, 48),
(336, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 48),
(337, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 48),
(338, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 48),
(339, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 48),
(347, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 49),
(348, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 49),
(349, 'SELLADORA', 0.29, 0.18, 0.05, 9, 49),
(350, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 49),
(351, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 49),
(352, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 49),
(353, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 49),
(354, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 50),
(355, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 50),
(356, 'SELLADORA', 0.29, 0.18, 0.05, 9, 50),
(357, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 50),
(358, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 50),
(359, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 50),
(360, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 50),
(368, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 51),
(369, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 51),
(370, 'SELLADORA', 0.29, 0.18, 0.05, 9, 51),
(371, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 51),
(372, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 51),
(373, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 51),
(374, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 51),
(375, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 52),
(376, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 52),
(377, 'SELLADORA', 0.29, 0.18, 0.05, 9, 52),
(378, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 52),
(379, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 52),
(380, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 52),
(381, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 52),
(382, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 53),
(383, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 53),
(384, 'SELLADORA', 0.29, 0.18, 0.05, 9, 53),
(385, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 53),
(386, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 53),
(387, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 53),
(388, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 53),
(389, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 54),
(390, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 54),
(391, 'SELLADORA', 0.29, 0.18, 0.05, 9, 54),
(392, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 54),
(393, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 54),
(394, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 54),
(395, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 54),
(396, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 55),
(397, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 55),
(398, 'SELLADORA', 0.29, 0.18, 0.05, 9, 55),
(399, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 55),
(400, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 55),
(401, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 55),
(402, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 55),
(403, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 56),
(404, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 56),
(405, 'SELLADORA', 0.29, 0.18, 0.05, 9, 56),
(406, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 56),
(407, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 56),
(408, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 56),
(409, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 56),
(410, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 57),
(411, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 57),
(412, 'SELLADORA', 0.29, 0.18, 0.05, 9, 57),
(413, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 57),
(414, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 57),
(415, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 57),
(416, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 57),
(417, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 58),
(418, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 58),
(419, 'SELLADORA', 0.29, 0.18, 0.05, 9, 58),
(420, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 58),
(421, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 58),
(422, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 58),
(423, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 58),
(424, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 59),
(425, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 59),
(426, 'SELLADORA', 0.29, 0.18, 0.05, 9, 59),
(427, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 59),
(428, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 59),
(429, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 59),
(430, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 59),
(431, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 60),
(432, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 60),
(433, 'SELLADORA', 0.29, 0.18, 0.05, 9, 60),
(434, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 60),
(435, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 60),
(436, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 60),
(437, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 60),
(445, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 61),
(446, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 61),
(447, 'SELLADORA', 0.29, 0.18, 0.05, 9, 61),
(448, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 61),
(449, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 61),
(450, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 61),
(451, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 61),
(452, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 62),
(453, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 62),
(454, 'SELLADORA', 0.29, 0.18, 0.05, 9, 62),
(455, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 62),
(456, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 62),
(457, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 62),
(458, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 62),
(459, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 63),
(460, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 63),
(461, 'SELLADORA', 0.29, 0.18, 0.05, 9, 63),
(462, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 63),
(463, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 63),
(464, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 63),
(465, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 63),
(466, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 64),
(467, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 64),
(468, 'SELLADORA', 0.29, 0.18, 0.05, 9, 64),
(469, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 64),
(470, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 64),
(471, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 64),
(472, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 64),
(473, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 65),
(474, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 65),
(475, 'SELLADORA', 0.29, 0.18, 0.05, 9, 65),
(476, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 65),
(477, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 65),
(478, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 65),
(479, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 65),
(480, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 66),
(481, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 66),
(482, 'SELLADORA', 0.29, 0.18, 0.05, 9, 66),
(483, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 66),
(484, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 66),
(485, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 66),
(486, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 66),
(487, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 67),
(488, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 67),
(489, 'SELLADORA', 0.29, 0.18, 0.05, 9, 67),
(490, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 67),
(491, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 67),
(492, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 67),
(493, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 67),
(494, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 68),
(495, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 68),
(496, 'SELLADORA', 0.29, 0.18, 0.05, 9, 68),
(497, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 68),
(498, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 68),
(499, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 68),
(500, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 68),
(501, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 69),
(502, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 69),
(503, 'SELLADORA', 0.29, 0.18, 0.05, 9, 69),
(504, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 69),
(505, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 69),
(506, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 69),
(507, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 69),
(508, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 70),
(509, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 70),
(510, 'SELLADORA', 0.29, 0.18, 0.05, 9, 70),
(511, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 70),
(512, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 70),
(513, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 70),
(514, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 70),
(515, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 71),
(516, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 71),
(517, 'SELLADORA', 0.29, 0.18, 0.05, 9, 71),
(518, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 71),
(519, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 71),
(520, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 71),
(521, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 71),
(522, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 72),
(523, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 72),
(524, 'SELLADORA', 0.29, 0.18, 0.05, 9, 72),
(525, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 72),
(526, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 72),
(527, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 72),
(528, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 72),
(529, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 73),
(530, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 73),
(531, 'SELLADORA', 0.29, 0.18, 0.05, 9, 73),
(532, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 73),
(533, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 73),
(534, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 73),
(535, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 73),
(536, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 74),
(537, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 74),
(538, 'SELLADORA', 0.29, 0.18, 0.05, 9, 74),
(539, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 74),
(540, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 74),
(541, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 74),
(542, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 74),
(543, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 75),
(544, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 75),
(545, 'SELLADORA', 0.29, 0.18, 0.05, 9, 75),
(546, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 75),
(547, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 75),
(548, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 75),
(549, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 75),
(557, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 76),
(558, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 76),
(559, 'SELLADORA', 0.29, 0.18, 0.05, 9, 76),
(560, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 76),
(561, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 76),
(562, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 76),
(563, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 76),
(564, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 77),
(565, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 77),
(566, 'SELLADORA', 0.29, 0.18, 0.05, 9, 77),
(567, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 77),
(568, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 77),
(569, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 77),
(570, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 77),
(571, 'SELECCIONADORA', 0.22, 0.30, 0.07, 1, 78),
(572, 'TOSTADORA', 0.35, 0.20, 0.07, 2, 78),
(573, 'SELLADORA', 0.29, 0.18, 0.05, 9, 78),
(574, 'DESCASCARILLADORA', 0.39, 0.20, 0.08, 4, 78),
(575, 'MOLINOS DE PIEDRA', 0.50, 0.15, 0.08, 5, 78),
(576, 'CAMARA FRÍO', 0.08, 0.20, 0.02, 8, 78),
(577, 'BAÑO MARIA', 0.02, 0.12, 0.00, 3, 78);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetagastoadminpormes`
--

CREATE TABLE `recetagastoadminpormes` (
  `idRecetaGastoAdminPorMes` int(11) NOT NULL,
  `indice` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL,
  `idGastoAdminPorMes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetagastoadminpormes`
--

INSERT INTO `recetagastoadminpormes` (`idRecetaGastoAdminPorMes`, `indice`, `idReceta`, `idGastoAdminPorMes`) VALUES
(2837, 57, 57, 10),
(2838, 55, 55, 10),
(2839, 20, 20, 10),
(2840, 19, 19, 10),
(2841, 18, 18, 10),
(2842, 17, 17, 10),
(2843, 16, 16, 10),
(2844, 15, 15, 10),
(2845, 14, 14, 10),
(2846, 13, 13, 10),
(2847, 12, 12, 10),
(2848, 11, 11, 10),
(2849, 10, 10, 10),
(2850, 9, 9, 10),
(2851, 8, 8, 10),
(2852, 7, 7, 10),
(2853, 6, 6, 10),
(2854, 5, 5, 10),
(2855, 4, 4, 10),
(2856, 3, 3, 10),
(2857, 2, 2, 10),
(2858, 49, 10, 3),
(2859, 43, 9, 3),
(2860, 67, 13, 3),
(2861, 61, 12, 3),
(2862, 25, 6, 3),
(2863, 19, 5, 3),
(2864, 13, 4, 3),
(2865, 7, 3, 3),
(2866, 1, 2, 3),
(2867, 37, 8, 3),
(2868, 31, 7, 3),
(2869, 319, 55, 3),
(2870, 331, 57, 3),
(2871, 79, 15, 3),
(2872, 73, 14, 3),
(2873, 55, 11, 3),
(2874, 97, 18, 3),
(2875, 103, 19, 3),
(2876, 109, 20, 3),
(2877, 91, 17, 3),
(2878, 85, 16, 3),
(2879, 333, 57, 4),
(2880, 321, 55, 4),
(2881, 111, 20, 4),
(2882, 105, 19, 4),
(2883, 99, 18, 4),
(2884, 93, 17, 4),
(2885, 87, 16, 4),
(2886, 51, 10, 4),
(2887, 57, 11, 4),
(2888, 63, 12, 4),
(2889, 69, 13, 4),
(2890, 75, 14, 4),
(2891, 81, 15, 4),
(2892, 9, 3, 4),
(2893, 15, 4, 4),
(2894, 21, 5, 4),
(2895, 27, 6, 4),
(2896, 33, 7, 4),
(2897, 39, 8, 4),
(2898, 45, 9, 4),
(2899, 3, 2, 4),
(2900, 334, 57, 5),
(2901, 322, 55, 5),
(2902, 112, 20, 5),
(2903, 106, 19, 5),
(2904, 100, 18, 5),
(2905, 94, 17, 5),
(2906, 88, 16, 5),
(2907, 82, 15, 5),
(2908, 76, 14, 5),
(2909, 70, 13, 5),
(2910, 64, 12, 5),
(2911, 58, 11, 5),
(2912, 52, 10, 5),
(2913, 46, 9, 5),
(2914, 4, 2, 5),
(2915, 10, 3, 5),
(2916, 16, 4, 5),
(2917, 22, 5, 5),
(2918, 28, 6, 5),
(2919, 34, 7, 5),
(2920, 40, 8, 5),
(2921, 335, 57, 6),
(2922, 323, 55, 6),
(2923, 113, 20, 6),
(2924, 107, 19, 6),
(2925, 101, 18, 6),
(2926, 95, 17, 6),
(2927, 89, 16, 6),
(2928, 53, 10, 6),
(2929, 59, 11, 6),
(2930, 65, 12, 6),
(2931, 71, 13, 6),
(2932, 83, 15, 6),
(2933, 77, 14, 6),
(2934, 47, 9, 6),
(2935, 5, 2, 6),
(2936, 11, 3, 6),
(2937, 17, 4, 6),
(2938, 23, 5, 6),
(2939, 29, 6, 6),
(2940, 35, 7, 6),
(2941, 41, 8, 6),
(2942, 332, 57, 7),
(2943, 320, 55, 7),
(2944, 110, 20, 7),
(2945, 104, 19, 7),
(2946, 98, 18, 7),
(2947, 92, 17, 7),
(2948, 86, 16, 7),
(2949, 80, 15, 7),
(2950, 74, 14, 7),
(2951, 68, 13, 7),
(2952, 62, 12, 7),
(2953, 56, 11, 7),
(2954, 50, 10, 7),
(2955, 44, 9, 7),
(2956, 38, 8, 7),
(2957, 32, 7, 7),
(2958, 26, 6, 7),
(2959, 20, 5, 7),
(2960, 14, 4, 7),
(2961, 2, 2, 7),
(2962, 8, 3, 7),
(2963, 336, 57, 11),
(2964, 324, 55, 11),
(2965, 114, 20, 11),
(2966, 108, 19, 11),
(2967, 102, 18, 11),
(2968, 96, 17, 11),
(2969, 90, 16, 11),
(2970, 84, 15, 11),
(2971, 78, 14, 11),
(2972, 72, 13, 11),
(2973, 60, 11, 11),
(2974, 54, 10, 11),
(2975, 66, 12, 11),
(2976, 48, 9, 11),
(2977, 42, 8, 11),
(2978, 36, 7, 11),
(2979, 30, 6, 11),
(2980, 24, 5, 11),
(2981, 18, 4, 11),
(2982, 12, 3, 11),
(2983, 6, 2, 11),
(2984, 1, 2, 8),
(2985, 3, 3, 8),
(2986, 5, 4, 8),
(2987, 7, 5, 8),
(2988, 9, 6, 8),
(2989, 11, 7, 8),
(2990, 13, 8, 8),
(2991, 15, 9, 8),
(2992, 17, 10, 8),
(2993, 19, 11, 8),
(2994, 21, 12, 8),
(2995, 23, 13, 8),
(2996, 25, 14, 8),
(2997, 27, 15, 8),
(2998, 29, 16, 8),
(2999, 31, 17, 8),
(3000, 33, 18, 8),
(3001, 35, 19, 8),
(3002, 37, 20, 8),
(3003, 107, 55, 8),
(3004, 111, 57, 8),
(3005, 4, 3, 9),
(3006, 6, 4, 9),
(3007, 8, 5, 9),
(3008, 10, 6, 9),
(3009, 12, 7, 9),
(3010, 14, 8, 9),
(3011, 16, 9, 9),
(3012, 18, 10, 9),
(3013, 20, 11, 9),
(3014, 22, 12, 9),
(3015, 24, 13, 9),
(3016, 28, 15, 9),
(3017, 26, 14, 9),
(3018, 30, 16, 9),
(3019, 32, 17, 9),
(3020, 34, 18, 9),
(3021, 38, 20, 9),
(3022, 36, 19, 9),
(3023, 112, 57, 9),
(3024, 108, 55, 9),
(3025, 2, 2, 9),
(3026, 1, 21, 12),
(3027, 7, 22, 12),
(3028, 13, 23, 12),
(3029, 19, 24, 12),
(3030, 25, 25, 12),
(3031, 31, 26, 12),
(3032, 37, 27, 12),
(3033, 43, 28, 12),
(3034, 49, 29, 12),
(3035, 55, 30, 12),
(3036, 61, 31, 12),
(3037, 67, 32, 12),
(3038, 73, 33, 12),
(3039, 85, 35, 12),
(3040, 91, 36, 12),
(3041, 79, 34, 12),
(3042, 103, 38, 12),
(3043, 97, 37, 12),
(3044, 109, 39, 12),
(3045, 115, 40, 12),
(3046, 116, 40, 16),
(3047, 117, 40, 13),
(3048, 118, 40, 14),
(3049, 119, 40, 15),
(3050, 120, 40, 20),
(3051, 114, 39, 20),
(3052, 113, 39, 15),
(3053, 112, 39, 14),
(3054, 111, 39, 13),
(3055, 110, 39, 16),
(3056, 104, 38, 16),
(3057, 105, 38, 13),
(3058, 106, 38, 14),
(3059, 107, 38, 15),
(3060, 108, 38, 20),
(3061, 102, 37, 20),
(3062, 101, 37, 15),
(3063, 100, 37, 14),
(3064, 99, 37, 13),
(3065, 98, 37, 16),
(3066, 92, 36, 16),
(3067, 86, 35, 16),
(3068, 80, 34, 16),
(3069, 74, 33, 16),
(3070, 68, 32, 16),
(3071, 62, 31, 16),
(3072, 63, 31, 13),
(3073, 69, 32, 13),
(3074, 75, 33, 13),
(3075, 81, 34, 13),
(3076, 93, 36, 13),
(3077, 87, 35, 13),
(3078, 94, 36, 14),
(3079, 88, 35, 14),
(3080, 89, 35, 15),
(3081, 95, 36, 15),
(3082, 90, 35, 20),
(3083, 96, 36, 20),
(3084, 82, 34, 14),
(3085, 76, 33, 14),
(3086, 70, 32, 14),
(3087, 64, 31, 14),
(3088, 65, 31, 15),
(3089, 71, 32, 15),
(3090, 83, 34, 15),
(3091, 77, 33, 15),
(3092, 84, 34, 20),
(3093, 78, 33, 20),
(3094, 72, 32, 20),
(3095, 66, 31, 20),
(3096, 59, 30, 15),
(3097, 58, 30, 14),
(3098, 57, 30, 13),
(3099, 56, 30, 16),
(3100, 60, 30, 20),
(3101, 54, 29, 20),
(3102, 42, 27, 20),
(3103, 48, 28, 20),
(3104, 47, 28, 15),
(3105, 53, 29, 15),
(3106, 35, 26, 15),
(3107, 29, 25, 15),
(3108, 23, 24, 15),
(3109, 17, 23, 15),
(3110, 11, 22, 15),
(3111, 41, 27, 15),
(3112, 52, 29, 14),
(3113, 46, 28, 14),
(3114, 51, 29, 13),
(3115, 45, 28, 13),
(3116, 50, 29, 16),
(3117, 44, 28, 16),
(3118, 38, 27, 16),
(3119, 32, 26, 16),
(3120, 20, 24, 16),
(3121, 26, 25, 16),
(3122, 14, 23, 16),
(3123, 15, 23, 13),
(3124, 21, 24, 13),
(3125, 27, 25, 13),
(3126, 33, 26, 13),
(3127, 39, 27, 13),
(3128, 40, 27, 14),
(3129, 34, 26, 14),
(3130, 28, 25, 14),
(3131, 22, 24, 14),
(3132, 16, 23, 14),
(3133, 30, 25, 20),
(3134, 24, 24, 20),
(3135, 18, 23, 20),
(3136, 12, 22, 20),
(3137, 6, 21, 20),
(3138, 36, 26, 20),
(3139, 5, 21, 15),
(3140, 10, 22, 14),
(3141, 4, 21, 14),
(3142, 3, 21, 13),
(3143, 9, 22, 13),
(3144, 2, 21, 16),
(3145, 8, 22, 16),
(3146, 1, 21, 17),
(3147, 2, 21, 18),
(3148, 4, 22, 18),
(3149, 3, 22, 17),
(3150, 5, 23, 17),
(3151, 7, 24, 17),
(3152, 9, 25, 17),
(3153, 11, 26, 17),
(3154, 13, 27, 17),
(3155, 15, 28, 17),
(3156, 17, 29, 17),
(3157, 19, 30, 17),
(3158, 21, 31, 17),
(3159, 23, 32, 17),
(3160, 26, 33, 18),
(3161, 24, 32, 18),
(3162, 22, 31, 18),
(3163, 20, 30, 18),
(3164, 16, 28, 18),
(3165, 14, 27, 18),
(3166, 12, 26, 18),
(3167, 8, 24, 18),
(3168, 10, 25, 18),
(3169, 6, 23, 18),
(3170, 18, 29, 18),
(3171, 25, 33, 17),
(3172, 27, 34, 17),
(3173, 29, 35, 17),
(3174, 31, 36, 17),
(3175, 33, 37, 17),
(3176, 35, 38, 17),
(3177, 37, 39, 17),
(3178, 39, 40, 17),
(3179, 40, 40, 18),
(3180, 38, 39, 18),
(3181, 36, 38, 18),
(3182, 34, 37, 18),
(3183, 32, 36, 18),
(3184, 30, 35, 18),
(3185, 28, 34, 18),
(3186, 21, 40, 19),
(3187, 20, 39, 19),
(3188, 19, 38, 19),
(3189, 18, 37, 19),
(3190, 17, 36, 19),
(3191, 16, 35, 19),
(3192, 15, 34, 19),
(3193, 14, 33, 19),
(3194, 13, 32, 19),
(3195, 12, 31, 19),
(3196, 11, 30, 19),
(3197, 10, 29, 19),
(3198, 9, 28, 19),
(3199, 8, 27, 19),
(3200, 7, 26, 19),
(3201, 6, 25, 19),
(3202, 3, 22, 19),
(3203, 2, 21, 19),
(3204, 4, 23, 19),
(3205, 5, 24, 19),
(3290, 27, 54, 126),
(3291, 28, 54, 127),
(3292, 25, 53, 126),
(3293, 26, 53, 127),
(3294, 24, 52, 127),
(3295, 23, 52, 126),
(3296, 21, 51, 126),
(3297, 22, 51, 127),
(3298, 20, 50, 127),
(3299, 19, 50, 126),
(3300, 17, 49, 126),
(3301, 15, 48, 126),
(3302, 13, 47, 126),
(3303, 11, 46, 126),
(3304, 9, 45, 126),
(3305, 7, 44, 126),
(3306, 5, 43, 126),
(3307, 3, 42, 126),
(3308, 1, 41, 126),
(3309, 2, 41, 127),
(3310, 4, 42, 127),
(3311, 6, 43, 127),
(3312, 10, 45, 127),
(3313, 8, 44, 127),
(3314, 12, 46, 127),
(3315, 14, 47, 127),
(3316, 16, 48, 127),
(3317, 18, 49, 127),
(3318, 19, 60, 128),
(3319, 18, 59, 128),
(3320, 17, 58, 128),
(3321, 16, 56, 128),
(3322, 15, 54, 128),
(3323, 14, 53, 128),
(3324, 13, 52, 128),
(3325, 12, 51, 128),
(3326, 11, 50, 128),
(3327, 10, 49, 128),
(3328, 9, 48, 128),
(3329, 8, 47, 128),
(3330, 7, 46, 128),
(3331, 6, 45, 128),
(3332, 5, 44, 128),
(3333, 4, 43, 128),
(3334, 3, 42, 128),
(3335, 2, 41, 128),
(3336, 79, 54, 121),
(3337, 67, 52, 121),
(3338, 73, 53, 121),
(3339, 61, 51, 121),
(3340, 55, 50, 121),
(3341, 49, 49, 121),
(3342, 43, 48, 121),
(3343, 37, 47, 121),
(3344, 31, 46, 121),
(3345, 25, 45, 121),
(3346, 19, 44, 121),
(3347, 13, 43, 121),
(3348, 7, 42, 121),
(3349, 1, 41, 121),
(3350, 81, 54, 122),
(3351, 75, 53, 122),
(3352, 69, 52, 122),
(3353, 63, 51, 122),
(3354, 57, 50, 122),
(3355, 51, 49, 122),
(3356, 45, 48, 122),
(3357, 39, 47, 122),
(3358, 33, 46, 122),
(3359, 27, 45, 122),
(3360, 21, 44, 122),
(3361, 15, 43, 122),
(3362, 9, 42, 122),
(3363, 3, 41, 122),
(3364, 82, 54, 123),
(3365, 76, 53, 123),
(3366, 70, 52, 123),
(3367, 4, 41, 123),
(3368, 10, 42, 123),
(3369, 16, 43, 123),
(3370, 22, 44, 123),
(3371, 28, 45, 123),
(3372, 34, 46, 123),
(3373, 40, 47, 123),
(3374, 46, 48, 123),
(3375, 52, 49, 123),
(3376, 58, 50, 123),
(3377, 64, 51, 123),
(3378, 83, 54, 124),
(3379, 77, 53, 124),
(3380, 71, 52, 124),
(3381, 11, 42, 124),
(3382, 5, 41, 124),
(3383, 17, 43, 124),
(3384, 23, 44, 124),
(3385, 29, 45, 124),
(3386, 35, 46, 124),
(3387, 41, 47, 124),
(3388, 65, 51, 124),
(3389, 59, 50, 124),
(3390, 53, 49, 124),
(3391, 47, 48, 124),
(3392, 80, 54, 125),
(3393, 74, 53, 125),
(3394, 68, 52, 125),
(3395, 8, 42, 125),
(3396, 2, 41, 125),
(3397, 14, 43, 125),
(3398, 20, 44, 125),
(3399, 26, 45, 125),
(3400, 32, 46, 125),
(3401, 38, 47, 125),
(3402, 44, 48, 125),
(3403, 50, 49, 125),
(3404, 56, 50, 125),
(3405, 62, 51, 125),
(3406, 84, 54, 129),
(3407, 78, 53, 129),
(3408, 12, 42, 129),
(3409, 6, 41, 129),
(3410, 18, 43, 129),
(3411, 24, 44, 129),
(3412, 30, 45, 129),
(3413, 36, 46, 129),
(3414, 42, 47, 129),
(3415, 48, 48, 129),
(3416, 54, 49, 129),
(3417, 60, 50, 129),
(3418, 66, 51, 129),
(3419, 72, 52, 129);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetamanodeobra`
--

CREATE TABLE `recetamanodeobra` (
  `idRecetaManodeObra` int(11) NOT NULL,
  `nombreEmpleado` varchar(50) DEFAULT NULL,
  `nombreMaquina` varchar(50) DEFAULT NULL,
  `tiempoHoras` decimal(10,2) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `idMaquina` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetamanodeobra`
--

INSERT INTO `recetamanodeobra` (`idRecetaManodeObra`, `nombreEmpleado`, `nombreMaquina`, `tiempoHoras`, `precioUnitario`, `total`, `idMaquina`, `idEmpleado`, `idReceta`) VALUES
(4, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 2),
(5, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 2),
(6, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 2),
(7, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 2),
(8, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 2),
(9, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 2),
(10, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 2),
(11, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 3),
(12, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 3),
(13, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 3),
(14, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 3),
(15, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 3),
(16, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 3),
(17, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 3),
(18, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 4),
(19, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 4),
(20, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 4),
(21, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 4),
(22, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 4),
(23, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 4),
(24, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 4),
(25, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 5),
(26, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 5),
(27, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 5),
(28, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 5),
(29, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 5),
(30, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 5),
(31, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 5),
(32, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 6),
(33, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 6),
(34, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 6),
(35, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 6),
(36, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 6),
(37, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 6),
(38, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 6),
(39, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 7),
(40, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 7),
(41, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 7),
(42, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 7),
(43, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 7),
(44, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 7),
(45, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 7),
(46, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 8),
(47, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 8),
(48, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 8),
(49, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 8),
(50, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 8),
(51, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 8),
(52, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 8),
(53, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 9),
(54, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 9),
(55, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 9),
(56, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 9),
(57, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 9),
(58, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 9),
(59, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 9),
(60, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 10),
(61, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 10),
(62, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 10),
(63, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 10),
(64, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 10),
(65, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 10),
(66, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 10),
(67, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 11),
(68, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 11),
(69, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 11),
(70, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 11),
(71, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 11),
(72, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 11),
(73, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 11),
(74, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 12),
(75, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 12),
(76, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 12),
(77, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 12),
(78, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 12),
(79, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 12),
(80, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 12),
(81, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 13),
(82, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 13),
(83, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 13),
(84, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 13),
(85, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 13),
(86, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 13),
(87, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 13),
(88, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 14),
(89, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 14),
(90, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 14),
(91, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 14),
(92, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 14),
(93, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 14),
(94, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 14),
(95, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 15),
(96, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 15),
(97, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 15),
(98, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 15),
(99, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 15),
(100, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 15),
(101, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 15),
(102, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 16),
(103, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 16),
(104, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 16),
(105, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 16),
(106, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 16),
(107, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 16),
(108, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 16),
(109, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 17),
(110, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 17),
(111, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 17),
(112, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 17),
(113, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 17),
(114, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 17),
(115, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 17),
(116, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 18),
(117, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 18),
(118, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 18),
(119, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 18),
(120, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 18),
(121, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 18),
(122, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 18),
(123, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 19),
(124, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 19),
(125, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 19),
(126, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 19),
(127, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 19),
(128, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 19),
(129, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 19),
(130, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 20),
(131, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 20),
(132, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 20),
(133, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 20),
(134, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 20),
(135, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 20),
(136, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 20),
(137, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 21),
(138, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 21),
(139, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 21),
(140, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 21),
(141, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 21),
(142, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 21),
(143, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 21),
(144, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 22),
(145, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 22),
(146, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 22),
(147, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 22),
(148, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 22),
(149, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 22),
(150, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 22),
(151, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 23),
(152, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 23),
(153, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 23),
(154, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 23),
(155, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 23),
(156, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 23),
(157, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 23),
(158, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 24),
(159, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 24),
(160, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 24),
(161, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 24),
(162, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 24),
(163, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 24),
(164, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 24),
(165, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 25),
(166, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 25),
(167, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 25),
(168, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 25),
(169, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 25),
(170, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 25),
(171, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 25),
(172, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 26),
(173, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 26),
(174, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 26),
(175, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 26),
(176, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 26),
(177, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 26),
(178, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 26),
(179, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 27),
(180, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 27),
(181, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 27),
(182, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 27),
(183, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 27),
(184, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 27),
(185, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 27),
(186, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 28),
(187, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 28),
(188, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 28),
(189, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 28),
(190, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 28),
(191, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 28),
(192, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 28),
(193, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 29),
(194, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 29),
(195, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 29),
(196, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 29),
(197, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 29),
(198, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 29),
(199, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 29),
(200, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 30),
(201, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 30),
(202, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 30),
(203, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 30),
(204, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 30),
(205, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 30),
(206, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 30),
(207, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 31),
(208, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 31),
(209, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 31),
(210, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 31),
(211, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 31),
(212, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 31),
(213, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 31),
(214, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 32),
(215, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 32),
(216, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 32),
(217, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 32),
(218, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 32),
(219, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 32),
(220, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 32),
(221, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 33),
(222, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 33),
(223, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 33),
(224, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 33),
(225, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 33),
(226, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 33),
(227, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 33),
(228, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 34),
(229, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 34),
(230, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 34),
(231, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 34),
(232, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 34),
(233, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 34),
(234, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 34),
(235, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 35),
(236, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 35),
(237, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 35),
(238, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 35),
(239, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 35),
(240, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 35),
(241, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 35),
(242, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 36),
(243, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 36),
(244, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 36),
(245, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 36),
(246, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 36),
(247, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 36),
(248, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 36),
(249, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 37),
(250, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 37),
(251, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 37),
(252, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 37),
(253, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 37),
(254, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 37),
(255, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 37),
(256, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 38),
(257, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 38),
(258, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 38),
(259, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 38),
(260, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 38),
(261, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 38),
(262, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 38),
(263, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 39),
(264, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 39),
(265, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 39),
(266, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 39),
(267, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 39),
(268, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 39),
(269, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 39),
(270, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 40),
(271, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 40),
(272, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 40),
(273, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 40),
(274, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 40),
(275, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 40),
(276, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 40),
(277, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 41),
(278, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 41),
(279, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 41),
(280, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 41),
(281, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 41),
(282, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 41),
(283, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 41),
(284, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 42),
(285, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 42),
(286, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 42),
(287, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 42),
(288, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 42),
(289, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 42),
(290, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 42),
(291, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 43),
(292, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 43),
(293, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 43),
(294, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 43),
(295, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 43),
(296, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 43),
(297, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 43),
(298, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 44),
(299, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 44),
(300, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 44),
(301, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 44),
(302, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 44),
(303, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 44),
(304, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 44),
(312, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 45),
(313, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 45),
(314, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 45),
(315, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 45),
(316, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 45),
(317, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 45),
(318, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 45),
(319, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 46),
(320, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 46),
(321, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 46),
(322, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 46),
(323, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 46),
(324, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 46),
(325, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 46),
(326, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 47),
(327, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 47),
(328, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 47),
(329, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 47),
(330, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 47),
(331, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 47),
(332, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 47),
(333, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 48),
(334, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 48),
(335, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 48),
(336, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 48),
(337, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 48),
(338, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 48),
(339, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 48),
(347, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 49),
(348, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 49),
(349, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 49),
(350, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 49),
(351, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 49),
(352, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 49),
(353, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 49),
(354, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 50),
(355, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 50),
(356, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 50),
(357, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 50),
(358, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 50),
(359, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 50),
(360, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 50),
(368, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 51),
(369, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 51),
(370, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 51),
(371, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 51),
(372, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 51),
(373, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 51),
(374, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 51),
(375, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 52),
(376, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 52),
(377, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 52),
(378, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 52),
(379, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 52),
(380, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 52),
(381, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 52),
(382, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 53),
(383, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 53),
(384, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 53),
(385, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 53),
(386, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 53),
(387, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 53),
(388, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 53),
(389, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 54),
(390, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 54),
(391, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 54),
(392, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 54),
(393, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 54),
(394, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 54),
(395, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 54),
(396, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 55),
(397, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 55),
(398, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 55),
(399, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 55),
(400, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 55),
(401, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 55),
(402, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 55),
(403, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 56),
(404, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 56),
(405, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 56),
(406, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 56),
(407, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 56),
(408, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 56),
(409, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 56),
(410, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 57),
(411, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 57),
(412, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 57),
(413, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 57),
(414, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 57),
(415, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 57),
(416, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 57),
(417, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 58),
(418, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 58),
(419, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 58),
(420, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 58),
(421, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 58),
(422, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 58),
(423, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 58),
(424, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 59),
(425, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 59),
(426, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 59),
(427, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 59),
(428, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 59),
(429, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 59),
(430, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 59),
(431, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 60),
(432, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 60),
(433, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 60),
(434, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 60),
(435, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 60),
(436, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 60),
(437, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 60),
(445, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 61),
(446, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 61),
(447, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 61),
(448, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 61),
(449, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 61),
(450, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 61),
(451, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 61),
(452, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 62),
(453, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 62),
(454, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 62),
(455, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 62),
(456, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 62),
(457, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 62),
(458, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 62),
(459, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 63),
(460, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 63),
(461, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 63),
(462, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 63),
(463, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 63),
(464, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 63),
(465, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 63),
(466, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 64),
(467, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 64),
(468, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 64),
(469, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 64),
(470, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 64),
(471, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 64),
(472, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 64),
(473, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 65),
(474, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 65),
(475, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 65),
(476, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 65),
(477, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 65),
(478, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 65),
(479, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 65),
(480, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 66),
(481, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 66),
(482, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 66),
(483, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 66),
(484, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 66),
(485, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 66),
(486, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 66),
(487, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 67),
(488, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 67),
(489, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 67),
(490, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 67),
(491, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 67),
(492, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 67),
(493, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 67),
(494, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 68),
(495, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 68),
(496, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 68),
(497, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 68),
(498, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 68),
(499, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 68),
(500, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 68),
(501, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 69),
(502, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 69),
(503, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 69),
(504, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 69),
(505, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 69),
(506, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 69),
(507, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 69),
(508, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 70),
(509, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 70),
(510, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 70),
(511, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 70),
(512, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 70),
(513, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 70),
(514, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 70),
(515, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 71),
(516, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 71),
(517, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 71),
(518, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 71),
(519, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 71),
(520, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 71),
(521, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 71),
(522, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 72),
(523, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 72),
(524, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 72),
(525, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 72),
(526, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 72),
(527, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 72),
(528, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 72),
(529, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 73),
(530, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 73),
(531, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 73),
(532, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 73),
(533, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 73),
(534, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 73),
(535, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 73),
(536, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 74),
(537, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 74),
(538, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 74),
(539, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 74),
(540, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 74),
(541, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 74),
(542, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 74),
(543, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 75),
(544, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 75),
(545, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 75),
(546, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 75),
(547, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 75),
(548, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 75),
(549, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 75),
(557, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 76),
(558, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 76),
(559, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 76),
(560, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 76),
(561, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 76),
(562, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 76),
(563, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 76),
(564, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 77),
(565, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 77),
(566, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 77),
(567, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 77),
(568, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 77),
(569, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 77),
(570, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 77),
(571, 'Julio  Granado Perez', 'SELECCIONADORA', 0.30, 7.50, 2.25, 1, 1, 78),
(572, 'Mario Cardenas Luján', 'TOSTADORA', 0.20, 7.50, 1.50, 2, 2, 78),
(573, 'Julio  Granado Perez', 'SELLADORA', 0.18, 7.50, 1.35, 9, 1, 78),
(574, 'Julio  Granado Perez', 'DESCASCARILLADORA', 0.20, 7.50, 1.50, 4, 1, 78),
(575, 'Mario Cardenas Luján', 'MOLINOS DE PIEDRA', 0.15, 7.50, 1.13, 5, 2, 78),
(576, 'Julio  Granado Perez', 'BAÑO MARIA', 0.12, 7.50, 0.90, 3, 1, 78),
(577, 'Mario Cardenas Luján', 'CAMARA FRÍO', 0.20, 7.50, 1.50, 8, 2, 78);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetamateria`
--

CREATE TABLE `recetamateria` (
  `idRecetaMateria` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `idMateria` int(11) DEFAULT NULL,
  `idReceta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetamateria`
--

INSERT INTO `recetamateria` (`idRecetaMateria`, `nombre`, `cantidad`, `precioUnitario`, `total`, `idMateria`, `idReceta`) VALUES
(6, 'PASAS - VILLA NATURA', 0.50, 26.67, 13.34, 2, 2),
(7, 'AZUCAR - CARTAVIO', 0.60, 2.24, 1.34, 4, 2),
(8, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 2),
(9, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 2),
(10, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 2),
(11, 'BOLSAS BILAMINADO - SIN MARCA', 80.00, 0.03, 2.40, 6, 2),
(12, 'ETIQUETAS - SIN MARCA', 80.00, 0.01, 0.80, 18, 2),
(13, 'CAJAS - SIN MARCA', 80.00, 0.30, 24.00, 5, 2),
(14, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 2),
(15, 'PASAS - VILLA NATURA', 0.50, 26.67, 13.34, 2, 3),
(16, 'AZUCAR - CARTAVIO', 0.60, 2.24, 1.34, 4, 3),
(17, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 3),
(18, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 3),
(19, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 3),
(20, 'BOLSAS BILAMINADO - SIN MARCA', 80.00, 0.03, 2.40, 6, 3),
(21, 'ETIQUETAS - SIN MARCA', 80.00, 0.01, 0.80, 18, 3),
(22, 'CAJAS - SIN MARCA', 80.00, 0.30, 24.00, 5, 3),
(23, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 3),
(30, 'PASAS - VILLA NATURA', 0.55, 26.67, 14.67, 2, 4),
(32, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 4),
(33, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 4),
(34, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 4),
(35, 'BOLSAS BILAMINADO - SIN MARCA', 20.00, 0.03, 0.60, 6, 4),
(36, 'ETIQUETAS - SIN MARCA', 20.00, 0.01, 0.20, 18, 4),
(37, 'CAJAS - SIN MARCA', 20.00, 0.30, 6.00, 5, 4),
(38, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 4),
(45, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 4),
(46, 'PASAS - VILLA NATURA', 0.55, 26.67, 14.67, 2, 5),
(47, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 5),
(48, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 5),
(49, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 5),
(50, 'BOLSAS BILAMINADO - SIN MARCA', 20.00, 0.03, 0.60, 6, 5),
(51, 'ETIQUETAS - SIN MARCA', 20.00, 0.01, 0.20, 18, 5),
(52, 'CAJAS - SIN MARCA', 20.00, 0.30, 6.00, 5, 5),
(53, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 5),
(54, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 5),
(63, 'CACAO - SIN MARCA', 2.80, 4.00, 11.20, 1, 6),
(64, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 6),
(65, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 6),
(66, 'BOLSAS BILAMINADO - SIN MARCA', 80.00, 0.03, 2.40, 6, 6),
(67, 'ETIQUETAS - SIN MARCA', 80.00, 0.01, 0.80, 18, 6),
(68, 'CAJAS - SIN MARCA', 80.00, 0.30, 24.00, 5, 6),
(69, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 6),
(77, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 7),
(78, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 7),
(79, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 7),
(80, 'BOLSAS BILAMINADO - SIN MARCA', 20.00, 0.03, 0.60, 6, 7),
(81, 'ETIQUETAS - SIN MARCA', 20.00, 0.01, 0.20, 18, 7),
(82, 'CAJAS - SIN MARCA', 20.00, 0.30, 6.00, 5, 7),
(83, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 7),
(84, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 7),
(91, 'ARÁNDANOS - BELL\'S', 0.55, 29.98, 16.49, 14, 7),
(92, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 8),
(93, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 8),
(94, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 8),
(95, 'BOLSAS BILAMINADO - SIN MARCA', 20.00, 0.03, 0.60, 6, 8),
(96, 'ETIQUETAS - SIN MARCA', 20.00, 0.01, 0.20, 18, 8),
(97, 'CAJAS - SIN MARCA', 20.00, 0.30, 6.00, 5, 8),
(98, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 8),
(99, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 8),
(100, 'ARÁNDANOS - BELL\'S', 0.55, 29.98, 16.49, 14, 8),
(107, 'CACAO - SIN MARCA', 2.80, 4.00, 11.20, 1, 9),
(108, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 9),
(109, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 9),
(110, 'BOLSAS BILAMINADO - SIN MARCA', 80.00, 0.03, 2.40, 6, 9),
(111, 'ETIQUETAS - SIN MARCA', 80.00, 0.01, 0.80, 18, 9),
(112, 'CAJAS - SIN MARCA', 80.00, 0.30, 24.00, 5, 9),
(113, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 9),
(114, 'CACAO - SIN MARCA', 2.80, 4.00, 11.20, 1, 10),
(115, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 10),
(116, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 10),
(117, 'BOLSAS BILAMINADO - SIN MARCA', 80.00, 0.03, 2.40, 6, 10),
(118, 'ETIQUETAS - SIN MARCA', 80.00, 0.01, 0.80, 18, 10),
(119, 'CAJAS - SIN MARCA', 80.00, 0.30, 24.00, 5, 10),
(120, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 10),
(121, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 11),
(122, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 11),
(123, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 11),
(124, 'BOLSAS BILAMINADO - SIN MARCA', 20.00, 0.03, 0.60, 6, 11),
(125, 'ETIQUETAS - SIN MARCA', 20.00, 0.01, 0.20, 18, 11),
(126, 'CAJAS - SIN MARCA', 20.00, 0.30, 6.00, 5, 11),
(127, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 11),
(128, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 11),
(136, 'CACAO - SIN MARCA', 2.80, 4.00, 11.20, 1, 12),
(137, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 12),
(138, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 12),
(139, 'BOLSAS BILAMINADO - SIN MARCA', 80.00, 0.03, 2.40, 6, 12),
(140, 'ETIQUETAS - SIN MARCA', 80.00, 0.01, 0.80, 18, 12),
(141, 'CAJAS - SIN MARCA', 80.00, 0.30, 24.00, 5, 12),
(142, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 12),
(143, 'CACAO - SIN MARCA', 2.80, 4.00, 11.20, 1, 13),
(144, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 13),
(145, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 13),
(146, 'BOLSAS BILAMINADO - SIN MARCA', 80.00, 0.03, 2.40, 6, 13),
(147, 'ETIQUETAS - SIN MARCA', 80.00, 0.01, 0.80, 18, 13),
(148, 'CAJAS - SIN MARCA', 80.00, 0.30, 24.00, 5, 13),
(149, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 13),
(150, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 14),
(151, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 14),
(152, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 14),
(153, 'BOLSAS BILAMINADO - SIN MARCA', 20.00, 0.03, 0.60, 6, 14),
(154, 'ETIQUETAS - SIN MARCA', 20.00, 0.01, 0.20, 18, 14),
(155, 'CAJAS - SIN MARCA', 20.00, 0.30, 6.00, 5, 14),
(156, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 14),
(157, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 14),
(165, 'KIWICHA - ORGANIX', 0.55, 24.90, 13.70, 16, 14),
(166, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 15),
(167, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 15),
(168, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 15),
(169, 'BOLSAS BILAMINADO - SIN MARCA', 20.00, 0.03, 0.60, 6, 15),
(170, 'ETIQUETAS - SIN MARCA', 20.00, 0.01, 0.20, 18, 15),
(171, 'CAJAS - SIN MARCA', 20.00, 0.30, 6.00, 5, 15),
(172, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 15),
(173, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 15),
(174, 'KIWICHA - ORGANIX', 0.55, 24.90, 13.70, 16, 15),
(181, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 16),
(182, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 16),
(183, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 16),
(184, 'BOLSAS BILAMINADO - SIN MARCA', 20.00, 0.03, 0.60, 6, 16),
(185, 'ETIQUETAS - SIN MARCA', 20.00, 0.01, 0.20, 18, 16),
(186, 'CAJAS - SIN MARCA', 20.00, 0.30, 6.00, 5, 16),
(187, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 16),
(188, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 16),
(189, 'ARÁNDANOS - BELL\'S', 0.55, 29.98, 16.49, 14, 16),
(196, 'AGUAYMANTO - BELL\'S', 0.55, 17.50, 9.63, 13, 11),
(197, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 17),
(198, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 17),
(199, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 17),
(200, 'BOLSAS BILAMINADO - SIN MARCA', 20.00, 0.03, 0.60, 6, 17),
(201, 'ETIQUETAS - SIN MARCA', 20.00, 0.01, 0.20, 18, 17),
(202, 'CAJAS - SIN MARCA', 20.00, 0.30, 6.00, 5, 17),
(203, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 17),
(204, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 17),
(205, 'ARÁNDANOS - BELL\'S', 0.55, 29.98, 16.49, 14, 17),
(212, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 18),
(213, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 18),
(214, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 18),
(215, 'BOLSAS BILAMINADO - SIN MARCA', 20.00, 0.03, 0.60, 6, 18),
(216, 'ETIQUETAS - SIN MARCA', 20.00, 0.01, 0.20, 18, 18),
(217, 'CAJAS - SIN MARCA', 20.00, 0.30, 6.00, 5, 18),
(218, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 18),
(219, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 18),
(220, 'AGUAYMANTO - BELL\'S', 0.55, 17.50, 9.63, 13, 18),
(227, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 19),
(228, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 19),
(229, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 19),
(230, 'BOLSAS BILAMINADO - SIN MARCA', 20.00, 0.03, 0.60, 6, 19),
(231, 'ETIQUETAS - SIN MARCA', 20.00, 0.01, 0.20, 18, 19),
(232, 'CAJAS - SIN MARCA', 20.00, 0.30, 6.00, 5, 19),
(233, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 19),
(234, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 19),
(242, 'QUINUA - TOTTUS', 0.55, 12.50, 6.88, 12, 19),
(243, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 20),
(244, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 20),
(245, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 20),
(246, 'BOLSAS BILAMINADO - SIN MARCA', 20.00, 0.03, 0.60, 6, 20),
(247, 'ETIQUETAS - SIN MARCA', 20.00, 0.01, 0.20, 18, 20),
(248, 'CAJAS - SIN MARCA', 20.00, 0.30, 6.00, 5, 20),
(249, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 20),
(250, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 20),
(251, 'QUINUA - TOTTUS', 0.55, 12.50, 6.88, 12, 20),
(258, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 21),
(259, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 21),
(260, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 21),
(261, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 21),
(262, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 21),
(263, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 21),
(264, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 21),
(265, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 21),
(273, 'MANGO - KENT', 0.55, 4.10, 2.26, 17, 21),
(274, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 22),
(275, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 22),
(276, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 22),
(277, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 22),
(278, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 22),
(279, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 22),
(280, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 22),
(281, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 22),
(282, 'MANGO - KENT', 0.55, 4.10, 2.26, 17, 22),
(289, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 23),
(290, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 23),
(291, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 23),
(292, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 23),
(293, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 23),
(294, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 23),
(295, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 23),
(296, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 23),
(297, 'MANGO - KENT', 0.55, 4.10, 2.26, 17, 23),
(304, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 24),
(305, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 24),
(306, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 24),
(307, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 24),
(308, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 24),
(309, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 24),
(310, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 24),
(311, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 24),
(312, 'MANGO - KENT', 0.55, 4.10, 2.26, 17, 24),
(319, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 25),
(320, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 25),
(321, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 25),
(322, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 25),
(323, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 25),
(324, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 25),
(325, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 25),
(326, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 25),
(334, 'CAÑIHUA - DEL CAMPO A TU CASA', 0.55, 35.00, 19.25, 15, 25),
(335, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 26),
(336, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 26),
(337, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 26),
(338, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 26),
(339, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 26),
(340, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 26),
(341, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 26),
(342, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 26),
(343, 'CAÑIHUA - DEL CAMPO A TU CASA', 0.55, 35.00, 19.25, 15, 26),
(350, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 27),
(351, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 27),
(352, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 27),
(353, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 27),
(354, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 27),
(355, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 27),
(356, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 27),
(357, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 27),
(358, 'CAÑIHUA - DEL CAMPO A TU CASA', 0.55, 35.00, 19.25, 15, 27),
(365, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 28),
(366, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 28),
(367, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 28),
(368, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 28),
(369, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 28),
(370, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 28),
(371, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 28),
(372, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 28),
(373, 'CAÑIHUA - DEL CAMPO A TU CASA', 0.55, 35.00, 19.25, 15, 28),
(380, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 29),
(381, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 29),
(382, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 29),
(383, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 29),
(384, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 29),
(385, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 29),
(386, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 29),
(387, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 29),
(395, 'AGUAYMANTO - BELL\'S', 0.55, 17.50, 9.63, 13, 29),
(396, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 30),
(397, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 30),
(398, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 30),
(399, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 30),
(400, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 30),
(401, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 30),
(402, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 30),
(403, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 30),
(404, 'AGUAYMANTO - BELL\'S', 0.55, 17.50, 9.63, 13, 30),
(411, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 31),
(412, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 31),
(413, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 31),
(414, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 31),
(415, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 31),
(416, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 31),
(417, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 31),
(418, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 31),
(419, 'AGUAYMANTO - BELL\'S', 0.55, 17.50, 9.63, 13, 31),
(426, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 32),
(427, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 32),
(428, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 32),
(429, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 32),
(430, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 32),
(431, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 32),
(432, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 32),
(433, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 32),
(434, 'AGUAYMANTO - BELL\'S', 0.55, 17.50, 9.63, 13, 32),
(441, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 33),
(442, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 33),
(443, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 33),
(444, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 33),
(445, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 33),
(446, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 33),
(447, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 33),
(448, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 33),
(456, 'PASAS - VILLA NATURA', 0.55, 26.67, 14.67, 2, 33),
(457, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 34),
(458, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 34),
(459, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 34),
(460, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 34),
(461, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 34),
(462, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 34),
(463, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 34),
(464, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 34),
(465, 'PASAS - VILLA NATURA', 0.55, 26.67, 14.67, 2, 34),
(472, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 35),
(473, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 35),
(474, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 35),
(475, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 35),
(476, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 35),
(477, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 35),
(478, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 35),
(479, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 35),
(480, 'PASAS - VILLA NATURA', 0.55, 26.67, 14.67, 2, 35),
(487, 'CACAO - SIN MARCA', 2.40, 4.00, 9.60, 1, 36),
(488, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 36),
(489, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 36),
(490, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 36),
(491, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 36),
(492, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 36),
(493, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 36),
(494, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 36),
(495, 'PASAS - VILLA NATURA', 0.55, 26.67, 14.67, 2, 36),
(502, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 37),
(503, 'LECITINA - BRYMAR', 0.30, 80.00, 24.00, 8, 37),
(504, 'LECHE - GLORIA', 0.80, 5.20, 4.16, 3, 37),
(505, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 37),
(506, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 37),
(507, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 37),
(508, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 37),
(509, 'STEVIA - LA BOLIVIANA', 0.30, 82.00, 24.60, 19, 37),
(517, 'CACAO - SIN MARCA', 2.80, 4.00, 11.20, 1, 38),
(518, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 38),
(519, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 38),
(520, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 38),
(521, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 38),
(522, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 38),
(523, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 38),
(524, 'CACAO - SIN MARCA', 2.80, 4.00, 11.20, 1, 39),
(525, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 39),
(526, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 39),
(527, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 39),
(528, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 39),
(529, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 39),
(530, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 39),
(531, 'CACAO - SIN MARCA', 2.80, 4.00, 11.20, 1, 40),
(532, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 40),
(533, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 40),
(534, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 40),
(535, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 40),
(536, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 40),
(537, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 40),
(538, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 41),
(539, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 41),
(540, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 41),
(541, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 41),
(542, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 41),
(543, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 41),
(544, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 41),
(545, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 42),
(546, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 42),
(547, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 42),
(548, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 42),
(549, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 42),
(550, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 42),
(551, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 42),
(552, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 43),
(553, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 43),
(554, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 43),
(555, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 43),
(556, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 43),
(557, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 43),
(558, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 43),
(559, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 44),
(560, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 44),
(561, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 44),
(562, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 44),
(563, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 44),
(564, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 44),
(565, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 44),
(573, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 45),
(574, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 45),
(575, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 45),
(576, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 45),
(577, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 45),
(578, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 45),
(579, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 45),
(580, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 46),
(581, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 46),
(582, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 46),
(583, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 46),
(584, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 46),
(585, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 46),
(586, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 46),
(587, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 47),
(588, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 47),
(589, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 47),
(590, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 47),
(591, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 47),
(592, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 47),
(593, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 47),
(594, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 48),
(595, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 48),
(596, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 48),
(597, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 48),
(598, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 48),
(599, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 48),
(600, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 48),
(608, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 49),
(609, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 49),
(610, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 49),
(611, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 49),
(612, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 49),
(613, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 49),
(614, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 49),
(615, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 50),
(616, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 50),
(617, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 50),
(618, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 50),
(619, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 50),
(620, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 50),
(621, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 50),
(630, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 51),
(631, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 51),
(632, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 51),
(633, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 51),
(634, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 51),
(635, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 51),
(636, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 51),
(637, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 52),
(638, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 52),
(639, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 52),
(640, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 52),
(641, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 52),
(642, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 52),
(643, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 52),
(644, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 53),
(645, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 53),
(646, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 53),
(647, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 53),
(648, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 53),
(649, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 53),
(650, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 53),
(651, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 54),
(652, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 54),
(653, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 54),
(654, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 54),
(655, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 54),
(656, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 54),
(657, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 54),
(658, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 55),
(659, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 55),
(660, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 55),
(661, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 55),
(662, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 55),
(663, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 55),
(664, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 55),
(665, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 56),
(666, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 56),
(667, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 56),
(668, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 56),
(669, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 56),
(670, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 56),
(671, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 56),
(672, 'AZUCAR - CARTAVIO', 0.60, 2.24, 1.34, 4, 55),
(673, 'CASTAÑAS - MANUTATA', 0.10, 80.00, 8.00, 11, 55),
(674, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 57),
(675, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 57),
(676, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 57),
(677, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 57),
(678, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 57),
(679, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 57),
(680, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 57),
(681, 'AZUCAR - CARTAVIO', 0.60, 2.24, 1.34, 4, 57),
(682, 'CASTAÑAS - MANUTATA', 0.10, 80.00, 8.00, 11, 57),
(689, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 58),
(690, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 58),
(691, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 58),
(692, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 58),
(693, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 58),
(694, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 58),
(695, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 58),
(696, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 59),
(697, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 59),
(698, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 59),
(699, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 59),
(700, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 59),
(701, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 59),
(702, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 59),
(703, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 60),
(704, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 60),
(705, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 60),
(706, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 60),
(707, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 60),
(708, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 60),
(709, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 60),
(717, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 61),
(718, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 61),
(719, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 61),
(720, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 61),
(721, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 61),
(722, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 61),
(723, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 61),
(724, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 62),
(725, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 62),
(726, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 62),
(727, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 62),
(728, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 62),
(729, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 62),
(730, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 62),
(731, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 63),
(732, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 63),
(733, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 63),
(734, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 63),
(735, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 63),
(736, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 63),
(737, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 63),
(738, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 64),
(739, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 64),
(740, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 64),
(741, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 64),
(742, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 64),
(743, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 64),
(744, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 64),
(745, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 65),
(746, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 65),
(747, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 65),
(748, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 65),
(749, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 65),
(750, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 65),
(751, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 65),
(752, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 66),
(753, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 66),
(754, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 66),
(755, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 66),
(756, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 66),
(757, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 66),
(758, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 66),
(759, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 67),
(760, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 67),
(761, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 67),
(762, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 67),
(763, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 67),
(764, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 67),
(765, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 67),
(766, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 68),
(767, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 68),
(768, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 68),
(769, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 68),
(770, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 68),
(771, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 68),
(772, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 68),
(773, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 69),
(774, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 69),
(775, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 69),
(776, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 69),
(777, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 69),
(778, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 69),
(779, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 69),
(780, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 70),
(781, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 70),
(783, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 70),
(784, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 70),
(785, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 70),
(786, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 70),
(787, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 71),
(788, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 71),
(790, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 71),
(791, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 71),
(792, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 71),
(793, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 71),
(794, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 56),
(795, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 58),
(796, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 59),
(797, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 60),
(798, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 61),
(799, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 62),
(800, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 63),
(801, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 64),
(802, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 65),
(803, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 66),
(804, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 67),
(805, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 69),
(806, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 70),
(807, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 71),
(808, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 72),
(809, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 72),
(810, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 72),
(811, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 72),
(812, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 72),
(813, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 72),
(814, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 72),
(815, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 72),
(823, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 73),
(824, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 73),
(825, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 73),
(826, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 73),
(827, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 73),
(828, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 73),
(829, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 73),
(830, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 73),
(838, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 74),
(839, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 74),
(840, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 74),
(841, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 74),
(842, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 74),
(843, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 74),
(844, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 74),
(845, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 74),
(853, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 75),
(854, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 75),
(855, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 75),
(856, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 75),
(857, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 75),
(858, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 75),
(859, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 75),
(860, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 75),
(868, 'PECANAS - SEMILLA VERDE', 0.55, 119.60, 65.78, 10, 72),
(869, 'PECANAS - SEMILLA VERDE', 0.55, 119.60, 65.78, 10, 73),
(870, 'PECANAS - SEMILLA VERDE', 0.55, 119.60, 65.78, 10, 74),
(871, 'PECANAS - SEMILLA VERDE', 0.55, 119.60, 65.78, 10, 75),
(872, 'MANGO - KENT', 0.55, 4.10, 2.26, 17, 71),
(873, 'MANGO - KENT', 0.55, 4.10, 2.26, 17, 70),
(874, 'CAÑIHUA - DEL CAMPO A TU CASA', 0.55, 35.00, 19.25, 15, 69),
(875, 'CAÑIHUA - DEL CAMPO A TU CASA', 0.55, 35.00, 19.25, 15, 68),
(876, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 68),
(877, 'CAÑIHUA - DEL CAMPO A TU CASA', 0.55, 35.00, 19.25, 15, 67),
(878, 'PASAS - VILLA NATURA', 0.55, 26.67, 14.67, 2, 66),
(879, 'CASTAÑAS - MANUTATA', 0.55, 80.00, 44.00, 11, 61),
(880, 'ARÁNDANOS - BELL\'S', 0.55, 29.98, 16.49, 14, 60),
(881, 'ARÁNDANOS - BELL\'S', 0.55, 29.98, 16.49, 14, 59),
(882, 'ARÁNDANOS - BELL\'S', 0.55, 29.98, 16.49, 14, 56),
(883, 'STEVIA - LA BOLIVIANA', 0.55, 82.00, 45.10, 19, 51),
(884, 'AGUAYMANTO - BELL\'S', 0.55, 17.50, 9.63, 13, 51),
(885, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 71),
(886, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 70),
(903, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 76),
(904, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 76),
(905, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 76),
(906, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 76),
(907, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 76),
(908, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 76),
(909, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 76),
(910, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 76),
(911, 'PECANAS - SEMILLA VERDE', 0.55, 119.60, 65.78, 10, 76),
(918, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 77),
(919, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 77),
(920, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 77),
(921, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 77),
(922, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 77),
(923, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 77),
(924, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 77),
(925, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 77),
(926, 'PECANAS - SEMILLA VERDE', 0.55, 119.60, 65.78, 10, 77),
(927, 'CACAO - SIN MARCA', 3.00, 4.00, 12.00, 1, 78),
(928, 'LECITINA - BRYMAR', 0.20, 80.00, 16.00, 8, 78),
(929, 'LECHE - GLORIA', 0.50, 5.20, 2.60, 3, 78),
(930, 'BOLSAS BILAMINADO - SIN MARCA', 40.00, 0.03, 1.20, 6, 78),
(931, 'ETIQUETAS - SIN MARCA', 40.00, 0.01, 0.40, 18, 78),
(932, 'CAJAS - SIN MARCA', 40.00, 0.30, 12.00, 5, 78),
(933, 'CINTA - PEGAFAN', 1.00, 7.00, 7.00, 20, 78),
(934, 'AZUCAR - CARTAVIO', 0.55, 2.24, 1.23, 4, 78),
(935, 'PECANAS - SEMILLA VERDE', 0.55, 119.60, 65.78, 10, 78);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifaenergia`
--

CREATE TABLE `tarifaenergia` (
  `idTarifaEnergia` int(11) NOT NULL,
  `tarifaKwh` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tarifaenergia`
--

INSERT INTO `tarifaenergia` (`idTarifaEnergia`, `tarifaKwh`) VALUES
(1, 0.72);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocosto`
--

CREATE TABLE `tipocosto` (
  `idTipoCosto` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipocosto`
--

INSERT INTO `tipocosto` (`idTipoCosto`, `descripcion`) VALUES
(1, 'Fijo'),
(2, 'Variable');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`idTipoDocumento`, `descripcion`) VALUES
(1, 'DNI'),
(2, 'RUC'),
(3, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipogasto`
--

CREATE TABLE `tipogasto` (
  `idTipoGasto` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipogasto`
--

INSERT INTO `tipogasto` (`idTipoGasto`, `descripcion`) VALUES
(1, 'Gastos Administrativos'),
(2, 'Costos de Ventas'),
(3, 'Costos de Marketing'),
(4, 'Costos Operativos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomateria`
--

CREATE TABLE `tipomateria` (
  `idTipoMateria` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipomateria`
--

INSERT INTO `tipomateria` (`idTipoMateria`, `descripcion`) VALUES
(1, 'Insumo'),
(2, 'Material');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `idTipoProducto` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipoproducto`
--

INSERT INTO `tipoproducto` (`idTipoProducto`, `descripcion`) VALUES
(1, 'Terminado'),
(2, 'Intermedio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipounidad`
--

CREATE TABLE `tipounidad` (
  `idTipoUnidad` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadmedida`
--

CREATE TABLE `unidadmedida` (
  `idUnidadMedida` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `idTipoUnidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidadmedida`
--

INSERT INTO `unidadmedida` (`idUnidadMedida`, `descripcion`, `idTipoUnidad`) VALUES
(1, 'Kg', NULL),
(2, 'L', NULL),
(3, 'Unid', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `idPerfil` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `usuario`, `password`, `foto`, `estado`, `ultimo_login`, `fecha`, `idPerfil`) VALUES
(1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S', 'vistas/img/usuarios/admin/130.jpg', 1, '2023-11-18 14:19:16', '2022-10-18 21:42:18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariomodulo`
--

CREATE TABLE `usuariomodulo` (
  `idUsuarioModulo` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idModulo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuariomodulo`
--

INSERT INTO `usuariomodulo` (`idUsuarioModulo`, `idUsuario`, `idModulo`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariopermiso`
--

CREATE TABLE `usuariopermiso` (
  `idUsuarioPermiso` int(11) NOT NULL,
  `insertar` int(11) DEFAULT NULL,
  `editar` int(11) DEFAULT NULL,
  `eliminar` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuariopermiso`
--

INSERT INTO `usuariopermiso` (`idUsuarioPermiso`, `insertar`, `editar`, `eliminar`, `idUsuario`) VALUES
(1, 1, 1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`idConfiguracion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idTipoCosto` (`idTipoCosto`),
  ADD KEY `idTipoDocumento` (`idTipoDocumento`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `gastoadmin`
--
ALTER TABLE `gastoadmin`
  ADD PRIMARY KEY (`idGastoAdmin`),
  ADD KEY `idUnidadMedida` (`idUnidadMedida`),
  ADD KEY `idTipoCosto` (`idTipoCosto`),
  ADD KEY `idTipoGasto` (`idTipoGasto`);

--
-- Indices de la tabla `gastoadminpormes`
--
ALTER TABLE `gastoadminpormes`
  ADD PRIMARY KEY (`idGastoAdminPorMes`),
  ADD KEY `idGastoAdmin` (`idGastoAdmin`),
  ADD KEY `idMesGasto` (`idMesGasto`);

--
-- Indices de la tabla `inventariomaquina`
--
ALTER TABLE `inventariomaquina`
  ADD PRIMARY KEY (`idInventarioMaquina`),
  ADD KEY `idMaquina` (`idMaquina`);

--
-- Indices de la tabla `inventariomateria`
--
ALTER TABLE `inventariomateria`
  ADD PRIMARY KEY (`idInventarioMateria`),
  ADD KEY `idMateria` (`idMateria`);

--
-- Indices de la tabla `inventarioproducto`
--
ALTER TABLE `inventarioproducto`
  ADD PRIMARY KEY (`idInventarioProducto`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`idLote`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `maquina`
--
ALTER TABLE `maquina`
  ADD PRIMARY KEY (`idMaquina`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idMateria`),
  ADD KEY `idTipoMateria` (`idTipoMateria`),
  ADD KEY `idUnidadMedida` (`idUnidadMedida`),
  ADD KEY `idMarca` (`idMarca`);

--
-- Indices de la tabla `mesgasto`
--
ALTER TABLE `mesgasto`
  ADD PRIMARY KEY (`idMesGasto`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`idModulo`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`idMovimiento`);

--
-- Indices de la tabla `movimientomaquina`
--
ALTER TABLE `movimientomaquina`
  ADD PRIMARY KEY (`idMovimientoMaquina`),
  ADD KEY `idMaquina` (`idMaquina`),
  ADD KEY `idMovimiento` (`idMovimiento`);

--
-- Indices de la tabla `movimientomateria`
--
ALTER TABLE `movimientomateria`
  ADD PRIMARY KEY (`idMovimientoMateria`),
  ADD KEY `idMateria` (`idMateria`),
  ADD KEY `idMovimiento` (`idMovimiento`);

--
-- Indices de la tabla `movimientoproducto`
--
ALTER TABLE `movimientoproducto`
  ADD PRIMARY KEY (`idMovimientoProducto`),
  ADD KEY `idLote` (`idLote`),
  ADD KEY `idMovimiento` (`idMovimiento`);

--
-- Indices de la tabla `ordertable`
--
ALTER TABLE `ordertable`
  ADD PRIMARY KEY (`idOrderTable`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idUnidadMedida` (`idUnidadMedida`),
  ADD KEY `idTipoProducto` (`idTipoProducto`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`idReceta`),
  ADD KEY `idEstado` (`idEstado`);

--
-- Indices de la tabla `recetaconsumoenergia`
--
ALTER TABLE `recetaconsumoenergia`
  ADD PRIMARY KEY (`idRecetaConsumoEnergia`),
  ADD KEY `idReceta` (`idReceta`),
  ADD KEY `idMaquina` (`idMaquina`),
  ADD KEY `idTarifaEnergia` (`idTarifaEnergia`);

--
-- Indices de la tabla `recetaconsumogas`
--
ALTER TABLE `recetaconsumogas`
  ADD PRIMARY KEY (`idRecetaConsumoGas`),
  ADD KEY `idMaquina` (`idMaquina`),
  ADD KEY `idReceta` (`idReceta`);

--
-- Indices de la tabla `recetadepreciacion`
--
ALTER TABLE `recetadepreciacion`
  ADD PRIMARY KEY (`idRecetaDepreciacion`),
  ADD KEY `idMaquina` (`idMaquina`),
  ADD KEY `idReceta` (`idReceta`);

--
-- Indices de la tabla `recetagastoadminpormes`
--
ALTER TABLE `recetagastoadminpormes`
  ADD PRIMARY KEY (`idRecetaGastoAdminPorMes`),
  ADD KEY `idGastoAdminPorMes` (`idGastoAdminPorMes`),
  ADD KEY `idReceta` (`idReceta`);

--
-- Indices de la tabla `recetamanodeobra`
--
ALTER TABLE `recetamanodeobra`
  ADD PRIMARY KEY (`idRecetaManodeObra`),
  ADD KEY `idReceta` (`idReceta`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idMaquina` (`idMaquina`);

--
-- Indices de la tabla `recetamateria`
--
ALTER TABLE `recetamateria`
  ADD PRIMARY KEY (`idRecetaMateria`),
  ADD KEY `idMateria` (`idMateria`),
  ADD KEY `idReceta` (`idReceta`);

--
-- Indices de la tabla `tarifaenergia`
--
ALTER TABLE `tarifaenergia`
  ADD PRIMARY KEY (`idTarifaEnergia`);

--
-- Indices de la tabla `tipocosto`
--
ALTER TABLE `tipocosto`
  ADD PRIMARY KEY (`idTipoCosto`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`idTipoDocumento`);

--
-- Indices de la tabla `tipogasto`
--
ALTER TABLE `tipogasto`
  ADD PRIMARY KEY (`idTipoGasto`);

--
-- Indices de la tabla `tipomateria`
--
ALTER TABLE `tipomateria`
  ADD PRIMARY KEY (`idTipoMateria`);

--
-- Indices de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`idTipoProducto`);

--
-- Indices de la tabla `tipounidad`
--
ALTER TABLE `tipounidad`
  ADD PRIMARY KEY (`idTipoUnidad`);

--
-- Indices de la tabla `unidadmedida`
--
ALTER TABLE `unidadmedida`
  ADD PRIMARY KEY (`idUnidadMedida`),
  ADD KEY `idTipoUnidad` (`idTipoUnidad`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idPerfil` (`idPerfil`);

--
-- Indices de la tabla `usuariomodulo`
--
ALTER TABLE `usuariomodulo`
  ADD PRIMARY KEY (`idUsuarioModulo`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idModulo` (`idModulo`);

--
-- Indices de la tabla `usuariopermiso`
--
ALTER TABLE `usuariopermiso`
  ADD PRIMARY KEY (`idUsuarioPermiso`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `idConfiguracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `gastoadmin`
--
ALTER TABLE `gastoadmin`
  MODIFY `idGastoAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `gastoadminpormes`
--
ALTER TABLE `gastoadminpormes`
  MODIFY `idGastoAdminPorMes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT de la tabla `inventariomaquina`
--
ALTER TABLE `inventariomaquina`
  MODIFY `idInventarioMaquina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `inventariomateria`
--
ALTER TABLE `inventariomateria`
  MODIFY `idInventarioMateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `inventarioproducto`
--
ALTER TABLE `inventarioproducto`
  MODIFY `idInventarioProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `idLote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `maquina`
--
ALTER TABLE `maquina`
  MODIFY `idMaquina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `idMateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `mesgasto`
--
ALTER TABLE `mesgasto`
  MODIFY `idMesGasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `idModulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `idMovimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `movimientomaquina`
--
ALTER TABLE `movimientomaquina`
  MODIFY `idMovimientoMaquina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `movimientomateria`
--
ALTER TABLE `movimientomateria`
  MODIFY `idMovimientoMateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT de la tabla `movimientoproducto`
--
ALTER TABLE `movimientoproducto`
  MODIFY `idMovimientoProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `ordertable`
--
ALTER TABLE `ordertable`
  MODIFY `idOrderTable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `idReceta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `recetaconsumoenergia`
--
ALTER TABLE `recetaconsumoenergia`
  MODIFY `idRecetaConsumoEnergia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=573;

--
-- AUTO_INCREMENT de la tabla `recetaconsumogas`
--
ALTER TABLE `recetaconsumogas`
  MODIFY `idRecetaConsumoGas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `recetadepreciacion`
--
ALTER TABLE `recetadepreciacion`
  MODIFY `idRecetaDepreciacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=578;

--
-- AUTO_INCREMENT de la tabla `recetagastoadminpormes`
--
ALTER TABLE `recetagastoadminpormes`
  MODIFY `idRecetaGastoAdminPorMes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3420;

--
-- AUTO_INCREMENT de la tabla `recetamanodeobra`
--
ALTER TABLE `recetamanodeobra`
  MODIFY `idRecetaManodeObra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=578;

--
-- AUTO_INCREMENT de la tabla `recetamateria`
--
ALTER TABLE `recetamateria`
  MODIFY `idRecetaMateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=936;

--
-- AUTO_INCREMENT de la tabla `tarifaenergia`
--
ALTER TABLE `tarifaenergia`
  MODIFY `idTarifaEnergia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipocosto`
--
ALTER TABLE `tipocosto`
  MODIFY `idTipoCosto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipogasto`
--
ALTER TABLE `tipogasto`
  MODIFY `idTipoGasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipomateria`
--
ALTER TABLE `tipomateria`
  MODIFY `idTipoMateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  MODIFY `idTipoProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipounidad`
--
ALTER TABLE `tipounidad`
  MODIFY `idTipoUnidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidadmedida`
--
ALTER TABLE `unidadmedida`
  MODIFY `idUnidadMedida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuariomodulo`
--
ALTER TABLE `usuariomodulo`
  MODIFY `idUsuarioModulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `usuariopermiso`
--
ALTER TABLE `usuariopermiso`
  MODIFY `idUsuarioPermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`),
  ADD CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `gastoadmin`
--
ALTER TABLE `gastoadmin`
  ADD CONSTRAINT `gastoadmin_ibfk_1` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  ADD CONSTRAINT `gastoadmin_ibfk_2` FOREIGN KEY (`idTipoCosto`) REFERENCES `tipocosto` (`idTipoCosto`),
  ADD CONSTRAINT `gastoadmin_ibfk_3` FOREIGN KEY (`idTipoGasto`) REFERENCES `tipogasto` (`idTipoGasto`);

--
-- Filtros para la tabla `gastoadminpormes`
--
ALTER TABLE `gastoadminpormes`
  ADD CONSTRAINT `gastoadminpormes_ibfk_1` FOREIGN KEY (`idGastoAdmin`) REFERENCES `gastoadmin` (`idGastoAdmin`),
  ADD CONSTRAINT `gastoadminpormes_ibfk_2` FOREIGN KEY (`idMesGasto`) REFERENCES `mesgasto` (`idMesGasto`);

--
-- Filtros para la tabla `inventariomaquina`
--
ALTER TABLE `inventariomaquina`
  ADD CONSTRAINT `inventariomaquina_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`);

--
-- Filtros para la tabla `inventariomateria`
--
ALTER TABLE `inventariomateria`
  ADD CONSTRAINT `inventariomateria_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`);

--
-- Filtros para la tabla `inventarioproducto`
--
ALTER TABLE `inventarioproducto`
  ADD CONSTRAINT `inventarioproducto_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`idTipoMateria`) REFERENCES `tipomateria` (`idTipoMateria`),
  ADD CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  ADD CONSTRAINT `materia_ibfk_3` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`);

--
-- Filtros para la tabla `movimientomaquina`
--
ALTER TABLE `movimientomaquina`
  ADD CONSTRAINT `movimientomaquina_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`),
  ADD CONSTRAINT `movimientomaquina_ibfk_2` FOREIGN KEY (`idMovimiento`) REFERENCES `movimiento` (`idMovimiento`);

--
-- Filtros para la tabla `movimientomateria`
--
ALTER TABLE `movimientomateria`
  ADD CONSTRAINT `movimientomateria_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`),
  ADD CONSTRAINT `movimientomateria_ibfk_2` FOREIGN KEY (`idMovimiento`) REFERENCES `movimiento` (`idMovimiento`);

--
-- Filtros para la tabla `movimientoproducto`
--
ALTER TABLE `movimientoproducto`
  ADD CONSTRAINT `movimientoproducto_ibfk_1` FOREIGN KEY (`idLote`) REFERENCES `lote` (`idLote`),
  ADD CONSTRAINT `movimientoproducto_ibfk_2` FOREIGN KEY (`idMovimiento`) REFERENCES `movimiento` (`idMovimiento`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadmedida` (`idUnidadMedida`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipoproducto` (`idTipoProducto`);

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`);

--
-- Filtros para la tabla `recetaconsumoenergia`
--
ALTER TABLE `recetaconsumoenergia`
  ADD CONSTRAINT `recetaconsumoenergia_ibfk_1` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`),
  ADD CONSTRAINT `recetaconsumoenergia_ibfk_2` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`),
  ADD CONSTRAINT `recetaconsumoenergia_ibfk_3` FOREIGN KEY (`idTarifaEnergia`) REFERENCES `tarifaenergia` (`idTarifaEnergia`);

--
-- Filtros para la tabla `recetaconsumogas`
--
ALTER TABLE `recetaconsumogas`
  ADD CONSTRAINT `recetaconsumogas_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`),
  ADD CONSTRAINT `recetaconsumogas_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`);

--
-- Filtros para la tabla `recetadepreciacion`
--
ALTER TABLE `recetadepreciacion`
  ADD CONSTRAINT `recetadepreciacion_ibfk_1` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`),
  ADD CONSTRAINT `recetadepreciacion_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`);

--
-- Filtros para la tabla `recetagastoadminpormes`
--
ALTER TABLE `recetagastoadminpormes`
  ADD CONSTRAINT `recetagastoadminpormes_ibfk_1` FOREIGN KEY (`idGastoAdminPorMes`) REFERENCES `gastoadminpormes` (`idGastoAdminPorMes`),
  ADD CONSTRAINT `recetagastoadminpormes_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`);

--
-- Filtros para la tabla `recetamanodeobra`
--
ALTER TABLE `recetamanodeobra`
  ADD CONSTRAINT `recetamanodeobra_ibfk_1` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`),
  ADD CONSTRAINT `recetamanodeobra_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `recetamanodeobra_ibfk_3` FOREIGN KEY (`idMaquina`) REFERENCES `maquina` (`idMaquina`);

--
-- Filtros para la tabla `recetamateria`
--
ALTER TABLE `recetamateria`
  ADD CONSTRAINT `recetamateria_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`),
  ADD CONSTRAINT `recetamateria_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`);

--
-- Filtros para la tabla `unidadmedida`
--
ALTER TABLE `unidadmedida`
  ADD CONSTRAINT `unidadmedida_ibfk_1` FOREIGN KEY (`idTipoUnidad`) REFERENCES `tipounidad` (`idTipoUnidad`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`);

--
-- Filtros para la tabla `usuariomodulo`
--
ALTER TABLE `usuariomodulo`
  ADD CONSTRAINT `usuariomodulo_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `usuariomodulo_ibfk_2` FOREIGN KEY (`idModulo`) REFERENCES `modulo` (`idModulo`);

--
-- Filtros para la tabla `usuariopermiso`
--
ALTER TABLE `usuariopermiso`
  ADD CONSTRAINT `usuariopermiso_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
