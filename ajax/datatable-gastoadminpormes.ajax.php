<?php

require_once "../controladores/gastoadminpormes.controlador.php";
require_once "../modelos/gastoadminpormes.modelo.php";

class TablaGastoAdminPorMes{

 	/*=============================================
 	 MOSTRAR LA TABLA DE GASTOS ADMINISTRATIVOS POR MES
  	=============================================*/ 

	public function mostrarTablaGastoAdminPorMes(){

    	$idCostoRecetasGastoAdminC=$_GET["idCostoRecetasGastoAdminC"];

		$item = "CostoRecetasGastoAdmin";

  		$gastoadminpormes = ControladorGastoAdminPorMes::ctrMostrarGastoAdminPorMes($item,$idCostoRecetasGastoAdminC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE GASTOS ADMINISTRATIVOS POR MES
  		=============================================*/

		$sumatotalgastoadminpormes = ControladorGastoAdminPorMes::ctrSumaTotalGastoAdminPorMes($idCostoRecetasGastoAdminC);	

		$total = $sumatotalgastoadminpormes[0];

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