<?php

require_once "conexion.php";

class ModeloKardexInsumos{

	/*=============================================
	MOSTRAR INSUMOS
	=============================================*/

	static public function mdlMostrarKardexInsumos($valor){


			$stmt = Conexion::conectar()->prepare("call mostrar_kardexinsumos($valor)");

			$stmt -> execute();

			return $stmt -> fetchAll();


		#$stmt -> close();

		$stmt = null;

	}


}




