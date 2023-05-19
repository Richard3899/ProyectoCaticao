<?php

require_once "../controladores/mesgasto.controlador.php";
require_once "../modelos/mesgasto.modelo.php";

class AjaxMesGasto{ 

	/*=============================================
	EDITAR MES GASTO
	=============================================*/	

	public $idMesGasto;

	public function ajaxEditarMesGasto(){

		$item = "idMesGasto";
		$valor = $this->idMesGasto;

		$respuesta = ControladorMesGasto::ctrMostrarMesGasto($item, $valor);

		echo json_encode($respuesta);

	}

	/*=============================================
	VALIDAR NO REPETIR GASTO
	=============================================*/	

	public $validarFecha;

	public function ajaxValidarFecha(){

		$item = "mes";
		$valor = $this->validarFecha;

		$respuesta = ControladorMesGasto::ctrMostrarMesGasto($item, $valor);

		echo json_encode($respuesta);

	}

}

/*=============================================
EDITAR MES GASTO
=============================================*/
if(isset($_POST["idMesGasto"])){

	$editar = new AjaxMesGasto();
	$editar -> idMesGasto = $_POST["idMesGasto"];
	$editar -> ajaxEditarMesGasto();

}


/*=============================================
VALIDAR NO REPETIR INSUMO
=============================================*/

if(isset($_POST["validarFecha"])){

	$valCodigo = new AjaxMesGasto();
	$valCodigo -> validarFecha = ($_POST["validarFecha"]);
	$valCodigo -> ajaxValidarFecha();

}

