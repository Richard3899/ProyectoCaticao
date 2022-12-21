<?php

require_once "../controladores/recetamanodeobra.controlador.php";
require_once "../modelos/recetamanodeobra.modelo.php";

class AjaxRecetaManodeObra{

	/*=============================================
	EDITAR RECETA MANO DE OBRA
	=============================================*/	

	public $idRecetaManodeObra;
	public $idReceta;
	public $idManodeObra;

	public function ajaxManodeObraReceta(){

		$item="ManodeObraReceta";

		$valor = $this->idRecetaManodeObra;

		$respuesta = ControladorRecetaManodeObra::ctrMostrarRecetaManodeObra($item,$valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	MOSTRAR RECETA MANO DE OBRAS
	=============================================*/
	public function ajaxReceta(){

		$item="Receta";

		$valor = $this->idReceta;

		$respuesta = ControladorRecetaManodeObra::ctrMostrarRecetaManodeObra($item,$valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	MOSTRAR DETALLE MANO DE OBRA
	=============================================*/
	public function ajaxDetalleManodeObra(){

		$valor = $this->idManodeObra;

		$respuesta = ControladorRecetaManodeObra::ctrMostrarDetalleManodeObra($valor);

		echo json_encode($respuesta);

}

}


/*=============================================
EDITAR RECETA MANO DE OBRA
=============================================*/
if(isset($_POST["idRecetaManodeObra"])){

	$editar = new AjaxRecetaManodeObra();
	$editar -> idRecetaManodeObra = $_POST["idRecetaManodeObra"];
	$editar -> ajaxManodeObraReceta();

}

/*=============================================
MOSTRAR RECETA MANO DE OBRAS
=============================================*/
if(isset($_POST["idReceta"])){

	$editar = new AjaxRecetaManodeObra();
	$editar -> idReceta = $_POST["idReceta"];
	$editar -> ajaxReceta();

}

/*=============================================
MOSTRAR DETALLE MANO DE OBRA
=============================================*/
if(isset($_POST["idManodeObraDetalle"])){

	$editar = new AjaxRecetaManodeObra();
	$editar -> idManodeObra = $_POST["idManodeObraDetalle"];
	$editar -> ajaxDetalleManodeObra();

}


