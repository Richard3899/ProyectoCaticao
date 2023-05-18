<?php

require_once "../controladores/gastoadminpormes.controlador.php";
require_once "../modelos/gastoadminpormes.modelo.php";

class AjaxGastoAdminPorMes{

	/*=============================================
	EDITAR GASTO ADMIN POR MES
	=============================================*/	

	public $idGastoAdminPorMes;
	public $idCostoRecetasGastoAdmin;

	public function ajaxEditarGastoAdminPorMes(){

		$item="GastoAdminPorMes";

		$valor = $this->idGastoAdminPorMes;

		$respuesta = ControladorGastoAdminPorMes::ctrMostrarGastoAdminPorMes($item,$valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	MOSTRAR GASTO ADMIN POR MESS
	=============================================*/
	public function ajaxCostoRecetasGastoAdmin(){

		$item="CostoRecetasGastoAdmin";

		$valor = $this->idCostoRecetasGastoAdmin;

		$respuesta = ControladorGastoAdminPorMes::ctrMostrarGastoAdminPorMes($item,$valor);

		echo json_encode($respuesta);

	}

	/*=============================================
	MOSTRAR GASTO POR ID TIPO GASTO
	=============================================*/	

	public $idTipoGasto;

	public function ajaxMostrarGastoPorTipo(){

		$valor = $this->idTipoGasto;

		$respuesta = ControladorGastoAdminPorMes::ctrMostrarGastoAdminPorMesTG($valor);
		
		echo json_encode($respuesta);

	}

}


/*=============================================
EDITAR GASTO ADMIN POR MES
=============================================*/
if(isset($_POST["idGastoAdminPorMes"])){

	$editar = new AjaxGastoAdminPorMes();
	$editar -> idGastoAdminPorMes = $_POST["idGastoAdminPorMes"];
	$editar -> ajaxEditarGastoAdminPorMes();

}

/*=============================================
MOSTRAR GASTO ADMIN POR MES
=============================================*/
if(isset($_POST["idCostoRecetasGastoAdmin"])){

	$editar = new AjaxGastoAdminPorMes();
	$editar -> idCostoRecetasGastoAdmin = $_POST["idCostoRecetasGastoAdmin"];
	$editar -> ajaxCostoRecetasGastoAdmin();

}

/*=============================================
MOSTRAR GASTO POR ID TIPO GASTO
=============================================*/
if(isset($_POST["idTipoGasto"])){

	$editar = new AjaxGastoAdminPorMes();
	$editar -> idTipoGasto = $_POST["idTipoGasto"];
	$editar -> ajaxMostrarGastoPorTipo();

}
