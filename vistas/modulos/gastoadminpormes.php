<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container-fluid">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Gastos</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Costeo</li>
            <li class="breadcrumb-item active">Gastos</li>
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
      <div class="row ">
      <div class="row col-12 col-lg-8">

        <!-- ENTRADA PARA LA RECETA -->
        <div class="form-group my-1 col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
          <div class="input-group">
            <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
            </div>
            <input type="text" class="form-control input-lg nm" value="<?php echo $_GET['descripcion']; ?>" readonly required>
          </div>
       </div>
       </div>
       
        <div class="form-group row  col-12 col-lg-4 justify-content-sm-end">
          
          <?php 
          if($permisoInsertar==1){

          echo  "<button class='btn btn-primary my-1 col-12 col-sm-5 col-md-4 mr-2 col-lg-8 col-xl-7' id='btnGastoAdminPorMes' data-toggle='modal' data-target='#modalGastoAdminPorMes'>
                Agregar Gastos
                </button>";
          }else{

          echo  "<button class='btn btn-primary my-1 col-12 col-sm-5 col-md-4 mr-2 col-lg-8 col-xl-7' id='btnGastoAdminPorMes'>
                Agregar Gastos
                </button>";

          }
          ?>

         <a type="button" class="btn btn-secondary my-1 col-12 col-sm-4 col-md-3 col-lg-3 col-xl-3" href="mesgasto">Volver</a>
        </div>
        
      </div>

      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaGastoAdminPorMes" width="100%">
       
      <thead>
       
       <tr> 
         
         <th style="width:20px">#</th>
         <th>Nombre</th>
         <th>Tipo de Gasto</th>  
         <th>Cantidad</th>
         <th>Precio</th>
         <th>Total</th>
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
MODAL GASTO ADMINISTRATIVO POR MES
======================================-->

<div id="modalGastoAdminPorMes" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioGastoAdminPorMes">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Registrar Gasto</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>
 
      <input type="hidden" name="idMesGasto" id="idMesGasto" value="<?php echo $_GET['idMesGasto']; ?>">

      <input type="hidden" name="descripcion" id="descripcion" value="<?php echo $_GET['descripcion']; ?>">

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

        <div class="row">

            <!-- ENTRADA PARA SELECCIONAR TIPO GASTO o Costo-->
            <div class="form-group col-sm">
            <label for="tipoGasto">Tipo de Gasto</label>
            <div class="input-group">

                <select class="form-control select2 input-lg nuevoidTipoGasto" id="nuevoidTipoGasto" name="nuevoidTipoGasto" style="width: 100%;" required>
                
                <option value="">Seleccionar :</option>

                <?php 
                    $item = null;
                    $valor = null;

                    $maquina = ControladorTipoGasto::ctrMostrarTipoGasto($item,$valor);

                  foreach($maquina as $key=> $value){ 

                    echo '<option value="'.$value["idTipoGasto"].'">'.$value["descripcion"].'</option>';
                  }

                  ?>

              </select>
              
            </div>
            </div>

            <!-- ENTRADA PARA SELECCIONAR GASTO ADMINISTRATIVO -->
            <div class="form-group col-sm">
            <label for="gastoAdministrativo">Gasto</label>
            <div class="input-group">

                <input type="hidden" name="idGastoAdmin" id="idGastoAdmin">

                <input type="hidden" name="nombreGastoAdmin" id="nombreGastoAdmin">

                <select class="form-control select2 input-lg seleccionarNombreGastoAdmin" id="seleccionarNombreGastoAdmin" name="seleccionarNombreGastoAdmin" style="width: 100%;" required disabled>
                
                <option value="">Seleccionar :</option>

                </select>
              
            </div>
            </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA LA CANTIDAD -->
            <div class="form-group col-sm">
            <label for="cantidad">Cantidad</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" id="nuevaCantidad" name="nuevaCantidad" 
                 placeholder="0,00" min="0.1" step="0.1" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Precio</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><strong>S/.</strong></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevoPrecio" id="nuevoPrecio"
                 placeholder="0,00" min="0.1" step="0.1"   required>
            </div>
            </div>
          </div>

          <div class="row">
            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Total</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><strong>S/.</strong></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevoTotal" id="nuevoTotal"
                 placeholder="0,00" readonly>
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

        <button type="submit" class="btn btn-primary">Guardar Gasto</button>

      </div>

      <?php

        $guardarGastoAdminPorMes = new ControladorGastoAdminPorMes();
        $guardarGastoAdminPorMes -> ctrCrearGastoAdminPorMes();

      ?>

    </form>

  </div>

</div>

</div>

<!--=====================================
MODAL EDITAR GASTO ADMINISTRATIVO POR MES
======================================-->

<div id="modalEditarGastoAdminPorMes" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data" class="formularioEditarGastoAdminPorMes">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Editar Gasto</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <input type="hidden" name="editaridMesGasto" id="editaridMesGasto" value="<?php echo $_GET['idMesGasto']; ?>">

      <input type="hidden" name="editarDescripcion" id="editarDescripcion" value="<?php echo $_GET['descripcion']; ?>">

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA SELECCIONAR EL GASTO ADMINISTRATIVO -->

            <div class="form-group col-sm">
            <label for="gastoAdministrativo">Gasto Administrativo</label>
                <input type="hidden" name="editaridGastoAdminPorMes" id="editaridGastoAdminPorMes">
            
            <div class="input-group">

                <input type="text" class="form-control input-lg" name="editarNombreGastoAdmin" id="editarNombreGastoAdmin" readonly>

            </div>

            </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA LA CANTIDAD-->
            <div class="form-group col-sm">
            <label for="cantidad">Cantidad</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-layer-group"></i></span>
                </div>
                <input type="number" class="form-control input-lg" id="editarCantidad" name="editarCantidad" 
                placeholder="0,00" min="0.1" step="0.1" required>
            </div>

            </div>

            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Precio</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><strong>S/.</strong></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarPrecio" id="editarPrecio"
                 placeholder="0,00" min="0.1" step="0.1" required>
            </div>

            </div>

          </div>

          <div class="row">
            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Total</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><strong>S/.</strong></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarTotal" id="editarTotal"
                 placeholder="0,00" readonly>
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

        <button type="submit" class="btn btn-primary">Editar Gasto</button>

      </div>

      <?php

          $editarGastoAdminPorMes = new ControladorGastoAdminPorMes();
          $editarGastoAdminPorMes -> ctrEditarGastoAdminPorMes();

      ?>

    </form>

  </div>

</div>

</div>

<?php

  $borrarGastoAdminPorMes = new ControladorGastoAdminPorMes();
  $borrarGastoAdminPorMes -> ctrEliminarGastoAdminPorMes();

?> 