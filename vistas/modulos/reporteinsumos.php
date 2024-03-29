<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container-fluid">
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
            <li class="breadcrumb-item active">Reporte Insumos</li>
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
                         <h3 class="card-title">Filtros de búsqueda</h3>
                         <div class="card-tools">
                             <button type="button" class="btn btn-sm btn-warning" data-card-widget="collapse">
                                 Mostrar
                             </button>
                             <button type="button" class="btn btn-sm btn-success" id="btnLimpiarBusquedaInsumos">
                                 Limpiar
                             </button>
                         </div> <!-- ./ end card-tools -->
                     </div> <!-- ./ end card-header -->
                     <div class="card-body">
                         <div class="row">

                         <!-- <div class="form-label-group col-sm-6 col-md-3 col-lg">
                            <input type="emai" id="inputEmail4" class="form-control" placeholder="Email" required="" autofocus="">
                            <label for="inputEmail4">Email Address</label>
                         </div> -->
                        
                          <!-- ENTRADA PARA EL CÓDIGO -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <div class="input-group ">
                              <input type="text" id="codigo" class="form-control" placeholder="Código"  data-index="1">    
                          </div>
                          </div>
                          
                          <!-- ENTRADA PARA EL NOMBRE -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <div class="input-group ">
                              <input type="text" id="nombre" class="form-control" placeholder="Nombre" data-index="2">   
                          </div>
                          </div>

                          <!-- ENTRADA PARA EL DESCRIPCIÓN -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <div class="input-group ">
                              <input type="text" id="descripcion" class="form-control" placeholder="Descripción"  data-index="3">   
                          </div>
                          </div>

                          <!-- ENTRADA PARA EL UNIDAD DE MEDIDA -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <div class="input-group ">
                              <input type="text" id="unidadMedida" class="form-control" placeholder="Unidad de Medida"  data-index="4">   
                          </div>
                          </div>

                          <!-- ENTRADA PARA EL MARCA -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <div class="input-group ">
                              <input type="text" id="marca" class="form-control" placeholder="Marca"  data-index="5">   
                          </div>
                          </div>

                          <!-- ENTRADA PARA EL PRECIO UNITARIO -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <div class="input-group ">
                              <input type="text" id="precioUnitario" class="form-control" placeholder="Precio Unitario"  data-index="6">   
                          </div>
                          </div>

                          <!-- ENTRADA PARA EL STOCK DESDE -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <div class="input-group ">
                              <input type="text" id="stockDesde" class="form-control" placeholder="Stock Desde >"  data-index="7">   
                          </div>
                          </div>

                          <!-- ENTRADA PARA EL STOCK HASTA -->
                          <div class="form-group col-sm-6 col-md-3 col-lg">
                          <div class="input-group ">
                              <input type="text" id="stockHasta" class="form-control" placeholder="< Stock Hasta" data-index="7">   
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

