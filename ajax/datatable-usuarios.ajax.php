<?php
require_once "../controladores/usuarios.controlador.php";
require_once "../modelos/usuarios.modelo.php";

require_once "../controladores/perfiles.controlador.php";
require_once "../modelos/perfiles.modelo.php";

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

			/*=============================================
 	 		TRAEMOS LA MARCA
  			=============================================*/ 

		  	$item = "idPerfil";
		  	$valor = $usuarios[$i]["idPerfil"];

		  	$perfiles = ControladorPerfiles::ctrMostrarPerfiles($item, $valor);

		    /*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			if($usuarios[$i]["idUsuario"] == 1 && $_GET["idUsuarioSession"]!=1){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
			$estado="<button class='btn btn-success'>Activado</button>";
		    
		    }else if($usuarios[$i]["idUsuario"] == 1 && $_GET["idUsuarioSession"]==1){

			$botones = "<div class='btn-group'><button title='Editar' class='btn btn-warning btnEditarUsuario' idUsuario='".$usuarios[$i]["idUsuario"]."' data-toggle='modal' data-target='#modalEditarUsuario'><i class='fa fa-pen'></i></button></div>";  
			$estado="<button class='btn btn-success'>Activado</button>";

			}else{

			if($usuarios[$i]["estado"] != 0){
  
			$estado="<button class='btn btn-success btnActivar' idUsuario='".$usuarios[$i]["idUsuario"]."' estadoUsuario='0'>Activado</button>";
	
			}else{
	
			$estado="<button class='btn btn-danger btnActivar' idUsuario='".$usuarios[$i]["idUsuario"]."' estadoUsuario='1'>Desactivado</button>";
	
			}
			$botones = "<div class='btn-group'><button title='Editar' class='btn btn-warning btnEditarUsuario' idUsuario='".$usuarios[$i]["idUsuario"]."' data-toggle='modal' data-target='#modalEditarUsuario'><i class='fa fa-pen'></i></button></div>";  
	
			}

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){

			if($usuarios[$i]["idUsuario"] == 1 && $_GET["idUsuarioSession"]!=1){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
			$estado="<button class='btn btn-success'>Activado</button>";
		    
		    }else if($usuarios[$i]["idUsuario"] == 1 && $_GET["idUsuarioSession"]==1){

			$botones = "<div class='btn-group'><button title='Editar' class='btn btn-warning btnEditarUsuario' idUsuario='".$usuarios[$i]["idUsuario"]."' data-toggle='modal' data-target='#modalEditarUsuario'><i class='fa fa-pen'></i></button></div>";  
			$estado="<button class='btn btn-success'>Activado</button>";

			}else{

			if($usuarios[$i]["estado"] != 0){
  
			$estado="<button class='btn btn-success' idUsuario='".$usuarios[$i]["idUsuario"]."' estadoUsuario='0'>Activado</button>";
	
			}else{
	
			$estado="<button class='btn btn-danger' idUsuario='".$usuarios[$i]["idUsuario"]."' estadoUsuario='1'>Desactivado</button>";
	
			}
			$botones = "<div class='btn-group'><button title='Eliminar' class='btn btn-danger btnEliminarUsuario' idUsuario='".$usuarios[$i]["idUsuario"]."' fotoUsuario='".$usuarios[$i]["foto"]."' usuario='".$usuarios[$i]["usuario"]."'><i class='fa fa-times'></i></button></div>";  
	
			}

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

		    if($usuarios[$i]["idUsuario"] == 1 && $_GET["idUsuarioSession"]!=1){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
			$estado="<button class='btn btn-success'>Activado</button>";
		    
		    }else if($usuarios[$i]["idUsuario"] == 1 && $_GET["idUsuarioSession"]==1){

			$botones = "<div class='btn-group'><button title='Editar' class='btn btn-warning btnEditarUsuario' idUsuario='".$usuarios[$i]["idUsuario"]."' data-toggle='modal' data-target='#modalEditarUsuario'><i class='fa fa-pen'></i></button></div>";  
			$estado="<button class='btn btn-success'>Activado</button>";
	
			}else{

			if($usuarios[$i]["estado"] != 0){
  
			$estado="<button class='btn btn-success' idUsuario='".$usuarios[$i]["idUsuario"]."' estadoUsuario='0'>Activado</button>";
	
			}else{
	
			$estado="<button class='btn btn-danger' idUsuario='".$usuarios[$i]["idUsuario"]."' estadoUsuario='1'>Desactivado</button>";
	
			}

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
	
			}	
				
		    }else{

			if($usuarios[$i]["idUsuario"] == 1 && $_GET["idUsuarioSession"]!=1){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
			$estado="<button class='btn btn-success'>Activado</button>";
		    
		    }else if($usuarios[$i]["idUsuario"] == 1 && $_GET["idUsuarioSession"]==1){

			$botones = "<div class='btn-group'><button title='Editar' class='btn btn-warning btnEditarUsuario' idUsuario='".$usuarios[$i]["idUsuario"]."' data-toggle='modal' data-target='#modalEditarUsuario'><i class='fa fa-pen'></i></button></div>";  
			$estado="<button class='btn btn-success'>Activado</button>";

			}else{

			if($usuarios[$i]["estado"] != 0){
  
			$estado="<button class='btn btn-success btnActivar' idUsuario='".$usuarios[$i]["idUsuario"]."' estadoUsuario='0'>Activado</button>";
	
			}else{
	
			$estado="<button class='btn btn-danger btnActivar' idUsuario='".$usuarios[$i]["idUsuario"]."' estadoUsuario='1'>Desactivado</button>";
	
			}
			$botones = "<div class='btn-group'><button title='Editar' class='btn btn-warning btnEditarUsuario' idUsuario='".$usuarios[$i]["idUsuario"]."' data-toggle='modal' data-target='#modalEditarUsuario'><i class='fa fa-pen'></i></button><button title='Eliminar' class='btn btn-danger btnEliminarUsuario' idUsuario='".$usuarios[$i]["idUsuario"]."' fotoUsuario='".$usuarios[$i]["foto"]."' usuario='".$usuarios[$i]["usuario"]."'><i class='fa fa-times'></i></button></div>";  
	
			}

			}

			$datosJson .='[
			      "'.($i+1).'",
			      "'.$usuarios[$i]["nombre"].'",
				  "'.$usuarios[$i]["usuario"].'",
				  "'.$foto.'",
				  "'.$perfiles["descripcion"].'",
				  "'.$estado.'",
				  "'.$usuarios[$i]["ultimo_login"].'",
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

