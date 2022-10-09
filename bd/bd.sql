create database caticao;
USE caticao ;

-- -----------------------------------------------------
-- Table almacen
-- -----------------------------------------------------
CREATE TABLE almacen (
  idAlmacen INT  AUTO_INCREMENT  primary key,
  descripcionA VARCHAR(45)
);
-- -----------------------------------------------------
-- Table maquina
-- -----------------------------------------------------

CREATE TABLE maquina (
  idMaquina INT  AUTO_INCREMENT  primary key,
  nombre VARCHAR(80) ,
  descripcion VARCHAR(80)
);
-- -----------------------------------------------------
-- Table tipocostos
-- -----------------------------------------------------
CREATE TABLE tipocostos (
  idTipoCostos INT  AUTO_INCREMENT  primary key,
  descripcion VARCHAR(45)
);

-- -----------------------------------------------------
-- Table unidadmedida
-- -----------------------------------------------------
CREATE TABLE unidadmedida (
  idUnidadMedida INT  AUTO_INCREMENT  primary key,
  descripcion VARCHAR(45),
  TipoMedida vARCHAR(45) 
);
-- -----------------------------------------------------
-- Table consumoenergia
-- -----------------------------------------------------
CREATE TABLE consumoenergia (
  idConsumoEnergia INT  AUTO_INCREMENT  primary key,
  potenciaHP DECIMAL(10,2),
  potenciawatts DECIMAL(10,2),
  potenciaKw DECIMAL(10,2),
  horasTrabajoBatch DECIMAL(10,2),
  consumoKwh DECIMAL(10,2),
  tarifaKwh DECIMAL(10,2),
  pagoPorBatch DECIMAL(10,2),
  idMaquina INT REFERENCES maquina (idMaquina),
  idTipoCostos INT REFERENCES tipocostos (idTipoCostos) ,
  idUnidadMedida INT REFERENCES unidadmedida (idUnidadMedida) 
);
-- -----------------------------------------------------
-- Table tipoproducto
-- -----------------------------------------------------

CREATE TABLE tipoproducto (
  idTipoProducto INT  AUTO_INCREMENT  primary key,
  descripcionTP VARCHAR(45)
);



-- -----------------------------------------------------
-- Table consumoenergiareceta
-- -----------------------------------------------------

CREATE TABLE consumoenergiareceta (
  idConsumoEnergiaReceta INT  AUTO_INCREMENT primary key,
  idConsumoEnergia INT REFERENCES consumoenergia (idConsumoEnergia),
  idReceta INT REFERENCES receta (idReceta)
);



-- -----------------------------------------------------
-- Table depreciacion
-- -----------------------------------------------------


CREATE TABLE depreciacion (
  idDepreciacion INT AUTO_INCREMENT  primary key,
  importe DECIMAL(10,2) ,
  vidaUtil INT ,
  depreciacionAnual DECIMAL(10,2) ,
  depreciacionMensual DECIMAL(10,2) ,
  depreciacionHora DECIMAL(10,2) ,
  tiempoDeUso DECIMAL(10,2) ,
  depreciacionPorBatch DECIMAL(10,2) ,
  idMaquina INT REFERENCES maquina (idMaquina),
  idTipoCostos INT REFERENCES tipocostos (idTipoCostos)
);


-- -----------------------------------------------------
-- Table depreciacionreceta
-- -----------------------------------------------------

CREATE TABLE depreciacionreceta (
  idDepreciacionReceta INT  AUTO_INCREMENT  primary key,
  idDepreciacion INT REFERENCES depreciacion (idDepreciacion),
  idReceta INT REFERENCES receta (idReceta)
);

 
-- -----------------------------------------------------
-- Table gastosadmin
-- -----------------------------------------------------

CREATE TABLE gastosadmin (
  idGastosAdmin INT  AUTO_INCREMENT  primary key,
  descripcion VARCHAR(45) ,
  precioUnitario DECIMAL(10,2) ,
  idUnidadMedida INT REFERENCES unidadmedida (idUnidadMedida),
  idTipoCostos INT REFERENCES tipocostos (idTipoCostos)
);

-- -----------------------------------------------------
-- Table proceso
-- -----------------------------------------------------

CREATE TABLE proceso (
  idProceso INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  idMaquina INT REFERENCES maquina (idMaquina)
);

