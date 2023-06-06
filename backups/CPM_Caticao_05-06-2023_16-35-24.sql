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
('1','GLORIA'),
('2','DULFINA'),
('3','SAFE'),
('4','MARINA');



INSERT INTO tipoproducto VALUES
('1','Intermedio'),
('2','Terminado');






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
('2','Vendedor'),
('3','Otro');



INSERT INTO usuario VALUES
('1','Administrador','admin','$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S','vistas/img/usuarios/admin/211.png','1','2023-06-05 16:34:35','2022-10-18 16:42:18','1'),
('2','sara','sara','$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S',NULL,'1','2023-06-02 20:39:41','2023-06-02 20:39:30','1');



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
('45','1','45'),
('62','2','1'),
('63','2','2'),
('64','2','3'),
('65','2','4'),
('66','2','5'),
('67','2','6'),
('68','2','7'),
('69','2','8'),
('70','2','12'),
('71','2','13'),
('72','2','14'),
('73','2','15'),
('74','2','16'),
('75','2','17'),
('76','2','18'),
('77','2','19'),
('78','2','20'),
('79','2','21'),
('80','2','22'),
('81','2','25'),
('82','2','23'),
('83','2','28'),
('84','2','29'),
('85','2','30'),
('86','2','31'),
('87','2','32'),
('88','2','24'),
('89','2','33'),
('90','2','34'),
('91','2','35'),
('92','2','36'),
('93','2','37'),
('94','2','38'),
('95','2','39'),
('96','2','43'),
('97','2','44'),
('98','2','45');



INSERT INTO usuariopermiso VALUES
('1','1','1','1','1'),
('2','1','1','0','2');



INSERT INTO empleado VALUES
('1','Julio','Gonzales','Av. Alfonso Ugarte Lt.12','987654321','julio@gmail.com','432187654','2022-11-03','Empaquetador','8am - 6pm','8','80.00','10.00','1000.00','1',NULL,'1');



INSERT INTO materia VALUES
('1','LC-12','LECHE','SIN LACTOSA','55.00','12.00','4.58',NULL,'2','1','1'),
('2','CJ-1245','CAJAS','DE CARTON','10.00','10.00','1.00',NULL,'3','3','2'),
('3','AG12','AGUA','EVAPORADA','12.00','12.00','1.00',NULL,'2','3','1'),
('4','VN001','VAINILLA','DULCE','7.00','12.00','0.58',NULL,'2','1','1'),
('5','CC001','CACAO','NATURAL','6.00','56.00','0.11',NULL,'1','3','1'),
('6','EMP001','EMPAQUES','GRANDES','30.00','100.00','0.30',NULL,'3','3','2'),
('7','S0001','SAL DE MAR','SALADA','5.00','12.00','0.42',NULL,'1','3','1');



INSERT INTO producto VALUES
('1','123456','Chocolate con pasa','50% cacao',NULL,'3','2'),
('2','CH0015','CHOCOLATE 100% CACA0','NO DULCE',NULL,'3','2');



INSERT INTO lote VALUES
('1','123456','2022-12-11','5.00','2022-12-10','1'),
('2','17721','2022-12-11','5.00','2022-12-10','1'),
('3','89317','2022-12-11','5.00','2022-12-10','1'),
('4','95851','2022-12-11','5.00','2022-12-10','1'),
('5','85830','2022-12-11','5.00','2022-12-10','1'),
('6','67032','2022-12-11','5.00','2022-12-10','1');



INSERT INTO maquina VALUES
('1','SL-0002','Seleccionadora','SL9212','MD-2022','Selecciona y limpia la materia prima','KAT','8000.00','2022','60.00','1.00','745.70','0.75','1600.00','133.33','0.22','5'),
('2','SLDR001','Selladora','12313123','MD-2022','Sella los empaques','KAT','2100.00','2022','20.00','0.75','559.28','0.56','2100.00','175.00','0.29','1');



