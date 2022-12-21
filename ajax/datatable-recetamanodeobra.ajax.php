<?php

require_once "../controladores/recetamanodeobra.controlador.php";
require_once "../modelos/recetamanodeobra.modelo.php";

class TablaRecetaManodeObra{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETA MANO DE OBRA
  	=============================================*/ 

	public function mostrarTablaRecetaManodeObra(){

    	$idRecetaC=$_GET["idRecetaC"];

		$item = "Receta";

  		$recetamanodeobra = ControladorRecetaManodeObra::ctrMostrarRecetaManodeObra($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA MANO DE OBRA
  		=============================================*/

		$sumatotalmanodeobrareceta = ControladorRecetaManodeObra::ctrSumaTotalRecetaManodeObra($idRecetaC);	

		$total = $sumatotalmanodeobrareceta[0];

		if(count($recetamanodeobra) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($recetamanodeobra); $i++){
			
			/*============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarManodeObraReceta' idRecetaManodeObra='".$recetamanodeobra[$i]["idRecetaManodeObra"]."' data-toggle='modal' data-target='#modalEditarManodeObra'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarManodeObraReceta' idRecetaManodeObra='".$recetamanodeobra[$i]["idRecetaManodeObra"]."'><i class='fa fa-times'></i></button></div>";				
				
		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$recetamanodeobra[$i]["nombreEmpleado"].'",
				  "'.$recetamanodeobra[$i]["nombreMaquina"].'",
			      "'.$recetamanodeobra[$i]["cantidad"].'",
				  "'.$recetamanodeobra[$i]["precioUnitario"].'",
				  "'.$recetamanodeobra[$i]["total"].'",
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
ACTIVAR TABLA DE MANO DE OBRA
=============================================*/ 
$activarRecetaManodeObra = new TablaRecetaManodeObra();
$activarRecetaManodeObra -> mostrarTablaRecetaManodeObra();