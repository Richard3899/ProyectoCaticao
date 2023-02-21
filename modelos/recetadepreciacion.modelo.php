<?php

require_once "conexion.php";

class ModeloRecetaDepreciacion{


	/*=============================================
	MOSTRAR DEPRECIACIÓN DE LA RECETA
	=============================================*/

	static public function mdlMostrarRecetaDepreciacion($item,$valor){
		
		if($item != "Receta"){ 

			$stmt = Conexion::conectar()->prepare("call mostrar_recetadepreciacion1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_recetadepreciacion2(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}


		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE DEPRECIACIÓN DE LA RECETA
	=============================================*/

	static public function mdlIngresarRecetaDepreciacion($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_recetadepreciacion(?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idMaquina"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["nombreMaquina"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["tiempoHoras"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["precioUnitario"], PDO::PARAM_STR);
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
	EDITAR RECETA DEPRECIACIÓN
	=============================================*/

	static public function mdlEditarRecetaDepreciacion($datos){

		$stmt = Conexion::conectar()->prepare("call editar_recetadepreciacion(?,?,?,?)");

		$stmt->bindParam(1, $datos["idRecetaDepreciacion"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["tiempoHoras"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["total"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	ELIMINAR RECETA DEPRECIACIÓN
	=============================================*/

	static public function mdlEliminarRecetaDepreciacion($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_recetadepreciacion(?,?)");

		$stmt->bindParam(1, $datos["idRecetaDepreciacion"], PDO::PARAM_INT);
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
	SUMAR EL TOTAL DE RECETA DEPRECIACIÓN
	=============================================*/

	static public function mdlSumaTotalRecetaDepreciacion($valor){

		$stmt = Conexion::conectar()->prepare("call sumatotal_recetadepreciacion(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	
}