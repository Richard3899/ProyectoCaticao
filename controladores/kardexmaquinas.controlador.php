<?php

class ControladorKardexMaquinas{

	/*=============================================
	MOSTRAR MAQUINAS
	=============================================*/

	static public function ctrMostrarKardexMaquinas($valor){

		$respuesta = ModeloKardexMaquinas::MdlMostrarKardexMaquinas($valor);

		return $respuesta;
	}

}





	