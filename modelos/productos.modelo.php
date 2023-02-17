<?php

require_once "conexion.php";

class ModeloProductos{

	/*=============================================
	MOSTRAR PRODUCTO
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
	REGISTRO DE PRODUCTO
	=============================================*/

	static public function mdlIngresarProducto($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_producto(?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idProducto"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["codigo"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["idUnidadMedida"], PDO::PARAM_INT);
		$stmt->bindParam(6, $datos["idTipoProducto"], PDO::PARAM_INT);
		$stmt->bindParam(7, $datos["imagen"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR PRODUCTO
	=============================================*/

	static public function mdlEditarProducto($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_producto(?,?,?,?,?,?)");
		
		$stmt->bindParam(1, $datos["idProducto"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["idUnidadMedida"], PDO::PARAM_INT);
		$stmt->bindParam(5, $datos["idTipoProducto"], PDO::PARAM_INT);
		$stmt->bindParam(6, $datos["imagen"], PDO::PARAM_STR);
		

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	BORRAR PRODUCTO
	=============================================*/

	static public function mdlEliminarProducto($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_producto(?)");

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