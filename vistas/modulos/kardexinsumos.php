<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Kardex de Insumos</h1>
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

        <div class="row justify-content-center m-2">
            
              <!-- ENTRADA PARA SELECCIONAR INSUMO -->
              <div class="form-group col-9 col-sm-9 col-md-6 col-lg-6 m-1">
                  <select class="form-control select2" style="width: 100%;" id="InsumoK" name="InsumoK" required>
                  
                  <option value="0">Seleccionar Insumo</option>

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
              <div class="form-group col-9 col-sm-9 col-md-4 col-lg-4">
              <div class="row justify-content-between">
              <div class="btn-group col m-1">
              <button type="button" class="btn btn-primary btnKardexInsumos" id="KardexInsumos">  
                 Buscar
              </button>
              </div>

              <div class="btn-group col m-1">

              <a type="button" class="btn btn-secondary" href="inventarioinsumos">Volver</a>

              </div>
              </div>
              </div>


        </div>


      <div  class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaKardexInsumos" width="100%">
       
       <thead>
        
        <tr>
          <th style="width:0px">#</th>
          <th>Fecha y Hora</th>
          <th>Transacción</th>
          <th>Descripción</th>
          <th>Fecha Emisión</th>
          <th>Ingreso</th>
          <th>Salida</th>
          <th>Saldo</th>
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







