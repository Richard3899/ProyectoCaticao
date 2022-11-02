DROP DATABASE IF EXISTS caticao;
CREATE DATABASE IF NOT EXISTS caticao;
USE caticao;

-- -----------------------------------------------------
-- Table almacen
-- -----------------------------------------------------
CREATE TABLE almacen (
  idAlmacen INT  AUTO_INCREMENT  primary key,
  descripcion VARCHAR(45)
);
-- -----------------------------------------------------
-- Table maquina
-- -----------------------------------------------------

CREATE TABLE maquina (
  idMaquina INT  AUTO_INCREMENT  primary key,
  codigo VARCHAR(20) ,
  nombre VARCHAR(50) ,
  serie VARCHAR(20) ,
  modelo VARCHAR(100) ,
  descripcion VARCHAR(100) ,
  marca VARCHAR(50) ,
  precio DECIMAL(10,2) ,
  añoCompra INT ,
  capacidad DECIMAL(10,2) ,
  potencia DECIMAL(10,2) ,
  vidaUtil INT 
);
-- -----------------------------------------------------
-- Table tipocosto
-- -----------------------------------------------------
CREATE TABLE tipocosto (
  idTipoCosto INT  AUTO_INCREMENT  primary key,
  descripcion VARCHAR(45)
);

-- -----------------------------------------------------
-- Table unidadmedida
-- -----------------------------------------------------
CREATE TABLE unidadmedida (
  idUnidadMedida INT  AUTO_INCREMENT  primary key,
  descripcion VARCHAR(45)
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
  idTipoCosto INT REFERENCES tipocosto (idTipoCosto) ,
  idUnidadMedida INT REFERENCES unidadmedida (idUnidadMedida) 
);
-- -----------------------------------------------------
-- Table tipoproducto
-- -----------------------------------------------------

