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