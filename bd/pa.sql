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
                                        in cantidadI DECIMAL(10,3),
                                        in idTipoProductoI INT,
                                        in imagenI VARCHAR(50))
BEGIN
	insert into producto (codigo,nombre,descripcion,idUnidadMedida,cantidad,idTipoProducto,imagen)
				  values (codigoI,nombreI,descripcionI,idUnidadMedidaI,cantidadI,idTipoProductoI,imagenI);
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_producto`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_producto` (    in idProductoE VARCHAR(20),
                                        in nombreE VARCHAR(50),
                                        in descripcionE VARCHAR(100),
                                        in idUnidadMedidaE INT,
                                        in cantidadE DECIMAL(10,3),
                                        in idTipoProductoE INT,
                                        in imagenE VARCHAR(50))
BEGIN
	update producto set  idProducto=idProductoE,
                        nombre=nombreE,
                        descripcion=descripcionE,
                        idUnidadMedida=idUnidadMedidaE,
                        cantidad=cantidadE,
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
	select * from materia where idTipoMateria=1;
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
	insert into materia (codigo,nombre,descripcion,idUnidadMedida,idMarca,cantidad,precio,imagen,idTipoMateria)
				  values (codigoI,nombreI,descripcionI,idUnidadMedidaI,idMarcaI,cantidadI,precioI,imagenI,1);
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
END$$
DELIMITER;

-- Procedimientos almacenados de Materiales --

DROP procedure IF EXISTS `mostrar_materiales`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_materiales` ()
BEGIN
	select * from materia where idTipoMateria=2;
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
	insert into materia (codigo,nombre,descripcion,idUnidadMedida,idMarca,cantidad,precio,imagen,idTipoMateria)
				  values (codigoI,nombreI,descripcionI,idUnidadMedidaI,idMarcaI,cantidadI,precioI,imagenI,2);
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
                                        in potenciaI DECIMAL(10,2),
                                        in vidaUtilI INT)
BEGIN
	insert into maquina (codigo,nombre,descripcion,serie,modelo,marca,precio,añoCompra,capacidad,potencia,vidaUtil)
				 values (codigoI,nombreI,descripcionI,serieI,modeloI,marcaI,precioI,añoCompraI,capacidadI,potenciaI,vidaUtilI);
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
                                        in potenciaE DECIMAL(10,2),
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
                        potencia=potenciaE,
                        vidaUtil=vidaUtilE
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