-- -----------------------------------------------------
-- Table gastosadminproceso
-- -----------------------------------------------------
CREATE TABLE gastosadminproceso (
  idGastosAdminProceso INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  idProceso INT REFERENCES proceso (idProceso),
  idGastosAdmin INT REFERENCES gastosadmin (idGastosAdmin)
);


-- -----------------------------------------------------
-- Table gastosadminreceta
-- -----------------------------------------------------

CREATE TABLE gastosadminreceta (
  idGastosAdminReceta INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  idGastosAdmin INT REFERENCES gastosadmin (idGastosAdmin),
  idReceta INT REFERENCES receta (idReceta)
);
 
 
-- -----------------------------------------------------
-- Table lote
-- -----------------------------------------------------

CREATE TABLE lote (
  idLote INT  AUTO_INCREMENT primary key,
  numeroLote INT ,
  codigo INT ,
  idReceta INT REFERENCES receta (idReceta)
);

-- -----------------------------------------------------
-- Table manodeobra
-- -----------------------------------------------------

CREATE TABLE manodeobra (
  idManodeObra INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  precioUnitario DECIMAL(10,2) ,
  idUnidadMedida INT REFERENCES unidadmedida (idUnidadMedida),
  idTipoCostos INT REFERENCES tipocostos (idTipoCostos)
);

 
-- -----------------------------------------------------
-- Table manodeobraproceso
-- -----------------------------------------------------

CREATE TABLE manodeobraproceso (
  idManodeObraProceso INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  idProceso INT REFERENCES proceso (idProceso),
  idManodeObra INT REFERENCES manodeobra (idManodeObra)
);


-- -----------------------------------------------------
-- Table manodeobrareceta
-- -----------------------------------------------------
CREATE TABLE manodeobrareceta (
  idManodeObraReceta INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  idManodeObra INT REFERENCES manodeobra (idManodeObra),
  idReceta INT REFERENCES receta (idReceta)
);

-- -----------------------------------------------------
-- Table marca
-- -----------------------------------------------------

CREATE TABLE marca (
  idMarca INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) 
);



-- -----------------------------------------------------
-- Table tipomateria
-- -----------------------------------------------------
CREATE TABLE tipomateria (
  idTipoMateria INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) 
);

-- -----------------------------------------------------
-- Table materia
-- -----------------------------------------------------
CREATE TABLE materia (
  idMateria INT  AUTO_INCREMENT primary key,
  nombre VARCHAR(45) ,
  descripcion VARCHAR(45) ,
  cantidad INT ,
  idTipoMateria INT REFERENCES tipomateria (idTipoMateria),
  idUnidadMedida INT REFERENCES unidadmedida (idUnidadMedida),
  idMarca INT REFERENCES marca (idMarca)
);

-- -----------------------------------------------------
-- Table materiacostos
-- -----------------------------------------------------

CREATE TABLE materiacostos (
  idMateriaCostos INT  AUTO_INCREMENT primary key,
  precioUnitario DECIMAL(18,2) ,
  idMateria INT REFERENCES materia (idMateria),
  idTipoCostos INT REFERENCES tipocostos (idTipoCostos)
);


-- -----------------------------------------------------
-- Table materiaproceso
-- -----------------------------------------------------

CREATE TABLE materiaproceso (
  idMateriaProceso INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  idProceso INT REFERENCES proceso (idProceso),
  idMateria INT REFERENCES materia (idMateria) 
);

-- -----------------------------------------------------
-- Table tipomovimiento
-- -----------------------------------------------------


CREATE TABLE tipomovimiento (
  idTipoMovimiento INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) 
);



-- -----------------------------------------------------
-- Table movimiento
-- -----------------------------------------------------


CREATE TABLE movimiento (
  idMovimiento INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(100) ,
  fecha DATETIME ,
  idTipoMovimiento INT REFERENCES tipomovimiento (idTipoMovimiento) 
);



-- -----------------------------------------------------
-- Table movimientomateria
-- -----------------------------------------------------
CREATE TABLE movimientomateria (
  idMovimientoMateria INT  AUTO_INCREMENT primary key,
  cantidad INT ,
  idMovimiento INT REFERENCES movimiento (idMovimiento), 
  idMateria INT REFERENCES materia (idMateria) 
);


-- -----------------------------------------------------
-- Table movimientoproducto
-- -----------------------------------------------------

CREATE TABLE movimientoproducto (
  idMovimientoProducto INT  AUTO_INCREMENT primary key,
  cantidad INT ,
  numeroMovimiento INT ,
  valorUnitario DECIMAL(18,2) ,
  idProductos INT REFERENCES productos (idProductos), 
  idMovimiento INT REFERENCES movimiento (idMovimiento) 
);


