<?php

require_once "conexion.php";

class ModeloKardexInsumos{

	/*=============================================
	MOSTRAR INSUMOS
	=============================================*/

	static public function mdlMostrarKardexInsumos($tabla,$item,$valor){


		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}

		#$stmt -> close();

		$stmt = null;

	}

	static public function mdlMostrarKardexInsumos2($valor){


			$stmt = Conexion::conectar()->prepare("call mostrar_kardexinsumos($valor)");

			$stmt -> execute();

			return $stmt -> fetchAll();


		#$stmt -> close();

		$stmt = null;

	}


}




