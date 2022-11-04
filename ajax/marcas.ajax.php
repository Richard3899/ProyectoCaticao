<?php

require_once "../controladores/marcas.controlador.php";
require_once "../modelos/marcas.modelo.php";

class AjaxMarcas{

	/*=============================================
	EDITAR MARCA
	=============================================*/	

	public $idMarca;

	public function ajaxEditarMarca(){

		$item = "idMarca";
		$valor = $this->idMarca;

		$respuesta = ControladorMarcas::ctrMostrarMarcas($item, $valor);

		echo json_encode($respuesta);

	}


	/*=============================================
	VALIDAR NO REPETIR MARCAS
	=============================================*/	

	public $validarDescripcion;

	public function ajaxValidarDescripcion(){

		$item = "descripcion";
		$valor = $this->validarDescripcion;

		$respuesta = ControladorMarcas::ctrMostrarMarcas($item, $valor);

		echo json_encode($respuesta);

	}
}

/*=============================================
EDITAR MARCAS
=============================================*/
if(isset($_POST["idMarcas"])){

	$editar = new AjaxMarcas();
	$editar -> idMarca = $_POST["idMarca"];
	$editar -> ajaxEditarMarca();

}

/*=============================================
VALIDAR NO REPETIR MARCA
=============================================*/

if(isset( $_POST["validarDescripcion"])){

	$valDescripcion = new AjaxMarcas();
	$valDescripcion -> validarDescripcion = $_POST["validarDescripcion"];
	$valDescripcion -> ajaxValidarDescripcion();

}

