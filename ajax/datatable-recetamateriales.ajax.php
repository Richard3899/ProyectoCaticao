<?php

require_once "../controladores/recetamateriales.controlador.php";
require_once "../modelos/recetamateriales.modelo.php";

class TablaRecetaMateriales{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETA MATERIALES
  	=============================================*/ 

	public function mostrarTablaRecetaMateriales(){

    	$idRecetaC=$_GET["idRecetaC"];

		$item = "Receta";

  		$materialesreceta = ControladorRecetaMateriales::ctrMostrarRecetaMateriales($item,$idRecetaC);	

		/*=============================================
 	 	TRAEMOS EL TOTAL DE RECETA MATERIALES
  		=============================================*/

		$sumatotalmaterialesreceta = ControladorRecetaMateriales::ctrSumaTotalRecetaMateriales($idRecetaC);	

		$total = $sumatotalmaterialesreceta[0];

		if(count($materialesreceta) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($materialesreceta); $i++){
			
			/*=============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarMaterialReceta' idRecetaMaterial='".$materialesreceta[$i]["idRecetaMateria"]."' data-toggle='modal' data-target='#modalEditarMaterial'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarMaterialReceta' idRecetaMaterial='".$materialesreceta[$i]["idRecetaMateria"]."' idMaterial='".$materialesreceta[$i]["idMateria"]."' cantidadMaterial='".$materialesreceta[$i]["cantidad"]."' ><i class='fa fa-times'></i></button></div>";				
				
		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$materialesreceta[$i]["nombre"].'",
			      "'.$materialesreceta[$i]["cantidad"]." ".$materialesreceta[$i]["unidadMedida"].'",
				  "'.$materialesreceta[$i]["precioUnitario"].'",
				  "'.$materialesreceta[$i]["total"].'",
				  "'.$botones.'"
			    ],';

		  }

		  $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   ',["Total","","","","S/. '.$total.'",""]] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE MATERIALES
=============================================*/ 
$activarRecetaMateriales = new TablaRecetaMateriales();
$activarRecetaMateriales -> mostrarTablaRecetaMateriales();