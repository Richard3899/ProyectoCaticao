<?php

require_once "conexion.php";

class ModeloMarcas{

	/*=============================================
	MOSTRAR MARCAS
	=============================================*/

	static public function mdlMostrarMarcas($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_marcas");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	REGISTRO DE MARCA
	
	=============================================*/

	static public function mdlIngresarMarca($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_marca(?)");

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
	EDITAR MARCA
	=============================================*/

	static public function mdlEditarMarca($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_producto(?,?)");
		
		$stmt->bindParam(1, $datos["idMarca"], PDO::PARAM_INT);
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
	BORRAR MARCA
	=============================================*/

	static public function mdlEliminarMarca($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_marca(?)");

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