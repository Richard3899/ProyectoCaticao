<?php

require_once "conexion.php";

class ModeloCostoRecetasGastoAdmin{

	/*=============================================
	MOSTRAR COSTO DE RECETAS Y GASTO ADMINISTRATIVO
	=============================================*/

	static public function mdlMostrarCostoRecetasGastoAdmin(){

		$stmt = Conexion::conectar()->prepare("call mostrar_costorecetasgastoadmin");

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE COSTO DE RECETAS Y GASTO ADMINISTRATIVO
	=============================================*/

	static public function mdlIngresarCostoRecetasGastoAdmin($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_costorecetasgastoadmin(?,?)");

		$stmt->bindParam(1, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(2, $datos["mes"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}


	/*=============================================
	BORRAR COSTO DE RECETAS Y GASTO ADMINISTRATIVO
	=============================================*/

	static public function mdlEliminarCostoRecetasGastoAdmin($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_costorecetasgastoadmin(?)");

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




