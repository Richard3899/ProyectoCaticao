<?php
require_once "../controladores/usuarios.controlador.php";
require_once "../modelos/usuarios.modelo.php";

class TablaUsuarios{

 	/*=============================================
 	 MOSTRAR LA TABLA DE MARCAS
  	=============================================*/ 

	public function mostrarTablaUsuarios(){

		$item = null;
    	$valor = null;

  		$usuarios = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);	

		if(count($usuarios) == 0){

			echo '{"data": []}';

			return;
		}		
		
  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($usuarios); $i++){


			if($usuarios[$i]["foto"] != ""){
  
				$foto="<img src='".$usuarios[$i]["foto"]."' class='img-thumbnail' width='40px'>";

			  }else{

				$foto="<img src='vistas/img/usuarios/default/usuario.png' class='img-thumbnail' width='40px'>";

			  }

			if($usuarios[$i]["estado"] != 0){
  
				$estado="<button class='btn btn-success btnActivar' idUsuario='".$usuarios[$i]["idUsuario"]."' estadoUsuario='0'>Activado</button>";

			  }else{

				$estado="<button class='btn btn-danger btnActivar' idUsuario='".$usuarios[$i]["idUsuario"]."' estadoUsuario='1'>Desactivado</button>";

			}

			if($usuarios[$i]["ultimo_login"] != ""){  

				$ultimoLogin= $usuarios[$i]["ultimo_login"];

			  }else{

				$ultimoLogin= "Aun no inicia sesión";

			}

			/*==Botón Editar y Eliminar=*/
			if($usuarios[$i]["idUsuario"] == 1){

				$botones = "<div class='btn-group'><button class='btn btn-warning btnEditarUsuario' idUsuario='".$usuarios[$i]["idUsuario"]."' data-toggle='modal' data-target='#modalEditarUsuario'><i class='fa fa-pen'></i></button></div>";  
			}else{

				$botones = "<div class='btn-group'><button class='btn btn-warning btnEditarUsuario' idUsuario='".$usuarios[$i]["idUsuario"]."' data-toggle='modal' data-target='#modalEditarUsuario'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarUsuario' idUsuario='".$usuarios[$i]["idUsuario"]."' fotoUsuario='".$usuarios[$i]["foto"]."' usuario='".$usuarios[$i]["usuario"]."'><i class='fa fa-times'></i></button></div>";  

			}

			$datosJson .='[
			      "'.($i+1).'",
			      "'.$usuarios[$i]["nombre"].'",
				  "'.$usuarios[$i]["usuario"].'",
				  "'.$foto.'",
				  "'.$usuarios[$i]["perfil"].'",
				  "'.$estado.'",
				  "'.$ultimoLogin.'",
			      "'.$botones.'"
			    ],';

		  }

		  $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   '] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE MARCAS
=============================================*/ 
$activarUsuarios = new TablaUsuarios();
$activarUsuarios -> mostrarTablaUsuarios();

