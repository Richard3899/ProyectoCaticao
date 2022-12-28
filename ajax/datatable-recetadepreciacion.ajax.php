<?php

require_once "../controladores/recetadepreciacion.controlador.php";
require_once "../modelos/recetadepreciacion.modelo.php";

class TablaRecetaDepreciacion{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETA DEPRECIACION
  	=============================================*/ 

	public function mostrarTablaRecetaDepreciacion(){

    	$idRecetaC=$_GET["idRecetaC"];

		$item = "Receta";

  		$depreciacionreceta = ControladorRecetaDepreciacion::ctrMostrarRecetaDepreciacion($item,$idRecetaC);	

		/*=============================================
 	 	TRAEMOS EL TOTAL DE RECETA DEPRECIACION
  		=============================================*/

		$sumatotaldepreciacionreceta = ControladorRecetaDepreciacion::ctrSumaTotalRecetaDepreciacion($idRecetaC);	

		$total = $sumatotaldepreciacionreceta[0];

		if(count($depreciacionreceta) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($depreciacionreceta); $i++){
			
			/*=============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarDepreciacionReceta' idRecetaDepreciacion='".$depreciacionreceta[$i]["idRecetaDepreciacion"]."' data-toggle='modal' data-target='#modalEditarDepreciacion'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarDepreciacionReceta' idRecetaDepreciacion='".$depreciacionreceta[$i]["idRecetaDepreciacion"]."' idDepreciacion='".$depreciacionreceta[$i]["idMaquina"]."' ><i class='fa fa-times'></i></button></div>";				
				
		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$depreciacionreceta[$i]["depreciacionAnual"].'",
			      "'.$depreciacionreceta[$i]["depreciacionMensual"].'",
				  "'.$depreciacionreceta[$i]["depreciacionHora"].'",
				  "'.$depreciacionreceta[$i]["tiempoDeUso"].'",
				  "'.$depreciacionreceta[$i]["depreciacionPorBatch"].'",
				  "'.$botones.'"
			    ],';

		  }

		  $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   ',["Total","","","","","S/. '.$total.'",""]] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE DEPRECIACION
=============================================*/ 
$activarRecetaDepreciacion = new TablaRecetaDepreciacion();
$activarRecetaDepreciacion -> mostrarTablaRecetaDepreciacion();