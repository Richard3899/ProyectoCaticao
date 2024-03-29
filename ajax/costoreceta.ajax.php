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

	// public $idReceta;

	// public function ajaxValidarMesOculto(){

	// 	$valor = $this->idReceta;

	// 	$respuesta = ControladorRecetaGastoAdminPorMes::ctrValidarMesOculto($valor);

	// 	echo json_encode($respuesta);

	// }

	public $idMesGasto3;

	public function ajaxValidarGastoNoAgregado(){

		$valor = $this->idMesGasto3;

		$respuesta = ControladorRecetaGastoAdminPorMes::ctrValidarGastoNoAgregado($valor);

		echo json_encode($respuesta);

	}

	public $idMesGasto4;

	public function ajaxMostrarRecetasDelMes(){

		$valor = $this->idMesGasto4;

		$respuesta = ControladorRecetaGastoAdminPorMes::ctrMostrarRecetasDelMes($valor);

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

	$consulta = new AjaxCostoReceta();
	$consulta -> idMesGasto2 = $_POST["idMesGasto2"];
	$consulta -> ajaxMostrarTipoGasto2();

}

/*=============================================
VALIDAR MES OCULTO
=============================================*/
// if(isset($_POST["idReceta"])){

// 	$validar = new AjaxCostoReceta();
// 	$validar -> idReceta = $_POST["idReceta"];
// 	$validar -> ajaxValidarMesOculto();

// }
 
/*=============================================
VALIDAR GASTO MES
=============================================*/
if(isset($_POST["idMesGasto3"])){

	$consulta = new AjaxCostoReceta();
	$consulta -> idMesGasto3 = $_POST["idMesGasto3"];
	$consulta -> ajaxValidarGastoNoAgregado();

}

if(isset($_POST["idMesGasto4"])){

	$consulta = new AjaxCostoReceta();
	$consulta -> idMesGasto4 = $_POST["idMesGasto4"];
	$consulta -> ajaxMostrarRecetasDelMes();

}