<?php

require_once "conexion.php";

class ModeloInventarioMaquinas{

	/*=============================================
	MOSTRAR MAQUINAS
	=============================================*/

	static public function mdlMostrarInventarioMaquinas($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_inventariomaquinas");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	INGRESO DE MAQUINAS
	=============================================*/

	static public function mdlIngresoMaquina($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_ingresomaquina(?,?,?,?)");

		$stmt->bindParam(1, $datos["idMaquina"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["observacion"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["fecha"], PDO::PARAM_STR);


		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}


		/*=============================================
	INGRESO DE MAQUINAS
	=============================================*/

	static public function mdlSalidaMaquina($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_salidamaquina(?,?,?,?)");

		$stmt->bindParam(1, $datos["idMaquina"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["observacion"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["fecha"], PDO::PARAM_STR);


		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}




}




