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

