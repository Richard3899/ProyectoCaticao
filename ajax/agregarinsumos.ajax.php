<?php

require_once "../controladores/agregarinsumos.controlador.php";
require_once "../modelos/agregarinsumos.modelo.php";

class AjaxAgregarInsumos{

	/*=============================================
	MOSTRAR DETALLE INSUMO
	=============================================*/	

	public $idInsumoReceta;
	public $idReceta;
	public $idInsumo;

	public function ajaxInsumoReceta(){

		$item="InsumoReceta";

		$valor = $this->idInsumoReceta;

		$respuesta = ControladorAgregarInsumos::ctrMostrarAgregarInsumos($item,$valor);

		echo json_encode($respuesta);

	}

	public function ajaxReceta(){

		$item="Receta";

		$valor = $this->idReceta;

		$respuesta = ControladorAgregarInsumos::ctrMostrarAgregarInsumos($item,$valor);

		echo json_encode($respuesta);

	}

	public function ajaxDetalleInsumo(){

		$valor = $this->idInsumo;

		$respuesta = ControladorAgregarInsumos::ctrMostrarDetalleInsumos($valor);

		echo json_encode($respuesta);

}

}


/*=============================================
DETALLE INSUMO
=============================================*/
if(isset($_POST["idInsumoReceta"])){

	$editar = new AjaxAgregarInsumos();
	$editar -> idInsumoReceta = $_POST["idInsumoReceta"];
	$editar -> ajaxInsumoReceta();

}

/*=============================================
DETALLE INSUMO
=============================================*/
if(isset($_POST["idReceta"])){

	$editar = new AjaxAgregarInsumos();
	$editar -> idReceta = $_POST["idReceta"];
	$editar -> ajaxReceta();

}

/*=============================================
DETALLE INSUMO
=============================================*/
if(isset($_POST["idInsumoDetalle"])){

	$editar = new AjaxAgregarInsumos();
	$editar -> idInsumo = $_POST["idInsumoDetalle"];
	$editar -> ajaxDetalleInsumo();

}


