<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Reporte de Insumos</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Reportes</li>
            <li class="breadcrumb-item active">Reporte de Insumos</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content">
    <!-- Default box -->
             <!-- row para criterios de busqueda -->
             <div class="row">
             <div class="col-lg-12">
                 <div class="card card-primary collapsed-card">
                     <div class="card-header">
                         <h3 class="card-title">Filtros de busqueda</h3>
                         <div class="card-tools">
                             <button type="button" class="btn btn-tool btn-warning" data-card-widget="collapse">
                                 Mostrar
                             </button>
                             <button type="button" class="btn btn-tool btn-success" id="btnLimpiarBusqueda">
                                 Limpiar
                             </button>
                         </div> <!-- ./ end card-tools -->
                     </div> <!-- ./ end card-header -->
                     <div class="card-body">
                         <div class="row">
                            
                          <!-- ENTRADA PARA EL CÓDIGO -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <label for="codigo">Código</label>
                          <div class="input-group ">
                              <input type="text" id="codigo" class="form-control"  data-index="1">    
                          </div>
                          </div>
                          
                          <!-- ENTRADA PARA EL NOMBRE -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <label for="nombre">Nombre</label>
                          <div class="input-group ">
                              <input type="text" id="nombre" class="form-control"  data-index="2">   
                          </div>
                          </div>

                          <!-- ENTRADA PARA EL DESCRIPCIÓN -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <label for="descripcion">Descripción</label>
                          <div class="input-group ">
                              <input type="text" id="descripcion" class="form-control"  data-index="3">   
                          </div>
                          </div>

                          <!-- ENTRADA PARA EL UNIDAD DE MEDIDA -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <label for="unidadMedida">Unidad de Medidad</label>
                          <div class="input-group ">
                              <input type="text" id="unidadMedida" class="form-control"  data-index="4">   
                          </div>
                          </div>

                          <!-- ENTRADA PARA EL MARCA -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <label for="marca">Marca</label>
                          <div class="input-group ">
                              <input type="text" id="marca" class="form-control"  data-index="5">   
                          </div>
                          </div>

                          <!-- ENTRADA PARA EL PRECIO UNITARIO -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <label for="precioUnitario">PrecioUnitario</label>
                          <div class="input-group ">
                              <input type="text" id="precioUnitario" class="form-control"  data-index="6">   
                          </div>
                          </div>

                          <!-- ENTRADA PARA EL CÓDIGO -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <label for="iptCodigoBarras">Código de Barras</label>
                          <div class="input-group ">
                              <input type="text" id="codigo" class="form-control"  data-index="7">   
                          </div>
                          </div>

                         </div>
                     </div> <!-- ./ end card-body -->
                 </div>
             </div>
             
         </div>

    <div class="card">

      <div class="card-body">

      <table id="tablaReporteInsumos" class="table table-bordered table-striped dt-responsive tablaReporteInsumos" width="100%">
       
      <thead>
       
       <tr>
         <th style="width:10px">#</th>
         <th>Código</th>
         <th>Nombre</th>
         <th>Descripción</th>
         <th>Unidad de Medida</th>
         <th>Marca</th>
         <th>Precio Unitario</th>
         <th>Stock</th>

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

