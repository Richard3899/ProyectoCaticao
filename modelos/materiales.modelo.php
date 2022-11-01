<?php

require_once "conexion.php";

class ModeloMateriales{

	/*=============================================
	MOSTRAR MATERIALES
	=============================================*/

	static public function mdlMostrarMateriales($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item && idTipoMateria=2");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_materiales");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	REGISTRO DE MATERIALES
	=============================================*/

	static public function mdlIngresarMaterial($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_material(?,?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["codigo"], PDO::PARAM_STR);
		$stmt->bindParam(2, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["idUnidadMedida"], PDO::PARAM_INT);
		$stmt->bindParam(5, $datos["idMarca"], PDO::PARAM_INT);
		$stmt->bindParam(6, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(8, $datos["imagen"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR MATERIALES
	=============================================*/

	static public function mdlEditarMaterial($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_insumo(?,?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idMateria"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["idUnidadMedida"], PDO::PARAM_INT);
		$stmt->bindParam(5, $datos["idMarca"], PDO::PARAM_INT);
		$stmt->bindParam(6, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(8, $datos["imagen"], PDO::PARAM_STR);
		

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
	BORRAR MATERIALES
	=============================================*/

	static public function mdlEliminarMaterial($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_insumo(?)");

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