INSERT INTO gastoadmin VALUES
('1','A1231','Gasto Administrativo 1','1','1','1'),
('2','A1234','Costo de Venta 1','2','3','2'),
('3','A1235','Costo de Marketing 1','3','3','2'),
('4','A3213','Costo Operativo 1','4','3','1'),
('5','G0002','GASTO ADMIN 2','1','3','2'),
('6','G0003','GASTO ADMIN 3','1','3','1');



INSERT INTO inventariomateria VALUES
('1','250.00','2022-12-11 10:23:25','1'),
('2','-100.00','2023-06-03 12:24:02','2'),
('3','100.00','2022-12-11 10:23:50','3'),
('4','150.00','2022-12-11 10:23:37','4'),
('5','-100.00','2023-06-03 12:24:02','5'),
('6','2000.00','2023-01-08 02:08:52','6'),
('7','1000.00','2023-06-02 20:14:32','7');



INSERT INTO inventarioproducto VALUES
('1','30.00','2023-06-03 12:24:21','1'),
('2','0.00',NULL,'2');



INSERT INTO inventariomaquina VALUES
('1','0.00',NULL,'1'),
('2','0.00',NULL,'2');



INSERT INTO movimientomateria VALUES
('1','250.00','0.00','Produccion','2022-12-17','S-C','2022-12-11 10:23:25','1','1'),
('2','150.00','0.00','Produccion','2022-12-31','S-C','2022-12-11 10:23:37','4','1'),
('3','100.00','0.00','Produccion','2022-12-10','S-C','2022-12-11 10:23:50','3','1'),
('4','500.00','0.00','Produccion','2022-12-17','S-C','2022-12-11 10:24:33','5','1'),
('5','200.00','0.00','Produccion','2023-01-26','S-C','2023-01-08 02:08:42','2','1'),
('6','2000.00','0.00','Produccion','2023-01-10','S-C','2023-01-08 02:08:52','6','1'),
('7','1000.00','0.00','Compra','2023-06-02','S-C','2023-06-02 20:14:32','7','1'),
('8','0.00','100.00','Agregado Receta:','2023-06-02','RC001','2023-06-02 20:15:32','5','2'),
('9','0.00','50.00','Agregado Receta:','2023-06-02','RC001','2023-06-02 20:15:43','2','2'),
('10','0.00','100.00','Agregado Receta:','2023-06-02','RC002','2023-06-02 20:18:52','5','2'),
('11','0.00','50.00','Agregado Receta:','2023-06-02','RC002','2023-06-02 20:18:52','2','2'),
('13','0.00','100.00','Agregado Receta:','2023-06-02','RC003','2023-06-02 20:40:07','5','2'),
('14','0.00','50.00','Agregado Receta:','2023-06-02','RC003','2023-06-02 20:40:07','2','2'),
('15','0.00','100.00','Agregado Receta:','2023-06-03','RC004','2023-06-03 12:23:28','5','2'),
('16','0.00','50.00','Agregado Receta:','2023-06-03','RC004','2023-06-03 12:23:28','2','2'),
('18','0.00','100.00','Agregado Receta:','2023-06-03','RC005','2023-06-03 12:23:57','5','2'),
('19','0.00','50.00','Agregado Receta:','2023-06-03','RC005','2023-06-03 12:23:57','2','2'),
('21','0.00','100.00','Agregado Receta:','2023-06-03','RC006','2023-06-03 12:24:02','5','2'),
('22','0.00','50.00','Agregado Receta:','2023-06-03','RC006','2023-06-03 12:24:02','2','2');



INSERT INTO movimientoproducto VALUES
('1','5.00','0.00','Productos terminados : RC001','2022-12-10','2023-06-02 20:16:08','1','1'),
('2','5.00','0.00','Productos terminados : RC002','2022-12-10','2023-06-02 20:20:16','2','1'),
('3','5.00','0.00','Productos terminados : RC003','2022-12-10','2023-06-03 11:50:59','3','1'),
('4','5.00','0.00','Productos terminados : RC004','2022-12-10','2023-06-03 12:23:48','4','1'),
('5','5.00','0.00','Productos terminados : RC006','2022-12-10','2023-06-03 12:24:19','6','1'),
('6','5.00','0.00','Productos terminados : RC005','2022-12-10','2023-06-03 12:24:21','5','1');






