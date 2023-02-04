
if(!empty($_POST['check_list'])){
				 // Bucle para almacenar y mostrar los valores de la casilla de verificación comprobación individual.
				 foreach($_POST['check_list'] as $value){
					$datos = array("descripcion" => $value
				);
				$respuesta = ModeloMarcas::mdlIngresarMarca($datos);

				 }
				 }


            <fieldset>
              <legend>Choose your monster's features:</legend>

              <div>
                <input type="checkbox" value="España" name="check_list[]">
                <label >España</label>
              </div>

              <div>
                <input type="checkbox" value="Alemania" name="check_list[]">
                <label >Alemania</label>
              </div>

              <div>
                <input type="checkbox" value="Perú" name="check_list[]">
                <label >Perú</label>
              </div>

              <div>
                <input type="checkbox" value="Argelia" name="check_list[]">
                <label >Argelia</label>
              </div>
          </fieldset>



          <tbody>
        
        <?php
  
        $item = null;
        $valor = null;
  
        $usuarios = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);
  
        foreach ($usuarios as $key => $value){
        
          echo ' <tr>
                  <td>'.$value["idUsuario"].'</td>
                  <td>'.$value["nombre"].'</td>
                  <td>'.$value["usuario"].'</td>';
  
                  if($value["foto"] != ""){
  
                    echo '<td><img src="'.$value["foto"].'" class="img-thumbnail" width="40px"></td>';
  
                  }else{
  
                    echo '<td><img src="vistas/img/usuarios/default/usuario.png" class="img-thumbnail" width="40px"></td>';
  
                  }
  
                  echo '<td>'.$value["perfil"].'</td>';
  
                  if($value["estado"] != 0){
  
                    echo '<td><button class="btn btn-success btn-xs btnActivar" idUsuario="'.$value["idUsuario"].'" estadoUsuario="0">Activado</button></td>';
  
                  }else{
  
                    echo '<td><button class="btn btn-danger btn-xs btnActivar" idUsuario="'.$value["idUsuario"].'" estadoUsuario="1">Desactivado</button></td>';
  
                  }
                  if($value["ultimo_login"] != ""){   
                    echo '<td>'.$value["ultimo_login"].'</td>';
                  }else{
  
                    echo '<td>Aun no inicia sesión</td>';
  
                  }
  
                  
                  echo '<td>
  
                    <div class="btn-group"><button class="btn btn-warning btnEditarUsuario" idUsuario="'.$value["idUsuario"].'" data-toggle="modal" data-target="#modalEditarUsuario"><i class="fa fa-pen"></i></button><button class="btn btn-danger btnEliminarUsuario" idUsuario="'.$value["idUsuario"].'" fotoUsuario="'.$value["foto"].'" usuario="'.$value["usuario"].'"><i class="fa fa-times"></i></button></div>  
  
                  </td>
  
                </tr>';
        }
  
  
        ?>
  
        </tbody>