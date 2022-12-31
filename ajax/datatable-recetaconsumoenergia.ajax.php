<?php

require_once "../controladores/recetaconsumoenergia.controlador.php";
require_once "../modelos/recetaconsumoenergia.modelo.php";

class TablaRecetaConsumoEnergia{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETA CONSUMO DE ENERGÍA
  	=============================================*/ 

	public function mostrarTablaRecetaConsumoEnergia(){

    	$idRecetaC=$_GET["idRecetaC"];

		$item = "Receta";

  		$recetaconsumoenergia = ControladorRecetaConsumoEnergia::ctrMostrarRecetaConsumoEnergia($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA CONSUMO DE ENERGÍA
  		=============================================*/

		$sumatotalconsumoenergiareceta = ControladorRecetaConsumoEnergia::ctrSumaTotalRecetaConsumoEnergia($idRecetaC);	

		$total = $sumatotalconsumoenergiareceta[0];

		if(count($recetaconsumoenergia) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($recetaconsumoenergia); $i++){
			
			/*============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarConsumoEnergiaReceta' idRecetaConsumoEnergia='".$recetaconsumoenergia[$i]["idRecetaConsumoEnergia"]."' data-toggle='modal' data-target='#modalEditarConsumoEnergia'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarConsumoEnergiaReceta' idRecetaConsumoEnergia='".$recetaconsumoenergia[$i]["idRecetaConsumoEnergia"]."'><i class='fa fa-times'></i></button></div>";				
				
		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$recetaconsumoenergia[$i]["nombreMaquina"].'",
			      "'.$recetaconsumoenergia[$i]["potenciaKw"].'",
				  "'.$recetaconsumoenergia[$i]["horasTrabajoBatch"].'",
				  "'.$recetaconsumoenergia[$i]["consumoKwh"].'",
				  "'.$recetaconsumoenergia[$i]["tarifaKwh"].'",
				  "'.$recetaconsumoenergia[$i]["pagoPorBatch"].'",
				  "'.$botones.'"
			    ],';

		  }

		 $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   ',["Total","","","","","","S/. '.$total.'",""]] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE CONSUMO DE ENERGÍA
=============================================*/ 
$activarRecetaConsumoEnergia = new TablaRecetaConsumoEnergia();
$activarRecetaConsumoEnergia -> mostrarTablaRecetaConsumoEnergia();