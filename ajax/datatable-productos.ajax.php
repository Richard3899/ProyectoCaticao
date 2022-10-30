<?php

require_once "../controladores/productos.controlador.php";
require_once "../modelos/productos.modelo.php";

class TablaProductos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE PRODUCTOS
  	=============================================*/ 

	public function mostrarTablaProductos(){

		$item = null;
    	$valor = null;

  		$productos = ControladorProductos::ctrMostrarProductos($item, $valor);	
		
  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($productos); $i++){

		  	/*=============================================
 	 		TRAEMOS LA IMAGEN
  			=============================================*/ 

		  	$imagen = "<img src='".$productos[$i]["imagen"]."' width='40px'>";

			/*=============================================
 	 		CANTIDAD
  			=============================================*/ 

  			if($productos[$i]["cantidad"] <= 10){

				$cantidad = "<button class='btn btn-danger'>".$productos[$i]["cantidad"]."</button>";

			}else if($productos[$i]["cantidad"] > 11 && $productos[$i]["cantidad"] <= 15){

				$cantidad = "<button class='btn btn-warning'>".$productos[$i]["cantidad"]."</button>";

			}else{

				$cantidad = "<button class='btn btn-success'>".$productos[$i]["cantidad"]."</button>";

			}

		  	/*=============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/ 

		  	$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarProducto' idProducto='".$productos[$i]["idProducto"]."' data-toggle='modal' data-target='#modalEditarProducto'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarProducto' idProducto='".$productos[$i]["idProducto"]."' codigo='".$productos[$i]["codigo"]."' imagen='".$productos[$i]["imagen"]."'><i class='fa fa-times'></i></button></div>"; 

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$imagen.'",
			      "'.$productos[$i]["codigo"].'",
			      "'.$productos[$i]["nombre"].'",
			      "'.$productos[$i]["descripcion"].'",
				  "'.$productos[$i]["idUnidadMedida"].'",
			      "'.$cantidad.'",
			      "'.$productos[$i]["idTipoProducto"].'",
			      "'.$botones.'"
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
$activarProductos = new TablaProductos();
$activarProductos -> mostrarTablaProductos();

