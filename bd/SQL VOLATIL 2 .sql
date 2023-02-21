
-- Procedimientos almacenados Costo total de las recetas por mes-
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
						
	SET totalreceta = totalinsumos + totalmanodeobra + totaldepreciacion + totalconsumoenergia + totalconsumogas + totalcostoventa + totalcostomarketing + totalcostooperativo;

   UPDATE receta SET costototal = totalreceta
						WHERE idReceta=idRecetaT;
		                     
END$$
DELIMITER ;