<?php

require_once "../controladores/reportemateriales.controlador.php";
require_once "../modelos/reportemateriales.modelo.php";

class TablaReporteMateriales{

 	/*=============================================
 	 MOSTRAR LA TABLA DE MATERIALES
  	=============================================*/ 

	public function mostrarTablaReporteMateriales(){

  		$materiales = ControladorReporteMateriales::ctrMostrarReporteMateriales();
		
		if(count($materiales) == 0){

			echo '{"data": []}';

			return;
		}
		
  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($materiales); $i++){

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$materiales[$i]["codigo"].'",
				  "'.$materiales[$i]["nombre"].'",
			      "'.$materiales[$i]["descripcion"].'",
				  "'.$materiales[$i]["unidadMedida"].'",
			      "'.$materiales[$i]["marca"].'",
			      "'.$materiales[$i]["precioUnitario"].'",
				  "'.$materiales[$i]["stock"].'"
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
$activarReporteMateriales = new TablaReporteMateriales();
$activarReporteMateriales -> mostrarTablaReporteMateriales();