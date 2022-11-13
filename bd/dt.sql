use caticao;

INSERT INTO `marca` (`idMarca`, `descripcion`) VALUES
	(1, 'GLORIA'),(2, 'DULFINA'),(3, 'SAFE');

INSERT INTO `tipoproducto` (`idTipoProducto`, `descripcion`) VALUES
	(1, 'Intermedio'),
	(2, 'Terminado');

INSERT INTO `unidadmedida` (`idUnidadMedida`, `descripcion`) VALUES
	(1, 'Kg'),
	(2, 'Lt'),
	(3, 'Niu');

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

INSERT INTO `desembolso` (`idDesembolso`, `descripcion`) VALUES
	(1, 'Gastos Administrativos'),
	(2, 'Costos de Ventas'),
	(3, 'Costos de Marketing'),
	(4, 'Costos Operativos');

INSERT INTO `movimiento` (`idMovimiento`, `descripcion`) VALUES
	(1, 'Ingreso'),
	(2, 'Salida');
    
INSERT INTO `configuracion` (`idConfiguracion`, `mododark`) VALUES
	(1, 1);

INSERT INTO `producto` (`idProducto`, `codigo`, `nombre`, `descripcion`, `cantidad`, `imagen`, `idUnidadMedida`, `idTipoProducto`) VALUES
	(1, '123456', 'Chocolate con pasa', '50% cacao', 20.00, NULL, 3, 2);

INSERT INTO `usuario` (`idUsuario`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
	(1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S', 'Administrador', 'vistas/img/usuarios/admin/592.png', 1, NULL, '2022-10-18 16:42:18');

INSERT INTO `empleado` (`idEmpleado`, `nombre`, `apellido`, `direccion`, `telefono`, `correo`, `numeroDocumento`, `fechaNacimiento`, `cargo`, `horarioTrabajo`, `horasPorDia`, `sueldoPorDia`, `sueldoPorMes`, `idTipoDocumento`, `idUsuario`, `idTipoCosto`) VALUES
	(1, 'Julio', 'Gonzales', 'Av. Alfonso Ugarte Lt.12', 987654321, 'julio@gmail.com', 432187654, '2022-11-03', 'Empaquetador', '8am - 6pm', 8, 30.00, 1000.00, 1, NULL, 1);

INSERT INTO `materia` (`idMateria`, `codigo`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `idUnidadMedida`, `idMarca`, `idTipoMateria`) VALUES
	(1, 'LC-12', 'LECHE', 'SIN LACTOSA', 55.00, 12.00, '', 2, 1, 1),
	(2, 'CJ-1245', 'CAJAS', 'DE CARTON', 15.00, 100.00, '', 3, 3, 2);
    
INSERT INTO `inventariomateria` (`idInventarioMateria`,`stock`) VALUES
	(1,0),
	(2,0);

INSERT INTO `maquina` (`idMaquina`, `codigo`, `nombre`, `serie`, `modelo`, `descripcion`, `marca`, `precio`, `añoCompra`, `capacidad`, `potencia`, `vidaUtil`) VALUES
	(1, 'SL-0002', 'Seleccionadora', 'SL9212', 'MD-2022', 'Selecciona y limpia la materia prima', 'KAT', 15000.00, 2022, 60.00, 1.00, 5);

INSERT INTO `gastoadmin` (`idGastoAdmin`, `descripcion`, `precio`, `idUnidadMedida`, `idTipoCosto`, `idDesembolso`) VALUES
	(1, 'Gasto Administrativo 1', 70.00, 1, 1, 1),
	(2, 'Costo de Venta 1', 15.00, 3, 2, 2),
	(3, 'Costo de Marketing 1', 10.00, 3, 2, 3),
	(4, 'Costo Operativo 1', 12.00, 3, 1, 4);