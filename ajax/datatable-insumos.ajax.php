<?php

require_once "../controladores/insumos.controlador.php";
require_once "../modelos/insumos.modelo.php";

require_once "../controladores/marcas.controlador.php";
require_once "../modelos/marcas.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

class TablaInsumos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE INSUMOS
  	=============================================*/ 

	public function mostrarTablaInsumos(){

		$item = null;
    	$valor = null;

  		$insumos = ControladorInsumos::ctrMostrarInsumos($item, $valor);
		
		if(count($insumos) == 0){

			echo '{"data": []}';

			return;
		}
		
  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($insumos); $i++){

		  	/*=============================================
 	 		TRAEMOS LA IMAGEN
  			=============================================*/ 
			  if($insumos[$i]["imagen"] != ""){

				$imagen = "<img src='".$insumos[$i]["imagen"]."' width='40px'>";

			  }else{

				$imagen = "<img src='vistas/img/insumos/default/insumo.png' class='img-thumbnail' width='40px'>";

			  };
			  

		  	/*=============================================
 	 		TRAEMOS LA MARCA
  			=============================================*/ 

		  	$item = "idMarca";
		  	$valor = $insumos[$i]["idMarca"];

		  	$marcas = ControladorMarcas::ctrMostrarMarcas($item, $valor);

			/*=============================================
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$items = "idUnidadMedida";
		  	$valors = $insumos[$i]["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($items, $valors);


		  	/*=============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/ 

		  	$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarInsumo' idInsumo='".$insumos[$i]["idMateria"]."' data-toggle='modal' data-target='#modalEditarInsumo'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarInsumo' idInsumo='".$insumos[$i]["idMateria"]."' codigo='".$insumos[$i]["codigo"]."' imagen='".$insumos[$i]["imagen"]."'><i class='fa fa-times'></i></button></div>"; 

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$imagen.'",
			      "'.$insumos[$i]["codigo"].'",
				  "'.$insumos[$i]["nombre"].'",
			      "'.$insumos[$i]["descripcion"].'",
			      "'.$marcas["descripcion"].'",
				  "'.$unidadmedida["descripcion"].'",
			      "'.$insumos[$i]["cantidad"].'",
			      "'."S/. ".$insumos[$i]["precio"].'",
			      "'.$botones.'"
			    ],';

		  }

		  $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   '] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE INSUMOS
=============================================*/ 
$activarInsumos = new TablaInsumos();
$activarInsumos -> mostrarTablaInsumos();