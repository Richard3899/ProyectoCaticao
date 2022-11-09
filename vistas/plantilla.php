<?php 
session_start();
?>

<!DOCTYPE html>
<html lang="es">

<?php 

  include "modulos/head.php";
 
?> 


<body class="hold-transition skin-blue sidebar-mini dark-mode">
 
  <?php

  if(isset($_SESSION["iniciarSesion"]) && $_SESSION["iniciarSesion"] == "ok"){

   echo '<div class="wrapper">';

 

    include "modulos/nav.php";

 

    include "modulos/sidebar.php";



    if(isset($_GET["ruta"])){

      if($_GET["ruta"] == "inicio" ||
         $_GET["ruta"] == "usuarios" ||
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

</body>

</html>
