<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Administrador de Usuarios</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Administrador de Usuarios</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content">
    <!-- Default box -->
    <div class="card">
      <div class="card-header">
      
      <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarUsuario">
        
        Agregar Usuario

      </button>
        
        
      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablas" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:10px">#</th>
         <th>Nombre</th>
         <th>Usuario</th>
         <th>Foto</th>
         <th>Perfil</th>
         <th>Estado</th>
         <th>Último login</th>
         <th>Acciones</th>

       </tr> 

      </thead>

      <tbody>
        
      <?php

      $item = null;
      $valor = null;

      $usuarios = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

      foreach ($usuarios as $key => $value){
      
        echo ' <tr>
                <td>'.$value["idUsuario"].'</td>
                <td>'.$value["nombre"].'</td>
                <td>'.$value["usuario"].'</td>';

                if($value["foto"] != ""){

                  echo '<td><img src="'.$value["foto"].'" class="img-thumbnail" width="40px"></td>';

                }else{

                  echo '<td><img src="vistas/img/usuarios/default/usuario.png" class="img-thumbnail" width="40px"></td>';

                }

                echo '<td>'.$value["perfil"].'</td>';

                if($value["estado"] != 0){

                  echo '<td><button class="btn btn-success btn-xs btnActivar" idUsuario="'.$value["idUsuario"].'" estadoUsuario="0">Activado</button></td>';

                }else{

                  echo '<td><button class="btn btn-danger btn-xs btnActivar" idUsuario="'.$value["idUsuario"].'" estadoUsuario="1">Desactivado</button></td>';

                }
                if($value["ultimo_login"] != ""){   
                  echo '<td>'.$value["ultimo_login"].'</td>';
                }else{

                  echo '<td>Aun no inicia sesión</td>';

                }

                
                echo '<td>

                  <div class="btn-group">
                      
                    <button class="btn btn-warning btnEditarUsuario" idUsuario="'.$value["idUsuario"].'" data-toggle="modal" data-target="#modalEditarUsuario"><i class="fa fa-pen"></i></button>

                    <button class="btn btn-danger btnEliminarUsuario" idUsuario="'.$value["idUsuario"].'" fotoUsuario="'.$value["foto"].'" usuario="'.$value["usuario"].'"><i class="fa fa-times"></i></button>

                  </div>  

                </td>

              </tr>';
      }


      ?>

      </tbody>

     </table>
        

      </div>
      <!-- /.card-body -->
    </div>
    <!-- /.card -->
  </section>
  <!-- /.content -->
  </div>
</div>
<!-- /.content-wrapper -->





<!--=====================================
MODAL AGREGAR USUARIO
======================================-->

<div id="modalAgregarUsuario" class="modal fade" role="dialog">

<div class="modal-dialog">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Agregar usuario</h4>
      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <!-- ENTRADA PARA EL NOMBRE -->
          

          <div class="form-group">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevoNombre" placeholder="Ingresar nombre"
                 maxlength="50"  pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ ]+" title="Solo se aceptan letras" required>
            </div>

          </div>

          <!-- ENTRADA PARA EL USUARIO -->

          <div class="form-group">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevoUsuario" placeholder="Ingresar usuario" 
                 maxlength="50" pattern="[a-z0-9ñáéíóú ]+" title="Solo letras minúsculas y números sin espacios" id="nuevoUsuario" required>
            </div>

          </div>

          <!-- ENTRADA PARA LA CONTRASEÑA -->

           <div class="form-group">
            
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                </div>

              <input type="password" class="form-control input-lg" name="nuevoPassword" placeholder="Ingresar contraseña" 
               maxlength="50" required>

            </div>

          </div>

          <!-- ENTRADA PARA SELECCIONAR SU PERFIL -->

          <div class="form-group">
            
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-users"></i></span>
                </div>

                <select class="form-control input-lg" name="nuevoPerfil" required>
                
                <option value="">Selecionar perfil</option>

                <option value="Administrador">Administrador</option>

                <option value="Especial">Especial</option>

                <option value="Vendedor">Vendedor</option>

              </select>

            </div>

          </div>

          <!-- ENTRADA PARA SUBIR FOTO -->

           <div class="form-group">
            <div class="card">
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Subir Foto</li>
                <li class="list-group-item"><input type="file" class=" btn btn-primary nuevaFoto" name="nuevaFoto"></li>
                <li class="list-group-item"> Peso máximo de la foto 2MB</li>
              </ul>
            </div>

            <img src="vistas/img/usuarios/default/usuario.png" class="img-thumbnail previsualizar" width="100px">

          </div>

        </div>

      </div>

      <!--=====================================
      PIE DEL MODAL
      ======================================-->

      <div class="modal-footer">

        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

        <button type="submit" class="btn btn-primary">Guardar usuario</button>

      </div>

      <?php

          $crearUsuario = new ControladorUsuarios();
          $crearUsuario -> ctrCrearUsuario();

      ?>


    </form>

  </div>

</div>

</div>


<!--=====================================
MODAL EDITAR USUARIO
======================================-->

<div id="modalEditarUsuario" class="modal fade" role="dialog">
  
  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:gray; color:white">

        <h4 class="modal-title">Editar usuario</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">


            <!-- ENTRADA PARA EL NOMBRE -->
                      

            <div class="form-group">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="editarNombre" name="editarNombre" value=""
                 maxlength="50"  pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ ]+" title="Solo se aceptan letras" required>
            </div>

          </div>

          <!-- ENTRADA PARA EL USUARIO -->

           <div class="form-group">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="editarUsuario" name="editarUsuario" value="" 
                maxlength="50" pattern="[a-z0-9ñáéíóú ]+" title="Solo letras minúsculas y números sin espacios" readonly>
            </div>

          </div>


          <!-- ENTRADA PARA LA CONTRASEÑA -->

            <div class="form-group">
            
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                </div>

                <input type="password" class="form-control input-lg" name="editarPassword" placeholder="Escriba la nueva contraseña">

                <input type="hidden" id="passwordActual" name="passwordActual">

            </div>

            </div>

          <!-- ENTRADA PARA SELECCIONAR SU PERFIL -->

          <div class="form-group">
            
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-users"></i></span>
                </div>

                <select class="form-control input-lg" name="editarPerfil">
                  
                <option value="" id="editarPerfil">Seleccionar Perfil</option>

                <option value="Administrador">Administrador</option>

                <option value="Especial">Especial</option>

                <option value="Vendedor">Vendedor</option>

              </select>

            </div>

          </div>

          <!-- ENTRADA PARA SUBIR FOTO -->

           <div class="form-group">
            <div class="card">
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Subir Foto</li>
                <li class="list-group-item"><input type="file" class="nuevaFoto" name="editarFoto"></li>
                <li class="list-group-item"> Peso máximo de la foto 2MB</li>
              </ul>
            </div>
            
            <img src="vistas/img/usuarios/default/usuario.png" class="img-thumbnail previsualizar" width="100px">
            <input type="hidden" name="fotoActual" id="fotoActual">
          </div>

        </div>

      </div>


        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Editar usuario</button>

        </div>

     <?php

          $editarUsuario = new ControladorUsuarios();
          $editarUsuario -> ctrEditarUsuario();

        ?> 

      </form>

    </div>

  </div>

</div>

<?php

  $borrarUsuario = new ControladorUsuarios();
  $borrarUsuario -> ctrBorrarUsuario();

?> 