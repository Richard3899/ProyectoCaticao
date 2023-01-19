<?php

require_once "../controladores/recetaconsumogas.controlador.php";
require_once "../modelos/recetaconsumogas.modelo.php";

class AjaxRecetaConsumoGas{

	/*=============================================
	EDITAR RECETA CONSUMO DE GAS
	=============================================*/	

	public $idRecetaConsumoGas;
	public $idReceta;

	public function ajaxEditarConsumoGasReceta(){

		$item="RecetaConsumoGas";

		$valor = $this->idRecetaConsumoGas;

		$respuesta = ControladorRecetaConsumoGas::ctrMostrarRecetaConsumoGas($item,$valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	MOSTRAR RECETA CONSUMO DE GASS
	=============================================*/
	public function ajaxReceta(){

		$item="Receta";

		$valor = $this->idReceta;

		$respuesta = ControladorRecetaConsumoGas::ctrMostrarRecetaConsumoGas($item,$valor);

		echo json_encode($respuesta);

	}

}


/*=============================================
EDITAR RECETA CONSUMO DE GAS
=============================================*/
if(isset($_POST["idRecetaConsumoGas"])){

	$editar = new AjaxRecetaConsumoGas();
	$editar -> idRecetaConsumoGas = $_POST["idRecetaConsumoGas"];
	$editar -> ajaxEditarConsumoGasReceta();

}

/*=============================================
MOSTRAR RECETA CONSUMO DE GASS
=============================================*/
if(isset($_POST["idReceta"])){

	$editar = new AjaxRecetaConsumoGas();
	$editar -> idReceta = $_POST["idReceta"];
	$editar -> ajaxReceta();

}

