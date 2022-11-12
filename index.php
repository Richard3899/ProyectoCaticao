<?php 

require_once "controladores/plantilla.controlador.php";

require_once "controladores/usuarios.controlador.php";
require_once "controladores/marcas.controlador.php";
require_once "controladores/unidadmedida.controlador.php";
require_once "controladores/insumos.controlador.php";
require_once "controladores/materiales.controlador.php";
require_once "controladores/tipoproducto.controlador.php";
require_once "controladores/productos.controlador.php";
require_once "controladores/maquinas.controlador.php";
require_once "controladores/empleados.controlador.php";
require_once "controladores/tipocosto.controlador.php";
require_once "controladores/tipodocumento.controlador.php";
require_once "controladores/gastoadmin.controlador.php";
require_once "controladores/costoventa.controlador.php";
require_once "controladores/costomarketing.controlador.php";
require_once "controladores/costooperativo.controlador.php";
require_once "controladores/inventarioinsumos.controlador.php";
require_once "controladores/kardexinsumos.controlador.php";
require_once "controladores/configuracion.controlador.php";

require_once "modelos/usuarios.modelo.php";
require_once "modelos/marcas.modelo.php";
require_once "modelos/unidadmedida.modelo.php";
require_once "modelos/insumos.modelo.php";
require_once "modelos/materiales.modelo.php";
require_once "modelos/tipoproducto.modelo.php";
require_once "modelos/productos.modelo.php";
require_once "modelos/maquinas.modelo.php";
require_once "modelos/empleados.modelo.php";
require_once "modelos/tipocosto.modelo.php";
require_once "modelos/tipodocumento.modelo.php";
require_once "modelos/gastoadmin.modelo.php";
require_once "modelos/costoventa.modelo.php";
require_once "modelos/costomarketing.modelo.php";
require_once "modelos/costooperativo.modelo.php";
require_once "modelos/inventarioinsumos.modelo.php";
require_once "modelos/kardexinsumos.modelo.php";
require_once "modelos/configuracion.modelo.php";

$plantilla = new ControladorPlantilla();
$plantilla -> ctrPlantilla();