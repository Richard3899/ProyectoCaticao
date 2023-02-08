<nav class="main-header navbar navbar-expand">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
           <?php

            $item = null;
            $valor = null;

            $configuracion = ControladorConfiguracion::ctrMostrarConfiguracion($item, $valor);

            foreach ($configuracion as $key => $value){

                  if($value["contraerBarraLateral"] == 1){

                        echo '<a class="nav-link btnActivarContraerBarraLateral"  idConfiguracion="'.$value["idConfiguracion"].'" contraerbarralateral="0" data-widget="pushmenu" role="button"><i class="fas fa-bars"></i></a>';
                  }else{

                        echo '<a class="nav-link btnActivarContraerBarraLateral"  idConfiguracion="'.$value["idConfiguracion"].'" contraerbarralateral="1" data-widget="pushmenu" role="button"><i class="fas fa-bars"></i></a>';
                  };
            }


            ?>

      </li>
    </ul>

    <div class="navbar-custom-menu ml-auto">
        <ul class="nav navbar-nav">
          <div class="dropdown">
          <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <?php

            $item = "idUsuario";
            $valor = $_SESSION["idUsuario"];
            $usuario = ControladorUsuarios::ctrMostrarUsuarios($item,$valor);

              if($usuario["foto"] != ""){

                echo '<img src="'.$usuario["foto"].'" width="30px" class="user-image">';

              }else{


                echo '<img src="vistas/img/usuarios/default/usuario.png" width="30px" class="user-image">';

              }

              foreach ($configuracion as $key => $value){

                if($value["modoDark"] == 1){
          
                  echo '<span class="hidden-xs text-white m-1">'.$_SESSION["nombre"].'</span>';
          
                }else{
          
                  echo '<span class="hidden-xs m-1">'.$_SESSION["nombre"].'</span>';
          
                };
          }

              ?>
              
          </button>
          <div class="dropdown-menu dropdown-menu-right">
            <button class="dropdown-item btnCerrarSesion" type="button">Salir</button>
          </div>
        </div>
        </ul>
    </div>

</nav>
<!-- /.navbar -->