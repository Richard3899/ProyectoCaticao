<?php

require_once "../controladores/recetamateriales.controlador.php";
require_once "../modelos/recetamateriales.modelo.php";

class AjaxRecetaMateriales{

	/*=============================================
	EDITAR RECETA MATERIAL
	=============================================*/	

	public $idRecetaMaterial;
	public $idReceta;
	public $idMaterial;

	public function ajaxMaterialReceta(){

		$item="MaterialReceta";

		$valor = $this->idRecetaMaterial;

		$respuesta = ControladorRecetaMateriales::ctrMostrarRecetaMateriales($item,$valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	MOSTRAR RECETA MATERIALES
	=============================================*/
	public function ajaxReceta(){

		$item="Receta";

		$valor = $this->idReceta;

		$respuesta = ControladorRecetaMateriales::ctrMostrarRecetaMateriales($item,$valor);

		echo json_encode($respuesta);

	}
	/*=============================================
	MOSTRAR DETALLE MATERIAL
	=============================================*/
	public function ajaxDetalleMaterial(){

		$valor = $this->idMaterial;

		$respuesta = ControladorRecetaMateriales::ctrMostrarDetalleMateriales($valor);

		echo json_encode($respuesta);

}

}


/*=============================================
EDITAR RECETA MATERIAL
=============================================*/
if(isset($_POST["idRecetaMaterial"])){

	$editar = new AjaxRecetaMateriales();
	$editar -> idRecetaMaterial = $_POST["idRecetaMaterial"];
	$editar -> ajaxMaterialReceta();

}

/*=============================================
MOSTRAR RECETA MATERIALES
=============================================*/
if(isset($_POST["idReceta"])){

	$editar = new AjaxRecetaMateriales();
	$editar -> idReceta = $_POST["idReceta"];
	$editar -> ajaxReceta();

}

/*=============================================
MOSTRAR DETALLE MATERIAL
=============================================*/
if(isset($_POST["idMaterialDetalle"])){

	$editar = new AjaxRecetaMateriales();
	$editar -> idMaterial = $_POST["idMaterialDetalle"];
	$editar -> ajaxDetalleMaterial();

}


