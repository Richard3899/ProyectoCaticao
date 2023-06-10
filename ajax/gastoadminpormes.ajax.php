<?php

require_once "../controladores/gastoadminpormes.controlador.php";
require_once "../modelos/gastoadminpormes.modelo.php";

class AjaxGastoAdminPorMes{

	/*=============================================
	EDITAR GASTO POR MES
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
	MOSTRAR GASTO POR MES
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

	public $idGastoAdminPorMes3;
	public $idMesGasto3;
	public $idReceta3;
	public $idGastoAdmin3;
	public $idTipoGasto3;

	public function ajaxMostrarGastoAdminPorMes(){

		$valor1 = $this->idGastoAdminPorMes3;
		$valor2 = $this->idMesGasto3;
		$valor3 = $this->idReceta3;
		$valor4 = $this->idGastoAdmin3;
		$valor5 = $this->idTipoGasto3;

		$respuesta = ControladorGastoAdminPorMes::ctrMostrarGastoAdminPorMes3($valor1,$valor2,$valor3,$valor4,$valor5);

		echo json_encode($respuesta);

	}

}


/*=============================================
EDITAR GASTO POR MES
=============================================*/
if(isset($_POST["idGastoAdminPorMes"])){

	$editar = new AjaxGastoAdminPorMes();
	$editar -> idGastoAdminPorMes = $_POST["idGastoAdminPorMes"];
	$editar -> ajaxEditarGastoAdminPorMes();

}

/*=============================================
MOSTRAR GASTO POR MES
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

/*=============================================
CONSULTA GASTO POR MES
=============================================*/
if(isset($_POST["idGastoAdminPorMes3"])){

	$editar = new AjaxGastoAdminPorMes();
	$editar -> idGastoAdminPorMes3 = $_POST["idGastoAdminPorMes3"];
	$editar -> idMesGasto3 = $_POST["idMesGasto3"];
	$editar -> idReceta3 = $_POST["idReceta3"];
	$editar -> idGastoAdmin3 = $_POST["idGastoAdmin3"];
	$editar -> idTipoGasto3 = $_POST["idTipoGasto3"];
	$editar -> ajaxMostrarGastoAdminPorMes();

}
