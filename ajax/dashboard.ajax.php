<?php

require_once "../controladores/dashboard.controlador.php";
require_once "../modelos/dashboard.modelo.php";

class AjaxDashboard{

	/*=============================================
	TRAER TOP PRODUCTOS
	=============================================*/	

	public function ajaxTopProductos(){

		$respuesta = ControladorDashboard::ctrMostrarProductosTop();

		echo json_encode($respuesta);

	}

	/*=============================================
	MOSTRAR CANTIDAD DE RECETAS CON CADA ESTADO
	=============================================*/	

	public function ajaxCantidadRecetasEstados(){

		$respuesta = ControladorDashboard::ctrMostrarCantidadRecetasEstados();

		echo json_encode($respuesta);

	}

}

/*=============================================
TRAER TOP PRODUCTOS CON STOCK
=============================================*/
if(isset($_POST["topProductos"])){

	$editar = new AjaxDashboard();
	$editar -> ajaxTopProductos();

}

/*=============================================
MOSTRAR CANTIDAD DE RECETAS CON CADA ESTADO
=============================================*/
if(isset($_POST["cantidadRecetasEstados"])){

	$editar = new AjaxDashboard();
	$editar -> ajaxCantidadRecetasEstados();

}
