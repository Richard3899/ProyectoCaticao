
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



-- Procedimientos almacenados de Receta Depreciación--

DROP procedure IF EXISTS `mostrar_recetadepreciacion1`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetadepreciacion1` (in idRecetaManodeObraC INT)
BEGIN
	 select rm.idRecetaManodeObra,rm.idReceta,rm.idEmpleado,rm.nombreEmpleado,rm.idMaquina,rm.nombreMaquina, rm.cantidad,rm.precioUnitario,rm.total from recetamanodeobra rm
    inner join empleado e on e.idEmpleado=rm.idEmpleado
    inner join maquina m ON m.idMaquina=rm.idMaquina
    where rm.idRecetaManodeObra=idRecetaManodeObraC;
    
    
END$$
DELIMITER ;

DROP procedure IF EXISTS `mostrar_recetadepreciacion2`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_recetadepreciacion2` (in idRecetaC INT)
BEGIN
	 SELECT rd.idRecetaDepreciacion,rd.idReceta,rd.idMaquina,m.nombre,rd.depreciacionAnual,rd.depreciacionMensual,rd.depreciacionHora,
	        rd.depreciacionHora,rd.tiempoDeUso,rd.depreciacionPorBatch from recetadepreciacion rd
    inner join maquina m ON m.idMaquina=rd.idMaquina
    where rd.idReceta=idRecetaC;

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



DROP procedure IF EXISTS `sumatotal_recetadepreciacion`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `sumatotal_recetadepreciacion` (in idRecetaC INT)
BEGIN
			SELECT SUM(rd.depreciacionPorBatch) FROM recetadepreciacion rd 
		                     WHERE rd.idReceta=idRecetaC;
END$$
DELIMITER ;

 
			    
	
 