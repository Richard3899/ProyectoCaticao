<?php

require_once "conexion.php";

class ModeloTipoProducto{

	/*=============================================
	MOSTRAR TIPO DE PRODUCTO
	=============================================*/

	static public function mdlMostrarTipoProducto($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_tipoproducto");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		#$stmt -> close();


		$stmt = null;

	}

}

