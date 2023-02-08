<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="container">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Administrador de Empleados</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">Inicio</a></li>
            <li class="breadcrumb-item active">Registros</li>
            <li class="breadcrumb-item active">Administrador de Empleados</li>
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
      
      <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarEmpleado">
        
        Agregar Empleado

      </button>
        
      </div>
      <div class="card-body">

      <table class="table table-bordered table-striped dt-responsive tablaEmpleados" width="100%">
       
      <thead>
       
       <tr>
         
         <th style="width:10px">#</th>
         <th>Nombre</th>
         <th>Apellido</th>
         <th>Usuario</th>
         <th>Correo</th>
         <th>Tipo de Documento</th>
         <th>Número de Documento</th>
         <th>Dirección</th>
         <th>Teléfono</th>
         <th>Fecha de Nacimiento</th>
         <th>Cargo</th>
         <th>Horario de Trabajo</th>
         <th>Horas trabajo por día</th>
         <th>Sueldo por día</th>
         <th>Sueldo por mes</th>
         <th>Tipo de sueldo</th>
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
MODAL AGREGAR EMPLEADO
======================================-->

<div id="modalAgregarEmpleado" class="modal fade" role="dialog">

<div class="modal-dialog modal-lg">

  <div class="modal-content">

    <form role="form" method="post" enctype="multipart/form-data">

      <!--=====================================
      CABEZA DEL MODAL
      ======================================-->

      <div class="modal-header" style="background:gray; color:white">

      <h4 class="modal-title">Agregar Empleado</h4>

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!--=====================================
      CUERPO DEL MODAL
      ======================================-->

      <div class="modal-body">

        <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA EL NOMBRE -->
            <div class="form-group col-sm">
            <label for="nombre">Nombre</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevoNombre" name="nuevoNombre" placeholder="Ingresar nombre" 
                 maxlength="50"  pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras" required>
            </div>
            </div>

            <!-- ENTRADA PARA EL APELLIDO -->
            <div class="form-group col-sm">
            <label for="apellido">Apellido</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevoApellido" name="nuevoApellido" placeholder="Ingresar apellido" 
                 maxlength="50"  pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras" required>
            </div>
            </div>

          </div>

          <div class="row">

          <!-- ENTRADA PARA SELECCIONAR SU USUARIO -->
          <div class="form-group col-sm">
          <label for="usuario">Usuario</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>

                <select class="form-control input-lg" id="nuevoUsuarioEmpleado" name="nuevoUsuarioEmpleado">
                
                <option value="" >Seleccionar Usuario</option>

                <?php 
                $item = null;
                $valor = null;

                $usuario = ControladorUsuarios::ctrMostrarUsuarios($item,$valor);

                foreach($usuario as $key=> $value){ 
                  echo '<option value="'.$value["idUsuario"].'">'.$value["usuario"].'</option>';
                }

                ?>

              </select>

            </div>

          </div>

          <!-- ENTRADA PARA EL CORREO -->
          <div class="form-group col-sm">
          <label for="correo">Correo</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-envelope"></i></span>
              </div>
              <input type="email" class="form-control input-lg" id="nuevoCorreo" name="nuevoCorreo" placeholder="Ingresar correo" 
                maxlength="50"  title="Máximo 50 caracteres" required>
          </div>
          </div>

          </div>

          <div class="row">

          <!-- ENTRADA PARA SELECCIONAR SU TIPO DOCUMENTO -->
          <div class="form-group col-sm">
          <label for="tipoDocumento">Tipo de Documento</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-id-card"></i></span>
                </div>

                <select class="form-control input-lg" id="nuevoTipoDocumento" name="nuevoTipoDocumento" required>
                
                <option value="">Tipo de Documento</option>

                <?php 
                $item = null;
                $valor = null;

                $tipodocumento = ControladorTipoDocumento::ctrMostrarTipoDocumento($item,$valor);

                foreach($tipodocumento as $key=> $value){ 
                  echo '<option value="'.$value["idTipoDocumento"].'">'.$value["descripcion"].'</option>';
                }

                ?>

              </select>

            </div>

          </div>

          <!-- ENTRADA PARA EL NÚMERO DE DOCUMENTO -->
          <div class="form-group col-sm">
          <label for="numeroDocumento">Número de Documento</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
              </div>
              <input type="text" class="form-control input-lg" id="nuevoNumeroDocumento" name="nuevoNumeroDocumento" placeholder="Ingresar número de documento" 
               pattern="[0-9]{8,12}" title="Números entre 8 y 12 caracteres" required>
          </div>
          </div>

          </div>

          <!-- ENTRADA PARA EL DIRECCIÓN -->
          <div class="form-group">
          <label for="direccion">Dirección</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-map"></i></span>
              </div>
              <input type="text" class="form-control input-lg" id="nuevaDireccion" name="nuevaDireccion" placeholder="Ingresar dirección" 
               maxlength="50"  pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ-. ]+" title="Solo se acepta letras, números, guiones y puntos" required>
          </div>
          </div>


          <div class="row">

          <!-- ENTRADA PARA EL TELÉFONO -->
          <div class="form-group col-sm">
          <label for="telefono">Teléfono</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-phone"></i></span>
              </div>
              <input type="text" class="form-control input-lg" name="nuevoTelefono" id="nuevoTelefono"
               placeholder="Ingresar teléfono" pattern="[0-9]{9}" title="Solo números de 9 caracteres" required>
          </div>
          </div>

          <!-- ENTRADA PARA EL FECHA NACIMIENTO -->
          <div class="form-group col-sm">
          <label for="fechaNacimiento">Fecha de Nacimiento</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
              <input type="text" class="textbox-n form-control"  name="nuevaFechaNacimiento" id="nuevaFechaNacimiento"
              placeholder="Ingresar fecha de nacimiento" onfocus="(this.type='date')" onblur="(this.type='date')" id="date" required>
          </div>
          </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA EL CARGO -->
            <div class="form-group col-sm">
            <label for="cargo">Cargo</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-users"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevoCargo" name="nuevoCargo" placeholder="Ingresar cargo" 
                 maxlength="50"  pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras" required>
            </div>
            </div>

             <!-- ENTRADA PARA EL HORARIO TRABAJO -->
            <div class="form-group col-sm">
            <label for="horarioTrabajo">Horario de Trabajo</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-stopwatch"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="nuevoHorarioTrabajo" name="nuevoHorarioTrabajo" placeholder="Ingresar horario de trabajo" 
                 maxlength="50" pattern="[A-Za-z0-9-:. ]+" title="Solo se aceptan letras, números, guiones y puntos" required>
            </div>
            </div>

          </div>

          <div class="row">

          <!-- ENTRADA PARA HORAS POR DÍA -->
          <div class="form-group col-sm">
          <label for="horasPorDia">Horas de Trabajo por día</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-clock"></i></span>
              </div>
              <input type="number" class="form-control input-lg" id="nuevoHorasPorDia" name="nuevoHorasPorDia" placeholder="Ingresar horas de trabajo por día" 
               min="0" max="24" required>
          </div>
          </div>

          <!-- ENTRADA PARA EL SUELO POR DÍA -->
          <div class="form-group col-sm">
          <label for="sueldoPorDia">Sueldo por día</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
              </div>
              <input type="number" class="form-control input-lg" name="nuevoSueldoPorDia" id="nuevoSueldoPorDia"
               placeholder="Ingresar sueldo por día" min="0" max="9999999" step="0.01" required>
          </div>
          </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA EL SUELO POR MES -->
            <div class="form-group col-sm">
            <label for="sueldoPorMes">Sueldo por mes</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-money-bill"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="nuevoSueldoPorMes" id="nuevoSueldoPorMes"
                 placeholder="Ingresar sueldo por mes" min="0" max="9999999" step="0.01" required>
            </div>
            </div>

          <!-- ENTRADA PARA SELECCIONAR SU TIPO DE SUELDO -->
          <div class="form-group col-sm">
          <label for="tipoSueldo">Tipo de Sueldo</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-tag"></i></span>
                </div>

                <select class="form-control input-lg" id="nuevoTipoCosto" name="nuevoTipoCosto" required>
                
                <option value="">Tipo de Sueldo</option>

                <?php 
                $item = null;
                $valor = null;

                $tipocosto = ControladorTipoCosto::ctrMostrarTipoCosto($item,$valor);

                foreach($tipocosto as $key=> $value){ 
                  echo '<option value="'.$value["idTipoCosto"].'">'.$value["descripcion"].'</option>';
                }

                ?>

              </select>

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

        <button type="submit" class="btn btn-primary">Guardar empleado</button>

      </div>

      <?php

          $crearEmpleado = new ControladorEmpleados();
          $crearEmpleado -> ctrCrearEmpleado();

      ?>


    </form>

  </div>

