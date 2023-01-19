DROP procedure IF EXISTS `sumatotal_receta`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_receta` ()
BEGIN

	DECLARE totalinsumos FLOAT;
	DECLARE totalmanoobra FLOAT;
	DECLARE totalreceta float;
  
			SELECT SUM(total) FROM recetamateria rm INNER JOIN receta r ON r.idReceta=rm.idReceta
		                     WHERE MONTH(fechaFin) = MONTH('2022-11-01') AND YEAR(fechaFin) = YEAR('2022-11-01') INTO totalinsumos;
		                     
		   SELECT SUM(total) FROM recetamanodeobra
		                     WHERE idReceta=1 INTO totalmanoobra;
	
	SET totalreceta = totalinsumos;
	
	SELECT totalreceta AS total;
		                     
END$$
DELIMITER ;

CALL sumatotal_receta();


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
	                                                in cantidadI DECIMAL(10,3),
	                                                in precioI DECIMAL(10,3),
													            in totalI DECIMAL(10,3) )
BEGIN

	 INSERT INTO gastoadminpormes(idCostoRecetasGastoAdmin,idGastoAdmin,nombreGastoAdmin,cantidad,precio,total)
			                 VALUES (idCostoRecetasGastoAdminI,idGastoAdminI,nombreGastoAdminI,cantidadI,precioI,totalI);
	
END$$
DELIMITER ;


DROP procedure IF EXISTS `editar_gastoadminpormes`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_gastoadminpormes` (    in idGastoAdminPorMesE INT,
                                                in cantidadE DECIMAL(10,3),
												            in totalE DECIMAL(10,3))
BEGIN

   UPDATE gastoadminpormes SET cantidad = cantidadE,
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
			SELECT SUM(total) FROM gastoadminpormes
		                     WHERE idCostoRecetasGastoAdmin=idCostoRecetasGastoAdminC;
END$$
DELIMITER ;

