DROP DATABASE IF EXISTS caticao;
CREATE DATABASE IF NOT EXISTS caticao;
USE caticao;

-- -----------------------------------------------------
-- Tables
-- -----------------------------------------------------
CREATE TABLE ordertable(
  idOrderTable int AUTO_INCREMENT primary key,
  descripcion VARCHAR(50)
  
);
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
  codigo VARCHAR(20),
  nombre VARCHAR(50),
  serie VARCHAR(20),
  modelo VARCHAR(100),
  descripcion VARCHAR(100),
  marca VARCHAR(50),
  precio DECIMAL(10,2),
  añoCompra INT,
  capacidad DECIMAL(10,2),
  potenciaHP DECIMAL(10,2),
  potenciaWatts DECIMAL(10,2),
  potenciaKw DECIMAL(10,2),
  depreciacionAnual DECIMAL(10,2),
  depreciacionMensual DECIMAL(10,2),
  depreciacionHora DECIMAL(10,2),
  vidaUtil INT 

);
-- -----------------------------------------------------
-- Table tipocosto
-- -----------------------------------------------------
CREATE TABLE tipocosto (
  idTipoCosto INT  AUTO_INCREMENT  primary key,
  descripcion VARCHAR(50)
);

-- -----------------------------------------------------
-- Table unidadmedida
-- -----------------------------------------------------
CREATE TABLE unidadmedida (
  idUnidadMedida INT  AUTO_INCREMENT  primary key,
  descripcion VARCHAR(50),
  idTipoUnidad int REFERENCES tipounidad (idTipoUnidad)
);

-- -----------------------------------------------------
-- Table tipoproducto
-- -----------------------------------------------------

CREATE TABLE tipoproducto (
  idTipoProducto INT  AUTO_INCREMENT  primary key,
  descripcion VARCHAR(50)
);

-- -----------------------------------------------------
-- Table Receta Consumo Energia
-- -----------------------------------------------------

CREATE TABLE RecetaConsumoEnergia (
  idRecetaConsumoEnergia INT  AUTO_INCREMENT primary key,
  nombreMaquina VARCHAR(50),
  potenciaKw DECIMAL(10,2),
  horasTrabajoBatch DECIMAL(10,2),
  consumoKwh DECIMAL(10,2),
  tarifaKwh DECIMAL(10,2),
  pagoPorBatch DECIMAL(10,2),
  idTarifaEnergia INT REFERENCES TarifaEnergia (idTarifaEnergia),
  idMaquina INT REFERENCES maquina (idMaquina),
  idReceta INT REFERENCES receta (idReceta)
);

-- -----------------------------------------------------
-- Table Receta Depreciacion
-- -----------------------------------------------------
CREATE TABLE RecetaDepreciacion (
  idRecetaDepreciacion INT  AUTO_INCREMENT  primary key,
  nombreMaquina VARCHAR(50),
  depreciacionHora DECIMAL(10,2),
  tiempoHoras DECIMAL(10,2),
  depreciacionPorBatch DECIMAL(10,2),
  idMaquina INT REFERENCES maquina (idMaquina),
  idReceta INT REFERENCES receta (idReceta)
);

-- -----------------------------------------------------
-- Table gastoadmin
-- -----------------------------------------------------

CREATE TABLE gastoadmin (
  idGastoAdmin INT  AUTO_INCREMENT  primary key,
  descripcion VARCHAR(50) ,
  precio DECIMAL(10,2) ,
  idUnidadMedida INT REFERENCES unidadmedida (idUnidadMedida),
  idTipoCosto INT REFERENCES tipocosto (idTipoCosto),
  idDesembolso int REFERENCES desembolso (idDesembolso)
);

-- -----------------------------------------------------
-- Table Receta Costo Venta
-- -----------------------------------------------------

CREATE TABLE RecetaCostoVenta (
  idRecetaCostoVenta INT  AUTO_INCREMENT primary key,
  nombreCostoVenta VARCHAR(50),
  cantidad DECIMAL(10,2),
  precio DECIMAL(10,2),
  total DECIMAL(10,2),
  idGastoAdmin INT REFERENCES gastosadmin (idGastoAdmin),
  idReceta INT REFERENCES receta (idReceta)
);
 

