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

      <table class="table table-bordered table-striped dt-responsive tablaUsuarios" width="100%">
       
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

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" onsubmit="return validarModulos();">

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

        <ul class="nav nav-tabs">
            <li class="nav-item">
              <a class="nav-link active" id="navDatos" type="button">Datos</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="navPermisos" type="button">Permisos</a>
            </li>
        </ul>
        <div class="collapse show" id="panelDatos">

          <input type="hidden" id="idUsuario" name="idUsuario">
          <div class="row">
          <!-- ENTRADA PARA EL NOMBRE -->
          <div class="form-group col-sm">
          <label for="nombre">Nombre</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevoNombre" name="nuevoNombre" placeholder="Ingresar nombre"
                 maxlength="50"  pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ ]+" title="Solo se aceptan letras" required>
            </div>
          </div>

          <!-- ENTRADA PARA EL USUARIO -->
          <div class="form-group col-sm">
          <label for="usuario">Usuario</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevoUsuario" name="nuevoUsuario" placeholder="Ingresar usuario" 
                 maxlength="50" pattern="[a-z0-9ñáéíóú ]+" title="Solo letras minúsculas y números sin espacios" id="nuevoUsuario" required>
            </div>

          </div>
          </div>

          <div class="row">
          <!-- ENTRADA PARA LA CONTRASEÑA -->
           <div class="form-group col-sm">
           <label for="contraseña">Contraseña</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                </div>

              <input type="password" class="form-control input-lg" id="nuevoPassword"  name="nuevoPassword" placeholder="Ingresar contraseña" 
               maxlength="50" required>

            </div>

           </div>

          <!-- ENTRADA PARA SELECCIONAR SU PERFIL -->
          <div class="form-group col-sm">
          <label for="perfil">Perfil</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-users"></i></span>
                </div>

                <select class="form-control input-lg" id="nuevoPerfil" name="nuevoPerfil" required>
                
                <option value="">Selecionar perfil</option>

                <option value="Administrador">Administrador</option>

                <option value="Especial">Especial</option>

                <option value="Vendedor">Vendedor</option>

              </select>

            </div>

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
        <div class="collapse" id="panelPermisos">

        <div class="card">

        <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#pInicio">
        <i class="fas fa-users"></i> DashBoard
        </a>
        <div id="pInicio" class="collapse">
            <div class="card-body">
              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cInicio" value="1" name="checkListPermisos[]">
                  <label for="cInicio"> Dashboard</label>
              </div>
            </div>
        </div>
          
        <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#pRegistro">
        <i class="fas fa-users"></i> Registro
        </a>
          
        <div id="pRegistro" class="collapse">
            <div class="card-body">
             
              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cInsumos" value="2" name="checkListPermisos[]">
                  <label for="cInsumos">Insumos</label>
              </div>
              
              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cMateriales" value="3" name="checkListPermisos[]">
                  <label for="cMateriales">Materiales</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cMarcas" value="4" name="checkListPermisos[]">
                  <label for="cMarcas">Marcas</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cProductos" value="5" name="checkListPermisos[]">
                  <label for="cProductos">Productos</label>
              </div>
              
              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cMaquinas" value="6" name="checkListPermisos[]">
                  <label for="cMaquinas">Maquinas</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cEmpleados" value="7" name="checkListPermisos[]">
                  <label for="cEmpleados">Empleados</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cGastoAdmin" value="8" name="checkListPermisos[]">
                  <label for="cGastoAdmin">Gasto Administrativo</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cCostoVenta" value="9" name="checkListPermisos[]">
                  <label for="cCostoVenta">Costo de Venta</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cCostoMarketing" value="10" name="checkListPermisos[]">
                  <label for="cCostoMarketing">Costo de Marketing</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cCostoOperativo" value="11" name="checkListPermisos[]">
                  <label for="cCostoOperativo">Costo Operativo</label>
              </div>

            </div>
        </div>
        </div>


        </div>


        </div>

      </div>

      <!--=====================================
      PIE DEL MODAL
      ======================================-->

      <div class="modal-footer">

        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

        <button type="submit" class="btn btn-primary guardarUsuario">Guardar usuario</button>

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
  
  <div class="modal-dialog modal-lg">

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
            <label for="nombre">Nombre</label>
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
           <label for="usuario">Usuario</label>
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
            <label for="contraseña">Contraseña</label>
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
          <label for="perfil">Perfil</label>
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