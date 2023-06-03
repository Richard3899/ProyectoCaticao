<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container-fluid">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h3>Costo total de los gastos de : <?php echo $_GET['descripcion']; ?></h3>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Costos</li>
            <li class="breadcrumb-item active">Costo total por Mes</li>
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
   
      <input type="hidden" name="idMesGasto" id="idMesGasto" value="<?php echo $_GET['idMesGasto']; ?>">
      <input type="hidden" name="mes" id="mes" value="<?php echo $_GET['mes']; ?>">
      <input type="hidden" name="descripcion" id="descripcion" value="<?php echo $_GET['descripcion']; ?>">
      
      <div class="row justify-content-sm-end">

         <a type="button" class="btn btn-secondary col-12 col-sm-4 col-md-3 col-lg-2 col-xl-2" href="mesgasto">Volver</a>
      </div>

      </div>

      <div class="card-body">

      <table id="tablaCostoTotalPorMes" class="table table-bordered table-striped dt-responsive tablaCostoTotalPorMes" width="100%">
       
      <thead>
       
       <tr>
         <th>Descripción</th>
         <th>Total</th>

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

