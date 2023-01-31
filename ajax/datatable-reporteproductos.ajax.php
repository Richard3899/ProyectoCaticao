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

			if($productos[$i]["stock"]==""){
				$stock=0.00;
			}else{
				$stock=$productos[$i]["stock"];
			}

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$productos[$i]["codigo"].'",
				  "'.$productos[$i]["nombre"].'",
			      "'.$productos[$i]["descripcion"].'",
				  "'.$productos[$i]["unidadMedida"].'",
				  "'.$stock.'"
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