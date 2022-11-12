<?php

class ControladorKardexInsumos{

	/*=============================================
	MOSTRAR INSUMOS
	=============================================*/

	static public function ctrMostrarKardexInsumos($item, $valor){

		$tabla = "movimientomateria";

		$respuesta = ModeloKardexInsumos::MdlMostrarKardexInsumos($tabla, $item, $valor);

		return $respuesta;
	}

	static public function ctrMostrarKardexInsumos2($valor){

		$respuesta = ModeloKardexInsumos::MdlMostrarKardexInsumos2($valor);

		return $respuesta;
	}

}





	