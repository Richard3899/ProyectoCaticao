<?php

require_once "../controladores/productos.controlador.php";
require_once "../modelos/productos.modelo.php";

class AjaxProductos{

	/*=============================================
	EDITAR PRODUCTO
	=============================================*/	

	public $idProducto;

	public function ajaxEditarProducto(){

		$item = "idProducto";
		$valor = $this->idProducto;

		$respuesta = ControladorProductos::ctrMostrarProductos($item, $valor);

		echo json_encode($respuesta);

	}


	/*=============================================
	VALIDAR NO REPETIR PRODUCTO
	=============================================*/	

	public $validarCodigo;

	public function ajaxValidarCodigo(){

		$item = "codigo";
		$valor = $this->validarCodigo;

		$respuesta = ControladorProductos::ctrMostrarProductos($item, $valor);

		echo json_encode($respuesta);

	}
}

/*=============================================
EDITAR PRODUCTO
=============================================*/
if(isset($_POST["idProducto"])){

	$editar = new AjaxProductos();
	$editar -> idProducto = $_POST["idProducto"];
	$editar -> ajaxEditarProducto();

}

/*=============================================
VALIDAR NO REPETIR PRODUCTO
=============================================*/

if(isset( $_POST["validarCodigo"])){

	$valCodigo = new AjaxProductos();
	$valCodigo -> validarCodigo = $_POST["validarCodigo"];
	$valCodigo -> ajaxValidarCodigo();

}

