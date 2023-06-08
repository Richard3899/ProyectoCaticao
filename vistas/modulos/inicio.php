  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <div class="container-fluid">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Dashboard</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <?php $años = range(2000, strftime("%Y", time())); 
          $añoActual= date("Y");
          $mesActual= date("Y-m")
    ?>

    <!-- Main content -->
    <section class="section">

      <div class="contenier p-2">

        <div class="row">

          <div class="col-lg-6">
            <div class="card" style="height: 96.5%">
              <div class="card-body">
                <h5 class="card-title">Recetas y Estados</h5>
                <br><br>
                <canvas id="GraficoBarraRecetaEstados"></canvas>
                
              </div>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Recetas Terminadas</h5>
                    <br><br>
                    <select class="form-control input-lg select2" id="años" style="width: 100%;">
                      <?php foreach($años as $año) : 
                        
                        if($año!=$añoActual){
                          
                          echo '<option value="'.$año.'">'.$año.'</option>';
                        }else{

                          echo '<option value="'.$año.'" selected>'.$año.'</option>';

                        }

                      endforeach; 
                      ?>
                    </select>

                <canvas id="GraficoBarraRecetasTerminadas"></canvas>

              </div>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Top Inventario - Cantidades</h5>
                    <br><br>

                    <select class="form-control input-lg" id="itemInventario">
    
                    <option value="1">Productos</option>
    
                    <option value="2">Insumos</option>
    
                    <option value="3">Materiales</option>
    
                    </select>
                    
                <canvas id="GraficoBarraInventario"></canvas>

              </div>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Top Inventario - Valorizado</h5>
                    <br><br>

                    <select class="form-control input-lg" id="itemInventarioValorizado">
    
                    <option value="1">Productos</option>
    
                    <option value="2">Insumos</option>
    
                    <option value="3">Materiales</option>
    
                    </select>
                    
                <canvas id="GraficoBarraInventarioValorizado"></canvas>

              </div>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Productos Producidos - Cantidades</h5>
                    <br><br>
                    <select class="form-control input-lg select2" id="años3" style="width: 100%;">
                      <?php foreach($años as $año) : 
                        
                        if($año!=$añoActual){
                          
                          echo '<option value="'.$año.'">'.$año.'</option>';

                        }else{

                          echo '<option value="'.$año.'" selected>'.$año.'</option>';

                        }

                      endforeach; 
                      ?>
                    </select>
                    
                <canvas id="GraficoProductosProducidos"></canvas>

              </div>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Productos Producidos - Valorizado</h5>
                    <br><br>
                    <select class="form-control input-lg select2" id="años4" style="width: 100%;">
                      <?php foreach($años as $año) : 
                        
                        if($año!=$añoActual){
                          
                          echo '<option value="'.$año.'">'.$año.'</option>';

                        }else{

                          echo '<option value="'.$año.'" selected>'.$año.'</option>';

                        }

                      endforeach; 
                      ?>
                    </select>
                    
                <canvas id="GraficoProductosProducidosValorizado"></canvas>

              </div>
            </div>
          </div>

          <div class="col-lg-12">
            <div class="card" >
              <div class="card-body">
                <h5 class="card-title">Costo Unitario de Recetas</h5>
                    <br><br>
                    <input type="month" class="form-control" id="meses" value="<?php echo $mesActual; ?>"  style="width: 100%;">
                    <div style="height:22rem;">
                    <canvas id="GraficoRecetasPorFechaYCosto"></canvas>
                    </div>
                    
          
              </div>
            </div>
          </div>

          <div class="col-lg-12">
            <div class="card" >
              <div class="card-body">
                <h5 class="card-title">Gastos</h5>
                    <br><br>
                    <select class="form-control input-lg select2" id="años6" style="width: 100%;">
                      <?php foreach($años as $año) : 
                        
                        if($año!=$añoActual){
                          
                          echo '<option value="'.$año.'">'.$año.'</option>';

                        }else{

                          echo '<option value="'.$año.'" selected>'.$año.'</option>';

                        }

                      endforeach; 
                      ?>
                    </select>
                    <div style="height:22rem;">
                      <canvas id="GraficoGastosPorMes"></canvas>
                    </div>
             
              </div>
            </div>
          </div>
          
        </div>

      </div>

    </section>
 
    </div>
  </div>
