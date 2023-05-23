<?php

require_once "../controladores/gastoadminpormes.controlador.php";
require_once "../modelos/gastoadminpormes.modelo.php";

class AjaxGastoAdminPorMes{

	/*=============================================
	EDITAR GASTO ADMIN POR MES
	=============================================*/	

	public $idGastoAdminPorMes;
	public $idMesGasto;

	public function ajaxEditarGastoAdminPorMes(){

		$item="GastoAdminPorMes";

		$valor = $this->idGastoAdminPorMes;

		$respuesta = ControladorGastoAdminPorMes::ctrMostrarGastoAdminPorMes($item,$valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	MOSTRAR GASTO ADMIN POR MESS
	=============================================*/
	public function ajaxMesGasto(){

		$item="MesGasto";

		$valor = $this->idMesGasto;

		$respuesta = ControladorGastoAdminPorMes::ctrMostrarGastoAdminPorMes($item,$valor);

		echo json_encode($respuesta);

	}

	/*=============================================
	MOSTRAR GASTO POR ID TIPO GASTO
	=============================================*/	

	public $idTipoGasto;
	public $idMesGasto2;

	public function ajaxMostrarGastoPorTipo(){

		$valor1 = $this->idMesGasto2;
		$valor2 = $this->idTipoGasto;

		$respuesta = ControladorGastoAdminPorMes::ctrMostrarGastoAdminPorMesTG($valor1,$valor2);
		
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
if(isset($_POST["idMesGasto"])){

	$editar = new AjaxGastoAdminPorMes();
	$editar -> idMesGasto = $_POST["idMesGasto"];
	$editar -> ajaxMesGasto();
 
}

/*=============================================
MOSTRAR GASTO POR ID TIPO GASTO
=============================================*/
if(isset($_POST["idTipoGasto"])){

	$editar = new AjaxGastoAdminPorMes();
	$editar -> idTipoGasto = $_POST["idTipoGasto"];
	$editar -> idMesGasto2 = $_POST["idMesGasto2"];
	$editar -> ajaxMostrarGastoPorTipo();

}
