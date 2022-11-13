<?php

require_once "../controladores/materiales.controlador.php";
require_once "../modelos/materiales.modelo.php";

class AjaxMateriales{

	/*=============================================
	EDITAR INSUMO
	=============================================*/	

	public $idMaterial;

	public function ajaxEditarMaterial(){

		$item = "idMateria";
		$valor = $this->idMaterial;

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
if(isset($_POST["idMaterial"])){

	$editar = new AjaxMateriales();
	$editar -> idMaterial = $_POST["idMaterial"];
	$editar -> ajaxEditarMaterial();

}

/*=============================================
VALIDAR NO REPETIR INSUMO
=============================================*/

if(isset( $_POST["validarCodigo"])){

	$valCodigo = new AjaxMateriales();
	$valCodigo -> validarCodigo = $_POST["validarCodigo"];
	$valCodigo -> ajaxValidarCodigo();

}