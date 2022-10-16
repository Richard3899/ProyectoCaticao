  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="container">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Administrador de Usuarios</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
              <li class="breadcrumb-item active">Administrador de Usuarios</li>
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
        
        <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarUsuario">
          
          Agregar Usuario

        </button>
          
          
        </div>
        <div class="card-body">

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
          
          <tr>
            <td>1</td>
            <td>Usuario Administrador</td>
            <td>admin</td>
            <td><img src="vistas/img/usuarios/default/usuario.png" class="img-thumbnail" width="40px"></td>
            <td>Administrador</td>
            <td><button class="btn btn-success btn-xs">Activado</button></td>
            <td>2017-12-11 12:05:32</td>
            <td>

              <div class="btn-group">
                  
                <button class="btn btn-warning"><i class="fa fa-pen"></i></button>

                <button class="btn btn-danger"><i class="fa fa-times"></i></button>

              </div>  

            </td>

          </tr>

           <tr>
            <td>1</td>
            <td>Usuario Administrador</td>
            <td>admin</td>
            <td><img src="vistas/img/usuarios/default/usuario.png" class="img-thumbnail" width="40px"></td>
            <td>Administrador</td>
            <td><button class="btn btn-success btn-xs">Activado</button></td>
            <td>2017-12-11 12:05:32</td>
            <td>

              <div class="btn-group">
                  
                <button class="btn btn-warning"><i class="fa fa-pen"></i></button>

                <button class="btn btn-danger"><i class="fa fa-times"></i></button>

              </div>  

            </td>

          </tr>

           <tr>
            <td>1</td>
            <td>Usuario Administrador</td>
            <td>admin</td>
            <td><img src="vistas/img/usuarios/default/usuario.png" class="img-thumbnail" width="40px"></td>
            <td>Administrador</td>
            <td><button class="btn btn-danger btn-xs">Desactivado</button></td>
            <td>2017-12-11 12:05:32</td>
            <td>

              <div class="btn-group">
                  
                <button class="btn btn-warning"><i class="fa fa-pen"></i></button>

                <button class="btn btn-danger"><i class="fa fa-times"></i></button>

              </div>  

            </td>

          </tr>

        </tbody>



       </table>
          

        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->