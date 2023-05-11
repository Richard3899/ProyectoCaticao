use caticao;
-- Procedimientos almacenados de Usuarios Modulos --
DROP procedure IF EXISTS `mostrar_perfiles`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_perfiles` ()
BEGIN
	SELECT * FROM perfil;
END$$
DELIMITER ;

-- Procedimientos almacenados de Usuarios y Modulos --

DROP procedure IF EXISTS `mostrar_usuariosmodulos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_usuariosmodulos` ( in idUsuarioM INT)
BEGIN
	SELECT um.idUsuarioModulo,um.idUsuario,um.idModulo,m.descripcion from usuariomodulo um 
	              INNER JOIN modulo m on um.idModulo=m.idModulo
					  WHERE idUsuario=idUsuarioM;
END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_usuariosmodulos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_usuariosmodulos` (   in idUsuarioI INT,
                                                in idModuloI INT)
                                    
BEGIN
	insert into usuariomodulo (idUsuario,idModulo)
				  values (idUsuarioI,idModuloI);
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_usuariosmodulos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_usuariosmodulos` (in idUsuarioE int)
BEGIN
	 delete from usuariomodulo
    where idUsuario=idUsuarioE;
END$$
DELIMITER ;


-- Procedimientos almacenados de Usuarios y Permisos --

DROP procedure IF EXISTS `mostrar_usuariospermisos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_usuariospermisos` ( in idUsuarioM INT)
BEGIN
	SELECT * FROM usuariopermiso WHERE idUsuario=idUsuarioM;
END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_usuariospermisos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_usuariospermisos` (  in idUsuarioI INT,
                                                in insertarI INT,
																in editarI INT,
                                                in eliminarI INT)
                                    
BEGIN
	insert into usuariopermiso (idUsuario,insertar,editar,eliminar)
				  			  values (idUsuarioI,insertarI,editarI,eliminarI);
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_usuariospermisos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_usuariospermisos` (    in idUsuarioI INT,
                                                in insertarI INT,
																in editarI INT,
                                                in eliminarI INT)
BEGIN
	UPDATE usuariopermiso SET   insertar=insertarI,
			                      editar=editarI,
		                         eliminar=eliminarI
					       	 WHERE idUsuario=idUsuarioI;
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_usuariospermisos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_usuariospermisos` (in idUsuarioI INT)
BEGIN

	DELETE FROM usuariopermiso 
	WHERE idUsuario=idUsuarioI;
	
END$$
DELIMITER ;

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
CREATE PROCEDURE `insertar_usuario` (   in idUsuarioI INT,
													 in idPerfilI INT,
													 in nombreI VARCHAR(50),
                                        in usuarioI VARCHAR(50),
                                        in passwordI VARCHAR(100),
                                        in fotoI VARCHAR(100))
BEGIN
	insert into usuario (idUsuario,idPerfil,nombre,usuario,password,foto,estado)
				  values (idUsuarioI,idPerfilI,nombreI,usuarioI,passwordI,fotoI,1);		  
	
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_usuario`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_usuario` (     in idPerfilE INT,
                                        in nombreE VARCHAR(45),
                                        in usuarioE VARCHAR(45),
                                        in passwordE VARCHAR(100),
                                        in fotoE VARCHAR(100))
BEGIN
	update usuario SET   idPerfil=idPerfilE,
	                     nombre=nombreE,
                        usuario=usuarioE,
                        password=passwordE,
                        foto=fotoE
				where usuario=usuarioE;
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_usuario`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_usuario` (in idUsuarioE int)
BEGIN

	DELETE FROM usuario
   WHERE idUsuario=idUsuarioE;
   
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
CREATE PROCEDURE `insertar_producto` (  in idProductoI INT,
													 in codigoI VARCHAR(20),
                                        in nombreI VARCHAR(50),
                                        in descripcionI VARCHAR(100),
                                        in idUnidadMedidaI INT,
                                        in idTipoProductoI INT,
                                        in imagenI VARCHAR(50))
BEGIN

	insert into producto (idProducto,codigo,nombre,descripcion,idUnidadMedida,idTipoProducto,imagen)
				  values (idProductoI,codigoI,nombreI,descripcionI,idUnidadMedidaI,idTipoProductoI,imagenI);
				  
   insert into inventarioproducto (idProducto,stock)
				  VALUES (idProductoI,0);
				  
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
   delete from inventarioproducto
   where idProducto=idProductoE;
   
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
CREATE PROCEDURE `insertar_insumo` (    in idMateriaI INT,
													 in codigoI VARCHAR(20),
                                        in nombreI VARCHAR(50),
                                        in descripcionI VARCHAR(100),
                                        in idUnidadMedidaI INT,
                                        in idMarcaI INT,
                                        in cantidadI DECIMAL(10,3),
                                        in precioI DECIMAL(10,2),
                                        in imagenI VARCHAR(50))
BEGIN

	insert into materia (idMateria,codigo,nombre,descripcion,idUnidadMedida,idMarca,cantidad,precio,precioUnitario,imagen,idTipoMateria)
				  values (idMateriaI,codigoI,nombreI,descripcionI,idUnidadMedidaI,idMarcaI,cantidadI,precioI,precio/cantidad,imagenI,1);
				  
    insert into inventariomateria (idMateria,stock)
				  values (idMateriaI,0);
                     
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

    delete from inventariomateria
    where idMateria=idMateriaE;
    
	 delete from materia
    where idMateria=idMateriaE;

END$$
DELIMITER ;

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
CREATE PROCEDURE `insertar_material` (  in idMateriaI INT, 
													 in codigoI VARCHAR(20),
                                        in nombreI VARCHAR(50),
                                        in descripcionI VARCHAR(100),
                                        in idUnidadMedidaI INT,
                                        in idMarcaI INT,
                                        in cantidadI DECIMAL(10,2),
                                        in precioI DECIMAL(10,2),
                                        in imagenI VARCHAR(50))
BEGIN

    insert into materia (idMateria,codigo,nombre,descripcion,idUnidadMedida,idMarca,cantidad,precio,precioUnitario,imagen,idTipoMateria)
				  values (idMateriaI,codigoI,nombreI,descripcionI,idUnidadMedidaI,idMarcaI,cantidadI,precioI,precio/cantidad,imagenI,2);
	 
	 insert into inventariomateria (idMateria,stock)
				  values (idMateriaI,0);

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

