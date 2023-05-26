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
('37','recetacostoventa'),
('38','recetacostomarketing'),
('39','recetacostooperativo'),
('40','mesgasto'),
('41','gastoadminpormes'),
('42','loteproductos');



INSERT INTO configuracion VALUES
('1','1','0','0');



INSERT INTO marca VALUES
('1','GLORIA'),
('2','DULFINA'),
('3','SAFE');



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
('1','Administrador','admin','$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S','vistas/img/usuarios/admin/211.png','1','2023-05-25 18:25:30','2022-10-18 16:42:18','1');



INSERT INTO modulo VALUES
('1','inicio'),
('2','insumos'),
('3','materiales'),
('4','marcas'),
('5','productos'),
('6','maquinas'),
('7','empleados'),
('8','gastoadmin'),
('9','costoventa'),
('10','costomarketing'),
('11','costooperativo'),
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
('40','recetacostoventa'),
('41','recetacostomarketing'),
('42','recetacostooperativo'),
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
('9','1','9'),
('10','1','10'),
('11','1','11'),
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
('40','1','40'),
('41','1','41'),
('42','1','42'),
('43','1','43'),
('44','1','44'),
('45','1','45');



INSERT INTO usuariopermiso VALUES
('1','1','1','1','1');



INSERT INTO empleado VALUES
('1','Julio','Gonzales','Av. Alfonso Ugarte Lt.12','987654321','julio@gmail.com','432187654','2022-11-03','Empaquetador','8am - 6pm','8','80.00','10.00','1000.00','1',NULL,'1');



INSERT INTO materia VALUES
('1','LC-12','LECHE','SIN LACTOSA','55.00','12.00','4.58',NULL,'2','1','1'),
('2','CJ-1245','CAJAS','DE CARTON','10.00','10.00','1.00',NULL,'3','3','2'),
('3','AG12','AGUA','EVAPORADA','12.00','12.00','1.00',NULL,'2','3','1'),
('4','VN001','VAINILLA','DULCE','7.00','12.00','0.58',NULL,'2','1','1'),
('5','CC001','CACAO','NATURAL','6.00','56.00','0.11',NULL,'1','3','1'),
('6','EMP001','EMPAQUES','GRANDES','30.00','100.00','0.30',NULL,'3','3','2');



INSERT INTO producto VALUES
('1','123456','Chocolate con pasa','50% cacao',NULL,'3','2');



INSERT INTO lote VALUES
('1','123456','2022-12-11','5.00','2022-12-10','1'),
('2','59482','2022-12-11','5.00','2022-12-10','1'),
('3','97450','2022-12-11','5.00','2022-12-10','1'),
('4','13306','2022-12-11','5.00','2022-12-10','1');



INSERT INTO maquina VALUES
('1','SL-0002','Seleccionadora','SL9212','MD-2022','Selecciona y limpia la materia prima','KAT','8000.00','2022','60.00','1.00','745.70','0.75','1600.00','133.33','0.22','5'),
('2','SLDR001','Selladora','12313123','MD-2022','Sella los empaques','KAT','2100.00','2022','20.00','0.75','559.28','0.56','2100.00','175.00','0.29','1');



INSERT INTO gastoadmin VALUES
('1','A1231','Gasto Administrativo 1','1','1','1'),
('2','A1234','Costo de Venta 1','2','3','2'),
('3','A1235','Costo de Marketing 1','3','3','2'),
('4','A3213','Costo Operativo 1','4','3','1'),
('5','A3213E','GASTO 2','1','3','1'),
('6','12453','GASTO 3','1','3','2'),
('7','234234','GASTO 4','1','3','1'),
('8','CV455','COSTO VENTA 2','2','3','2');



INSERT INTO inventariomateria VALUES
('1','250.00','2022-12-11 10:23:25','1'),
('2','200.00','2023-01-08 02:08:42','2'),
('3','100.00','2022-12-11 10:23:50','3'),
('4','0.00','2023-05-20 22:32:36','4'),
('5','100.00','2023-05-20 22:32:36','5'),
('6','2000.00','2023-01-08 02:08:52','6');



