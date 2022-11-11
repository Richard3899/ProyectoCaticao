<?php

class ControladorMovimiento{

	/*=============================================
	MOSTRAR MARCAS
	=============================================*/

	static public function ctrMostrarMovimiento($item, $valor){

		$tabla = "movimiento";

		$respuesta = ModeloMovimiento::MdlMostrarMovimiento($tabla, $item, $valor);

		return $respuesta;
	}


}





	