<?php

require_once "conexion.php";

class ModeloInsumos{

	/*=============================================
	MOSTRAR INSUMOS
	=============================================*/

	static public function mdlMostrarInsumos($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item && idTipoMateria=1");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_insumos");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE INSUMOS
	=============================================*/

	static public function mdlIngresarInsumo($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_insumo(?,?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["codigo"], PDO::PARAM_STR);
		$stmt->bindParam(2, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["idUnidadMedida"], PDO::PARAM_INT);
		$stmt->bindParam(5, $datos["idMarca"], PDO::PARAM_INT);
		$stmt->bindParam(6, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(8, $datos["imagen"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR INSUMOS
	=============================================*/

	static public function mdlEditarInsumo($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_insumo(?,?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idMateria"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["idUnidadMedida"], PDO::PARAM_INT);
		$stmt->bindParam(5, $datos["idMarca"], PDO::PARAM_INT);
		$stmt->bindParam(6, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(8, $datos["imagen"], PDO::PARAM_STR);
		

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}
		

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	BORRAR INSUMOS
	=============================================*/

	static public function mdlEliminarInsumo($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_insumo(?)");

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




