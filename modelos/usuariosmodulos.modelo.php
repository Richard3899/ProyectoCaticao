<?php

require_once "conexion.php";

class ModeloUsuariosModulos{


	/*=============================================
	MOSTRAR USUARIOS MODULOS
	=============================================*/

	static public function mdlMostrarUsuariosModulos($valor){


		$stmt = Conexion::conectar()->prepare("call mostrar_usuariosmodulos(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();

		
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
	ELIMINAR USUARIOS Y MODULOS
	=============================================*/

	static public function mdlEliminarUsuariosModulos($datos){
	
		$stmt = Conexion::conectar()->prepare("call eliminar_usuariosmodulos(?)");
		
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