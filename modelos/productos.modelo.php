<?php

require_once "conexion.php";

class ModeloProductos{

	/*=============================================
	MOSTRAR PRODUCTOS
	=============================================*/

	static public function mdlMostrarProductos($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_productos");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	REGISTRO DE PRODUCTOS
	=============================================*/

	static public function mdlIngresarProductos($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_productos(?,?,?,?,?)");

		var_dump($stmt);

		$stmt->bindParam(1, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(2, $datos["productos"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["password"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["perfil"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["foto"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR PRODUCTOS
	=============================================*/

	static public function mdlEditarProductos($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_productos(?,?,?,?,?)");
		
		$stmt -> bindParam(1, $datos["nombre"], PDO::PARAM_STR);
		$stmt -> bindParam(2, $datos["productos"], PDO::PARAM_STR);
		$stmt -> bindParam(3, $datos["password"], PDO::PARAM_STR);
		$stmt -> bindParam(4, $datos["perfil"], PDO::PARAM_STR);
		$stmt -> bindParam(5, $datos["foto"], PDO::PARAM_STR);
		

		var_dump($stmt);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}
		var_dump($stmt);

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	ACTUALIZAR PRODUCTOS
	=============================================*/

	static public function mdlActualizarProductos($tabla, $item1, $valor1, $item2, $valor2){

		$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET $item1 = :$item1 WHERE $item2 = :$item2");

		$stmt -> bindParam(":".$item1, $valor1, PDO::PARAM_STR);
		$stmt -> bindParam(":".$item2, $valor2, PDO::PARAM_STR);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	BORRAR PRODUCTOS
	=============================================*/

	static public function mdlBorrarProductos($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_productos(?)");

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