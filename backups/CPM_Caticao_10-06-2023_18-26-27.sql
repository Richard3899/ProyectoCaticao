SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
Use caticao;
--



INSERT INTO ordertable VALUES
('1','ordertable'),
('2','configuracion'),
('3','marca'),
('4','tipoproducto'),
('5','tipounidad'),
('6','unidadmedida'),
('7','tipomateria'),
('8','tipocosto'),
('9','tipodocumento'),
('10','tipogasto'),
('11','movimiento'),
('12','estado'),
('13','perfil'),
('14','usuario'),
('15','modulo'),
('16','usuariomodulo'),
('17','usuariopermiso'),
('18','empleado'),
('19','materia'),
('20','producto'),
('21','lote'),
('22','maquina'),
('23','gastoadmin'),
('24','inventariomateria'),
('25','inventarioproducto'),
('26','inventariomaquina'),
('27','movimientomateria'),
('28','movimientoproducto'),
('29','movimientomaquina'),
('30','receta'),
('31','recetamateria'),
('32','recetamanodeobra'),
('33','recetadepreciacion'),
('34','tarifaenergia'),
('35','recetaconsumoenergia'),
('36','recetaconsumogas'),
('40','mesgasto'),
('41','gastoadminpormes');



INSERT INTO configuracion VALUES
('1','1','0','0');



INSERT INTO marca VALUES
('1','SIN MARCA'),
('2','VILLA NATURA'),
('3','GLORIA'),
('4','COSTEÑO');



INSERT INTO tipoproducto VALUES
('1','Terminado'),
('2','Intermedio');






INSERT INTO unidadmedida VALUES
('1','Kg',NULL),
('2','L',NULL),
('3','Unid',NULL);



INSERT INTO tipomateria VALUES
('1','Insumo'),
('2','Material');



INSERT INTO tipocosto VALUES
('1','Fijo'),
('2','Variable');



INSERT INTO tipodocumento VALUES
('1','DNI'),
('2','RUC'),
('3','Pasaporte');



INSERT INTO tipogasto VALUES
('1','Gastos Administrativos'),
('2','Costos de Ventas'),
('3','Costos de Marketing'),
('4','Costos Operativos');



INSERT INTO movimiento VALUES
('1','Ingreso'),
('2','Salida');



INSERT INTO estado VALUES
('1','Iniciado'),
('2','Proceso'),
('3','Terminado');



INSERT INTO perfil VALUES
('1','Administrador'),
('2','Operario'),
('3','Vendedor'),
('4','Otro');



INSERT INTO usuario VALUES
('1','Administrador','admin','$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S','vistas/img/usuarios/admin/211.png','1',NULL,'2022-10-18 16:42:18','1');



INSERT INTO modulo VALUES
('1','inicio'),
('2','insumos'),
('3','materiales'),
('4','marcas'),
('5','productos'),
('6','maquinas'),
('7','empleados'),
('8','gastoadmin'),
('12','inventarioinsumos'),
('13','inventariomateriales'),
('14','inventarioproductos'),
('15','inventariomaquinas'),
('16','recetas'),
('17','costoreceta'),
('18','mesgasto'),
('19','usuarios'),
('20','reporteinsumos'),
('21','reportemateriales'),
('22','reporteproductos'),
('23','configuracion'),
('24','loteproductos'),
('25','reporterecetas'),
('28','backup'),
('29','salir'),
('30','kardexinsumos'),
('31','kardexmateriales'),
('32','kardexproductos'),
('33','kardexmaquinas'),
('34','recetainsumos'),
('35','recetamateriales'),
('36','recetamanodeobra'),
('37','recetadepreciacion'),
('38','recetaconsumoenergia'),
('39','recetaconsumogas'),
('43','costototal'),
('44','gastoadminpormes'),
('45','costototalpormes');