-- -----------------------------------------------------
-- Table ordenproduccion
-- -----------------------------------------------------

CREATE TABLE ordenproduccion (
  idOrdenProduccion INT  AUTO_INCREMENT primary key,
  nombre VARCHAR(80) ,
  idReceta INT REFERENCES receta (idReceta) 
);


-- -----------------------------------------------------
-- Table ordenproduccionproceso
-- -----------------------------------------------------


CREATE TABLE ordenproduccionproceso (
  idOrdenProducionProceso INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(80) ,
  idOrdenProduccion INT REFERENCES ordenproduccion (idOrdenProduccion),
  idProceso INT REFERENCES proceso (idProceso)
);

-- -----------------------------------------------------
-- Table Tipo_Sueldo
-- -----------------------------------------------------

CREATE TABLE Tipo_Sueldo (
  idTipo_Sueldo INT AUTO_INCREMENT  primary key,
  descripcion VARCHAR(45) 
);

-- -----------------------------------------------------
-- Table Empleado
-- -----------------------------------------------------
CREATE TABLE Empleado (
  idEmpleado INT  AUTO_INCREMENT primary key,
  nombre VARCHAR(45) ,
  apellido VARCHAR(45) ,
  direccion VARCHAR(45) ,
  telefono INT ,
  correo_electronico VARCHAR(45) ,
  tipoDocumento INT ,
  fecha_nacimiento DATE ,
  cargo_empresa VARCHAR(45) ,
  horario_trabajo VARCHAR(45) ,
  hora_dias INT ,
  sueldo_dia DECIMAL(10,2) ,
  sueldo_mes DECIMAL(10,2) ,
  idTipo_Sueldo INT REFERENCES Tipo_Sueldo (idTipo_Sueldo)
);
 
-- -----------------------------------------------------
-- Table tipoproveedor
-- -----------------------------------------------------

CREATE TABLE tipoproveedor (
  idTipoProveedor INT  AUTO_INCREMENT primary key,
  nombre VARCHAR(45) 
);

-- -----------------------------------------------------
-- Table proveedor
-- -----------------------------------------------------

CREATE TABLE proveedor (
  idProveedor INT  AUTO_INCREMENT primary key,
  nombre VARCHAR(45) ,
  telefono INT ,
  correo VARCHAR(45) ,
  tipoDocumento INT ,
  idTipoProveedor INT REFERENCES tipoproveedor (idTipoProveedor)
);


-- -----------------------------------------------------
-- Table recetamateria
-- -----------------------------------------------------
CREATE TABLE recetamateria (
  idRecetaMateria INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  idMateria INT REFERENCES materia (idMateria),
  idReceta INT REFERENCES receta (idReceta)
);


-- -----------------------------------------------------
-- Table tipodocumento
-- -----------------------------------------------------

CREATE TABLE tipodocumento (
  idTipoDocumento INT  AUTO_INCREMENT primary key,
  nombre VARCHAR(45) 
);



-- -----------------------------------------------------
-- Table Tipo_Unidad
-- -----------------------------------------------------

CREATE TABLE Tipo_Unidad (
  idTipo_Unidad INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) 
);



-- -----------------------------------------------------
-- Table Insumos
-- -----------------------------------------------------

CREATE TABLE Insumos (
  idInsumos INT  AUTO_INCREMENT primary key,
  codigo VARCHAR(45) ,
  nombre VARCHAR(45) ,
  descripcion VARCHAR(100) ,
  marca VARCHAR(45) ,
  precio DECIMAL(10,2) ,
  cantidad DECIMAL(10,2) ,
  idTipo_Unidad INT REFERENCES Tipo_Unidad (idTipo_Unidad)
);


-- -----------------------------------------------------
-- Table Tipo_Productos
-- -----------------------------------------------------

CREATE TABLE Tipo_Productos (
  idTipo_Productos INT auto_increment primary key ,
  descripcion VARCHAR(45) 
);


-- -----------------------------------------------------
-- Table Productos
-- -----------------------------------------------------


CREATE TABLE Productos (
  idProductos INT  AUTO_INCREMENT primary key,
  codigo VARCHAR(45) ,
  nombre VARCHAR(45) ,
  descripcion VARCHAR(100) ,
  cantidad DECIMAL(10,2) ,
  idTipo_Unidad INT REFERENCES Tipo_Unidad (idTipo_Unidad),
  idTipo_Productos INT REFERENCES Tipo_Productos (idTipo_Productos)
);


