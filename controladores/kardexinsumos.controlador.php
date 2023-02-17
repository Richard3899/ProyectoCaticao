<?php

class ControladorKardexInsumos{

	/*=============================================
	MOSTRAR INSUMOS
	=============================================*/

	static public function ctrMostrarKardexInsumos($valor){

		$respuesta = ModeloKardexInsumos::MdlMostrarKardexInsumos($valor);

		return $respuesta;
	}

}





	