<?php

class ControladorCostoTotalPorMes{

	/*=============================================
	SUMAR TOTAL DE RECETA COSTO DE VENTA
	=============================================*/
	static public function ctrSumaTotalCostoTotalPorMes($valor){

		$respuesta = ModeloCostoTotalPorMes::mdlSumaTotalCostoTotalPorMes($valor);

		return $respuesta;
	}








}