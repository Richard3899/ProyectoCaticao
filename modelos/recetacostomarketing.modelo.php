<?php

require_once "conexion.php";

class ModeloRecetaCostoMarketing{


	/*=============================================
	MOSTRAR COSTO DE MARKETING DE LA RECETA
	=============================================*/

	static public function mdlMostrarRecetaCostoMarketing($item,$valor){
		
		if($item != "Receta"){ 

			$stmt = Conexion::conectar()->prepare("call mostrar_recetacostomarketing1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_recetacostomarketing2(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}


		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE COSTO DE MARKETING DE LA RECETA
	=============================================*/

	static public function mdlIngresarRecetaCostoMarketing($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_recetacostomarketing(?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idCostoMarketing"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["nombreCostoMarketing"], PDO::PARAM_STR);
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
	EDITAR RECETA COSTO DE MARKETING
	=============================================*/

	static public function mdlEditarRecetaCostoMarketing($datos){

		$stmt = Conexion::conectar()->prepare("call editar_recetacostomarketing(?,?,?)");

		$stmt->bindParam(1, $datos["idRecetaCostoMarketing"], PDO::PARAM_INT);
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
	ELIMINAR RECETA COSTO DE MARKETING
	=============================================*/

	static public function mdlEliminarRecetaCostoMarketing($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_recetacostomarketing(?)");

		$stmt->bindParam(1, $datos["idRecetaCostoMarketing"], PDO::PARAM_INT);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}


	/*=============================================
	SUMAR EL TOTAL DE RECETA COSTO DE MARKETING
	=============================================*/

	static public function mdlSumaTotalRecetaCostoMarketing($valor){

		$stmt = Conexion::conectar()->prepare("call sumatotal_recetacostomarketing(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	
}