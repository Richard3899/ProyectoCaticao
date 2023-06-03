<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container-fluid">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Costo por Receta</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Costeo</li>
            <li class="breadcrumb-item active">Costo por Receta</li>
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
        
      <?php 
       if($permisoInsertar==1){

       echo "<button class='btn btn-info' onclick='LimpiarModalAsignar()' data-toggle='modal' data-target='#modalAsignarAdicional'> 
             Asignar Adicional</button>";

       }else{

       echo "<button class='btn btn-info'>Asignar Adicional</button>";

       }
      ?>
      
      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaCostoReceta" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:20px">#</th>
         <th>Código</th>
         <th>Nombre</th>
         <th>Batch</th>
         <th>Fecha de Fin</th>
         <th>Adicionales</th>
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
MODAL ASIGNAR ADICIONAL
======================================-->

<div id="modalAsignarAdicional" data-backdrop="static" class="modal fade" role="dialog">

<div class="modal-dialog modal-xl">
  
  <div class="modal-content">

    <form id="form" role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Asignación de Adicionales</h4>

      <button type="button" class="close" data-dismiss="modal" onclick="LimpiarModalAsignar()">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="card">
        <div class="card-header">
        
        <div class="row">

        <!-- ENTRADA PARA SELECCIONAR INSUMO -->
        <div class="form-group col-sm">
          <label for="insumo">Mes</label>
            <div class="input-group">

                <select class="form-control select2 input-lg seleccionarMesGasto" id="seleccionarMesGasto" name="seleccionarMesGasto" style="width: 100%;" required>
                
                <option value="">Seleccionar Mes :</option>

                <?php 

                  $mes = ControladorMesGasto::ctrMostrarMesGasto2();

                  foreach($mes as $key=> $value){  

                    echo '<option value="'.$value["idMesGasto"].'">'.$value["descripcion"].'</option>';
                  
                  }

                  ?>

              </select>
              

            </div>

          </div>

          <!-- ENTRADA PARA SELECCIONAR EL TIPO DE GASTO-->
          <div class="form-group col-sm">
            <label for="unidadMedida">Tipo de Gasto</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-ruler"></i></span>
                </div>

                <select class="form-control input-lg" id="nuevoTipoGasto" name="nuevoTipoGasto" required>
                
                <option value="">Seleccionar :</option>
  
              </select>

            </div>

          </div>
        </div>
        
        </div>
    
        <div class="card-body">

        
        <table class="table table-bordered table-striped tablaAsignacionAdicionales" width="100%">
       
        <thead>
          
          <tr id="thRecetasyGastos">
            
          </tr> 
  
        </thead>
  
        </table>

        <input type="hidden" id="indice" name="indice">
        <input type="hidden" id="idReceta" name="idReceta">
        <input type="hidden" id="idGastoAdminPorMes" name="idGastoAdminPorMes">
        
        <input type="hidden" id="RecetasActualizar" name="RecetasActualizar">

        </div>
        </div>

      </div>

      <!--=====================================
      PIE DEL MODAL
      ======================================-->

      <div class="modal-footer">

        <button type="button" class="btn btn-default pull-left" data-dismiss="modal" onclick="LimpiarModalAsignar()">Cancelar</button>

        <button type="submit" class="btn btn-primary">Asignar</button>

      </div>

      <?php

          $crearRecetaGastoAdminPorMes= new ControladorRecetaGastoAdminPorMes();
          $crearRecetaGastoAdminPorMes -> ctrCrearRecetaGastoAdminPorMes();

      ?>


    </form>

  </div>

</div>

</div>

<?php

$ocultarAdicional= new ControladorRecetaGastoAdminPorMes();
$ocultarAdicional -> ctrOcultarAdicional();

?>