<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Costo de Venta de la Receta</h1>
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

          echo  "<button class='btn btn-primary my-1 col-12 col-sm-5 col-md-4 mr-2 col-lg-8 col-xl-7' id='btnRecetaCostoVenta' data-toggle='modal' data-target='#modalRecetaCostoVenta'>
                Agregar Costo de Venta
                </button>";
          }else{

          echo  "<button class='btn btn-primary my-1 col-12 col-sm-5 col-md-4 mr-2 col-lg-8 col-xl-7' id='btnRecetaCostoVenta'>
                Agregar Costo de Venta
                </button>";

          }
          ?>

         <a type="button" class="btn btn-secondary my-1 col-12 col-sm-4 col-md-3 col-lg-3 col-xl-3" href="recetas">Volver</a>
        </div>
        
      </div>

      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaRecetaCostoVenta" width="100%">
       
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
MODAL RECETA COSTO DE VENTA
======================================-->

<div id="modalRecetaCostoVenta" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioRecetaCostoVenta">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Receta Costo de Venta</h4>

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

            <!-- ENTRADA PARA SELECCIONAR COSTO DE VENTA -->
            <div class="form-group col-sm">
            <label for="costoVenta">Costo de Venta</label>
            <div class="input-group">

                <input type="hidden" name="idCostoVenta" id="idCostoVenta">

                <input type="hidden" name="nombreCostoVenta" id="nombreCostoVenta">

                <select class="form-control select2 input-lg seleccionarNombreCostoVenta" id="seleccionarNombreCostoVenta" name="seleccionarNombreCostoVenta" style="width: 100%;" required>
                
                <option value="">Seleccionar Costo de Venta</option>

                <?php 
                    $item = null;
                    $valor = null;

                    $maquina = ControladorCostoVenta::ctrMostrarCostoVenta($item,$valor);

                  foreach($maquina as $key=> $value){ 

                    echo '<option value="'.$value["idGastoAdmin"].'">'.$value["descripcion"].'</option>';
                  }

                  ?>

              </select>
              
            </div>

          </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA LA CANTIDAD -->
            <div class="form-group col-sm">
            <label for="cantidad">Cantidad</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg nuevaCantidadCostoVenta" id="nuevaCantidad" name="nuevaCantidad" 
                 min="0.1" step="0.1" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Precio</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                </div>
                <input type="hidden" id="precio" name="precio">
                <input type="hidden" id="precioTotal" name="precioTotal">
                <input type="number" class="form-control input-lg precioCostoVenta" precioReal name="nuevoPrecio" id="nuevoPrecio"
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

        <button type="submit" class="btn btn-primary">Guardar Costo de Venta</button>

      </div>

      <?php

        $guardarRecetaCostoVenta = new ControladorRecetaCostoVenta();
        $guardarRecetaCostoVenta -> ctrCrearRecetaCostoVenta();

      ?>

    </form>

  </div>

</div>

</div>

<!--=====================================
MODAL EDITAR RECETA COSTO DE VENTA
======================================-->

<div id="modalEditarCostoVenta" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioEditarRecetaCostoVenta">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Editar Receta Costo de Venta</h4>

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

            <!-- ENTRADA PARA SELECCIONAR EL COSTO DE VENTA -->
            <div class="form-group col-sm">
            <label for="costoVenta">Costo de Venta</label>
                <input type="hidden" name="editaridRecetaCostoVenta" id="editaridRecetaCostoVenta">
            
            <div class="input-group">

                <input type="text" class="form-control input-lg" name="editarNombreCostoVenta" id="editarNombreCostoVenta">

            </div>

            </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA LA CANTIDAD-->
            <div class="form-group col-sm">
            <label for="cantidad">Cantidad</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg editarCantidadCostoVenta" id="editarCantidad" name="editarCantidad" 
                 min="0.1" step="0.1" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Precio</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                </div>
                <input type="hidden" id="editarPrecioTotal" name="editarPrecioTotal">
                <input type="number" class="form-control input-lg editarPrecioCostoVenta" name="editarPrecioCostoVenta" id="editarPrecioCostoVenta"
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

        <button type="submit" class="btn btn-primary">Editar Costo de Venta</button>

      </div>

      <?php

          $editarRecetaCostoVenta = new ControladorRecetaCostoVenta();
          $editarRecetaCostoVenta -> ctrEditarRecetaCostoVenta();

      ?>

    </form>

  </div>

</div>

</div>


<?php

  $borrarRecetaCostoVenta = new ControladorRecetaCostoVenta();
  $borrarRecetaCostoVenta -> ctrEliminarRecetaCostoVenta();

?> 