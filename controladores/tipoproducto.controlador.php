<?php

class ControladorTipoProducto{

	/*=============================================
	MOSTRAR INSUMOS
	=============================================*/

	static public function ctrMostrarTipoProducto($item, $valor){

		$tabla = "tipoproducto";

		$respuesta = ModeloTipoProducto::MdlMostrarTipoProducto($tabla, $item, $valor);

		return $respuesta;
	}

}





	