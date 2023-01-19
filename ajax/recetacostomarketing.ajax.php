<?php

require_once "../controladores/recetacostomarketing.controlador.php";
require_once "../modelos/recetacostomarketing.modelo.php";

class AjaxRecetaCostoMarketing{

	/*=============================================
	EDITAR RECETA COSTO DE MARKETING
	=============================================*/	

	public $idRecetaCostoMarketing;
	public $idReceta;

	public function ajaxEditarCostoMarketingReceta(){

		$item="RecetaCostoMarketing";

		$valor = $this->idRecetaCostoMarketing;

		$respuesta = ControladorRecetaCostoMarketing::ctrMostrarRecetaCostoMarketing($item,$valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	MOSTRAR RECETA COSTO DE MARKETINGS
	=============================================*/
	public function ajaxReceta(){

		$item="Receta";

		$valor = $this->idReceta;

		$respuesta = ControladorRecetaCostoMarketing::ctrMostrarRecetaCostoMarketing($item,$valor);

		echo json_encode($respuesta);

	}

}


/*=============================================
EDITAR RECETA COSTO DE MARKETING
=============================================*/
if(isset($_POST["idRecetaCostoMarketing"])){

	$editar = new AjaxRecetaCostoMarketing();
	$editar -> idRecetaCostoMarketing = $_POST["idRecetaCostoMarketing"];
	$editar -> ajaxEditarCostoMarketingReceta();

}

/*=============================================
MOSTRAR RECETA COSTO DE MARKETINGS
=============================================*/
if(isset($_POST["idReceta"])){

	$editar = new AjaxRecetaCostoMarketing();
	$editar -> idReceta = $_POST["idReceta"];
	$editar -> ajaxReceta();

}

