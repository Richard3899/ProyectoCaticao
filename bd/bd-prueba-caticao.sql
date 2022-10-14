CREATE TABLE `usuarios` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`nombre` TEXT NOT NULL COLLATE 'utf8_spanish_ci',
	`usuario` TEXT NOT NULL COLLATE 'utf8_spanish_ci',
	`password` TEXT NOT NULL COLLATE 'utf8_spanish_ci',
	`perfil` TEXT NOT NULL COLLATE 'utf8_spanish_ci',
	`foto` TEXT NULL DEFAULT NULL COLLATE 'utf8_spanish_ci',
	`estado` INT(11) NOT NULL,
	`ultimo_login` DATETIME NULL DEFAULT NULL,
	`fecha` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_spanish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=3
;


-- Volcando datos para la tabla caticao.usuarios: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
	(00000000001, 'Usuario Administrador', 'admin', 'admin123', 'Administrador', NULL, 1, '2022-10-12 22:24:23', '2022-10-12 22:24:20'),
	(00000000002, 'Richard Arias', 'richard', '123456', 'Administrador', NULL, 1, NULL, '2022-10-12 23:08:21');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;