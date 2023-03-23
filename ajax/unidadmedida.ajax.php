<?php

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

class AjaxUnidadMedida{

	/*=============================================
	EDITAR UNIDAD DE MEDIDA
	=============================================*/	

	public $idUnidadMedida;

	public function ajaxEditarUnidadMedida(){

		$item = "idUnidadMedida";
		$valor = $this->idUnidadMedida;

		$respuesta = ControladorUnidadMedida::ctrMostrarUnidadMedida($item, $valor);

		echo json_encode($respuesta);

	}
	
}

/*=============================================
EDITAR UNIDAD DE MEDIDA
=============================================*/
if(isset($_POST["idUnidadMedida"])){

	$editar = new AjaxUnidadMedida();
	$editar -> idUnidadMedida = $_POST["idUnidadMedida"];
	$editar -> ajaxEditarUnidadMedida();

}
