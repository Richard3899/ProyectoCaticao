<?php

require_once "conexion.php";

class ModeloReporteInsumos{

	/*=============================================
	MOSTRAR REPORTE INSUMOS
	=============================================*/

	static public function mdlMostrarReporteInsumos(){

		$stmt = Conexion::conectar()->prepare("call mostrar_reporteinsumos");

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}


}




