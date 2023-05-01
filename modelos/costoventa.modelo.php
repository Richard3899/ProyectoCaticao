<?php

require_once "conexion.php";

class ModeloCostoVenta{

	/*=============================================
	MOSTRAR COSTO DE VENTA
	=============================================*/

	static public function mdlMostrarCostoVenta($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item && idTipoGasto=2");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_costoventa");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE COSTO DE VENTA
	=============================================*/

	static public function mdlIngresarCostoVenta($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_costoventa(?,?,?,?)");

		$stmt->bindParam(1, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(2, $datos["idUnidadMedida"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["idTipoCosto"], PDO::PARAM_INT);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR COSTO DE VENTA
	=============================================*/

	static public function mdlEditarCostoVenta($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_gastoadmin(?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idGastoAdmin"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["descripcion"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["idUnidadMedida"], PDO::PARAM_INT);
		$stmt->bindParam(4, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["idTipoCosto"], PDO::PARAM_INT);

		

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}
		

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	BORRAR COSTO DE VENTA
	=============================================*/

	static public function mdlEliminarCostoVenta($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_gastoadmin(?)");

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




