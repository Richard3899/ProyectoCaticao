<?php

require_once "conexion.php";

class ModeloDashboard{

	/*=============================================
	MOSTRAR CANTIDAD DE RECETAS CON CADA ESTADO
	=============================================*/

	static public function mdlMostrarCantidadRecetasEstados(){

		$stmt = Conexion::conectar()->prepare("call mostrar_cantidadrecetasestados");

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	MOSTRAR TOP PRODUCTOS CON STOCK
	=============================================*/

	static public function mdlMostrarItemsTop($valor){

		if($valor == 1){ 

			$stmt = Conexion::conectar()->prepare("call mostrar_productostop");
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();

		} elseif($valor == 2){

			$stmt = Conexion::conectar()->prepare("call mostrar_insumostop");
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_materialestop");
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}

		#$stmt -> close();

		$stmt = null;
	}


	/*=============================================
	MOSTRAR CANTIDAD DE RECETAS TERMINADAS POR MES
	=============================================*/

	static public function mdlMostrarRecetasTerminadasPorMes($valor){

		$stmt = Conexion::conectar()->prepare("call mostrar_RecetasTerminadasPorMes(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}



}