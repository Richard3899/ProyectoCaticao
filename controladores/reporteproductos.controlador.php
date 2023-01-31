<?php

class ControladorReporteProductos{

	/*=============================================
	MOSTRAR REPORTE PRODUCTOS
	=============================================*/

	static public function ctrMostrarReporteProductos(){

		$respuesta = ModeloReporteProductos::mdlMostrarReporteProductos();

		return $respuesta;
	}

}





	