-- -----------------------------------------------------
-- Table Receta Costo Marketing
-- -----------------------------------------------------

CREATE TABLE RecetaCostoMarketing (
  idRecetaCostoMarketing INT  AUTO_INCREMENT primary key,
  nombreCostoMarketing VARCHAR(50),
  cantidad DECIMAL(10,2),
  precio DECIMAL(10,2),
  total DECIMAL(10,2),
  idGastoAdmin INT REFERENCES gastosadmin (idGastoAdmin),
  idReceta INT REFERENCES receta (idReceta)
);
 

-- -----------------------------------------------------
-- Table Receta Costo Operativo
-- -----------------------------------------------------

CREATE TABLE RecetaCostoOperativo (
  idRecetaCostoOperativo INT  AUTO_INCREMENT primary key,
  nombreCostoOperativo VARCHAR(50),
  cantidad DECIMAL(10,2),
  precio DECIMAL(10,2),
  total DECIMAL(10,2),
  idGastoAdmin INT REFERENCES gastosadmin (idGastoAdmin),
  idReceta INT REFERENCES receta (idReceta)
);

-- -----------------------------------------------------
-- Table lote
-- -----------------------------------------------------

CREATE TABLE lote(
  idLote INT AUTO_INCREMENT primary key,
  codigoLote VARCHAR(20),
  fechaVencimiento DATE,
  idProducto INT REFERENCES producto (idProducto)
);

-- -----------------------------------------------------
-- Table Receta Mano de Obra
-- -----------------------------------------------------
CREATE TABLE RecetaManodeObra (
  idRecetaManodeObra INT  AUTO_INCREMENT primary key,
  nombreEmpleado VARCHAR(50),
  nombreMaquina VARCHAR(50),
  tiempoHoras DECIMAL(10,2),
  precioUnitario DECIMAL(10,2),
  total DECIMAL(10,2),
  idMaquina INT REFERENCES maquina (idMaquina),
  idEmpleado INT REFERENCES empleado (idEmpleado),
  idReceta INT REFERENCES receta (idReceta)
);

-- -----------------------------------------------------
-- Table marca
-- -----------------------------------------------------

CREATE TABLE marca (
  idMarca INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(50) 
);

-- -----------------------------------------------------
-- Table tipomateria
-- -----------------------------------------------------
CREATE TABLE tipomateria (
  idTipoMateria INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(50) 
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
  cantidad DECIMAL(10,3) ,
  precioUnitario DECIMAL(10,2) ,
  imagen VARCHAR(100),
  idUnidadMedida INT REFERENCES unidadmedida(idUnidadMedida),
  idMarca INT REFERENCES Marca (idMarca),
  idTipoMateria INT REFERENCES tipomateria (idTipoMateria)
);


-- -----------------------------------------------------
-- Table movimiento
-- -----------------------------------------------------

CREATE TABLE movimiento (
  idMovimiento INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(100)
);


-- -----------------------------------------------------
-- Table tipodocumento
-- -----------------------------------------------------

CREATE TABLE tipodocumento (
  idTipoDocumento INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(50) 
);

-- -----------------------------------------------------
-- Table Empleado
-- -----------------------------------------------------
CREATE TABLE Empleado (
  idEmpleado INT  AUTO_INCREMENT primary key,
  nombre VARCHAR(50) ,
  apellido VARCHAR(50) ,
  direccion VARCHAR(50) ,
  telefono VARCHAR(15) ,
  correo VARCHAR(50) ,
  numeroDocumento VARCHAR(15) ,
  fechaNacimiento DATE ,
  cargo VARCHAR(50) ,
  horarioTrabajo VARCHAR(50) ,
  horasPorDia INT ,
  sueldoPorDia DECIMAL(10,2) ,
  precioUnitario DECIMAL(10,2) ,
  sueldoPorMes DECIMAL(10,2) ,
  idTipoDocumento INT REFERENCES tipodocumento(idTipoDocumento),
  idUsuario INT REFERENCES Usuario (idUsuario),
  idTipoCosto INT REFERENCES TipoCosto (idTipoCosto)
);