INSERT INTO receta VALUES
('1','RC001','Receta 1','60.00','2022-12-10','2022-12-10','1.00','1.00','0.00','0.00','123456','1','1','1','5','86.00','17.20','3'),
('2','RC002','Receta 2','60.00','2022-12-10','2022-12-10','1.00','1.00','0.00','0.00','17721','1','1','1','5','93.60','18.72','3'),
('3','RC003','Receta 3','60.00','2022-12-10','2022-12-10','1.00','1.00','0.00','0.00','89317','1','0','0','5','123.60','24.72','3'),
('4','RC004','Receta 4','60.00','2022-12-10','2022-12-10','1.00','1.00','0.00','0.00','95851','1','0','0','5','91.93','18.39','3'),
('5','RC005','Receta 1-Duplicado','60.00','2022-12-10','2022-12-10','1.00','1.00','0.00','0.00','85830','1','0','0','5','106.00','21.20','3'),
('6','RC006','Receta 1-Duplicado','60.00','2022-12-10','2022-12-10','1.00','1.00','0.00','0.00','67032','1','0','0','5','61.00','12.20','3');



INSERT INTO recetamateria VALUES
('1','CACAO - SAFE','100.00','0.11','11.00','5','1'),
('2','CAJAS - SAFE','50.00','1.00','50.00','2','1'),
('3','CACAO - SAFE','100.00','0.11','11.00','5','2'),
('4','CAJAS - SAFE','50.00','1.00','50.00','2','2'),
('6','CACAO - SAFE','100.00','0.11','11.00','5','3'),
('7','CAJAS - SAFE','50.00','1.00','50.00','2','3'),
('8','CACAO - SAFE','100.00','0.11','11.00','5','4'),
('9','CAJAS - SAFE','50.00','1.00','50.00','2','4'),
('11','CACAO - SAFE','100.00','0.11','11.00','5','5'),
('12','CAJAS - SAFE','50.00','1.00','50.00','2','5'),
('14','CACAO - SAFE','100.00','0.11','11.00','5','6'),
('15','CAJAS - SAFE','50.00','1.00','50.00','2','6');



INSERT INTO recetamanodeobra VALUES
('1','Julio Gonzales','Seleccionadora','1.00','10.00','10.00','1','1','2'),
('2','Julio Gonzales','Seleccionadora','1.00','10.00','10.00','1','1','3'),
('3','Julio Gonzales','Seleccionadora','1.00','10.00','10.00','1','1','4');



INSERT INTO recetadepreciacion VALUES
('1','Seleccionadora','0.22','10.00','2.20','1','2'),
('2','Seleccionadora','0.22','10.00','2.20','1','3'),
('3','Seleccionadora','0.22','10.00','2.20','1','4');



INSERT INTO tarifaenergia VALUES
('1','0.72');



INSERT INTO recetaconsumoenergia VALUES
('1','Seleccionadora','0.75','10.00','7.50','0.72','5.40','1','1','2'),
('2','Seleccionadora','0.75','10.00','7.50','0.72','5.40','1','1','3'),
('3','Seleccionadora','0.75','10.00','7.50','0.72','5.40','1','1','4');






INSERT INTO mesgasto VALUES
('1','JUNIO DEL 2023','2023-06-01','1','1'),
('2','JULIO DEL 2023','2023-07-01','1','0'),
('3','ENERO DEL 2024','2024-01-01','0','0');



INSERT INTO gastoadminpormes VALUES
('1','Gasto Administrativo 1','5.00','2.00','10.00','1','1'),
('2','GASTO ADMIN 3','4.00','5.00','20.00','6','1'),
('3','Costo de Venta 1','1.00','10.00','10.00','2','1'),
('4','GASTO ADMIN 2','4.00','10.00','40.00','5','2'),
('5','GASTO ADMIN 3','5.00','10.00','50.00','6','2');




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;