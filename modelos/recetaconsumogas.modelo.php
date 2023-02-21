<?php

require_once "conexion.php";

class ModeloRecetaConsumoGas{


	/*=============================================
	MOSTRAR CONSUMO DE GAS DE LA RECETA
	=============================================*/

	static public function mdlMostrarRecetaConsumoGas($item,$valor){
		
		if($item != "Receta"){ 

			$stmt = Conexion::conectar()->prepare("call mostrar_recetaconsumogas1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_recetaconsumogas2(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}


		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE CONSUMO DE GAS DE LA RECETA
	=============================================*/

	static public function mdlIngresarRecetaConsumoGas($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_recetaconsumogas(?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idMaquina"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["nombreMaquina"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["trabajoPorBatch"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["pesoBalonGas"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["tarifaGas"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	EDITAR RECETA CONSUMO DE GAS
	=============================================*/

	static public function mdlEditarRecetaConsumoGas($datos){

		$stmt = Conexion::conectar()->prepare("call editar_recetaconsumogas(?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idRecetaConsumoGas"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["trabajoPorBatch"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["pesoBalonGas"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["tarifaGas"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	ELIMINAR RECETA CONSUMO DE GAS
	=============================================*/

	static public function mdlEliminarRecetaConsumoGas($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_recetaconsumogas(?,?)");

		$stmt->bindParam(1, $datos["idRecetaConsumoGas"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idReceta"], PDO::PARAM_INT);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}


	/*=============================================
	SUMAR EL TOTAL DE RECETA CONSUMO DE GAS
	=============================================*/

	static public function mdlSumaTotalRecetaConsumoGas($valor){

		$stmt = Conexion::conectar()->prepare("call sumatotal_recetaconsumogas(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	
}