-- -----------------------------------------------------
-- Table Tipo Unidad
-- -----------------------------------------------------

CREATE TABLE tipounidad (
  idTipoUnidad INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(50) 
);


-- -----------------------------------------------------
-- Table Producto
-- -----------------------------------------------------

CREATE TABLE producto (
  idProducto INT  AUTO_INCREMENT primary key,
  codigo VARCHAR(50) ,
  nombre VARCHAR(50) ,
  descripcion VARCHAR(100) ,
  imagen VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
  idUnidadMedida INT REFERENCES unidadmedida (idUnidadMedida),
  idTipoProducto INT REFERENCES TipoProducto (idTipo_Producto)
);


-- -----------------------------------------------------
-- Table Movimiento Materia
-- -----------------------------------------------------

CREATE TABLE MovimientoMateria (
  idMovimientoMateria INT  AUTO_INCREMENT primary key,
  ingreso DECIMAL(10,3) ,
  salida DECIMAL(10,3) ,
  observacion VARCHAR(100),
  fecha DATE,
  codigoReceta VARCHAR(20),
  hora TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  idMateria INT REFERENCES Materia (idMateria),
  idMovimiento INT REFERENCES Movimiento (idMovimiento)
);

-- -----------------------------------------------------
-- Table Inventario Materia
-- -----------------------------------------------------

CREATE TABLE InventarioMateria (
  idInventarioMateria INT  AUTO_INCREMENT primary key,
  stock DECIMAL(10,3) ,
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
  ingreso DECIMAL(10,2) ,
  salida DECIMAL(10,2) ,
  observacion VARCHAR(100) ,
  fecha DATE ,
  hora TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
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
  ingreso DECIMAL(10,2) ,
  salida DECIMAL(10,2) ,
  observacion VARCHAR(100) ,
  fecha DATE ,
  hora TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  idMaquina INT REFERENCES Maquina (idMaquina),
  idMovimiento INT REFERENCES Movimiento (idMovimiento)
);


-- -----------------------------------------------------
-- Table Estado
-- -----------------------------------------------------

CREATE TABLE Estado (
  idEstado INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(50)
);


-- -----------------------------------------------------
-- Table Receta
-- -----------------------------------------------------

CREATE TABLE Receta (
  idReceta INT  AUTO_INCREMENT primary key,
  codigo VARCHAR(20) ,
  nombre VARCHAR(50) ,
  batch DECIMAL(10,2) ,
  fechaInicio DATE ,
  fechaFin DATE ,
  pesoPorTableta DECIMAL(10,2) ,
  pesoEnTableta DECIMAL(10,2) ,
  merma DECIMAL(10,2) ,
  reproceso DECIMAL(10,2),
  codigoLote VARCHAR(20),
  cerrado INT,
  idEstado INT REFERENCES Estado (idEstado)
);

-- -----------------------------------------------------
-- Table Receta Materia
-- -----------------------------------------------------

CREATE TABLE RecetaMateria (
  idRecetaMateria INT  AUTO_INCREMENT primary key,
  nombre VARCHAR(50),
  cantidad DECIMAL(10,3),
  precioUnitario DECIMAL(10,2),
  total DECIMAL(10,2),
  idMateria INT REFERENCES Materia (idMateria),
  idReceta INT REFERENCES Receta (idReceta)
);

-- -----------------------------------------------------
-- Table TarifaEnergia
-- -----------------------------------------------------

CREATE TABLE TarifaEnergia (
  idTarifaEnergia INT  AUTO_INCREMENT primary key,
  tarifaKwh DECIMAL(10,2) 
);


-- -----------------------------------------------------
-- Table Receta Consumo de Gas
-- -----------------------------------------------------

CREATE TABLE RecetaConsumoGas (
  idRecetaConsumoGas INT  AUTO_INCREMENT primary key,
  nombreMaquina VARCHAR(50),
  trabajoPorBatch DECIMAL(10,2),
  pesoBalonGas DECIMAL(10,2),
  tarifaGas DECIMAL(10,2) ,
  pagoPorBatch DECIMAL(10,2),
  idMaquina INT REFERENCES Maquina (idMaquina),
  idReceta INT REFERENCES Receta (idReceta)
);