DROP procedure IF EXISTS `mostrar_maquinascondepreciacion`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_maquinascondepreciacion` ()
BEGIN
	SELECT * from maquina WHERE añoCompra+vidaUtil>= year(NOW());
END$$
DELIMITER ;

DROP procedure IF EXISTS `insertar_maquina`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_maquina` (   in idMaquinaI INT,
													 in codigoI VARCHAR(20),
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

	INSERT INTO maquina (idMaquina,codigo,nombre,descripcion,serie,modelo,marca,precio,añoCompra,capacidad,potenciaHP,potenciaWatts,potenciaKw,vidaUtil,depreciacionAnual,depreciacionMensual,depreciacionHora)
				  values (idMaquinaI,codigoI,nombreI,descripcionI,serieI,modeloI,marcaI,precioI,añoCompraI,capacidadI,potenciaHPI,(potenciaHPI*745.7),((potenciaHPI*745.7)/1000),vidaUtilI,(precioI/vidaUtilI),(precioI/vidaUtilI)/12,((precioI/vidaUtilI)/12)/(25*24));
   
	INSERT INTO inventariomaquina (idMaquina,stock)
				  values (idMaquinaI,0);
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
	 delete from inventariomaquina
    where idMaquina=idMaquinaE;
    
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
                                        in fechaNacimientoI TEXT,
                                        in cargoI  VARCHAR(50),
                                        in horarioTrabajoI  VARCHAR(50),
                                        in horasPorDiaI INT,
                                        in sueldoPorDiaI DECIMAL(10,2),
                                        in sueldoPorMesI DECIMAL(10,2),
                                        in idTipoCostoI INT)
BEGIN
	insert into empleado (nombre,apellido,idUsuario,correo,idTipoDocumento,numeroDocumento,direccion,telefono,fechaNacimiento,cargo,horarioTrabajo,horasPorDia,sueldoPorDia,precioUnitario,sueldoPorMes,idTipoCosto)
				 values  (nombreI,apellidoI,idUsuarioI,correoI,idTipoDocumentoI,numeroDocumentoI,direccionI,telefonoI,STR_TO_DATE(REPLACE(fechaNacimientoI,'/','.') ,GET_FORMAT(date,'EUR')),cargoI,horarioTrabajoI,horasPorDiaI,sueldoPorDiaI,sueldoPorDiaI/horasPorDiaI,sueldoPorMesI,idTipoCostoI);
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
                                        in fechaNacimientoE TEXT,
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
                        fechaNacimiento=STR_TO_DATE(REPLACE(fechaNacimientoE,'/','.') ,GET_FORMAT(date,'EUR')),
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

-- Procedimientos almacenados de TipoGasto --

DROP procedure IF EXISTS `mostrar_tipogasto`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_tipogasto` ()
BEGIN
	select * from tipogasto;
END$$
DELIMITER ;


-- Procedimientos almacenados de GastoAdmin --
DROP procedure IF EXISTS `mostrar_gastoadmin`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_gastoadmin` ()
BEGIN
	select * from gastoadmin;
END$$
DELIMITER ;


DROP procedure IF EXISTS `mostrar_gastoadmin2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_gastoadmin2` ( IN idTipoGastoI INT)
BEGIN
	select * from gastoadmin WHERE idTipoGasto = idTipoGastoI;
END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_gastoadmin`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_gastoadmin` (in codigoI VARCHAR(20),
													 in descripcionI VARCHAR(100),
                                        in idUnidadMedidaI INT,
                                        in idTipoCostoI INT,
													 in idTipoGastoI INT)
BEGIN
	insert into gastoadmin (codigo,descripcion,idUnidadMedida,idTipoCosto,idTipoGasto)
				     values   (codigoI,descripcionI,idUnidadMedidaI,idTipoCostoI,idTipoGastoI);
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_gastoadmin`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_gastoadmin` (  in idGastoAdminE INT,
                                        in descripcionE VARCHAR(100),
                                        in idUnidadMedidaE INT,
                                        in idTipoCostoE INT,
													 in idTipoGastoE INT)
BEGIN
	update gastoadmin set   descripcion=descripcionE,
									idUnidadMedida=idUnidadMedidaE,
									idTipoCosto=idTipoCostoE,
									idTipoGasto=idTipoGastoE
				      WHERE    idGastoAdmin=idGastoAdminE;
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
	select * from gastoadmin where idTipoGasto=2;
END$$
DELIMITER ;

DROP procedure IF EXISTS `insertar_costoventa`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_costoventa` (in descripcionI VARCHAR(100),
                                        in idUnidadMedidaI INT,
                                        in idTipoCostoI INT)
BEGIN
	insert into gastoadmin (descripcion,idUnidadMedida,idTipoCosto,idTipoGasto)
				  values   (descripcionI,idUnidadMedidaI,idTipoCostoI,2);
END$$
DELIMITER ;

-- Procedimientos almacenados de Costo de Marketing --

DROP procedure IF EXISTS `mostrar_costomarketing`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_costomarketing` ()
BEGIN
	select * from gastoadmin where idTipoGasto=3;
END$$
DELIMITER ;

