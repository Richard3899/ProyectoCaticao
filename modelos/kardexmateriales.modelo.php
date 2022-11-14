<?php

require_once "conexion.php";

class ModeloKardexMateriales{

	/*=============================================
	MOSTRAR MATERIALES
	=============================================*/

	static public function mdlMostrarKardexMateriales($tabla,$item,$valor){


		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}

		#$stmt -> close();

		$stmt = null;

	}

	static public function mdlMostrarKardexMateriales2($valor){


			$stmt = Conexion::conectar()->prepare("call mostrar_kardexmateriales($valor)");

			$stmt -> execute();

			return $stmt -> fetchAll();


		#$stmt -> close();

		$stmt = null;

	}


}




