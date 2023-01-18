<?php

require_once "../controladores/recetacostoventa.controlador.php";
require_once "../modelos/recetacostoventa.modelo.php";

class AjaxRecetaCostoVenta{

	/*=============================================
	EDITAR GASTO ADMIN POR MES
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
	MOSTRAR GASTO ADMIN POR MESS
	=============================================*/
	public function ajaxReceta(){

		$item="Receta";

		$valor = $this->idReceta;

		$respuesta = ControladorRecetaCostoVenta::ctrMostrarRecetaCostoVenta($item,$valor);

		echo json_encode($respuesta);

	}

}


/*=============================================
EDITAR GASTO ADMIN POR MES
=============================================*/
if(isset($_POST["idRecetaCostoVenta"])){

	$editar = new AjaxRecetaCostoVenta();
	$editar -> idRecetaCostoVenta = $_POST["idRecetaCostoVenta"];
	$editar -> ajaxCostoVentaReceta();

}

/*=============================================
MOSTRAR GASTO ADMIN POR MESS
=============================================*/
if(isset($_POST["idReceta"])){

	$editar = new AjaxRecetaCostoVenta();
	$editar -> idReceta = $_POST["idReceta"];
	$editar -> ajaxReceta();

}