DROP procedure IF EXISTS `insertar_costomarketing`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_costomarketing` (in descripcionI VARCHAR(100),
                                        in idUnidadMedidaI INT,
                                        in idTipoCostoI INT)
BEGIN
	insert into gastoadmin (descripcion,idUnidadMedida,idTipoCosto,idTipoGasto)
				  values   (descripcionI,idUnidadMedidaI,idTipoCostoI,3);
END$$
DELIMITER ;


-- Procedimientos almacenados de Costo Operativo--

DROP procedure IF EXISTS `mostrar_costooperativo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_costooperativo` ()
BEGIN
	select * from gastoadmin where idTipoGasto=4;
END$$
DELIMITER ;

DROP procedure IF EXISTS `insertar_costooperativo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_costooperativo` (in descripcionI VARCHAR(100),
											in idUnidadMedidaI INT,
											in idTipoCostoI INT)
BEGIN
	insert into gastoadmin (descripcion,idUnidadMedida,idTipoCosto,idTipoGasto)
				  values   (descripcionI,idUnidadMedidaI,idTipoCostoI,4);
END$$
DELIMITER ;

-- Procedimientos almacenados de mostrar inventario de insumos --

DROP procedure IF EXISTS `mostrar_inventarioinsumos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_inventarioinsumos` ()
BEGIN
	 SELECT * FROM inventariomateria im 
             right join materia m on m.idMateria=im.idMateria
             where m.idTipoMateria=1
             order by im.stock ASC;
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

    UPDATE inventariomateria SET stock = stock + ingresoI,
                                 ultimoMovimiento=NOW()
						   WHERE idMateria=idMateriaI;
                           
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
     UPDATE inventariomateria SET stock = stock - salidaI,
     										ultimoMovimiento=NOW()
						   WHERE idMateria=idMateriaI;
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

    UPDATE inventariomateria SET stock = stock + ingresoI,
    										ultimoMovimiento=NOW()
						   WHERE idMateria=idMateriaI;
                           
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
     UPDATE inventariomateria SET stock = stock - salidaI,
     										 ultimoMovimiento=NOW()
						   WHERE idMateria=idMateriaI;
						   
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
                                                in idLoteI INT,
                                                in codigoLoteI varchar(50),
                                                in fechaProduccionI DATE,
                                                in fechaVencimientoI DATE,
                                                in fechaI DATE,
                                                in observacionI varchar(50))
BEGIN
	 
	 DECLARE validacionLote VARCHAR(20);
    DECLARE idDeLote INT;
    
    SELECT COUNT(codigoLote) FROM lote where codigoLote = codigoLoteI INTO validacionLote;
    SELECT idLote FROM lote where codigoLote = codigoLoteI INTO idDeLote;
    
    if validacionLote=0 then
   
    INSERT INTO lote(idLote,codigoLote,cantidad,idProducto)
             VALUES (idLoteI,codigoLoteI,0,idProductoI);
    
    else
    
    SET idLoteI=idDeLote;
    
    end if; 
    		   
    UPDATE lote SET cantidad = cantidad+ingresoI,
                    fechaProduccion=fechaProduccionI,
                    fechaVencimiento=fechaVencimientoI
					WHERE codigoLote=codigoLoteI;   
					
	 UPDATE inventarioproducto SET stock = stock + ingresoI,
	 										 ultimoMovimiento=NOW()
						           WHERE idProducto=idProductoI;              
                     
    insert into movimientoproducto (idLote,ingreso,salida,observacion,fecha,idMovimiento)
				                values (idLoteI,ingresoI,0,observacionI,fechaI,1);

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_salidaproducto`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_salidaproducto` (    in idProductoI INT,
																in idLoteI INT,
                                                in salidaI double(10,2),
                                                in observacionI varchar(50),
                                                in fechaI date)
BEGIN
     UPDATE inventarioproducto SET stock = stock - salidaI,
     										  ultimoMovimiento=NOW()
						   			 WHERE idProducto=idProductoI;
						   
     UPDATE lote SET cantidad = cantidad-salidaI
					  WHERE idLote=idLoteI; 
					                     
	  insert into movimientoproducto (idLote,ingreso,salida,observacion,fecha,idMovimiento)
				                 values (idLoteI,0,salidaI,observacionI,fechaI,2);
						
END$$
DELIMITER ;


-- Procedimientos almacenados de mostrar kardex de productos --
DROP procedure IF EXISTS `mostrar_kardexproductos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_kardexproductos` (in idProductoK int)
BEGIN
		Select p.idProducto,p.nombre,lt.codigoLote,mv.idMovimiento,mv.descripcion,mp.observacion,mp.fecha,mp.hora,
				mp.ingreso,mp.salida ,SUM(+ingreso-salida) 
				OVER(ORDER BY mp.hora ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
				AS saldo from movimientoproducto mp
				INNER JOIN lote lt ON lt.idLote=mp.idLote
				inner join producto p on p.idProducto=lt.idProducto
				inner join movimiento mv on mv.idMovimiento=mp.idMovimiento
				where p.idProducto=idProductoK;
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
CREATE PROCEDURE `insertar_ingresomaquina` (    in idMaquinaI INT,
                                                in ingresoI double(10,2),
                                                in observacionI varchar(50),
                                                in fechaI date)
BEGIN

    UPDATE inventariomaquina SET stock = stock + ingresoI,
    										ultimoMovimiento=NOW()
						   WHERE idMaquina=idMaquinaI;
                           
    insert into movimientomaquina (idMaquina,ingreso,salida,observacion,fecha,idMovimiento)
				           values (idMaquinaI,ingresoI,0,observacionI,fechaI,1);

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_salidamaquina`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_salidamaquina` (     in idMaquinaI INT,
                                                in salidaI double(10,2),
                                                in observacionI varchar(50),
                                                in fechaI date)
BEGIN
     UPDATE inventariomaquina SET stock = stock - salidaI,
     										 ultimoMovimiento=NOW()
						   WHERE idMaquina=idMaquinaI;
                           
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

DROP procedure IF EXISTS `mostrar_lotes2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_lotes2` (in idProductoM INT)
BEGIN
	SELECT idLote,codigoLote,fechaVencimiento,cantidad,idProducto,fechaProduccion from lote
	
	WHERE idProducto=idProductoM and cantidad > 0;
END$$
DELIMITER ;


-- Procedimientos almacenados para Actualizar el Inventario de Insumos y Materiales --

DROP procedure IF EXISTS `actualizar_inventariomateria`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `actualizar_inventariomateria` ()
BEGIN
	
		-- ACTUALIZA EL INVENTARIO CON ELIMINAR E INSERTAR--						   
	DELETE inventariomateria FROM inventariomateria
	                         INNER JOIN materia ON inventariomateria.idMateria=inventariomateria.idMateria 
					             WHERE inventariomateria.idMateria > 0;
								
	INSERT INTO inventariomateria (idInventarioMateria,stock,idMateria,ultimoMovimiento)		
	                       SELECT mm.idMateria AS idInventarioMateria,SUM(mm.ingreso) - SUM(mm.salida) AS stock,mm.idMateria, MAX(mm.hora) AS ultimoMovimiento FROM movimientomateria mm
                          INNER JOIN materia m ON m.idMateria=mm.idMateria
                          GROUP BY mm.idMateria;      
	
END$$
DELIMITER ;


-- Procedimientos almacenados de Recetas --

DROP procedure IF EXISTS `mostrar_recetas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetas` ()
BEGIN
	select * from receta ORDER BY idReceta desc;
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetascerradas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetascerradas` ()
BEGIN
	select * from receta  WHERE cerrado=1 ORDER BY idReceta desc;
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
                                        in fechaInicioI TEXT,
                                        in fechaFinI TEXT,
                                        in codigoLoteI VARCHAR(20),
                                        in fechaVencimientoI TEXT,
                                        in pesoPorTabletaI DECIMAL(10,2),
                                        in pesoEnTabletaI DECIMAL(10,2),
                                        in mermaI DECIMAL(10,2),
                                        in reprocesoI DECIMAL(10,2),
													 in cantidadTabletasI INT)
BEGIN

    insert into lote (codigoLote,fechaVencimiento,cantidad,idProducto)
			   values (codigoLoteI,STR_TO_DATE(REPLACE(fechaVencimientoI,'/','.') ,GET_FORMAT(date,'EUR')),0,idProductoI);
                
	insert into receta (codigo,nombre,batch,idEstado,fechaInicio,fechaFin,pesoPorTableta,pesoEnTableta,merma,reproceso,codigoLote,cerrado,cantidadTabletas,costoTotal,costoPorTableta)
			      values (codigoI,nombreI,batchI,idEstadoI,STR_TO_DATE(REPLACE(fechaInicioI,'/','.') ,GET_FORMAT(date,'EUR')),STR_TO_DATE(REPLACE(fechaFinI,'/','.') ,GET_FORMAT(date,'EUR')),pesoPorTabletaI,pesoEnTabletaI,mermaI,reprocesoI,codigoLoteI,0,cantidadTabletasI,0,0);
	
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
                                        in fechaInicioE TEXT,
                                        in fechaFinE TEXT,
                                        in codigoLoteE VARCHAR(20),
                                        in fechaVencimientoE TEXT,
                                        in pesoPorTabletaE DECIMAL(10,2),
                                        in pesoEnTabletaE DECIMAL(10,2),
                                        in mermaE DECIMAL(10,2),
                                        in reprocesoE DECIMAL(10,2),
													 in cantidadTabletasE INT)
