<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container-fluid">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Administrador de Productos</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Registros</li>
            <li class="breadcrumb-item active">Productos</li>

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

       echo "<button class='btn btn-primary' data-toggle='modal' data-target='#modalAgregarProducto'>
            Agregar Producto
            </button>";

       }else{

       echo "<button class='btn btn-primary'>Agregar Producto</button>";

       }
      ?>
               
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
MODAL AGREGAR PRODUCTO
======================================-->

<div id="modalAgregarProducto" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Agregar Producto</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <input type="hidden" id="idProducto" name="idProducto">

          <div class="row">

            <!-- ENTRADA PARA EL CÓDIGO -->
            <div class="form-group col-sm">
            <label for="codigo">Código</label>  
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevoCodigoProducto" id="nuevoCodigoProducto" placeholder="Ingresar código" 
                 maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" required>
            </div>
            </div>

            <!-- ENTRADA PARA EL NOMBRE -->
            <div class="form-group col-sm">
            <label for="nombre">Nombre</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="idNombre" name="nuevoNombre" placeholder="Ingresar nombre" 
                 maxlength="50"  pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;()+/=*% ]+" title="Solo se acepta letras y números" required>
            </div>
            </div>

          </div>


          <!-- ENTRADA PARA EL DESCRIPCIÓN -->

           <div class="form-group">
            <label for="descripcion">Descripción</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevaDescripcion" placeholder="Ingresar descripción" 
                maxlength="100" pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;()+/=*% ]+" title="Solo se acepta letras y números" required>
            </div>
           </div>


          <div class="row">
 
          <!-- ENTRADA PARA SELECCIONAR SU UNIDAD DE MEDIDA -->

          <div class="form-group col-sm">
          <label for="unidadMedida">Unidad de Medida</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-ruler"></i></span>
                </div>

                <select class="form-control input-lg" id="nuevaUnidadMedida" name="nuevaUnidadMedida" required>
                
                <option value="">Unidad de Medida</option>

                <?php 
                $item = null;
                $valor = null;

                $unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($item,$valor);

                foreach($unidadmedida as $key=> $value){ 
                  echo '<option value="'.$value["idUnidadMedida"].'">'.$value["descripcion"].'</option>';
                }

                ?>

              </select>

            </div>

          </div>


          <!-- ENTRADA PARA SELECCIONAR SU TIPO DE PRODUCTO -->

          <div class="form-group col-sm">
          <label for="tipoProducto">Tipo de Producto</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-cookie"></i></span>
                </div>

                <select class="form-control input-lg" id="nuevoTipoProducto" name="nuevoTipoProducto" required>
                
                <option value="">Tipo de producto</option>

                <?php 
                $item = null;
                $valor = null;

                $tipoproducto = ControladorTipoProducto::ctrMostrarTipoProducto($item,$valor);

                foreach($tipoproducto as $key=> $value){ 
                  echo '<option value="'.$value["idTipoProducto"].'">'.$value["descripcion"].'</option>';
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
                <li class="list-group-item"><input type="file" class="nuevaImagenProducto" name="nuevaImagenProducto"></li>
                <li class="list-group-item"> Peso máximo de la foto 2MB</li>
              </ul>
            </div>
            
            <img src="vistas/img/productos/default/producto.png" class="img-thumbnail previsualizar" width="100px">

          </div>

        </div>

      </div>

      <!--=====================================
      PIE DEL MODAL
      ======================================-->

      <div class="modal-footer">

        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

        <button type="submit" class="btn btn-primary">Guardar producto</button>

      </div>

      <?php

          $crearProducto = new ControladorProductos();
          $crearProducto -> ctrCrearProducto();

      ?>


    </form>

  </div>

</div>

</div>


<!--=====================================
MODAL EDITAR PRODUCTO
======================================-->

<div id="modalEditarProducto" class="modal fade" role="dialog">
  
  <div class="modal-dialog modal-lg">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:gray; color:white">

        <h4 class="modal-title">Editar Producto</h4>

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
            <label for="codigo">Código</label>
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="editarCodigo" id="editarCodigo" 
                 maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" readonly required>
                <input type="hidden" id="editaridProducto" name="editaridProducto">
            </div>
            </div>

            <!-- ENTRADA PARA EL NOMBRE -->
            <div class="form-group col-sm">
            <label for="nombre">Nombre</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="editarNombre" id="editarNombre" placeholder="Ingresar nombre"
                 maxlength="50"  pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;()+/=*% ]+" title="Solo se acepta letras y números" required>
            </div>
            </div>

          </div>

            <!-- ENTRADA PARA EL DESCRIPCIÓN -->

            <div class="form-group">
            <label for="descripcion">Descripción</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="editarDescripcion" id="editarDescripcion" placeholder="Ingresar descripción"
                maxlength="100" pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;()+/=*% ]+" title="Solo se acepta letras y números" required>
            </div>
           </div>


          <div class="row">
 
          <!-- ENTRADA PARA SELECCIONAR SU UNIDAD DE MEDIDA -->

          <div class="form-group col-sm">
          <label for="unidadMedida">Unidad de Medida</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-ruler"></i></span>
                </div>

                <select class="form-control input-lg" id="editarUnidadMedida" name="editarUnidadMedida" required>
                
                <option value="">Unidad de Medida</option>

                <?php 
                $item = null;
                $valor = null;

                $unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($item,$valor);

                foreach($unidadmedida as $key=> $value){ 
                  echo '<option value="'.$value["idUnidadMedida"].'">'.$value["descripcion"].'</option>';
                }

                ?>

              </select>

            </div>

           </div>

          <!-- ENTRADA PARA SELECCIONAR SU TIPO DE PRODUCTO -->

          <div class="form-group col-sm">
          <label for="tipoProducto">Tipo de Producto</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-cookie"></i></span>
                </div>

                <select class="form-control input-lg" id="editarTipoProducto" name="editarTipoProducto" required>
                
                <option value="">Tipo de producto</option>

                <?php 
                $item = null;
                $valor = null;

                $tipoproducto = ControladorTipoProducto::ctrMostrarTipoProducto($item,$valor);

                foreach($tipoproducto as $key=> $value){ 
                  echo '<option value="'.$value["idTipoProducto"].'">'.$value["descripcion"].'</option>';
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
                <li class="list-group-item"><input type="file" class="nuevaImagenProducto" name="editarImagenProducto"></li>
                <li class="list-group-item"> Peso máximo de la foto 2MB</li>
              </ul>
            </div>
            
            <img src="vistas\img\productos\default\producto.png" class="img-thumbnail previsualizar" width="100px">
            <input type="hidden" name="ImagenProductoActual" id="ImagenProductoActual">
          </div>

      </div>

      </div>


        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Editar Producto</button>

        </div>

        <?php

          $editarProducto = new ControladorProductos();
          $editarProducto -> ctrEditarProducto();

        ?> 

      </form>

    </div>

  </div>

</div>

<?php

  $borrarProducto = new ControladorProductos();
  $borrarProducto -> ctrEliminarProducto();

?> 