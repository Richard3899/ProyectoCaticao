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

	/*=============================================
	MOSTRAR TOP ITMES CON STOCK
	=============================================*/

	static public function mdlMostrarItemsStock($valor){

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
	MOSTRAR TOP ITEMS VALORIZADO
	=============================================*/

	static public function mdlMostrarItemsValorizado($valor){

		$stmt = Conexion::conectar()->prepare("call mostrar_topitemsvalorizado(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	MOSTRAR PRODUCTOS PRODUCIDOS POR MES
	=============================================*/

	static public function mdlMostrarProductosProducidosPorMes($valor){

		$stmt = Conexion::conectar()->prepare("call mostrar_ProductosProducidosPorMes(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	MOSTRAR PRODUCTOS VALORIZADOS POR MES
	=============================================*/

	static public function mdlMostrarProductosValorizadosPorMes($valor){

		$stmt = Conexion::conectar()->prepare("call mostrar_ProductosValorizadosPorMes(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	MOSTRAR RECETAS POR FECHA Y COSTO
	=============================================*/

	static public function mdlMostrarRecetasPorFechaYCosto($valor){

		$stmt = Conexion::conectar()->prepare("call mostrar_RecetasPorFechaYCosto(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_STR);

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	MOSTRAR RECETAS GASTOS POR MES
	=============================================*/

	static public function mdlMostrarGastosPorMes($valor){

		$stmt = Conexion::conectar()->prepare("call mostrar_GastosPorMes(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}

}