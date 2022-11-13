<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Configuración del sistema</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Configuración</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content">
    <!-- Default box -->



 

          <div class="row">

 
            <div class="form-group col-sm">
            
            <div class="card">
                <div class="card-header">
                <p class="font-weight-bold text-center m-2">Activar Modo Dark</p>
                </div>
                <div class="card-body">
                <?php

                    $item = null;
                    $valor = null;

                    $configuracion = ControladorConfiguracion::ctrMostrarConfiguracion($item, $valor);

                    foreach ($configuracion as $key => $value){

                          if($value["mododark"] != 0){

                                echo '<td><button class="btn btn-success btnActivarModoDark col" idConfiguracion="'.$value["idConfiguracion"].'" mododark="0">Activar</button></td>';

                          }else{

                                echo '<td><button class="btn btn-danger btnActivarModoDark col" idConfiguracion="'.$value["idConfiguracion"].'" mododark="1">Desactivar</button></td>';

                          };
                    }


                    ?>

                </div>


              </div>
            </div>


            <div class="form-group col-sm">
            


            </div>

            <div class="form-group col-sm">

                  
            </div>

            <div class="form-group col-sm">
            

            </div>


          </div>


    <!-- /.card -->
  </section>
  <!-- /.content -->
  </div>
</div>
<!-- /.content-wrapper -->







