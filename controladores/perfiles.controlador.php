<?php

class ControladorPerfiles{

	/*============================================
	MOSTRAR PERFILES
	=============================================*/

	static public function ctrMostrarPerfiles($item, $valor){

		$tabla = "perfil";

		$respuesta = ModeloPerfiles::MdlMostrarPerfiles($tabla, $item, $valor);

		return $respuesta;
	}

}





	