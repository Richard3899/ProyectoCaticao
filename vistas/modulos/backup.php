<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Administrador de Copias de Seguridad</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Copias de Seguridad</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>

  <section class="content">
  <div class="card">
      <div class="card-header">
      <form method="POST">
      <input type="hidden" name="backup">
      <?php 
       if($permisoInsertar==1){

       echo "<button class='btn btn-primary' type='submit'>Crear copia de seguridad</button>";

       }else{

       echo "<a class='btn btn-primary'>Crear copia de seguridad</a>";

       }
      ?>
      
        <?php 
        $crearBackup= new ControladorBackup();
        $crearBackup -> ctrCrearBackup();
        ?> 

      </form>
      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaBackup" width="100%">
            
            <thead>
              
              <tr>
                
                <th style="width:10px">#</th>
                <th>Nombre</th>
                <th>Acciones</th>
      
              </tr> 
      
            </thead>
            <tbody>
                    
            <?php 
          
            $directorio_base = "backups" ;
            
            $archivos=scandir($directorio_base);
            
            foreach($archivos as $key => $archivo) {

              if(!in_array($archivo,array('.','..'))){

                echo "<tr><td value='".$archivo."'>".($key-1)."</td>
                      <td>".$archivo."</td>
                      <td>";
                      if($permisoEliminar==1){

                        echo "<button class='btn btn-danger btnEliminarBackup' nombreBackup='".$archivo."'><i class='fa fa-times'></i></button>";
                 
                        }else{
                 
                        echo "<button class='btn btn-danger'><i class='fa fa-times'></i></button>";
                 
                        }

                      echo "</td></tr>";
              }
                
            } 
            
            ?>
             
            

            </tbody>
      </table>

      </div>

      <div class="card-body text-muted">
      <p> Las copias de seguridad se encuentran en : C:\laragon\www\ProyectoCaticao\backups</p>
      </div>
    </div>
  </section>
  </div>
</div>

<?php

  $borrarBackup = new ControladorBackup();
  $borrarBackup -> ctrEliminarBackup();

?> 