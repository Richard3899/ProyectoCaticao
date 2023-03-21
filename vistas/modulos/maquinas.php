<!-- Content Wrapper. Contains page content -->

<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Administrador de Maquinas</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Registros</li>
            <li class="breadcrumb-item active">Administrador de Maquinas</li>
            
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

       echo "<button class='btn btn-primary' data-toggle='modal' data-target='#modalAgregarMaquina'>
            Agregar Maquina
            </button>";

       }else{

       echo "<button class='btn btn-primary'>Agregar Maquina</button>";

       }
      ?>
              
      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaMaquinas" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:10px">#</th>
         <th>Código</th>
         <th>Nombre</th>
         <th>Descripción</th>
         <th>Serie</th>
         <th>Modelo</th>
         <th>Marca</th>
         <th>Precio</th>
         <th>Año de Compra</th>
         <th>Capacidad</th>
         <th>Potencia HP</th>
         <th>Vida Util</th>
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
MODAL AGREGAR MAQUINA
======================================-->

<div id="modalAgregarMaquina" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Agregar Maquina</h4>
      
      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <input type="hidden" id="idMaquina" name="idMaquina">

          <div class="row">

            <!-- ENTRADA PARA EL CÓDIGO -->
            <div class="form-group col-sm">
            <label for="codigo">Código</label>
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevoCodigoMaquina" id="nuevoCodigoMaquina" placeholder="Ingresar código" 
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
                <input type="text" class="form-control input-lg" id="nuevoNombre" name="nuevoNombre" placeholder="Ingresar nombre" 
                 maxlength="50"  pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;() ]+" title="Solo se acepta letras y números" required>
            </div>
            </div>

          </div>

          <!-- ENTRADA PARA EL DESCRIPCIÓN -->
           <div class="form-group">
           <label for="descripcion">Descripción</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevaDescripcion" placeholder="Ingresar descripción" 
                maxlength="100" pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;() ]+" title="Solo se acepta letras y números" required>
            </div>
           </div>

            <div class="row">

            <!-- ENTRADA PARA LA SERIE -->
            <div class="form-group col-sm">
            <label for="serie">Serie</label>
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevaSerie" id="nuevaSerie" placeholder="Ingresar serie" 
                maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" required>
            </div>
            </div>

            <!-- ENTRADA PARA EL MODELO -->
            <div class="form-group col-sm">
            <label for="modelo">Modelo</label>
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-cube"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="nuevoModelo" id="nuevoModelo" placeholder="Ingresar modelo" 
                maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" required>
            </div>
            </div>

            </div>

            <div class="row">

            <!-- ENTRADA PARA LA MARCA -->
            <div class="form-group col-sm">
            <label for="marca">Marca</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-file-signature"></i>  </span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevaMarca" name="nuevaMarca" placeholder="Ingresar marca" 
                maxlength="50"  pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;() ]+" title="Solo se acepta letras y números" required>
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
                 placeholder="Ingresar precio" min="0.01" step="0.01" max="9999999" required>
            </div>

            </div>

            </div>

            <div class="row">

            <!-- ENTRADA PARA EL AÑO DE COMPRA -->
            <div class="form-group col-sm">
            <label for="añoCompra">Año de Compra</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevoAñoCompra"  id="nuevoAñoCompra" 
                 placeholder="Ingresar año de compra" min="2000" max="2100" required>
                
            </div>
            </div>

            <!-- ENTRADA PARA LA CAPACIDAD -->
            <div class="form-group col-sm">
            <label for="Capacidad">Capacidad (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-battery-three-quarters"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevaCapacidad"  id="nuevaCapacidad" 
                 placeholder="Ingresar capacidad" min="0.01" step="0.01" max="9999999" required>
            </div>

            </div>

            </div>

            <div class="row">
            
            <!-- ENTRADA PARA LA POTENCIA HP -->
            <div class="form-group col-sm">
            <label for="potenciaHP">Potencia HP</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bolt"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevaPotenciaHP"  id="nuevaPotenciaHP" 
                 placeholder="Ingresar potencia HP" min="0.01" step="0.01" max="9999999" required>
            </div>

            </div>

            <!-- ENTRADA PARA VIDA UTIL -->
            <div class="form-group col-sm">
            <label for="vidaUtil">Vida Util (Años)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hourglass-half"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevaVidaUtil"  id="nuevaVidaUtil" 
                 placeholder="Ingresar vida util" min="1"  max="99" required>
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

        <button type="submit" class="btn btn-primary">Guardar maquina</button>

      </div>

      <?php

          $crearMaquina = new ControladorMaquinas();
          $crearMaquina -> ctrCrearMaquina();

      ?>


    </form>

  </div>

</div>

</div>


<!--=====================================
MODAL EDITAR MAQUINA
======================================-->

<div id="modalEditarMaquina" class="modal fade" role="dialog">
  
  <div class="modal-dialog modal-lg">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:gray; color:white">

        <h4 class="modal-title">Editar Maquina</h4>

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
                <input type="text" class="form-control input-lg" name="editarCodigo" id="editarCodigo" 
                 maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" readonly required>
                 <input type="hidden" id="editaridMaquina" name="editaridMaquina">

            </div>
            </div>

            <!-- ENTRADA PARA EL NOMBRE -->
            <div class="form-group col-sm">
            <label for="nombre">Nombre</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="editarNombre" id="editarNombre" placeholder="Ingresar nombre"
                 maxlength="50"  pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;() ]+" title="Solo se acepta letras y números" required>
            </div>
            </div>

          </div>

            <!-- ENTRADA PARA EL DESCRIPCIÓN -->
            <div class="form-group">
            <label for="descripcion">Descripción</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bars"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="editarDescripcion" id="editarDescripcion" placeholder="Ingresar descripcion"
                 maxlength="100" pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;() ]+" title="Solo se acepta letras y números" required>
            </div>
            </div>

            <div class="row">

            <!-- ENTRADA PARA LA SERIE -->
            <div class="form-group col-sm">
            <label for="serie">Serie</label>
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="editarSerie" id="editarSerie" placeholder="Ingresar serie"
                 maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" required>
            </div>
            </div>

            <!-- ENTRADA PARA EL MODELO -->
            <div class="form-group col-sm">
            <label for="modelo">Modelo</label>
            <div class="input-group ">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-cube"></i></span>
                </div>
                <input type="text" class="form-control input-lg" name="editarModelo" id="editarModelo" placeholder="Ingresar modelo"
                 maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" required>
            </div>
            </div>

            </div>

            <div class="row">

            <!-- ENTRADA PARA LA MARCA -->
            <div class="form-group col-sm">
            <label for="marca">Marca</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-file-signature"></i>  </span>
                </div>
                <input type="text" class="form-control input-lg" id="editarMarca" name="editarMarca" placeholder="Ingresar marca"
                maxlength="50"  pattern="[-A-Za-z0-9ñÑáéíóúÁÉÍÓÚ,.:;() ]+" title="Solo se acepta letras y números" required>
            </div>
            </div>

            <!-- ENTRADA PARA EL PRECIO -->
            <div class="form-group col-sm">
            <label for="precio">Precio</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><strong>S/.</strong></span>
                </div>
                <input type="number" class="form-control input-lg" id="editarPrecio" name="editarPrecio" 
                 placeholder="Ingresar precio" min="0.01" max="9999999" step="0.01" required>
            </div>

            </div>

            </div>

            <div class="row">

            <!-- ENTRADA PARA EL AÑO DE COMPRA -->
            <div class="form-group col-sm">
            <label for="añoCompra">Año de Compra</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarAñoCompra"  id="editarAñoCompra" 
                placeholder="Ingresar año de compra" min="2000" max="2100" required>
            </div>
            </div>

            <!-- ENTRADA PARA LA CAPACIDAD -->
            <div class="form-group col-sm">
            <label for="capacidad">Capacidad (Kg)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-battery-three-quarters"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarCapacidad"  id="editarCapacidad" 
                placeholder="Ingresar capacidad" min="0.01" step="0.01" max="9999999" required>
            </div>

            </div>

            </div>

            <div class="row">

            <!-- ENTRADA PARA LA POTENCIA HP -->
            <div class="form-group col-sm">
            <label for="potenciaHP">Potencia HP</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-bolt"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarPotenciaHP"  id="editarPotenciaHP" 
                placeholder="Ingresar potencia HP" min="0.01" step="0.01" max="9999999" required>
            </div>

            </div>

            <!-- ENTRADA PARA VIDA UTIL -->
            <div class="form-group col-sm">
            <label for="vidaUtil">Vida Util (Años)</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-hourglass-half"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarVidaUtil"  id="editarVidaUtil" 
                 placeholder="Ingresar vida util" min="1" max="99" required>
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

          <button type="submit" class="btn btn-primary">Editar Maquina</button>

        </div>

        <?php

          $editarMaquina = new ControladorMaquinas();
          $editarMaquina -> ctrEditarMaquina();

        ?> 

      </form>

    </div>

  </div>

</div>

<?php

  $borrarMaquina = new ControladorMaquinas();
  $borrarMaquina -> ctrEliminarMaquina();

?> 