BEGIN
	update lote  SET     codigoLote=codigoLoteE,
                        fechaVencimiento=STR_TO_DATE(REPLACE(fechaVencimientoE,'/','.') ,GET_FORMAT(date,'EUR')),
                        idProducto=idProductoE
			   WHERE       idLote=idLoteE;

	update receta SET    codigo=codigoE,
                        nombre=nombreE,
                        batch=batchE,
                        idEstado=idEstadoE,
                        fechaInicio=STR_TO_DATE(REPLACE(fechaInicioE,'/','.') ,GET_FORMAT(date,'EUR')),
                        fechaFin=STR_TO_DATE(REPLACE(fechaFinE,'/','.') ,GET_FORMAT(date,'EUR')),
                        codigoLote=codigoLoteE,
                        pesoPorTableta=pesoPorTabletaE,
                        pesoEnTableta=pesoEnTabletaE,
                        merma=mermaE,
                        reproceso=reprocesoE,
                        cantidadTabletas=cantidadTabletasE
				where idReceta=idRecetaE;
				
	CALL sumatotal_costoporreceta(idRecetaE);  			
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
    
    CALL actualizar_inventariomateria();
    
END$$
DELIMITER ;

DROP procedure IF EXISTS `cerrar_receta`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `cerrar_receta` (in idRecetaE INT,
											 in codigoLoteE VARCHAR(20),
											 in cantidadTabletasE DECIMAL(10,2),
											 in idEstadoE INT)
BEGIN

   DECLARE idProductoC INT;
   DECLARE idLoteC INT;
   DECLARE codigoRecetaC VARCHAR(20);
   DECLARE fechaFinalizado DATE;
   
   SELECT idProducto FROM lote
	WHERE codigoLote=codigoLoteE INTO idProductoC;
	
	SELECT idLote FROM lote
	WHERE codigoLote=codigoLoteE INTO idLoteC;
	
	SELECT codigo FROM receta
	WHERE idReceta=idRecetaE INTO codigoRecetaC;
	
	SELECT fechaFin FROM receta
	WHERE idReceta=idRecetaE INTO fechaFinalizado;
		            
   UPDATE receta set cerrado=1                
	WHERE idReceta=idRecetaE;
	
	UPDATE lote SET cantidad = cantidad + cantidadTabletasE,
	                fechaProduccion = fechaFinalizado
					WHERE codigoLote=codigoLoteE;   
					
	UPDATE inventarioproducto SET stock = stock + cantidadTabletasE,
											ultimoMovimiento=NOW()
						           WHERE idProducto=idProductoC;              
                     
   insert into movimientoproducto (idLote,ingreso,salida,observacion,fecha,idMovimiento)
				                values (idLoteC,cantidadTabletasE,0,CONCAT("Productos terminados : ",+codigoRecetaC),fechaFinalizado,1);
     
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
CREATE PROCEDURE `insertar_recetainsumo` (      in idRecetaI INT,
											    				in codigoRecetaI VARCHAR(20),
                                                in idMateriaI INT,
                                                in nombreI VARCHAR(50),
                                                in cantidadI DECIMAL(10,3),
                                                in precioUnitarioI DECIMAL(10,2),
																in totalI DECIMAL(10,2) )
BEGIN                      
    INSERT INTO movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				               VALUES (idMateriaI,0,cantidadI,"Agregado Receta:",codigoRecetaI,CURRENT_DATE(),2);

	 INSERT INTO recetamateria (idMateria,idReceta,nombre,cantidad,precioUnitario,total)
			              VALUES (idMateriaI,idRecetaI,nombreI,cantidadI,precioUnitarioI,totalI);
			              
	 CALL actualizar_inventariomateria();          
	   
	 CALL sumatotal_costoporreceta(idRecetaI);
	 
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_recetainsumo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetainsumo` (        in idRecetaMateriaE INT,
																in idRecetaE INT,
																in codigoRecetaE VARCHAR(20),
                                                in idMateriaE INT,
                                                in nombreE VARCHAR(50),
                                                in cantidadE DECIMAL(10,3),
                                                in precioUnitarioE DECIMAL(10,2),
																in totalE DECIMAL(10,2))
BEGIN

	DELETE from recetamateria WHERE idRecetaMateria=idRecetaMateriaE;

	DELETE FROM movimientomateria WHERE idMateria=idMateriaE AND codigoReceta=codigoRecetaE;
   				                                 
   INSERT INTO movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				              VALUES (idMateriaE,0,cantidadE,"Agregado Receta:",codigoRecetaE,CURRENT_DATE(),2);

	INSERT INTO recetamateria (idRecetaMateria,idMateria,idReceta,nombre,cantidad,precioUnitario,total)
			             VALUES (idRecetaMateriaE,idMateriaE,idRecetaE,nombreE,cantidadE,precioUnitarioE,totalE);

   CALL actualizar_inventariomateria();    
   
	CALL sumatotal_costoporreceta(idRecetaE);
	
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_recetainsumo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetainsumo` ( in idRecetaMateriaE INT,
														 in idRecetaE INT,
														 in codigoRecetaE VARCHAR(20),
										             in idMateriaE int)
