<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Costo de Marketing de la Receta</h1>
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
      <div class="row col-12 col-lg-7">
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
       
        <div class="form-group row  col-12 col-lg-5 justify-content-sm-end">
          <button class="btn btn-primary my-1 col-12 col-sm-6 col-md-4 mr-2 col-lg-8 col-xl-6" id="btnRecetaCostoMarketing" data-toggle="modal" data-target="#modalRecetaCostoMarketing">
           Agregar Costo de Marketing
         </button>
         <a type="button" class="btn btn-secondary my-1 col-12 col-sm-4 col-md-3 col-lg-3 col-xl-3" href="recetas">Volver</a>
        </div>
        

      </div>

      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaRecetaCostoMarketing" width="100%">
       
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
MODAL RECETA COSTO DE MARKETING
======================================-->

<div id="modalRecetaCostoMarketing" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioRecetaCostoMarketing">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Receta Costo de Marketing</h4>

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

            <!-- ENTRADA PARA SELECCIONAR COSTO DE MARKETING -->

            <div class="form-group col-sm">
            
            <div class="input-group">

                <input type="hidden" name="idCostoMarketing" id="idCostoMarketing">

                <input type="hidden" name="nombreCostoMarketing" id="nombreCostoMarketing">

                <select class="form-control select2 input-lg seleccionarNombreCostoMarketing" id="seleccionarNombreCostoMarketing" name="seleccionarNombreCostoMarketing" style="width: 100%;" required>
                
                <option value="">Seleccionar Costo de Marketing</option>

                <?php 
                    $item = null;
                    $valor = null;

                    $maquina = ControladorCostoMarketing::ctrMostrarCostoMarketing($item,$valor);

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
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg nuevaCantidadCostoMarketing" id="nuevaCantidad" name="nuevaCantidad" 
                 min="0.1" step="0.1" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->

            <div class="form-group col-sm">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                </div>
                <input type="hidden" id="precio" name="precio">
                <input type="hidden" id="precioTotal" name="precioTotal">
                <input type="text" class="form-control input-lg precioCostoMarketing" precioReal name="nuevoPrecio" id="nuevoPrecio"
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

        <button type="submit" class="btn btn-primary">Guardar Costo de Marketing</button>

      </div>

      <?php

        $guardarRecetaCostoMarketing = new ControladorRecetaCostoMarketing();
        $guardarRecetaCostoMarketing -> ctrCrearRecetaCostoMarketing();

      ?>


    </form>

  </div>

</div>

</div>




<!--=====================================
MODAL EDITAR RECETA COSTO DE MARKETING
======================================-->

<div id="modalEditarCostoMarketing" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioEditarRecetaCostoMarketing">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Editar Receta Costo de Marketing</h4>

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

            <!-- ENTRADA PARA SELECCIONAR LA MAQUINA -->

            <div class="form-group col-sm">

                <input type="hidden" name="editaridRecetaCostoMarketing" id="editaridRecetaCostoMarketing">
            
            <div class="input-group">

                <input type="text" class="form-control input-lg" name="editarNombreCostoMarketing" id="editarNombreCostoMarketing">

            </div>

            </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA LA CANTIDAD-->

            <div class="form-group col-sm">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg editarCantidadCostoMarketing" id="editarCantidad" name="editarCantidad" 
                 min="0.1" step="0.1" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->

            <div class="form-group col-sm">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                </div>
                <input type="hidden" id="editarPrecioTotal" name="editarPrecioTotal">
                <input type="text" class="form-control input-lg editarPrecioCostoMarketing" name="editarPrecioCostoMarketing" id="editarPrecioCostoMarketing"
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

        <button type="submit" class="btn btn-primary">Editar Costo de Marketing</button>

      </div>

      <?php

          $editarRecetaCostoMarketing = new ControladorRecetaCostoMarketing();
          $editarRecetaCostoMarketing -> ctrEditarRecetaCostoMarketing();

      ?>


    </form>

  </div>

</div>

</div>


<?php

  $borrarRecetaCostoMarketing = new ControladorRecetaCostoMarketing();
  $borrarRecetaCostoMarketing -> ctrEliminarRecetaCostoMarketing();

?> 