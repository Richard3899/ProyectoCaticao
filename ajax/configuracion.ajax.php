<?php

require_once "../modelos/configuracion.modelo.php";

class AjaxConfiguracion{


	/*=============================================
	ACTIVAR MODO DARK
	=============================================*/	

	public $activarModoDark;
	public $activarContraerBarraLateral;
	public $activarOcultarBarraLateral;
	public $activarIdConfig;


    public function ajaxActivarModoDark(){

		$tabla = "configuracion";

		$item1 = "modoDark";
		$valor1 = $this->activarModoDark;

		$item2 = "idConfiguracion";
		$valor2 = $this->activarIdConfig;

		ModeloConfiguracion::mdlActivarConfiguracion($tabla, $item1, $valor1, $item2, $valor2);

	}

	public function ajaxActivarContraerBarraLateral(){

		$tabla = "configuracion";
		
		$item1 = "contraerBarraLateral";
		$valor1 = $this->activarContraerBarraLateral;
		
		$item2 = "idConfiguracion";
		$valor2 = $this->activarIdConfig;
		
		ModeloConfiguracion::mdlActivarConfiguracion($tabla, $item1, $valor1, $item2, $valor2);
		
		}

	public function ajaxActivarOcultarBarraLateral(){

			$tabla = "configuracion";
			
			$item1 = "ocultarBarraLateral";
			$valor1 = $this->activarOcultarBarraLateral;
			
			$item2 = "idConfiguracion";
			$valor2 = $this->activarIdConfig;
			
		ModeloConfiguracion::mdlActivarConfiguracion($tabla, $item1, $valor1, $item2, $valor2);
			
	    }
			
			


}

/*=============================================
ACTIVAR MODO DARK
=============================================*/	

if(isset($_POST["activarModoDark"])){

	$activarModoDark = new AjaxConfiguracion();
	$activarModoDark -> activarModoDark = $_POST["activarModoDark"];
	$activarModoDark -> activarIdConfig = $_POST["activarIdConfig"];
	$activarModoDark -> ajaxActivarModoDark();

}


/*=============================================
ACTIVAR CONTRAIDO DE BARRA LATERAL
=============================================*/	

if(isset($_POST["activarContraerBarraLateral"])){

	$activarContraerBarraLateral = new AjaxConfiguracion();
	$activarContraerBarraLateral -> activarContraerBarraLateral = $_POST["activarContraerBarraLateral"];
	$activarContraerBarraLateral -> activarIdConfig = $_POST["activarIdConfig"];
	$activarContraerBarraLateral -> ajaxActivarContraerBarraLateral();

}


/*=============================================
ACTIVAR OCULTAR DE BARRA LATERAL
=============================================*/	

if(isset($_POST["activarOcultarBarraLateral"])){

	$activarOcultarBarraLateral = new AjaxConfiguracion();
	$activarOcultarBarraLateral -> activarOcultarBarraLateral = $_POST["activarOcultarBarraLateral"];
	$activarOcultarBarraLateral -> activarIdConfig = $_POST["activarIdConfig"];
	$activarOcultarBarraLateral -> ajaxActivarOcultarBarraLateral();

}


