<?php

class ControladorKardexMateriales{

	/*=============================================
	MOSTRAR MATERIALES
	=============================================*/

	static public function ctrMostrarKardexMateriales($item, $valor){

		$tabla = "movimientomateria";

		$respuesta = ModeloKardexMateriales::MdlMostrarKardexMateriales($tabla, $item, $valor);

		return $respuesta;
	}

	static public function ctrMostrarKardexMateriales2($valor){

		$respuesta = ModeloKardexMateriales::MdlMostrarKardexMateriales2($valor);

		return $respuesta;
	}

}





	