BEGIN
    	   
   DELETE from recetamateria WHERE idRecetaMateria=idRecetaMateriaE;
   
   DELETE movimientomateria FROM movimientomateria
	                         INNER JOIN materia ON movimientomateria.idMateria=movimientomateria.idMateria 
					             WHERE movimientomateria.idMateria=idMateriaE  AND movimientomateria.codigoReceta=codigoRecetaE;
					             
	CALL actualizar_inventariomateria();  
						         
	CALL sumatotal_costoporreceta(idRecetaE);
					
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetainsumo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetainsumo` (in idRecetaC INT)
BEGIN
      SELECT if(SUM(total) IS NULL, 0, SUM(total)) FROM recetamateria rm INNER JOIN materia m ON m.idMateria=rm.idMateria
		                                             WHERE rm.idReceta=idRecetaC AND m.idTipoMateria=1;
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
                                                in cantidadI DECIMAL(10,2),
                                                in precioUnitarioI DECIMAL(10,2),
												            in totalI DECIMAL(10,2) )
BEGIN
                    
    INSERT INTO movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				               VALUES (idMateriaI,0,cantidadI,"Agregado Receta:",codigoRecetaI,CURRENT_DATE(),2);

	 INSERT INTO recetamateria (idMateria,idReceta,nombre,cantidad,precioUnitario,total)
			              VALUES (idMateriaI,idRecetaI,nombreI,cantidadI,precioUnitarioI,totalI);
			              
   CALL actualizar_inventariomateria();
   
	CALL sumatotal_costoporreceta(idRecetaI);	
	
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
                                                in cantidadE DECIMAL(10,2),
                                                in precioUnitarioE DECIMAL(10,2),
												            in totalE DECIMAL(10,2))
BEGIN
 	   
   DELETE from recetamateria WHERE idRecetaMateria=idRecetaMateriaE;
   
   DELETE FROM movimientomateria WHERE idMateria=idMateriaE AND codigoReceta=codigoRecetaE;
                            
   INSERT INTO movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				              VALUES (idMateriaE,0,cantidade,"Agregado Receta:",codigoRecetaE,CURRENT_DATE(),2);

	INSERT INTO recetamateria (idRecetaMateria,idMateria,idReceta,nombre,cantidad,precioUnitario,total)
			             VALUES (idRecetaMateriaE,idMateriaE,idRecetaE,nombreE,cantidadE,precioUnitarioE,totalE);
			             		             
	CALL actualizar_inventariomateria();  
								  			             	             
	CALL sumatotal_costoporreceta(idRecetaE);		
		             
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_recetamaterial`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetamaterial` (in idRecetaMateriaE INT,
														  in idRecetaE INT,
														  in codigoRecetaE VARCHAR(20),
										              in idMateriaE INT)
BEGIN

   DELETE from recetamateria WHERE idRecetaMateria=idRecetaMateriaE;
   
   DELETE movimientomateria FROM movimientomateria
	                         INNER JOIN materia ON movimientomateria.idMateria=movimientomateria.idMateria 
					             WHERE movimientomateria.idMateria=idMateriaE  AND movimientomateria.codigoReceta=codigoRecetaE;
					             
	CALL actualizar_inventariomateria();  
	
   CALL sumatotal_costoporreceta(idRecetaE);
						
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetamaterial`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetamaterial` (in idRecetaC INT)
BEGIN
			SELECT if(SUM(total) IS NULL, 0, SUM(total)) FROM recetamateria rm INNER JOIN materia m ON m.idMateria=rm.idMateria
		                                                WHERE rm.idReceta=idRecetaC AND m.idTipoMateria=2;
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
	 select rm.idRecetaManodeObra,rm.idReceta,rm.idEmpleado,rm.nombreEmpleado,rm.idMaquina,rm.nombreMaquina, rm.tiempoHoras,rm.precioUnitario,rm.total from recetamanodeobra rm
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
                                                in tiempoHorasI DECIMAL(10,2),
                                                in precioUnitarioI DECIMAL(10,2),
												            in totalI DECIMAL(10,2) )
BEGIN

	 INSERT INTO recetamanodeobra(idReceta,idEmpleado,idMaquina,nombreEmpleado,nombreMaquina,tiempoHoras,precioUnitario,total)
			              VALUES (idRecetaI,idEmpleadoI,idMaquinaI,nombreEmpleadoI,nombreMaquinaI,tiempoHorasI,precioUnitarioI,totalI);
	 
	 CALL sumatotal_costoporreceta(idRecetaI);
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetamanodeobra`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetamanodeobra` (    in idRecetaManodeObraE INT,
																in idRecetaE INT,
                                                in tiempoHorasE DECIMAL(10,2),
												            in totalE DECIMAL(10,2))
BEGIN

   UPDATE recetamanodeobra SET tiempoHoras = tiempoHorasE,
                               total=totalE
						         WHERE idRecetaManodeObra=idRecetaManodeObraE;
   
	CALL sumatotal_costoporreceta(idRecetaE);                         
END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetamanodeobra`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetamanodeobra` (in idRecetaManodeObraE INT,
															 in idRecetaE INT)
BEGIN
    	   
   DELETE from recetamanodeobra WHERE idRecetaManodeObra=idRecetaManodeObraE;
	
	CALL sumatotal_costoporreceta(idRecetaE);					
END$$
DELIMITER ;



DROP procedure IF EXISTS `sumatotal_recetamanodeobra`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetamanodeobra` (in idRecetaC INT)
BEGIN
			SELECT if(SUM(total) IS NULL, 0, SUM(total)) FROM recetamanodeobra rm 
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
	                                                in tiempoHorasI DECIMAL(10,2),
	                                                in depreciacionHoraI DECIMAL(10,2),
													            in depreciacionPorBatchI DECIMAL(10,2) )
BEGIN

	 INSERT INTO recetadepreciacion(idReceta,idMaquina,nombreMaquina,tiempoHoras,depreciacionHora,depreciacionPorBatch)
			                 VALUES (idRecetaI,idMaquinaI,nombreMaquinaI,tiempoHorasI,depreciacionHoraI,depreciacionPorBatchI);
			                 
	CALL sumatotal_costoporreceta(idRecetaI);
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetadepreciacion`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetadepreciacion` (  in idRecetaDepreciacionE INT,
																in idRecetaE INT,
                                                in tiempoHorasE DECIMAL(10,2),
												            in depreciacionPorBatchE DECIMAL(10,2))
BEGIN

   UPDATE recetadepreciacion SET tiempoHoras = tiempoHorasE,
                               depreciacionPorBatch=depreciacionPorBatchE
						         WHERE idRecetaDepreciacion=idRecetaDepreciacionE;
						         
	CALL sumatotal_costoporreceta(idRecetaE);                            
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_recetadepreciacion`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetadepreciacion` (in idRecetaDepreciacionE INT,in idRecetaE INT)
BEGIN
    	   
   DELETE from recetadepreciacion WHERE idRecetaDepreciacion=idRecetaDepreciacionE;
   
	CALL sumatotal_costoporreceta(idRecetaE); 					
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetadepreciacion`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetadepreciacion` (in idRecetaC INT)
BEGIN
			SELECT if(SUM(depreciacionPorBatch) IS NULL, 0, SUM(depreciacionPorBatch)) FROM recetadepreciacion
		                     WHERE idReceta=idRecetaC;
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
		                                                in potenciaKwI DECIMAL(10,2),
		                                                in horasTrabajoBatchI DECIMAL(10,2),
		                                                in consumoKwhI DECIMAL(10,2),
		                                                in tarifaKwhI DECIMAL(10,2),
		                                                in pagoPorBatchI DECIMAL(10,2))
BEGIN

	 INSERT INTO recetaconsumoenergia(idReceta,idMaquina,nombreMaquina,potenciaKw,horasTrabajoBatch,consumoKwh,idTarifaEnergia,tarifaKwh,pagoPorBatch)
			                 VALUES (idRecetaI,idMaquinaI,nombreMaquinaI,potenciaKwI,horasTrabajoBatchI,consumoKwhI,1,tarifaKwhI,pagoPorBatchI);
			                 
	 CALL sumatotal_costoporreceta(idRecetaI);
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetaconsumoenergia`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetaconsumoenergia` (  in idRecetaConsumoEnergiaE INT,
																  in idRecetaE INT,
																  in horasTrabajoBatchE DECIMAL(10,2),	
                                                  in consumoKwhE DECIMAL(10,2),
												              in pagoPorBatchE DECIMAL(10,2))
BEGIN

   UPDATE recetaconsumoenergia SET horasTrabajoBatch = horasTrabajoBatchE,
                                   consumoKwh=consumoKwhE,
                                   pagoPorBatch = pagoPorBatchE
						         WHERE idRecetaConsumoEnergia=idRecetaConsumoEnergiaE;
						         
   CALL sumatotal_costoporreceta(idRecetaE);                         
