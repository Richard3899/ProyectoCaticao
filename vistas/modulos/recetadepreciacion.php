<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Depreciación de la Receta</h1>
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

          echo  "<button class='btn btn-primary my-1 col-12 col-sm-5 col-md-4 mr-2 col-lg-7 col-xl-6' id='btnRecetaDepreciacion' data-toggle='modal' data-target='#modalRecetaDepreciacion'>
                Agregar Depreciación
                </button>";
          }else{

          echo  "<button class='btn btn-primary my-1 col-12 col-sm-5 col-md-4 mr-2 col-lg-7 col-xl-6' id='btnRecetaDepreciacion'>
                Agregar Depreciación
                </button>";

          }
          ?>

         <a type="button" class="btn btn-secondary my-1 col-12 col-sm-4 col-md-3 col-lg-4 col-xl-3" href="recetas">Volver</a>
        </div>
        
      </div>

      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaRecetaDepreciacion" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:20px">#</th>
         <th>Maquina</th>
         <th>Tiempo de Uso(Horas)</th>
         <th>Depreciación(Hora)</th>
         <th>Depreciación Por Batch</th>
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
MODAL RECETA DEPRECIACIÓN
======================================-->

<div id="modalRecetaDepreciacion" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioRecetaDepreciacion">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Receta Depreciación</h4>

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
            <label for="Maquina">Maquina</label>
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
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg nuevoTiempoHorasDepreciacion" id="nuevoTiempoHoras" name="nuevoTiempoHoras" 
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
                <input type="hidden" id="precioUnitario" name="precioUnitario">
                <input type="hidden" id="precioTotal" name="precioTotal">
                <input type="text" class="form-control input-lg precioDepreciacion" precioReal name="nuevoPrecioUnitario" id="nuevoPrecioUnitario"
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

        <button type="submit" class="btn btn-primary">Guardar Depreciación</button>

      </div>

      <?php

        $guardarRecetaDepreciacion = new ControladorRecetaDepreciacion();
        $guardarRecetaDepreciacion -> ctrCrearRecetaDepreciacion();

      ?>

    </form>

  </div>

</div>

</div>

<!--=====================================
MODAL EDITAR RECETA DEPRECIACIÓN
======================================-->

<div id="modalEditarDepreciacion" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioEditarRecetaDepreciacion">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Editar Receta Depreciación</h4>

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
            <label for="Maquina">Maquina</label>
                <input type="hidden" name="editaridRecetaDepreciacion" id="editaridRecetaDepreciacion">
            
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
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg editarTiempoHorasDepreciacion" id="editarTiempoHoras" name="editarTiempoHoras" 
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
                <input type="hidden" id="editarprecioTotal" name="editarprecioTotal">
                <input type="text" class="form-control input-lg editarPrecioDepreciacion" name="editarPrecioDepreciacion" id="editarPrecioDepreciacion"
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

        <button type="submit" class="btn btn-primary">Editar Depreciación</button>

      </div>

      <?php

          $editarRecetaDepreciacion = new ControladorRecetaDepreciacion();
          $editarRecetaDepreciacion -> ctrEditarRecetaDepreciacion();

      ?>

    </form>

  </div>

</div>

</div>


<?php

  $borrarRecetaDepreciacion = new ControladorRecetaDepreciacion();
  $borrarRecetaDepreciacion -> ctrEliminarRecetaDepreciacion();

?> 