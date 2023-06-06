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
                <h5 class="card-title">Recetas Terminadas</h5>
                    <br><br>
                    <select class="form-control input-lg select2" id="años">
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
                <h5 class="card-title">Line Chart</h5>

                <!-- Line Chart -->
                <canvas id="lineChart" style="max-height: 400px;"></canvas>

                <script>
                  document.addEventListener("DOMContentLoaded", () => {
                    new Chart(document.querySelector('#lineChart'), {
                      type: 'line',
                      data: {
                        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                        datasets: [{
                          label: 'Line Chart',
                          data: [65, 59, 80, 81, 56, 55, 40],
                          fill: false,
                          borderColor: 'rgb(75, 192, 192)',
                          tension: 0.1
                        }]
                      },
                      options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }],
                        },
                    }
                    });
                  });
                </script>
                <!-- End Line CHart -->

              </div>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Pie Chart</h5>

                <!-- Pie Chart -->
                <canvas id="pieChart" style="max-height: 400px;"></canvas>
                <script>
                  document.addEventListener("DOMContentLoaded", () => {
                    new Chart(document.querySelector('#pieChart'), {
                      type: 'pie',
                      data: {
                        labels: [
                          'Red',
                          'Blue',
                          'Yellow'
                        ],
                        datasets: [{
                          label: 'My First Dataset',
                          data: [300, 50, 100],
                          backgroundColor: [
                            'rgb(255, 99, 132)',
                            'rgb(54, 162, 235)',
                            'rgb(255, 205, 86)'
                          ],
                          hoverOffset: 4
                        }]
                      }
                    });
                  });
                </script>
                <!-- End Pie CHart -->

              </div>
            </div>
          </div>

        </div>

      </div>

    </section>
    <!-- /.content -->
    </div>
  </div>
  <!-- /.content-wrapper -->