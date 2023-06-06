<?php

require_once "../controladores/dashboard.controlador.php";
require_once "../modelos/dashboard.modelo.php";

class AjaxDashboard{

	/*=============================================
	TRAER TOP PRODUCTOS
	=============================================*/	
	public $itemInventario;

	public function ajaxTopProductos(){

		$valor = $this->itemInventario;
		
		$respuesta = ControladorDashboard::ctrMostrarProductosTop($valor);

		echo json_encode($respuesta);

	}
 
	/*=============================================
	MOSTRAR CANTIDAD DE RECETAS CON CADA ESTADO
	=============================================*/	

	public function ajaxCantidadRecetasEstados(){

		$respuesta = ControladorDashboard::ctrMostrarCantidadRecetasEstados();

		echo json_encode($respuesta);

	}

	/*=============================================
	MOSTRAR CANTIDAD DE RECETAS TERMINADAS POR MES
	=============================================*/	
	public $Año;

	public function ajaxRecetasTerminadasPorMes(){

		$valor = $this->Año;
		
		$respuesta = ControladorDashboard::ctrMostrarRecetasTerminadasPorMes($valor);

		echo json_encode($respuesta);

	}

}

/*=============================================
TRAER TOP PRODUCTOS CON STOCK
=============================================*/
if(isset($_POST["topProductos"])){

	$editar = new AjaxDashboard();
	$editar -> itemInventario = $_POST["topProductos"];
	$editar -> ajaxTopProductos();

}

/*=============================================
MOSTRAR CANTIDAD DE RECETAS CON CADA ESTADO
=============================================*/
if(isset($_POST["cantidadRecetasEstados"])){

	$editar = new AjaxDashboard();
	$editar -> ajaxCantidadRecetasEstados();

}

/*=============================================
MOSTRAR CANTIDAD DE RECETAS TERMINADAS POR MES
=============================================*/
if(isset($_POST["año"])){

	$editar = new AjaxDashboard();
	$editar -> Año = $_POST["año"];
	$editar -> ajaxRecetasTerminadasPorMes();

}
