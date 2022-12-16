<?php

require_once "../controladores/recetainsumos.controlador.php";
require_once "../modelos/recetainsumos.modelo.php";

class AjaxRecetaInsumos{

	/*=============================================
	MOSTRAR DETALLE INSUMO
	=============================================*/	

	public $idRecetaInsumo;
	public $idReceta;
	public $idInsumo;

	public function ajaxInsumoReceta(){

		$item="InsumoReceta";

		$valor = $this->idRecetaInsumo;

		$respuesta = ControladorRecetaInsumos::ctrMostrarRecetaInsumos($item,$valor);

		echo json_encode($respuesta);

	}

	public function ajaxReceta(){

		$item="Receta";

		$valor = $this->idReceta;

		$respuesta = ControladorRecetaInsumos::ctrMostrarRecetaInsumos($item,$valor);

		echo json_encode($respuesta);

	}

	public function ajaxDetalleInsumo(){

		$valor = $this->idInsumo;

		$respuesta = ControladorRecetaInsumos::ctrMostrarDetalleInsumos($valor);

		echo json_encode($respuesta);

}

}


/*=============================================
DETALLE INSUMO
=============================================*/
if(isset($_POST["idRecetaInsumo"])){

	$editar = new AjaxRecetaInsumos();
	$editar -> idRecetaInsumo = $_POST["idRecetaInsumo"];
	$editar -> ajaxInsumoReceta();

}

/*=============================================
DETALLE INSUMO
=============================================*/
if(isset($_POST["idReceta"])){

	$editar = new AjaxRecetaInsumos();
	$editar -> idReceta = $_POST["idReceta"];
	$editar -> ajaxReceta();

}

/*=============================================
DETALLE INSUMO
=============================================*/
if(isset($_POST["idInsumoDetalle"])){

	$editar = new AjaxRecetaInsumos();
	$editar -> idInsumo = $_POST["idInsumoDetalle"];
	$editar -> ajaxDetalleInsumo();

}


