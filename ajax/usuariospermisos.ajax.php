<?php

require_once "../controladores/usuariospermisos.controlador.php";
require_once "../modelos/usuariospermisos.modelo.php";

class AjaxUsuariosPermisos{

	/*=============================================
	EDITAR USUARIOS Y PERMISOS
	=============================================*/	

	public $idUsuario;

	public function ajaxEditarUsuariosPermisos(){

		$valor = $this->idUsuario;

		$respuesta = ControladorUsuariosPermisos::ctrMostrarUsuariosPermisos($valor);

		echo json_encode($respuesta);

	}

}

/*=============================================
EDITAR USUARIOS Y PERMISOS
=============================================*/
if(isset($_POST["idUsuario"])){

	$editar = new AjaxUsuariosPermisos();
	$editar -> idUsuario = $_POST["idUsuario"];
	$editar -> ajaxEditarUsuariosPermisos();

}
