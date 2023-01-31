<?php

require_once "conexion.php";

class ModeloReporteProductos{

	/*=============================================
	MOSTRAR REPORTE PRODUCTOS
	=============================================*/

	static public function mdlMostrarReporteProductos(){

		$stmt = Conexion::conectar()->prepare("call mostrar_reporteproductos");

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}


}




