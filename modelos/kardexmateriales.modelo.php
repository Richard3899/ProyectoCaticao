<?php

require_once "conexion.php";

class ModeloKardexMateriales{

	/*=============================================
	MOSTRAR MATERIALES
	=============================================*/

	static public function mdlMostrarKardexMateriales($valor){


			$stmt = Conexion::conectar()->prepare("call mostrar_kardexmateriales($valor)");

			$stmt -> execute();

			return $stmt -> fetchAll();


		#$stmt -> close();

		$stmt = null;

	}


}




