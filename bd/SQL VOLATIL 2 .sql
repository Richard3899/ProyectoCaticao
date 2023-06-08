
ALTER TABLE lote ADD  COLUMN precioUnitario DECIMAL(10,2) ;

SELECT * FROM lote;


UPDATE lote lt
INNER JOIN receta r ON r.codigoLote= lt.codigoLote
SET lt.fechaProduccion = r.fechaFin;