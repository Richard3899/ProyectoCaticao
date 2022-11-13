<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Inventario de Materiales</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Inventario</li>
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
        <div class="form-group">

            <div class="btn-toolbar justify-content-between m-2">

                <div class="input-group">

                <button type="button" class="btn btn-success m-1" data-toggle="modal" data-target="#modalIngresoMaterial">
                    
                    Ingreso Material

                </button>

                <button type="button" class="btn btn-primary m-1" data-toggle="modal" data-target="#modalSalidaMaterial">
                    
                    Salida Material

                </button>

                </div>
                
              
                <a type="button" class="btn btn-info m-1" href="kardexmateriales" >
                    
                  Kardex de Material

                </a>
          
        
            </div>

        
      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaInventarioMateriales" width="100%">
       
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
MODAL INGRESO DE MATERIAL
======================================-->

<div id="modalIngresoMaterial" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Ingreso de Material</h4>
      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

          <!-- ENTRADA PARA SELECCIONAR MATERIAL -->

          <div class="form-group col-sm">
            
            <div class="input-group">

                <select class="form-control select input-lg" style="width: 100%;" id="nuevoMaterialI" name="nuevoMaterialI" required>
                
                <option value="">Seleccionar Material</option>

                <?php 
                  $item = null;
                  $valor = null;

                  $materiales = ControladorMateriales::ctrMostrarMateriales($item,$valor);

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
                 placeholder="Ingresar observación" maxlength="100" pattern="[A-Za-z0-9\u00f1\u00d1 ]+" 
                 title="Solo se acepta letras y números" required>
            </div>
           </div>

          <!-- ENTRADA PARA EL FECHA -->
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

        $crearIngresoMaterial= new ControladorInventarioMateriales();
        $crearIngresoMaterial -> ctrCrearIngresoMaterial();

      ?>


    </form>

  </div>

</div>

</div>




<!--=====================================
MODAL SALIDA DE MATERIAL
======================================-->

<div id="modalSalidaMaterial" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Salida de Material</h4>
      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA SELECCIONAR MATERIAL -->

            <div class="form-group col-sm">
            
            <div class="input-group">

                <select class="form-control select2 input-lg" style="width: 100%;" id="nuevoMaterialS" name="nuevoMaterialS" required>
                
                <option value="">Seleccionar Material</option>

                <?php 
                  $item = null;
                  $valor = null;

                  $materiales = ControladorMateriales::ctrMostrarMateriales($item,$valor);

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
                 placeholder="Ingresar observación" maxlength="100" pattern="[A-Za-z0-9\u00f1\u00d1 ]+" 
                 title="Solo se acepta letras y números" required>
            </div>
           </div>

          <!-- ENTRADA PARA EL FECHA -->
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

          $crearSalidaMaterial= new ControladorInventarioMateriales();
          $crearSalidaMaterial -> ctrCrearSalidaMaterial();

      ?>


    </form>

  </div>

</div>

</div>