INSERT INTO usuariomodulo VALUES
('1','1','1'),
('2','1','2'),
('3','1','3'),
('4','1','4'),
('5','1','5'),
('6','1','6'),
('7','1','7'),
('8','1','8'),
('12','1','12'),
('13','1','13'),
('14','1','14'),
('15','1','15'),
('16','1','16'),
('17','1','17'),
('18','1','18'),
('19','1','19'),
('20','1','20'),
('21','1','21'),
('22','1','22'),
('23','1','23'),
('24','1','24'),
('25','1','25'),
('28','1','28'),
('29','1','29'),
('30','1','30'),
('31','1','31'),
('32','1','32'),
('33','1','33'),
('34','1','34'),
('35','1','35'),
('36','1','36'),
('37','1','37'),
('38','1','38'),
('39','1','39'),
('43','1','43'),
('44','1','44'),
('45','1','45');



INSERT INTO usuariopermiso VALUES
('1','1','1','1','1');



INSERT INTO empleado VALUES
('1','Julio ','Granado','Av. Lima Mz.A N°12','987654321','julio@gamil.com','87654321','1990-06-01','Operario','9am-6pm','8','60.00','7.50','1320.00','1',NULL,'1'),
('2','Mario','Bros','Av.Peru Mz.C N°153','987654321','mario@gmail.com','12345678','1985-06-22','Operario','9am-6pm','8','60.00','7.50','1320.00','1',NULL,'1');



INSERT INTO materia VALUES
('1','CC-001','CACAO','DE LA SELVA','400.00','100.00','4.00',NULL,'1','1','1'),
('2','PS-001','PASAS','DULCE','40.00','1.50','26.67',NULL,'1','2','1'),
('3','LC-001','LECHE','ENTERA','52.00','10.00','5.20',NULL,'2','3','1'),
('4','AZ-001','AZUCAR','BLANCA','55.00','10.00','5.50',NULL,'1','4','1'),
('5','CJ-001','CAJAS','DE CARTON','30.00','100.00','0.30',NULL,'3','1','2'),
('6','BBL-001','BOLSAS BILAMINADO','-','3.00','100.00','0.03',NULL,'3','1','2');



INSERT INTO producto VALUES
('1','P-001','Chocolate de leche 60% cacao',' con pasas',NULL,'3','1'),
('2','P-002','Chocolate de leche 38% cacao',' con pecanas',NULL,'3','1');



INSERT INTO lote VALUES
('1','LT-0001','200.00','3.95','2023-06-10','2030-06-10','1');



INSERT INTO maquina VALUES
('1','SL-001','SELECCIONADORA','SL-1234','SL-0000','-','CAT','8000.00','2022','60.00','1.00','745.70','0.75','1600.00','133.33','0.22','5'),
('2','TS-001','TOSTADORA','TS-1234','TS-0000','-','CAT','12500.00','2022','60.00','1.00','745.70','0.75','2500.00','208.33','0.35','5'),
('3','BM-001','BAÑO MARIA','BM-1234','0000','-','BM','150.00','2022','1.00','1.00','745.70','0.75','150.00','12.50','0.02','1');



INSERT INTO gastoadmin VALUES
('1','GA-001','GASTO ADMIN 1','1','3','1'),
('2','CV-001','COSTO VENTA 1','2','3','1'),
('3','CM-001','COSTO MARKETING 1','3','3','1'),
('4','CO-001','COSTO OPERATIVO 1','4','3','1');



INSERT INTO inventariomateria VALUES
('1','60.00','2023-06-10 17:45:15','1'),
('2','10.00','2023-06-10 17:26:28','2'),
('3','45.00','2023-06-10 17:46:22','3'),
('4','38.06','2023-06-10 17:45:32','4'),
('5','30.00','2023-06-10 17:47:18','5'),
('6','30.00','2023-06-10 17:47:26','6');



INSERT INTO inventarioproducto VALUES
('1','200.00','2023-06-10 18:08:53','1'),
('2','0.00',NULL,'2');



