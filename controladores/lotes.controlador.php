<?php

class ControladorLotes{

	/*=============================================
	MOSTRAR LOTES
	=============================================*/

	static public function ctrMostrarLotes($item, $valor){

		$tabla = "lote";

		$respuesta = ModeloLotes::MdlMostrarLotes($tabla, $item, $valor);

		return $respuesta;
	}

	/*=============================================
	MOSTRAR LOTES POR ID PRODUCTO
	=============================================*/

	static public function ctrMostrarLotes2($valor){

		$respuesta = ModeloLotes::MdlMostrarLotes2($valor);

		return $respuesta;
	}
}





	