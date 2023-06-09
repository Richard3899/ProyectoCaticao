<?php

require_once "../controladores/reporteproductos.controlador.php";
require_once "../modelos/reporteproductos.modelo.php";

class TablaReporteProductos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE PRODUCTOS
  	=============================================*/ 

	public function mostrarTablaReporteProductos(){

		$item = null;
    	$valor = null;

  		$productos = ControladorReporteProductos::ctrMostrarReporteProductos($item, $valor);
		
		if(count($productos) == 0){

			echo '{"data": []}';

			return;
		}
		
  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($productos); $i++){

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$productos[$i]["codigo"].'",
				  "'.$productos[$i]["nombre"].'",
			      "'.$productos[$i]["descripcion"].'",
				  "'.$productos[$i]["tipoProducto"].'",
				  "'.$productos[$i]["unidadMedida"].'",
				  "'.$productos[$i]["stock"].'"
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
$activarReporteProductos = new TablaReporteProductos();
$activarReporteProductos -> mostrarTablaReporteProductos();