<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Administrador de Materiales</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Registros</li>
            <li class="breadcrumb-item active">Inssumos y Materiales</li>
            <li class="breadcrumb-item active">Materiales</li>
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

       echo "<button class='btn btn-primary m-1 col-12 col-sm-4 col-md-3 col-lg-2' data-toggle='modal' data-target='#modalAgregarMaterial'>
            Agregar Material
            </button>
            <button class='btn btn-info m-1 col-12 col-sm-4 col-md-3 col-lg-2' data-toggle='modal' data-target='#modalAgregarMarca'>
            Agregar Marca
            </button>";

       }else{

       echo "<button class='btn btn-primary m-1 col-12 col-sm-4 col-md-3 col-lg-2'>Agregar Material</button>
             <button class='btn btn-info  m-1 col-12 col-sm-4 col-md-3 col-lg-2'>Agregar Marca</button>";

       }
      ?>

      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaMateriales" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:10px">#</th>
         <th>Imagen</th>
         <th>Código</th>
         <th>Nombre</th>
         <th>Descripción</th>
         <th>Marca</th>
         <th>Unidad de Medida</th>
         <th>Cantidad</th>
         <th>Precio</th>
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
MODAL AGREGAR MATERIAL
======================================-->

<div id="modalAgregarMaterial" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Agregar Material</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <input type="hidden" id="idMaterial" name="idMaterial">

          <div class="row">

            <!-- ENTRADA PARA EL CÓDIGO -->
            <div class="form-group col-sm">
            <label for="codigo">Código</label>
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevoCodigoMaterial" id="nuevoCodigoMaterial" placeholder="Ingresar código" 
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
                 maxlength="50"  pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras y números" required>
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
                maxlength="100" pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras y números" required>
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


          <!-- ENTRADA PARA SELECCIONAR SU MARCA -->

          <div class="form-group col-sm">
          <label for="marca">Marca</label>
            <div class="input-group">
            
                <select class="form-control select2 input-lg" id="nuevaMarca" name="nuevaMarca" style="width: 100%;" required>
                
                <option value="">Seleccionar Marca</option>

                <?php 
                $item = null;
                $valor = null;

                $marcas = ControladorMarcas::ctrMostrarMarcas($item,$valor);

                foreach($marcas as $key=> $value){ 
                  echo '<option value="'.$value["idMarca"].'">'.$value["descripcion"].'</option>';
                }

                ?>

              </select>

            </div>

          </div>


          </div>

          <div class="row">

            <!-- ENTRADA PARA EL CANTIDAD -->

            <div class="form-group col-sm">
            <label for="cantidad">Cantidad</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevaCantidad" 
                 placeholder="Ingresar cantidad" min="0.01" max="9999999" step="0.01"  required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->

            <div class="form-group col-sm">
            <label for="precio">Precio</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevoPrecio" id="nuevoPrecio"
                 placeholder="Ingresar precio" min="0.01" max="9999999" step="0.01" required>
            </div>

            </div>


          </div>


          <!-- ENTRADA PARA SUBIR FOTO -->

           <div class="form-group">
            <div class="card">
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Subir Foto</li>
                <li class="list-group-item"><input type="file" class="nuevaImagenMaterial" name="nuevaImagenMaterial"></li>
                <li class="list-group-item"> Peso máximo de la foto 2MB</li>
              </ul>
            </div>
            
            <img src="vistas/img/materiales/default/material.png" class="img-thumbnail previsualizar" width="100px">

          </div>

        </div>

      </div>

      <!--=====================================
      PIE DEL MODAL
      ======================================-->

      <div class="modal-footer">

        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

        <button type="submit" class="btn btn-primary">Guardar Material</button>

      </div>

      <?php

          $crearMaterial= new ControladorMateriales();
          $crearMaterial -> ctrCrearMaterial();

      ?>


    </form>

  </div>

</div>

</div>


<!--=====================================
MODAL AGREGAR MARCA
======================================-->

<div id="modalAgregarMarca" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Agregar Marca</h4>

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
                <input type="text" class="form-control input-lg" name="nuevaDescripcionMarca" id="nuevaDescripcionMarca" placeholder="Ingresar Marca" 
                 maxlength="45" pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras y números" required>
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

        <button type="submit" class="btn btn-primary">Guardar Marca</button>

      </div>

      <?php

          $crearMarca= new ControladorMarcas();
          $crearMarca -> ctrCrearMarcaMateriales();

      ?>


    </form>

  </div>

</div>

</div>

<!--=====================================
MODAL EDITAR MATERIAL
======================================-->

<div id="modalEditarMaterial" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 id="idMateria" class="modal-title">Editar Material</h4>

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
                <input type="hidden" id="editaridMaterial" name="editaridMaterial">
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
                 maxlength="50"  pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras y números" required>
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
                maxlength="100" pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras y números" required>
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


          <!-- ENTRADA PARA SELECCIONAR SU MARCA -->

          <div class="form-group col-sm">
            <label for="marca">Marca</label>
            <div class="input-group">
            
                <select class="form-control select2 input-lg" id="editarMarca" name="editarMarca" style="width: 100%;" required>
                
                <option value="">Seleccionar Marca</option>

                <?php 
                $item = null;
                $valor = null;

                $marcas = ControladorMarcas::ctrMostrarMarcas($item,$valor);

                foreach($marcas as $key=> $value){ 
                  echo '<option value="'.$value["idMarca"].'">'.$value["descripcion"].'</option>';
                }

                ?>

              </select>

            </div>

          </div>


          </div>

          <div class="row">

            <!-- ENTRADA PARA EL CANTIDAD -->

            <div class="form-group col-sm">
            <label for="cantidad">Cantidad</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarCantidad"  id="editarCantidad" 
                 placeholder="Ingresar cantidad" min="0.01" max="9999999" step="0.01" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->

            <div class="form-group col-sm">
            <label for="precio">Precio</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarPrecio"  id="editarPrecio" 
                 placeholder="Ingresar precio" min="0.01" max="9999999" step="0.01" required>
            </div>

            </div>

          </div>

          <!-- ENTRADA PARA SUBIR FOTO -->

           <div class="form-group">
            <div class="card">
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Subir Foto</li>
                <li class="list-group-item"><input type="file" class="nuevaImagenMaterial" name="editarImagenMaterial"></li>
                <li class="list-group-item"> Peso máximo de la foto 2MB</li>
              </ul>
            </div>
            
            <img src="vistas/img/materiales/default/material.png" class="img-thumbnail previsualizar" width="100px">
            <input type="hidden" name="ImagenMaterialActual" id="ImagenMaterialActual">
          </div>

        </div>

      </div>

      <!--=====================================
      PIE DEL MODAL
      ======================================-->

      <div class="modal-footer">

        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

        <button type="submit" class="btn btn-primary">Editar Material</button>

      </div>

      <?php

          $editarMaterial = new ControladorMateriales();
          $editarMaterial -> ctrEditarMaterial();

      ?>


    </form>

  </div>

</div>

</div>


<?php

  $borrarMaterial = new ControladorMateriales();
  $borrarMaterial -> ctrEliminarMaterial();

?> 