<?php

require_once "conexion.php";

class ModeloKardexProductos{

	/*=============================================
	MOSTRAR PRODUCTOS
	=============================================*/

	static public function mdlMostrarKardexProductos($valor){

		$stmt = Conexion::conectar()->prepare("call mostrar_kardexproductos($valor)");

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}


}




