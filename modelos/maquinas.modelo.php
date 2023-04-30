<?php

require_once "conexion.php";

class ModeloMaquinas{

	/*=============================================
	MOSTRAR MAQUINA
	=============================================*/

	static public function mdlMostrarMaquinas($tabla, $item, $valor){
        
		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_maquinas");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	MOSTRAR MAQUINAS CON DEPRECIACIÓN
	=============================================*/

	static public function mdlMostrarMaquinasConDepreciacion(){

		$stmt = Conexion::conectar()->prepare("call mostrar_maquinascondepreciacion");

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	REGISTRO DE MAQUINA
	=============================================*/

	static public function mdlIngresarMaquina($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_maquina(?,?,?,?,?,?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idMaquina"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["codigo"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["serie"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["modelo"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["marca"], PDO::PARAM_STR);
		$stmt->bindParam(8, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(9, $datos["añoCompra"], PDO::PARAM_INT);
		$stmt->bindParam(10, $datos["capacidad"], PDO::PARAM_STR);
		$stmt->bindParam(11, $datos["potenciaHP"], PDO::PARAM_STR);
		$stmt->bindParam(12, $datos["vidaUtil"], PDO::PARAM_INT);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR MAQUINA
	=============================================*/

	static public function mdlEditarMaquina($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_maquina(?,?,?,?,?,?,?,?,?,?,?)");
		
		$stmt->bindParam(1, $datos["idMaquina"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["serie"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["modelo"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["marca"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(8, $datos["añoCompra"], PDO::PARAM_INT);
		$stmt->bindParam(9, $datos["capacidad"], PDO::PARAM_STR);
		$stmt->bindParam(10, $datos["potenciaHP"], PDO::PARAM_STR);
		$stmt->bindParam(11, $datos["vidaUtil"], PDO::PARAM_INT);
		

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	BORRAR MAQUINA
	=============================================*/

	static public function mdlEliminarMaquina($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_maquina(?)");

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