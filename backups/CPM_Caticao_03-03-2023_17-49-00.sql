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
('10','desembolso'),
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
('21','maquina'),
('22','gastoadmin'),
('23','inventariomateria'),
('24','inventarioproducto'),
('25','inventariomaquina'),
('26','movimientomateria'),
('27','movimientoproducto'),
('28','movimientomaquina'),
('29','lote'),
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
('40','costorecetasgastoadmin'),
('41','gastoadminpormes'),
('42','loteproductos');



INSERT INTO configuracion VALUES
('1','1','0','0');



INSERT INTO marca VALUES
('1','GLORIA'),
('2','DULFINA'),
('3','SAFE'),
('14','NUEVA'),
('15','MARCA2');



INSERT INTO tipoproducto VALUES
('1','Intermedio'),
('2','Terminado');






INSERT INTO unidadmedida VALUES
('1','Kg',NULL),
('2','Lt',NULL),
('3','Niu',NULL);



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



INSERT INTO desembolso VALUES
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
('1','Administrador','admin','$2a$07$asxx54ahjppf45sd87a5aunxs9bkpyGmGE/.vekdjFg83yRec789S','vistas/img/usuarios/admin/211.png','1','2023-03-03 17:47:31','2022-10-18 16:42:18','1'),
('2','Sara','sara','$2a$07$asxx54ahjppf45sd87a5auJRR6foEJ7ynpjisKtbiKJbvJsoQ8VPS',NULL,'1','2023-03-03 17:47:01','2023-03-03 17:46:50','1');



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
('18','costorecetasgastoadmin'),
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
('45','1','45'),
('46','2','2'),
('47','2','3'),
('48','2','4'),
('49','2','5'),
('50','2','6'),
('51','2','7'),
('52','2','20'),
('53','2','21'),
('54','2','22'),
('55','2','25'),
('56','2','29');



INSERT INTO usuariopermiso VALUES
('1','1','1','1','1'),
('2','1','1','0','2');



INSERT INTO empleado VALUES
('1','Julio','Gonzales','Av. Alfonso Ugarte Lt.12','987654321','julio@gmail.com','432187654','2022-11-03','Empaquetador','8am - 6pm','8','80.00','10.00','1000.00','1',NULL,'1');



INSERT INTO materia VALUES
('1','LC-12','LECHE','SIN LACTOSA','55.00','12.000','4.58',NULL,'2','15','1'),
('2','CJ-1245','Cajas 2','DE CARTON 2','10.00','10.000','1.00',NULL,'3','14','2'),
('3','AG12','AGUA 2','EVAPORADA','12.00','12.000','1.00',NULL,'2','14','1'),
('4','VN001','VAINILLA','DULCE','7.00','12.000','0.58',NULL,'2','14','1'),
('5','CC001','CACAO','NATURAL','6.00','56.000','0.11',NULL,'1','14','1'),
('6','EMP001','EMPAQUES','GRANDES','30.00','100.000','0.30',NULL,'3','14','2');



INSERT INTO producto VALUES
('1','123456','Chocolate con pasa','50% cacao',NULL,'3','2'),
('2','CH015','SUBLIME','BUENO',NULL,'3','2');



INSERT INTO maquina VALUES
('1','SL-0002','Seleccionadora','SL9212','MD-2022','Selecciona y limpia la materia prima','KAT','8000.00','2022','60.00','1.00','745.70','0.75','1600.00','133.33','0.22','5'),
('2','SLDR001','Selladora','12313123','MD-2022','Sella los empaques','KAT','2100.00','2022','20.00','0.75','559.28','0.56','2100.00','175.00','0.29','1');



INSERT INTO gastoadmin VALUES
('1','Gasto Administrativo 1','70.00','1','1','1'),
('2','Costo de Venta 1','15.00','3','2','2'),
('3','Costo de Marketing 1','10.00','3','2','3'),
('4','Costo Operativo 1','12.00','3','1','4');



INSERT INTO inventariomateria VALUES
('1','200.000','1'),
('2','150.000','2'),
('3','100.000','3'),
('4','150.000','4'),
('5','290.000','5'),
('6','1860.000','6');



INSERT INTO inventarioproducto VALUES
('1','5.00','1'),
('2','100.00','2');



INSERT INTO inventariomaquina VALUES
('1','2.00','1'),
('2','0.00','2');



