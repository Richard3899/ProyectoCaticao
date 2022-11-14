<?php

class ControladorKardexProductos{

	/*=============================================
	MOSTRAR PRODUCTOS
	=============================================*/

	static public function ctrMostrarKardexProductos($item, $valor){

		$tabla = "movimientoproducto";

		$respuesta = ModeloKardexProductos::MdlMostrarKardexProductos($tabla, $item, $valor);

		return $respuesta;
	}

	static public function ctrMostrarKardexProductos2($valor){

		$respuesta = ModeloKardexProductos::MdlMostrarKardexProductos2($valor);

		return $respuesta;
	}

}





	