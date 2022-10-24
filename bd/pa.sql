use caticao;

-- Procedimientos almacenados de Usuario --

DROP procedure IF EXISTS `mostrar_usuarios`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `mostrar_usuarios` ()
BEGIN
	select * from usuario;
END$$

DELIMITER ;


DROP procedure IF EXISTS `insertar_usuario`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `insertar_usuario` (   in nombreI VARCHAR(45),
                                        in usuarioI VARCHAR(45),
                                        in passwordI VARCHAR(100),
                                        in perfilI VARCHAR(45),
                                        in fotoI VARCHAR(100))
BEGIN
	insert into usuario (nombre,usuario,password,perfil,foto,estado)
				  values (nombreI,usuarioI,passwordI,perfilI,fotoI,1);
END$$
DELIMITER ;



DROP procedure IF EXISTS `editar_usuario`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `editar_usuario` (     in nombreE VARCHAR(45),
                                        in usuarioE VARCHAR(45),
                                        in passwordE VARCHAR(100),
                                        in perfilE VARCHAR(45),
                                        in fotoE VARCHAR(100))
BEGIN
	update usuario set nombre=nombreE,
                        usuario=usuarioE,
                        password=passwordE,
                        perfil=perfilE,
                        foto=fotoE
				where usuario=usuarioE;
END$$
DELIMITER ;



DROP procedure IF EXISTS `eliminar_usuario`;
DELIMITER $$
USE `caticao`$$
CREATE PROCEDURE `eliminar_usuario` (in idUsuarioE int)
BEGIN
	delete from usuario
    where idUsuario=idUsuarioE;
END$$
DELIMITER ;
