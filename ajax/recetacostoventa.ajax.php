<?php

require_once "../controladores/recetacostoventa.controlador.php";
require_once "../modelos/recetacostoventa.modelo.php";

class AjaxRecetaCostoVenta{

	/*=============================================
	EDITAR RECETA COSTO DE VENTA
	=============================================*/	

	public $idRecetaCostoVenta;
	public $idReceta;

	public function ajaxCostoVentaReceta(){

		$item="RecetaCostoVenta";

		$valor = $this->idRecetaCostoVenta;

		$respuesta = ControladorRecetaCostoVenta::ctrMostrarRecetaCostoVenta($item,$valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	MOSTRAR RECETA COSTO DE VENTAS
	=============================================*/
	public function ajaxReceta(){

		$item="Receta";

		$valor = $this->idReceta;

		$respuesta = ControladorRecetaCostoVenta::ctrMostrarRecetaCostoVenta($item,$valor);

		echo json_encode($respuesta);

	}

}


/*=============================================
EDITAR RECETA COSTO DE VENTA
=============================================*/
if(isset($_POST["idRecetaCostoVenta"])){

	$editar = new AjaxRecetaCostoVenta();
	$editar -> idRecetaCostoVenta = $_POST["idRecetaCostoVenta"];
	$editar -> ajaxCostoVentaReceta();

}

/*=============================================
MOSTRAR RECETA COSTO DE VENTAS
=============================================*/
if(isset($_POST["idReceta"])){

	$editar = new AjaxRecetaCostoVenta();
	$editar -> idReceta = $_POST["idReceta"];
	$editar -> ajaxReceta();

}

