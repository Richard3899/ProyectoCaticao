-- Procedimientos almacenados de Receta ManodeObrales --

DROP procedure IF EXISTS `mostrar_recetamanodeobra1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetamanodeobra1` (in idRecetaManodeObraC INT)
BEGIN
	 select rm.idRecetaManodeObra,rm.idReceta,rm.idEmpleado,rm.nombreEmpleado,rm.idMaquina,rm.nombreMaquina, rm.cantidad,rm.precioUnitario,rm.total from recetamanodeobra rm
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
	 select rm.idRecetaManodeObra,rm.idReceta,rm.idEmpleado,rm.nombreEmpleado, rm.nombreMaquina, rm.cantidad,rm.precioUnitario,rm.total from recetamanodeobra rm
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
                                                in cantidadI DECIMAL(10,3),
                                                in precioUnitarioI DECIMAL(10,3),
												            in totalI DECIMAL(10,3) )
BEGIN

	 INSERT INTO recetamanodeobra(idReceta,idEmpleado,idMaquina,nombreEmpleado,nombreMaquina,cantidad,precioUnitario,total)
			              VALUES (idRecetaI,idEmpleadoI,idMaquinaI,nombreEmpleadoI,nombreMaquinaI,cantidadI,precioUnitarioI,totalI);
	
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_recetamanodeobra`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_recetamanodeobra` (    in idRecetaManodeObraE INT,
                                                in cantidadE DECIMAL(10,3),
												            in totalE DECIMAL(10,3))
BEGIN

   UPDATE recetamanodeobra SET cantidad = cantidadE,
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
