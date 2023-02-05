<?php

require_once "conexion.php";

class ModeloUsuariosModulos{


	/*=============================================
	MOSTRAR USUARIOS MODULOS
	=============================================*/

	static public function mdlMostrarUsuariosModulos($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		#$stmt -> close();

		$stmt = null;

	}
	/*=============================================
	REGISTRO DE USUARIOS Y MODULOS
	=============================================*/

	static public function mdlIngresarUsuariosModulos($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_usuariosmodulos(?,?)");

		$stmt->bindParam(1, $datos["idUsuario"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idModulo"], PDO::PARAM_INT);
		
		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR USUARIOS Y MODULOS
	=============================================*/

	static public function mdlEditarUsuariosModulos($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_usuariosmodulos(?,?)");
		
		$stmt->bindParam(1, $datos["idUsuario"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idModulo"], PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}


}