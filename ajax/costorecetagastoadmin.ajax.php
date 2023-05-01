<?php

require_once "../controladores/costorecetasgastoadmin.controlador.php";
require_once "../modelos/costorecetasgastoadmin.modelo.php";

class AjaxCostoRecetasGastoAdmin{ 

	/*=============================================
	EDITAR COSTO RECETA GASTO ADMIN
	=============================================*/	

	public $idCostoRecetasGastoAdmin;

	public function ajaxEditarCostoRecetasGastoAdmin(){

		$item = "idCostoRecetasGastoAdmin";
		$valor = $this->idCostoRecetasGastoAdmin;

		$respuesta = ControladorCostoRecetasGastoAdmin::ctrMostrarCostoRecetasGastoAdmin($item, $valor);

		echo json_encode($respuesta);

	}

	/*=============================================
	VALIDAR NO REPETIR GASTO
	=============================================*/	

	public $validarFecha;

	public function ajaxValidarFecha(){

		$item = "mes";
		$valor = $this->validarFecha;

		$respuesta = ControladorCostoRecetasGastoAdmin::ctrMostrarCostoRecetasGastoAdmin($item, $valor);

		echo json_encode($respuesta);

	}

}

/*=============================================
EDITAR GASTO ADMIN
=============================================*/
if(isset($_POST["idCostoRecetasGastoAdmin"])){

	$editar = new AjaxCostoRecetasGastoAdmin();
	$editar -> idCostoRecetasGastoAdmin = $_POST["idCostoRecetasGastoAdmin"];
	$editar -> ajaxEditarCostoRecetasGastoAdmin();

}


/*=============================================
VALIDAR NO REPETIR INSUMO
=============================================*/

if(isset($_POST["validarFecha"])){

	$valCodigo = new AjaxCostoRecetasGastoAdmin();
	$valCodigo -> validarFecha = ($_POST["validarFecha"]);
	$valCodigo -> ajaxValidarFecha();

}

