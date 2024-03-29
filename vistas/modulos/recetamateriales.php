<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container-fluid">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Materiales de la Receta</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Operaciones</li>
            <li class="breadcrumb-item active">Receta</li>
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
      <div class="row ">
      <div class="row col-12 col-lg-8">
       <!-- ENTRADA PARA EL CÓDIGO -->
       <div class="form-group my-1 col-12 col-sm-5 col-md-4 col-lg-5 col-xl-4">
          <div class="input-group ">
            <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
            </div>
            <input type="text" class="form-control input-lg cd" value="<?php echo $_GET['codigo']; ?>" readonly required>
          </div>
        </div>

        <!-- ENTRADA PARA LA RECETA -->
        <div class="form-group my-1 col-12 col-sm-7 col-md-8 col-lg-6 col-xl-6">
          <div class="input-group">
            <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
            </div>
            <input type="text" class="form-control input-lg nm" value="<?php echo $_GET['nombre']; ?>" readonly required>
          </div>
       </div>
       </div>
       
        <div class="form-group row  col-12 col-lg-4 justify-content-sm-end">
        
          <?php 
          if($permisoInsertar==1){

          echo  "<button class='btn btn-primary my-1 col-12 col-sm-4 col-md-3 mr-2 col-lg-7 col-xl-6' id='btnRecetaMaterial' data-toggle='modal' data-target='#modalRecetaMaterial'>
                Agregar Material
                </button>";
          }else{

          echo  "<button class='btn btn-primary my-1 col-12 col-sm-4 col-md-3 mr-2 col-lg-7 col-xl-6' id='btnRecetaMaterial'>
                Agregar Material
                </button>";

          }
          ?>

         <a type="button" class="btn btn-secondary my-1 col-12 col-sm-4 col-md-3 col-lg-4 col-xl-3" href="recetas">Volver</a>
        </div>

      </div>

      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaRecetaMateriales" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:20px">#</th>
         <th>Nombre</th>
         <th>Cantidad</th>
         <th>Precio</th>
         <th>Total</th>
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
MODAL RECETA MATERIAL
======================================-->

<div id="modalRecetaMaterial" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioRecetaMateriales">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Agregar Material</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <input type="hidden" name="codigoReceta" id="codigoReceta" value="<?php echo $_GET['codigo']; ?>">
      
      <input type="hidden" name="idReceta" id="idReceta" value="<?php echo $_GET['idReceta']; ?>">

      <input type="hidden" name="nombreReceta" id="nombreReceta" value="<?php echo $_GET['nombre']; ?>">

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

          <!-- ENTRADA PARA SELECCIONAR MATERIAL -->
          <div class="form-group col-sm">
          <label for="Material">Material</label>
            <div class="input-group">

                <input type="hidden" name="idMaterial" id="idMaterial">

                <input type="hidden" name="nombreMaterial" id="nombreMaterial">

                <select class="form-control select2 input-lg seleccionarNombreMaterial" id="seleccionarNombreMaterial" name="seleccionarNombreMaterial" style="width: 100%;" required>
                
                <option value="">Seleccionar Material</option>

                <?php 
                    $valor = null;

                    $materiales = ControladorRecetaMateriales::ctrMostrarDetalleMateriales($valor);

                  foreach($materiales as $key=> $value){ 

                    $item = "idMarca";
                    $valor = $materiales[$key]["idMarca"];

                    $marcas = ControladorMarcas::ctrMostrarMarcas($item,$valor);

                    echo '<option value="'.$value["idMateria"].'">'.$value["nombre"].' - '.$marcas["descripcion"].'</option>';
                  }

                  ?>

              </select>
              

            </div>

          </div>

            <!-- ENTRADA PARA EL STOCK -->
            <div class="form-group col-sm">
            <label for="stock">Stock</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-box"></i></span>
                </div>
                <input type="number" placeholder="0,00" class="form-control input-lg" id="nuevoStock" name="nuevoStock" readonly required>
                <input type="text" placeholder="Unid" class="form-control input-lg"  id="unidadMedidaStockI" name="unidadMedidaStockI" readonly>
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
                <input type="number" placeholder="0,00" class="form-control input-lg nuevaCantidadMaterial" stock id="nuevaCantidad" name="nuevaCantidad" 
                 min="0.01" step="0.01" required>
                <input type="text" placeholder="Unid" class="form-control input-lg"  id="unidadMedidaI" name="unidadMedidaI" readonly>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Precio</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><strong>S/.</strong></span>
                </div>
                <input type="hidden" id="precioUnitario" name="precioUnitario">
                <input type="hidden" id="precioTotal" name="precioTotal">
                <input type="number" placeholder="0,00" class="form-control input-lg precioMaterial" precioReal name="nuevoPrecioUnitario" id="nuevoPrecioUnitario"
                 required readonly>
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

        <button type="submit" class="btn btn-primary">Guardar Material</button>

      </div>

      <?php

        $guardarRecetaMateriales = new ControladorRecetaMateriales();
        $guardarRecetaMateriales -> ctrCrearRecetaMaterial();

      ?>


    </form>

  </div>

