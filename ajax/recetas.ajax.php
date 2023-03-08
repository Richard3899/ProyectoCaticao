<?php

require_once "../controladores/recetas.controlador.php";
require_once "../modelos/recetas.modelo.php";
require_once "../controladores/lotes.controlador.php";
require_once "../modelos/lotes.modelo.php";

class AjaxRecetas{

	/*=============================================
	EDITAR RECETA
	=============================================*/	

	public $idReceta;

	public function ajaxEditarReceta(){

		$item = "idReceta";
		$valor = $this->idReceta;

        if($valor==NULL){
			$respuesta = ControladorRecetas::ctrMostrarRecetas(NULL, NULL);
		}else{
			$respuesta = ControladorRecetas::ctrMostrarRecetas($item, $valor);
		}

		echo json_encode($respuesta);

	}

	public $codigoLote;

	public function ajaxEditarReceta2(){

		$item = "codigoLote";
		$valor = $this->codigoLote;

		$respuesta = ControladorLotes::ctrMostrarLotes($item, $valor);

		echo json_encode($respuesta);

	}


	/*=============================================
	VALIDAR NO REPETIR RECETA
	=============================================*/	

	public $validarCodigo;

	public function ajaxValidarCodigo(){

		$item = "codigo";
		$valor = $this->validarCodigo;

		$respuesta = ControladorRecetas::ctrMostrarRecetas($item, $valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	VALIDAR NO REPETIR CODIGO LOTE
	=============================================*/	

	public $validarCodigoLote;

	public function ajaxValidarCodigoLote(){

		$item = "codigoLote";
		$valor = $this->validarCodigoLote;

		$respuesta = ControladorLotes::ctrMostrarLotes($item, $valor);

		echo json_encode($respuesta);

	}
}

/*=============================================
EDITAR RECETA
=============================================*/
if(isset($_POST["idReceta"])){

	$editar = new AjaxRecetas();
	$editar -> idReceta = $_POST["idReceta"];
	$editar -> ajaxEditarReceta();

}

if(isset($_POST["codigoLote"])){

	$editar = new AjaxRecetas();
	$editar -> codigoLote = $_POST["codigoLote"];
	$editar -> ajaxEditarReceta2();

}

/*=============================================
VALIDAR NO REPETIR RECETA
=============================================*/

if(isset( $_POST["validarCodigo"])){

	$valCodigo = new AjaxRecetas();
	$valCodigo -> validarCodigo = $_POST["validarCodigo"];
	$valCodigo -> ajaxValidarCodigo();

}

/*=============================================
VALIDAR NO REPETIR CODIGO LOTE
=============================================*/

if(isset( $_POST["validarCodigoLote"])){

	$valCodigoLote = new AjaxRecetas();
	$valCodigoLote -> validarCodigoLote = $_POST["validarCodigoLote"];
	$valCodigoLote -> ajaxValidarCodigoLote();

}


