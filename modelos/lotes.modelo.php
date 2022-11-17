<?php

require_once "conexion.php";

class ModeloLotes{

	/*=============================================
	MOSTRAR LOTES
	=============================================*/

	static public function mdlMostrarLotes($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_lotes");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	REGISTRO DE LOTE
	
	=============================================*/

	static public function mdlIngresarLote($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_lote(?)");

		$stmt->bindParam(1, $datos["descripcion"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR LOTE
	=============================================*/

	static public function mdlEditarLote($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_lote(?,?)");
		
		$stmt->bindParam(1, $datos["idLote"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["descripcion"], PDO::PARAM_STR);
	

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	BORRAR LOTE
	=============================================*/

	static public function mdlEliminarLote($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_lote(?)");

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