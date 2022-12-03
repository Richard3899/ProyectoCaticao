<?php

require_once "../controladores/insumos.controlador.php";
require_once "../modelos/insumos.modelo.php";

class AjaxInsumos{

	/*=============================================
	EDITAR INSUMO
	=============================================*/	

	public $idInsumo;
	public $traerInsumos;

	public function ajaxEditarInsumo(){

		if($this->traerInsumos == "ok"){

			$item = null;
			$valor = null;
	
			$respuesta = ControladorInsumos::ctrMostrarInsumos($item, $valor);
	
			echo json_encode($respuesta);

		}
			else{

			$item = "idMateria";
			$valor = $this->idInsumo;
	
			$respuesta = ControladorInsumos::ctrMostrarInsumos($item, $valor);
	
			echo json_encode($respuesta);
		}

	}


	/*=============================================
	VALIDAR NO REPETIR INSUMO
	=============================================*/	

	public $validarCodigo;

	public function ajaxValidarCodigo(){

		$item = "codigo";
		$valor = $this->validarCodigo;

		$respuesta = ControladorInsumos::ctrMostrarInsumos($item, $valor);

		echo json_encode($respuesta);

	}
}

/*=============================================
EDITAR INSUMO
=============================================*/
if(isset($_POST["idInsumo"])){

	$editar = new AjaxInsumos();
	$editar -> idInsumo = $_POST["idInsumo"];
	$editar -> ajaxEditarInsumo();

}

/*=============================================
VALIDAR NO REPETIR INSUMO
=============================================*/

if(isset( $_POST["validarCodigo"])){

	$valCodigo = new AjaxInsumos();
	$valCodigo -> validarCodigo = $_POST["validarCodigo"];
	$valCodigo -> ajaxValidarCodigo();

}

/*=============================================
TRAER INSUMO
=============================================*/

if(isset( $_POST["traerInsumos"])){

	$traerInsumos = new AjaxInsumos();
	$traerInsumos -> traerInsumos = $_POST["traerInsumos"];
	$traerInsumos -> ajaxEditarInsumo();

}