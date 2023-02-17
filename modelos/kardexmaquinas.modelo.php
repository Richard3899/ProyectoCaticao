<?php

require_once "conexion.php";

class ModeloKardexMaquinas{

	/*=============================================
	MOSTRAR MAQUINAS
	=============================================*/

	static public function mdlMostrarKardexMaquinas($valor){


			$stmt = Conexion::conectar()->prepare("call mostrar_kardexmaquinas($valor)");

			$stmt -> execute();

			return $stmt -> fetchAll();


		#$stmt -> close();

		$stmt = null;

	}


}




