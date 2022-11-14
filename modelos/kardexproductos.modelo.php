<?php

require_once "conexion.php";

class ModeloKardexProductos{

	/*=============================================
	MOSTRAR PRODUCTOS
	=============================================*/

	static public function mdlMostrarKardexProductos($tabla,$item,$valor){


		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}

		#$stmt -> close();

		$stmt = null;

	}

	static public function mdlMostrarKardexProductos2($valor){


			$stmt = Conexion::conectar()->prepare("call mostrar_kardexproductos($valor)");

			$stmt -> execute();

			return $stmt -> fetchAll();


		#$stmt -> close();

		$stmt = null;

	}


}




