<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container-fluid">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Inventario de Productos</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Inventario</li>
            <li class="breadcrumb-item active">Inventario Productos</li>
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
        <div class="form-group">

            <div class="btn-toolbar justify-content-between m-2">

                <div class="btn-group col-12 col-sm-12 col-md-6 col-lg-5 col-xl-4 my-1">

                <?php 
                if($permisoInsertar==1){

                echo  "<button type='button' class='btn btn-success col-6 col-sm' data-toggle='modal' data-target='#modalIngresoProducto'>
                      Ingreso Producto
                      </button>
                       
                      <button type='button' class='btn btn-primary col-6 col-sm' data-toggle='modal' data-target='#modalSalidaProducto'>
                      Salida Producto
                      </button>";

                }else{

                echo  "<button type='button' class='btn btn-success col-6 col-sm-6 col-md-6'>
                      Ingreso Producto
                      </button>
                   
                      <button type='button' class='btn btn-primary col-6 col-sm-6 col-md-6'>
                      Salida Producto
                      </button>";

                }
                ?>

                </div>
                <div class="btn-group col-12 col-sm-12 col-md-6 col-lg-5 col-xl-4 my-1">
                <a type="button" class="btn btn-info col-12 col-sm-6 col-md-7 col-lg-7" href="kardexproductos">
                  Kardex de Producto
                </a>                
                
                <a type="button" class="btn btn-warning col-12 col-sm-6 col-md-5 col-lg-5" href="loteproductos">
                  Lotes
                </a>
                </div>
        
            </div>

      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaInventarioProductos" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:10px">#</th>
         <th>Nombre</th>
         <th>Tipo de Producto</th>
         <th>Stock</th>
         <th>Unidad de Medida</th>
         <th>Último Movimiento</th>

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
MODAL INGRESO DE PRODUCTO
======================================-->

<div id="modalIngresoProducto" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Ingreso de Producto</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">
            <input type="hidden" id="idLote" name="idLote">
            <!-- ENTRADA PARA SELECCIONAR PRODUCTO -->
            <div class="form-group col-sm">
              <label for="producto">Producto</label>
              <div class="input-group">

                  <select class="form-control select2 input-lg" id="nuevoProductoI" name="nuevoProductoI" style="width: 100%;" required>
                  <option value="">Seleccionar Producto</option>

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

            </div>

            <!-- ENTRADA PARA EL LOTE -->
            <div class="form-group col-sm">
            <label for="lote">Lote</label>
            <div class="input-group ">
                  <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-vote-yea"></i></span>
                  </div>
                  <input type="text" class="form-control input-lg" name="nuevoCodigoLoteI" id="nuevoCodigoLoteI" placeholder="Ingresar lote" 
                  maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" required>
            </div>
            </div>
          </div>

          <div class="row">

            <!-- ENTRADA PARA EL CANTIDAD -->
            <div class="form-group col-sm">
            <label for="cantidad">Cantidad</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevaCantidadI" id="nuevaCantidadI" placeholder="Ingresar cantidad" 
                 min="1" max="9999999" required>

                <input type="text" class="form-control input-lg"  id="unidadMedidaI" name="unidadMedidaI" readonly>
            </div>
            </div>

            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Precio Unitario</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><strong>S/.</strong></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevoPrecioUnitario" id="nuevoPrecioUnitario"
                placeholder="Ingresar precio unitario" min="0.01" max="9999999" step="0.01" required>
            </div>
            </div>

          </div>

          <div class="row">

          <!-- ENTRADA PARA LA FECHA DE PRODUCCIÓN -->
          <div class="form-group col-sm">
          <label for="fechaVencimiento">Fecha de Producción</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="date" class="form-control input-lg"  name="nuevaFechaProduccionI" id="nuevaFechaProduccionI" required>
          </div>
          </div>

          <!-- ENTRADA PARA LA FECHA DE VENCIMIENTO -->
          <div class="form-group col-sm">
          <label for="fechaVencimiento">Fecha de Vencimiento</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="date" class="form-control input-lg"  name="nuevaFechaVencimientoI" id="nuevaFechaVencimientoI" required>
          </div>
          </div>
               
          </div>

          <div class="row">

          <!-- ENTRADA PARA LA FECHA -->
          <div class="form-group col-sm">
          <label for="fechaEmision">Fecha Emisión</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="date" class="form-control input-lg"  name="nuevaFechaI" id="nuevaFechaI" required>
               
          </div>
          </div>  

          <!-- ENTRADA PARA LA OBSERVACIÓN -->
          <div class="form-group col-sm">
          <label for="observacion">Observación</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevaObservacionI" name="nuevaObservacionI" 
                 placeholder="Ingresar observación" maxlength="100" pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;()+/=* ]+" 
                 title="Solo se acepta letras y números" required>
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

        $crearIngresoProducto= new ControladorInventarioProductos();
        $crearIngresoProducto -> ctrCrearIngresoProducto();

      ?>


    </form>

  </div>

</div>

</div>

<!--=====================================
MODAL SALIDA DE PRODUCTO
======================================-->

<div id="modalSalidaProducto" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Salida de Producto</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA SELECCIONAR PRODUCTO -->
            <div class="form-group col-sm">
            <label for="producto">Producto</label>
            <div class="input-group">

                <select class="form-control select2 input-lg nuevoProductoS" style="width: 100%;" id="nuevoProductoS" name="nuevoProductoS" required>
                
                <option value="">Seleccionar Producto</option>

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

          </div>

          <!-- ENTRADA PARA SELECCIONAR LOTE -->
          <div class="form-group col-sm">
          <label for="estado">Lote</label>
            <div class="input-group">

                <select class="form-control select2 input-lg idLoteS" id="idLoteS" name="idLoteS" style="width: 100%;" required disabled>

                <option value="">Seleccionar Lote</option>

              </select>

            </div>
          </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA EL CANTIDAD -->
            <div class="form-group col-sm">
            <label for="cantidad">Cantidad</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg nuevaCantidadS" id="nuevaCantidadS" name="nuevaCantidadS" placeholder="Ingresar cantidad" 
                 min="1" max="9999999" required disabled>

                <input type="text" class="form-control input-lg"  id="unidadMedidaS" name="unidadMedidaS" readonly>
            </div>

            </div>

          <!-- ENTRADA PARA EL STOCK -->
            <div class="form-group col-sm">
            <label for="cantidad">Stock</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" id="nuevoStockS" name="nuevoStockS" disabled>
                
                <input type="text" class="form-control input-lg"  id="unidadMedidaStockS" name="unidadMedidaStockS" readonly>
            </div>

            </div>

          </div>

          <div class="row">

          <!-- ENTRADA PARA LA FECHA -->
          <div class="form-group col-sm">
          <label for="fechaEmision">Fecha de Emisión</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
               <input type="date" class="form-control input-lg"  name="nuevaFechaS" id="nuevaFechaS" required>
          </div>
          </div> 

          <!-- ENTRADA PARA LA OBSERVACIÓN -->
          <div class="form-group col-sm">
          <label for="observacion">Observación</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevaObservacionS" name="nuevaObservacionS" 
                 placeholder="Ingresar observación" maxlength="100" pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;()+/=* ]+" 
                 title="Solo se acepta letras y números" required>
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

          $crearSalidaProducto= new ControladorInventarioProductos();
          $crearSalidaProducto -> ctrCrearSalidaProducto();

      ?>

    </form>

  </div>

</div>

</div>
