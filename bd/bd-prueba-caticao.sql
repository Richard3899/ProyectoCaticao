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
