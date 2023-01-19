<?php

require_once "../controladores/recetadepreciacion.controlador.php";
require_once "../modelos/recetadepreciacion.modelo.php";

class AjaxRecetaDepreciacion{

	/*=============================================
	EDITAR RECETA DEPRECIACIÓN
	=============================================*/	

	public $idRecetaDepreciacion;
	public $idReceta;

	public function ajaxEditarDepreciacionReceta(){

		$item="RecetaDepreciacion";

		$valor = $this->idRecetaDepreciacion;

		$respuesta = ControladorRecetaDepreciacion::ctrMostrarRecetaDepreciacion($item,$valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	MOSTRAR RECETA DEPRECIACIÓNS
	=============================================*/
	public function ajaxReceta(){

		$item="Receta";

		$valor = $this->idReceta;

		$respuesta = ControladorRecetaDepreciacion::ctrMostrarRecetaDepreciacion($item,$valor);

		echo json_encode($respuesta);

	}

}


/*=============================================
EDITAR RECETA DEPRECIACIÓN
=============================================*/
if(isset($_POST["idRecetaDepreciacion"])){

	$editar = new AjaxRecetaDepreciacion();
	$editar -> idRecetaDepreciacion = $_POST["idRecetaDepreciacion"];
	$editar -> ajaxEditarDepreciacionReceta();

}

/*=============================================
MOSTRAR RECETA DEPRECIACIÓNS
=============================================*/
if(isset($_POST["idReceta"])){

	$editar = new AjaxRecetaDepreciacion();
	$editar -> idReceta = $_POST["idReceta"];
	$editar -> ajaxReceta();

}