</div>

</div>

<!--=====================================
MODAL EDITAR RECETA MATERIAL
======================================-->

<div id="modalEditarMaterial" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioEditarRecetaMaterial">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Editar Material</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <input type="hidden" name="editarcodigoReceta" id="editarcodigoReceta" value="<?php echo $_GET['codigo']; ?>">
      
      <input type="hidden" name="editaridReceta" id="editaridReceta" value="<?php echo $_GET['idReceta']; ?>">

      <input type="hidden" name="editarnombreReceta" id="editarnombreReceta" value="<?php echo $_GET['nombre']; ?>">


      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

          <!-- ENTRADA PARA SELECCIONAR MATERIAL -->
          <div class="form-group col-sm">
          <label for="material">Material</label>
                <input type="hidden" name="editaridRecetaMaterial" id="editaridRecetaMaterial">

                <input type="hidden" name="editaridMaterial" id="editaridMaterial">

                <input type="hidden" name="editarNombreMaterial" id="editarNombreMaterial">

              <div class="input-group">

                <input type="text" class="form-control input-lg" name="editarNombreM" id="editarNombreM">

              </div>

          </div>

            <!-- ENTRADA PARA EL STOCK -->
            <div class="form-group col-sm">
            <label for="stock">Stock</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-box"></i></span>
                </div>
                <input type="number" placeholder="0,00" class="form-control input-lg" id="editarStock" name="editarStock" readonly required>
                <input type="text" placeholder="Unid" class="form-control input-lg"  id="unidadMedidaStockA" name="unidadMedidaStockA" readonly>
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
                <input type="number" placeholder="0,00" class="form-control input-lg editarCantidadMaterial" edStock id="editarCantidad" name="editarCantidad" 
                min="0.01" step="0.01" required>
                <input type="text" placeholder="Unid" class="form-control input-lg"  id="unidadMedidaA" name="unidadMedidaA" readonly>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Precio</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><strong>S/.</strong></span>
                </div>
                <input type="hidden" id="editarprecioUnitario" name="editarprecioUnitario">
                <input type="hidden" id="editarprecioTotal" name="editarprecioTotal">
                <input type="number" placeholder="0,00" class="form-control input-lg editarPrecioMaterial" name="editarPrecioMaterial" id="editarPrecioMaterial"
                 required readonly>
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

        <button type="submit" class="btn btn-primary">Editar Material</button>

      </div>

      <?php

          $editarRecetaMateriales = new ControladorRecetaMateriales();
          $editarRecetaMateriales -> ctrEditarRecetaMaterial();

      ?>

    </form>

  </div>

</div>

</div>


<?php

  $borrarRecetaMaterial = new ControladorRecetaMateriales();
  $borrarRecetaMaterial -> ctrEliminarRecetaMaterial();

?> 