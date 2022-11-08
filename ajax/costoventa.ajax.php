<?php

require_once "../controladores/costoventa.controlador.php";
require_once "../modelos/costoventa.modelo.php";

class AjaxCostoVenta{

	/*=============================================
	EDITAR COSTO DE VENTA
	=============================================*/	

	public $idCostoVenta;

	public function ajaxEditarCostoVenta(){

		$item = "idGastoAdmin";
		$valor = $this->idCostoVenta;

		$respuesta = ControladorCostoVenta::ctrMostrarCostoVenta($item, $valor);

		echo json_encode($respuesta);

	}

}

/*=============================================
EDITAR COSTO DE VENTA
=============================================*/
if(isset($_POST["idCostoVenta"])){

	$editar = new AjaxCostoVenta();
	$editar -> idCostoVenta = $_POST["idCostoVenta"];
	$editar -> ajaxEditarCostoVenta();

}