-- -----------------------------------------------------
-- Table Costo de Recetas por Mes
-- -----------------------------------------------------

CREATE TABLE CostoRecetasGastoAdmin (
  idCostoRecetasGastoAdmin INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(50) ,
  mes DATE
);

-- -----------------------------------------------------
-- Table Gasto Admin Por Mes
-- -----------------------------------------------------

CREATE TABLE GastoAdminPorMes (
  idGastoAdminPorMes INT  AUTO_INCREMENT primary key,
  nombreGastoAdmin VARCHAR(50),
  cantidad DECIMAL(10,2),
  precio DECIMAL(10,2),
  total DECIMAL(10,2),
  idGastoAdmin INT REFERENCES gastosadmin (idGastoAdmin),
  idCostoRecetasGastoAdmin INT REFERENCES CostoRecetasGastoAdmin (idCostoRecetasGastoAdmin)
);


-- -----------------------------------------------------
-- Table perfil
-- -----------------------------------------------------

CREATE TABLE perfil (
  idPerfil INT  AUTO_INCREMENT primary key,
  descripcion VARCHAR(50)
);

-- -----------------------------------------------------
-- Table usuario
-- -----------------------------------------------------

CREATE TABLE usuario(
  idUsuario INT  AUTO_INCREMENT primary key,
  nombre VARCHAR(50),
  usuario VARCHAR(50),
	password VARCHAR(100),
	foto VARCHAR(100),
	estado INT,
	ultimo_login DATETIME,
	fecha TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  idPerfil INT REFERENCES perfil (idPerfil)
);

-- -----------------------------------------------------
-- Table Modulos
-- -----------------------------------------------------

CREATE TABLE Modulo (
  idModulo INT AUTO_INCREMENT primary key,
  descripcion VARCHAR(50) 
);

-- -----------------------------------------------------
-- Table Usuario_Modulos
-- -----------------------------------------------------

CREATE TABLE UsuarioModulo (
  idUsuarioModulo INT  AUTO_INCREMENT primary key,
  idUsuario INT REFERENCES usuario (idUsuario),
  idModulo INT REFERENCES Modulo (idModulo)
);

-- -----------------------------------------------------
-- Table Usuario_Permisos
-- -----------------------------------------------------

CREATE TABLE UsuarioPermiso (
  idUsuarioPermiso INT  AUTO_INCREMENT primary key,
  insertar INT,
  editar INT,
  eliminar INT,
  idUsuario INT REFERENCES usuario (idUsuario)
);

-- -----------------------------------------------------
-- Table Configuración
-- -----------------------------------------------------

