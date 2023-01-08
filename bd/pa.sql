use caticao;

-- Procedimientos almacenados de Usuarios --

DROP procedure IF EXISTS `mostrar_usuarios`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_usuarios` ()
BEGIN
	select * from usuario;
END$$

DELIMITER ;


DROP procedure IF EXISTS `insertar_usuario`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_usuario` (   in nombreI VARCHAR(45),
                                        in usuarioI VARCHAR(45),
                                        in passwordI VARCHAR(100),
                                        in perfilI VARCHAR(45),
                                        in fotoI VARCHAR(100))
BEGIN
	insert into usuario (nombre,usuario,password,perfil,foto,estado)
				  values (nombreI,usuarioI,passwordI,perfilI,fotoI,1);
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_usuario`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_usuario` (     in nombreE VARCHAR(45),
                                        in usuarioE VARCHAR(45),
                                        in passwordE VARCHAR(100),
                                        in perfilE VARCHAR(45),
                                        in fotoE VARCHAR(100))
BEGIN
	update usuario set nombre=nombreE,
                        usuario=usuarioE,
                        password=passwordE,
                        perfil=perfilE,
                        foto=fotoE
				where usuario=usuarioE;
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_usuario`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_usuario` (in idUsuarioE int)
BEGIN
	delete from usuario
    where idUsuario=idUsuarioE;
END$$
DELIMITER ;

-- Procedimientos almacenados de Tipo Producto --

DROP procedure IF EXISTS `mostrar_tipoproducto`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_tipoproducto` ()
BEGIN
	select * from tipoproducto;
END$$
DELIMITER ;

-- Procedimientos almacenados de Productos --

DROP procedure IF EXISTS `mostrar_productos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_productos` ()
BEGIN
	select * from producto;
END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_producto`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_producto` (  in codigoI VARCHAR(20),
                                        in nombreI VARCHAR(50),
                                        in descripcionI VARCHAR(100),
                                        in idUnidadMedidaI INT,
                                        in idTipoProductoI INT,
                                        in imagenI VARCHAR(50))
BEGIN

    insert into inventarioproducto (stock)
				  values (0);
	insert into producto (codigo,nombre,descripcion,idUnidadMedida,idTipoProducto,imagen)
				  values (codigoI,nombreI,descripcionI,idUnidadMedidaI,idTipoProductoI,imagenI);
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_producto`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_producto` (    in idProductoE VARCHAR(20),
                                        in nombreE VARCHAR(50),
                                        in descripcionE VARCHAR(100),
                                        in idUnidadMedidaE INT,
                                        in idTipoProductoE INT,
                                        in imagenE VARCHAR(50))
BEGIN
	update producto set  idProducto=idProductoE,
                        nombre=nombreE,
                        descripcion=descripcionE,
                        idUnidadMedida=idUnidadMedidaE,
                        idTipoProducto=idTipoProductoE,
                        imagen=imagenE
				where idProducto=idProductoE;
END$$
DELIMITER ;

DROP procedure IF EXISTS `eliminar_producto`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_producto` (in idProductoE int)
BEGIN
	delete from producto
    where idProducto=idProductoE;
END$$
DELIMITER ;



-- Procedimientos almacenados de Marcas --

DROP procedure IF EXISTS `mostrar_marcas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_marcas` ()
BEGIN
	select * from marca;
END$$
DELIMITER ;

-- Procedimientos almacenados de Insumos --

DROP procedure IF EXISTS `mostrar_insumos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_insumos` ()
BEGIN
	select * from materia m
	where idTipoMateria=1
	ORDER BY m.nombre asc;
END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_insumo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_insumo` (    in codigoI VARCHAR(20),
                                        in nombreI VARCHAR(50),
                                        in descripcionI VARCHAR(100),
                                        in idUnidadMedidaI INT,
                                        in idMarcaI INT,
                                        in cantidadI DECIMAL(10,3),
                                        in precioI DECIMAL(10,2),
                                        in imagenI VARCHAR(50))
BEGIN
    insert into inventariomateria (stock)
				  values (0);
                  
	insert into materia (codigo,nombre,descripcion,idUnidadMedida,idMarca,cantidad,precio,precioUnitario,imagen,idTipoMateria)
				  values (codigoI,nombreI,descripcionI,idUnidadMedidaI,idMarcaI,cantidadI,precioI,precio/cantidad,imagenI,1);
                  
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_insumo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_insumo` (     in idMateriaE VARCHAR(20),
                                        in nombreE VARCHAR(50),
                                        in descripcionE VARCHAR(100),
                                        in idUnidadMedidaE INT,
                                        in idMarcaE INT,
                                        in cantidadE DECIMAL(10,3),
                                        in precioE DECIMAL(10,2),
                                        in imagenE VARCHAR(50))
BEGIN
	update materia set  idMateria=idMateriaE,
                        nombre=nombreE,
                        descripcion=descripcionE,
                        idUnidadMedida=idUnidadMedidaE,
                        idMarca=idMarcaE,
                        cantidad=cantidadE,
                        precio=precioE,
                        imagen=imagenE
				where idMateria=idMateriaE;
END$$
DELIMITER ;

DROP procedure IF EXISTS `eliminar_insumo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_insumo` (in idMateriaE int)
BEGIN
	delete from materia
    where idMateria=idMateriaE;
    delete from inventariomateria
    where idInventarioMateria=idMateriaE;
END$$
DELIMITER;

-- Procedimientos almacenados de Materiales --

DROP procedure IF EXISTS `mostrar_materiales`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_materiales` ()
BEGIN
	select * from materia m
	where idTipoMateria=2
	ORDER BY m.nombre asc;
END$$
DELIMITER ;

DROP procedure IF EXISTS `insertar_material`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_material` (  in codigoI VARCHAR(20),
                                        in nombreI VARCHAR(50),
                                        in descripcionI VARCHAR(100),
                                        in idUnidadMedidaI INT,
                                        in idMarcaI INT,
                                        in cantidadI DECIMAL(10,3),
                                        in precioI DECIMAL(10,2),
                                        in imagenI VARCHAR(50))
BEGIN
    insert into inventariomateria (stock)
				  values (0);
	insert into materia (codigo,nombre,descripcion,idUnidadMedida,idMarca,cantidad,precio,precioUnitario,imagen,idTipoMateria)
				  values (codigoI,nombreI,descripcionI,idUnidadMedidaI,idMarcaI,cantidadI,precioI,precio/cantidad,imagenI,2);
END$$
DELIMITER ;



-- Procedimientos almacenados de Maquinas --

DROP procedure IF EXISTS `mostrar_maquinas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_maquinas` ()
BEGIN
	select * from maquina;
END$$
DELIMITER ;

DROP procedure IF EXISTS `insertar_maquina`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_maquina` (   in codigoI VARCHAR(20),
                                        in nombreI VARCHAR(50),
                                        in descripcionI VARCHAR(100),
                                        in serieI VARCHAR(50),
                                        in modeloI VARCHAR(50),
                                        in marcaI VARCHAR(50),
                                        in precioI DECIMAL(10,2),
                                        in añoCompraI INT,
                                        in capacidadI DECIMAL(10,2),
                                        in potenciaHPI DECIMAL(10,2),
                                        in vidaUtilI INT)
BEGIN
   INSERT INTO inventariomaquina (stock)
				  values (0);
	INSERT INTO maquina (codigo,nombre,descripcion,serie,modelo,marca,precio,añoCompra,capacidad,potenciaHP,potenciaWatts,potenciaKw,vidaUtil,depreciacionAnual,depreciacionMensual,depreciacionHora)
				  values (codigoI,nombreI,descripcionI,serieI,modeloI,marcaI,precioI,añoCompraI,capacidadI,potenciaHPI,(potenciaHPI*745.7),((potenciaHPI*745.7)/1000),vidaUtilI,(precioI/vidaUtilI),(precioI/vidaUtilI)/12,((precioI/vidaUtilI)/12)/(25*24));
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_maquina`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_maquina` (     in idMaquinaE INT, 
                                        in nombreE VARCHAR(50),
                                        in descripcionE VARCHAR(100),
                                        in serieE VARCHAR(50),
                                        in modeloE VARCHAR(50),
                                        in marcaE VARCHAR(50),
                                        in precioE DECIMAL(10,2),
                                        in añoCompraE INT,
                                        in capacidadE DECIMAL(10,2),
                                        in potenciaHPE DECIMAL(10,2),
                                        in vidaUtilE INT)
BEGIN
	update maquina set  idMaquina=idMaquinaE,
                        nombre=nombreE,
                        descripcion=descripcionE,
                        serie=serieE,
                        modelo=modeloE,
                        marca=marcaE,
                        precio=precioE,
                        añoCompra=añoCompraE,
                        capacidad=capacidadE,
                        potenciaHP=potenciaHPE,
                        potenciaWatts=(potenciaHPE*745.7),
                        potenciaKw=((potenciaHPE*745.7)/1000),
                        vidaUtil=vidaUtilE,
                        depreciacionAnual=(precioE/vidaUtilE),
                        depreciacionMensual=(precioE/vidaUtilE)/12,
                        depreciacionHora=((precioE/vidaUtilE)/12)/(25*24)
                        
				where idMaquina=idMaquinaE;
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_maquina`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_maquina` (in idMaquinaE int)
BEGIN
	delete from maquina
    where idMaquina=idMaquinaE;
END$$
DELIMITER ;

-- Procedimientos almacenados de marca --

DROP procedure IF EXISTS `mostrar_marcas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_marcas` ()
BEGIN
	select * from marca;
END$$
DELIMITER ;

DROP procedure IF EXISTS `insertar_marca`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_marca` (   in descripcionI VARCHAR(45)
                                        )
