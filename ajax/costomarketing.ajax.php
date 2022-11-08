<?php

require_once "../controladores/costomarketing.controlador.php";
require_once "../modelos/costomarketing.modelo.php";

class AjaxCostoMarketing{

	/*=============================================
	EDITAR COSTOS DE MARKETING
	=============================================*/	

	public $idCostoMarketing;

	public function ajaxEditarCostoMarketing(){

		$item = "idGastoAdmin";
		$valor = $this->idCostoMarketing;

		$respuesta = ControladorCostoMarketing::ctrMostrarCostoMarketing($item, $valor);

		echo json_encode($respuesta);

	}

}

/*=============================================
EDITAR COSTOS DE MARKETING
=============================================*/
if(isset($_POST["idCostoMarketing"])){

	$editar = new AjaxCostoMarketing();
	$editar -> idCostoMarketing = $_POST["idCostoMarketing"];
	$editar -> ajaxEditarCostoMarketing();

}
