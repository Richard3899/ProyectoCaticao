
DROP procedure IF EXISTS `duplicar_receta`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `duplicar_receta` (in idRecetaD INT,
												in codigoRecetaD VARCHAR(20),
                                    in codigoLoteD VARCHAR(20),
												in nuevoIdRecetaD INT)
BEGIN
   -- CREAR CÓDIGO ALEATORIO PARA LA RECETA DUPLICADA --
	DECLARE rc VARCHAR(20);
	 
	SET rc=ROUND(((RAND() * (99999 - 11111)) + 11111));
	
	-- INSERTA EL LOTE DE LA RECETA DUPLICADA --
	INSERT INTO lote (idLote,codigoLote,fechaVencimiento,idProducto)
				  SELECT nuevoIdRecetaD,rc,fechaVencimiento,idProducto FROM lote
				  WHERE  codigoLote = codigoLoteD;
				  
	-- INSERTA LA RECETA DUPLICADA --
	INSERT INTO receta (idReceta,codigo,nombre,batch,idEstado,fechaInicio,fechaFin,pesoPorTableta,pesoEnTableta,merma,reproceso,codigoLote)
	             SELECT nuevoIdRecetaD,codigoRecetaD AS codigo,CONCAT(nombre,'-','Duplicado')AS nombre, batch,idEstado,fechaInicio,fechaFin,pesoPorTableta,pesoEnTableta,merma,reproceso,rc AS codigoLote
				    FROM receta
				    WHERE idReceta = idRecetaD;
				    
	-- INSERTA LOS INSUMOS DE LA RECETA DUPLICADA --
	INSERT INTO recetamateria ( idMateria,idReceta,nombre,cantidad,precioUnitario,total)
	                    SELECT  rm.idMateria,nuevoIdRecetaD,rm.nombre,rm.cantidad,rm.precioUnitario,rm.total
	   					  FROM recetamateria rm INNER JOIN materia m ON m.idMateria=rm.idMateria                                                            
	   					  WHERE idReceta = idRecetaD AND m.idTipoMateria=1;
	   					  
	-- INSERTA LOS MOVIMIENTOS DEL KARDEX --	   					  
	INSERT INTO movimientomateria (idMateria,ingreso,salida,observacion,codigoReceta,fecha,idMovimiento)
				            SELECT  mm.idMateria,mm.ingreso,mm.salida,mm.observacion,codigoRecetaD AS codigoReceta,CURRENT_DATE() AS fecha,mm.idMovimiento 
								FROM movimientomateria mm INNER JOIN receta r ON r.codigo=mm.codigoReceta
							   WHERE mm.codigoReceta=r.codigo;
	
	-- ACTUALIZA EL INVENTARIO CON ELIMINAR E INSERTAR--						   
	DELETE inventariomateria FROM inventariomateria
	                         INNER JOIN materia ON inventariomateria.idMateria=inventariomateria.idMateria 
					             WHERE inventariomateria.stock > 0;
								
	INSERT INTO inventariomateria (idInventarioMateria,stock,idMateria)		
	                       SELECT mm.idMateria AS idInventarioMateria,SUM(mm.ingreso) - SUM(mm.salida) AS stock,mm.idMateria FROM movimientomateria mm
                          INNER JOIN materia m ON m.idMateria=mm.idMateria
                          GROUP BY mm.idMateria;
	
END$$
DELIMITER ;

