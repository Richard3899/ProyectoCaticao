<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Costo de Recetas y Gasto Administrativo</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Costos</li>
            <li class="breadcrumb-item active">Costo de Recetas y Gasto Administrativo</li>
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

      <button class="btn btn-primary" data-toggle="modal" data-target="#modalCostoRecetaGastoAdmin">
        
        Agregar

      </button>

      </div>

      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaCostoReceta" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:20px">#</th>
         <th>Descripción</th>
         <th>Mes</th>
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
MODAL COSTO DE RECETA Y GASTO ADMIN
======================================-->

<div id="modalCostoRecetaGastoAdmin" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Costo de receta y Gasto Admin</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

        <div class="row">


            <!-- ENTRADA PARA EL DESCRIPCIÓN -->

           <div class="form-group col-sm">
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevaDescripcion" id="nuevaDescripcion" placeholder="Ingresar descripción" 
                maxlength="20" pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras y números" required>
            </div>
           </div>

           <!-- ENTRADA PARA EL MES -->
           <div class="form-group col-sm">
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                </div>
                <input type="month" name="fechaMes" id="fechaMes" class="form-control" required>
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

        $guardarRecetaCostoVenta = new ControladorRecetaCostoVenta();
        $guardarRecetaCostoVenta -> ctrCrearRecetaCostoVenta();

      ?>


    </form>

  </div>

</div>

</div>