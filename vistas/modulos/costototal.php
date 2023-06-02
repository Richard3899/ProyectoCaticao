<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Costo Total Receta : <?php echo $_GET['codigo']; ?></h1>
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
   
      <input type="hidden" name="idReceta" id="idReceta" value="<?php echo $_GET['idReceta']; ?>">
      <input type="hidden" name="codigo" id="codigo" value="<?php echo $_GET['codigo']; ?>">
      
        <div class="row justify-content-sm-end">

          <a type="button" class="btn btn-secondary col-12 col-sm-4 col-md-3 col-lg-2 col-xl-2" href="costoreceta">Volver</a> 
        </div>

      </div>

      <div class="card-body">

        <table id="tablaCostoTotal" class="table table-bordered table-striped dt-responsive tablaCostoTotal" width="100%">
        
          <thead>
          
          <tr>
            <th>Nombre</th>
            <th>Precio Unitario</th>
            <th>Cantidad</th>
            <th>Total</th>

          </tr> 

          </thead>

        </table>

      </div>
      <div class="card-footer">

        <div class="row justify-content-sm-end">

        <a type="button" class="btn btn-secondary col-12 col-sm-4 col-md-3 col-lg-2 col-xl-2" href="costoreceta">Volver</a>

        </div>

      </div>
      <!-- /.card-body -->
    </div>
    <!-- /.card -->
  </section>
  <!-- /.content -->
  </div>
</div>
<!-- /.content-wrapper -->

