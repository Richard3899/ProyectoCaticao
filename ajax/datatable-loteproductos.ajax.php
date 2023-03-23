<?php

require_once "../controladores/productos.controlador.php";
require_once "../modelos/productos.modelo.php";

require_once "../controladores/lotes.controlador.php";
require_once "../modelos/lotes.modelo.php";

class TablaLoteProductos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE PRODUCTOS
  	=============================================*/ 

	public function mostrarTablaLoteProductos(){

		$idProducto=$_GET["ProductoL"];

  		$loteproductos = ControladorLotes::ctrMostrarLotes2($idProducto);	
		
		if($idProducto == 0){

			echo '{"data": []}';

			return;
		}
		if(count($loteproductos) == 0){

			echo '{"data": []}';

			return;
		}


  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($loteproductos); $i++){

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$loteproductos[$i]["codigoLote"].'",
				  "'.$loteproductos[$i]["fechaFin"].'",
				  "'.$loteproductos[$i]["fechaVencimiento"].'",
			      "'.$loteproductos[$i]["cantidad"].'"
			    ],';

		  }

		  $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   '] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE PRODUCTOS
=============================================*/ 
$activarLoteProductos = new TablaLoteProductos();
$activarLoteProductos -> mostrarTablaLoteProductos();