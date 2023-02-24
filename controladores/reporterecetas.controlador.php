<?php

class ControladorReporteRecetas{

	/*=============================================
	MOSTRAR REPORTE PRODUCTOS
	=============================================*/

	static public function ctrMostrarReporteRecetas(){

		$respuesta = ModeloReporteRecetas::mdlMostrarReporteRecetas();

		return $respuesta;
	}

}





	