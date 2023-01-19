<?php

require_once "../controladores/gastoadminpormes.controlador.php";
require_once "../modelos/gastoadminpormes.modelo.php";

class TablaGastoAdminPorMes{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETA COSTO DE VENTA
  	=============================================*/ 

	public function mostrarTablaGastoAdminPorMes(){

    	$idRecetaC=$_GET["idCostoRecetasGastoAdminC"];

		$item = "CostoRecetasGastoAdmin";

  		$gastoadminpormes = ControladorGastoAdminPorMes::ctrMostrarGastoAdminPorMes($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA COSTO DE VENTA
  		=============================================*/

		$sumatotalcostoventareceta = ControladorGastoAdminPorMes::ctrSumaTotalGastoAdminPorMes($idRecetaC);	

		$total = $sumatotalcostoventareceta[0];

		if(count($gastoadminpormes) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($gastoadminpormes); $i++){
			
			/*============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarGastoAdminPorMes' idGastoAdminPorMes='".$gastoadminpormes[$i]["idGastoAdminPorMes"]."' data-toggle='modal' data-target='#modalEditarGastoAdminPorMes'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarGastoAdminPorMes' idGastoAdminPorMes='".$gastoadminpormes[$i]["idGastoAdminPorMes"]."'><i class='fa fa-times'></i></button></div>";				
				
		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$gastoadminpormes[$i]["nombreGastoAdmin"].'",
			      "'.$gastoadminpormes[$i]["cantidad"].'",
				  "'.$gastoadminpormes[$i]["precio"].'",
				  "'.$gastoadminpormes[$i]["total"].'",
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
ACTIVAR TABLA DE COSTO DE VENTA
=============================================*/ 
$activarGastoAdminPorMes = new TablaGastoAdminPorMes();
$activarGastoAdminPorMes -> mostrarTablaGastoAdminPorMes();