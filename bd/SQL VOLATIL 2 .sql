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
