<?php

require_once "../controladores/costoreceta.controlador.php";
require_once "../modelos/costoreceta.modelo.php";

class AjaxCostoReceta{

	/*=============================================
	EDITAR COSTO DE VENTA
	=============================================*/	

	public $idMesGasto;

	public function ajaxEditarCostoReceta(){

		$valor = $this->idMesGasto;

		$respuesta = ControladorRecetaGastoAdminPorMes::ctrMostrarRecetaGastoAdminPorMes($valor);

		echo json_encode($respuesta);

	}

}

/*=============================================
EDITAR COSTO DE VENTA
=============================================*/
if(isset($_POST["idMesGasto"])){

	$editar = new AjaxCostoReceta();
	$editar -> idMesGasto = $_POST["idMesGasto"];
	$editar -> ajaxEditarCostoReceta();

}
