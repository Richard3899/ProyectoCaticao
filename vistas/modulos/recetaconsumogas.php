<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Consumo de Gas de la Receta</h1>
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
          <button class="btn btn-primary my-1 col-12 col-sm-5 col-md-4 mr-2 col-lg-8 col-xl-7" id="btnRecetaConsumoGas" data-toggle="modal" data-target="#modalRecetaConsumoGas">
           Agregar Consumo de Gas
         </button>
         <a type="button" class="btn btn-secondary my-1 col-12 col-sm-4 col-md-3 col-lg-3 col-xl-3" href="recetas">Volver</a>
        </div>
        
      </div>

      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaRecetaConsumoGas" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:20px">#</th>
         <th>Maquina</th>
         <th>Trabajo por Batch (Horas)</th>
         <th>Peso de Balon de Gas</th>
         <th>Tarifa de Gas por Kg</th>
         <th>Pago por batch</th>
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
MODAL RECETA CONSUMO DE GAS
======================================-->

<div id="modalRecetaConsumoGas" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioRecetaConsumoGas">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Receta Consumo de Gas</h4>

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

              <!-- ENTRADA PARA EL TRABAJO POR BATCH (HORAS) -->
              <div class="form-group col-sm">
              <label for="trabajoPorBatch">Trabajo por batch (Horas)</label>
              <div class="input-group">
                  <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-clock"></i></span>
                  </div>
                  <input type="number" class="form-control input-lg nuevoTrabajoPorBatch" id="nuevoTrabajoPorBatch" name="nuevoTrabajoPorBatch" 
                   placeholder="Ingrese el trabajo por batch (Horas)" min="0.1" step="0.1" required>
              </div>

              </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA EL PESO DE BALON DE GAS -->
            <div class="form-group col-sm">
            <label for="pesoBalonGas">Peso del balón de gas</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg nuevoPesoBalonGas" id="nuevoPesoBalonGas" name="nuevoPesoBalonGas" 
                 placeholder="Ingresar peso del balon de gas" min="0.1" step="0.1" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="tarifaGas">Tarifa de gas por Kg</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                </div>
                <input type="number" class="form-control input-lg nuevaTarifaGas" name="nuevaTarifaGas" id="nuevaTarifaGas"
                 placeholder="Ingresar tarifa de gas por Kg" min="0.1" step="0.1" required>
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

        <button type="submit" class="btn btn-primary">Guardar Consumo de Gas</button>

      </div>

      <?php

        $guardarRecetaConsumoGas = new ControladorRecetaConsumoGas();
        $guardarRecetaConsumoGas -> ctrCrearRecetaConsumoGas();

      ?>


    </form>

  </div>

</div>

</div>

<!--=====================================
MODAL EDITAR RECETA CONSUMO DE GAS
======================================-->

<div id="modalEditarConsumoGas" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioEditarRecetaConsumoGas">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Editar Receta Consumo de Gas</h4>

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
                <input type="hidden" name="editaridRecetaConsumoGas" id="editaridRecetaConsumoGas">
            
            <div class="input-group">

                <input type="text" class="form-control input-lg" name="editarNombreMaquina" id="editarNombreMaquina">

            </div>

            </div>

              <!-- ENTRADA PARA EL TRABAJO POR BATCH (HORAS) -->
              <div class="form-group col-sm">
              <label for="trabajoPorBatch">Trabajo por batch (Horas)</label>
              <div class="input-group">
                  <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-clock"></i></span>
                  </div>
                  <input type="number" class="form-control input-lg editarTrabajoPorBatch" id="editarTrabajoPorBatch" name="editarTrabajoPorBatch" 
                   placeholder="Ingrese el trabajo por batch (Horas)" min="0.1" step="0.1" required>
              </div>

              </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA EL PESO DE BALON DE GAS -->
            <div class="form-group col-sm">
            <label for="pesoBalonGas">Peso del balón gas</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg editarPesoBalonGas" id="editarPesoBalonGas" name="editarPesoBalonGas" 
                 placeholder="Ingresar peso del balon de gas" min="0.1" step="0.1" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Tarifa de gas por Kg</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                </div>
                <input type="number" class="form-control input-lg editarTarifaGas" name="editarTarifaGas" id="editarTarifaGas"
                placeholder="Ingresar tarifa de gas por Kg" min="0.1" step="0.1" required>
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

        <button type="submit" class="btn btn-primary">Editar Consumo de Gas</button>

      </div>

      <?php

          $editarRecetaConsumoGas = new ControladorRecetaConsumoGas();
          $editarRecetaConsumoGas -> ctrEditarRecetaConsumoGas();

      ?>

    </form>

  </div>

</div>

</div>

<?php

  $borrarRecetaConsumoGas = new ControladorRecetaConsumoGas();
  $borrarRecetaConsumoGas -> ctrEliminarRecetaConsumoGas();

?> 