END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetaconsumoenergia`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetaconsumoenergia` (in idRecetaConsumoEnergiaE INT,in idRecetaE INT)
BEGIN
    	   
   DELETE from recetaconsumoenergia WHERE idRecetaConsumoEnergia=idRecetaConsumoEnergiaE;
   
	CALL sumatotal_costoporreceta(idRecetaE);  		
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetaconsumoenergia`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetaconsumoenergia` (in idRecetaC INT)
BEGIN
			SELECT if(SUM(pagoPorBatch) IS NULL, 0, SUM(pagoPorBatch)) FROM recetaconsumoenergia 
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
			                 
	 CALL sumatotal_costoporreceta(idRecetaI);
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_recetaconsumogas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetaconsumogas` (  in idRecetaConsumoGasE INT,
															 in idRecetaE INT,
                                              in trabajoPorBatchE DECIMAL(10,2),
	                                           in pesoBalonGasE DECIMAL(10,2),
													       in tarifaGasE DECIMAL(10,2))
BEGIN

   UPDATE recetaconsumogas SET trabajoPorBatch = trabajoPorBatchE,
                               pesoBalonGas=pesoBalonGasE,
                               tarifaGas=tarifaGasE,
                               pagoPorBatch=pesoBalonGasE*tarifaGasE
						         WHERE idRecetaConsumoGas=idRecetaConsumoGasE;
						         
   CALL sumatotal_costoporreceta(idRecetaE);                        
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_recetaconsumogas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetaconsumogas` (in idRecetaConsumoGasE INT,in idRecetaE INT)
BEGIN
    	   
   DELETE from recetaconsumogas WHERE idRecetaConsumoGas=idRecetaConsumoGasE;
   
	CALL sumatotal_costoporreceta(idRecetaE); 						
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetaconsumogas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetaconsumogas` (in idRecetaC INT)
BEGIN
			SELECT if(SUM(pagoPorBatch) IS NULL, 0, SUM(pagoPorBatch)) FROM recetaconsumogas
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
	                                                in cantidadI DECIMAL(10,2),
	                                                in precioI DECIMAL(10,2),
													            in totalI DECIMAL(10,2) )
BEGIN

	 INSERT INTO recetacostoventa(idReceta,idGastoAdmin,nombreCostoVenta,cantidad,precio,total)
			                 VALUES (idRecetaI,idCostoVentaI,nombreCostoVentaI,cantidadI,precioI,totalI);
			                 
	 CALL sumatotal_costoporreceta(idRecetaI);
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetacostoventa`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetacostoventa` (    in idRecetaCostoVentaE INT,
															   in idRecetaE INT,
                                                in cantidadE DECIMAL(10,2),
												            in totalE DECIMAL(10,2))
BEGIN

   UPDATE recetacostoventa SET cantidad = cantidadE,
                               total=totalE
						         WHERE idRecetaCostoVenta=idRecetaCostoVentaE;
						         
   CALL sumatotal_costoporreceta(idRecetaE);                         
END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetacostoventa`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetacostoventa` (in idRecetaCostoVentaE INT,in idRecetaE INT)
BEGIN
    	   
   DELETE from recetacostoventa WHERE idRecetaCostoVenta=idRecetaCostoVentaE;
   
	CALL sumatotal_costoporreceta(idRecetaE);    					
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetacostoventa`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetacostoventa` (in idRecetaC INT)
BEGIN
			SELECT if(SUM(total) IS NULL, 0, SUM(total)) FROM recetacostoventa
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
	                                                in cantidadI DECIMAL(10,2),
	                                                in precioI DECIMAL(10,2),
													            in totalI DECIMAL(10,2) )
BEGIN

	 INSERT INTO recetacostomarketing(idReceta,idGastoAdmin,nombreCostoMarketing,cantidad,precio,total)
			                 VALUES (idRecetaI,idCostoMarketingI,nombreCostoMarketingI,cantidadI,precioI,totalI);
			                 
	 CALL sumatotal_costoporreceta(idRecetaI);
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetacostomarketing`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetacostomarketing` (    in idRecetaCostoMarketingE INT,
																    in idRecetaE INT,
                                                    in cantidadE DECIMAL(10,2),
												                in totalE DECIMAL(10,2))
BEGIN

   UPDATE recetacostomarketing SET cantidad = cantidadE,
                               total=totalE
						         WHERE idRecetaCostoMarketing=idRecetaCostoMarketingE;
						         
   CALL sumatotal_costoporreceta(idRecetaE);                        
END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetacostomarketing`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetacostomarketing` (in idRecetaCostoMarketingE INT,in idRecetaE INT)
BEGIN
    	   
   DELETE from recetacostomarketing WHERE idRecetaCostoMarketing=idRecetaCostoMarketingE;
   
	CALL sumatotal_costoporreceta(idRecetaE); 				
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetacostomarketing`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetacostomarketing` (in idRecetaC INT)
BEGIN
			SELECT if(SUM(total) IS NULL, 0, SUM(total))  FROM recetacostomarketing
		                     WHERE idReceta=idRecetaC;
END$$
DELIMITER ;


-- Procedimientos almacenados de Receta Costo Operativo--

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
CREATE PROCEDURE `insertar_recetacostooperativo` ( in idRecetaI INT,
	                                                in idCostoOperativoI INT,
	                                                in nombreCostoOperativoI VARCHAR(50),
	                                                in cantidadI DECIMAL(10,2),
	                                                in precioI DECIMAL(10,2),
													            in totalI DECIMAL(10,2) )
BEGIN

	 INSERT INTO recetacostooperativo(idReceta,idGastoAdmin,nombreCostoOperativo,cantidad,precio,total)
			                 VALUES (idRecetaI,idCostoOperativoI,nombreCostoOperativoI,cantidadI,precioI,totalI);
			                 
	 CALL sumatotal_costoporreceta(idRecetaI);
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_recetacostooperativo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetacostooperativo` (    in idRecetaCostoOperativoE INT,
																	 in idRecetaE INT,
                                                    in cantidadE DECIMAL(10,2),
												                in totalE DECIMAL(10,2))
BEGIN

   UPDATE recetacostooperativo SET cantidad = cantidadE,
                               total=totalE
						         WHERE idRecetaCostoOperativo=idRecetaCostoOperativoE;
						         
   CALL sumatotal_costoporreceta(idRecetaE);                         
