<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Costo Total : <?php echo $_GET['descripcion']; ?></h1>
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
   
      <input type="hidden" name="idCostoRecetasGastoAdmin" id="idCostoRecetasGastoAdmin" value="<?php echo $_GET['idCostoRecetasGastoAdmin']; ?>">
      <input type="hidden" name="mes" id="mes" value="<?php echo $_GET['mes']; ?>">
      <input type="hidden" name="descripcion" id="descripcion" value="<?php echo $_GET['descripcion']; ?>">
      
      <div class="row justify-content-sm-end">

         <a type="button" class="btn btn-secondary col-12 col-sm-4 col-md-3 col-lg-2 col-xl-2" href="costorecetasgastoadmin">Volver</a>
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

