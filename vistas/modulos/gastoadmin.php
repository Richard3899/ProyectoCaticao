<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Administrador de Gastos Administrarivos</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Registros</li>
            <li class="breadcrumb-item active">Gastos y Costos</li>
            <li class="breadcrumb-item active">Gastos Administrativos</li>
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
      
      <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarGastoAdmin">
        
        Agregar Gasto Administrativo

      </button>
        
        
      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaGastoAdmin" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:10px">#</th>
         <th>Descripción</th>
         <th>Unidad de Medida</th>
         <th>Precio</th>
         <th>Tipo de Costo</th>
         <th>Acciones</th>

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
MODAL AGREGAR GASTOS ADMINISTRATIVOS
======================================-->

<div id="modalAgregarGastoAdmin" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Agregar Gasto Administrativo</h4>
      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

          <!-- ENTRADA PARA EL DESCRIPCIÓN -->

          <div class="form-group col-sm">
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevaDescripcion" placeholder="Ingresar descripción" 
                maxlength="100" pattern="[A-Za-z0-9\u00f1\u00d1 ]+" title="Solo se acepta letras y números" required>
            </div>
          </div>
 
          <!-- ENTRADA PARA SELECCIONAR SU UNIDAD DE MEDIDA -->

          <div class="form-group col-sm">
            
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-ruler"></i></span>
                </div>

                <select class="form-control input-lg" id="nuevaUnidadMedida" name="nuevaUnidadMedida" required>
                
                <option value="">Unidad de Medida</option>

                <?php 
                $item = null;
                $valor = null;

                $unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($item,$valor);

                foreach($unidadmedida as $key=> $value){ 
                  echo '<option value="'.$value["idUnidadMedida"].'">'.$value["descripcion"].'</option>';
                }

                ?>

              </select>

            </div>

          </div>

          </div>

          <div class="row">

          <!-- ENTRADA PARA EL PRECIO -->

            <div class="form-group col-sm">
            
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevoPrecio" id="nuevoPrecio"
                placeholder="Ingresar precio" min="0" max="9999999" step="0.01" required>
            </div>

            </div>

          <!-- ENTRADA PARA SELECCIONAR SU TIPO DE COSTO -->

          <div class="form-group col-sm">
            
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-tag"></i></span>
                </div>

                <select class="form-control input-lg" id="nuevoTipoCosto" name="nuevoTipoCosto" required>
                
                <option value="">Tipo de Costo</option>

                <?php 
                $item = null;
                $valor = null;

                $tipocosto = ControladorTipoCosto::ctrMostrarTipoCosto($item,$valor);

                foreach($tipocosto as $key=> $value){ 
                  echo '<option value="'.$value["idTipoCosto"].'">'.$value["descripcion"].'</option>';
                }

                ?>

              </select>

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

        <button type="submit" class="btn btn-primary">Guardar Gasto Administrativo</button>

      </div>

      <?php

          $crearGastoAdmin= new ControladorGastoAdmin();
          $crearGastoAdmin -> ctrCrearGastoAdmin();

      ?>


    </form>

  </div>

</div>

</div>




<!--=====================================
MODAL EDITAR GASTOS ADMINISTRATIVOS
======================================-->

<div id="modalEditarGastoAdmin" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Editar Gasto Administrativo</h4>
      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

      <div class="box-body">

        <div class="row">

        <!-- ENTRADA PARA EL DESCRIPCIÓN -->

        <div class="form-group col-sm">
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-bars"></i></span>
              </div>
              <input type="text" class="form-control input-lg" id="editarDescripcion" name="editarDescripcion" placeholder="Ingresar descripción" 
              maxlength="100" pattern="[A-Za-z0-9\u00f1\u00d1 ]+" title="Solo se acepta letras y números" required>
              <input type="hidden" id="idGastoAdmin" name="idGastoAdmin">
          </div>
        </div>

        <!-- ENTRADA PARA SELECCIONAR SU UNIDAD DE MEDIDA -->

        <div class="form-group col-sm">
          
          <div class="input-group">
          
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-ruler"></i></span>
              </div>

              <select class="form-control input-lg" id="editarUnidadMedida" name="editarUnidadMedida" required>
              
              <option value="">Unidad de Medida</option>

              <?php 
              $item = null;
              $valor = null;

              $unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($item,$valor);

              foreach($unidadmedida as $key=> $value){ 
                echo '<option value="'.$value["idUnidadMedida"].'">'.$value["descripcion"].'</option>';
              }

              ?>

            </select>

          </div>

        </div>

        </div>

        <div class="row">

          <!-- ENTRADA PARA EL PRECIO -->

          <div class="form-group col-sm">
          
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
              </div>
              <input type="number" class="form-control input-lg" name="editarPrecio" id="editarPrecio"
              placeholder="Ingresar precio" min="0" max="9999999" step="0.01" required>
          </div>

          </div>

        <!-- ENTRADA PARA SELECCIONAR SU TIPO DE COSTO -->

        <div class="form-group col-sm">
          
          <div class="input-group">
          
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-tag"></i></span>
              </div>

              <select class="form-control input-lg" id="editarTipoCosto" name="editarTipoCosto" required>
              
              <option value="">Tipo de Costo</option>

              <?php 
              $item = null;
              $valor = null;

              $tipocosto = ControladorTipoCosto::ctrMostrarTipoCosto($item,$valor);

              foreach($tipocosto as $key=> $value){ 
                echo '<option value="'.$value["idTipoCosto"].'">'.$value["descripcion"].'</option>';
              }

              ?>

            </select>

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

        <button type="submit" class="btn btn-primary">Editar Gasto Administrativo</button>

      </div>

      <?php

          $editarGastoAdmin = new ControladorGastoAdmin();
          $editarGastoAdmin -> ctrEditarGastoAdmin();

      ?>


    </form>

  </div>

</div>

</div>


<?php

  $borrarGastoAdmin = new ControladorGastoAdmin();
  $borrarGastoAdmin -> ctrEliminarGastoAdmin();

?> 