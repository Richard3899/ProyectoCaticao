<?php

require_once "conexion.php";

class ModeloCostoTotalPorMes{

	/*=============================================
	SUMAR EL COSTO TOTAL POR MES
	=============================================*/

	static public function mdlSumaTotalCostoTotalPorMes($valor){

		$stmt = Conexion::conectar()->prepare("call sumatotal_costototalpormes(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_STR);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	
}