<?php

require_once "conexion.php";

class ModeloInventarioInsumos{

	/*=============================================
	MOSTRAR INSUMOS
	=============================================*/

	static public function mdlMostrarInventarioInsumos($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_inventarioinsumos");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	INGRESO DE INSUMOS
	=============================================*/

	static public function mdlIngresoInsumo($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_ingresoinsumo(?,?,?,?)");

		$stmt->bindParam(1, $datos["idMateria"], PDO::PARAM_INT);
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
	INGRESO DE INSUMOS
	=============================================*/

	static public function mdlSalidaInsumo($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_salidainsumo(?,?,?,?)");

		$stmt->bindParam(1, $datos["idMateria"], PDO::PARAM_INT);
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




