use caticao;

INSERT INTO `marca` (`idMarca`, `descripcion`) VALUES
	(1, 'GLORIA'),(2, 'DULFINA');

INSERT INTO `tipoproducto` (`idTipoProducto`, `descripcion`) VALUES
	(1, 'Intermedio'),
	(2, 'Terminado');

INSERT INTO `unidadmedida` (`idUnidadMedida`, `descripcion`) VALUES
	(1, 'Kilogramos'),
	(2, 'Litros'),
	(3, 'Unidades');

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

INSERT INTO `producto` (`idProducto`, `codigo`, `nombre`, `descripcion`, `cantidad`, `imagen`, `idUnidadMedida`, `idTipoProducto`) VALUES
	(1, '123456', 'Chocolate con pasa', '50% cacao', 20.00, NULL, 3, 2);

INSERT INTO `usuario` (`idUsuario`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
	(1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S', 'Administrador', NULL, 1, NULL, '2022-10-18 16:42:18');

INSERT INTO `empleado` (`idEmpleado`, `nombre`, `apellido`, `direccion`, `telefono`, `correo`, `numeroDocumento`, `fechaNacimiento`, `cargo`, `horarioTrabajo`, `horasPorDia`, `sueldoPorDia`, `sueldoPorMes`, `idTipoDocumento`, `idUsuario`, `idTipoCosto`) VALUES
	(1, 'Admin', 'Gon', 'Av. Ug', 987654321, 'admin@gmail.com', 12345678, '1997-11-05', 'Admin', '10am-8pm', 8, 40.00, 1000.00, 1, 1, 1);