END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_recetacostooperativo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_recetacostooperativo` (in idRecetaCostoOperativoE INT,in idRecetaE INT)
BEGIN
    	   
   DELETE from recetacostooperativo WHERE idRecetaCostoOperativo=idRecetaCostoOperativoE;
   
	CALL sumatotal_costoporreceta(idRecetaE); 					
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_recetacostooperativo`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetacostooperativo` (in idRecetaC INT)
BEGIN
			SELECT if(SUM(total) IS NULL, 0, SUM(total)) FROM recetacostooperativo
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
	DECLARE codigoRecetaA VARCHAR(20);
	
	SELECT codigo FROM receta WHERE idReceta=idRecetaD INTO codigoRecetaA;
	 
	SET rc=ROUND(((RAND() * (99999 - 11111)) + 11111));
	
	-- INSERTA EL LOTE DE LA RECETA DUPLICADA --
	INSERT INTO lote (codigoLote,fechaVencimiento,cantidad,idProducto)
				  				SELECT rc,fechaVencimiento,0,idProducto FROM lote
				  				WHERE  codigoLote = codigoLoteD;
				  
	-- INSERTA LA RECETA DUPLICADA --
	INSERT INTO receta (idReceta,codigo,nombre,batch,idEstado,fechaInicio,fechaFin,pesoPorTableta,pesoEnTableta,merma,reproceso,codigoLote,cerrado,cantidadTabletas,costoTotal,costoPorTableta)
	             			SELECT nuevoIdRecetaD,codigoRecetaD AS codigo,CONCAT(nombre,'-','Duplicado')AS nombre, batch,1,fechaInicio,fechaFin,pesoPorTableta,pesoEnTableta,merma,reproceso,rc AS codigoLote,0,cantidadTabletas,costoTotal,costoPorTableta
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
							   WHERE mm.codigoReceta=codigoRecetaA;

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
							  
	CALL actualizar_inventariomateria();						  							  	 					  
							  										
END$$
DELIMITER ;


-- Procedimientos almacenados Costo de Recetas y Gasto Administrativo --

DROP procedure IF EXISTS `mostrar_costorecetasgastoadmin`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_costorecetasgastoadmin` ()
BEGIN
	SELECT idCostoRecetasGastoAdmin,descripcion, DATE_FORMAT(mes,'%m - %Y') AS mesV, mes AS mes from costorecetasgastoadmin;
END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_costorecetasgastoadmin`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_costorecetasgastoadmin` (IN descripcionI VARCHAR(45), IN mesI DATE)
BEGIN
	INSERT INTO costorecetasgastoadmin (descripcion,mes)
				                   VALUES (descripcionI,mesI);
END$$
DELIMITER ;

DROP procedure IF EXISTS `editar_costorecetasgastoadmin`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_costorecetasgastoadmin` (IN idCostoRecetasGastoAdminI INT ,IN descripcionI VARCHAR(45))
BEGIN
	UPDATE costorecetasgastoadmin SET descripcion=descripcionI
	
				                   WHERE idCostoRecetasGastoAdmin=idCostoRecetasGastoAdminI;
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_costorecetasgastoadmin`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_costorecetasgastoadmin` (in idCostoRecetasGastoAdminE int)
BEGIN
   DELETE FROM gastoadminpormes 
   WHERE idCostoRecetasGastoAdmin=idCostoRecetasGastoAdminE;
   
   DELETE FROM costorecetasgastoadmin
   WHERE idCostoRecetasGastoAdmin=idCostoRecetasGastoAdminE;
END$$
DELIMITER ;

-- Procedimientos almacenados de Gasto Administrativo por Mes-

DROP procedure IF EXISTS `mostrar_gastoadminpormes1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_gastoadminpormes1` (in idGastoAdminPorMesC INT)
BEGIN

	 SELECT * FROM gastoadminpormes
    where idGastoAdminPorMes=idGastoAdminPorMesC;
    
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_gastoadminpormes2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_gastoadminpormes2` (in idCostoRecetasGastoAdminC INT)
BEGIN

	 SELECT * FROM gastoadminpormes
    WHERE idCostoRecetasGastoAdmin=idCostoRecetasGastoAdminC;

END$$
DELIMITER ;


DROP procedure IF EXISTS `insertar_gastoadminpormes`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_gastoadminpormes` (     in idCostoRecetasGastoAdminI INT,
	                                                in idGastoAdminI INT,
	                                                in nombreGastoAdminI VARCHAR(50),
	                                                in cantidadI DECIMAL(10,2),
	                                                in precioI DECIMAL(10,2),
													            in totalI DECIMAL(10,2) )
BEGIN

	 INSERT INTO gastoadminpormes(idCostoRecetasGastoAdmin,idGastoAdmin,nombreGastoAdmin,cantidad,precio,total)
			                 VALUES (idCostoRecetasGastoAdminI,idGastoAdminI,nombreGastoAdminI,cantidadI,precioI,totalI);
	
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_gastoadminpormes`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_gastoadminpormes` (    in idGastoAdminPorMesE INT,
                                                in cantidadE DECIMAL(10,2),
                                                IN precioE DECIMAL(10,2),
												            in totalE DECIMAL(10,2))
BEGIN

   UPDATE gastoadminpormes SET cantidad = cantidadE,
   									 precio = precioE,
                               total=totalE
						         WHERE idGastoAdminPorMes=idGastoAdminPorMesE;
                            
END$$
DELIMITER ;


DROP procedure IF EXISTS `eliminar_gastoadminpormes`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_gastoadminpormes` (in idGastoAdminPorMesE INT)
BEGIN
    	   
   DELETE from gastoadminpormes WHERE idGastoAdminPorMes=idGastoAdminPorMesE;
					
END$$
DELIMITER ;


DROP procedure IF EXISTS `sumatotal_gastoadminpormes`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_gastoadminpormes` (in idCostoRecetasGastoAdminC INT)
BEGIN
			SELECT if(SUM(total) IS NULL, 0, SUM(total)) FROM gastoadminpormes
		                     WHERE idCostoRecetasGastoAdmin=idCostoRecetasGastoAdminC;
END$$
DELIMITER ;

-- Procedimientos almacenados Costo total por receta-
DROP procedure IF EXISTS `sumatotal_costoporreceta`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_costoporreceta` (IN idRecetaT INT)
BEGIN
	-- Declaramos las variables-
	DECLARE totalinsumos DECIMAL(10,2);
	DECLARE totalmanodeobra DECIMAL(10,2);
	DECLARE totaldepreciacion DECIMAL(10,2);
	DECLARE totalconsumoenergia DECIMAL(10,2);
	DECLARE totalconsumogas DECIMAL(10,2);
	DECLARE totalcostoventa DECIMAL(10,2);
	DECLARE totalcostomarketing DECIMAL(10,2);
	DECLARE totalcostooperativo DECIMAL(10,2);
	DECLARE totalreceta DECIMAL(10,2);
	DECLARE cantidadTableta INT;
	DECLARE totalportableta DECIMAL(10,2);
	
  -- Calculamos los totales-
	SELECT if(SUM(total) IS NULL, 0, SUM(total)) FROM recetamateria
		            WHERE idReceta=idRecetaT INTO totalinsumos;
		                     
	SELECT if(SUM(total) IS NULL, 0, SUM(total)) FROM recetamanodeobra
		            WHERE idReceta=idRecetaT  INTO totalmanodeobra;
		            
   SELECT if(SUM(depreciacionPorBatch) IS NULL, 0, SUM(depreciacionPorBatch)) FROM recetadepreciacion
		            WHERE idReceta=idRecetaT  INTO totaldepreciacion;
		            
	SELECT if(SUM(pagoPorBatch) IS NULL, 0, SUM(pagoPorBatch))  FROM recetaconsumoenergia
		            WHERE idReceta=idRecetaT  INTO totalconsumoenergia;
		            
	SELECT if(SUM(pagoPorBatch) IS NULL, 0, SUM(pagoPorBatch))  FROM recetaconsumogas
		            WHERE idReceta=idRecetaT  INTO totalconsumogas;
		                     
	SELECT if(SUM(total) IS NULL, 0, SUM(total)) FROM recetacostoventa
		            WHERE idReceta=idRecetaT INTO totalcostoventa;
		            
   SELECT if(SUM(total) IS NULL, 0, SUM(total)) FROM recetacostomarketing
		            WHERE idReceta=idRecetaT  INTO totalcostomarketing;
		            
	SELECT if(SUM(total) IS NULL, 0, SUM(total)) FROM recetacostooperativo
		            WHERE idReceta=idRecetaT  INTO totalcostooperativo;
	
	SELECT cantidadTabletas FROM receta WHERE idReceta=idRecetaT INTO cantidadTableta;
			
	SET totalreceta = totalinsumos + totalmanodeobra + totaldepreciacion + totalconsumoenergia + totalconsumogas + totalcostoventa + totalcostomarketing + totalcostooperativo;
   
	SET totalportableta = totalreceta / cantidadTableta;

   UPDATE receta SET costototal = totalreceta,
                     costoPorTableta=totalportableta
						WHERE idReceta=idRecetaT;
             
