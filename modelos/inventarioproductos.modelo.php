<?php

require_once "conexion.php";

class ModeloInventarioProductos{

	/*=============================================
	MOSTRAR PRODUCTOS
	=============================================*/

	static public function mdlMostrarInventarioProductos($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_inventarioproductos");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	INGRESO DE PRODUCTOS
	=============================================*/

	static public function mdlIngresoProducto($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_ingresoproducto(?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idProducto"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["codigoLote"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["fechaVencimiento"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["fecha"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["observacion"], PDO::PARAM_STR);



		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}


	/*=============================================
	SALIDA DE PRODUCTOS
	=============================================*/

	static public function mdlSalidaProducto($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_salidaproducto(?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idProducto"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["observacion"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["codigoLote"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["fecha"], PDO::PARAM_STR);


		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}




}




