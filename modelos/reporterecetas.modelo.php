<?php

require_once "conexion.php";

class ModeloReporteRecetas{

	/*=============================================
	MOSTRAR REPORTE PRODUCTOS
	=============================================*/

	static public function mdlMostrarReporteRecetas(){

		$stmt = Conexion::conectar()->prepare("call mostrar_reporterecetas");

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}


}




