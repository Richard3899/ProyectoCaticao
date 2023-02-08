<?php 

require_once "controladores/plantilla.controlador.php";

require_once "controladores/usuarios.controlador.php";
require_once "controladores/perfiles.controlador.php";
require_once "controladores/configuracion.controlador.php";
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
require_once "controladores/inventariomateriales.controlador.php";
require_once "controladores/kardexmateriales.controlador.php";
require_once "controladores/inventarioproductos.controlador.php";
require_once "controladores/kardexproductos.controlador.php";
require_once "controladores/inventariomaquinas.controlador.php";
require_once "controladores/kardexmaquinas.controlador.php";
require_once "controladores/recetas.controlador.php";
require_once "controladores/estados.controlador.php";
require_once "controladores/lotes.controlador.php";
require_once "controladores/recetainsumos.controlador.php";
require_once "controladores/recetamateriales.controlador.php";
require_once "controladores/recetamanodeobra.controlador.php";
require_once "controladores/recetadepreciacion.controlador.php";
require_once "controladores/recetaconsumoenergia.controlador.php";
require_once "controladores/recetaconsumogas.controlador.php";
require_once "controladores/recetacostoventa.controlador.php";
require_once "controladores/recetacostomarketing.controlador.php";
require_once "controladores/recetacostooperativo.controlador.php";
require_once "controladores/costorecetasgastoadmin.controlador.php";
require_once "controladores/gastoadminpormes.controlador.php";
require_once "controladores/costototalpormes.controlador.php";
require_once "controladores/reporteinsumos.controlador.php";
require_once "controladores/reportemateriales.controlador.php";
require_once "controladores/reporteproductos.controlador.php";
require_once "controladores/dashboard.controlador.php";


require_once "modelos/dashboard.modelo.php";
require_once "modelos/usuarios.modelo.php";
require_once "modelos/usuariosmodulos.modelo.php";
require_once "modelos/perfiles.modelo.php";
require_once "modelos/configuracion.modelo.php";
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
require_once "modelos/inventariomateriales.modelo.php";
require_once "modelos/kardexmateriales.modelo.php";
require_once "modelos/inventarioproductos.modelo.php";
require_once "modelos/kardexproductos.modelo.php";
require_once "modelos/inventariomaquinas.modelo.php";
require_once "modelos/kardexmaquinas.modelo.php";
require_once "modelos/recetas.modelo.php";
require_once "modelos/estados.modelo.php";
require_once "modelos/lotes.modelo.php";
require_once "modelos/recetainsumos.modelo.php";
require_once "modelos/recetamateriales.modelo.php";
require_once "modelos/recetamanodeobra.modelo.php";
require_once "modelos/recetadepreciacion.modelo.php";
require_once "modelos/recetaconsumoenergia.modelo.php";
require_once "modelos/recetaconsumogas.modelo.php";
require_once "modelos/recetacostoventa.modelo.php";
require_once "modelos/recetacostomarketing.modelo.php";
require_once "modelos/recetacostooperativo.modelo.php";
require_once "modelos/costorecetasgastoadmin.modelo.php";
require_once "modelos/gastoadminpormes.modelo.php";
require_once "modelos/costototalpormes.modelo.php";
require_once "modelos/reporteinsumos.modelo.php";
require_once "modelos/reportemateriales.modelo.php";
require_once "modelos/reporteproductos.modelo.php";
require_once "modelos/dashboard.modelo.php";


$plantilla = new ControladorPlantilla();
$plantilla -> ctrPlantilla();