BEGIN
	insert into marca (descripcion)
				 values (descripcionI);
END$$
DELIMITER ;

DROP procedure IF EXISTS `editar_marca`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_marca` (     in idMarcaE INT, 
                                        in descripcionE VARCHAR(45)
                                        )
BEGIN
	update marca set  idMarca=idMarcaE,
                      descripcion=descripcionE
				where idMarca=idMarcaE;
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_marca`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_marca` (in idMarcaE int)
BEGIN
	delete from marca
    where idMarca=idMarcaE;
END$$
DELIMITER ;



-- Procedimientos almacenados de Tipo de Costo --
DROP procedure IF EXISTS `mostrar_tipocosto`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_tipocosto` ()
BEGIN
	select * from tipocosto;
END$$
DELIMITER ;

-- Procedimientos almacenados de Tipo de Documento --
DROP procedure IF EXISTS `mostrar_tipodocumento`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_tipodocumento` ()
BEGIN
	select * from tipodocumento;
END$$
DELIMITER ;



-- Procedimientos almacenados de Empleados --
use caticao;
DROP procedure IF EXISTS `mostrar_empleados`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_empleados` ()
BEGIN
	select * from empleado;
END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_empleado`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_empleado` (  in nombreI VARCHAR(50),
                                        in apellidoI VARCHAR(50),
                                        in idUsuarioI INT,
                                        in correoI VARCHAR(50),
                                        in idTipoDocumentoI INT,
                                        in numeroDocumentoI VARCHAR(15),
                                        in direccionI  VARCHAR(50),
                                        in telefonoI  VARCHAR(15),
                                        in fechaNacimientoI DATE,
                                        in cargoI  VARCHAR(50),
                                        in horarioTrabajoI  VARCHAR(50),
                                        in horasPorDiaI INT,
                                        in sueldoPorDiaI DECIMAL(10,2),
                                        in sueldoPorMesI DECIMAL(10,2),
                                        in idTipoCostoI INT)
BEGIN
	insert into empleado (nombre,apellido,idUsuario,correo,idTipoDocumento,numeroDocumento,direccion,telefono,fechaNacimiento,cargo,horarioTrabajo,horasPorDia,sueldoPorDia,precioUnitario,sueldoPorMes,idTipoCosto)
				 values  (nombreI,apellidoI,idUsuarioI,correoI,idTipoDocumentoI,numeroDocumentoI,direccionI,telefonoI,fechaNacimientoI,cargoI,horarioTrabajoI,horasPorDiaI,sueldoPorDiaI,sueldoPorDiaI/horasPorDiaI,sueldoPorMesI,idTipoCostoI);
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_empleado`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_empleado` (    in idEmpleadoE INT,
										in nombreE VARCHAR(50),
                                        in apellidoE VARCHAR(50),
                                        in idUsuarioE INT,
                                        in correoE VARCHAR(50),
                                        in idTipoDocumentoE INT,
                                        in numeroDocumentoE VARCHAR(15),
                                        in direccionE  VARCHAR(50),
                                        in telefonoE  VARCHAR(15),
                                        in fechaNacimientoE DATE,
                                        in cargoE  VARCHAR(50),
                                        in horarioTrabajoE  VARCHAR(50),
                                        in horasPorDiaE INT,
                                        in sueldoPorDiaE DECIMAL(10,2),
                                        in sueldoPorMesE DECIMAL(10,2),
                                        in idTipoCostoE INT)
BEGIN
	update empleado set idEmpleado=idEmpleadoE,
                        nombre=nombreE,
                        apellido=apellidoE,
                        idUsuario=idUsuarioE,
                        correo=correoE,
                        idTipoDocumento=idTipoDocumentoE,
                        numeroDocumento=numeroDocumentoE,
                        direccion=direccionE,
                        telefono=telefonoE,
                        fechaNacimiento=fechaNacimientoE,
                        cargo=cargoE,
                        horarioTrabajo=horarioTrabajoE,
                        horasPorDia=horasPorDiaE,
                        horasPorDia=horasPorDiaE,
                        sueldoPorDia=sueldoPorDiaE,
                        precioUnitario=sueldoPorDiaE/horasPorDiaE,
                        sueldoPorMes=sueldoPorMesE,
                        idTipoCosto=idTipoCostoE
				where idEmpleado=idEmpleadoE;
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_empleado`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_empleado` (in idEmpleadoE int)
BEGIN
	delete from empleado
    where idEmpleado=idEmpleadoE;
END$$
DELIMITER ;


-- Procedimientos almacenados de GastoAdmin --

DROP procedure IF EXISTS `mostrar_gastoadmin`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_gastoadmin` ()
BEGIN
	select * from gastoadmin where idDesembolso=1;
END$$
DELIMITER ;

DROP procedure IF EXISTS `insertar_gastoadmin`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_gastoadmin` (in descripcionI VARCHAR(100),
                                        in idUnidadMedidaI INT,
                                        in precioI DECIMAL(10,2),
                                        in idTipoCostoI INT)
BEGIN
	insert into gastoadmin (descripcion,idUnidadMedida,precio,idTipoCosto,idDesembolso)
				  values   (descripcionI,idUnidadMedidaI,precioI,idTipoCostoI,1);
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_gastoadmin`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_gastoadmin` (  in idGastoAdminE INT,
                                        in descripcionE VARCHAR(100),
                                        in idUnidadMedidaE INT,
                                        in precioE DECIMAL(10,2),
                                        in idTipoCostoE INT)
BEGIN
	update gastoadmin set   idGastoAdmin=idGastoAdminE,
							descripcion=descripcionE,
							idUnidadMedida=idUnidadMedidaE,
							precio=precioE,
							idTipoCosto=idTipoCostoE
				      where idGastoAdmin=idGastoAdminE;
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_gastoadmin`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_gastoadmin` (in idGastoAdminE int)
BEGIN
	delete from gastoadmin
    where idGastoAdmin=idGastoAdminE;
END$$
DELIMITER ;


-- Procedimientos almacenados de Costo de Venta --

DROP procedure IF EXISTS `mostrar_costoventa`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_costoventa` ()
BEGIN
	select * from gastoadmin where idDesembolso=2;
END$$
DELIMITER ;

DROP procedure IF EXISTS `insertar_costoventa`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_costoventa` (in descripcionI VARCHAR(100),
                                        in idUnidadMedidaI INT,
                                        in precioI DECIMAL(10,2),
                                        in idTipoCostoI INT)
BEGIN
	insert into gastoadmin (descripcion,idUnidadMedida,precio,idTipoCosto,idDesembolso)
				  values   (descripcionI,idUnidadMedidaI,precioI,idTipoCostoI,2);
END$$
DELIMITER ;

-- Procedimientos almacenados de Costo de Marketing --

DROP procedure IF EXISTS `mostrar_costomarketing`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_costomarketing` ()
BEGIN
	select * from gastoadmin where idDesembolso=3;
END$$
DELIMITER ;

DROP procedure IF EXISTS `insertar_costomarketing`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_costomarketing` (in descripcionI VARCHAR(100),
                                        in idUnidadMedidaI INT,
                                        in precioI DECIMAL(10,2),
                                        in idTipoCostoI INT)
