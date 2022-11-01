<?php

require_once "conexion.php";

class ModeloUsuarios{

	/*=============================================
	MOSTRAR USUARIOS
	=============================================*/

	static public function mdlMostrarUsuarios($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_usuarios");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	REGISTRO DE USUARIO
	=============================================*/

	static public function mdlIngresarUsuario($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_usuario(?,?,?,?,?)");

		$stmt->bindParam(1, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(2, $datos["usuario"], PDO::PARAM_STR);
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
	EDITAR USUARIO
	=============================================*/

	static public function mdlEditarUsuario($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_usuario(?,?,?,?,?)");
		
		$stmt -> bindParam(1, $datos["nombre"], PDO::PARAM_STR);
		$stmt -> bindParam(2, $datos["usuario"], PDO::PARAM_STR);
		$stmt -> bindParam(3, $datos["password"], PDO::PARAM_STR);
		$stmt -> bindParam(4, $datos["perfil"], PDO::PARAM_STR);
		$stmt -> bindParam(5, $datos["foto"], PDO::PARAM_STR);
		
		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	ACTUALIZAR USUARIO
	=============================================*/

	static public function mdlActualizarUsuario($tabla, $item1, $valor1, $item2, $valor2){

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
	BORRAR USUARIO
	=============================================*/

	static public function mdlBorrarUsuario($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_usuario(?)");

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