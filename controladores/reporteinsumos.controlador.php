<?php

class ControladorReporteInsumos{

	/*=============================================
	MOSTRAR REPORTE INSUMOS
	=============================================*/

	static public function ctrMostrarReporteInsumos(){

		$respuesta = ModeloReporteInsumos::mdlMostrarReporteInsumos();

		return $respuesta;
	}

}





	