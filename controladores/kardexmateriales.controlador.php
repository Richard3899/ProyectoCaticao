<?php

class ControladorKardexMateriales{

	/*=============================================
	MOSTRAR MATERIALES
	=============================================*/

	static public function ctrMostrarKardexMateriales($valor){

		$respuesta = ModeloKardexMateriales::MdlMostrarKardexMateriales($valor);

		return $respuesta;
	}

}





	