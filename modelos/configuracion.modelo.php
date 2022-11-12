<?php

require_once "conexion.php";

class ModeloConfiguracion{

	/*=============================================
	MOSTRAR CONFIGURACION
	=============================================*/

	static public function mdlMostrarConfiguracion($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_configuracion");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	ACTIVAR MODO DARK
	=============================================*/

	static public function mdlActivarModoDark($tabla, $item1, $valor1, $item2, $valor2){

		$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET $item1 = :$item1 WHERE $item2 = :$item2");

		$stmt -> bindParam(":".$item1, $valor1, PDO::PARAM_STR);
		$stmt -> bindParam(":".$item2, $valor2, PDO::PARAM_STR);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}


}