CREATE TABLE tipoproducto (
  idTipoProducto INT  AUTO_INCREMENT  primary key,
  descripcion VARCHAR(45)
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
  idTipoCosto INT REFERENCES tipocosto (idTipoCosto)
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
-- Table gastoadmin
-- -----------------------------------------------------

CREATE TABLE gastoadmin (
  idGastoAdmin INT  AUTO_INCREMENT  primary key,
  descripcion VARCHAR(45) ,
  precioUnitario DECIMAL(10,2) ,
  idUnidadMedida INT REFERENCES unidadmedida (idUnidadMedida),
  idTipoCosto INT REFERENCES tipocosto (idTipoCosto)
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
-- Table gastoadminproceso
-- -----------------------------------------------------
CREATE TABLE gastoadminproceso (
  idGastoAdminProceso INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  idProceso INT REFERENCES proceso (idProceso),
  idGastoAdmin INT REFERENCES gastoadmin (idGastoAdmin)
);


-- -----------------------------------------------------
-- Table gastoadminreceta
-- -----------------------------------------------------

CREATE TABLE gastoadminreceta (
  idGastosAdminReceta INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  idGastoAdmin INT REFERENCES gastosadmin (idGastoAdmin),
  idReceta INT REFERENCES receta (idReceta)
);
 
-- -----------------------------------------------------
-- Table lote
-- -----------------------------------------------------

CREATE TABLE lote (
  idLote INT  AUTO_INCREMENT primary key,
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
  idTipoCosto INT REFERENCES tipocosto (idTipoCosto)
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
  codigo VARCHAR(20) ,
  nombre VARCHAR(50) ,
  descripcion VARCHAR(100) ,
  precio DECIMAL(10,2) ,
  cantidad DECIMAL(10,2) ,
  imagen VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
  idUnidadMedida INT REFERENCES unidadmedida(idUnidadMedida),
  idMarca INT REFERENCES Marca (idMarca),
  idTipoMateria INT REFERENCES tipomateria (idTipoMateria)
);

-- -----------------------------------------------------
-- Table materiacosto
-- -----------------------------------------------------

CREATE TABLE materiacosto (
  idMateriaCostos INT  AUTO_INCREMENT primary key,
  precioUnitario DECIMAL(18,2) ,
  idMateria INT REFERENCES materia (idMateria),
  idTipoCosto INT REFERENCES tipocosto (idTipoCosto)
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
-- Table ordenproduccion
-- -----------------------------------------------------

CREATE TABLE ordenproduccion (
  idOrdenProduccion INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(80) ,
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
-- Table Tipo Sueldo
-- -----------------------------------------------------

CREATE TABLE TipoSueldo (
  idTipoSueldo INT AUTO_INCREMENT  primary key,
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
  idTipoSueldo INT REFERENCES TipoSueldo (idTipoSueldo)
);
 
-- -----------------------------------------------------
-- Table tipoproveedor
-- -----------------------------------------------------

CREATE TABLE tipoproveedor (
  idTipoProveedor INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) 
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
  descripcion VARCHAR(45) 
);



-- -----------------------------------------------------
-- Table Tipo Unidad
-- -----------------------------------------------------

CREATE TABLE tipounidad (
  idTipoUnidad INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) 
);


-- -----------------------------------------------------
-- Table Insumo
-- -----------------------------------------------------

CREATE TABLE insumo (
  idInsumo INT  AUTO_INCREMENT primary key,
  codigo VARCHAR(45) ,
  nombre VARCHAR(45) ,
  descripcion VARCHAR(100) ,
  precio DECIMAL(10,2) ,
  cantidad DECIMAL(10,2) ,
  imagen VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
  idTipoUnidad INT REFERENCES TipoUnidad (idTipoUnidad),
  idMarca INT REFERENCES Marca (idMarca)
);


-- -----------------------------------------------------
-- Table Producto
-- -----------------------------------------------------


CREATE TABLE producto (
  idProducto INT  AUTO_INCREMENT primary key,
  codigo VARCHAR(45) ,
  nombre VARCHAR(45) ,
  descripcion VARCHAR(100) ,
  cantidad DECIMAL(10,2) ,
  imagen VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
  idUnidadMedida INT REFERENCES unidadmedida (idUnidadMedida),
  idTipoProducto INT REFERENCES TipoProducto (idTipo_Producto)
);


-- -----------------------------------------------------
-- Table Material
-- -----------------------------------------------------

CREATE TABLE material (
  idMaterial INT  AUTO_INCREMENT primary key,
  codigo VARCHAR(45) ,
  nombre VARCHAR(45) ,
  descripcion VARCHAR(100) ,
  cantidad DECIMAL(10,2) ,
  idTipoUnidad INT REFERENCES TipoUnidad (idTipoUnidad)
);


-- -----------------------------------------------------
-- Table Equipos
-- -----------------------------------------------------

CREATE TABLE equipo (
  idEquipo INT AUTO_INCREMENT primary key ,
  codigo VARCHAR(45) ,
  nombre VARCHAR(45) ,
  serie VARCHAR(45) ,
  modelo VARCHAR(100) ,
  descripcion VARCHAR(100) ,
  marca VARCHAR(45) ,
  precio DECIMAL(10,2) ,
  añoCompra INT ,
  capacidad DECIMAL(10,2) ,
  potencia DECIMAL(10,2) ,
  vidaUtil INT 
);



-- -----------------------------------------------------
-- Table Gastos_Administrativos_por_mes
-- -----------------------------------------------------


CREATE TABLE gastoadministrativopormes (
  idGastoAdministrativopormes INT  AUTO_INCREMENT primary key,
  requerimiento DECIMAL(10,2) ,
  costos DECIMAL(10,2)
);



-- -----------------------------------------------------
-- Table Gastos_Administrativos
-- -----------------------------------------------------


CREATE TABLE gastoadministrativo (
  idGastoAdministrativo INT AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  precio DECIMAL(10,2) ,
  idTipoUnidad INT REFERENCES TipoUnidad (idTipoUnidad),
  idTipoCosto INT REFERENCES TipoCosto (idTipoCosto),
  idGastoAdministrativopormes INT REFERENCES GastoAdministrativopormes (idGastoAdministrativospormes)
);

-- -----------------------------------------------------
-- Table Costo Venta
-- -----------------------------------------------------

CREATE TABLE costoventa (
  idCostoVenta INT AUTO_INCREMENT  primary key,
  descripcion VARCHAR(45) ,
  precio DECIMAL(10,2) ,
  idTipoUnidad INT REFERENCES TipoUnidad (idTipoUnidad),
  idTipoCosto INT REFERENCES TipoCosto (idTipoCosto)
);


-- -----------------------------------------------------
-- Table Costo Marketing
-- -----------------------------------------------------
CREATE TABLE costomarketing (
  idCostoMarketing INT AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  precio DECIMAL(10,2) ,
  idTipoUnidad INT REFERENCES TipoUnidad (idTipoUnidad),
  idTipoCosto INT REFERENCES TipoCosto (idTipoCosto)
);


-- -----------------------------------------------------
-- Table Costo Operativo
-- -----------------------------------------------------
CREATE TABLE costooperativo (
  idCostoOperativo INT AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  precio DECIMAL(10,2) ,
  idTipoUnidad INT REFERENCES TipoUnidad (idTipoUnidad),
  idTipoCosto INT REFERENCES TipoCosto (idTipoCosto)
);


-- -----------------------------------------------------
-- Table Movimiento Insumo
-- -----------------------------------------------------


CREATE TABLE MovimientoInsumo (
  idMovimientoInsumo INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  observacion VARCHAR(45) ,
  fecha DATE ,
  hora TIME ,
  estado VARCHAR(45) ,
  idInsumo INT REFERENCES Insumo (idInsumo)
);

-- -----------------------------------------------------
-- Table Inventario Insumo
-- -----------------------------------------------------

CREATE TABLE InventarioInsumo (
  idInventarioInsumo INT  AUTO_INCREMENT primary key,
  stock DECIMAL(10,2) ,
  idInsumo INT REFERENCES Insumo (idInsumo)
);

-- -----------------------------------------------------
-- Table Inventario Producto
-- -----------------------------------------------------

CREATE TABLE InventarioProducto (
  idInventarioProducto INT  AUTO_INCREMENT primary key,
  stock DECIMAL(10,2) ,
  idProducto INT REFERENCES Producto (idProducto)
);




-- -----------------------------------------------------
-- Table Movimiento Producto
-- -----------------------------------------------------

CREATE TABLE MovimientoProducto (
  idMovimientoProducto INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  observacion VARCHAR(45) ,
  fecha DATE ,
  hora TIME ,
  estado VARCHAR(45) ,
  lote VARCHAR(45) ,
  idProducto INT REFERENCES Producto (idProducto)
);


-- -----------------------------------------------------
-- Table Inventario Material
-- -----------------------------------------------------

CREATE TABLE InventarioMaterial (
  idInventarioMaterial INT  AUTO_INCREMENT primary key,
  stock DECIMAL(10,2) ,
  idMaterial INT REFERENCES Material (idMaterial)
);


-- -----------------------------------------------------
-- Table Movimiento Material
-- -----------------------------------------------------


CREATE TABLE MovimientoMaterial (
  idMovimientoMaterial INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  observacion VARCHAR(45) ,
  fecha DATE ,
  hora TIME ,
  estado VARCHAR(45) ,
  lote VARCHAR(45) ,
  idMaterial INT REFERENCES Material (idMaterial)
);


-- -----------------------------------------------------
-- Table Inventario Equipo
-- -----------------------------------------------------


CREATE TABLE InventarioEquipo (
  idInventarioEquipo INT  AUTO_INCREMENT primary key,
  stock DECIMAL(10,2) ,
  idEquipo INT REFERENCES Equipo (idEquipo)
);




-- -----------------------------------------------------
-- Table Movimiento_Equipos
-- -----------------------------------------------------


CREATE TABLE MovimientoEquipo (
  idMovimientoEquipo INT  AUTO_INCREMENT primary key,
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
  fechaincio DATE ,
  fechafin DATE ,
  lote VARCHAR(45) ,
  pesoportableta DECIMAL(10,2) ,
  pesoentableta DECIMAL(10,2) ,
  merma DECIMAL(10,2) ,
  reproceso DECIMAL(10,2) ,
  fechavencimiento DATE ,
  idproducto INT REFERENCES Producto (idproducto)
);


-- -----------------------------------------------------
-- Table Receta Insumo
-- -----------------------------------------------------

CREATE TABLE RecetaInsumo (
  idRecetaInsumo INT  AUTO_INCREMENT primary key,
  pesoneto DECIMAL(10,2) ,
  costo DECIMAL(10,2) ,
  idInsumo INT REFERENCES Insumo (idInsumo),
  idReceta INT REFERENCES Receta (idReceta)
);


-- -----------------------------------------------------
-- Table Receta_Material
-- -----------------------------------------------------


CREATE TABLE RecetaMaterial (
  idRecetaMaterial INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  costo DECIMAL(10,2) ,
  idMaterial INT REFERENCES Material (idMaterial),
  idReceta INT REFERENCES Receta (idReceta)
);


-- -----------------------------------------------------
-- Table Mano_Obra
-- -----------------------------------------------------

CREATE TABLE ManoObra (
  idManoObra INT  AUTO_INCREMENT primary key,
  requerimiento TIME ,
  costo DECIMAL(10,2) ,
  idEmpleado INT REFERENCES Empleado (idEmpleado),
  idEquipo INT REFERENCES Equipo (idEquipo)
);


-- -----------------------------------------------------
-- Table Tarifa_Energia
-- -----------------------------------------------------

CREATE TABLE TarifaEnergia (
  idTarifaEnergia INT  AUTO_INCREMENT primary key,
  tarifakwh DECIMAL(10,2) 
);


-- -----------------------------------------------------
-- Table Consumo_Gas
-- -----------------------------------------------------

CREATE TABLE ConsumoGas (
  idConsumoGas INT  AUTO_INCREMENT primary key,
  pesogas DECIMAL(10,2) ,
  horastrabajoporbatch TIME ,
  tarifagasporkg DECIMAL(10,2) ,
  idEquipo INT REFERENCES Equipo (idEquipo),
  idReceta INT REFERENCES Receta (idReceta)
);


-- -----------------------------------------------------
-- Table Receta_Costo_Ventas
-- -----------------------------------------------------

CREATE TABLE RecetaCostoVenta (
  idRecetaCostoVenta INT  AUTO_INCREMENT primary key,
  requerimiento DECIMAL(10,2) ,
  costo DECIMAL(10,2) ,
  idReceta INT REFERENCES Receta (idReceta),
  idCostoVenta INT REFERENCES CostoVenta (idCostoVenta)
);

-- -----------------------------------------------------
-- Table Receta_Costo_Marketing
-- -----------------------------------------------------


CREATE TABLE RecetaCostoMarketing (
  idRecetaCostoMarketing INT  AUTO_INCREMENT primary key,
  requerimiento DECIMAL(10,2) ,
  costo DECIMAL(10,2) ,
  idReceta INT REFERENCES Receta (idReceta),
  idCostoMarketing INT REFERENCES CostoMarketing (idCostoMarketing)
);


-- -----------------------------------------------------
-- Table Receta_Costo_Operativos
-- -----------------------------------------------------

CREATE TABLE RecetaCostoOperativo (
  idRecetaCostoOperativo INT  AUTO_INCREMENT primary key,
  requerimiento DECIMAL(10,2) ,
  costo DECIMAL(10,2) ,
  idReceta INT REFERENCES Receta (idReceta),
  idCostoOperativo INT REFERENCES CostoOperativo (idCostoOperativo)
);

-- -----------------------------------------------------
-- Table Costos_receta_por_Mes
-- -----------------------------------------------------

CREATE TABLE CostorecetaporMes (
  idCostorecetaporMes INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  mes VARCHAR(45) ,
  costototalrecetapormes DECIMAL(10,2) ,
  idGastoAdministrativopormes INT REFERENCES GastoAdministrativopormes (idGastoAdministrativopormes)
);

-- -----------------------------------------------------
-- Table usuario
-- -----------------------------------------------------

CREATE TABLE usuario (
  idUsuario INT  AUTO_INCREMENT primary key,
  nombre VARCHAR(45) NOT NULL COLLATE 'utf8_spanish_ci',
  usuario VARCHAR(45) NOT NULL COLLATE 'utf8_spanish_ci',
	password VARCHAR(100) NOT NULL COLLATE 'utf8_spanish_ci',
	perfil VARCHAR(45) NOT NULL COLLATE 'utf8_spanish_ci',
	foto VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_spanish_ci',
	estado INT(11) NULL DEFAULT NULL,
	ultimo_login DATETIME NULL DEFAULT NULL,
	fecha TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------------------------------
-- Table Modulos
-- -----------------------------------------------------

CREATE TABLE Modulo (
  idModulo INT AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) 
);


-- -----------------------------------------------------
-- Table Usuario_Modulos
-- -----------------------------------------------------

CREATE TABLE UsuarioModulo (
  idUsuarioModulo INT  AUTO_INCREMENT primary key,
  idUsuario INT REFERENCES usuario (idUsuario),
  idModulo INT REFERENCES Modulo (idModulo)
);




alter Table consumoenergia add foreign key (idMaquina) REFERENCES  maquina (idMaquina);
alter Table consumoenergia add foreign key (idTipoCosto) REFERENCES  tipocosto (idTipoCosto);
alter Table consumoenergia add foreign key (idUnidadMedida) REFERENCES  unidadmedida (idUnidadMedida);

alter Table receta add foreign key (idProducto) REFERENCES  producto (idProducto);

alter Table consumoenergiareceta add foreign key (idConsumoEnergia) REFERENCES  consumoenergia (idConsumoEnergia);
alter Table consumoenergiareceta add foreign key (idReceta) REFERENCES  receta (idReceta);

alter Table depreciacion add foreign key (idMaquina) REFERENCES  maquina (idMaquina);
alter Table depreciacion add foreign key (idTipoCosto) REFERENCES  tipocosto (idTipoCosto);

alter Table depreciacionreceta add foreign key (idDepreciacion) REFERENCES  depreciacion(idDepreciacion);
alter Table depreciacionreceta add foreign key (idReceta) REFERENCES  receta (idReceta);


alter Table gastoadmin add foreign key (idUnidadMedida) REFERENCES  unidadmedida (idUnidadMedida);
alter Table gastoadmin add foreign key (idTipoCosto) REFERENCES  tipocosto (idTipoCosto);

alter Table proceso add foreign key (idMaquina) REFERENCES  maquina (idMaquina);

alter Table gastoadminproceso add foreign key (idProceso) REFERENCES  proceso (idProceso);
alter Table gastoadminproceso add foreign key (idGastoAdmin) REFERENCES  gastoadmin (idGastoAdmin);

alter Table gastoadminreceta add foreign key (idGastoAdmin) REFERENCES  gastoadmin (idGastoAdmin);
alter Table gastoadminreceta add foreign key (idReceta) REFERENCES  receta (idReceta);

alter Table lote add foreign key (idReceta) REFERENCES  receta (idReceta);

alter Table manodeobra add foreign key (idUnidadMedida) REFERENCES  unidadmedida (idUnidadMedida); 
alter Table manodeobra add foreign key (idTipoCosto) REFERENCES  tipocosto (idTipoCosto);

alter Table manodeobraproceso add foreign key (idProceso) REFERENCES  proceso (idProceso); 
alter Table manodeobraproceso add foreign key (idManodeObra) REFERENCES  manodeobra (idManodeObra);

alter Table manodeobrareceta add foreign key (idReceta) REFERENCES  receta (idReceta); 
alter Table manodeobrareceta add foreign key (idManodeObra) REFERENCES  manodeobra (idManodeObra);

alter Table materia add foreign key (idTipoMateria) REFERENCES  tipomateria (idTipoMateria); 
alter Table materia add foreign key (idUnidadMedida) REFERENCES  unidadmedida (idUnidadMedida);
alter Table materia add foreign key (idMarca) REFERENCES  marca (idMarca);

alter Table materiacosto add foreign key (idMateria) REFERENCES  materia (idMateria);
alter Table materiacosto add foreign key (idTipoCosto) REFERENCES  tipocosto (idTipoCosto);

alter Table materiaproceso add foreign key (idProceso) REFERENCES  proceso (idProceso);
alter Table materiaproceso add foreign key (idMateria) REFERENCES  materia (idMateria);

alter Table movimiento add foreign key (idTipoMovimiento) REFERENCES  tipomovimiento (idTipoMovimiento);

alter Table movimientomateria add foreign key (idMovimiento) REFERENCES  movimiento (idMovimiento);
alter Table movimientomateria add foreign key (idMateria) REFERENCES  materia (idMateria);

alter Table movimientoproducto add foreign key (idProducto) REFERENCES producto (idProducto);


alter Table ordenproduccion add foreign key (idReceta) REFERENCES receta (idReceta);

alter Table ordenproduccionproceso add foreign key (idOrdenProduccion) REFERENCES ordenproduccion (idOrdenProduccion);
alter Table ordenproduccionproceso add foreign key (idProceso) REFERENCES proceso (idProceso);

alter Table Empleado add foreign key (idTipoSueldo) REFERENCES TipoSueldo (idTipoSueldo);

alter Table proveedor add foreign key (idTipoProveedor) REFERENCES tipoproveedor (idTipoProveedor);

alter Table recetamateria add foreign key (idMateria) REFERENCES materia (idMateria);
  alter Table recetamateria add foreign key (idReceta) REFERENCES receta (idReceta);

  alter Table Insumo add foreign key (idTipoUnidad) REFERENCES TipoUnidad (idTipoUnidad);
  alter Table Insumo add foreign key (idMarca) REFERENCES Marca (idMarca);

  alter Table Producto add foreign key (idUnidadMedida) REFERENCES unidadmedida (idUnidadMedida);
  alter Table Producto add foreign key (idTipoProducto) REFERENCES TipoProducto (idTipoProducto);

  alter Table Material add foreign key (idTipoUnidad) REFERENCES TipoUnidad (idTipoUnidad);

  alter Table GastoAdministrativo add foreign key (idTipoUnidad) REFERENCES TipoUnidad (idTipoUnidad);
  alter Table GastoAdministrativo add foreign key (idTipoCosto) REFERENCES TipoCosto (idTipoCosto);
  alter Table GastoAdministrativo add foreign key (idGastoAdministrativopormes) REFERENCES GastoAdministrativopormes (idGastoAdministrativopormes);

  alter Table CostoVenta add foreign key (idTipoUnidad) REFERENCES TipoUnidad (idTipoUnidad);
  alter Table CostoVenta add foreign key (idTipoCosto) REFERENCES TipoCosto (idTipoCosto);

  alter Table CostoMarketing add foreign key (idTipoUnidad) REFERENCES TipoUnidad (idTipoUnidad);
  alter Table CostoMarketing add foreign key (idTipoCosto) REFERENCES TipoCosto (idTipoCosto);


  alter Table CostoOperativo add foreign key (idTipoUnidad) REFERENCES TipoUnidad (idTipoUnidad);
  alter Table CostoOperativo add foreign key (idTipoCosto) REFERENCES TipoCosto (idTipoCosto);

  alter Table MovimientoInsumo add foreign key (idInsumo) REFERENCES Insumo (idInsumo);

  alter Table InventarioInsumo add foreign key (idInsumo) REFERENCES Insumo (idInsumo);

  alter Table InventarioProducto add foreign key (idProducto) REFERENCES Producto (idProducto);

  alter Table MovimientoProducto add foreign key (idProducto) REFERENCES Producto (idProducto);

  alter Table InventarioMaterial add foreign key (idMaterial) REFERENCES Material (idMaterial);

  alter Table MovimientoMaterial add foreign key (idMaterial) REFERENCES Material (idMaterial);


  alter Table RecetaInsumo add foreign key (idInsumo) REFERENCES Insumo (idInsumo);
  alter Table RecetaInsumo add foreign key (idReceta) REFERENCES Receta (idReceta);

  alter Table RecetaMaterial add foreign key (idMaterial) REFERENCES Material (idMaterial);
  alter Table RecetaMaterial add foreign key (idReceta) REFERENCES Receta (idReceta);

 alter Table ManoObra add foreign key (idEmpleado) REFERENCES Empleado (idEmpleado);
 alter Table ManoObra add foreign key (idEquipo) REFERENCES Equipo (idEquipo);


 alter Table ConsumoGas add foreign key (idEquipo) REFERENCES Equipo (idEquipo);
 alter Table ConsumoGas add foreign key (idReceta) REFERENCES Receta (idReceta);

 alter Table RecetaCostoVenta add foreign key (idCostoVenta) REFERENCES CostoVenta (idCostoVenta);
 alter Table RecetaCostoVenta add foreign key (idReceta) REFERENCES Receta (idReceta);

 alter Table RecetaCostoMarketing add foreign key (idCostoMarketing) REFERENCES CostoMarketing (idCostoMarketing);
 alter Table RecetaCostoMarketing add foreign key (idReceta) REFERENCES Receta (idReceta);

 alter Table RecetaCostoOperativo add foreign key (idCostoOperativo) REFERENCES CostoOperativo (idCostoOperativo);
 alter Table RecetaCostoOperativo add foreign key (idReceta) REFERENCES Receta (idReceta);

 alter Table UsuarioModulo add foreign key (idUsuario) REFERENCES usuario (idUsuario);
 alter Table UsuarioModulo add foreign key (idModulo) REFERENCES Modulo (idModulo);

 alter Table CostorecetaporMes add foreign key (idGastoAdministrativopormes) REFERENCES GastoAdministrativopormes (idGastoAdministrativopormes);



 