BEGIN
	insert into gastoadmin (descripcion,idUnidadMedida,precio,idTipoCosto,idDesembolso)
				  values   (descripcionI,idUnidadMedidaI,precioI,idTipoCostoI,3);
END$$
DELIMITER ;


-- Procedimientos almacenados de Costo Operativo--

DROP procedure IF EXISTS `mostrar_costooperativo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_costooperativo` ()
BEGIN
	select * from gastoadmin where idDesembolso=4;
END$$
DELIMITER ;

DROP procedure IF EXISTS `insertar_costooperativo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_costooperativo` (in descripcionI VARCHAR(100),
											in idUnidadMedidaI INT,
											in precioI DECIMAL(10,2),
											in idTipoCostoI INT)
BEGIN
	insert into gastoadmin (descripcion,idUnidadMedida,precio,idTipoCosto,idDesembolso)
				  values   (descripcionI,idUnidadMedidaI,precioI,idTipoCostoI,4);
END$$
DELIMITER ;

-- Procedimientos almacenados de mostrar inventario de insumos --

DROP procedure IF EXISTS `mostrar_inventarioinsumos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_inventarioinsumos` ()
BEGIN
	Select * from inventariomateria im 
             right join materia m on m.idMateria=im.idMateria
             where m.idTipoMateria=1
             order by im.stock asc;
END$$
DELIMITER ;

-- Procedimientos almacenados de ingreso y salida de insumos --

DROP procedure IF EXISTS `insertar_ingresoinsumo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_ingresoinsumo` (     in idMateriaI INT,
                                                in ingresoI double(10,2),
                                                in observacionI varchar(50),
                                                in fechaI date)
BEGIN

    UPDATE inventariomateria SET stock = stock + ingresoI, idMateria=idMateriaI
						   WHERE idInventarioMateria=idMateriaI;
                           
    insert into movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				           values (idMateriaI,ingresoI,0,observacionI,"S-C",fechaI,1);

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_salidainsumo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_salidainsumo` (      in idMateriaI INT,
                                                in salidaI double(10,2),
                                                in observacionI varchar(50),
                                                in fechaI date)
BEGIN
     UPDATE inventariomateria SET stock = stock - salidaI, idMateria=idMateriaI
						   WHERE idInventarioMateria=idMateriaI;
	insert into movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				           values (idMateriaI,0,salidaI,observacionI,"S-C",fechaI,2);
						
    

END$$
DELIMITER ;

-- Procedimientos almacenados de mostrar Movimiento --
DROP procedure IF EXISTS `mostrar_movimiento`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_movimiento` ()
BEGIN

Select * from movimiento;

END$$
DELIMITER ;

