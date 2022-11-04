
DROP DATABASE IF EXISTS caticao;
CREATE DATABASE IF NOT EXISTS caticao;
USE caticao;


-- -----------------------------------------------------
-- Table DESEMBOLSO
-- -----------------------------------------------------
CREATE TABLE desembolso(
  idDesembolso int AUTO_INCREMENT primary key,
  descripcion VARCHAR(50)
  
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
  descripcion VARCHAR(45),
  idTipoUnidad int REFERENCES tipounidad (idTipoUnidad)
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
  idUnidadMedida INT REFERENCES unidadmedida (idUnidadMedida),
  idTarifaEnergia INT REFERENCES TarifaEnergia (idTarifaEnergia)
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
  idTipoCosto INT REFERENCES tipocosto (idTipoCosto),
  idDesembolso int REFERENCES desembolso (idDesembolso)
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
-- Table ManoObrareceta
-- -----------------------------------------------------
CREATE TABLE ManoObrareceta (
  idManoObraReceta INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  idManoObra INT REFERENCES ManoObra (idManoObra),
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
  imagen VARCHAR(100),
  idUnidadMedida INT REFERENCES unidadmedida(idUnidadMedida),
  idMarca INT REFERENCES Marca (idMarca),
  idTipoMateria INT REFERENCES tipomateria (idTipoMateria)
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
-- Table tipodocumento
-- -----------------------------------------------------

CREATE TABLE tipodocumento (
  idTipoDocumento INT  AUTO_INCREMENT primary key,
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
  correoElectronico VARCHAR(45) ,
  numeroDocumento INT ,
  fechaNacimiento DATE ,
  cargoEmpresa VARCHAR(45) ,
  horarioTrabajo VARCHAR(45) ,
  horasPorDia INT ,
  sueldoPorDia DECIMAL(10,2) ,
  sueldoPorMes DECIMAL(10,2) ,
  idtipoDocumento INT REFERENCES tipodocumento(idTipoDocumento),
  idUsuario INT REFERENCES Usuario (idUsuario),
  idTipoCosto INT REFERENCES TipoCosto (idTipoCosto)
);





-- -----------------------------------------------------
-- Table Tipo Unidad
-- -----------------------------------------------------

CREATE TABLE tipounidad (
  idTipoUnidad INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) 
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
-- Table Gastos_Administrativos_por_mes
-- -----------------------------------------------------


CREATE TABLE gastoadminpormes (
  idgastoadminpormes INT  AUTO_INCREMENT primary key,
  requerimiento DECIMAL(10,2) ,
  costos DECIMAL(10,2),
  idgastoadmin INT REFERENCES gastoadmin (idgastoadmin),
  idCostorecetaporMes INT REFERENCES CostorecetaporMes (idCostorecetaporMes)
);



-- -----------------------------------------------------
-- Table Movimiento Materia
-- -----------------------------------------------------


CREATE TABLE MovimientoMateria (
  idMovimientoMateria INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  observacion VARCHAR(45) ,
  fecha DATE ,
  hora TIME ,
  estado VARCHAR(45) ,
  idMateria INT REFERENCES Materia (idMateria),
  idMovimiento int REFERENCES Movimiento (idMovimiento)
);

-- -----------------------------------------------------
-- Table Inventario Materia
-- -----------------------------------------------------

CREATE TABLE InventarioMateria (
  idInventarioMateria INT  AUTO_INCREMENT primary key,
  stock DECIMAL(10,2) ,
  idMateria INT REFERENCES Materia (idMateria)
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
  idProducto INT REFERENCES Producto (idProducto),
  idMovimiento INT REFERENCES Movimiento (idMovimiento)
);





-- -----------------------------------------------------
-- Table Inventario Maquina
-- -----------------------------------------------------


CREATE TABLE InventarioMaquina (
  idInventarioMaquina INT  AUTO_INCREMENT primary key,
  stock DECIMAL(10,2) ,
  idMaquina INT REFERENCES Maquina (idMaquina)
);




-- -----------------------------------------------------
-- Table Movimiento_Maquinas
-- -----------------------------------------------------


CREATE TABLE MovimientoMaquina (
  idMovimientoMaquina INT  AUTO_INCREMENT primary key,
  cantidad DECIMAL(10,2) ,
  observacion VARCHAR(45) ,
  fecha DATE ,
  hora TIME ,
  estado VARCHAR(45) ,
  lote VARCHAR(45) ,
  condicion VARCHAR(45) ,
  idMaquina INT REFERENCES Maquina (idMaquina),
  idMovimiento INT REFERENCES Movimiento (idMovimiento)
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
-- Table Receta Materia
-- -----------------------------------------------------

CREATE TABLE RecetaMateria (
  idRecetaMateria INT  AUTO_INCREMENT primary key,
  pesoneto DECIMAL(10,2) ,
  costo DECIMAL(10,2) ,
  idMateria INT REFERENCES Materia (idMateria),
  idReceta INT REFERENCES Receta (idReceta)
);



-- -----------------------------------------------------
-- Table ManoObra
-- -----------------------------------------------------

CREATE TABLE ManoObra (
  idManoObra INT  AUTO_INCREMENT primary key,
  requerimiento TIME ,
  costo DECIMAL(10,2) ,
  idEmpleado INT REFERENCES Empleado (idEmpleado),
  idMaquina INT REFERENCES Maquina (idMaquina)
);


-- -----------------------------------------------------
-- Table TarifaEnergia
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
  idMaquina INT REFERENCES Maquina (idMaquina),
  idReceta INT REFERENCES Receta (idReceta)
);



-- -----------------------------------------------------
-- Table Costos_receta_por_Mes
-- -----------------------------------------------------

CREATE TABLE CostorecetaporMes (
  idCostorecetaporMes INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(45) ,
  mes VARCHAR(45) ,
  costototalrecetapormes DECIMAL(10,2) ,
  idgastoadminpormes INT REFERENCES gastoadminpormes (idgastoadminpormes)
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
alter Table consumoenergia add foreign key (idTarifaEnergia) REFERENCES  TarifaEnergia (idTarifaEnergia);

alter Table receta add foreign key (idProducto) REFERENCES  producto (idProducto);

alter Table consumoenergiareceta add foreign key (idConsumoEnergia) REFERENCES  consumoenergia (idConsumoEnergia);
alter Table consumoenergiareceta add foreign key (idReceta) REFERENCES  receta (idReceta);

alter Table depreciacion add foreign key (idMaquina) REFERENCES  maquina (idMaquina);
alter Table depreciacion add foreign key (idTipoCosto) REFERENCES  tipocosto (idTipoCosto);

alter Table depreciacionreceta add foreign key (idDepreciacion) REFERENCES  depreciacion(idDepreciacion);
alter Table depreciacionreceta add foreign key (idReceta) REFERENCES  receta (idReceta);


alter Table gastoadmin add foreign key (idUnidadMedida) REFERENCES  unidadmedida (idUnidadMedida);
alter Table gastoadmin add foreign key (idTipoCosto) REFERENCES  tipocosto (idTipoCosto);
alter Table gastoadmin add foreign key (idDesembolso) REFERENCES  desembolso (idDesembolso);

alter Table gastoadminreceta add foreign key (idGastoAdmin) REFERENCES  gastoadmin (idGastoAdmin);
alter Table gastoadminreceta add foreign key (idReceta) REFERENCES  receta (idReceta);

alter Table lote add foreign key (idReceta) REFERENCES  receta (idReceta);


alter Table ManoObrareceta add foreign key (idReceta) REFERENCES  receta (idReceta); 
alter Table ManoObrareceta add foreign key (idManoObra) REFERENCES  ManoObra (idManoObra);

alter Table materia add foreign key (idTipoMateria) REFERENCES  tipomateria (idTipoMateria); 
alter Table materia add foreign key (idUnidadMedida) REFERENCES  unidadmedida (idUnidadMedida);
alter Table materia add foreign key (idMarca) REFERENCES  marca (idMarca);

alter Table unidadmedida add foreign key (idTipoUnidad) REFERENCES  tipounidad  (idTipoUnidad);

alter Table movimiento add foreign key (idTipoMovimiento) REFERENCES  tipomovimiento (idTipoMovimiento);

alter Table movimientoproducto add foreign key (idProducto) REFERENCES producto (idProducto);
alter Table MovimientoProducto add foreign key (idMovimiento) REFERENCES Movimiento (idMovimiento);

alter Table Empleado add foreign key (idTipoCosto) REFERENCES TipoCosto (idTipoCosto);
alter Table Empleado add foreign key (idTipoDocumento) REFERENCES tipodocumento (idTipoDocumento);

alter Table recetamateria add foreign key (idMateria) REFERENCES materia (idMateria);
alter Table recetamateria add foreign key (idReceta) REFERENCES receta (idReceta);

alter Table Producto add foreign key (idUnidadMedida) REFERENCES unidadmedida (idUnidadMedida);
alter Table Producto add foreign key (idTipoProducto) REFERENCES TipoProducto (idTipoProducto);


  alter Table MovimientoMateria add foreign key (idMateria) REFERENCES Materia (idMateria);
  alter Table MovimientoMateria add foreign key (idMovimiento) REFERENCES Movimiento (idMovimiento);


  alter Table InventarioMateria add foreign key (idMateria) REFERENCES Materia (idMateria);

  alter Table InventarioProducto add foreign key (idProducto) REFERENCES Producto (idProducto);



 alter Table ManoObra add foreign key (idEmpleado) REFERENCES Empleado (idEmpleado);
 alter Table ManoObra add foreign key (idMaquina) REFERENCES Maquina (idMaquina);


 alter Table ConsumoGas add foreign key (idMaquina) REFERENCES Maquina (idMaquina);
 alter Table ConsumoGas add foreign key (idReceta) REFERENCES Receta (idReceta);

 alter Table UsuarioModulo add foreign key (idUsuario) REFERENCES usuario (idUsuario);
 alter Table UsuarioModulo add foreign key (idModulo) REFERENCES Modulo (idModulo);

 alter table gastoadminpormes add foreign key (idgastoadmin) REFERENCES gastoadmin (idgastoadmin);
 alter table gastoadminpormes add foreign key (idCostorecetaporMes) REFERENCES CostorecetaporMes (idCostorecetaporMes);

 alter table InventarioMaquina add foreign key (idMaquina) REFERENCES Maquina (idMaquina);

 alter table MovimientoMaquina add foreign key (idMaquina) REFERENCES Maquina (idMaquina);
 alter table MovimientoMaquina add foreign key (idMovimiento) REFERENCES Movimiento (idMovimiento);

