<?php

require_once "conexion.php";

class ModeloCostoMarketing{

	/*=============================================
	MOSTRAR COSTOS DE MARKETING
	=============================================*/

	static public function mdlMostrarCostoMarketing($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item && idTipoGasto=3");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_costomarketing");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE COSTOS DE MARKETING
	=============================================*/

	static public function mdlIngresarCostoMarketing($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_costomarketing(?,?,?,?)");

		$stmt->bindParam(1, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(2, $datos["idUnidadMedida"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["idTipoCosto"], PDO::PARAM_INT);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR COSTOS DE MARKETING
	=============================================*/

	static public function mdlEditarCostoMarketing($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_gastoadmin(?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idGastoAdmin"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["idUnidadMedida"], PDO::PARAM_INT);
		$stmt->bindParam(4, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["idTipoCosto"], PDO::PARAM_INT);

		

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}
		

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	BORRAR COSTOS DE MARKETING
	=============================================*/

	static public function mdlEliminarCostoMarketing($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_gastoadmin(?)");

		$stmt -> bindParam(1, $datos, PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;


	}

}




