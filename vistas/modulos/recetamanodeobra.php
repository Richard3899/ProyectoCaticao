<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Mano de Obra de la Receta</h1>
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
          <button class="btn btn-primary my-1 col-12 col-sm-4 col-md-3 mr-2 col-lg-7 col-xl-6" id="btnRecetaManodeObra" data-toggle="modal" data-target="#modalRecetaManodeObra">
           Agregar Mano de Obra
         </button>
         <a type="button" class="btn btn-secondary my-1 col-12 col-sm-4 col-md-3 col-lg-4 col-xl-3" href="recetas">Volver</a>
        </div>
        

      </div>

      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaRecetaManodeObra" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:20px">#</th>
         <th>Empleado</th>
         <th>Maquina</th>
         <th>Tiempo(Horas)</th>
         <th>Precio Unitario</th>
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
MODAL RECETA MANO DE OBRA
======================================-->

<div id="modalRecetaManodeObra" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioRecetaManodeObra">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Receta Mano de Obra</h4>

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

          <!-- ENTRADA PARA SELECCIONAR MANO DE OBRA -->

          <div class="form-group col-sm">
            
            <div class="input-group">

                <input type="hidden" name="idEmpleado" id="idEmpleado">

                <input type="hidden" name="nombreEmpleado" id="nombreEmpleado">

                <select class="form-control select2 input-lg seleccionarNombreEmpleado" id="seleccionarNombreEmpleado" name="seleccionarNombreEmpleado" style="width: 100%;" required>
                
                <option value="">Seleccionar Empleado</option>

                <?php 
                    $item = null;
                    $valor = null;

                    $empleado = ControladorEmpleados::ctrMostrarEmpleados($item,$valor);

                  foreach($empleado as $key=> $value){ 

                    echo '<option value="'.$value["idEmpleado"].'">'.$value["nombre"].' '.$value["apellido"].'</option>';
                  }

                  ?>

              </select>
              

            </div>

          </div>

            <!-- ENTRADA PARA SELECCIONAR LA MAQUINA -->

            <div class="form-group col-sm">
            
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
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg nuevoTiempoHorasManodeObra" id="nuevoTiempoHoras" name="nuevoTiempoHoras" 
                 min="0.1" step="0.1" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->

            <div class="form-group col-sm">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                </div>
                <input type="hidden" id="precioUnitario" name="precioUnitario">
                <input type="hidden" id="precioTotal" name="precioTotal">
                <input type="text" class="form-control input-lg precioManodeObra" precioReal name="nuevoPrecioUnitario" id="nuevoPrecioUnitario"
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

        <button type="submit" class="btn btn-primary">Guardar Mano de Obra</button>

      </div>

      <?php

        $guardarRecetaManodeObra = new ControladorRecetaManodeObra();
        $guardarRecetaManodeObra -> ctrCrearRecetaManodeObra();

      ?>


    </form>

  </div>

</div>

</div>




<!--=====================================
MODAL EDITAR RECETA MANO DE OBRA
======================================-->

<div id="modalEditarManodeObra" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioEditarRecetaManodeObra">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Editar Receta Mano de Obra</h4>

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

          <!-- ENTRADA PARA SELECCIONAR MANO DE OBRA -->

          <div class="form-group col-sm">

                <input type="hidden" name="editaridRecetaManodeObra" id="editaridRecetaManodeObra">

            <div class="input-group">

                <input type="text" class="form-control input-lg" name="editarNombreEmpleado" id="editarNombreEmpleado">
              
            </div>

          </div>

            <!-- ENTRADA PARA SELECCIONAR LA MAQUINA -->

            <div class="form-group col-sm">
            
            <div class="input-group">

                <input type="text" class="form-control input-lg" name="editarNombreMaquina" id="editarNombreMaquina">

            </div>

          </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA EL TIEMPO HORAS -->

            <div class="form-group col-sm">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg editarTiempoHorasManodeObra" id="editarTiempoHoras" name="editarTiempoHoras" 
                 min="0.1" step="0.1" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->

            <div class="form-group col-sm">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                </div>
                <input type="hidden" id="editarprecioTotal" name="editarprecioTotal">
                <input type="text" class="form-control input-lg editarPrecioManodeObra" name="editarPrecioManodeObra" id="editarPrecioManodeObra"
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

        <button type="submit" class="btn btn-primary">Editar Mano de Obra</button>

      </div>

      <?php

          $editarRecetaManodeObra = new ControladorRecetaManodeObra();
          $editarRecetaManodeObra -> ctrEditarRecetaManodeObra();

      ?>


    </form>

  </div>

</div>

</div>


<?php

  $borrarRecetaManodeObra = new ControladorRecetaManodeObra();
  $borrarRecetaManodeObra -> ctrEliminarRecetaManodeObra();

?> 