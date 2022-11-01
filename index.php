<?php 

require_once "controladores/plantilla.controlador.php";

require_once "controladores/usuarios.controlador.php";
require_once "controladores/marcas.controlador.php";
require_once "controladores/unidadmedida.controlador.php";
require_once "controladores/insumos.controlador.php";
require_once "controladores/materiales.controlador.php";
require_once "controladores/productos.controlador.php";
require_once "controladores/tipoproducto.controlador.php";


require_once "modelos/usuarios.modelo.php";
require_once "modelos/marcas.modelo.php";
require_once "modelos/unidadmedida.modelo.php";
require_once "modelos/insumos.modelo.php";
require_once "modelos/materiales.modelo.php";
require_once "modelos/productos.modelo.php";
require_once "modelos/tipoproducto.modelo.php";


$plantilla = new ControladorPlantilla();
$plantilla -> ctrPlantilla();