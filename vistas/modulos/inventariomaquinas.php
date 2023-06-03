<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container-fluid">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Inventario de Maquinas</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Inventario</li>
            <li class="breadcrumb-item active">Maquinas</li>
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

                <div class="btn-group col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4 my-1">

                <?php 
                if($permisoInsertar==1){

                echo  "<button type='button' class='btn btn-success col-6 col-sm' data-toggle='modal' data-target='#modalIngresoMaquina'>
                      Ingreso Maquina
                      </button>
                       
                      <button type='button' class='btn btn-primary col-6 col-sm' data-toggle='modal' data-target='#modalSalidaMaquina'>
                      Salida Maquina
                      </button>";

                }else{

                echo  "<button type='button' class='btn btn-success col-6 col-sm'>
                      Ingreso Maquina
                      </button>
                   
                      <button type='button' class='btn btn-primary col-6 col-sm'>
                      Salida Maquina
                      </button>";

                }
                ?>

                </div>
                
                <a type="button" class="btn btn-info col-12 col-sm-4 col-md-3 col-lg-3 col-xl-2 my-1" href="kardexmaquinas" >
                    
                  Kardex de Maquina

                </a>
          
        
            </div>
        
      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaInventarioMaquinas" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:10px">#</th>
         <th>Nombre</th>
         <th>Stock</th>
         <th>Último Movimiento</th>
         
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
MODAL INGRESO DE MAQUINA
======================================-->

<div id="modalIngresoMaquina" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Ingreso de Maquina</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

          <!-- ENTRADA PARA SELECCIONAR MAQUINA -->
          <div class="form-group col-sm">
            <label for="maquina">Maquina</label>
            <div class="input-group">

                <select class="form-control select2 input-lg" style="width: 100%;" id="nuevoMaquinaI" name="nuevoMaquinaI" required>
                
                <option value="">Seleccionar Maquina</option>

                <?php 
                  $item = null;
                  $valor = null;

                  $maquinas = ControladorMaquinas::ctrMostrarMaquinas($item,$valor);

                  foreach($maquinas as $key=> $value){ 


                    echo '<option value="'.$value["idMaquina"].'">'.$value["nombre"].'</option>';
                  }

                  ?>

              </select>

            </div>

          </div>

            <!-- ENTRADA PARA EL CANTIDAD -->
            <div class="form-group col-sm">
            <label for="cantidad">Cantidad</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevaCantidadI" placeholder="Ingresar cantidad" 
                 min="1" max="9999999" required>
            </div>

            </div>

          </div>

          <div class="row">

          <!-- ENTRADA PARA LA FECHA -->
          <div class="form-group col-sm">
          <label for="fechaEmision">Fecha de Emisión</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
               <input type="date" class="form-control input-lg"  name="nuevaFechaI" id="nuevaFechaI" required>
          </div>
          </div>

          <!-- ENTRADA PARA LA OBSERVACIÓN -->
          <div class="form-group col-sm">
          <label for="observacion">Observación</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevaObservacionI" name="nuevaObservacionI" 
                 placeholder="Ingresar observación" maxlength="100" pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;()+/=* ]+" 
                 title="Solo se acepta letras y números" required>
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

        $crearIngresoMaquina= new ControladorInventarioMaquinas();
        $crearIngresoMaquina -> ctrCrearIngresoMaquina();

      ?>

    </form>

  </div>

</div>

</div>

<!--=====================================
MODAL SALIDA DE MAQUINA
======================================-->

<div id="modalSalidaMaquina" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Salida de Maquina</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA SELECCIONAR MAQUINA -->
            <div class="form-group col-sm">
            <label for="maquina">Maquina</label>
            <div class="input-group">

                <select class="form-control select2 input-lg" style="width: 100%;" id="nuevoMaquinaS" name="nuevoMaquinaS" required>
                
                <option value="">Seleccionar Maquina</option>

                <?php 
                  $item = null;
                  $valor = null;

                  $maquinas = ControladorMaquinas::ctrMostrarMaquinas($item,$valor);

                  foreach($maquinas as $key=> $value){ 


                    echo '<option value="'.$value["idMaquina"].'">'.$value["nombre"].'</option>';
                  }

                  ?>

              </select>

            </div>

          </div>

            <!-- ENTRADA PARA EL CANTIDAD -->
            <div class="form-group col-sm">
            <label for="cantidad">Cantidad</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevaCantidadS" placeholder="Ingresar cantidad" 
                 min="1" max="9999999" required>
            </div>

            </div>

          </div>

          <div class="row">

          <!-- ENTRADA PARA LA FECHA -->
          <div class="form-group col-sm">
          <label for="fechaEmision">Fecha de Emisión</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
               <input type="date" class="form-control input-lg"  name="nuevaFechaS" id="nuevaFechaS" required>
          </div>
          </div>

          <!-- ENTRADA PARA LA OBSERVACIÓN -->
          <div class="form-group col-sm">
          <label for="observacion">Observación</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevaObservacionS" name="nuevaObservacionS" 
                 placeholder="Ingresar observación" maxlength="100" pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;()+/=* ]+" 
                 title="Solo se acepta letras y números" required>
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

          $crearSalidaMaquina= new ControladorInventarioMaquinas();
          $crearSalidaMaquina -> ctrCrearSalidaMaquina();

      ?>

    </form>

  </div>

</div>

</div>
