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

}





	