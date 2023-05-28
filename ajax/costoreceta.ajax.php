<?php

require_once "../controladores/costoreceta.controlador.php";
require_once "../modelos/costoreceta.modelo.php";

class AjaxCostoReceta{

	/*=============================================
	EDITAR COSTO DE VENTA
	=============================================*/	

	public $idMesGasto;
	public $idTipoGasto;

	public function ajaxEditarCostoReceta(){

		$valor1 = $this->idMesGasto;
		$valor2 = $this->idTipoGasto;

		$respuesta = ControladorRecetaGastoAdminPorMes::ctrMostrarRecetaGastoAdminPorMes($valor1,$valor2);

		echo json_encode($respuesta);

	}

	public $idMesGasto2;

	public function ajaxMostrarTipoGasto2(){

		$valor = $this->idMesGasto2;

		$respuesta = ControladorRecetaGastoAdminPorMes::ctrMostrarTipoGastoPorMes($valor);

		echo json_encode($respuesta);

	}



}

/*=============================================
EDITAR COSTO DE VENTA
=============================================*/
if(isset($_POST["idMesGasto"])){

	$editar = new AjaxCostoReceta();
	$editar -> idMesGasto = $_POST["idMesGasto"];
	$editar -> idTipoGasto = $_POST["idTipoGasto"];
	$editar -> ajaxEditarCostoReceta();

}

/*=============================================
CONSULTA COSTO DE VENTA
=============================================*/
if(isset($_POST["idMesGasto2"])){

	$editar = new AjaxCostoReceta();
	$editar -> idMesGasto2 = $_POST["idMesGasto2"];
	$editar -> ajaxMostrarTipoGasto2();

}