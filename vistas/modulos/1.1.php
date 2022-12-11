<div class="content-wrapper">
<div class="container">
<section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Insumos de la receta</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Operaciones</li>
            <li class="breadcrumb-item active">Receta</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>

  <section class="content">

    <div class="row">

      <!--=====================================
      EL FORMULARIO
      ======================================-->
      
      <div class="col-lg-6 col-xs-12">
        
        <div class="card card-info card-outline pt-3 px-1">

          <form role="form" method="post" class="formularioAgregarInsumo">

            <div class="box-body">
  
              <div class="box">

                  <!-- ENTRADA PARA EL CÓDIGO -->
                  <div class="form-group col-sm">
                  <div class="input-group ">
                      <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                      </div>
                      <input type="text" class="form-control input-lg" value="<?php echo $_GET['codigo']; ?>"  name="nuevoCodigo" id="nuevoCodigo" readonly required>
                  </div>
                  </div>

                  <!-- ENTRADA PARA LA RECETA -->
                  <div class="form-group col-sm">
                  <div class="input-group">
                      <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                      </div>
                      <input type="text" class="form-control input-lg" value="<?php echo $_GET['nombre']; ?>" id="nuevoNombre" name="nuevoNombre" readonly required>
                      <input type="hidden" name="idReceta" id="idReceta" value="<?php echo $_GET['idReceta']; ?>">
                      </div>
                  </div>

                <!--=====================================
                ENTRADA PARA AGREGAR INSUMO
                ======================================--> 

                <div class="form-group row nuevoInsumo">

                </div>

                <input type="hidden" id="listaInsumos" name="listaInsumos">

                <!--=====================================
                BOTÓN PARA AGREGAR INSUMO
                ======================================-->
                <div class="form-group col-sm">
                <button type="button" class="btn btn-default d-lg-none btnAgregarInsumo">Agregar Insumo</button>
                </div>
                <hr>

                <div class="row">

                  <!--=====================================
                  ENTRADA TOTAL
                  ======================================-->
                  <div class="col-4 col-sm-8 col-md-8 col-xl-8">
                  </div>
                  <div class="col-8 col-sm-4 col-md-4 col-xl-4">
                    
                    <table class="table">

                      <thead>

                        <tr>

                        <th class="text center">Total</th>      
                        </tr>

                      </thead>

                      <tbody>
                      
                        <tr>

                           <td>
                            <!-- TOTAL -->
                            <div class="input-group">
                                <div class="input-group-prepend">
                                <span class="input-group-text"><i class="ion ion-social-usd"></i></span>
                                </div>
                                <input type="text" class="form-control input-lg" id="nuevoTotalInsumos" name="nuevoTotalInsumos" total="" placeholder="0" readonly required>
                                <input type="hidden" name="totalInsumos" id="totalInsumos">
                            </div>             
                            </td>

                        </tr>

                      </tbody>

                    </table>
                    <hr>
                  </div>

                </div>
      
              </div>

          </div>

          <div class="box-footer">

            <button type="submit" class="btn btn-primary pull-right mx-2 mb-2">Guardar Insumos</button>

          </div>

        </form>

        <?php

          $guardarAgregarInsumos = new ControladorAgregarInsumos();
          $guardarAgregarInsumos -> ctrCrearAgregarInsumo();
          
        ?>

        </div>
            
      </div>

      <!--=====================================
      LA TABLA DE INSUMOS
      ======================================-->

      <div class="col-lg-6 d-none d-lg-block">
        
        <div class="card card-warning card-outline pt-3 px-2">

          <div class="box-body">
            
            <table class="table table-bordered table-striped dt-responsive tablaAgregarInsumos">
              
               <thead>

                 <tr>
                  <th style="width: 10px">#</th>
                  <th>Imagen</th>
                  <th>Nombre</th>
                  <th>Stock</th>
                  <th>Acciones</th>
                </tr>

              </thead>

            </table>

          </div>

        </div>


      </div>

    </div>
   
  </section>

</div>

</div>
