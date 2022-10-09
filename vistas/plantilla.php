<!DOCTYPE html>
<html lang="en">

<?php 

  include "modulos/head.php";
 
?> 
<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
  
  <?php 

    include "modulos/nav.php";

    include "modulos/sidebar.php";

    if(isset($_GET["ruta"])){
      if($_GET["ruta"]=="usuarios" || 
         $_GET["ruta"]=="contenido"){

        include "modulos/".$_GET["ruta"].".php";

      }
    }
  
    include "modulos/footer.php"; 

  ?>

  </div>
<!-- ./wrapper -->
</body>
</html>
