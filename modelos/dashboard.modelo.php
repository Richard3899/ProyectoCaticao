<?php

require_once "conexion.php";

class ModeloDashboard{

	/*=============================================
	MOSTRAR TOP PRODUCTOS CON STOCK
	=============================================*/

	static public function mdlMostrarProductosTop(){

		$stmt = Conexion::conectar()->prepare("call mostrar_productostop");

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}

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



}