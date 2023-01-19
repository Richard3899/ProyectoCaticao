DROP procedure IF EXISTS `sumatotal_costototalpormes`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_costototalpormes` (IN mes DATE)
BEGIN

	DECLARE totalinsumos FLOAT;
	
	DECLARE totalreceta FLOAT;
  
	SELECT SUM(total) FROM recetamateria rm INNER JOIN receta r ON r.idReceta=rm.idReceta
		            WHERE MONTH(fechaFin) = MONTH(mes) AND YEAR(fechaFin) = YEAR(mes) INTO totalinsumos;
		                     

	
	SET totalreceta = totalinsumos;
	
	SELECT totalreceta AS total;
		                     
END$$
DELIMITER ;

CALL sumatotal_costototalpormes('2022-12-01');



