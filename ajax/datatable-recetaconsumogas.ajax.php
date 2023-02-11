<?php

require_once "../controladores/recetaconsumogas.controlador.php";
require_once "../modelos/recetaconsumogas.modelo.php";

class TablaRecetaConsumoGas{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETA CONSUMO DE GAS
  	=============================================*/ 

	public function mostrarTablaRecetaConsumoGas(){

    	$idRecetaC=$_GET["idRecetaC"];

		$item = "Receta";

  		$recetaconsumogas = ControladorRecetaConsumoGas::ctrMostrarRecetaConsumoGas($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA CONSUMO DE GAS
  		=============================================*/

		$sumatotalconsumogasreceta = ControladorRecetaConsumoGas::ctrSumaTotalRecetaConsumoGas($idRecetaC);	

		$total = $sumatotalconsumogasreceta[0];

		if(count($recetaconsumogas) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($recetaconsumogas); $i++){
			
			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarConsumoGasReceta' idRecetaConsumoGas='".$recetaconsumogas[$i]["idRecetaConsumoGas"]."' data-toggle='modal' data-target='#modalEditarConsumoGas'><i class='fa fa-pen'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){

			$botones =  "<div class='btn-group'><button class='btn btn-danger btnEliminarConsumoGasReceta' idRecetaConsumoGas='".$recetaconsumogas[$i]["idRecetaConsumoGas"]."'><i class='fa fa-times'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
				
		    }else{

			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarConsumoGasReceta' idRecetaConsumoGas='".$recetaconsumogas[$i]["idRecetaConsumoGas"]."' data-toggle='modal' data-target='#modalEditarConsumoGas'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarConsumoGasReceta' idRecetaConsumoGas='".$recetaconsumogas[$i]["idRecetaConsumoGas"]."'><i class='fa fa-times'></i></button></div>";				

			}

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$recetaconsumogas[$i]["nombreMaquina"].'",
			      "'.$recetaconsumogas[$i]["trabajoPorBatch"].'",
				  "'.$recetaconsumogas[$i]["pesoBalonGas"].'",
				  "'.$recetaconsumogas[$i]["tarifaGas"].'",
				  "'.$recetaconsumogas[$i]["pagoPorBatch"].'",
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
ACTIVAR TABLA DE CONSUMO DE GAS
=============================================*/ 
$activarRecetaConsumoGas = new TablaRecetaConsumoGas();
$activarRecetaConsumoGas -> mostrarTablaRecetaConsumoGas();