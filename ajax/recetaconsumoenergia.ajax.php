<?php

require_once "../controladores/recetaconsumoenergia.controlador.php";
require_once "../modelos/recetaconsumoenergia.modelo.php";

class AjaxRecetaConsumoEnergia{

	public $tarifaKwh;
	public $idRecetaConsumoEnergia;
	public $idReceta;

	public function ajaxTarifaKwh(){

		$respuesta = ControladorRecetaConsumoEnergia::ctrMostrarTarifaKwh();

		echo json_encode($respuesta);

	}

	/*=============================================
	EDITAR RECETA CONSUMO DE ENERGÍA
	=============================================*/	

	public function ajaxConsumoEnergiaReceta(){

		$item="RecetaConsumoEnergia";

		$valor = $this->idRecetaConsumoEnergia;

		$respuesta = ControladorRecetaConsumoEnergia::ctrMostrarRecetaConsumoEnergia($item,$valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	EDITAR RECETA CONSUMO DE ENERGÍA
	=============================================*/
	public function ajaxReceta(){

		$item="Receta";

		$valor = $this->idReceta;

		$respuesta = ControladorRecetaConsumoEnergia::ctrMostrarRecetaConsumoEnergia($item,$valor);

		echo json_encode($respuesta);

	}

}

/*=============================================
EDITAR TARIFA KWH
=============================================*/
if(isset($_POST["tarifaKwh"])){

	$editar = new AjaxRecetaConsumoEnergia();
	$editar -> tarifaKwh = $_POST["tarifaKwh"];
	$editar -> ajaxTarifaKwh();

}

/*=============================================
EDITAR RECETA CONSUMO DE ENERGÍA
=============================================*/
if(isset($_POST["idRecetaConsumoEnergia"])){

	$editar = new AjaxRecetaConsumoEnergia();
	$editar -> idRecetaConsumoEnergia = $_POST["idRecetaConsumoEnergia"];
	$editar -> ajaxConsumoEnergiaReceta();

}

/*=============================================
EDITAR RECETA CONSUMO DE ENERGÍA
=============================================*/
if(isset($_POST["idReceta"])){

	$editar = new AjaxRecetaConsumoEnergia();
	$editar -> idReceta = $_POST["idReceta"];
	$editar -> ajaxReceta();

}

