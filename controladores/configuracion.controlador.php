<?php

class ControladorConfiguracion{

	/*=============================================
	MOSTRAR USUARIO
	=============================================*/

	static public function ctrMostrarConfiguracion($item, $valor){

		$tabla = "configuracion";

		$respuesta = ModeloConfiguracion::mdlMostrarConfiguracion($tabla, $item, $valor);

		return $respuesta;
	}




}


	