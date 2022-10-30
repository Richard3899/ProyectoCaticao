<?php

class ControladorUnidadMedida{


	/*=============================================
	MOSTRAR UNIDAD DE MEDIDA
	=============================================*/

	static public function ctrMostrarUnidadMedida($item, $valor){

		$tabla = "unidadmedida";

		$respuesta = ModeloUnidadMedida::MdlMostrarUnidadMedida($tabla, $item, $valor);

		return $respuesta;
	} 


}







	