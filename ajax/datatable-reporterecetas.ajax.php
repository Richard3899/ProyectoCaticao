<?php

require_once "../controladores/reporterecetas.controlador.php";
require_once "../modelos/reporterecetas.modelo.php";

class TablaReporteRecetas{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETAS
  	=============================================*/ 

	public function mostrarTablaReporteRecetas(){

  		$recetas = ControladorReporteRecetas::ctrMostrarReporteRecetas();
		
		if(count($recetas) == 0){

			echo '{"data": []}';

			return;
		}
		
  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($recetas); $i++){

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$recetas[$i]["codigo"].'",
				  "'.$recetas[$i]["nombre"].'",
			      "'.$recetas[$i]["nombreProducto"].'",
				  "'.$recetas[$i]["codigoLote"].'",
				  "'.$recetas[$i]["fechaFin"].'",
				  "'.$recetas[$i]["fechaVencimiento"].'",
				  "'.$recetas[$i]["cantidadTabletas"].'",
				  "'.$recetas[$i]["costoTotal"].'",
				  "'.$recetas[$i]["costoPorTableta"].'"
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
$activarReporteRecetas = new TablaReporteRecetas();
$activarReporteRecetas -> mostrarTablaReporteRecetas();