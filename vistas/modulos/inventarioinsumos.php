<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Inventario de Insumos</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Inventario</li>
            <li class="breadcrumb-item active">Insumos</li>
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
        <div class="form-group">

            <div class="btn-toolbar justify-content-between m-2">

                <div class="input-group">

                <button type="button" class="btn btn-success m-1" data-toggle="modal" data-target="#modalIngresoInsumo">
                    
                    Ingreso Insumo

                </button>

                <button type="button" class="btn btn-primary m-1" data-toggle="modal" data-target="#modalSalidaInsumo">
                    
                    Salida Insumo

                </button>

                </div>
                
              
                <a type="button" class="btn btn-info m-1" href="kardexinsumos" >
                    
                  Kardex de Insumo

                </a>
          
        
            </div>

        
      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaInventarioInsumos" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:10px">#</th>
         <th>Nombre</th>
         <th>Stock</th>

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
MODAL INGRESO DE INSUMO
======================================-->

<div id="modalIngresoInsumo" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Ingreso de Insumo</h4>
      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

          <!-- ENTRADA PARA SELECCIONAR INSUMO -->

          <div class="form-group col-sm">
            
            <div class="input-group">

                <select class="form-control select input-lg" style="width: 100%;" id="nuevoInsumoI" name="nuevoInsumoI" required>
                
                <option value="">Seleccionar Insumo</option>

                <?php 
                  $item = null;
                  $valor = null;

                  $insumos = ControladorInsumos::ctrMostrarInsumos($item,$valor);

                  foreach($insumos as $key=> $value){ 

                    $item = "idMarca";
                    $valor = $insumos[$key]["idMarca"];

                    $marcas = ControladorMarcas::ctrMostrarMarcas($item,$valor);

                    echo '<option value="'.$value["idMateria"].'">'.$value["nombre"].' - '.$marcas["descripcion"].'</option>';
                  }

                  ?>

              </select>

            </div>

          </div>


            <!-- ENTRADA PARA EL CANTIDAD -->

            <div class="form-group col-sm">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevaCantidadI" placeholder="Ingresar cantidad" 
                 min="0" max="9999999" step="0.001" required>
            </div>

            </div>

          </div>


          <div class="row">

          <!-- ENTRADA PARA LA OBSERVACIÓN -->

          <div class="form-group col-sm">
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevaObservacionI" name="nuevaObservacionI" 
                 placeholder="Ingresar observación" maxlength="100" pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ ]+"
                 title="Solo se acepta letras y números" required>
            </div>
           </div>

          <!-- ENTRADA PARA LA FECHA -->
          <div class="form-group col-sm">
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="date" class="form-control input-lg" name="nuevaFechaI" id="nuevaFechaI"
               placeholder="Ingresar fecha de registro" required>
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

        <button type="submit" class="btn btn-primary">Guardar</button>

      </div>

      <?php

        $crearIngresoInsumo= new ControladorInventarioInsumos();
        $crearIngresoInsumo -> ctrCrearIngresoInsumo();

      ?>


    </form>

  </div>

</div>

</div>




<!--=====================================
MODAL SALIDA DE INSUMO
======================================-->

<div id="modalSalidaInsumo" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Salida de Insumo</h4>
      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA SELECCIONAR INSUMO -->

            <div class="form-group col-sm">
            
            <div class="input-group">

                <select class="form-control select2 input-lg" style="width: 100%;" id="nuevoInsumoS" name="nuevoInsumoS" required>
                
                <option value="">Seleccionar Insumo</option>

                <?php 
                  $item = null;
                  $valor = null;

                  $insumos = ControladorInsumos::ctrMostrarInsumos($item,$valor);

                  foreach($insumos as $key=> $value){ 

                    $item = "idMarca";
                    $valor = $insumos[$key]["idMarca"];

                    $marcas = ControladorMarcas::ctrMostrarMarcas($item,$valor);

                    echo '<option value="'.$value["idMateria"].'">'.$value["nombre"].' - '.$marcas["descripcion"].'</option>';
                  }

                  ?>

              </select>

            </div>

          </div>


            <!-- ENTRADA PARA EL CANTIDAD -->

            <div class="form-group col-sm">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevaCantidadS" placeholder="Ingresar cantidad" 
                 min="0" max="9999999" step="0.001" required>
            </div>

            </div>

          </div>


          <div class="row">

          <!-- ENTRADA PARA LA OBSERVACIÓN -->

          <div class="form-group col-sm">
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevaObservacionS" name="nuevaObservacionS" 
                 placeholder="Ingresar observación" maxlength="100" pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ ]+"
                 title="Solo se acepta letras y números" required>
            </div>
           </div>

          <!-- ENTRADA PARA LA FECHA -->
          <div class="form-group col-sm">
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="date" class="form-control input-lg" name="nuevaFechaS" id="nuevaFechaS"
               placeholder="Ingresar fecha de registro" required>
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

        <button type="submit" class="btn btn-primary">Guardar</button>

      </div>

      <?php

          $crearSalidaInsumo= new ControladorInventarioInsumos();
          $crearSalidaInsumo -> ctrCrearSalidaInsumo();

      ?>


    </form>

  </div>

</div>

</div>
