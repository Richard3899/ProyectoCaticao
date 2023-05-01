<?php

class ControladorTipoGasto{

	/*=============================================
	MOSTRAR TIPO DE GASTO
	=============================================*/

	static public function ctrMostrarTipoGasto($item, $valor){

		$tabla = "tipogasto"; 

		$respuesta = ModeloTipoGasto::MdlMostrarTipoGasto($tabla, $item, $valor);

		return $respuesta;
	}

}





	