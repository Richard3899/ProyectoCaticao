<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Administrar usuarios
    </h1>
    <ol class="breadcrumb">
      
      <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>
      
      <li class="active">Administrar usuarios</li>
    
    </ol>
  </section>
  <section class="content">
    <div class="box">

      <div class="box-header with-border">

       <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarUsuario">
      
        Agregar usuario

        </button>

      </div>

      <div class="box-body">

       <table class="table table-bordered table-striped dt-responsive tablas" width="100%">
 
        <thead>

         <tr>
            <th style="width:10px">#</th>
            <th>Nombre</th>
            <th>Usuario</th>
            <th>Foto</th>
            <th>Perfil</th>
            <th>Estado</th>
            <th>Último login</th>
            <th>Acciones</th>

          
          </tr> 

        </thead>

        <tbody>

        <?php
        $item = null;
        $valor = null;

        $usuarios = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

       foreach ($usuarios as $key => $value){
  
        echo ' <tr>
               <td>1</td>
               <td>'.$value["nombre"].'</td>
               <td>'.$value["usuario"].'</td>';

                if($value["foto"] != ""){

                 echo '<td><img src="'.$value["foto"].'" class="img-thumbnail" width="40px"></td>';

                }else{

                 echo '<td><img src="vistas/img/usuarios/default/anonymous.png" class="img-thumbnail" width="40px"></td>';

                }

                 echo '<td>'.$value["perfil"].'</td>';

                if($value["estado"] != 0){

                 echo '<td><button class="btn btn-success btn-xs btnActivar" idUsuario="'.$value["id"].'" estadoUsuario="0">Activado</button></td>';

                }else{

                 echo '<td><button class="btn btn-danger btn-xs btnActivar" idUsuario="'.$value["id"].'" estadoUsuario="1">Desactivado</button></td>';

                }             

                echo '<td>'.$value["ultimo_login"].'</td>
                <td>

                  <div class="btn-group">
                    
                    <button class="btn btn-warning btnEditarUsuario" idUsuario="'.$value["id"].'" data-toggle="modal" data-target="#modalEditarUsuario"><i class="fa fa-pencil"></i></button>

                    <button class="btn btn-danger btnEliminarUsuario" idUsuario="'.$value["id"].'" fotoUsuario="'.$value["foto"].'" usuario="'.$value["usuario"].'"><i class="fa fa-times"></i></button>

                  </div>  
                </td>

               </tr>';
        }
        ?> 
        </tbody>
        </table>
      </div>
     </div>
  </section>
</div>

</section>
      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Title</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
        <div class="card-body">
          Start creating your amazing application!
        </div>
        <!-- /.card-body -->
        <div class="card-footer">
          Footer
        </div>
        <!-- /.card-footer-->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
</div>