-- -----------------------------------------------------
-- Table Materiales
-- -----------------------------------------------------

CREATE TABLE Materiales (
  idMateriales INT  AUTO_INCREMENT primary key,
  codigo VARCHAR(45) ,
  nombre VARCHAR(45) ,
  descripcion VARCHAR(100) ,
  cantidad DECIMAL(10,2) ,
  idTipo_Unidad INT REFERENCES Tipo_Unidad (idTipo_Unidad)
);


-- -----------------------------------------------------
-- Table Equipos
-- -----------------------------------------------------

CREATE TABLE Equipos (
  idEquipos INT AUTO_INCREMENT primary key ,
  codigo VARCHAR(45) ,
  nombre VARCHAR(45) ,
  serie VARCHAR(45) ,
  modelo VARCHAR(100) ,
  descripcion VARCHAR(100) ,
  marca VARCHAR(45) ,
  precio DECIMAL(10,2) ,
  año_compra INT ,
  capacidad DECIMAL(10,2) ,
  potencia DECIMAL(10,2) ,
  vida_util INT 
);



-- -----------------------------------------------------
-- Table Tipo_Costo
-- -----------------------------------------------------


CREATE TABLE Tipo_Costo (
  idTipo_Costo INT AUTO_INCREMENT primary key ,
  descripcion VARCHAR(45) 
);



-- -----------------------------------------------------
-- Table Gastos_Administrativos_por_mes
-- -----------------------------------------------------


CREATE TABLE Gastos_Administrativos_por_mes (
  idGastos_Administrativos_por_mes INT  AUTO_INCREMENT primary key,
  requerimiento DECIMAL(10,2) ,
  costos DECIMAL(10,2) ,
  Gastos_Administrativos_por_mescol DECIMAL(10,2) 
);



-- -----------------------------------------------------
-- Table Gastos_Administrativos
-- -----------------------------------------------------


CREATE TABLE Gastos_Administrativos (
  idGastos_Administrativos INT AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  precio DECIMAL(10,2) ,
  idTipo_Unidad INT REFERENCES Tipo_Unidad (idTipo_Unidad),
  idTipo_Costo INT REFERENCES Tipo_Costo (idTipo_Costo),
  idGastos_Administrativos_por_mes INT REFERENCES Gastos_Administrativos_por_mes (idGastos_Administrativos_por_mes)
);

-- -----------------------------------------------------
-- Table Costo_Ventas
-- -----------------------------------------------------

CREATE TABLE Costo_Ventas (
  idCosto_Ventas INT AUTO_INCREMENT  primary key,
  descripcion VARCHAR(45) ,
  precio DECIMAL(10,2) ,
  idTipo_Unidad INT REFERENCES Tipo_Unidad (idTipo_Unidad),
  idTipo_Costo INT REFERENCES Tipo_Costo (idTipo_Costo)
);


-- -----------------------------------------------------
-- Table Costo_Marketing
-- -----------------------------------------------------
CREATE TABLE Costo_Marketing (
  idCosto_Marketing INT AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  precio DECIMAL(10,2) ,
  idTipo_Unidad INT REFERENCES Tipo_Unidad (idTipo_Unidad),
  idTipo_Costo INT REFERENCES Tipo_Costo (idTipo_Costo)
);


-- -----------------------------------------------------
-- Table Costo_Operativos
-- -----------------------------------------------------
CREATE TABLE Costo_Operativos (
  idCosto_Operativos INT AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  precio DECIMAL(10,2) ,
  idTipo_Unidad INT REFERENCES Tipo_Unidad (idTipo_Unidad),
  idTipo_Costo INT REFERENCES Tipo_Costo (idTipo_Costo)
);


-- -----------------------------------------------------
-- Table Movimiento_Insumos
-- -----------------------------------------------------


CREATE TABLE Movimiento_Insumos (
  idMovimiento_Insumos INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  observacion VARCHAR(45) ,
  fecha DATE ,
  hora TIME ,
  estado VARCHAR(45) ,
  idInsumos INT REFERENCES Insumos (idInsumos)
);

-- -----------------------------------------------------
-- Table Inventario_Insumos
-- -----------------------------------------------------

CREATE TABLE Inventario_Insumos (
  idInventario_Insumos INT  AUTO_INCREMENT primary key,
  stock DECIMAL(10,2) ,
  idInsumos INT REFERENCES Insumos (idInsumos)
);

