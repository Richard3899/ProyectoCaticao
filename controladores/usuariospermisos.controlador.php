<?php

class ControladorUsuariosPermisos{

	/*=============================================
	MOSTRAR USUARIOS Y PERMISOS
	=============================================*/

	static public function ctrMostrarUsuariosPermisos($valor){

		$respuesta = ModeloUsuariosPermisos::MdlMostrarUsuariosPermisos($valor);

		return $respuesta;
	} 

}


	