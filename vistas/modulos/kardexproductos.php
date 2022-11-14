<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Kardex de Productos</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Inventario</li>
            <li class="breadcrumb-item active">Productos</li>
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
            
              <!-- ENTRADA PARA SELECCIONAR PRODUCTO -->
              <div class="form-group col-6 m-1">
                  <select class="form-control select2" style="width: 100%;" id="ProductoK" name="ProductoK" required>
                  
                  <option value="0">Seleccionar Producto</option>

                  <?php 
                  $item = null;
                  $valor = null;

                  $productos = ControladorProductos::ctrMostrarProductos($item,$valor);

                  foreach($productos as $key=> $value){ 


                    echo '<option value="'.$value["idProducto"].'">'.$value["nombre"].'</option>';
                  }

                  ?>

                </select>
              </div>
              <div class="form-group col-3">
              <div class="row justify-content-between">
              <div class="btn-group col m-1">
              <button type="button" class="btn btn-primary btnKardexProductos" id="KardexProductos">  
                 Buscar
              </button>
              </div>

              <div class="btn-group col m-1">

              <a type="button" class="btn btn-secondary" href="inventarioproductos">Volver</a>

              </div>
              </div>
              </div>


        </div>


      <div  class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaKardexProductos" width="100%">
       
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







