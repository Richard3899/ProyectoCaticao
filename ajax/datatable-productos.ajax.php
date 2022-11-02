<?php

require_once "../controladores/productos.controlador.php";
require_once "../controladores/unidadmedida.controlador.php";
require_once "../controladores/tipoproducto.controlador.php";
require_once "../modelos/productos.modelo.php";
require_once "../modelos/unidadmedida.modelo.php";
require_once "../modelos/tipoproducto.modelo.php";

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
			  if($productos[$i]["imagen"] != ""){

				$imagen = "<img src='".$productos[$i]["imagen"]."' width='40px'>";

			  }else{

				$imagen = "<img src='vistas/img/productos/default/producto.png' class='img-thumbnail' width='40px'>";

			  };

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
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$items = "idUnidadMedida";
		  	$valors = $productos[$i]["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($items, $valors);

			/*=============================================
 	 		TRAEMOS LA MARCA
  			=============================================*/ 

		  	$item = "idTipoProducto";
		  	$valor = $productos[$i]["idTipoProducto"];

		  	$tipoproducto = ControladorTipoProducto::ctrMostrarTipoProducto($item, $valor);

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
				  "'.$unidadmedida["descripcion"].'",
			      "'.$cantidad.'",
			      "'.$tipoproducto["descripcion"].'",
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