-- -----------------------------------------------------
-- Table Inventario_Productos
-- -----------------------------------------------------

CREATE TABLE Inventario_Productos (
  idInventario_Productos INT  AUTO_INCREMENT primary key,
  stock DECIMAL(10,2) ,
  idProductos INT REFERENCES Productos (idProductos)
);




-- -----------------------------------------------------
-- Table Movimiento_Productos
-- -----------------------------------------------------

CREATE TABLE Movimiento_Productos (
  idMovimiento_Insumos INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  observacion VARCHAR(45) ,
  fecha DATE ,
  hora TIME ,
  estado VARCHAR(45) ,
  lote VARCHAR(45) ,
  idProductos INT REFERENCES Productos (idProductos)
);


-- -----------------------------------------------------
-- Table Inventario_Materiales
-- -----------------------------------------------------

CREATE TABLE Inventario_Materiales (
  idInventario_Materiales INT  AUTO_INCREMENT primary key,
  stock DECIMAL(10,2) ,
  idMateriales INT REFERENCES Materiales (idMateriales)
);


-- -----------------------------------------------------
-- Table Movimiento_Materiales
-- -----------------------------------------------------


CREATE TABLE Movimiento_Materiales (
  idMovimiento_Materiales INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  observacion VARCHAR(45) ,
  fecha DATE ,
  hora TIME ,
  estado VARCHAR(45) ,
  lote VARCHAR(45) ,
  idMateriales INT REFERENCES Materiales (idMateriales)
);


-- -----------------------------------------------------
-- Table Inventario_Equipos
-- -----------------------------------------------------


CREATE TABLE Inventario_Equipos (
  idInventario_Materiales INT  AUTO_INCREMENT primary key,
  stock DECIMAL(10,2) ,
  idEquipos INT REFERENCES Equipos (idEquipos)
);




-- -----------------------------------------------------
-- Table Movimiento_Equipos
-- -----------------------------------------------------


CREATE TABLE Movimiento_Equipos (
  idEquipos INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  observacion VARCHAR(45) ,
  fecha DATE ,
  hora TIME ,
  estado VARCHAR(45) ,
  lote VARCHAR(45) ,
  condicion VARCHAR(45) 
);


-- -----------------------------------------------------
-- Table Receta
-- -----------------------------------------------------

CREATE TABLE Receta (
  idReceta INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  batch DECIMAL(10,2) ,
  estado INT ,
  fecha_incio DATE ,
  fecha_fin DATE ,
  lote VARCHAR(45) ,
  pesoportableta DECIMAL(10,2) ,
  pesoentableta DECIMAL(10,2) ,
  merma DECIMAL(10,2) ,
  reproceso DECIMAL(10,2) ,
  fecha_vencimiento DATE ,
  idproductos INT REFERENCES Productos (idproductos)
);


-- -----------------------------------------------------
-- Table Receta_Insumos
-- -----------------------------------------------------

CREATE TABLE Receta_Insumos (
  idReceta_Insumos INT  AUTO_INCREMENT primary key,
  peso_neto DECIMAL(10,2) ,
  costo DECIMAL(10,2) ,
  idInsumos INT REFERENCES Insumos (idInsumos),
  idReceta INT REFERENCES Receta (idReceta)
);


-- -----------------------------------------------------
-- Table Receta_Materiales
-- -----------------------------------------------------


CREATE TABLE Receta_Materiales (
  idReceta_Materiales INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  costo DECIMAL(10,2) ,
  idMateriales INT REFERENCES Materiales (idMateriales),
  idReceta INT REFERENCES Receta (idReceta)
);


-- -----------------------------------------------------
-- Table Mano_Obra
-- -----------------------------------------------------

CREATE TABLE Mano_Obra (
  idMano_Obra INT  AUTO_INCREMENT primary key,
  requerimiento TIME ,
  costo DECIMAL(10,2) ,
  idEmpleado INT REFERENCES Empleado (idEmpleado),
  idEquipos INT REFERENCES Equipos (idEquipos)
);


-- -----------------------------------------------------
-- Table Tarifa_Energia
-- -----------------------------------------------------

CREATE TABLE Tarifa_Energia (
  idTarifa_Energia INT  AUTO_INCREMENT primary key,
  tarifakwh DECIMAL(10,2) 
);


-- -----------------------------------------------------
-- Table Consumo_Energia
-- -----------------------------------------------------

