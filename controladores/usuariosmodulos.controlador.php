<?php

class ControladorUsuariosModulos{

	/*=============================================
	MOSTRAR USUARIOS MODULOS
	=============================================*/

	static public function ctrMostrarUsuariosModulos($valor){

		$respuesta = ModeloUsuariosModulos::MdlMostrarUsuariosModulos($valor);

		return $respuesta;
	} 

}


	