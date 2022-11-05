<?php

require_once "conexion.php";

class ModeloTipoDocumento{

	/*=============================================
	MOSTRAR TIPO DE PRODUCTO
	=============================================*/

	static public function mdlMostrarTipoDocumento($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_tipodocumento");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		#$stmt -> close();


		$stmt = null;

	}

}