END$$
DELIMITER ;


-- Procedimientos almacenados Costo total de las recetas por mes-
DROP procedure IF EXISTS `sumatotal_costototalpormes`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_costototalpormes` (IN mes DATE)
BEGIN
	-- Declaramos las variables-
	DECLARE totalreceta DECIMAL(10,2);
	DECLARE cantidadTableta DECIMAL(10,2);
	
  -- Calculamos los totales-
	SELECT if(SUM(costoTotal) IS NULL, 0, SUM(costoTotal)) FROM receta 
	WHERE MONTH(fechaFin) = MONTH(mes) AND YEAR(fechaFin) = YEAR(mes) INTO totalreceta;
	
	SELECT if(SUM(cantidadTabletas) IS NULL, 0, SUM(cantidadTabletas)) FROM receta 
	WHERE MONTH(fechaFin) = MONTH(mes) AND YEAR(fechaFin) = YEAR(mes) INTO cantidadTableta;

	-- sumamos los totales-
	SELECT totalreceta,cantidadTableta;
		                     
END$$
DELIMITER ;


-- Procedimientos almacenados de Reportes --
DROP procedure IF EXISTS `mostrar_reporteinsumos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_reporteinsumos` ()
BEGIN
	 SELECT m.codigo,m.nombre,m.descripcion,mr.descripcion AS marca,um.descripcion AS unidadMedida,m.precioUnitario,im.stock 
	          FROM materia m INNER JOIN inventariomateria im ON m.idMateria=im.idMateria
	                         INNER JOIN unidadmedida um ON m.idUnidadMedida=um.idUnidadMedida
	                         INNER JOIN marca mr ON m.idMarca=mr.idMarca
	                         WHERE m.idTipoMateria=1
									 ORDER BY m.nombre ASC;
	 
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_reportemateriales`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_reportemateriales` ()
BEGIN
	 SELECT m.codigo,m.nombre,m.descripcion,mr.descripcion AS marca,um.descripcion AS unidadMedida,m.precioUnitario,im.stock 
	          FROM materia m INNER JOIN inventariomateria im ON m.idMateria=im.idMateria
	                         INNER JOIN unidadmedida um ON m.idUnidadMedida=um.idUnidadMedida
	                         INNER JOIN marca mr ON m.idMarca=mr.idMarca
	                         WHERE m.idTipoMateria=2
									 ORDER BY m.nombre ASC;
	 
END$$
DELIMITER ;


DROP procedure IF EXISTS `mostrar_reporteproductos`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_reporteproductos` ()
BEGIN
	 SELECT p.codigo,p.nombre,p.descripcion,um.descripcion AS unidadMedida,ip.stock 
	          FROM producto p left JOIN inventarioproducto ip ON p.idProducto=ip.idProducto
	                         INNER JOIN unidadmedida um ON p.idUnidadMedida=um.idUnidadMedida
									 ORDER BY p.nombre ASC;
	 
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_reporterecetas`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_reporterecetas` ()
BEGIN
	 SELECT r.codigo,r.nombre,p.nombre AS nombreProducto,r.cantidadTabletas,l.codigoLote,l.fechaVencimiento,r.costoTotal,r.costoPorTableta 
	                                   FROM receta r INNER JOIN lote l on l.codigoLote=r.codigoLote
	                                         			 INNER JOIN producto p ON p.idProducto=l.idProducto
	                                         			 WHERE r.idEstado=3
									 								 ORDER BY r.codigo ASC;
	 
END$$
DELIMITER ;

-- Procedimientos almacenados del Dashboard --
DROP procedure IF EXISTS `mostrar_insumostop`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_insumostop` ()
BEGIN
	 SELECT m.nombre,im.stock 
	          FROM materia m left JOIN inventariomateria im ON m.idMateria=im.idInventarioMateria
	                         WHERE m.idTipoMateria = 1
									 ORDER BY im.stock  DESC LIMIT 5; 
	 
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_materialestop`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_materialestop` ()
BEGIN
	 SELECT m.nombre,im.stock 
	          FROM materia m left JOIN inventariomateria im ON m.idMateria=im.idInventarioMateria
	                         WHERE m.idTipoMateria = 2
									 ORDER BY im.stock  DESC LIMIT 5; 
	 
END$$
DELIMITER ;


DROP procedure IF EXISTS `mostrar_productostop`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_productostop` ()
BEGIN
	 SELECT p.nombre,ip.stock 
	          FROM producto p LEFT JOIN inventarioproducto ip ON p.idProducto=ip.idInventarioProducto
									 ORDER BY ip.stock  DESC LIMIT 5; 
	 
END$$
DELIMITER ;


DROP procedure IF EXISTS `mostrar_cantidadrecetasestados`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_cantidadrecetasestados` ()
BEGIN
	 DECLARE totalrecetasestado1 INT;
	 DECLARE totalrecetasestado2 INT;
	 DECLARE totalrecetasestado3 INT;
	 
	 SELECT COUNT(idReceta) AS cantidad  FROM receta WHERE idEstado=1 INTO totalrecetasestado1; 
	 SELECT COUNT(idReceta) AS cantidad  FROM receta WHERE idEstado=2 INTO totalrecetasestado2; 
	 SELECT COUNT(idReceta) AS cantidad  FROM receta WHERE idEstado=3 INTO totalrecetasestado3; 
	 
	 SELECT totalrecetasestado1,totalrecetasestado2,totalrecetasestado3;
	 
END$$
DELIMITER ;

-- Procedimientos almacenados para el Backup --

DROP procedure IF EXISTS `mostrar_ordertable`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_ordertable` ()
BEGIN

select descripcion from ordertable;
	 
END$$
DELIMITER ;
gastoadmin