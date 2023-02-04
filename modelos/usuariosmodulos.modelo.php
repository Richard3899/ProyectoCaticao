<?php

require_once "conexion.php";

class ModeloUsuariosModuloss{

	/*=============================================
	REGISTRO DE MARCA
	=============================================*/

	static public function mdlIngresarUsuariosModulos($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_usuariosmodulos(?)");

		$stmt->bindParam(1, $datos["idUsuario"], PDO::PARAM_STR);
		$stmt->bindParam(1, $datos["idModulo"], PDO::PARAM_STR);
		
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

	static public function mdlEditarUsuariosModulos($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_usuariosmodulos(?,?)");
		
		$stmt->bindParam(1, $datos["idUsuariosModulos"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["descripcion"], PDO::PARAM_STR);
	

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}


}