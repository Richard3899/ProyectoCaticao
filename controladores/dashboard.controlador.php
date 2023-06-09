<?php

class ControladorDashboard{


	/*=============================================
	MOSTRAR CANTIDAD DE RECETAS CON CADA ESTADO
	=============================================*/

	static public function ctrMostrarCantidadRecetasEstados(){

		$respuesta = ModeloDashboard::mdlMostrarCantidadRecetasEstados();

		return $respuesta;
	}

	/*=============================================
	MOSTRAR CANTIDAD DE RECETAS TERMINADOS POR MES
	=============================================*/

	static public function ctrMostrarRecetasTerminadasPorMes($valor){

		$respuesta = ModeloDashboard::mdlMostrarRecetasTerminadasPorMes($valor);

		return $respuesta;
	}

	/*=============================================
	MOSTRAR TOP PRODUCTOS CON STOCK
	=============================================*/

	static public function ctrMostrarItemsStock($valor){

		$respuesta = ModeloDashboard::mdlMostrarItemsStock($valor);

		return $respuesta;
	}


	/*=============================================
	MOSTRAR TOP PRODUCTOS CON STOCK
	=============================================*/

	static public function ctrMostrarItemsValorizado($valor){

		$respuesta = ModeloDashboard::mdlMostrarItemsValorizado($valor);

		return $respuesta;
	}

	/*============================================
	MOSTRAR PRODUCTOS PRODUCIDOS POR MES
	=============================================*/

	static public function ctrMostrarProductosProducidosPorMes($valor1,$valor2){

		$respuesta = ModeloDashboard::mdlMostrarProductosProducidosPorMes($valor1,$valor2);

		return $respuesta;
	}

	/*============================================
	MOSTRAR PRODUCTOS VALORIZADOS POR MES
	=============================================*/

	static public function ctrMostrarProductosValorizadosPorMes($valor1,$valor2){

		$respuesta = ModeloDashboard::mdlMostrarProductosValorizadosPorMes($valor1,$valor2);

		return $respuesta;
	}

	/*============================================
	MOSTRAR RECETAS POR FECHA Y COSTO
	=============================================*/

	static public function ctrMostrarRecetasPorFechaYCosto($valor){

		$respuesta = ModeloDashboard::mdlMostrarRecetasPorFechaYCosto($valor);

		return $respuesta;
	}

	/*============================================
	MOSTRAR GASTOS POR MES
	=============================================*/

	static public function ctrMostrarGastosPorMes($valor){

		$respuesta = ModeloDashboard::mdlMostrarGastosPorMes($valor);

		return $respuesta;
	}


}





	