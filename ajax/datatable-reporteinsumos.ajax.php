<?php

require_once "../controladores/reporteinsumos.controlador.php";
require_once "../modelos/reporteinsumos.modelo.php";

class TablaReporteInsumos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE INSUMOS
  	=============================================*/ 

	public function mostrarTablaReporteInsumos(){

		$item = null;
    	$valor = null;

  		$insumos = ControladorReporteInsumos::ctrMostrarReporteInsumos($item, $valor);
		
		if(count($insumos) == 0){

			echo '{"data": []}';

			return;
		}
		
  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($insumos); $i++){

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$insumos[$i]["codigo"].'",
				  "'.$insumos[$i]["nombre"].'",
			      "'.$insumos[$i]["descripcion"].'",
				  "'.$insumos[$i]["unidadMedida"].'",
			      "'.$insumos[$i]["marca"].'",
			      "'.$insumos[$i]["precioUnitario"].'",
				  "'.$insumos[$i]["stock"].'"
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
$activarReporteInsumos = new TablaReporteInsumos();
$activarReporteInsumos -> mostrarTablaReporteInsumos();