INSERT INTO inventariomaquina VALUES
('1','2.00','2023-06-10 17:40:34','1'),
('2','1.00','2023-06-10 17:40:43','2'),
('3','0.00',NULL,'3');



INSERT INTO movimientomateria VALUES
('1','100.00','0.00','Compra','2023-06-10','S-C','2023-06-10 17:24:57','1','1'),
('2','50.00','0.00','Compra','2023-06-10','S-C','2023-06-10 17:25:57','4','1'),
('3','50.00','0.00','Compra','2023-06-10','S-C','2023-06-10 17:26:13','3','1'),
('4','10.00','0.00','Compra','2023-06-10','S-C','2023-06-10 17:26:28','2','1'),
('5','100.00','0.00','Compra','2023-06-10','S-C','2023-06-10 17:27:37','6','1'),
('6','100.00','0.00','Compra','2023-06-10','S-C','2023-06-10 17:27:48','5','1'),
('7','0.00','40.00','Agregado Receta:','2023-06-10','RC001','2023-06-10 17:45:15','1','2'),
('8','0.00','11.94','Agregado Receta:','2023-06-10','RC001','2023-06-10 17:45:32','4','2'),
('9','0.00','5.00','Agregado Receta:','2023-06-10','RC001','2023-06-10 17:46:22','3','2'),
('10','0.00','70.00','Agregado Receta:','2023-06-10','RC001','2023-06-10 17:47:18','5','2'),
('11','0.00','70.00','Agregado Receta:','2023-06-10','RC001','2023-06-10 17:47:26','6','2');



INSERT INTO movimientoproducto VALUES
('1','200.00','0.00','Productos terminados : RC001','2023-06-10','2023-06-10 18:08:53','1','1');



INSERT INTO movimientomaquina VALUES
('1','2.00','0.00','Compra','2023-06-10','2023-06-10 17:40:34','1','1'),
('2','1.00','0.00','Compra','2023-06-10','2023-06-10 17:40:43','2','1');



INSERT INTO receta VALUES
('1','RC001','RECETA 1','160.00','2023-06-01','2023-06-10','45.00','1.00','1.00','1.00','LT-0001','1','1','1','200','789.95','3.95','3');



INSERT INTO recetamateria VALUES
('1','CACAO - SIN MARCA','40.00','4.00','160.00','1','1'),
('2','AZUCAR - COSTEÑO','11.94','5.50','65.67','4','1'),
('3','LECHE - GLORIA','5.00','5.20','26.00','3','1'),
('4','CAJAS - SIN MARCA','70.00','0.30','21.00','5','1'),
('5','BOLSAS BILAMINADO - SIN MARCA','70.00','0.03','2.10','6','1');



INSERT INTO recetamanodeobra VALUES
('2','Julio  Granado','SELECCIONADORA','0.33','7.50','2.48','1','1','1'),
('3','Mario Bros','TOSTADORA','0.67','7.50','5.03','2','2','1');



INSERT INTO recetadepreciacion VALUES
('1','SELECCIONADORA','0.22','0.40','0.09','1','1'),
('2','TOSTADORA','0.35','0.40','0.14','2','1');



INSERT INTO tarifaenergia VALUES
('1','0.72');



INSERT INTO recetaconsumoenergia VALUES
('1','SELECCIONADORA','0.75','0.40','0.30','0.72','0.22','1','1','1'),
('2','TOSTADORA','0.75','0.40','0.30','0.72','0.22','1','2','1');



INSERT INTO recetaconsumogas VALUES
('1','BAÑO MARIA','8.00','2.00','3.50','7.00','3','1');



INSERT INTO mesgasto VALUES
('1','JUNIO DEL 2023','2023-06-01','1','1'),
('2','JULIO DEL 2023','2023-07-01','0','0');



INSERT INTO gastoadminpormes VALUES
('1','GASTO ADMIN 1','1.00','200.00','200.00','1','1'),
('2','COSTO MARKETING 1','1.00','300.00','300.00','3','1');




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;