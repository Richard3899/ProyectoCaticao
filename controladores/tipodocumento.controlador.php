<?php

class ControladorTipoDocumento{

	/*=============================================
	MOSTRAR INSUMOS
	=============================================*/

	static public function ctrMostrarTipoDocumento($item, $valor){

		$tabla = "tipodocumento";

		$respuesta = ModeloTipoDocumento::MdlMostrarTipoDocumento($tabla, $item, $valor);

		return $respuesta;
	}

}





	