CREATE TABLE Consumo_Energia (
  idConsumo_Energia INT  AUTO_INCREMENT primary key,
  horasporbatch TIME ,
  idTarifa_Energia INT REFERENCES Tarifa_Energia (idTarifa_Energia),
  idEquipos INT REFERENCES Equipos (idEquipos)
);
  

-- -----------------------------------------------------
-- Table Consumo_Gas
-- -----------------------------------------------------

CREATE TABLE Consumo_Gas (
  idConsumo_Gas INT  AUTO_INCREMENT primary key,
  peso_gas DECIMAL(10,2) ,
  horastrabajoporbatch TIME ,
  tarifagasporkg DECIMAL(10,2) ,
  idEquipos INT REFERENCES Equipos (idEquipos),
  idReceta INT REFERENCES Receta (idReceta)
);



-- -----------------------------------------------------
-- Table Receta_Costo_Ventas
-- -----------------------------------------------------

CREATE TABLE Receta_Costo_Ventas (
  idReceta_Costo_Ventas INT  AUTO_INCREMENT primary key,
  requerimiento DECIMAL(10,2) ,
  costo DECIMAL(10,2) ,
  idReceta INT REFERENCES Receta (idReceta),
  idCosto_Ventas INT REFERENCES Costo_Ventas (idCosto_Ventas)
);

-- -----------------------------------------------------
-- Table Receta_Costo_Marketing
-- -----------------------------------------------------


CREATE TABLE Receta_Costo_Marketing (
  idReceta_Costo_Marketing INT  AUTO_INCREMENT primary key,
  requerimiento DECIMAL(10,2) ,
  costo DECIMAL(10,2) ,
  idReceta INT REFERENCES Receta (idReceta),
  idCosto_Marketing INT REFERENCES Costo_Marketing (idCosto_Marketing)
);


-- -----------------------------------------------------
-- Table Receta_Costo_Operativos
-- -----------------------------------------------------

CREATE TABLE Receta_Costo_Operativos (
  idReceta_Costo_Operativos INT  AUTO_INCREMENT primary key,
  requerimiento DECIMAL(10,2) ,
  costo DECIMAL(10,2) ,
  idReceta INT REFERENCES Receta (idReceta),
  idCosto_Operativos INT REFERENCES Costo_Operativos (idCosto_Operativos)
);

-- -----------------------------------------------------
-- Table Costos_receta_por_Mes
-- -----------------------------------------------------

CREATE TABLE Costos_receta_por_Mes (
  idCostos_Gastos_Administrativos INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  mes VARCHAR(45) ,
  costototalrecetapormes DECIMAL(10,2) ,
  idGastos_Administrativos_por_mes INT REFERENCES Gastos_Administrativos_por_mes (idGastos_Administrativos_por_mes)
);

-- -----------------------------------------------------
-- Table usuario
-- -----------------------------------------------------

CREATE TABLE usuario (
  idUsuario INT  AUTO_INCREMENT primary key,
  nombre VARCHAR(45) ,
  correo VARCHAR(45) ,
  perfil VARCHAR(45) ,
  contraseña VARCHAR(45) 
);




-- -----------------------------------------------------
-- Table Modulos
-- -----------------------------------------------------

CREATE TABLE Modulos (
  idModulos INT AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) 
);


-- -----------------------------------------------------
-- Table Usuario_Modulos
-- -----------------------------------------------------

CREATE TABLE Usuario_Modulos (
  idUsuario_Modulos INT  AUTO_INCREMENT primary key,
  idUsuario INT REFERENCES usuario (idUsuario),
  idModulos INT REFERENCES Modulos (idModulos)
);




alter Table consumoenergia add foreign key (idMaquina) REFERENCES  maquina (idMaquina);
alter Table consumoenergia add foreign key (idTipoCostos) REFERENCES  tipocostos (idTipoCostos);
alter Table consumoenergia add foreign key (idUnidadMedida) REFERENCES  unidadmedida (idUnidadMedida);