INSERT INTO movimientomateria VALUES
('1','250.000','0.000','Produccion','2022-12-17','S-C','2022-12-11 10:23:25','1','1'),
('2','150.000','0.000','Produccion','2022-12-31','S-C','2022-12-11 10:23:37','4','1'),
('3','100.000','0.000','Produccion','2022-12-10','S-C','2022-12-11 10:23:50','3','1'),
('4','500.000','0.000','Produccion','2022-12-17','S-C','2022-12-11 10:24:33','5','1'),
('5','200.000','0.000','Produccion','2023-01-26','S-C','2023-01-08 02:08:42','2','1'),
('6','2000.000','0.000','Produccion','2023-01-10','S-C','2023-01-08 02:08:52','6','1'),
('7','0.000','70.000','Agregado Receta:','2023-02-24','RC001','2023-02-24 02:08:40','5','2'),
('8','0.000','70.000','Agregado Receta:','2023-02-24','RC002','2023-02-24 02:08:46','5','2'),
('9','0.000','70.000','Agregado Receta:','2023-02-24','RC002','2023-02-24 02:08:56','6','2'),
('10','0.000','70.000','Agregado Receta:','2023-02-24','RC004','2023-02-24 16:31:25','5','2'),
('11','0.000','70.000','Agregado Receta:','2023-02-24','RC004','2023-02-24 16:31:25','6','2'),
('16','0.000','50.000','Agregado Receta:','2023-03-03','RC001','2023-03-03 17:42:46','1','2'),
('17','0.000','50.000','Agregado Receta:','2023-03-03','RC001','2023-03-03 17:43:00','2','2');



INSERT INTO movimientoproducto VALUES
('1','10.00','0.00','Productos terminados : RC002','2022-12-10','2023-02-24 02:12:25','2','1'),
('2','9.00','0.00','Productos terminados : RC001','2022-12-10','2023-02-24 15:42:33','1','1'),
('3','100.00','0.00','Productos terminados : RC004','2022-12-10','2023-02-24 16:34:39','3','1'),
('4','0.00','9.00','Retiro','2023-02-07','2023-02-24 17:37:25','1','2'),
('5','0.00','5.00','Retiro','2023-03-10','2023-03-03 17:40:24','2','2');



INSERT INTO movimientomaquina VALUES
('1','1.00','0.00','Compra','2023-03-11','2023-03-02 01:59:56','1','1'),
('2','1.00','0.00','Compra','2023-03-11','2023-03-02 02:00:41','1','1');



INSERT INTO lote VALUES
('1','123456','2022-12-11','0.00','1'),
('2','59147','2022-12-11','5.00','1'),
('3','30310','2022-12-11','100.00','2'),
('6','82600','2022-12-11','0.00','1'),
('7','67090','2022-12-11','0.00','1');



INSERT INTO receta VALUES
('1','RC001','Receta 1','60.00','2022-12-10','2022-12-10','1.00','1.00','1.00','1.00','123456','0','9','988.02','109.78','3'),
('2','RC002','Receta 2','60.00','2022-12-10','2022-12-10','1.00','1.00','1.00','1.00','59147','1','10','108.70','12.08','3'),
('3','RC004','Receta 4','60.00','2022-12-10','2022-12-10','1.00','1.00','1.00','1.00','30310','1','100','108.70','12.08','3');



INSERT INTO recetamateria VALUES
('1','CACAO - SAFE','70.000','0.11','7.70','5','1'),
('2','CACAO - SAFE','70.000','0.11','7.70','5','2'),
('3','EMPAQUES - SAFE','70.000','0.30','21.00','6','2'),
('4','CACAO - SAFE','70.000','0.11','7.70','5','3'),
('5','EMPAQUES - SAFE','70.000','0.30','21.00','6','3'),
('10','LECHE - MARCA2','50.000','4.58','229.00','1','1'),
('11','Cajas 2 - NUEVA','50.000','1.00','50.00','2','1');



INSERT INTO recetamanodeobra VALUES
('1','Julio Gonzales','Selladora','8.00','10.00','80.00','2','1','2'),
('2','Julio Gonzales','Seleccionadora','70.00','10.00','700.00','1','1','1'),
('3','Julio Gonzales','Selladora','8.00','10.00','80.00','2','1','3');



INSERT INTO recetadepreciacion VALUES
('1','Seleccionadora','0.22','6.00','1.32','1','1');



INSERT INTO tarifaenergia VALUES
('1','0.72');


















INSERT INTO costorecetasgastoadmin VALUES
('1','DICIEMBRE DEL 2022','2022-12-01');



INSERT INTO gastoadminpormes VALUES
('1','Gasto Administrativo 1','7.00','70.00','490.00','1','1');




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;