INSERT INTO inventarioproducto VALUES
('1','20.00','2023-05-20 22:33:31','1');



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
('7','0.00','100.00','Agregado Receta:','2023-05-20','RC001','2023-05-20 15:35:24','5','2'),
('8','0.00','100.00','Agregado Receta:','2023-05-20','RC002','2023-05-20 15:41:10','5','2'),
('9','0.00','50.00','Agregado Receta:','2023-05-20','RC002','2023-05-20 15:46:05','4','2'),
('10','0.00','100.00','Agregado Receta:','2023-05-20','RC003','2023-05-20 18:39:28','5','2'),
('11','0.00','50.00','Agregado Receta:','2023-05-20','RC003','2023-05-20 18:39:28','4','2'),
('13','0.00','100.00','Agregado Receta:','2023-05-20','RC004','2023-05-20 22:32:36','5','2'),
('14','0.00','50.00','Agregado Receta:','2023-05-20','RC004','2023-05-20 22:32:36','4','2');



INSERT INTO movimientoproducto VALUES
('1','5.00','0.00','Productos terminados : RC001','2022-12-10','2023-05-20 15:38:24','1','1'),
('2','5.00','0.00','Productos terminados : RC002','2022-12-10','2023-05-20 15:49:14','2','1'),
('3','5.00','0.00','Productos terminados : RC003','2022-12-10','2023-05-20 22:12:56','3','1'),
('4','5.00','0.00','Productos terminados : RC004','2022-12-10','2023-05-20 22:33:31','4','1');






INSERT INTO receta VALUES
('1','RC001','Receta 1','60.00','2022-12-10','2022-12-10','1.00','1.00','1.00','1.00','123456','1','5','11.00','2.20','3','0'),
('2','RC002','Receta 2','60.00','2022-12-10','2022-12-10','1.00','1.00','1.00','1.00','59482','1','5','40.00','8.00','3','1'),
('3','RC003','Receta 3','60.00','2022-12-10','2022-12-10','1.00','1.00','1.00','1.00','97450','1','5','40.00','8.00','3','1'),
('4','RC004','Receta 4','60.00','2022-12-10','2022-12-10','1.00','1.00','1.00','1.00','13306','1','5','40.00','8.00','3','1');



INSERT INTO recetamateria VALUES
('1','CACAO - SAFE','100.00','0.11','11.00','5','1'),
('2','CACAO - SAFE','100.00','0.11','11.00','5','2'),
('3','VAINILLA - GLORIA','50.00','0.58','29.00','4','2'),
('4','CACAO - SAFE','100.00','0.11','11.00','5','3'),
('5','VAINILLA - GLORIA','50.00','0.58','29.00','4','3'),
('7','CACAO - SAFE','100.00','0.11','11.00','5','4'),
('8','VAINILLA - GLORIA','50.00','0.58','29.00','4','4');









INSERT INTO tarifaenergia VALUES
('1','0.72');


















INSERT INTO mesgasto VALUES
('1','DICIEMBRE DEL 2022','2022-12-01','1'),
('2','ENERO DEL 2023','2023-01-01','1'),
('3','JUNIO DEL 2023','2023-06-01','1');



INSERT INTO gastoadminpormes VALUES
('1','Gasto Administrativo 1','5.00','5.00','25.00','1','1'),
('2','GASTO 2','2.00','5.00','10.00','5','1'),
('3','GASTO 3','4.00','9.00','36.00','6','1'),
('4','GASTO 4','1.00','12.00','12.00','7','2'),
('5','Gasto Administrativo 1','2.00','4.00','8.00','1','2'),
('6','Costo de Venta 1','6.00','4.00','24.00','2','1'),
('7','COSTO VENTA 2','4.00','3.00','12.00','8','1'),
('8','Costo de Venta 1','4.00','4.00','16.00','2','3'),
('9','COSTO VENTA 2','3.00','9.00','27.00','8','3');




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;