<?php

require_once "../controladores/costooperativo.controlador.php";
require_once "../modelos/costooperativo.modelo.php";

class AjaxCostoOperativo{

	/*=============================================
	EDITAR COSTOS OPERATIVOS
	=============================================*/	

	public $idCostoOperativo;

	public function ajaxEditarCostoOperativo(){

		$item = "idGastoAdmin";
		$valor = $this->idCostoOperativo;

		$respuesta = ControladorCostoOperativo::ctrMostrarCostoOperativo($item, $valor);

		echo json_encode($respuesta);

	}

}

/*=============================================
EDITAR COSTOS OPERATIVOS
=============================================*/
if(isset($_POST["idCostoOperativo"])){

	$editar = new AjaxCostoOperativo();
	$editar -> idCostoOperativo = $_POST["idCostoOperativo"];
	$editar -> ajaxEditarCostoOperativo();

}
