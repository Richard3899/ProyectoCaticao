<?php

class ControladorReporteMateriales{

	/*=============================================
	MOSTRAR REPORTE INSUMOS
	=============================================*/

	static public function ctrMostrarReporteMateriales(){

		$respuesta = ModeloReporteMateriales::mdlMostrarReporteMateriales();

		return $respuesta;
	}

}





	