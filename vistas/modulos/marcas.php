<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Administrador de Marcas</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Registros</li>
            <li class="breadcrumb-item active">Insumos y Materiales</li>
            <li class="breadcrumb-item active">Marcas</li>

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

       echo "<button class='btn btn-primary' data-toggle='modal' data-target='#modalAgregarMarca'>
            Agregar Marca
            </button>";

       }else{

       echo "<button class='btn btn-primary'>Agregar Marca</button>";

       }
      ?>      
        
      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaMarcas" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:10px">#</th>
         <th>Marca</th>
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
MODAL AGREGAR MARCA
======================================-->

<div id="modalAgregarMarca" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Agregar Marca</h4>
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
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevaDescripcionMarca" id="nuevaDescripcionMarca" placeholder="Ingresar Marca" 
                 maxlength="45" pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;()+/=* ]+" title="Solo se acepta letras y números" required>
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

        <button type="submit" class="btn btn-primary">Guardar Marca</button>

      </div>

      <?php

          $crearMarca= new ControladorMarcas();
          $crearMarca -> ctrCrearMarca();

      ?>


    </form>

  </div>

</div>

</div>


<!--=====================================
MODAL EDITAR MARCA
======================================-->

<div id="modalEditarMarca" class="modal fade" role="dialog">
  
  <div class="modal-dialog modal-lg">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:gray; color:white">

        <h4 class="modal-title">Editar Marca</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA LA DESCRIPCION -->
            <div class="form-group col-sm">
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="editarDescripcionMarca" id="editarDescripcionMarca" 
                 maxlength="45" pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;()+/=* ]+" title="Solo se acepta letras y números"  required>
                <input type="hidden" id="idMarca" name="idMarca">
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

          <button type="submit" class="btn btn-primary">Editar Marca</button>

        </div>

        <?php

          $editarMarca = new ControladorMarcas();
          $editarMarca-> ctrEditarMarca();

        ?> 

      </form>

    </div>

  </div>

</div>

<?php

  $borrarMarca = new ControladorMarcas();
  $borrarMarca -> ctrEliminarMarca();

?> 