alter Table receta add foreign key (idProductos) REFERENCES  productos (idProductos);

 alter Table consumoenergiareceta add foreign key (idConsumoEnergia) REFERENCES  consumoenergia (idConsumoEnergia);
 alter Table consumoenergiareceta add foreign key (idReceta) REFERENCES  receta (idReceta);

 alter Table depreciacion add foreign key (idMaquina) REFERENCES  maquina (idMaquina);
 alter Table depreciacion add foreign key (idTipoCostos) REFERENCES  tipocostos (idTipoCostos);

 alter Table depreciacionreceta add foreign key (idDepreciacion) REFERENCES  depreciacion(idDepreciacion);
 alter Table depreciacionreceta add foreign key (idReceta) REFERENCES  receta (idReceta);


 alter Table gastosadmin add foreign key (idUnidadMedida) REFERENCES  unidadmedida (idUnidadMedida);
 alter Table gastosadmin add foreign key (idTipoCostos) REFERENCES  tipocostos (idTipoCostos);

 alter Table proceso add foreign key (idMaquina) REFERENCES  maquina (idMaquina);

 alter Table gastosadminproceso add foreign key (idProceso) REFERENCES  proceso (idProceso);
 alter Table gastosadminproceso add foreign key (idGastosAdmin) REFERENCES  gastosadmin (idGastosAdmin);

 alter Table gastosadminreceta add foreign key (idGastosAdmin) REFERENCES  gastosadmin (idGastosAdmin);
 alter Table gastosadminreceta add foreign key (idReceta) REFERENCES  receta (idReceta);

 alter Table lote add foreign key (idReceta) REFERENCES  receta (idReceta);

  alter Table manodeobra add foreign key (idUnidadMedida) REFERENCES  unidadmedida (idUnidadMedida); 
  alter Table manodeobra add foreign key (idTipoCostos) REFERENCES  tipocostos (idTipoCostos);

  alter Table manodeobraproceso add foreign key (idProceso) REFERENCES  proceso (idProceso); 
  alter Table manodeobraproceso add foreign key (idManodeObra) REFERENCES  manodeobra (idManodeObra);

  alter Table manodeobrareceta add foreign key (idReceta) REFERENCES  receta (idReceta); 
  alter Table manodeobrareceta add foreign key (idManodeObra) REFERENCES  manodeobra (idManodeObra);

  alter Table materia add foreign key (idTipoMateria) REFERENCES  tipomateria (idTipoMateria); 
  alter Table materia add foreign key (idUnidadMedida) REFERENCES  unidadmedida (idUnidadMedida);
  alter Table materia add foreign key (idMarca) REFERENCES  marca (idMarca);

  alter Table materiacostos add foreign key (idMateria) REFERENCES  materia (idMateria);
  alter Table materiacostos add foreign key (idTipoCostos) REFERENCES  tipocostos (idTipoCostos);

  alter Table materiaproceso add foreign key (idProceso) REFERENCES  proceso (idProceso);
  alter Table materiaproceso add foreign key (idMateria) REFERENCES  materia (idMateria);

 alter Table movimiento add foreign key (idTipoMovimiento) REFERENCES  tipomovimiento (idTipoMovimiento);

 alter Table movimientomateria add foreign key (idMovimiento) REFERENCES  movimiento (idMovimiento);
 alter Table movimientomateria add foreign key (idMateria) REFERENCES  materia (idMateria);

 alter Table movimientoproducto add foreign key (idProductos) REFERENCES productos (idProductos);
 alter Table movimientoproducto add foreign key (idMovimiento) REFERENCES movimiento (idMovimiento);

 alter Table ordenproduccion add foreign key (idReceta) REFERENCES receta (idReceta);

 alter Table ordenproduccionproceso add foreign key (idOrdenProduccion) REFERENCES ordenproduccion (idOrdenProduccion);
 alter Table ordenproduccionproceso add foreign key (idProceso) REFERENCES proceso (idProceso);

 alter Table Empleado add foreign key (idTipo_Sueldo) REFERENCES Tipo_Sueldo (idTipo_Sueldo);

 alter Table proveedor add foreign key (idTipoProveedor) REFERENCES tipoproveedor (idTipoProveedor);

 alter Table recetamateria add foreign key (idMateria) REFERENCES materia (idMateria);
  alter Table recetamateria add foreign key (idReceta) REFERENCES receta (idReceta);

  alter Table Insumos add foreign key (idTipo_Unidad) REFERENCES Tipo_Unidad (idTipo_Unidad);

  alter Table Productos add foreign key (idTipo_Unidad) REFERENCES Tipo_Unidad (idTipo_Unidad);
  alter Table Productos add foreign key (idTipo_Productos) REFERENCES Tipo_Productos (idTipo_Productos);

  alter Table Materiales add foreign key (idTipo_Unidad) REFERENCES Tipo_Unidad (idTipo_Unidad);

  alter Table Gastos_Administrativos add foreign key (idTipo_Unidad) REFERENCES Tipo_Unidad (idTipo_Unidad);
  alter Table Gastos_Administrativos add foreign key (idTipo_Costo) REFERENCES Tipo_Costo (idTipo_Costo);
  alter Table Gastos_Administrativos add foreign key (idGastos_Administrativos_por_mes) REFERENCES Gastos_Administrativos_por_mes (idGastos_Administrativos_por_mes);

  alter Table Costo_Ventas add foreign key (idTipo_Unidad) REFERENCES Tipo_Unidad (idTipo_Unidad);
  alter Table Costo_Ventas add foreign key (idTipo_Costo) REFERENCES Tipo_Costo (idTipo_Costo);

  alter Table Costo_Marketing add foreign key (idTipo_Unidad) REFERENCES Tipo_Unidad (idTipo_Unidad);
  alter Table Costo_Marketing add foreign key (idTipo_Costo) REFERENCES Tipo_Costo (idTipo_Costo);


  alter Table Costo_Operativos add foreign key (idTipo_Unidad) REFERENCES Tipo_Unidad (idTipo_Unidad);
  alter Table Costo_Operativos add foreign key (idTipo_Costo) REFERENCES Tipo_Costo (idTipo_Costo);

  alter Table Movimiento_Insumos add foreign key (idInsumos) REFERENCES Insumos (idInsumos);

  alter Table Inventario_Insumos add foreign key (idInsumos) REFERENCES Insumos (idInsumos);

  alter Table Inventario_Productos add foreign key (idProductos) REFERENCES Productos (idProductos);

  alter Table Movimiento_Productos add foreign key (idProductos) REFERENCES Productos (idProductos);

  alter Table Inventario_Materiales add foreign key (idMateriales) REFERENCES Materiales (idMateriales);

  alter Table Movimiento_Materiales add foreign key (idMateriales) REFERENCES Materiales (idMateriales);

  alter Table Inventario_Equipos add foreign key (idEquipos) REFERENCES Equipos (idEquipos);

  alter Table Movimiento_Equipos add foreign key (idEquipos) REFERENCES Equipos (idEquipos);

  alter Table Receta_Insumos add foreign key (idInsumos) REFERENCES Insumos (idInsumos);
  alter Table Receta_Insumos add foreign key (idReceta) REFERENCES Receta (idReceta);

  alter Table Receta_Materiales add foreign key (idMateriales) REFERENCES Materiales (idMateriales);
  alter Table Receta_Materiales add foreign key (idReceta) REFERENCES Receta (idReceta);

  alter Table Mano_Obra add foreign key (idEmpleado) REFERENCES Empleado (idEmpleado);
  alter Table Mano_Obra add foreign key (idEquipos) REFERENCES Equipos (idEquipos);

 alter Table Consumo_Energia add foreign key (idEquipos) REFERENCES Equipos (idEquipos);
 alter Table Consumo_Energia add foreign key (idTarifa_Energia) REFERENCES Tarifa_Energia (idTarifa_Energia);

 alter Table Consumo_Gas add foreign key (idEquipos) REFERENCES Equipos (idEquipos);
 alter Table Consumo_Gas add foreign key (idReceta) REFERENCES Receta (idReceta);

 alter Table Receta_Costo_Ventas add foreign key (idCosto_Ventas) REFERENCES Costo_Ventas (idCosto_Ventas);
 alter Table Receta_Costo_Ventas add foreign key (idReceta) REFERENCES Receta (idReceta);

alter Table Receta_Costo_Marketing add foreign key (idCosto_Marketing) REFERENCES Costo_Marketing (idCosto_Marketing);
 alter Table Receta_Costo_Marketing add foreign key (idReceta) REFERENCES Receta (idReceta);

  alter Table Receta_Costo_Operativos add foreign key (idCosto_Operativos) REFERENCES Costo_Operativos (idCosto_Operativos);
 alter Table Receta_Costo_Operativos add foreign key (idReceta) REFERENCES Receta (idReceta);

 alter Table Costos_receta_por_Mes add foreign key (idGastos_Administrativos_por_mes) REFERENCES Gastos_Administrativos_por_mes (idGastos_Administrativos_por_mes);

 alter Table Usuario_Modulos add foreign key (idUsuario) REFERENCES usuario (idUsuario);
 alter Table Usuario_Modulos add foreign key (idModulos) REFERENCES Modulos (idModulos);

