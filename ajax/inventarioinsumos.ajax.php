<?php

require_once "../controladores/inventarioinsumos.controlador.php";
require_once "../modelos/inventarioinsumos.modelo.php";

class AjaxInventarioInsumos{

	/*=============================================
	INVENTARIO INSUMO
	=============================================*/	

	public $idInsumo;

	public function ajaxEditarInsumo(){

		$item = "idInventarioMateria";
		$valor = $this->idInsumo;

		$respuesta = ControladorInventarioInsumos::ctrMostrarInventarioInsumos($item, $valor);

		echo json_encode($respuesta);

	}

}


/*=============================================
INVENTARIO INSUMO
=============================================*/
	if(isset($_POST["idInsumo"])){

		$editar = new AjaxInventarioInsumos();
		$editar -> idInsumo = $_POST["idInsumo"];
		$editar -> ajaxEditarInsumo();

	}

