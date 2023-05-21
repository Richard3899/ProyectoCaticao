<?php

require_once "conexion.php";

class ModeloRecetaGastoAdminPorMes{


	/*=============================================
	MOSTRAR USUARIOS MODULOS
	=============================================*/

	static public function mdlMostrarRecetaGastoAdminPorMes($valor){

		$stmt = Conexion::conectar()->prepare("call mostrar_recetagastoadminpormes(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();
		
		#$stmt -> close();

		$stmt = null;

	}
	/*=============================================
	REGISTRO DE USUARIOS Y MODULOS
	=============================================*/

	static public function mdlIngresarRecetaGastoAdminPorMes($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_recetagastoadminpormes(?,?,?)");

		$stmt->bindParam(1, $datos["indice"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["idGastoAdminPorMes"], PDO::PARAM_INT);
		
		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	ELIMINAR USUARIOS Y MODULOS
	=============================================*/

	static public function mdlEliminarRecetaGastoAdminPorMes($datos){
	
		$stmt = Conexion::conectar()->prepare("call eliminar_recetagastoadminpormes(?)");
		
		$stmt->bindParam(1, $datos, PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}


}