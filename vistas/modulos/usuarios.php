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

      <?php 
       if($permisoInsertar==1){

       echo "<button class='btn btn-primary' data-toggle='modal' data-target='#modalAgregarUsuario'>
            Agregar Usuario
            </button>";

       }else{

       echo "<button class='btn btn-primary'>Agregar Usuario</button>";

       }
      ?>
        
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
              <a class="nav-link active" id="navDatos" type="button">Datos del Usuario</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="navPermisos" type="button">Modulos y Permisos</a>
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
                  <input class="checkModulos" type="checkbox" id="cbInicio" value="1" name="checkListModulos[]">
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
                  <input class="checkModulos" type="checkbox" id="cbInsumos" value="2" name="checkListModulos[]">
                  <label for="cbInsumos">Insumos</label>
              </div>
              
              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbMateriales" value="3" name="checkListModulos[]">
                  <label for="cbMateriales">Materiales</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbMarcas" value="4" name="checkListModulos[]">
                  <label for="cbMarcas">Marcas</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbProductos" value="5" name="checkListModulos[]">
                  <label for="cbProductos">Productos</label>
              </div>
              
              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbMaquinas" value="6" name="checkListModulos[]">
                  <label for="cbMaquinas">Maquinas</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbEmpleados" value="7" name="checkListModulos[]">
                  <label for="cbEmpleados">Empleados</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbGastoAdmin" value="8" name="checkListModulos[]">
                  <label for="cbGastoAdmin">Gasto Administrativo</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbCostoVenta" value="9" name="checkListModulos[]">
                  <label for="cbCostoVenta">Costo de Venta</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbCostoMarketing" value="10" name="checkListModulos[]">
                  <label for="cbCostoMarketing">Costo de Marketing</label>
              </div>

              <div class="icheck-primary">
                  <input class="checkModulos" type="checkbox" id="cbCostoOperativo" value="11" name="checkListModulos[]">
                  <label for="cbCostoOperativo">Costo Operativo</label>
              </div>

            </div>
          </div>

          <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#pInventario">
            <i class="fas fa-box px-2"></i> Inventario
            </a>
            <div id="pInventario" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbInventarioInsumos" value="12" name="checkListModulos[]">
                      <label for="cbInventarioInsumos">Inventario Insumos</label>
                  </div>
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbInventarioMateriales" value="13" name="checkListModulos[]">
                      <label for="cbInventarioMateriales">Inventario Materiales</label>
                  </div>
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbInventarioProductos" value="14" name="checkListModulos[]">
                      <label for="cbInventarioProductos">Inventario Productos</label>
                  </div>
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbInventarioMaquinas" value="15" name="checkListModulos[]">
                      <label for="cbInventarioMaquinas">Inventario Maquinas</label>
                  </div>                 
                </div>
            </div>

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#pOperaciones">
            <i class="fas fa-receipt px-2"></i> Operaciones
            </a>
            <div id="pOperaciones" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbRecetas" value="16" name="checkListModulos[]">
                      <label for="cbRecetas">Receta</label>
                  </div>                
                </div>
            </div>

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#pCostos">
            <i class="fas fa-money-bill px-2"></i> Costos
            </a>
            <div id="pCostos" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbCostoReceta" value="17" name="checkListModulos[]">
                      <label for="cbCostoReceta">Costo de Receta</label>
                  </div>   
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbCostoRecetasGastoAdmin" value="18" name="checkListModulos[]">
                      <label for="cbCostoRecetasGastoAdmin">C. Receta y G. Admin</label>
                  </div>              
                </div>
            </div>

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#pUsuarios">
            <i class="fas fa-user px-2"></i> Usuarios
            </a>
            <div id="pUsuarios" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbUsuarios" value="19" name="checkListModulos[]">
                      <label for="cbUsuarios">Usuarios</label>
                  </div>            
                </div>
            </div> 

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#pReportes">
            <i class="fas fa-chart-line px-2"></i> Reportes
            </a>
            <div id="pReportes" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbReporteInsumos" value="20" name="checkListModulos[]">
                      <label for="cbReporteInsumos">Reporte de Insumos</label>
                  </div>    
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbReportemateriales" value="21" name="checkListModulos[]">
                      <label for="cbReportemateriales">Reporte de Materiales</label>
                  </div> 
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbReporteProductos" value="22" name="checkListModulos[]">
                      <label for="cbReporteProductos">Reporte de Productos</label>
                  </div>           
                </div>
            </div> 
            
            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#pConfiguracion">
            <i class="fas fa-gear px-2"></i> Configuración
            </a>
            <div id="pConfiguracion" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbConfiguracion" value="23" name="checkListModulos[]">
                      <label for="cbConfiguracion">Configuración</label>
                  </div>            
                </div>
            </div> 

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#pBackup">
            <i class="fas fa-shield-alt px-2"></i> Backup
            </a>
            <div id="pBackup" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="checkModulos" type="checkbox" id="cbBackup" value="28" name="checkListModulos[]">
                      <label for="cbBackup">Backup</label>
                  </div>            
                </div>
            </div>  

            <div class="card-body border border-info rounded">
              <div class="row">
                  <div class="icheck-warning ml-2">
                      <input type="checkbox" id="cbPermisoInsertar" value="1" name="cbPermisoInsertar">
                      <label for="cbPermisoInsertar">Insertar</label>
                  </div>
                  <div class="icheck-warning ml-2">
                      <input type="checkbox" id="cbPermisoEditar" value="1" name="cbPermisoEditar">
                      <label for="cbPermisoEditar">Editar</label>
                  </div>  
                  <div class="icheck-warning ml-2">
                      <input type="checkbox" id="cbPermisoEliminar" value="1" name="cbPermisoEliminar">
                      <label for="cbPermisoEliminar">Eliminar</label>
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
            <input type="hidden" id="editarCheckBox" name="editarCheckBox" value="<?php $arrayidModulos ?>">
            <div class="card">

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#editarpInicio">
            <i class="fas fa-tachometer-alt px-2"></i> DashBoard
            </a>
            <div id="editarpInicio" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="inicio" value="1" name="editarCheckListModulos[]">
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
                      <input class="editarCheckModulos" type="checkbox" id="insumos" value="2" name="editarCheckListModulos[]">
                      <label for="insumos">Insumos</label>
                  </div>
                  
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="materiales" value="3" name="editarCheckListModulos[]">
                      <label for="materiales">Materiales</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="marcas" value="4" name="editarCheckListModulos[]">
                      <label for="marcas">Marcas</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="productos" value="5" name="editarCheckListModulos[]">
                      <label for="productos">Productos</label>
                  </div>
                  
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="maquinas" value="6" name="editarCheckListModulos[]">
                      <label for="maquinas">Maquinas</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="empleados" value="7" name="editarCheckListModulos[]">
                      <label for="empleados">Empleados</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="gastoadmin" value="8" name="editarCheckListModulos[]">
                      <label for="gastoadmin">Gasto Administrativo</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="costoventa" value="9" name="editarCheckListModulos[]">
                      <label for="costoventa">Costo de Venta</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="costomarketing" value="10" name="editarCheckListModulos[]">
                      <label for="costomarketing">Costo de Marketing</label>
                  </div>

                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="costooperativo" value="11" name="editarCheckListModulos[]">
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
                      <input class="editarCheckModulos" type="checkbox" id="inventarioinsumos" value="12" name="editarCheckListModulos[]">
                      <label for="inventarioinsumos">Inventario Insumos</label>
                  </div>
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="inventariomateriales" value="13" name="editarCheckListModulos[]">
                      <label for="inventariomateriales">Inventario Materiales</label>
                  </div>
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="inventarioproductos" value="14" name="editarCheckListModulos[]">
                      <label for="inventarioproductos">Inventario Productos</label>
                  </div>
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="inventariomaquinas" value="15" name="editarCheckListModulos[]">
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
                      <input class="editarCheckModulos" type="checkbox" id="recetas" value="16" name="editarCheckListModulos[]">
                      <label for="recetas">Receta</label>
                  </div>                
                </div>
            </div>

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#editarpCostos">
            <i class="fas fa-money-bill px-2"></i> Costos
            </a>
            <div id="editarpCostos" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="costoreceta" value="17" name="editarCheckListModulos[]">
                      <label for="costoreceta">Costo de Receta</label>
                  </div>   
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="costorecetasgastoadmin" value="18" name="editarCheckListModulos[]">
                      <label for="costorecetasgastoadmin">C. Receta y G. Admin</label>
                  </div>              
                </div>
            </div>

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#editarpUsuarios">
            <i class="fas fa-user px-2"></i> Usuarios
            </a>
            <div id="editarpUsuarios" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="usuarios" value="19" name="editarCheckListModulos[]">
                      <label for="usuarios">Usuarios</label>
                  </div>            
                </div>
            </div> 

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#editarpReportes">
            <i class="fas fa-chart-line px-2"></i> Reportes
            </a>
            <div id="editarpReportes" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="reporteinsumos" value="20" name="editarCheckListModulos[]">
                      <label for="reporteinsumos">Reporte de Insumos</label>
                  </div>    
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="reportemateriales" value="21" name="editarCheckListModulos[]">
                      <label for="reportemateriales">Reporte de Materiales</label>
                  </div> 
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="reporteproductos" value="22" name="editarCheckListModulos[]">
                      <label for="reporteproductos">Reporte de Productos</label>
                  </div>           
                </div>
            </div> 
            
            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#editarpConfiguracion">
            <i class="fas fa-gear px-2"></i> Configuración
            </a>
            <div id="editarpConfiguracion" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="configuracion" value="23" name="editarCheckListModulos[]">
                      <label for="configuracion">Configuración</label>
                  </div>            
                </div>
            </div> 

            <a class="btn btn-outline-primary collapsed my-1 text-left" data-toggle="collapse" data-target="#editarpBackup">
            <i class="fas fa-shield-alt px-2"></i> Backup
            </a>
            <div id="editarpBackup" class="collapse">
                <div class="card-body">
                  <div class="icheck-primary">
                      <input class="editarCheckModulos" type="checkbox" id="backup" value="28" name="editarCheckListModulos[]">
                      <label for="backup">Backup</label>
                  </div>            
                </div>
            </div> 
            
            <div class="card-body border border-info rounded">
              <div class="row">
                  <div class="icheck-warning ml-2">
                      <input type="checkbox" id="editarPermisoInsertar" value="1" name="editarPermisoInsertar">
                      <label for="editarPermisoInsertar">Insertar</label>
                  </div>
                  <div class="icheck-warning ml-2">
                      <input type="checkbox" id="editarPermisoEditar" value="1" name="editarPermisoEditar">
                      <label for="editarPermisoEditar">Editar</label>
                  </div>  
                  <div class="icheck-warning ml-2">
                      <input type="checkbox" id="editarPermisoEliminar" value="1" name="editarPermisoEliminar">
                      <label for="editarPermisoEliminar">Eliminar</label>
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