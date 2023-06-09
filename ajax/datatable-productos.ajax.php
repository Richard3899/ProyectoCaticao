<?php

require_once "../controladores/productos.controlador.php";
require_once "../controladores/unidadmedida.controlador.php";
require_once "../controladores/tipoproducto.controlador.php";

require_once "../modelos/productos.modelo.php";
require_once "../modelos/unidadmedida.modelo.php";
require_once "../modelos/tipoproducto.modelo.php";

require_once "../controladores/inventarioproductos.controlador.php";
require_once "../modelos/inventarioproductos.modelo.php";

require_once "../controladores/kardexproductos.controlador.php";
require_once "../modelos/kardexproductos.modelo.php";

class TablaProductos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE PRODUCTOS
  	=============================================*/ 

	public function mostrarTablaProductos(){

		$item = null;
    	$valor = null;

  		$productos = ControladorProductos::ctrMostrarProductos($item, $valor);	
		
		if(count($productos) == 0){

			echo '{"data": []}';

			return;
		}

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
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$items = "idUnidadMedida";
		  	$valors = $productos[$i]["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($items, $valors);

			/*=============================================
 	 		TRAEMOS TIPO PRODUCTO
  			=============================================*/ 

		  	$item = "idTipoProducto";
		  	$valor = $productos[$i]["idTipoProducto"];

		  	$tipoproducto = ControladorTipoProducto::ctrMostrarTipoProducto($item, $valor);

			if($productos[$i]["idTipoProducto"]==1){

				$tp =  "<button class='btn btn-success'>".$tipoproducto["descripcion"]."</button>";
							
			}else{
				
				$tp =  "<button class='btn btn-info'>".$tipoproducto["descripcion"]."</button>";

			}

			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			$botones =  "<div class='btn-group'><button title='Editar' class='btn btn-warning btnEditarProducto' idProducto='".$productos[$i]["idProducto"]."' data-toggle='modal' data-target='#modalEditarProducto'><i class='fa fa-pen'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){

			$botones =  "<div class='btn-group'><button title='Eliminar' class='btn btn-danger btnEliminarProducto' idProducto='".$productos[$i]["idProducto"]."' codigo='".$productos[$i]["codigo"]."' imagen='".$productos[$i]["imagen"]."'><i class='fa fa-times'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
				
		    }else{

			$botones =  "<div class='btn-group'><button title='Editar' class='btn btn-warning btnEditarProducto' idProducto='".$productos[$i]["idProducto"]."' data-toggle='modal' data-target='#modalEditarProducto'><i class='fa fa-pen'></i></button><button title='Eliminar' class='btn btn-danger btnEliminarProducto' idProducto='".$productos[$i]["idProducto"]."' codigo='".$productos[$i]["codigo"]."' imagen='".$productos[$i]["imagen"]."'><i class='fa fa-times'></i></button></div>";				

			}

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$imagen.'",
			      "'.$productos[$i]["codigo"].'",
			      "'.$productos[$i]["nombre"].'",
			      "'.$productos[$i]["descripcion"].'",
				  "'.$unidadmedida["descripcion"].'",
			      "'.$tp.'",
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

