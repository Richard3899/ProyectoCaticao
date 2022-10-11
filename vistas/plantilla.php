<!DOCTYPE html>
<html lang="en">

<?php 

  include "modulos/head.php";
 
?> 
<body class="hold-transition sidebar-mini login-page">

  <?php 

  if(isset($_SESSION["iniciarSesion"]) && $_SESSION["iniciarSesion"] == "ok"){
  
  echo '<div class="wrapper">';

    include "modulos/nav.php";

    include "modulos/sidebar.php";

    if(isset($_GET["ruta"])){
      if($_GET["ruta"]=="usuarios" || 
         $_GET["ruta"]=="contenido"){

        include "modulos/".$_GET["ruta"].".php";

      }else{
        include "modulos/404.php";
      }
    }else{
      include "modulos/contenido.php";
    }
  
    include "modulos/footer.php"; 

    echo '</div>';
  }else{

    include "modulos/login.php";

  }

  ?>


</body>
</html>