CREATE TABLE Configuracion (
  idConfiguracion INT  AUTO_INCREMENT primary key,
  modoDark INT,
  contraerBarraLateral INT,
  ocultarBarraLateral INT
);

  alter Table receta add foreign key (idEstado) REFERENCES  estado (idEstado);

  alter Table RecetaConsumoEnergia add foreign key (idReceta) REFERENCES  receta (idReceta);
  alter Table RecetaConsumoEnergia add foreign key (idMaquina) REFERENCES  maquina (idMaquina);
  alter Table RecetaConsumoEnergia add foreign key (idTarifaEnergia) REFERENCES  TarifaEnergia (idTarifaEnergia);

  alter Table RecetaDepreciacion add foreign key (idMaquina) REFERENCES  maquina(idMaquina);
  alter Table RecetaDepreciacion add foreign key (idReceta) REFERENCES  receta (idReceta);

  alter Table gastoadmin add foreign key (idUnidadMedida) REFERENCES  unidadmedida (idUnidadMedida);
  alter Table gastoadmin add foreign key (idTipoCosto) REFERENCES  tipocosto (idTipoCosto);
  alter Table gastoadmin add foreign key (idDesembolso) REFERENCES  desembolso (idDesembolso);
  
  alter Table GastoAdminPorMes add foreign key (idGastoAdmin) REFERENCES  gastoadmin (idGastoAdmin);
  alter Table GastoAdminPorMes add foreign key (idCostoRecetasGastoAdmin) REFERENCES  CostoRecetasGastoAdmin (idCostoRecetasGastoAdmin);

  alter Table RecetaCostoVenta add foreign key (idGastoAdmin) REFERENCES  gastoadmin (idGastoAdmin);
  alter Table RecetaCostoVenta add foreign key (idReceta) REFERENCES  receta (idReceta);

  alter Table RecetaCostoMarketing add foreign key (idGastoAdmin) REFERENCES  gastoadmin (idGastoAdmin);
  alter Table RecetaCostoMarketing add foreign key (idReceta) REFERENCES  receta (idReceta);

  alter Table RecetaCostoOperativo add foreign key (idGastoAdmin) REFERENCES  gastoadmin (idGastoAdmin);
  alter Table RecetaCostoOperativo add foreign key (idReceta) REFERENCES  receta (idReceta);

  alter Table RecetaManodeObra add foreign key (idReceta) REFERENCES  receta (idReceta);
  alter Table RecetaManodeObra add foreign key (idEmpleado) REFERENCES Empleado (idEmpleado);
  alter Table RecetaManodeObra add foreign key (idMaquina) REFERENCES Maquina (idMaquina);

  alter Table materia add foreign key (idTipoMateria) REFERENCES  tipomateria (idTipoMateria); 
  alter Table materia add foreign key (idUnidadMedida) REFERENCES  unidadmedida (idUnidadMedida);
  alter Table materia add foreign key (idMarca) REFERENCES  marca (idMarca);

  alter Table unidadmedida add foreign key (idTipoUnidad) REFERENCES  tipounidad  (idTipoUnidad);

  alter Table movimientoproducto add foreign key (idProducto) REFERENCES producto (idProducto);
  alter Table MovimientoProducto add foreign key (idMovimiento) REFERENCES Movimiento (idMovimiento);

  alter Table Empleado add foreign key (idTipoCosto) REFERENCES TipoCosto (idTipoCosto);
  alter Table Empleado add foreign key (idTipoDocumento) REFERENCES tipodocumento (idTipoDocumento);
  alter Table Empleado add foreign key (idUsuario) REFERENCES usuario (idUsuario);

  alter Table recetamateria add foreign key (idMateria) REFERENCES materia (idMateria);
  alter Table recetamateria add foreign key (idReceta) REFERENCES receta (idReceta);

  alter Table Producto add foreign key (idUnidadMedida) REFERENCES unidadmedida (idUnidadMedida);
  alter Table Producto add foreign key (idTipoProducto) REFERENCES TipoProducto (idTipoProducto);

  alter Table Lote add foreign key (idProducto) REFERENCES Producto (idProducto);

  alter Table MovimientoMateria add foreign key (idMateria) REFERENCES Materia (idMateria);
  alter Table MovimientoMateria add foreign key (idMovimiento) REFERENCES Movimiento (idMovimiento);

  alter Table InventarioMateria add foreign key (idMateria) REFERENCES Materia (idMateria);

  alter Table InventarioProducto add foreign key (idProducto) REFERENCES Producto (idProducto);

  alter table InventarioMaquina add foreign key (idMaquina) REFERENCES Maquina (idMaquina);

  alter Table RecetaConsumoGas add foreign key (idMaquina) REFERENCES Maquina (idMaquina);
  alter Table RecetaConsumoGas add foreign key (idReceta) REFERENCES Receta (idReceta);

  alter Table UsuarioModulo add foreign key (idUsuario) REFERENCES usuario (idUsuario);
  alter Table UsuarioModulo add foreign key (idModulo) REFERENCES Modulo (idModulo);
  alter Table UsuarioPermiso add foreign key (idUsuario) REFERENCES usuario (idUsuario);
  alter Table Usuario add foreign key (idPerfil) REFERENCES perfil (idPerfil);

  alter table MovimientoMaquina add foreign key (idMaquina) REFERENCES Maquina (idMaquina);
  alter table MovimientoMaquina add foreign key (idMovimiento) REFERENCES Movimiento (idMovimiento);


