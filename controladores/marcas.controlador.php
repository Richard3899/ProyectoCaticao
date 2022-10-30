<?php

class ControladorMarcas{


	/*=============================================
	MOSTRAR MARCAS
	=============================================*/

	static public function ctrMostrarMarcas($item, $valor){

		$tabla = "marca";

		$respuesta = ModeloMarcas::MdlMostrarMarcas($tabla, $item, $valor);

		return $respuesta;
	} 


}







	