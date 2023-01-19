<?php

require_once "../controladores/recetacostooperativo.controlador.php";
require_once "../modelos/recetacostooperativo.modelo.php";

class AjaxRecetaCostoOperativo{

	/*=============================================
	EDITAR RECETA COSTO OPERATIVO
	=============================================*/	

	public $idRecetaCostoOperativo;
	public $idReceta;

	public function ajaxEditarCostoOperativoReceta(){

		$item="RecetaCostoOperativo";

		$valor = $this->idRecetaCostoOperativo;

		$respuesta = ControladorRecetaCostoOperativo::ctrMostrarRecetaCostoOperativo($item,$valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	MOSTRAR RECETA COSTO OPERATIVOS
	=============================================*/
	public function ajaxReceta(){

		$item="Receta";

		$valor = $this->idReceta;

		$respuesta = ControladorRecetaCostoOperativo::ctrMostrarRecetaCostoOperativo($item,$valor);

		echo json_encode($respuesta);

	}

}


/*=============================================
EDITAR RECETA COSTO OPERATIVO
=============================================*/
if(isset($_POST["idRecetaCostoOperativo"])){

	$editar = new AjaxRecetaCostoOperativo();
	$editar -> idRecetaCostoOperativo = $_POST["idRecetaCostoOperativo"];
	$editar -> ajaxEditarCostoOperativoReceta();

}

/*=============================================
MOSTRAR RECETA COSTO OPERATIVOS
=============================================*/
if(isset($_POST["idReceta"])){

	$editar = new AjaxRecetaCostoOperativo();
	$editar -> idReceta = $_POST["idReceta"];
	$editar -> ajaxReceta();

}

