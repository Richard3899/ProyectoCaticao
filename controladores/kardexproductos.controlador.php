<?php

class ControladorKardexProductos{

	/*=============================================
	MOSTRAR PRODUCTOS
	=============================================*/

	static public function ctrMostrarKardexProductos($valor){

		$respuesta = ModeloKardexProductos::MdlMostrarKardexProductos($valor);

		return $respuesta;
	}

}





	