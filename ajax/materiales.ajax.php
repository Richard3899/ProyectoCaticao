<?php

require_once "../controladores/materiales.controlador.php";
require_once "../modelos/materiales.modelo.php";

class AjaxInsumos{

	/*=============================================
	EDITAR INSUMO
	=============================================*/	

	public $idInsumo;

	public function ajaxEditarInsumo(){

		$item = "idMateria";
		$valor = $this->idInsumo;

		$respuesta = ControladorMateriales::ctrMostrarMateriales($item, $valor);

		echo json_encode($respuesta);

	}


	/*=============================================
	VALIDAR NO REPETIR INSUMO
	=============================================*/	

	public $validarCodigo;

	public function ajaxValidarCodigo(){

		$item = "codigo";
		$valor = $this->validarCodigo;

		$respuesta = ControladorMateriales::ctrMostrarMateriales($item, $valor);

		echo json_encode($respuesta);

	}
}

/*=============================================
EDITAR INSUMO
=============================================*/
if(isset($_POST["idInsumo"])){

	$editar = new AjaxInsumos();
	$editar -> idInsumo = $_POST["idInsumo"];
	$editar -> ajaxEditarInsumo();

}

/*=============================================
VALIDAR NO REPETIR INSUMO
=============================================*/

if(isset( $_POST["validarCodigo"])){

	$valCodigo = new AjaxInsumos();
	$valCodigo -> validarCodigo = $_POST["validarCodigo"];
	$valCodigo -> ajaxValidarCodigo();

}