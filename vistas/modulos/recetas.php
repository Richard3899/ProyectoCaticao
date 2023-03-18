<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Administrador de Recetas</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Operaciones</li>
            <li class="breadcrumb-item active">Administrador de Recetas</li>

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

      <?php 
       if($permisoInsertar==1){

       echo "<button class='btn btn-primary' data-toggle='modal' data-target='#modalAgregarReceta'>
            Agregar Receta
            </button>";

       }else{

       echo "<button class='btn btn-primary'>Agregar Receta</button>";

       }
      ?>
        
      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaRecetas" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:10px">#</th>
         <th>Código</th>
         <th>Nombre</th>
         <th>Producto</th>
         <th>Batch</th>
         <th>Estado</th>
         <th>Detalle</th>
         <th>Duplicar</th>
         <th>Agregar</th>
         <th>Acciones</th>

       </tr> 

      </thead>

     </table>
     
      </div>

      <!-- /.card-body -->
    </div>
     <br>
     <br>
     <br>
     <br>
     <br>
    <!-- /.card -->
  </section>
  <!-- /.content -->
  </div>
</div>
<!-- /.content-wrapper -->

<!--=====================================
MODAL AGREGAR RECETA
======================================-->

<div id="modalAgregarReceta" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Agregar Receta</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA EL CÓDIGO -->
            <div class="form-group col-sm">
            <label for="codigo">Código</label>
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevoCodigoReceta" id="nuevoCodigoReceta" placeholder="Ingresar código" 
                 maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" required>
            </div>
            </div>

            <!-- ENTRADA PARA EL NOMBRE -->
            <div class="form-group col-sm">
            <label for="nombre">Nombre</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="idNombre" name="nuevoNombre" placeholder="Ingresar nombre" 
                 maxlength="50"  pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras y números" required>
            </div>
            </div>

          </div>

          <div class="row">
 
            <!-- ENTRADA PARA SELECCIONAR PRODUCTO -->
            <div class="form-group col-sm">
            <label for="producto">Producto</label>
            <div class="input-group">

                <select class="form-control select2 input-lg" style="width: 100%;" id="nuevoidProducto" name="nuevoidProducto" required>
                
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

          </div>

          <div class="row">

            <!-- ENTRADA PARA EL BATCH -->
            <div class="form-group col-sm">
            <label for="batch">Batch (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevoBatch"  id="nuevoBatch" 
                placeholder="Ingresar Batch (Kg)" min="0" step="0.01" max="9999999" required>
            </div>

            </div>

          <!-- ENTRADA PARA SELECCIONAR ESTADO -->
          <div class="form-group col-sm">
          <label for="estado">Estado</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-sync"></i></span>
                </div>

                <select class="form-control input-lg" id="nuevoidEstado" name="nuevoidEstado" required>
                
                <option value="">Estado</option>

                <?php 
                $item = null;
                $valor = null;

                $unidadmedida = ControladorEstados::ctrMostrarEstados($item,$valor);

                foreach($unidadmedida as $key=> $value){ 
                  echo '<option value="'.$value["idEstado"].'">'.$value["descripcion"].'</option>';
                }

                ?>

              </select>

            </div>

          </div>

          </div>

          <div class="row">

          <!-- ENTRADA PARA LA FECHA DE INICIO -->
          <div class="form-group col-sm">
          <label for="fechaInicio">Fecha de Inicio</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="text" class="textbox-n form-control"  name="nuevaFechaInicio" id="nuevaFechaInicio"
              placeholder="Ingresar fecha de inicio" onfocus="(this.type='date')" onblur="(this.type='date')" id="date" required>

          </div>
          </div>

          <!-- ENTRADA PARA LA FECHA DE FIN -->
          <div class="form-group col-sm">
          <label for="fechaFin">Fecha de Fin</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="text" class="textbox-n form-control"  name="nuevaFechaFin" id="nuevaFechaFin"
              placeholder="Ingresar fecha de fin" onfocus="(this.type='date')" onblur="(this.type='date')" id="date" required>
          </div>
          </div>

          </div>

          <div class="row">
          
          <!-- ENTRADA PARA EL LOTE -->
          <div class="form-group col-sm">
          <label for="lote">Lote</label>
           <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-vote-yea"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevoCodigoLote" id="nuevoCodigoLote" placeholder="Ingresar lote" 
                maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" required>
          </div>
          </div>

          <!-- ENTRADA PARA LA FECHA DE VENCIMIENTO -->
          <div class="form-group col-sm">
          <label for="fechaVencimiento">Fecha de Vencimiento</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="text" class="textbox-n form-control"  name="nuevaFechaVencimiento" id="nuevaFechaVencimiento"
               placeholder="Ingresar fecha de vencimiento" onfocus="(this.type='date')" onblur="(this.type='date')" id="date" required>
          </div>
          </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA PESO POR TABLETA -->
            <div class="form-group col-sm">
            <label for="pesoPorTableta">Peso por tableta (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevoPesoPorTableta"  id="nuevoPesoPorTableta" 
                placeholder="Ingresar peso por tableta (Kg)" min="0" step="0.01" max="9999999" required>
            </div>

            </div>

            <!-- ENTRADA PARA PESO EN TABLETA -->
            <div class="form-group col-sm">
            <label for="pesoEnTableta">Peso en tableta (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevoPesoEnTableta"  id="nuevoPesoEnTableta" 
                placeholder="Ingresar peso en tableta (Kg)" min="0" step="0.01" max="9999999" required>
            </div>

            </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA MERMA -->
            <div class="form-group col-sm">
            <label for="merma">Merma (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevaMerma"  id="nuevaMerma" 
                placeholder="Ingresar merma (Kg)" min="0" step="0.01" max="9999999" required>
            </div>

            </div>

            <!-- ENTRADA PARA REPROCESO -->
            <div class="form-group col-sm">
            <label for="reproceso">Reproceso (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevoReproceso"  id="nuevoReproceso" 
                placeholder="Ingresar reproceso (Kg)" min="0" step="0.01" max="9999999" required>
            </div>

            </div>

          </div>

          <div class="row">

            <!-- ENTRADA CANTIDAD DE TABLETAS -->
            <div class="form-group col-sm">
            <label for="reproceso">Tabletas</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevaCantidadTabletas"  id="nuevaCantidadTabletas" 
                placeholder="Ingresar cantidad de tabletas" min="1" max="9999999" required>
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

        <button type="submit" class="btn btn-primary">Guardar receta</button>

      </div>

      <?php

          $crearReceta = new ControladorRecetas();
          $crearReceta -> ctrCrearReceta();

      ?>

    </form>

  </div>

</div>

</div>


<!--=====================================
MODAL EDITAR RECETA
======================================-->

<div id="modalEditarReceta" class="modal fade" role="dialog">
  
  <div class="modal-dialog modal-lg">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:gray; color:white">

        <h4 class="modal-title">Editar Receta</h4>

        <button type="button" class="close" data-dismiss="modal">&times;</button>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

        <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA EL CÓDIGO -->
            <div class="form-group col-sm">
            <label for="codigo">Código</label>
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="editarCodigoReceta" id="editarCodigoReceta" placeholder="Ingresar código" 
                maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" readonly required>
                <input type="hidden" id="idReceta" name="idReceta">
              </div>
            </div>

            <!-- ENTRADA PARA EL NOMBRE -->
            <div class="form-group col-sm">
            <label for="nombre">Nombre</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="editarNombre" name="editarNombre" placeholder="Ingresar nombre" 
                maxlength="50"  pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras y números" required>
            </div>
            </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA SELECCIONAR PRODUCTO -->
            <div class="form-group col-sm">
            <label for="producto">Producto</label>
            <div class="input-group">

                <select class="form-control select2 input-lg" style="width: 100%;" id="editaridProducto" name="editaridProducto" required>
                
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

          </div>


          <div class="row">

          <!-- ENTRADA PARA EL BATCH -->
          <div class="form-group col-sm">
          <label for="batch">Batch (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarBatch"  id="editarBatch" 
                placeholder="Ingresar Batch (Kg)" min="0" step="0.01" max="9999999" required>
            </div>

          </div>

            <!-- ENTRADA PARA SELECCIONAR ESTADO -->
            <div class="form-group col-sm">
            <label for="estado">Estado</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-sync"></i></span>
                </div>

                <select class="form-control input-lg" id="editaridEstado" name="editaridEstado">
                
                <option value="">Estado</option>

                <?php 
                $item = null;
                $valor = null;

                $unidadmedida = ControladorEstados::ctrMostrarEstados($item,$valor);

                foreach($unidadmedida as $key=> $value){ 
                  echo '<option value="'.$value["idEstado"].'">'.$value["descripcion"].'</option>';
                }

                ?>

              </select>

            </div>

          </div>

          </div>

          <div class="row">

          <!-- ENTRADA PARA LA FECHA DE INICIO -->
          <div class="form-group col-sm">
          <label for="fechaInicio">Fecha de Inicio</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="text" class="textbox-n form-control"  name="editarFechaInicio" id="editarFechaInicio"
              placeholder="Ingresar fecha de inicio" onfocus="(this.type='date')" onblur="(this.type='date')" id="date" required>

          </div>
          </div>

          <!-- ENTRADA PARA LA FECHA DE FIN -->
          <div class="form-group col-sm">
          <label for="FechaFin">Fecha de Fin</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="text" class="textbox-n form-control"  name="editarFechaFin" id="editarFechaFin"
              placeholder="Ingresar fecha de fin" onfocus="(this.type='date')" onblur="(this.type='date')" id="date" required>
          </div>
          </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA EL LOTE -->
            <div class="form-group col-sm">
            <label for="lote">Lote</label>
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-vote-yea"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="editarCodigoLote" id="editarCodigoLote" placeholder="Ingresar lote" 
                maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" required>
                <input type="hidden" id="idLote" name="idLote">
              </div>
            </div>

          <!-- ENTRADA PARA LA FECHA DE VENCIMIENTO -->
          <div class="form-group col-sm">
          <label for="fechaVencimiento">Fecha de Vencimiento</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="text" class="textbox-n form-control"  name="editarFechaVencimiento" id="editarFechaVencimiento"
               placeholder="Ingresar fecha de vencimiento" onfocus="(this.type='date')" onblur="(this.type='date')" id="date" required>
          </div>
          </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA PESO POR TABLETA -->
            <div class="form-group col-sm">
            <label for="pesoPorTableta">Peso por tableta (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarPesoPorTableta"  id="editarPesoPorTableta" 
                placeholder="Ingresar peso por tableta (Kg)" min="0" step="0.01" max="9999999" required>
            </div>

            </div>

            <!-- ENTRADA PARA PESO EN TABLETA -->
            <div class="form-group col-sm">
            <label for="pesoEnTableta">Peso en tableta (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarPesoEnTableta"  id="editarPesoEnTableta" 
                placeholder="Ingresar peso en tableta (Kg)" min="0" step="0.01" max="9999999" required>
            </div>

            </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA MERMA -->
            <div class="form-group col-sm">
            <label for="merma">Merma (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarMerma"  id="editarMerma" 
                placeholder="Ingresar merma (Kg)" min="0" step="0.01" max="9999999" required>
            </div>

            </div>

            <!-- ENTRADA PARA REPROCESO -->
            <div class="form-group col-sm">
            <label for="reproceso">Reproceso (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarReproceso"  id="editarReproceso" 
                placeholder="Ingresar reproceso (Kg)" min="0" step="0.01" max="9999999" required>
            </div>
            </div>

          </div>

          <div class="row">

            <!-- ENTRADA CANTIDAD DE TABLETAS -->
            <div class="form-group col-sm">
            <label for="reproceso">Tabletas</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarCantidadTabletas"  id="editarCantidadTabletas" 
                placeholder="Ingresar cantidad de tabletas" min="1" max="9999999" required>
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

          <button type="submit" class="btn btn-primary">Editar Receta</button>

        </div>

        <?php

          $editarReceta = new ControladorRecetas();
          $editarReceta -> ctrEditarReceta();

        ?> 

      </form>

    </div>

  </div>

</div>


<!--=====================================
MODAL DETALLE RECETA
======================================-->

<div id="modalDetalleReceta" class="modal fade" role="dialog">
  
  <div class="modal-dialog modal-lg">

    <div class="modal-content">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:gray; color:white">

        <h4 class="modal-title">Detalle Receta</h4>

        <button type="button" class="close" data-dismiss="modal">&times;</button>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

        <div class="box-body">

          <div class="row">

          <!-- ENTRADA PARA LA FECHA DE INICIO -->
          <div class="form-group col-sm">
          <label for="fechaInicio">Fecha de Inicio</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="text" class="form-control"  name="detalleFechaInicio" id="detalleFechaInicio" readonly>

          </div>
          </div>

          <!-- ENTRADA PARA LA FECHA DE FIN -->
          <div class="form-group col-sm">
          <label for="FechaFin">Fecha de Fin</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="text" class="form-control"  name="detalleFechaFin" id="detalleFechaFin" readonly>
          </div>
          </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA EL LOTE -->
            <div class="form-group col-sm">
            <label for="lote">Lote</label>
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-vote-yea"></i></span>
                </div>
                <input type="text" class="form-control" name="detalleCodigoLote" id="detalleCodigoLote" readonly>
              </div>
            </div>

          <!-- ENTRADA PARA LA FECHA DE VENCIMIENTO -->
          <div class="form-group col-sm">
          <label for="fechaVencimiento">Fecha de Vencimiento</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="text" class="form-control"  name="detalleFechaVencimiento" id="detalleFechaVencimiento" readonly>
          </div>
          </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA PESO POR TABLETA -->
            <div class="form-group col-sm">
            <label for="pesoPorTableta">Peso por tableta (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control" name="detallePesoPorTableta"  id="detallePesoPorTableta" readonly>
            </div>

            </div>

            <!-- ENTRADA PARA PESO EN TABLETA -->
            <div class="form-group col-sm">
            <label for="pesoEnTableta">Peso en tableta (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control" name="detallePesoEnTableta"  id="detallePesoEnTableta" readonly>
            </div>

            </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA MERMA -->
            <div class="form-group col-sm">
            <label for="merma">Merma (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control" name="detalleMerma"  id="detalleMerma" readonly>
            </div>
            </div>

            <!-- ENTRADA PARA REPROCESO -->
            <div class="form-group col-sm">
            <label for="reproceso">Reproceso (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control" name="detalleReproceso"  id="detalleReproceso" readonly>
            </div>
            </div>

          </div>

          <div class="row">

            <!-- ENTRADA CANTIDAD DE TABLETAS -->
            <div class="form-group col-sm">
            <label for="reproceso">Tabletas</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control" name="detalleCantidadTabletas"  id="detalleCantidadTabletas" readonly>
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

        </div>

    </div>

  </div>

</div>



<!--=====================================
MODAL DUPLICAR RECETA
======================================-->

<div id="modalDuplicarReceta" class="modal fade" role="dialog">
  
  <div class="modal-dialog modal-lg">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:gray; color:white">

        <h4 class="modal-title">Duplicar Receta</h4>

        <button type="button" class="close" data-dismiss="modal">&times;</button>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

        <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA EL CÓDIGO DUPLICAR RECETA -->
            <div class="form-group col-sm">
            <label for="codigo">Código</label>
            <input type="hidden" id="duplicarIdReceta" name="duplicarIdReceta">
            <input type="hidden" id="codigoLote" name="codigoLote">
            <input type="hidden" id="nuevoIdReceta" name="nuevoIdReceta">

             <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="duplicarCodigoReceta" id="duplicarCodigoReceta" placeholder="Ingresar código" 
                maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" required>
                
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

          <button type="submit" class="btn btn-primary">Duplicar Receta</button>

        </div>

        <?php

          $duplicarReceta = new ControladorRecetas();
          $duplicarReceta -> ctrDuplicarReceta();

        ?> 

      </form>

    </div>

  </div>

</div>




<?php

  $borrarReceta = new ControladorRecetas();
  $borrarReceta -> ctrEliminarReceta();

  $cerrarReceta = new ControladorRecetas();
  $cerrarReceta -> ctrCerrarReceta();

?> 

