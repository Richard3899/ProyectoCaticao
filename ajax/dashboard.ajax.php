<?php

require_once "../controladores/dashboard.controlador.php";
require_once "../modelos/dashboard.modelo.php";

class AjaxDashboard{

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

	/*=============================================
	TRAER TOP ITEMS STOCK
	=============================================*/	
	public $itemInventario;

	public function ajaxTopItemsStock(){

		$valor = $this->itemInventario;
		
		$respuesta = ControladorDashboard::ctrMostrarItemsStock($valor);

		echo json_encode($respuesta);

	}

	/*=============================================
	TRAER TOP ITEMS VALORIZADO
	=============================================*/	
	public $itemInventarioValorizado;

	public function ajaxTopItemsValorizado(){

		$valor = $this->itemInventarioValorizado;
		
		$respuesta = ControladorDashboard::ctrMostrarItemsValorizado($valor);

		echo json_encode($respuesta);

	}


	/*=============================================
	MOSTRAR PRODUCTOS PRODUCIDOS POR MES
	=============================================*/	
	public $Año3;

	public function ajaxProductosProducidosPorMes(){

		$valor = $this->Año3;
		
		$respuesta = ControladorDashboard::ctrMostrarProductosProducidosPorMes($valor);

		echo json_encode($respuesta);

	}

	/*=============================================
	MOSTRAR PRODUCTOS VALORIZADOS POR MES
	=============================================*/	
	public $Año4;

	public function ajaxProductosValorizadosPorMes(){

		$valor = $this->Año4;
		
		$respuesta = ControladorDashboard::ctrMostrarProductosValorizadosPorMes($valor);

		echo json_encode($respuesta);

	}

	/*=============================================
	MOSTRAR RECETAS POR FECHA Y COSTO
	=============================================*/	
	public $mes;

	public function ajaxRecetasPorFechaYCosto(){

		$valor = $this->mes;
		
		$respuesta = ControladorDashboard::ctrMostrarRecetasPorFechaYCosto($valor);

		echo json_encode($respuesta);

	}

	/*=============================================
	MOSTRAR GASTOS POR MES
	=============================================*/	
	public $Año6;

	public function ajaxGastosPorMes(){

		$valor = $this->Año6;
		
		$respuesta = ControladorDashboard::ctrMostrarGastosPorMes($valor);

		echo json_encode($respuesta);

	}

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
if(isset($_POST["años"])){

	$editar = new AjaxDashboard();
	$editar -> Año = $_POST["años"];
	$editar -> ajaxRecetasTerminadasPorMes();

}

/*=============================================
TRAER TOP ITEMS CON STOCK
=============================================*/
if(isset($_POST["topItemsStock"])){

	$editar = new AjaxDashboard();
	$editar -> itemInventario = $_POST["topItemsStock"];
	$editar -> ajaxTopItemsStock();

}

/*=============================================
TRAER TOP ITEMS VALORIZADO
=============================================*/
if(isset($_POST["topItemsValorizado"])){

	$editar = new AjaxDashboard();
	$editar -> itemInventarioValorizado = $_POST["topItemsValorizado"];
	$editar -> ajaxTopItemsValorizado();

}

/*=============================================
MOSTRAR PRODUCTOS PRODUCIDOS POR MES
=============================================*/
if(isset($_POST["años3"])){

	$editar = new AjaxDashboard();
	$editar -> Año3 = $_POST["años3"];
	$editar -> ajaxProductosProducidosPorMes();

}

/*=============================================
MOSTRAR PRODUCTOS VALORIZADOS POR MES
=============================================*/
if(isset($_POST["años4"])){

	$editar = new AjaxDashboard();
	$editar -> Año4 = $_POST["años4"];
	$editar -> ajaxProductosValorizadosPorMes();

}

/*=============================================
MOSTRAR RECETAS POR FECHA Y COSTO
=============================================*/
if(isset($_POST["mes"])){

	$editar = new AjaxDashboard();
	$editar -> mes = $_POST["mes"];
	$editar -> ajaxRecetasPorFechaYcosto();

}

/*=============================================
MOSTRAR GASTOS POR MES
=============================================*/
if(isset($_POST["años6"])){

	$editar = new AjaxDashboard();
	$editar -> Año6 = $_POST["años6"];
	$editar -> ajaxGastosPorMes();

}
