<?php

require_once "conexion.php";

class ModeloRecetaCostoVenta{


	/*=============================================
	MOSTRAR COSTO DE VENTA DE LA RECETA
	=============================================*/

	static public function mdlMostrarRecetaCostoVenta($item,$valor){
		
		if($item != "Receta"){ 

			$stmt = Conexion::conectar()->prepare("call mostrar_recetacostoventa1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_recetacostoventa2(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}


		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE COSTO DE VENTA DE LA RECETA
	=============================================*/

	static public function mdlIngresarRecetaCostoVenta($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_recetacostoventa(?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idCostoVenta"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["nombreCostoVenta"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["total"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	EDITAR RECETA COSTO DE VENTA
	=============================================*/

	static public function mdlEditarRecetaCostoVenta($datos){

		$stmt = Conexion::conectar()->prepare("call editar_recetacostoventa(?,?,?)");

		$stmt->bindParam(1, $datos["idRecetaCostoVenta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["total"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	ELIMINAR RECETA COSTO DE VENTA
	=============================================*/

	static public function mdlEliminarRecetaCostoVenta($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_recetacostoventa(?)");

		$stmt->bindParam(1, $datos["idRecetaCostoVenta"], PDO::PARAM_INT);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}


	/*=============================================
	SUMAR EL TOTAL DE RECETA COSTO DE VENTA
	=============================================*/

	static public function mdlSumaTotalRecetaCostoVenta($valor){

		$stmt = Conexion::conectar()->prepare("call sumatotal_recetacostoventa(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	
}