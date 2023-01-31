<?php

require_once "conexion.php";

class ModeloReporteMateriales{

	/*=============================================
	MOSTRAR REPORTE MATERIALES
	=============================================*/

	static public function mdlMostrarReporteMateriales(){

		$stmt = Conexion::conectar()->prepare("call mostrar_reportemateriales");

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}


}




