<?php

class ControladorDashboard{

	/*=============================================
	MOSTRAR TOP PRODUCTOS CON STOCK
	=============================================*/

	static public function ctrMostrarProductosTop($valor){

		$respuesta = ModeloDashboard::mdlMostrarItemsTop($valor);

		return $respuesta;
	}

	/*=============================================
	MOSTRAR CANTIDAD DE RECETAS CON CADA ESTADO
	=============================================*/

	static public function ctrMostrarCantidadRecetasEstados(){

		$respuesta = ModeloDashboard::mdlMostrarCantidadRecetasEstados();

		return $respuesta;
	}

}





	