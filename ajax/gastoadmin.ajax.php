<?php

require_once "../controladores/gastoadmin.controlador.php";
require_once "../modelos/gastoadmin.modelo.php";

class AjaxGastoAdmin{ 

	/*=============================================
	EDITAR GASTO
	=============================================*/	

	public $idGastoAdmin;

	public function ajaxEditarGastoAdmin(){

		$item = "idGastoAdmin";
		$valor = $this->idGastoAdmin;

		$respuesta = ControladorGastoAdmin::ctrMostrarGastoAdmin($item, $valor);

		echo json_encode($respuesta);

	}

	/*=============================================
	VALIDAR NO REPETIR GASTO
	=============================================*/	

	public $validarCodigo;

	public function ajaxValidarCodigo(){

		$item = "codigo"; 
		$valor = $this->validarCodigo;

		$respuesta = ControladorGastoAdmin::ctrMostrarGastoAdmin($item, $valor);

		echo json_encode($respuesta);

	}

	/*=============================================
	MOSTRAR GASTO POR ID TIPO GASTO
	=============================================*/	

	public $idTipoGasto;

	public function ajaxMostrarGastoPorTipo(){

		$valor = $this->idTipoGasto;

		$respuesta = ControladorGastoAdmin::ctrMostrarGastoAdmin2($valor);
		
		echo json_encode($respuesta);

	}

}

/*=============================================
EDITAR GASTO
=============================================*/
if(isset($_POST["idGastoAdmin"])){

	$editar = new AjaxGastoAdmin();
	$editar -> idGastoAdmin = $_POST["idGastoAdmin"];
	$editar -> ajaxEditarGastoAdmin();

}

/*=============================================
VALIDAR NO REPETIR INSUMO
=============================================*/

if(isset($_POST["validarCodigo"])){

	$valCodigo = new AjaxGastoAdmin();
	$valCodigo -> validarCodigo = $_POST["validarCodigo"];
	$valCodigo -> ajaxValidarCodigo();

}

/*=============================================
MOSTRAR GASTO POR ID TIPO GASTO
=============================================*/
if(isset($_POST["idTipoGasto"])){

	$editar = new AjaxGastoAdmin();
	$editar -> idTipoGasto = $_POST["idTipoGasto"];
	$editar -> ajaxMostrarGastoPorTipo();

}