<?php

require_once "conexion.php";

class ModeloLotes{

	/*=============================================
	MOSTRAR LOTES
	=============================================*/

	static public function mdlMostrarLotes($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_lotes");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	MOSTRAR LOTES POR ID PRODUCTO
	=============================================*/

	static public function mdlMostrarLotes2($valor){

		$stmt = Conexion::conectar()->prepare("call mostrar_lotes2(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}

}