<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Lote de Productos</h1>
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
                  <select class="form-control select2" style="width: 100%;" id="ProductoL" name="ProductoL" required>
                  
                  <option value="0">Seleccionar Producto</option>

                  <?php 
                  $item = null;
                  $valor = null;

                  $productos = ControladorProductos::ctrMostrarProductos($item,$valor);

                  foreach($productos as $key=> $value){ 


                    echo '<option value="'.$value["idProducto"].'" nombreProducto="'.$value["nombre"].'">'.$value["nombre"].'</option>';
                  }

                  ?>

                </select>
              </div>
              <div class="form-group col-3">
              <div class="row justify-content-between">
              <div class="btn-group col m-1">
              <button type="button" class="btn btn-primary btnLoteProductos" id="LoteProductos">  
                 Buscar
              </button>
              </div>

              <div class="btn-group col m-1">

              <a type="button" class="btn btn-secondary" href="inventarioproductos">Volver</a>

              </div>
              </div>
              </div>


        </div>

             <!-- row para criterios de busqueda -->

             <div class="card card-primary collapsed-card">
                     <div class="card-header">
                         <h3 class="card-title">Filtros de búsqueda</h3>
                         <div class="card-tools">
                             <button type="button" class="btn btn-sm btn-warning" data-card-widget="collapse">
                                 Mostrar
                             </button>
                             <button type="button" class="btn btn-sm btn-success" id="btnLimpiarBusqueda">
                                 Limpiar
                             </button>
                         </div> <!-- ./ end card-tools -->
                     </div> <!-- ./ end card-header -->
                     <div class="card-body">
                         <div class="row">

                          <!-- ENTRADA PARA EL LOTE -->
                          <div class="form-group col-sm-6 col-md-4 col-lg">
                          <div class="input-group">
                              <input type="text" id="lote"  class="form-control" placeholder="Lote"  data-index="1">   
                          </div>
                          </div>

                          <!-- ENTRADA PARA LA FECHA DE EMISIÓN -->
                          <div class="form-group col-sm-6 col-md-4 col-lg">
                          <div class="input-group">
                              <input type="text" id="fechaVencimiento"  class="form-control" placeholder="Fecha de Vencimiento"  data-index="2">   
                          </div>
                          </div>

                         </div>
                     </div> <!-- ./ end card-body -->
                 </div>

      <div  class="card-body">

      <table id="tablaKardexProductos" class="table table-bordered table-striped dt-responsive tablaLoteProductos" width="100%">
       
       <thead>
        
        <tr>
          <th style="width:0px">#</th>
          <th>Código Lote</th>
          <th>Fecha de Vencimiento</th>
          <th>Cantidad</th>
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







