<?php

require_once "conexion.php";

class ModeloPerfiles{

	/*=============================================
	MOSTRAR PERFILES
	=============================================*/

	static public function mdlMostrarPerfiles($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_perfiles");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		
		#$stmt -> close();

		$stmt = null;

	}

}
