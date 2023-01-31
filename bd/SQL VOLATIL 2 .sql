-- Procedimientos almacenados del Dashboard --
DROP procedure IF EXISTS `mostrar_productostop`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_productostop` ()
BEGIN
	 SELECT p.nombre,ip.stock 
	          FROM producto p left JOIN inventarioproducto ip ON p.idProducto=ip.idInventarioProducto
	                         INNER JOIN unidadmedida um ON p.idUnidadMedida=um.idUnidadMedida
									 ORDER BY ip.stock  DESC LIMIT 5; 
	 
END$$
DELIMITER ;


