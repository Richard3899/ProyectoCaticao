<?php

require_once "../controladores/lotes.controlador.php";
require_once "../modelos/lotes.modelo.php";

class AjaxLotes{

	/*=============================================
	EDITAR LOTE
	=============================================*/	

	public $idLote;

	public function ajaxEditarLote(){

		$item = "idLote";
		$valor = $this->idLote;

        if($valor==NULL){
			$respuesta = ControladorLotes::ctrMostrarLotes(NULL,NULL);
		}else{
			$respuesta = ControladorLotes::ctrMostrarLotes($item, $valor);
		}
		
		echo json_encode($respuesta);

	}

	/*=============================================
	EDITAR LOTE
	=============================================*/	

	public $idProducto;

	public function ajaxEditarLote2(){

		$valor = $this->idProducto;

		$respuesta = ControladorLotes::ctrMostrarLotes2($valor);
		
		echo json_encode($respuesta);

	}


	/*=============================================
	VALIDAR NO REPETIR LOTE
	=============================================*/	

	public $validarCodigo;

	public function ajaxValidarCodigo(){

		$item = "codigoLote";
		$valor = $this->validarCodigo;

		$respuesta = ControladorLotes::ctrMostrarLotes($item, $valor);

		echo json_encode($respuesta);

	}
}

/*=============================================
EDITAR LOTE
=============================================*/
if(isset($_POST["idLote"])){

	$editar = new AjaxLotes();
	$editar -> idLote = $_POST["idLote"];
	$editar -> ajaxEditarLote();

}

/*=============================================
EDITAR LOTE
=============================================*/
if(isset($_POST["idProducto"])){

	$editar = new AjaxLotes();
	$editar -> idProducto = $_POST["idProducto"];
	$editar -> ajaxEditarLote2();

}

/*=============================================
VALIDAR NO REPETIR LOTE
=============================================*/

if(isset( $_POST["validarCodigo"])){

	$valCodigo = new AjaxLotes();
	$valCodigo -> validarCodigo = $_POST["validarCodigo"];
	$valCodigo -> ajaxValidarCodigo();

}

