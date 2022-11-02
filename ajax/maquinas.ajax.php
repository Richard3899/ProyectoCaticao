<?php

require_once "../controladores/maquinas.controlador.php";
require_once "../modelos/maquinas.modelo.php";

class AjaxMaquinas{

	/*=============================================
	EDITAR MAQUINA
	=============================================*/	

	public $idMaquina;

	public function ajaxEditarMaquina(){

		$item = "idMaquina";
		$valor = $this->idMaquina;

		$respuesta = ControladorMaquinas::ctrMostrarMaquinas($item, $valor);

		echo json_encode($respuesta);

	}


	/*=============================================
	VALIDAR NO REPETIR MAQUINA
	=============================================*/	

	public $validarCodigo;

	public function ajaxValidarCodigo(){

		$item = "codigo";
		$valor = $this->validarCodigo;

		$respuesta = ControladorMaquinas::ctrMostrarMaquinas($item, $valor);

		echo json_encode($respuesta);

	}
}

/*=============================================
EDITAR MAQUINA
=============================================*/
if(isset($_POST["idMaquina"])){

	$editar = new AjaxMaquinas();
	$editar -> idMaquina = $_POST["idMaquina"];
	$editar -> ajaxEditarMaquina();

}

/*=============================================
VALIDAR NO REPETIR MAQUINA
=============================================*/

if(isset( $_POST["validarCodigo"])){

	$valCodigo = new AjaxMaquinas();
	$valCodigo -> validarCodigo = $_POST["validarCodigo"];
	$valCodigo -> ajaxValidarCodigo();

}

