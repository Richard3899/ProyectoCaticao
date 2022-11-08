<?php

require_once "../controladores/gastoadmin.controlador.php";
require_once "../modelos/gastoadmin.modelo.php";

class AjaxGastoAdmin{

	/*=============================================
	EDITAR GASTO ADMIN
	=============================================*/	

	public $idGastoAdmin;

	public function ajaxEditarGastoAdmin(){

		$item = "idGastoAdmin";
		$valor = $this->idGastoAdmin;

		$respuesta = ControladorGastoAdmin::ctrMostrarGastoAdmin($item, $valor);

		echo json_encode($respuesta);

	}

}

/*=============================================
EDITAR GASTO ADMIN
=============================================*/
if(isset($_POST["idGastoAdmin"])){

	$editar = new AjaxGastoAdmin();
	$editar -> idGastoAdmin = $_POST["idGastoAdmin"];
	$editar -> ajaxEditarGastoAdmin();

}
