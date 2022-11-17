<?php

class ControladorEstados{

	/*=============================================
	MOSTRAR ESTADOS
	=============================================*/

	static public function ctrMostrarEstados($item, $valor){

		$tabla = "estado";

		$respuesta = ModeloEstados::MdlMostrarEstados($tabla, $item, $valor);

		return $respuesta;
	}
}





	