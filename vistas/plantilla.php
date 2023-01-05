<?php 
session_start();
?>

<!DOCTYPE html>
<html lang="es">

<?php 

  if(isset($_GET["ruta"])){
    $url=$_GET["ruta"];
  }; 

  include "modulos/head.php";
 
?> 

<?php

$item = null;
$valor = null;

$configuracion = ControladorConfiguracion::ctrMostrarConfiguracion($item, $valor);

foreach ($configuracion as $key => $value){

  if($value["modoDark"] == 1 && $value["contraerBarraLateral"]==1 && $value["ocultarBarraLateral"]==1 ){
  
    echo '<body class="hold-transition skin-blue dark-mode sidebar-collapse">';
  
  }else if($value["modoDark"] == 0 && $value["contraerBarraLateral"]==1 && $value["ocultarBarraLateral"]==1 ){
  
    echo '<body class="hold-transition skin-blue sidebar-collapse">';
  
  }else if($value["modoDark"] == 0 && $value["contraerBarraLateral"]==0 && $value["ocultarBarraLateral"]==1 ){
  
    echo '<body class="hold-transition skin-blue">';
  
  }else if($value["modoDark"] == 1 && $value["contraerBarraLateral"]==1 && $value["ocultarBarraLateral"]==0){
  
  echo '<body class="hold-transition skin-blue sidebar-mini-xs dark-mode sidebar-collapse">';
  
  }else if($value["modoDark"] == 1 && $value["contraerBarraLateral"]==0 && $value["ocultarBarraLateral"]==0){
  
  echo '<body class="hold-transition skin-blue sidebar-mini-xs dark-mode">';
  
  }else if($value["modoDark"] == 0 && $value["contraerBarraLateral"]==1 && $value["ocultarBarraLateral"]==0){
  
    echo '<body class="hold-transition skin-blue sidebar-mini-xs sidebar-collapse">';

  }else if($value["modoDark"] == 1 && $value["contraerBarraLateral"]==0 && $value["ocultarBarraLateral"]==1){
  
    echo '<body class="hold-transition skin-blue dark-mode">';
  };
} 
  

  if(isset($_SESSION["iniciarSesion"]) && $_SESSION["iniciarSesion"] == "ok"){

   echo '<div class="wrapper">';

    include "modulos/nav.php";
 
    include "modulos/sidebar.php";

    if(isset($_GET["ruta"])){

      if($_GET["ruta"] == "inicio" ||
         $_GET["ruta"] == "usuarios" ||
         $_GET["ruta"] == "configuracion" ||
         $_GET["ruta"] == "productos" ||
         $_GET["ruta"] == "insumos" ||
         $_GET["ruta"] == "marcas" ||
         $_GET["ruta"] == "materiales" ||
         $_GET["ruta"] == "maquinas" ||
         $_GET["ruta"] == "empleados" ||
         $_GET["ruta"] == "gastoadmin" ||
         $_GET["ruta"] == "costoventa" ||
         $_GET["ruta"] == "costomarketing" ||
         $_GET["ruta"] == "costooperativo" ||
         $_GET["ruta"] == "inventarioinsumos" ||
         $_GET["ruta"] == "kardexinsumos" ||
         $_GET["ruta"] == "inventariomateriales" ||
         $_GET["ruta"] == "kardexmateriales" ||
         $_GET["ruta"] == "inventarioproductos" ||
         $_GET["ruta"] == "kardexproductos" ||
         $_GET["ruta"] == "inventariomaquinas" ||
         $_GET["ruta"] == "kardexmaquinas" ||
         $_GET["ruta"] == "recetas" ||
         $_GET["ruta"] == "recetainsumos" ||
         $_GET["ruta"] == "recetamateriales" ||
         $_GET["ruta"] == "recetamanodeobra" ||
         $_GET["ruta"] == "recetadepreciacion" ||
         $_GET["ruta"] == "recetaconsumoenergia" ||
         $_GET["ruta"] == "recetaconsumogas" ||
         $_GET["ruta"] == "recetacostoventa" ||
         $_GET["ruta"] == "recetacostomarketing" ||
         $_GET["ruta"] == "salir"){

        include "modulos/".$_GET["ruta"].".php";

      }else{

        include "modulos/404.php";

      }

    }else{

      include "modulos/inicio.php";

    }

    include "modulos/footer.php";

    echo '</div>';

  }else{

    include "modulos/login.php";

  }

  ?>

<script src="vistas/js/plantilla.js"></script>
<script src="vistas/js/usuarios.js"></script>
<script src="vistas/js/configuracion.js"></script>
<script src="vistas/js/productos.js"></script>
<script src="vistas/js/insumos.js"></script>
<script src="vistas/js/materiales.js"></script>
<script src="vistas/js/marcas.js"></script>
<script src="vistas/js/maquinas.js"></script>
<script src="vistas/js/empleados.js"></script>
<script src="vistas/js/gastoadmin.js"></script>
<script src="vistas/js/costoventa.js"></script>
<script src="vistas/js/costomarketing.js"></script>
<script src="vistas/js/costooperativo.js"></script>
<script src="vistas/js/inventarioinsumos.js"></script>
<script src="vistas/js/kardexinsumos.js"></script>
<script src="vistas/js/inventariomateriales.js"></script>
<script src="vistas/js/kardexmateriales.js"></script>
<script src="vistas/js/inventarioproductos.js"></script>
<script src="vistas/js/kardexproductos.js"></script>
<script src="vistas/js/inventariomaquinas.js"></script>
<script src="vistas/js/kardexmaquinas.js"></script>
<script src="vistas/js/recetas.js"></script>
<script src="vistas/js/recetainsumos.js"></script>
<script src="vistas/js/recetamateriales.js"></script>
<script src="vistas/js/recetamanodeobra.js"></script>
<script src="vistas/js/recetadepreciacion.js"></script>
<script src="vistas/js/recetaconsumoenergia.js"></script>
<script src="vistas/js/recetaconsumogas.js"></script>
<script src="vistas/js/recetacostoventa.js"></script>
<script src="vistas/js/recetacostomarketing.js"></script>

</body>

</html>
