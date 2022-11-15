<?php

class ControladorKardexMaquinas{

	/*=============================================
	MOSTRAR MAQUINAS
	=============================================*/

	static public function ctrMostrarKardexMaquinas($item, $valor){

		$tabla = "movimientomaquina";

		$respuesta = ModeloKardexMaquinas::MdlMostrarKardexMaquinas($tabla, $item, $valor);

		return $respuesta;
	}

	static public function ctrMostrarKardexMaquinas2($valor){

		$respuesta = ModeloKardexMaquinas::MdlMostrarKardexMaquinas2($valor);

		return $respuesta;
	}

}





	