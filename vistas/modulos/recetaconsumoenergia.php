<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container-fluid">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Consumo de Energía de la Receta</h1>
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
      <div class="row">
      <div class="row col-12 col-lg-7">
       <!-- ENTRADA PARA EL CÓDIGO -->
       <div class="form-group my-1 col-12 col-sm-5 col-md-4 col-lg-5 col-xl-4">
          <div class="input-group">
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
       
      <div class="form-group row col-12 col-lg-5 justify-content-sm-center justify-content-md-end">
          
          <?php 
          if($permisoInsertar==1){

          echo  "<button class='btn btn-primary my-1 col-12 col-sm-6 col-md-4 mr-2 col-lg-8 col-xl-8' id='btnRecetaConsumoEnergia' data-toggle='modal' data-target='#modalRecetaConsumoEnergia'>
                Agregar Consumo de Energía
                </button>";
          }else{

          echo  "<button class='btn btn-primary my-1 col-12 col-sm-6 col-md-4 mr-2 col-lg-8 col-xl-8' id='btnRecetaConsumoEnergia'>
                Agregar Consumo de Energía
                </button>";

          }
          ?>

         <a type="button" class="btn btn-secondary my-1 col-12 col-sm-5 col-md-3 col-lg-3 col-xl-3" href="recetas">Volver</a>
      </div>

      <div class="form-group row col-12">

          <?php 
          if($permisoInsertar==1){

          echo  "<button class='btn btn-success ml-sm-2 col-12 col-sm-3 col-md-2 col-lg-2 col-xl-2' id='btnEditarTarifaKwh' data-toggle='modal' data-target='#modalEditarTarifaKwh'>
                Tarifa Kwh
                </button>";
          }else{

          echo  "<button class='btn btn-success ml-sm-2 col-12 col-sm-3 col-md-2 col-lg-2 col-xl-2' id='btnEditarTarifaKwh'>
                Tarifa Kwh
                </button>";

          }
          ?>
      
      </div>
        
      </div>

      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaRecetaConsumoEnergia" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:20px">#</th>
         <th>Maquina</th>
         <th>Potencia en Kw</th>
         <th>Horas Trabajo por Batch</th>
         <th>Consumo Kwh</th>
         <th>Tarifa Kwh</th>
         <th>Pago por Batch</th>
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
MODAL TARIFA KWH
======================================-->

<div id="modalEditarTarifaKwh" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioTarifaKwh">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Tarifa Kwh</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <input type="hidden" name="codigoRecetaTF" id="codigoRecetaTF" value="<?php echo $_GET['codigo']; ?>">
      
      <input type="hidden" name="idRecetaTF" id="idRecetaTF" value="<?php echo $_GET['idReceta']; ?>">

      <input type="hidden" name="nombreRecetaTF" id="nombreRecetaTF" value="<?php echo $_GET['nombre']; ?>">

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA LA TARIFA KHW -->

            <div class="form-group col-sm">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg editarTarifaKwh" id="editarTarifaKwh" name="editarTarifaKwh" 
                 min="0.01" step="0.01" required>
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

        <button type="submit" class="btn btn-primary">Editar TarifaKwh</button>

      </div>

      <?php

        $editarTarifaKwh = new ControladorRecetaConsumoEnergia();
        $editarTarifaKwh -> ctrEditarTarifaKwh();

      ?>


    </form>

  </div>

</div>

</div>

<!--=====================================
MODAL RECETA CONSUMO DE ENERGÍA
======================================-->

