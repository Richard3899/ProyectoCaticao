<?php

require_once "conexion.php";

class ModeloGastoAdmin{

	/*=============================================
	MOSTRAR GASTO ADMIN
	=============================================*/

	static public function mdlMostrarGastoAdmin($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item && idDesembolso=1");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_gastoadmin");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE GASTO ADMIN
	=============================================*/

	static public function mdlIngresarGastoAdmin($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_gastoadmin(?,?,?,?)");

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
	EDITAR GASTO ADMIN
	=============================================*/

	static public function mdlEditarGastoAdmin($datos){
	
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
	BORRAR GASTO ADMIN
	=============================================*/

	static public function mdlEliminarGastoAdmin($datos){

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




