use caticao;

INSERT INTO `orderTable` (`idOrderTable`, `descripcion`) VALUES
(1,'ordertable'),
(2,'configuracion'),
(3,'marca'),
(4,'tipoproducto'),
(5,'tipounidad'),
(6,'unidadmedida'),
(7,'tipomateria'),
(8,'tipocosto'),
(9,'tipodocumento'),
(10,'tipogasto'),
(11,'movimiento'),
(12,'estado'),
(13,'perfil'),
(14,'usuario'),
(15,'modulo'),
(16,'usuariomodulo'),
(17,'usuariopermiso'),
(18,'empleado'),
(19,'materia'),
(20,'producto'),
(21,'lote'),
(22,'maquina'),
(23,'gastoadmin'),
(24,'inventariomateria'),
(25,'inventarioproducto'),
(26,'inventariomaquina'),
(27,'movimientomateria'),
(28,'movimientoproducto'),
(29,'movimientomaquina'),
(30,'receta'),
(31,'recetamateria'),
(32,'recetamanodeobra'),
(33,'recetadepreciacion'),
(34,'tarifaenergia'),
(35,'recetaconsumoenergia'),
(36,'recetaconsumogas'),
(40,'mesgasto'),
(41,'gastoadminpormes');

INSERT INTO `tipoproducto` (`idTipoProducto`, `descripcion`) VALUES
	(1, 'Terminado'),
	(2, 'Intermedio');

INSERT INTO `unidadmedida` (`idUnidadMedida`, `descripcion`) VALUES
	(1, 'Kg'),
	(2, 'L'),
	(3, 'Unid');

INSERT INTO `tipomateria` (`idTipoMateria`, `descripcion`) VALUES
	(1, 'Insumo'),
	(2, 'Material');
    
INSERT INTO `tipocosto` (`idTipoCosto`, `descripcion`) VALUES
	(1, 'Fijo'),
	(2, 'Variable');
    
INSERT INTO `tipodocumento` (`idTipoDocumento`, `descripcion`) VALUES
	(1, 'DNI'),
	(2, 'RUC'),
    (3, 'Pasaporte');

INSERT INTO `tipogasto` (`idTipoGasto`, `descripcion`) VALUES
	(1, 'Gastos Administrativos'),
	(2, 'Costos de Ventas'),
	(3, 'Costos de Marketing'),
	(4, 'Costos Operativos');

INSERT INTO `movimiento` (`idMovimiento`, `descripcion`) VALUES
	(1, 'Ingreso'),
	(2, 'Salida');
    
INSERT INTO `configuracion` (`idConfiguracion`, `modoDark`,`contraerBarraLateral`,`ocultarBarraLateral`) VALUES
	(1,1,0,0);
    
INSERT INTO `estado` (`idEstado`, `descripcion`) VALUES
   (1, "Iniciado"),
   (2, "Proceso"),
   (3, "Terminado");

INSERT INTO `perfil` (`idPerfil`, `descripcion`) VALUES
	(1, 'Administrador'),
	(2, 'Operario'),
	(3, 'Vendedor'),
	(4, 'Otro');

INSERT INTO `usuario` (`idUsuario`,`idPerfil`, `nombre`, `usuario`, `password`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
	(1, 1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S', 'vistas/img/usuarios/admin/211.png', 1, NULL, '2022-10-18 16:42:18');

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
	
INSERT INTO `usuariopermiso` (`idUsuarioPermiso`, `insertar`, `editar`, `eliminar`, `idUsuario`) VALUES
	(1, 1, 1, 1, 1);

INSERT INTO `tarifaenergia` (`idTarifaEnergia`, `tarifakwh`) VALUES 
	(1, 0.72);
