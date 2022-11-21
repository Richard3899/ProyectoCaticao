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
                      <input type="text" class="form-control input-lg" name="nuevoCodigo" id="nuevoCodigo" placeholder="Ingresar código" 
                      maxlength="20" pattern="[A-Za-z0-9-]+" title="Solo se aceptan letras,números y guiones sin espacios" readonly required>
                  </div>
                  </div>

                  <!-- ENTRADA PARA EL INSUMO -->
                  <div class="form-group col-sm">
                  <div class="input-group">
                      <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                      </div>
                      <input type="text" class="form-control input-lg" id="nuevoNombre" name="nuevoNombre" placeholder="Ingresar nombre" 
                      maxlength="50"  pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras y números" readonly required>
                      <input type="hidden" name="idVendedor" value="">
                      </div>
                  </div>

                <!--=====================================
                ENTRADA PARA AGREGAR PRODUCTO
                ======================================--> 

                <div class="form-group row nuevoInsumo">

                </div>

                <input type="hidden" id="listaInsumos" name="listaInsumos">

                <!--=====================================
                BOTÓN PARA AGREGAR PRODUCTO
                ======================================-->
                <div class="form-group col-sm">
                <button type="button" class="btn btn-default d-lg-none btnAgregarInsumo">Agregar producto</button>
                </div>
                <hr>

                <div class="row">

                  <!--=====================================
                  ENTRADA TOTAL
                  ======================================-->
                  
                  <div class="col float-right">
                    
                    <table class="table">

                      <thead>

                        <tr>
                        <th style="width:50% ;"></th> 
                          <th class="text center">Total</th>      
                        </tr>

                      </thead>

                      <tbody>
                      
                        <tr>

                          <td>
                          </td>

                           <td>
                            <!-- TOTAL -->
                            <div class="input-group">
                                <div class="input-group-prepend">
                                <span class="input-group-text"><i class="ion ion-social-usd"></i></span>
                                </div>
                                <input type="number" class="form-control input-lg" name="nuevaCantidad" placeholder="0000" 
                                 total="" min="0" max="9999999" step="0.001" readonly required>
                                <input type="hidden" name="totalVenta" id="totalVenta">
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

          #$guardarVenta = new ControladorVentas();
          #$guardarVenta -> ctrCrearVenta();
          
        ?>

        </div>
            
      </div>

      <!--=====================================
      LA TABLA DE PRODUCTOS
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
