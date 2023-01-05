<?php

require_once "conexion.php";

class ModeloRecetaCostoOperativo{


	/*=============================================
	MOSTRAR COSTO OPERATIVO DE LA RECETA
	=============================================*/

	static public function mdlMostrarRecetaCostoOperativo($item,$valor){
		
		if($item != "Receta"){ 

			$stmt = Conexion::conectar()->prepare("call mostrar_recetacostooperativo1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_recetacostooperativo2(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}


		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE COSTO OPERATIVO DE LA RECETA
	=============================================*/

	static public function mdlIngresarRecetaCostoOperativo($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_recetacostooperativo(?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idCostoOperativo"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["nombreCostoOperativo"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["total"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	EDITAR RECETA COSTO OPERATIVO
	=============================================*/

	static public function mdlEditarRecetaCostoOperativo($datos){

		$stmt = Conexion::conectar()->prepare("call editar_recetacostooperativo(?,?,?)");

		$stmt->bindParam(1, $datos["idRecetaCostoOperativo"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["total"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	ELIMINAR RECETA COSTO OPERATIVO
	=============================================*/

	static public function mdlEliminarRecetaCostoOperativo($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_recetacostooperativo(?)");

		$stmt->bindParam(1, $datos["idRecetaCostoOperativo"], PDO::PARAM_INT);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}


	/*=============================================
	SUMAR EL TOTAL DE RECETA COSTO OPERATIVO
	=============================================*/

	static public function mdlSumaTotalRecetaCostoOperativo($valor){

		$stmt = Conexion::conectar()->prepare("call sumatotal_recetacostooperativo(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	
}