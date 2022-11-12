<?php

require_once "../modelos/configuracion.modelo.php";

class AjaxConfiguracion{


	/*=============================================
	ACTIVAR MODO DARK
	=============================================*/	

	public $activarModoDark;
	public $activarIdConfig;


    public function ajaxActivarModoDark(){

		$tabla = "configuracion";

		$item1 = "mododark";
		$valor1 = $this->activarModoDark;

		$item2 = "idConfiguracion";
		$valor2 = $this->activarIdConfig;

		ModeloConfiguracion::mdlActivarModoDark($tabla, $item1, $valor1, $item2, $valor2);

	}


}

/*=============================================
ACTIVAR MODO DARK
=============================================*/	

if(isset($_POST["activarModoDark"])){

	$activarModoDark1 = new AjaxConfiguracion();
	$activarModoDark1 -> activarModoDark = $_POST["activarModoDark"];
	$activarModoDark1 -> activarIdConfig = $_POST["activarIdConfig"];
	$activarModoDark1 -> ajaxActivarModoDark();

}

