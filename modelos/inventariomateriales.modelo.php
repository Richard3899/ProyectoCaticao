<?php

require_once "conexion.php";

class ModeloInventarioMateriales{

	/*=============================================
	MOSTRAR MATERIALES
	=============================================*/

	static public function mdlMostrarInventarioMateriales($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_inventariomateriales");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	INGRESO DE MATERIALES
	=============================================*/

	static public function mdlIngresoMaterial($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_ingresomaterial(?,?,?,?)");

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
	INGRESO DE MATERIALES
	=============================================*/

	static public function mdlSalidaMaterial($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_salidamaterial(?,?,?,?)");

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




