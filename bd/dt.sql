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
    
INSERT INTO `configuracion` (`idConfiguracion`, `modoDark`,`contraerBarraLateral`,`ocultarBarraLateral`) VALUES
	(1,1,0,0);
    
INSERT INTO `estado` (`idEstado`, `descripcion`) VALUES
   (1, "Iniciado"),
   (2, "Proceso"),
   (3, "Terminado");

INSERT INTO `producto` (`idProducto`, `codigo`, `nombre`, `descripcion`, `imagen`, `idUnidadMedida`, `idTipoProducto`) VALUES
	(1, '123456', 'Chocolate con pasa', '50% cacao', NULL, 3, 2);

INSERT INTO `usuario` (`idUsuario`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
	(1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S', 'Administrador', 'vistas/img/usuarios/admin/211.png', 1, NULL, '2022-10-18 16:42:18');

INSERT INTO `empleado` (`idEmpleado`, `nombre`, `apellido`, `direccion`, `telefono`, `correo`, `numeroDocumento`, `fechaNacimiento`, `cargo`, `horarioTrabajo`, `horasPorDia`, `sueldoPorDia`,`precioUnitario`, `sueldoPorMes`, `idTipoDocumento`, `idUsuario`, `idTipoCosto`) VALUES
	(1, 'Julio', 'Gonzales', 'Av. Alfonso Ugarte Lt.12', 987654321, 'julio@gmail.com', 432187654, '2022-11-03', 'Empaquetador', '8am - 6pm', 8, 80.00,10, 1000.00, 1, NULL, 1);

INSERT INTO `materia` (`idMateria`, `codigo`, `nombre`, `descripcion`, `precio`, `cantidad`,`precioUnitario`, `imagen`, `idUnidadMedida`, `idMarca`, `idTipoMateria`) VALUES
	(1, 'LC-12', 'LECHE', 'SIN LACTOSA', 55.00, 12.00, 4.58, '', 2, 1, 1),
	(2, 'CJ-1245', 'CAJAS', 'DE CARTON', 10, 10, 1, '', 3, 3, 2),
	(3, 'AG12', 'AGUA', 'EVAPORADA', 12.00, 12.00, 1.00, '', 2, 3, 1),
	(4, 'VN001', 'VAINILLA', 'DULCE', 7.00, 12.00, 0.58, '', 2, 1, 1),
	(5, 'CC001', 'CACAO', 'NATURAL', 6.00, 56.00, 0.11, '', 1, 3, 1),
    (6, 'EMP001', 'EMPAQUES', 'GRANDES', 30.000, 100.000, 0.300, '', 3, 3, 2);

    
INSERT INTO `inventariomateria` (`idInventarioMateria`, `stock`, `idMateria`) VALUES
	(1, 250.00, 1),
	(2, 200.00, 2),
	(3, 100.00, 3),
	(4, 150.00, 4),
	(5, 500.00, 5),
	(6, 2000.00, 6);

INSERT INTO `movimientomateria` (`idMovimientoMateria`, `ingreso`, `salida`, `observacion`, `codigoReceta`, `fecha`, `hora`, `idMateria`, `idMovimiento`) VALUES
	(1, 250.00, 0.00, 'Produccion', 'S-C', '2022-12-17', '2022-12-11 10:23:25', 1, 1),
	(2, 150.00, 0.00, 'Produccion', 'S-C', '2022-12-31', '2022-12-11 10:23:37', 4, 1),
	(3, 100.00, 0.00, 'Produccion', 'S-C', '2022-12-10', '2022-12-11 10:23:50', 3, 1),
	(4, 500.00, 0.00, 'Produccion', 'S-C', '2022-12-17', '2022-12-11 10:24:33', 5, 1),
    (5, 200.000, 0.000, 'Produccion','S-C', '2023-01-26', '2023-01-08 02:08:42', 2, 1),
    (6, 2000.000, 0.000, 'Produccion','S-C', '2023-01-10',  '2023-01-08 02:08:52', 6, 1);


INSERT INTO `inventarioproducto` (`idInventarioProducto`,`stock`) VALUES
	(1,0);
    
INSERT INTO `inventariomaquina` (`idInventarioMaquina`,`stock`) VALUES
	(1,0),
	(2,0);

INSERT INTO `maquina` (`idMaquina`, `codigo`, `nombre`, `serie`, `modelo`, `descripcion`, `marca`, `precio`, `añoCompra`, `capacidad`, `potenciaHP`, `potenciaWatts`, `potenciaKw`, `depreciacionAnual`, `depreciacionMensual`, `depreciacionHora`, `vidaUtil`) VALUES 
	(1, 'SL-0002', 'Seleccionadora', 'SL9212', 'MD-2022', 'Selecciona y limpia la materia prima', 'KAT', 8000.00, 2022, 60.00, 1.00, 745.70, 0.75, 1600.00, 133.33, 0.22, 5),
	(2, 'SLDR001', 'Selladora', '12313123', 'MD-2022', 'Sella los empaques', 'KAT', 2100.00, 2022, 20.00, 0.75, 559.28, 0.56, 2100.00, 175.00, 0.29, 1);

INSERT INTO `gastoadmin` (`idGastoAdmin`, `descripcion`, `precio`, `idUnidadMedida`, `idTipoCosto`, `idDesembolso`) VALUES
	(1, 'Gasto Administrativo 1', 70.00, 1, 1, 1),
	(2, 'Costo de Venta 1', 15.00, 3, 2, 2),
	(3, 'Costo de Marketing 1', 10.00, 3, 2, 3),
	(4, 'Costo Operativo 1', 12.00, 3, 1, 4);

INSERT INTO `receta` (`idReceta`, `codigo`, `nombre`, `batch`, `fechaInicio`, `fechaFin`, `pesoPorTableta`, `pesoEnTableta`, `merma`, `reproceso`, `codigoLote`, `idEstado`) VALUES
	(1, 'RC001', 'Receta 1', 60.00, '2022-12-10', '2022-12-10', 1.00, 1.00, 1.00, 1.00, '123456', 1);

INSERT INTO `lote` (`idLote`, `codigoLote`, `fechaVencimiento`, `idProducto`) VALUES
	(1, '123456', '2022-12-11', 1);

INSERT INTO `tarifaenergia` (`idTarifaEnergia`, `tarifakwh`) VALUES 
	(1, 0.72);
