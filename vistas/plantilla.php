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


  $item = null;
  $valor = null;

  $configuracion = ControladorConfiguracion::ctrMostrarConfiguracion($item, $valor);

  foreach ($configuracion as $key => $value){

    if($value["modoDark"] == 1 && $value["contraerBarraLateral"]==1 && $value["ocultarBarraLateral"]==1 ){
    
      echo '<body class="hold-transition skin-blue dark-mode sidebar-collapse layout-fixed">';
    
    }else if($value["modoDark"] == 0 && $value["contraerBarraLateral"]==1 && $value["ocultarBarraLateral"]==1 ){
    
      echo '<body class="hold-transition skin-blue sidebar-collapse layout-fixed">';
    
    }else if($value["modoDark"] == 0 && $value["contraerBarraLateral"]==0 && $value["ocultarBarraLateral"]==1 ){
    
      echo '<body class="hold-transition skin-blue layout-fixed">';
    
    }else if($value["modoDark"] == 1 && $value["contraerBarraLateral"]==1 && $value["ocultarBarraLateral"]==0){
    
      echo '<body class="hold-transition skin-blue sidebar-mini-xs dark-mode sidebar-collapse layout-fixed">';
    
    }else if($value["modoDark"] == 1 && $value["contraerBarraLateral"]==0 && $value["ocultarBarraLateral"]==0){
    
      echo '<body class="hold-transition skin-blue sidebar-mini-xs dark-mode layout-fixed">';
    
    }else if($value["modoDark"] == 0 && $value["contraerBarraLateral"]==1 && $value["ocultarBarraLateral"]==0){
    
      echo '<body class="hold-transition skin-blue sidebar-mini-xs sidebar-collapse layout-fixed">';

    }else if($value["modoDark"] == 1 && $value["contraerBarraLateral"]==0 && $value["ocultarBarraLateral"]==1){
    
      echo '<body class="hold-transition skin-blue dark-mode layout-fixed">';
    };
  } 
  

    if(isset($_SESSION["iniciarSesion"]) && $_SESSION["iniciarSesion"] == "ok"){


      $arrayidModulos = array();
      $arrayDescripcionModulos = array();
    
      $modulos = ModeloUsuariosModulos::mdlMostrarUsuariosModulos($_SESSION["idUsuario"]);
          
      foreach($modulos as $value){ 
    
      array_push($arrayidModulos, $value["idModulo"]);
      array_push($arrayDescripcionModulos, $value["descripcion"]);
          
      }

      echo '<div class="wrapper">';
   
       include "modulos/nav.php";
    
       include "modulos/sidebar.php";
   
       if(isset($_GET["ruta"])){

        if(count($arrayidModulos)!=0){

         if(in_array($_GET["ruta"], $arrayDescripcionModulos)){
   
             include "modulos/".$_GET["ruta"].".php";
             
         }else{
   
             include "modulos/bienvenida.php";
   
         }
        }else{

          include "modulos/salir.php";
      
        }
   
       }else{
   
          include "modulos/bienvenida.php";
   
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
<script src="vistas/js/loteproductos.js"></script>
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
<script src="vistas/js/recetacostooperativo.js"></script>
<script src="vistas/js/costoreceta.js"></script>
<script src="vistas/js/costototal.js"></script>
<script src="vistas/js/costorecetasgastoadmin.js"></script>
<script src="vistas/js/gastoadminpormes.js"></script>
<script src="vistas/js/costototalpormes.js"></script>
<script src="vistas/js/reporteinsumos.js"></script>
<script src="vistas/js/reportemateriales.js"></script>
<script src="vistas/js/reporteproductos.js"></script>
<script src="vistas/js/reporterecetas.js"></script>
<script src="vistas/js/dashboard.js"></script>
<script src="vistas/js/asignacionadicionales.js"></script>
<script src="vistas/js/backup.js"></script>


</body>

</html>
