<?php

class ControladorTipoCosto{

	/*=============================================
	MOSTRAR INSUMOS
	=============================================*/

	static public function ctrMostrarTipoCosto($item, $valor){

		$tabla = "tipocosto";

		$respuesta = ModeloTipoCosto::MdlMostrarTipoCosto($tabla, $item, $valor);

		return $respuesta;
	}

}





	