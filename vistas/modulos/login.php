<div id="back"></div>
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <h2>CATICAO</h2>
      <img src="vistas/img/plantilla/logo.jpg" class="img-responsive" >
    </div>
    <div class="card-body">
      <p class="login-box-msg">Inicie Sesión</p>

      <form method="post">
        <div class="input-group mb-3">

          <input type="text" class="form-control" placeholder="Usuario" name="ingUsuario" required>

          <div class="input-group-append">
            <div class="input-group-text">

              <span class="fas fa-user"></span>

            </div>
          </div>

        </div>

        <div class="input-group mb-3">

          <input type="password" class="form-control" placeholder="Contraseña" name="ingPassword" required>
          
          <div class="input-group-append">

            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>

          </div>
        </div>

        <div class="row">
          <!-- /.col -->
          <div class="col-12">
            <button type="submit" class="btn btn-dark btn-block">Sign In</button>
          </div>
          <!-- /.col -->
        </div>

        <?php 
        $login = new ControladorUsuarios();
        $login -> ctrIngresoUsuario();

        ?>
      </form>


    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->