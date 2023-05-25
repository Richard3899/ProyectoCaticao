<?php

require_once "conexion.php";

class ModeloMesGasto{

	/*=============================================
	MOSTRAR MES GASTO
	=============================================*/

	static public function mdlMostrarMesGasto($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_mesgasto");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		#$stmt -> close();

		$stmt = null;

	}


	static public function mdlMostrarMesGasto2(){

		$stmt = Conexion::conectar()->prepare("call mostrar_mesgasto2");

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE MES GASTO
	=============================================*/

	static public function mdlIngresarMesGasto($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_mesgasto(?,?)");

		$stmt->bindParam(1, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(2, $datos["mes"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR MES GASTO
	=============================================*/

	static public function mdlEditarMesGasto($datos){

		$stmt = Conexion::conectar()->prepare("call editar_mesgasto(?,?)");

		$stmt->bindParam(1, $datos["idMesGasto"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["descripcion"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}


	/*=============================================
	BORRAR MES GASTO
	=============================================*/

	static public function mdlEliminarMesGasto($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_mesgasto(?)");

		$stmt -> bindParam(1, $datos, PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;


	}


	/*=============================================
	CERRAR ADICIONALES
	=============================================*/

	static public function mdlCerrarMes($datos){

		$stmt = Conexion::conectar()->prepare("call cerrar_mes(?)");

		$stmt->bindParam(1, $datos["idMesGasto"], PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;


	}
}




