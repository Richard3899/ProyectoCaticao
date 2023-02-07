<?php

require_once "../controladores/usuariosmodulos.controlador.php";
require_once "../modelos/usuariosmodulos.modelo.php";

class AjaxUsuariosModulos{

	/*=============================================
	EDITAR USUARIO
	=============================================*/	

	public $idUsuario;

	public function ajaxEditarUsuarioModulos(){

		$valor = $this->idUsuario;

		$respuesta = ControladorUsuariosModulos::ctrMostrarUsuariosModulos($valor);

		echo json_encode($respuesta);

	}

}

/*=============================================
EDITAR USUARIOS MODULOS
=============================================*/
if(isset($_POST["idUsuario"])){

	$editar = new AjaxUsuariosModulos();
	$editar -> idUsuario = $_POST["idUsuario"];
	$editar -> ajaxEditarUsuarioModulos();

}
