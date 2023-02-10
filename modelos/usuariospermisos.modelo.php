<?php

require_once "conexion.php";

class ModeloUsuariosPermisos{

	/*=============================================
	MOSTRAR USUARIOS Y PERMISOS
	=============================================*/

	static public function mdlMostrarUsuariosPermisos($valor){

		$stmt = Conexion::conectar()->prepare("call mostrar_usuariospermisos(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}
	/*=============================================
	REGISTRO DE USUARIOS Y PERMISOS
	=============================================*/

	static public function mdlIngresarUsuariosPermisos($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_usuariospermisos(?,?,?,?)");

		$stmt->bindParam(1, $datos["idUsuario"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["insertar"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["editar"], PDO::PARAM_INT);
		$stmt->bindParam(4, $datos["eliminar"], PDO::PARAM_INT);
		
		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR USUARIOS Y PERMISOS
	=============================================*/

	static public function mdlEditarUsuariosPermisos($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_usuariospermisos(?,?,?,?)");
		
		$stmt->bindParam(1, $datos["idUsuario"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["insertar"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["editar"], PDO::PARAM_INT);
		$stmt->bindParam(4, $datos["eliminar"], PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}
	/*=============================================
	ELIMINAR USUARIOS Y PERMISOS
	=============================================*/

	static public function mdlEliminarUsuariosPermisos($datos){
	
		$stmt = Conexion::conectar()->prepare("call eliminar_usuariospermisos(?)");
		
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