</div>

</div>


<!--=====================================
MODAL EDITAR EMPLEADO
======================================-->

<div id="modalEditarEmpleado" class="modal fade" role="dialog">
  
  <div class="modal-dialog modal-lg">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:gray; color:white">

        <h4 class="modal-title">Editar Empleado</h4>

        <button type="button" class="close" data-dismiss="modal">&times;</button>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

          <div class="row">

            <!-- ENTRADA PARA EL NOMBRE -->
            <div class="form-group col-sm">
            <label for="nombre">Nombre</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="editarNombre" name="editarNombre" placeholder="Ingresar nombre" 
                 maxlength="50"  pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras" required>
                 <input type="hidden" id="idEmpleado" name="idEmpleado">
            </div>
            </div>

            <!-- ENTRADA PARA EL APELLIDO -->
            <div class="form-group col-sm">
            <label for="apellido">Apellido</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="editarApellido" name="editarApellido" placeholder="Ingresar apellido" 
                 maxlength="50"  pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras" required>
            </div>
            </div>

          </div>

          <div class="row">

          <!-- ENTRADA PARA SELECCIONAR SU USUARIO -->
          <div class="form-group col-sm">
          <label for="usuario">Usuario</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>

                <select class="form-control input-lg" id="editarUsuarioEmpleado" name="editarUsuarioEmpleado">
                
                <option value="" >Seleccionar Usuario</option>

                <?php 
                $item = null;
                $valor = null;

                $usuario = ControladorUsuarios::ctrMostrarUsuarios($item,$valor);

                foreach($usuario as $key=> $value){ 
                  echo '<option value="'.$value["idUsuario"].'">'.$value["usuario"].'</option>';
                }

                ?>

              </select>

            </div>

          </div>

          <!-- ENTRADA PARA EL CORREO -->
          <div class="form-group col-sm">
          <label for="correo">Correo</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-envelope"></i></span>
              </div>
              <input type="email" class="form-control input-lg" id="editarCorreo" name="editarCorreo" placeholder="Ingresar correo" 
                maxlength="50"  title="Máximo 50 caracteres" required>
          </div>
          </div>

          </div>


          <div class="row">

          <!-- ENTRADA PARA SELECCIONAR SU TIPO DOCUMENTO -->
          <div class="form-group col-sm">
          <label for="tipoDocumento">Tipo de Documento</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-id-card"></i></span>
                </div>

                <select class="form-control input-lg" id="editarTipoDocumento" name="editarTipoDocumento" required>
                
                <option value="">Tipo de Documento</option>

                <?php 
                $item = null;
                $valor = null;

                $tipodocumento = ControladorTipoDocumento::ctrMostrarTipoDocumento($item,$valor);

                foreach($tipodocumento as $key=> $value){ 
                  echo '<option value="'.$value["idTipoDocumento"].'">'.$value["descripcion"].'</option>';
                }

                ?>

              </select>

            </div>

          </div>

          <!-- ENTRADA PARA EL NÚMERO DE DOCUMENTO -->
          <div class="form-group col-sm">
          <label for="numeroDocumento">Número de Documento</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
              </div>
              <input type="text" class="form-control input-lg" id="editarNumeroDocumento" name="editarNumeroDocumento" placeholder="Ingresar número de documento" 
               pattern="[0-9]{8,12}" title="Números entre 8 y 12 caracteres" required>
          </div>
          </div>

          </div>

          <!-- ENTRADA PARA EL DIRECCIÓN -->
          <div class="form-group">
          <label for="direccion">Dirección</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-map"></i></span>
              </div>
              <input type="text" class="form-control input-lg" id="editarDireccion" name="editarDireccion" placeholder="Ingresar dirección" 
               maxlength="50"  pattern="[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ-. ]+" title="Solo se acepta letras, números, guiones y puntos" required>
          </div>
          </div>


          <div class="row">

          <!-- ENTRADA PARA EL TELÉFONO -->
          <div class="form-group col-sm">
          <label for="telefono">Teléfono</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-phone"></i></span>
              </div>
              <input type="text" class="form-control input-lg" name="editarTelefono" id="editarTelefono"
               placeholder="Ingresar teléfono" pattern="[0-9]{9}" title="Solo números de 9 caracteres" required>
          </div>
          </div>

          <!-- ENTRADA PARA EL FECHA NACIMIENTO -->
          <div class="form-group col-sm">
          <label for="fechaNacimiento">Fecha de Nacimiento</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
              </div>
               <input type="text" class="textbox-n form-control"  name="editarFechaNacimiento" id="editarFechaNacimiento"
               placeholder="Ingresar fecha de nacimiento" onfocus="(this.type='date')" onblur="(this.type='date')" id="date" required>
          </div>
          </div>

          </div>


          <div class="row">

            <!-- ENTRADA PARA EL CARGO -->
            <div class="form-group col-sm">
            <label for="cargo">Cargo</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-users"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="editarCargo" name="editarCargo" placeholder="Ingresar cargo" 
                 maxlength="50"  pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ ]+" title="Solo se acepta letras" required>
            </div>
            </div>

            <!-- ENTRADA PARA EL HORARIO TRABAJO -->
            <div class="form-group col-sm">
            <label for="horarioTrabajo">Horario de Trabajo</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-stopwatch"></i></span>
                </div>
                <input type="text" class="form-control input-lg" id="editarHorarioTrabajo" name="editarHorarioTrabajo" placeholder="Ingresar horario de trabajo" 
                 maxlength="50" pattern="[A-Za-z0-9-:. ]+" title="Solo se aceptan letras, números, guiones y puntos" required>
            </div>
            </div>

          </div>

          <div class="row">

          <!-- ENTRADA PARA HORAS POR DÍA -->
          <div class="form-group col-sm">
          <label for="horasPorDia">Horas de Trabajo por día</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-clock"></i></span>
              </div>
              <input type="number" class="form-control input-lg" id="editarHorasPorDia" name="editarHorasPorDia" placeholder="Ingresar horas de trabajo por día" 
               min="0" max="24" required>
          </div>
          </div>

          <!-- ENTRADA PARA EL SUELO POR DÍA -->
          <div class="form-group col-sm">
          <label for="sueldoPorDia">Sueldo por día</label>
          <div class="input-group">
              <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
              </div>
              <input type="number" class="form-control input-lg" name="editarSueldoPorDia" id="editarSueldoPorDia"
               placeholder="Ingresar sueldo por día" min="0" max="9999999" step="0.01" required>
          </div>
          </div>

          </div>

          <div class="row">

            <!-- ENTRADA PARA EL SUELO POR MES -->
            <div class="form-group col-sm">
            <label for="sueldoPorMes">Sueldo por mes</label>
            <div class="input-group">
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-money-bill"></i></span>
                </div>
                <input type="number" class="form-control input-lg" name="editarSueldoPorMes" id="editarSueldoPorMes"
                 placeholder="Ingresar sueldo por mes" min="0" max="9999999" step="0.01" required>
            </div>
            </div>

          <!-- ENTRADA PARA SELECCIONAR SU TIPO DE SUELDO -->
          <div class="form-group col-sm">
          <label for="tipoSueldo">Tipo de Sueldo</label>
            <div class="input-group">
            
                <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-tag"></i></span>
                </div>

                <select class="form-control input-lg" id="editarTipoCosto" name="editarTipoCosto" required>
                
                <option value="">Tipo de Sueldo</option>

                <?php 
                $item = null;
                $valor = null;

                $tipocosto = ControladorTipoCosto::ctrMostrarTipoCosto($item,$valor);

                foreach($tipocosto as $key=> $value){ 
                  echo '<option value="'.$value["idTipoCosto"].'">'.$value["descripcion"].'</option>';
                }

                ?>

              </select>

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

          <button type="submit" class="btn btn-primary">Editar Empleado</button>

        </div>

        <?php

          $editarEmpleado = new ControladorEmpleados();
          $editarEmpleado -> ctrEditarEmpleado();

        ?> 

      </form>

    </div>

  </div>

</div>

<?php

  $borrarEmpleado = new ControladorEmpleados();
  $borrarEmpleado -> ctrEliminarEmpleado();

?> 