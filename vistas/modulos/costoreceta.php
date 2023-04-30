<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Costo por Receta</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Costos</li>
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

       echo "<button class='btn btn-info' data-toggle='modal' data-target='#modalAsignarAdicional'> 
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
MODAL AGREGAR COSTOS DE VENTAS
======================================-->

<div id="modalAsignarAdicional" class="modal fade" role="dialog">

<div class="modal-dialog modal-xl">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Asignación de Adicionales</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="card">
        <div class="card-body">
        <table class="table table-bordered table-striped dt-responsive tablaAsignacionAdicionales" width="100%">
       
        <thead>
          
          <tr>
            
            <th style="width:20px">Recetas</th>
            <?php 

              $item = null;
              $valor = null;

              $gastosadmin = ControladorGastoAdmin::ctrMostrarGastoAdmin($item,$valor);

              foreach($gastosadmin as $key=> $value){
                echo '<th>'.$value["descripcion"].'</th>';
              }

            ?>
  
          </tr> 
  
        </thead>
  
        </table>

        </div>
        </div>

      </div>

      <!--=====================================
      PIE DEL MODAL
      ======================================-->

      <div class="modal-footer">

        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancelar</button>

        <button type="submit" class="btn btn-primary">Guardar Asignación</button>

      </div>

      <!-- <?php

          $crearCostoVenta= new ControladorCostoVenta();
          $crearCostoVenta -> ctrCrearCostoVenta();

      ?> -->


    </form>

  </div>

</div>

</div>