<div id="modalRecetaConsumoEnergia" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioRecetaConsumoEnergia">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Receta Consumo de Energía</h4>

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

            <!-- ENTRADA PARA SELECCIONAR LA MAQUINA -->
            <div class="form-group col-sm">
            <label for="maquina">Maquina</label>
            <div class="input-group">

                <input type="hidden" name="idMaquina" id="idMaquina">

                <input type="hidden" name="nombreMaquina" id="nombreMaquina">

                <select class="form-control select2 input-lg seleccionarNombreMaquina" id="seleccionarNombreMaquina" name="seleccionarNombreMaquina" style="width: 100%;" required>
                
                <option value="">Seleccionar Maquina</option>

                <?php 
                    $item = null;
                    $valor = null;

                    $maquina = ControladorMaquinas::ctrMostrarMaquinas($item,$valor);

                  foreach($maquina as $key=> $value){ 

                    echo '<option value="'.$value["idMaquina"].'">'.$value["nombre"].'</option>';
                  }

                  ?>

              </select>
              

            </div>

          </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA EL TIEMPO HORAS -->
            <div class="form-group col-sm">
            <label for="tiempoHoras">Tiempo (Horas)</label>
            <div class="input-group">
                <input type="hidden" id="potenciaKw" name="potenciaKw">
                <input type="hidden" id="consumoKwh" name="consumoKwh">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg nuevoTiempoHorasConsumoEnergia" id="nuevoTiempoHoras" name="nuevoTiempoHoras" 
                 min="0.1" step="0.1" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Precio</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><strong>S/.</strong></span>
                </div>
                <input type="hidden" id="tarifaKwh" name="tarifaKwh">
                <input type="hidden" id="precioTotal" name="precioTotal">
                <input type="number" class="form-control input-lg precioConsumoEnergia" name="nuevoPrecioUnitario" id="nuevoPrecioUnitario"
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

        <button type="submit" class="btn btn-primary">Guardar Consumo de Energía</button>

      </div>

      <?php

        $guardarRecetaConsumoEnergia = new ControladorRecetaConsumoEnergia();
        $guardarRecetaConsumoEnergia -> ctrCrearRecetaConsumoEnergia();

      ?>

    </form>

  </div>

</div>

</div>

<!--=====================================
MODAL EDITAR RECETA CONSUMO DE ENERGÍA
======================================-->

<div id="modalEditarConsumoEnergia" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioEditarRecetaConsumoEnergia">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Editar Receta Consumo de Energía</h4>

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
            <label for="maquina">Maquina</label>
                <input type="hidden" name="editaridRecetaConsumoEnergia" id="editaridRecetaConsumoEnergia">
            
            <div class="input-group">

                <input type="text" class="form-control input-lg" name="editarNombreMaquina" id="editarNombreMaquina">

            </div>

            </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA EL TIEMPO HORAS -->
            <div class="form-group col-sm">
            <label for="tiempoHoras">Tiempo (Horas)</label>
            <div class="input-group">
                <input type="hidden" id="editarPotenciaKw" name="editarPotenciaKw">
                <input type="hidden" id="editarConsumoKwh" name="editarConsumoKwh">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg editarTiempoHorasConsumoEnergia" id="editarTiempoHoras" name="editarTiempoHoras" 
                 min="0.1" step="0.1" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Precio</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><strong>S/.</strong></span>
                </div>
                <input type="hidden" id="editarTarifaKwhCE" name="editarTarifaKwhCE">
                <input type="hidden" id="editarprecioTotal" name="editarprecioTotal">
                <input type="number" class="form-control input-lg editarPrecioConsumoEnergia" name="editarPrecioConsumoEnergia" id="editarPrecioConsumoEnergia"
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

        <button type="submit" class="btn btn-primary">Editar Consumo de Energía</button>

      </div>

      <?php

          $editarRecetaConsumoEnergia = new ControladorRecetaConsumoEnergia();
          $editarRecetaConsumoEnergia -> ctrEditarRecetaConsumoEnergia();

      ?>

    </form>

  </div>

</div>

</div>


<?php

  $borrarRecetaConsumoEnergia = new ControladorRecetaConsumoEnergia();
  $borrarRecetaConsumoEnergia -> ctrEliminarRecetaConsumoEnergia();

?> 