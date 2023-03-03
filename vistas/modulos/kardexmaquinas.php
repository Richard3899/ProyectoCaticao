<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Kardex de Maquinas</h1>
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

        <div class="row justify-content-center m-2">
            
              <!-- ENTRADA PARA SELECCIONAR MAQUINA -->
              <div class="form-group col-6 m-1">
                  <select class="form-control select2" style="width: 100%;" id="MaquinaK" name="MaquinaK" required>
                  
                  <option value="0">Seleccionar Maquina</option>

                  <?php 
                  $item = null;
                  $valor = null;

                  $maquinas = ControladorMaquinas::ctrMostrarMaquinas($item,$valor);

                  foreach($maquinas as $key=> $value){ 


                    echo '<option value="'.$value["idMaquina"].'" nombreMaquina="'.$value["nombre"].'">'.$value["nombre"].'</option>';
                  }

                  ?>

                </select>
              </div>
              <div class="form-group col-3">
              <div class="row justify-content-between">
              <div class="btn-group col m-1">
              <button type="button" class="btn btn-primary btnKardexMaquinas" id="KardexMaquinas">  
                 Buscar
              </button>
              </div>

              <div class="btn-group col m-1">

              <a type="button" class="btn btn-secondary" href="inventariomaquinas">Volver</a>

              </div>
              </div>
              </div>


        </div>


      <div  class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaKardexMaquinas" width="100%">
       
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







