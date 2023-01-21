
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