<?php

foreach ($configuracion as $key => $value){

      if($value["mododark"] == 0){

        echo '<nav class="main-header navbar navbar-expand navbar-dark navbar-light">';

      }else{

        echo '<nav class="main-header navbar navbar-expand navbar-white navbar-light">';

      };
}

?>
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    <div class="navbar-custom-menu ml-auto">
        <ul class="nav navbar-nav">
          <div class="dropdown">
          <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <?php

              if($_SESSION["foto"] != ""){

                echo '<img src="'.$_SESSION["foto"].'" width="30px" class="user-image">';

              }else{


                echo '<img src="vistas/img/usuarios/default/usuario.png" width="30px" class="user-image">';

              }

              foreach ($configuracion as $key => $value){

                if($value["mododark"] == 0){
          
                  echo '<span class="hidden-xs text-white m-1">'.$_SESSION["nombre"].'</span>';
          
                }else{
          
                  echo '<span class="hidden-xs m-1">'.$_SESSION["nombre"].'</span>';
          
                };
          }

              ?>
              
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <button class="dropdown-item btnCerrarSesion" type="button">Salir</button>
          </div>
        </div>
        </ul>
    </div>

</nav>
<!-- /.navbar -->