-- Procedimientos almacenados de mostrar kardex de insumos --
DROP procedure IF EXISTS `mostrar_kardexinsumos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_kardexinsumos` (in idMateriaK int)
BEGIN

		Select mm.idMateria,m.nombre,mm.idMovimiento,mv.descripcion,mm.observacion,mm.codigoReceta,mm.fecha,mm.hora,
				mm.ingreso,mm.salida ,SUM(+ingreso-salida) 
				OVER(ORDER BY mm.hora ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
				AS saldo from movimientomateria mm 
				inner join materia m on m.idMateria=mm.idMateria
				inner join movimiento mv on mv.idMovimiento=mm.idMovimiento
				where m.idTipoMateria=1 and mm.idMateria=idMateriaK;
END$$
DELIMITER ;


-- Procedimientos almacenados de mostrar Configuracion --
DROP procedure IF EXISTS `mostrar_configuracion`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_configuracion` ()
BEGIN
		Select * from configuracion;
END$$
DELIMITER ;


-- Procedimientos almacenados de mostrar inventario de materiales --

DROP procedure IF EXISTS `mostrar_inventariomateriales`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_inventariomateriales` ()
BEGIN
	Select * from inventariomateria im 
             right join materia m on m.idMateria=im.idMateria
             where m.idTipoMateria=2
             order by im.stock asc;
END$$
DELIMITER ;

-- Procedimientos almacenados de ingreso y salida de materiales --

DROP procedure IF EXISTS `insertar_ingresomaterial`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_ingresomaterial` (   in idMateriaI INT,
                                                in ingresoI double(10,2),
                                                in observacionI varchar(50),
                                                in fechaI date)
BEGIN

    UPDATE inventariomateria SET stock = stock + ingresoI, idMateria=idMateriaI
						   WHERE idInventarioMateria=idMateriaI;
                           
    insert into movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				           values (idMateriaI,ingresoI,0,observacionI,"S-C",fechaI,1);
				           

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_salidamaterial`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_salidamaterial` (    in idMateriaI INT,
                                                in salidaI double(10,2),
                                                in observacionI varchar(50),
                                                in fechaI date)
BEGIN
     UPDATE inventariomateria SET stock = stock - salidaI, idMateria=idMateriaI
						   WHERE idInventarioMateria=idMateriaI;
	insert into movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				           values (idMateriaI,0,salidaI,observacionI,"S-C",fechaI,2);
						
    

END$$
DELIMITER ;

-- Procedimientos almacenados de mostrar kardex de materiales --
DROP procedure IF EXISTS `mostrar_kardexmateriales`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_kardexmateriales` (in idMateriaK int)
BEGIN
		Select mm.idMateria,m.nombre,mm.idMovimiento,mv.descripcion,mm.observacion,mm.codigoReceta,mm.fecha,mm.hora,
				mm.ingreso,mm.salida ,SUM(+ingreso-salida) 
				OVER(ORDER BY mm.hora ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
				AS saldo from movimientomateria mm 
				inner join materia m on m.idMateria=mm.idMateria
				inner join movimiento mv on mv.idMovimiento=mm.idMovimiento
				where m.idTipoMateria=2 and mm.idMateria=idMateriaK;
END$$
DELIMITER ;




-- Procedimientos almacenados de mostrar inventario de productos --

DROP procedure IF EXISTS `mostrar_inventarioproductos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_inventarioproductos` ()
BEGIN
	Select * from inventarioproducto ip
             right join producto p on p.idProducto=ip.idProducto
             order by ip.stock asc;
END$$
DELIMITER ;

-- Procedimientos almacenados de ingreso y salida de productos --

DROP procedure IF EXISTS `insertar_ingresoproducto`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_ingresoproducto` (   in idProductoI INT,
                                                in ingresoI double(10,2),
                                                in observacionI varchar(50),
                                                in fechaI date)
BEGIN

    UPDATE inventarioproducto SET stock = stock + ingresoI, idProducto=idProductoI
						   WHERE idInventarioProducto=idProductoI;
                           
    insert into movimientoproducto (idProducto,ingreso,salida,observacion,fecha,idMovimiento)
				           values (idProductoI,ingresoI,0,observacionI,fechaI,1);

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_salidaproducto`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_salidaproducto` (    in idProductoI INT,
                                                in salidaI double(10,2),
                                                in observacionI varchar(50),
                                                in fechaI date)
BEGIN
     UPDATE inventarioproducto SET stock = stock - salidaI, idProducto=idProductoI
						   WHERE idInventarioProducto=idProductoI;
                           
	insert into movimientoproducto (idProducto,ingreso,salida,observacion,fecha,idMovimiento)
				           values (idProductoI,0,salidaI,observacionI,fechaI,2);
						
    

END$$
DELIMITER ;

use caticao;
-- Procedimientos almacenados de mostrar kardex de productos --
DROP procedure IF EXISTS `mostrar_kardexproductos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_kardexproductos` (in idProductoK int)
BEGIN
		Select mp.idProducto,p.nombre,mp.idMovimiento,mv.descripcion,mp.observacion,mp.fecha,mp.hora,
				mp.ingreso,mp.salida ,SUM(+ingreso-salida) 
				OVER(ORDER BY mp.hora ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
				AS saldo from movimientoproducto mp 
				inner join producto p on p.idProducto=mp.idProducto
				inner join movimiento mv on mv.idMovimiento=mp.idMovimiento
				where mp.idProducto=idProductoK;
END$$
DELIMITER ;


-- Procedimientos almacenados de mostrar inventario de maquinas --
use caticao;
DROP procedure IF EXISTS `mostrar_inventariomaquinas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_inventariomaquinas` ()
BEGIN
	Select * from inventariomaquina im
             right join maquina m on m.idMaquina=im.idMaquina
             order by im.stock asc;
END$$
DELIMITER ;

-- Procedimientos almacenados de ingreso y salida de maquinas --

DROP procedure IF EXISTS `insertar_ingresomaquina`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_ingresomaquina` (   in idMaquinaI INT,
                                                in ingresoI double(10,2),
                                                in observacionI varchar(50),
                                                in fechaI date)
BEGIN

    UPDATE inventariomaquina SET stock = stock + ingresoI, idMaquina=idMaquinaI
						   WHERE idInventarioMaquina=idMaquinaI;
                           
    insert into movimientomaquina (idMaquina,ingreso,salida,observacion,fecha,idMovimiento)
				           values (idMaquinaI,ingresoI,0,observacionI,fechaI,1);

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_salidamaquina`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_salidamaquina` (    in idMaquinaI INT,
                                                in salidaI double(10,2),
                                                in observacionI varchar(50),
                                                in fechaI date)
BEGIN
     UPDATE inventariomaquina SET stock = stock - salidaI, idMaquina=idMaquinaI
						   WHERE idInventarioMaquina=idMaquinaI;
                           
	insert into movimientomaquina (idMaquina,ingreso,salida,observacion,fecha,idMovimiento)
				           values (idMaquinaI,0,salidaI,observacionI,fechaI,2);
						
    

END$$
DELIMITER ;

use caticao;
-- Procedimientos almacenados de mostrar kardex de maquinas --
DROP procedure IF EXISTS `mostrar_kardexmaquinas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_kardexmaquinas` (in idMaquinaK int)
BEGIN
		Select mm.idMaquina,m.nombre,mm.idMovimiento,mv.descripcion,mm.observacion,mm.fecha,mm.hora,
				mm.ingreso,mm.salida ,SUM(+ingreso-salida) 
				OVER(ORDER BY mm.hora ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
				AS saldo from movimientomaquina mm
				inner join maquina m on m.idMaquina=mm.idMaquina
				inner join movimiento mv on mv.idMovimiento=mm.idMovimiento
				where mm.idMaquina=idMaquinaK;
END$$
DELIMITER ;

-- Procedimientos almacenados de estado --

DROP procedure IF EXISTS `mostrar_estados`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_estados` ()
BEGIN
	select * from estado;
END$$
DELIMITER ;

-- Procedimientos almacenados de lote --

DROP procedure IF EXISTS `mostrar_lotes`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_lotes` ()
BEGIN
	select * from lote;
END$$
DELIMITER ;


-- Procedimientos almacenados de Recetas --

DROP procedure IF EXISTS `mostrar_recetas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetas` ()
BEGIN
	select * from receta ;
END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_receta`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_receta` (    in codigoI VARCHAR(20),
                                        in nombreI VARCHAR(50),
                                        in idProductoI INT,
                                        in batchI DECIMAL(10,2),
                                        in idEstadoI INT,
                                        in fechaInicioI date,
                                        in fechaFinI date,
                                        in codigoLoteI VARCHAR(20),
                                        in fechaVencimientoI date,
                                        in pesoPorTabletaI DECIMAL(10,2),
                                        in pesoEnTabletaI DECIMAL(10,2),
                                        in mermaI DECIMAL(10,2),
                                        in reprocesoI DECIMAL(10,2))
BEGIN

    insert into lote (codigoLote,fechaVencimiento,idProducto)
			   values (codigoLoteI,fechaVencimientoI,idProductoI);
                
	insert into receta (codigo,nombre,batch,idEstado,fechaInicio,fechaFin,pesoPorTableta,pesoEnTableta,merma,reproceso,codigoLote)
			      values (codigoI,nombreI,batchI,idEstadoI,fechaInicioI,fechaFinI,pesoPorTabletaI,pesoEnTabletaI,mermaI,reprocesoI,codigoLoteI);
	
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_receta`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_receta` (      in idRecetaE INT,
									    in idLoteE INT,
                                        in codigoE VARCHAR(20),
                                        in nombreE VARCHAR(50),
                                        in idProductoE INT,
                                        in batchE DECIMAL(10,2),
                                        in idEstadoE INT,
                                        in fechaInicioE date,
                                        in fechaFinE date,
                                        in codigoLoteE VARCHAR(20),
                                        in fechaVencimientoE date,
                                        in pesoPorTabletaE DECIMAL(10,2),
                                        in pesoEnTabletaE DECIMAL(10,2),
                                        in mermaE DECIMAL(10,2),
                                        in reprocesoE DECIMAL(10,2))
BEGIN
	update lote  set    codigoLote=codigoLoteE,
                        fechaVencimiento=fechaVencimientoE,
                        idProducto=idProductoE
			   where    idLote=idLoteE;

	update receta set   codigo=codigoE,
                        nombre=nombreE,
                        batch=batchE,
                        idEstado=idEstadoE,
                        fechaInicio=fechaInicioE,
                        fechaFin=fechaFinE,
                        codigoLote=codigoLoteE,
                        pesoPorTableta=pesoPorTabletaE,
                        pesoEnTableta=pesoEnTabletaE,
                        merma=mermaE,
                        reproceso=reprocesoE
				where idReceta=idRecetaE;
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_receta`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_receta` (in idRecetaE INT,in codigoRecetaE VARCHAR(20),in codigoLoteE VARCHAR(20))
BEGIN

    DELETE FROM movimientomateria
    WHERE codigoReceta=codigoRecetaE;
    
    DELETE FROM recetamateria
    WHERE idReceta=idRecetaE;
    
    DELETE FROM recetamanodeobra
    WHERE idReceta=idRecetaE;
    
    DELETE FROM recetadepreciacion
    WHERE idReceta=idRecetaE;
    
    DELETE FROM recetaconsumoenergia
    WHERE idReceta=idRecetaE;
    
    DELETE FROM recetaconsumogas
    WHERE idReceta=idRecetaE;
    
    DELETE FROM recetacostoventa
    WHERE idReceta=idRecetaE;
    
    DELETE FROM recetacostomarketing
    WHERE idReceta=idRecetaE;
    
    DELETE FROM recetacostooperativo
    WHERE idReceta=idRecetaE;
    
	 DELETE FROM receta
    WHERE idReceta=idRecetaE;
    
    DELETE FROM lote
    WHERE codigoLote=codigoLoteE;
    
END$$
DELIMITER ;


-- Procedimientos almacenados de Receta Insumos --

DROP procedure IF EXISTS `mostrar_detalleinsumos1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_detalleinsumos1` (in idMateriaC INT)
BEGIN
	select m.idMateria,m.nombre,mr.idMarca,mr.descripcion as marca,m.precioUnitario,im.stock,um.descripcion as unidadMedida  from materia m 
    left join inventariomateria im on im.idMateria=m.idMateria
    inner join unidadmedida um on um.idUnidadMedida=m.idUnidadMedida
    inner join marca mr on mr.idMarca=m.idMarca
    where m.idMateria=idMateriaC;
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_detalleinsumos2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_detalleinsumos2` ()
BEGIN
	select m.idMateria,m.nombre,mr.idMarca,mr.descripcion as marca,m.precioUnitario,im.stock,um.descripcion as unidadMedida  from materia m 
    left join inventariomateria im on im.idMateria=m.idMateria
    inner join unidadmedida um on um.idUnidadMedida=m.idUnidadMedida
    inner join marca mr on mr.idMarca=m.idMarca
    where m.idTipoMateria=1
	 ORDER BY m.nombre ASC;
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetainsumos1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetainsumos1` (in idRecetaMateriaC INT)
BEGIN
	 select rm.idReceta,rm.idRecetaMateria,rm.idMateria,rm.nombre,im.stock,um.descripcion as unidadMedida,rm.cantidad,rm.precioUnitario,rm.total from recetamateria rm
    inner join materia m on m.idMateria=rm.idMateria
    inner join inventariomateria im on im.idMateria=m.idMateria
    inner join unidadmedida um on um.idUnidadMedida=m.idUnidadMedida
    where rm.idRecetaMateria=idRecetaMateriaC;
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetainsumos2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetainsumos2` (in idRecetaC INT)
BEGIN
	 select rm.idReceta,rm.idRecetaMateria,rm.idMateria,rm.nombre,im.stock,um.descripcion as unidadMedida,rm.cantidad,rm.precioUnitario,rm.total from recetamateria rm
    inner join materia m on m.idMateria=rm.idMateria
    inner join inventariomateria im on im.idMateria=m.idMateria
    inner join unidadmedida um on um.idUnidadMedida=m.idUnidadMedida
    where rm.idReceta=idRecetaC and m.idTipoMateria=1;
END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_recetainsumo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_recetainsumo` (     in idRecetaI INT,
																in codigoRecetaI VARCHAR(20),
                                                in idMateriaI INT,
                                                in nombreI VARCHAR(50),
                                                in cantidadI DECIMAL(10,3),
                                                in precioUnitarioI DECIMAL(10,3),
												            in totalI DECIMAL(10,3) )
BEGIN
    UPDATE inventariomateria SET stock = stock - cantidadI
						         WHERE idMateria=idMateriaI;
                            
    INSERT INTO movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				               VALUES (idMateriaI,0,cantidadI,"Agregado Receta:",codigoRecetaI,CURRENT_DATE(),2);

	 INSERT INTO recetamateria (idMateria,idReceta,nombre,cantidad,precioUnitario,total)
			              VALUES (idMateriaI,idRecetaI,nombreI,cantidadI,precioUnitarioI,totalI);
	
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_recetainsumo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetainsumo` (       in idRecetaMateriaE INT,
																in idRecetaE INT,
																in codigoRecetaE VARCHAR(20),
                                                in idMateriaE INT,
                                                in nombreE VARCHAR(50),
                                                in cantidadAntE DECIMAL(10,3),
                                                in difcantidadE DECIMAL(10,3),
                                                in cantidadE DECIMAL(10,3),
                                                in precioUnitarioE DECIMAL(10,3),
												            in totalE DECIMAL(10,3))
BEGIN

   INSERT INTO movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				               VALUES (idMateriaE,cantidadAntE,0,"Editado Receta:",codigoRecetaE,CURRENT_DATE(),1);
    	   
   DELETE from recetamateria WHERE idRecetaMateria=idRecetaMateriaE;
   

   UPDATE inventariomateria SET stock = stock + (difcantidadE)
						         WHERE idMateria=idMateriaE;
                            
   INSERT INTO movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				              VALUES (idMateriaE,0,cantidade,"Editado Receta:",codigoRecetaE,CURRENT_DATE(),2);

	INSERT INTO recetamateria (idRecetaMateria,idMateria,idReceta,nombre,cantidad,precioUnitario,total)
			             VALUES (idRecetaMateriaE,idMateriaE,idRecetaE,nombreE,cantidadE,precioUnitarioE,totalE);


END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetainsumo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetainsumo` (in idRecetaMateriaE INT,
														 in codigoRecetaE VARCHAR(20),
										             in idMateriaE int,
                                           in cantidadE DECIMAL(10,3))
BEGIN
    	   
   DELETE from recetamateria WHERE idRecetaMateria=idRecetaMateriaE;
   
   DELETE movimientomateria FROM movimientomateria
	                         INNER JOIN materia ON movimientomateria.idMateria=movimientomateria.idMateria 
					             WHERE movimientomateria.idMateria=idMateriaE  AND movimientomateria.codigoReceta=codigoRecetaE;
					             
	-- ACTUALIZA EL INVENTARIO CON ELIMINAR E INSERTAR--						   
	DELETE inventariomateria FROM inventariomateria
	                         INNER JOIN materia ON inventariomateria.idMateria=inventariomateria.idMateria 
					             WHERE inventariomateria.idMateria > 0;
								
	INSERT INTO inventariomateria (idInventarioMateria,stock,idMateria)		
	                       SELECT mm.idMateria AS idInventarioMateria,SUM(mm.ingreso) - SUM(mm.salida) AS stock,mm.idMateria FROM movimientomateria mm
                          INNER JOIN materia m ON m.idMateria=mm.idMateria
                          GROUP BY mm.idMateria;
						
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetainsumo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetainsumo` (in idRecetaC INT)
BEGIN
      SELECT SUM(total) FROM recetamateria rm INNER JOIN materia m ON m.idMateria=rm.idMateria
		                                        WHERE rm.idReceta=idRecetaC and m.idTipoMateria=1;
END$$
DELIMITER ;

-- Procedimientos almacenados de Receta Materiales --

DROP procedure IF EXISTS `mostrar_detallemateriales1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_detallemateriales1` (in idMateriaC INT)
BEGIN
	select m.idMateria,m.nombre,mr.idMarca,mr.descripcion as marca,m.precioUnitario,im.stock,um.descripcion as unidadMedida  from materia m 
    left join inventariomateria im on im.idMateria=m.idMateria
    inner join unidadmedida um on um.idUnidadMedida=m.idUnidadMedida
    inner join marca mr on mr.idMarca=m.idMarca
    where m.idMateria=idMateriaC;
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_detallemateriales2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_detallemateriales2` ()
BEGIN
	select m.idMateria,m.nombre,mr.idMarca,mr.descripcion as marca,m.precioUnitario,im.stock,um.descripcion as unidadMedida  from materia m 
    left join inventariomateria im on im.idMateria=m.idMateria
    inner join unidadmedida um on um.idUnidadMedida=m.idUnidadMedida
    inner join marca mr on mr.idMarca=m.idMarca
    where m.idTipoMateria=2
	 ORDER BY m.nombre ASC;
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetamateriales1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetamateriales1` (in idRecetaMateriaC INT)
BEGIN
	 select rm.idReceta,rm.idRecetaMateria,rm.idMateria,rm.nombre,im.stock,um.descripcion as unidadMedida,rm.cantidad,rm.precioUnitario,rm.total from recetamateria rm
    inner join materia m on m.idMateria=rm.idMateria
    inner join inventariomateria im on im.idMateria=m.idMateria
    inner join unidadmedida um on um.idUnidadMedida=m.idUnidadMedida
    where rm.idRecetaMateria=idRecetaMateriaC;
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetamateriales2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetamateriales2` (in idRecetaC INT)
BEGIN
	 select rm.idReceta,rm.idRecetaMateria,rm.idMateria,rm.nombre,im.stock,um.descripcion as unidadMedida,rm.cantidad,rm.precioUnitario,rm.total from recetamateria rm
    inner join materia m on m.idMateria=rm.idMateria
    inner join inventariomateria im on im.idMateria=m.idMateria
    inner join unidadmedida um on um.idUnidadMedida=m.idUnidadMedida
    where rm.idReceta=idRecetaC and m.idTipoMateria=2;
END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_recetamaterial`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_recetamaterial` (    in idRecetaI INT,
																in codigoRecetaI VARCHAR(20),
                                                in idMateriaI INT,
                                                in nombreI VARCHAR(50),
                                                in cantidadI DECIMAL(10,3),
                                                in precioUnitarioI DECIMAL(10,3),
												            in totalI DECIMAL(10,3) )
BEGIN


	 UPDATE inventariomateria SET stock = stock - cantidadI
						         WHERE idMateria=idMateriaI;
                            
    INSERT INTO movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				               VALUES (idMateriaI,0,cantidadI,"Agregado Receta:",codigoRecetaI,CURRENT_DATE(),2);

	 INSERT INTO recetamateria (idMateria,idReceta,nombre,cantidad,precioUnitario,total)
			              VALUES (idMateriaI,idRecetaI,nombreI,cantidadI,precioUnitarioI,totalI);

	
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_recetamaterial`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetamaterial` (      in idRecetaMateriaE INT,
																in idRecetaE INT,
																in codigoRecetaE VARCHAR(20),
                                                in idMateriaE INT,
                                                in nombreE VARCHAR(50),
                                                in cantidadAntE DECIMAL(10,3),
                                                in difcantidadE DECIMAL(10,3),
                                                in cantidadE DECIMAL(10,3),
                                                in precioUnitarioE DECIMAL(10,3),
												            in totalE DECIMAL(10,3))
BEGIN

	INSERT INTO movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				               VALUES (idMateriaE,cantidadAntE,0,"Editado Receta:",codigoRecetaE,CURRENT_DATE(),1);
    	   
   DELETE from recetamateria WHERE idRecetaMateria=idRecetaMateriaE;
   

   UPDATE inventariomateria SET stock = stock + (difcantidadE)
						         WHERE idMateria=idMateriaE;
                            
   INSERT INTO movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				              VALUES (idMateriaE,0,cantidade,"Editado Receta:",codigoRecetaE,CURRENT_DATE(),2);

	INSERT INTO recetamateria (idRecetaMateria,idMateria,idReceta,nombre,cantidad,precioUnitario,total)
			             VALUES (idRecetaMateriaE,idMateriaE,idRecetaE,nombreE,cantidadE,precioUnitarioE,totalE);

END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetamaterial`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetamaterial` (in idRecetaMateriaE INT,
														 in codigoRecetaE VARCHAR(20),
										             in idMateriaE INT,
                                           in cantidadE DECIMAL(10,3))
BEGIN

   DELETE from recetamateria WHERE idRecetaMateria=idRecetaMateriaE;
   
   DELETE movimientomateria FROM movimientomateria
	                         INNER JOIN materia ON movimientomateria.idMateria=movimientomateria.idMateria 
					             WHERE movimientomateria.idMateria=idMateriaE  AND movimientomateria.codigoReceta=codigoRecetaE;
					             
	-- ACTUALIZA EL INVENTARIO CON ELIMINAR E INSERTAR--						   
	DELETE inventariomateria FROM inventariomateria
	                         INNER JOIN materia ON inventariomateria.idMateria=inventariomateria.idMateria 
					             WHERE inventariomateria.idMateria > 0;
								
	INSERT INTO inventariomateria (idInventarioMateria,stock,idMateria)		
	                       SELECT mm.idMateria AS idInventarioMateria,SUM(mm.ingreso) - SUM(mm.salida) AS stock,mm.idMateria FROM movimientomateria mm
                          INNER JOIN materia m ON m.idMateria=mm.idMateria
                          GROUP BY mm.idMateria;
						
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetamaterial`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetamaterial` (in idRecetaC INT)
BEGIN
			SELECT SUM(total) FROM recetamateria rm INNER JOIN materia m ON m.idMateria=rm.idMateria
		                                           WHERE rm.idReceta=idRecetaC and m.idTipoMateria=2;
END$$
DELIMITER ;


-- Procedimientos almacenados de Receta Mano de Obra --

DROP procedure IF EXISTS `mostrar_recetamanodeobra1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetamanodeobra1` (in idRecetaManodeObraC INT)
BEGIN
	 select rm.idRecetaManodeObra,rm.idReceta,rm.idEmpleado,rm.nombreEmpleado,rm.idMaquina,rm.nombreMaquina, rm.tiempoHoras,rm.precioUnitario,rm.total from recetamanodeobra rm
    inner join empleado e on e.idEmpleado=rm.idEmpleado
    inner join maquina m ON m.idMaquina=rm.idMaquina
    where rm.idRecetaManodeObra=idRecetaManodeObraC;
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetamanodeobra2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetamanodeobra2` (in idRecetaC INT)
BEGIN
	 select rm.idRecetaManodeObra,rm.idReceta,rm.idEmpleado,rm.nombreEmpleado, rm.nombreMaquina, rm.tiempoHoras,rm.precioUnitario,rm.total from recetamanodeobra rm
    inner join empleado e on e.idEmpleado=rm.idEmpleado
    inner join maquina m ON m.idMaquina=rm.idMaquina
    where rm.idReceta=idRecetaC;
END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_recetamanodeobra`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_recetamanodeobra` (  in idRecetaI INT,
                                                in idEmpleadoI INT,
                                                in idMaquinaI INT,
                                                in nombreEmpleadoI VARCHAR(50),
                                                in nombreMaquinaI VARCHAR(50),
                                                in tiempoHorasI DECIMAL(10,3),
                                                in precioUnitarioI DECIMAL(10,3),
												            in totalI DECIMAL(10,3) )
BEGIN

	 INSERT INTO recetamanodeobra(idReceta,idEmpleado,idMaquina,nombreEmpleado,nombreMaquina,tiempoHoras,precioUnitario,total)
			              VALUES (idRecetaI,idEmpleadoI,idMaquinaI,nombreEmpleadoI,nombreMaquinaI,tiempoHorasI,precioUnitarioI,totalI);
	
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetamanodeobra`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetamanodeobra` (    in idRecetaManodeObraE INT,
                                                in tiempoHorasE DECIMAL(10,3),
												            in totalE DECIMAL(10,3))
BEGIN

   UPDATE recetamanodeobra SET tiempoHoras = tiempoHorasE,
                               total=totalE
						         WHERE idRecetaManodeObra=idRecetaManodeObraE;
                            
END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetamanodeobra`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetamanodeobra` (in idRecetaManodeObraE INT)
BEGIN
    	   
   DELETE from recetamanodeobra WHERE idRecetaManodeObra=idRecetaManodeObraE;
						
END$$
DELIMITER ;



DROP procedure IF EXISTS `sumatotal_recetamanodeobra`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetamanodeobra` (in idRecetaC INT)
BEGIN
			SELECT SUM(total) FROM recetamanodeobra rm 
		                     WHERE rm.idReceta=idRecetaC;
END$$
DELIMITER ;


-- Procedimientos almacenados de Receta Depreciación--

DROP procedure IF EXISTS `mostrar_recetadepreciacion1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetadepreciacion1` (in idRecetaDepreciacionC INT)
BEGIN

	 SELECT * FROM recetadepreciacion
    where idRecetaDepreciacion=idRecetaDepreciacionC;
    
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetadepreciacion2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetadepreciacion2` (in idRecetaC INT)
BEGIN

	 SELECT * FROM recetadepreciacion
    WHERE idReceta=idRecetaC;

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_recetadepreciacion`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_recetadepreciacion` (   in idRecetaI INT,
	                                                in idMaquinaI INT,
	                                                in nombreMaquinaI VARCHAR(50),
	                                                in tiempoHorasI DECIMAL(10,3),
	                                                in depreciacionHoraI DECIMAL(10,3),
													            in depreciacionPorBatchI DECIMAL(10,3) )
BEGIN

	 INSERT INTO recetadepreciacion(idReceta,idMaquina,nombreMaquina,tiempoHoras,depreciacionHora,depreciacionPorBatch)
			                 VALUES (idRecetaI,idMaquinaI,nombreMaquinaI,tiempoHorasI,depreciacionHoraI,depreciacionPorBatchI);
	
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetadepreciacion`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetadepreciacion` (  in idRecetaDepreciacionE INT,
                                                in tiempoHorasE DECIMAL(10,3),
												            in depreciacionPorBatchE DECIMAL(10,3))
BEGIN

   UPDATE recetadepreciacion SET tiempoHoras = tiempoHorasE,
                               depreciacionPorBatch=depreciacionPorBatchE
						         WHERE idRecetaDepreciacion=idRecetaDepreciacionE;
                            
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_recetadepreciacion`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetadepreciacion` (in idRecetaDepreciacionE INT)
BEGIN
    	   
   DELETE from recetadepreciacion WHERE idRecetaDepreciacion=idRecetaDepreciacionE;
						
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetadepreciacion`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetadepreciacion` (in idRecetaC INT)
BEGIN
			SELECT SUM(rd.depreciacionPorBatch) FROM recetadepreciacion rd 
		                     WHERE rd.idReceta=idRecetaC;
END$$
DELIMITER ;


-- Procedimientos almacenados de Receta Consumo de Energía--

DROP procedure IF EXISTS `mostrar_tarifaKwh`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_tarifaKwh` ()
BEGIN

   SELECT * FROM tarifaenergia;
                            
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_tarifaKwh`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_tarifaKwh` (  in tarifaKwhE DECIMAL(10,2))
BEGIN

   UPDATE tarifaenergia SET tarifaKwh = tarifaKwhE
						         WHERE idTarifaEnergia=1;
                            
END$$
DELIMITER ;


DROP procedure IF EXISTS `mostrar_recetaconsumoenergia1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetaconsumoenergia1` (in idRecetaConsumoEnergiaC INT)
BEGIN

	 SELECT * FROM recetaconsumoenergia
    where idRecetaConsumoEnergia=idRecetaConsumoEnergiaC;
    
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetaconsumoenergia2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetaconsumoenergia2` (in idRecetaC INT)
BEGIN

	 SELECT * FROM recetaconsumoenergia
    WHERE idReceta=idRecetaC;

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_recetaconsumoenergia`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_recetaconsumoenergia` (    in idRecetaI INT,
		                                                in idMaquinaI INT,
		                                                in nombreMaquinaI VARCHAR(50),
		                                                in potenciaKwI DECIMAL(10,3),
		                                                in horasTrabajoBatchI DECIMAL(10,3),
		                                                in consumoKwhI DECIMAL(10,3),
		                                                in tarifaKwhI DECIMAL(10,3),
		                                                in pagoPorBatchI DECIMAL(10,3))
BEGIN

	 INSERT INTO recetaconsumoenergia(idReceta,idMaquina,nombreMaquina,potenciaKw,horasTrabajoBatch,consumoKwh,idTarifaEnergia,tarifaKwh,pagoPorBatch)
			                 VALUES (idRecetaI,idMaquinaI,nombreMaquinaI,potenciaKwI,horasTrabajoBatchI,consumoKwhI,1,tarifaKwhI,pagoPorBatchI);
	
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetaconsumoenergia`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetaconsumoenergia` (  in idRecetaConsumoEnergiaE INT,
																  in horasTrabajoBatchE DECIMAL(10,3),	
                                                  in consumoKwhE DECIMAL(10,3),
												              in pagoPorBatchE DECIMAL(10,3))
BEGIN

   UPDATE recetaconsumoenergia SET horasTrabajoBatch = horasTrabajoBatchE,
                                   consumoKwh=consumoKwhE,
                                   pagoPorBatch = pagoPorBatchE
						         WHERE idRecetaConsumoEnergia=idRecetaConsumoEnergiaE;
                            
END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetaconsumoenergia`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetaconsumoenergia` (in idRecetaConsumoEnergiaE INT)
BEGIN
    	   
   DELETE from recetaconsumoenergia WHERE idRecetaConsumoEnergia=idRecetaConsumoEnergiaE;
						
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetaconsumoenergia`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetaconsumoenergia` (in idRecetaC INT)
BEGIN
			SELECT SUM(pagoPorBatch) FROM recetaconsumoenergia 
		                     WHERE idReceta=idRecetaC;
END$$
DELIMITER ;


-- Procedimientos almacenados de Receta Consumo de Gas--

DROP procedure IF EXISTS `mostrar_recetaconsumogas1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetaconsumogas1` (in idRecetaConsumoGasC INT)
BEGIN

	 SELECT * FROM recetaconsumogas
    where idRecetaConsumoGas=idRecetaConsumoGasC;
    
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetaconsumogas2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetaconsumogas2` (in idRecetaC INT)
BEGIN

	 SELECT * FROM recetaconsumogas
    WHERE idReceta=idRecetaC;

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_recetaconsumogas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_recetaconsumogas` (     in idRecetaI INT,
	                                                in idMaquinaI INT,
	                                                in nombreMaquinaI VARCHAR(50),
	                                                in trabajoPorBatchI DECIMAL(10,2),
	                                                in pesoBalonGasI DECIMAL(10,2),
													            in tarifaGasI DECIMAL(10,2))
BEGIN

	 INSERT INTO recetaconsumogas(idReceta,idMaquina,nombreMaquina,trabajoPorBatch,pesoBalonGas,tarifaGas,pagoPorBatch)
			                 VALUES (idRecetaI,idMaquinaI,nombreMaquinaI,trabajoPorBatchI,pesoBalonGasI,tarifaGasI,pesoBalonGasI*tarifaGasI);
	
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetaconsumogas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetaconsumogas` (  in idRecetaConsumoGasE INT,
                                              in trabajoPorBatchE DECIMAL(10,2),
	                                           in pesoBalonGasE DECIMAL(10,2),
													       in tarifaGasE DECIMAL(10,2))
BEGIN

   UPDATE recetaconsumogas SET trabajoPorBatch = trabajoPorBatchE,
                               pesoBalonGas=pesoBalonGasE,
                               tarifaGas=tarifaGasE,
                               pagoPorBatch=pesoBalonGasE*tarifaGasE
						         WHERE idRecetaConsumoGas=idRecetaConsumoGasE;
                            
END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetaconsumogas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetaconsumogas` (in idRecetaConsumoGasE INT)
BEGIN
    	   
   DELETE from recetaconsumogas WHERE idRecetaConsumoGas=idRecetaConsumoGasE;
						
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetaconsumogas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetaconsumogas` (in idRecetaC INT)
BEGIN
			SELECT SUM(pagoPorBatch) FROM recetaconsumogas
		                     WHERE idReceta=idRecetaC;
END$$
DELIMITER ;


-- Procedimientos almacenados de Receta Costo de Venta--

DROP procedure IF EXISTS `mostrar_recetacostoventa1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetacostoventa1` (in idRecetaCostoVentaC INT)
BEGIN

	 SELECT * FROM recetacostoventa
    where idRecetaCostoVenta=idRecetaCostoVentaC;
    
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetacostoventa2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetacostoventa2` (in idRecetaC INT)
BEGIN

	 SELECT * FROM recetacostoventa
    WHERE idReceta=idRecetaC;

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_recetacostoventa`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_recetacostoventa` (     in idRecetaI INT,
	                                                in idCostoVentaI INT,
	                                                in nombreCostoVentaI VARCHAR(50),
	                                                in cantidadI DECIMAL(10,3),
	                                                in precioI DECIMAL(10,3),
													            in totalI DECIMAL(10,3) )
BEGIN

	 INSERT INTO recetacostoventa(idReceta,idGastoAdmin,nombreCostoVenta,cantidad,precio,total)
			                 VALUES (idRecetaI,idCostoVentaI,nombreCostoVentaI,cantidadI,precioI,totalI);
	
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetacostoventa`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetacostoventa` (    in idRecetaCostoVentaE INT,
                                                in cantidadE DECIMAL(10,3),
												            in totalE DECIMAL(10,3))
BEGIN

   UPDATE recetacostoventa SET cantidad = cantidadE,
                               total=totalE
						         WHERE idRecetaCostoVenta=idRecetaCostoVentaE;
                            
END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetacostoventa`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetacostoventa` (in idRecetaCostoVentaE INT)
BEGIN
    	   
   DELETE from recetacostoventa WHERE idRecetaCostoVenta=idRecetaCostoVentaE;
						
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetacostoventa`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetacostoventa` (in idRecetaC INT)
BEGIN
			SELECT SUM(total) FROM recetacostoventa
		                     WHERE idReceta=idRecetaC;
END$$
DELIMITER ;



-- Procedimientos almacenados de Receta Costo de Marketing--

DROP procedure IF EXISTS `mostrar_recetacostomarketing1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetacostomarketing1` (in idRecetaCostoMarketingC INT)
BEGIN

	 SELECT * FROM recetacostomarketing
    where idRecetaCostoMarketing=idRecetaCostoMarketingC;
    
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetacostomarketing2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetacostomarketing2` (in idRecetaC INT)
BEGIN

	 SELECT * FROM recetacostomarketing
    WHERE idReceta=idRecetaC;

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_recetacostomarketing`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_recetacostomarketing` ( in idRecetaI INT,
	                                                in idCostoMarketingI INT,
	                                                in nombreCostoMarketingI VARCHAR(50),
	                                                in cantidadI DECIMAL(10,3),
	                                                in precioI DECIMAL(10,3),
													            in totalI DECIMAL(10,3) )
BEGIN

	 INSERT INTO recetacostomarketing(idReceta,idGastoAdmin,nombreCostoMarketing,cantidad,precio,total)
			                 VALUES (idRecetaI,idCostoMarketingI,nombreCostoMarketingI,cantidadI,precioI,totalI);
	
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetacostomarketing`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetacostomarketing` (    in idRecetaCostoMarketingE INT,
                                                in cantidadE DECIMAL(10,3),
												            in totalE DECIMAL(10,3))
BEGIN

   UPDATE recetacostomarketing SET cantidad = cantidadE,
                               total=totalE
						         WHERE idRecetaCostoMarketing=idRecetaCostoMarketingE;
                            
END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetacostomarketing`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetacostomarketing` (in idRecetaCostoMarketingE INT)
BEGIN
    	   
   DELETE from recetacostomarketing WHERE idRecetaCostoMarketing=idRecetaCostoMarketingE;
						
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetacostomarketing`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetacostomarketing` (in idRecetaC INT)
BEGIN
			SELECT SUM(total) FROM recetacostomarketing
		                     WHERE idReceta=idRecetaC;
END$$
DELIMITER ;


-- Procedimientos almacenados de Receta Costo de Venta--

DROP procedure IF EXISTS `mostrar_recetacostooperativo1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetacostooperativo1` (in idRecetaCostoOperativoC INT)
BEGIN

	 SELECT * FROM recetacostooperativo
    where idRecetaCostoOperativo=idRecetaCostoOperativoC;
    
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetacostooperativo2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetacostooperativo2` (in idRecetaC INT)
BEGIN

	 SELECT * FROM recetacostooperativo
    WHERE idReceta=idRecetaC;

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_recetacostooperativo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_recetacostooperativo` (     in idRecetaI INT,
	                                                in idCostoOperativoI INT,
	                                                in nombreCostoOperativoI VARCHAR(50),
	                                                in cantidadI DECIMAL(10,3),
	                                                in precioI DECIMAL(10,3),
													            in totalI DECIMAL(10,3) )
BEGIN

	 INSERT INTO recetacostooperativo(idReceta,idGastoAdmin,nombreCostoOperativo,cantidad,precio,total)
			                 VALUES (idRecetaI,idCostoOperativoI,nombreCostoOperativoI,cantidadI,precioI,totalI);
	
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetacostooperativo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetacostooperativo` (    in idRecetaCostoOperativoE INT,
                                                in cantidadE DECIMAL(10,3),
												            in totalE DECIMAL(10,3))
BEGIN

   UPDATE recetacostooperativo SET cantidad = cantidadE,
                               total=totalE
						         WHERE idRecetaCostoOperativo=idRecetaCostoOperativoE;
                            
END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetacostooperativo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetacostooperativo` (in idRecetaCostoOperativoE INT)
BEGIN
    	   
   DELETE from recetacostooperativo WHERE idRecetaCostoOperativo=idRecetaCostoOperativoE;
						
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetacostooperativo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetacostooperativo` (in idRecetaC INT)
BEGIN
			SELECT SUM(total) FROM recetacostooperativo
		                     WHERE idReceta=idRecetaC;
END$$
DELIMITER ;


-- PROCEDIMIENTO ALMACENADO PARA DUPLIAR UNA RECETA--
DROP procedure IF EXISTS `duplicar_receta`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `duplicar_receta` (in idRecetaD INT,
												in codigoRecetaD VARCHAR(20),
                                    in codigoLoteD VARCHAR(20),
												in nuevoIdRecetaD INT)
BEGIN
   -- CREAR CÓDIGO ALEATORIO PARA LA RECETA DUPLICADA --
	DECLARE rc VARCHAR(20);
	 
	SET rc=ROUND(((RAND() * (99999 - 11111)) + 11111));
	
	-- INSERTA EL LOTE DE LA RECETA DUPLICADA --
	INSERT INTO lote (idLote,codigoLote,fechaVencimiento,idProducto)
				  SELECT nuevoIdRecetaD,rc,fechaVencimiento,idProducto FROM lote
				  WHERE  codigoLote = codigoLoteD;
				  
	-- INSERTA LA RECETA DUPLICADA --
	INSERT INTO receta (idReceta,codigo,nombre,batch,idEstado,fechaInicio,fechaFin,pesoPorTableta,pesoEnTableta,merma,reproceso,codigoLote)
	             SELECT nuevoIdRecetaD,codigoRecetaD AS codigo,CONCAT(nombre,'-','Duplicado')AS nombre, batch,idEstado,fechaInicio,fechaFin,pesoPorTableta,pesoEnTableta,merma,reproceso,rc AS codigoLote
				    FROM receta
				    WHERE idReceta = idRecetaD;
				    
	-- INSERTA LOS INSUMOS DE LA RECETA DUPLICADA --
	INSERT INTO recetamateria ( idMateria,idReceta,nombre,cantidad,precioUnitario,total)
	                    SELECT  rm.idMateria,nuevoIdRecetaD,rm.nombre,rm.cantidad,rm.precioUnitario,rm.total
	   					  FROM recetamateria rm INNER JOIN materia m ON m.idMateria=rm.idMateria                                                            
	   					  WHERE idReceta = idRecetaD;
	   					  
	-- INSERTA LOS MOVIMIENTOS DEL KARDEX DE INSUMOS --	   					  
	INSERT INTO movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				            SELECT  mm.idMateria,mm.ingreso,mm.salida,mm.observacion,codigoRecetaD AS codigoReceta,CURRENT_DATE() AS fecha,mm.idMovimiento 
								FROM movimientomateria mm INNER JOIN receta r ON r.codigo=mm.codigoReceta
							   WHERE mm.codigoReceta=r.codigo;

	-- INSERTA LA MANO DE OBRA DE LA RECETA DUPLICADA --
	INSERT INTO recetamanodeobra ( idReceta,idEmpleado,idMaquina,nombreEmpleado,nombreMaquina,tiempoHoras,precioUnitario,total)
	                    SELECT nuevoIdRecetaD,idEmpleado,idMaquina,nombreEmpleado,nombreMaquina,tiempoHoras,precioUnitario,total
	   					  FROM recetamanodeobra                                                         
	   					  WHERE idReceta = idRecetaD;
							  
	-- INSERTA LA DEPRECIACIÓN DE LA RECETA DUPLICADA --
	INSERT INTO recetadepreciacion (idReceta,idMaquina,nombreMaquina,depreciacionHora,tiempoHoras,depreciacionPorBatch)
	                    SELECT nuevoIdRecetaD,idMaquina,nombreMaquina,depreciacionHora,tiempoHoras,depreciacionPorBatch
	   					  FROM recetadepreciacion                                                          
	   					  WHERE idReceta = idRecetaD;		
							  
	-- INSERTA EL CONSUMO DE ENERGÍA DE LA RECETA DUPLICADA --
	INSERT INTO recetaconsumoenergia (idReceta,idMaquina,idTarifaEnergia,nombreMaquina,potenciaKw,horasTrabajoBatch,consumoKwh,tarifaKwh,pagoPorBatch)
	                    SELECT nuevoIdRecetaD,idMaquina,idTarifaEnergia,nombreMaquina,potenciaKw,horasTrabajoBatch,consumoKwh,tarifaKwh,pagoPorBatch
	   					  FROM recetaconsumoenergia                                                          
	   					  WHERE idReceta = idRecetaD;									  
							  
	-- INSERTA EL CONSUMO DE GAS DE LA RECETA DUPLICADA --
	INSERT INTO recetaconsumogas (idReceta,idMaquina,nombreMaquina,trabajoPorBatch,pesoBalonGas,tarifaGas,pagoPorBatch)
	                    SELECT nuevoIdRecetaD,idMaquina,nombreMaquina,trabajoPorBatch,pesoBalonGas,tarifaGas,pagoPorBatch
	   					  FROM recetaconsumogas                                                          
	   					  WHERE idReceta = idRecetaD;	
	   					  
   -- INSERTA EL COSTO DE VENTA DE LA RECETA DUPLICADA --
	INSERT INTO recetacostoventa (idReceta,idGastoAdmin,nombreCostoVenta,cantidad,precio,total)
	                    SELECT nuevoIdRecetaD,idGastoAdmin,nombreCostoVenta,cantidad,precio,total
	   					  FROM recetacostoventa                                                          
	   					  WHERE idReceta = idRecetaD;
		
	-- INSERTA EL COSTO DE MARKETING DE LA RECETA DUPLICADA --
	INSERT INTO recetacostomarketing (idReceta,idGastoAdmin,nombreCostoMarketing,cantidad,precio,total)
	                    SELECT nuevoIdRecetaD,idGastoAdmin,nombreCostoMarketing,cantidad,precio,total
	   					  FROM recetacostomarketing                                                        
	   					  WHERE idReceta = idRecetaD;
							  
	-- INSERTA EL COSTO OPERATIVO DE LA RECETA DUPLICADA --
	INSERT INTO recetacostooperativo (idReceta,idGastoAdmin,nombreCostoOperativo,cantidad,precio,total)
	                    SELECT nuevoIdRecetaD,idGastoAdmin,nombreCostoOperativo,cantidad,precio,total
	   					  FROM recetacostooperativo                                                        
	   					  WHERE idReceta = idRecetaD;							  	 					  
							  							  
	-- ACTUALIZA EL INVENTARIO CON ELIMINAR E INSERTAR--						   
	DELETE inventariomateria FROM inventariomateria
	                         INNER JOIN materia ON inventariomateria.idMateria=inventariomateria.idMateria 
					             WHERE inventariomateria.idMateria > 0;
								
	INSERT INTO inventariomateria (idInventarioMateria,stock,idMateria)		
	                       SELECT mm.idMateria AS idInventarioMateria,SUM(mm.ingreso) - SUM(mm.salida) AS stock,mm.idMateria FROM movimientomateria mm
                          INNER JOIN materia m ON m.idMateria=mm.idMateria
                          GROUP BY mm.idMateria;
	
END$$
DELIMITER ;