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

    <form role="form" method="post" autocomplete="off" enctype="multipart/form-data" onsubmit="return validarModulos();">

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

              <input type="text" class="form-control input-lg" id="nuevoPassword"  name="nuevoPassword" placeholder="Ingresar contraseña" 
               maxlength="50" required>

            </div>

           </div>

          <!-- ENTRADA PARA SELECCIONAR SU PERFIL -->
          <div class="form-group col-sm">
          <label for="perfil">Perfil</label>
          <div class="input-group">
            
            <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-ruler"></i></span>
            </div>

            <select class="form-control input-lg" id="nuevoidPerfil" name="nuevoidPerfil" required>
            
            <option value="">Seleccionar Perfil</option>

            <?php

            $item = null;
            $valor = null;

            $perfil = ControladorPerfiles::ctrMostrarPerfiles($item,$valor);

            foreach($perfil as $key=> $value){ 
              echo '<option value="'.$value["idPerfil"].'">'.$value["descripcion"].'</option>';
            }

            ?>

          </select>

          </div>

          </div>

          </div>
          <!-- ENTRADA PARA SUBIR FOTO -->

           <div class="form-group">
            <div class="card">
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Subir Foto</li>
                <li class="list-group-item"><input type="file" class="btn btn-primary nuevaFoto" name="nuevaFoto"></li>
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
                  <input class="checkModulos" type="checkbox" value="1" id="cbInicio" name="checkListPermisos[]">
                  <label for="cbInicio"> Dashboard</label>
              </div>
            </div>
        </div>
          
        <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#pRegistro">
        <i class="fas fa-users"></i> Registro
        </a>
          
        <div id="pRegistro" class="collapse">
            <div class="card-body">
             
              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbInsumos" value="2" name="checkListPermisos[]">
                  <label for="cbInsumos">Insumos</label>
              </div>
              
              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbMateriales" value="3" name="checkListPermisos[]">
                  <label for="cbMateriales">Materiales</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbMarcas" value="4" name="checkListPermisos[]">
                  <label for="cbMarcas">Marcas</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbProductos" value="5" name="checkListPermisos[]">
                  <label for="cbProductos">Productos</label>
              </div>
              
              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbMaquinas" value="6" name="checkListPermisos[]">
                  <label for="cbMaquinas">Maquinas</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbEmpleados" value="7" name="checkListPermisos[]">
                  <label for="cbEmpleados">Empleados</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbGastoAdmin" value="8" name="checkListPermisos[]">
                  <label for="cbGastoAdmin">Gasto Administrativo</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbCostoVenta" value="9" name="checkListPermisos[]">
                  <label for="cbCostoVenta">Costo de Venta</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbCostoMarketing" value="10" name="checkListPermisos[]">
                  <label for="cbCostoMarketing">Costo de Marketing</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbCostoOperativo" value="11" name="checkListPermisos[]">
                  <label for="cbCostoOperativo">Costo Operativo</label>
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

        <button type="submit" class="btn btn-primary" id="guardarUsuario">Guardar usuario</button>

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

      <form role="form" method="post" autocomplete="off" enctype="multipart/form-data" onsubmit="return editarValidarModulos();">

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

          <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" id="navDatosEditar" type="button">Datos del Usuario</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="navPermisosEditar" type="button">Modulos y Permisos</a>
              </li>
          </ul>

          <div class="collapse show" id="editarPanelDatos">
           <div class="row">
            <!-- ENTRADA PARA EL NOMBRE -->                   
            <div class="form-group col-sm">
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
           <div class="form-group col-sm">
            <input type="hidden" id="editaridUsuario" name="editaridUsuario">
           <label for="usuario">Usuario</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="editarUsuario" name="editarUsuario" value="" 
                maxlength="50" pattern="[a-z0-9ñáéíóú ]+" title="Solo letras minúsculas y números sin espacios" readonly>
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

                <input type="text" class="form-control input-lg" name="editarPassword" placeholder="Escriba la nueva contraseña">

                <input type="hidden" id="passwordActual" name="passwordActual">

            </div>

            </div>

          <!-- ENTRADA PARA SELECCIONAR SU PERFIL -->
          <div class="form-group col-sm">
          <label for="perfil">Perfil</label>
            <div class="input-group">
            
            <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-ruler"></i></span>
            </div>

            <select class="form-control input-lg" id="editaridPerfil" name="editaridPerfil" required>
            
            <option value="">Seleccionar Perfil</option>

            <?php 
            $item = null;
            $valor = null;
            $perfil = ControladorPerfiles::ctrMostrarPerfiles($item,$valor);

            foreach($perfil as $key=> $value){
              echo '<option value="'.$value["idPerfil"].'">'.$value["descripcion"].'</option>';
            }

            ?>

          </select>

          </div>
          </div>
          </div>
          <!-- ENTRADA PARA SUBIR FOTO -->

           <div class="form-group">
            <div class="card">
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Subir Foto</li>
                <li class="list-group-item"><input type="file" class="btn btn-primary nuevaFoto" name="editarFoto"></li>
                <li class="list-group-item"> Peso máximo de la foto 2MB</li>
              </ul>
            </div>
            
            <img src="vistas/img/usuarios/default/usuario.png" class="img-thumbnail previsualizar" width="100px">
            <input type="hidden" name="fotoActual" id="fotoActual">
          </div>

          </div>

          <div class="collapse" id="editarPanelPermisos">
            <input type="hidden" id="editarCheckBox" name="editarCheckBox" value="<?php $_SESSION["idModulos"] ?>">
            <div class="card">

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#editarpInicio">
            <i class="fas fa-tachometer-alt px-2"></i> DashBoard
            </a>
            <div id="editarpInicio" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="inicio" value="1" name="editarCheckListPermisos[]">
                      <label for="inicio"> Dashboard</label>
                  </div>
                </div>
            </div>
              
            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#editarpRegistro">
            <i class="fas fa-pen px-2"></i> Registro
            </a>
              
            <div id="editarpRegistro" class="collapse">
                <div class="card-body">
                
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="insumos" value="2" name="editarCheckListPermisos[]">
                      <label for="insumos">Insumos</label>
                  </div>
                  
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="materiales" value="3" name="editarCheckListPermisos[]">
                      <label for="materiales">Materiales</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="marcas" value="4" name="editarCheckListPermisos[]">
                      <label for="marcas">Marcas</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="productos" value="5" name="editarCheckListPermisos[]">
                      <label for="productos">Productos</label>
                  </div>
                  
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="maquinas" value="6" name="editarCheckListPermisos[]">
                      <label for="maquinas">Maquinas</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="empleados" value="7" name="editarCheckListPermisos[]">
                      <label for="empleados">Empleados</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="gastoadmin" value="8" name="editarCheckListPermisos[]">
                      <label for="gastoadmin">Gasto Administrativo</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="costoventa" value="9" name="editarCheckListPermisos[]">
                      <label for="costoventa">Costo de Venta</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="costomarketing" value="10" name="editarCheckListPermisos[]">
                      <label for="costomarketing">Costo de Marketing</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="costooperativo" value="11" name="editarCheckListPermisos[]">
                      <label for="costooperativo">Costo Operativo</label>
                  </div>

                </div>
              </div>

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#editarpInventario">
            <i class="fas fa-box px-2"></i> Inventario
            </a>
            <div id="editarpInventario" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="inventarioinsumos" value="12" name="editarCheckListPermisos[]">
                      <label for="inventarioinsumos">Inventario Insumos</label>
                  </div>
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="inventariomateriales" value="13" name="editarCheckListPermisos[]">
                      <label for="inventariomateriales">Inventario Materiales</label>
                  </div>
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="inventarioproductos" value="14" name="editarCheckListPermisos[]">
                      <label for="inventarioproductos">Inventario Productos</label>
                  </div>
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="inventariomaquinas" value="15" name="editarCheckListPermisos[]">
                      <label for="inventariomaquinas">Inventario Maquinas</label>
                  </div>                 
                </div>
            </div>

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#editarpOperaciones">
            <i class="fas fa-receipt px-2"></i> Operaciones
            </a>
            <div id="editarpOperaciones" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="recetas" value="16" name="editarCheckListPermisos[]">
                      <label for="recetas">Receta</label>
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

          <button type="submit" class="btn btn-primary" id="modificarUsuario">Editar usuario</button>

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