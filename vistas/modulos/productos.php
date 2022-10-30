<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Administrador de Productos</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Administrador de Productos</li>
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
      
      <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarProducto">
        
        Agregar Producto

      </button>
        
        
      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaProductos" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:10px">#</th>
         <th>Imagen</th>
         <th>Código</th>
         <th>Nombre</th>
         <th>Descripción</th>
         <th>Tipo de Unidad</th>
         <th>Cantidad</th>
         <th>Tipo de Producto</th>
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

<div id="modalAgregarProducto" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Agregar producto</h4>
      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA EL CÓDIGO -->
            <div class="form-group col-sm">
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevoCodigo" placeholder="Ingresar código" maxlength="20" required>
            </div>
            </div>

            <!-- ENTRADA PARA EL NOMBRE -->
            <div class="form-group col-sm">
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevoNombre" placeholder="Ingresar nombre" maxlength="45" required>
            </div>
            </div>

          </div>


          <!-- ENTRADA PARA EL DESCRIPCIÓN -->

           <div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevaDescripcion" placeholder="Ingresar descripción" maxlength="100" required>
            </div>
           </div>


          <div class="row">
 
          <!-- ENTRADA PARA SELECCIONAR SU TIPO DE UNIDAD -->

          <div class="form-group col-sm">
            
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-ruler"></i></span>
                </div>

                <select class="form-control input-lg" name="nuevoTipodeunidad" required>
                
                <option value="">Tipo de unidad</option>

                <option value="KG">KG</option>

                <option value="LT">LT</option>


              </select>

            </div>

          </div>


          <!-- ENTRADA PARA EL CANTIDAD -->

          <div class="form-group col-sm">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                <font-awesome-icon icon="fa-solid fa-layer-group" />
                </div>
                <input type="number" class="form-control input-lg" name="nuevaCantidad" placeholder="Ingresar cantidad" min="0" required>
            </div>

          </div>

          </div>
          <!-- ENTRADA PARA SELECCIONAR SU TIPO DE PRODUCTO -->

          <div class="form-group">
            
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-cookie"></i></span>
                </div>

                <select class="form-control input-lg" name="nuevoTipodeproducto" required>
                
                <option value="">Tipo de producto</option>

                <option value="Intermdio">Intermedio</option>

                <option value="Terminado">Terminado</option>

                <font-awesome-icon icon="fa-solid fa-boxes-stacked" />
              </select>

            </div>

          </div>


          <!-- ENTRADA PARA SUBIR FOTO -->

           <div class="form-group">
            <div class="card">
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Subir Foto</li>
                <li class="list-group-item"><input type="file" class="nuevaFoto" name="nuevaFoto"></li>
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

          #$crearUsuario = new ControladorUsuarios();
          #$crearUsuario -> ctrCrearUsuario();

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
                <input type="text" class="form-control input-lg" id="editarNombre" name="editarNombre" value="" required>
            </div>

          </div>

          <!-- ENTRADA PARA EL USUARIO -->

           <div class="form-group">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="editarUsuario" name="editarUsuario" value="" readonly>
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
                  
                <option value="" id="editarPerfil"></option>

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

          <button type="submit" class="btn btn-primary">Modificar usuario</button>

        </div>

     <?php

          #$editarUsuario = new ControladorUsuarios();
          #$editarUsuario -> ctrEditarUsuario();

        ?> 

      </form>

    </div>

  </div>

</div>

<?php

  #$borrarUsuario = new ControladorUsuarios();
  #$borrarUsuario -> ctrBorrarUsuario();

?> 