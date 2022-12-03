<?php

require_once "../controladores/recetas.controlador.php";
require_once "../modelos/recetas.modelo.php";

require_once "../controladores/productos.controlador.php";
require_once "../modelos/productos.modelo.php";

require_once "../controladores/estados.controlador.php";
require_once "../modelos/estados.modelo.php";

require_once "../controladores/lotes.controlador.php";
require_once "../modelos/lotes.modelo.php";


class TablaRecetas{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETAS
  	=============================================*/ 

	public function mostrarTablaRecetas(){

		$item = null;
    	$valor = null;

  		$recetas = ControladorRecetas::ctrMostrarRecetas($item, $valor);

		if(count($recetas) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($recetas); $i++){

       		/*=============================================
 	 		TRAEMOS AL ESTADO
  			=============================================*/ 

		  	$item2 = "idEstado";
		  	$valor2 = $recetas[$i]["idEstado"];

		  	$estados = ControladorEstados::ctrMostrarEstados($item2, $valor2);		
			
			/*=============================================
 	 		TRAEMOS AL PRODUCTO
  			=============================================*/ 

		  	$item1 = "codigoLote";
		  	$valor1 = $recetas[$i]["codigoLote"];

		  	$lotes = ControladorLotes::ctrMostrarLotes($item1, $valor1);

			/*=============================================
 	 		TRAEMOS AL PRODUCTO
  			=============================================*/ 

		  	$item1 = "idProducto";
		  	$valor1 = $lotes["idProducto"];

		  	$productos = ControladorProductos::ctrMostrarProductos($item1, $valor1);



		  	/*=============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/
		  	
			/*==Botón Editar y Eliminar=*/
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoLote='".$recetas[$i]["codigoLote"]."' data-toggle='modal' data-target='#modalEditarReceta'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigo='".$recetas[$i]["codigo"]."'><i class='fa fa-times'></i></button></div>";				
			$opciones = "<div class='btn-group dropleft'><button class='btn btn-secondary btn-sm' type='button' id='dropdownMenuButton' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'><i class='fas fa-ellipsis-v'></i></button><div class='dropdown-menu' aria-labelledby='dropdownMenuButton'><a class='dropdown-item' href='index.php?ruta=agregarinsumos&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Insumo</a><a class='dropdown-item' href='#'>Another action</a><a class='dropdown-item' href='#'>Something else here</a></div></div>";

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$recetas[$i]["codigo"].'",
				  "'.$recetas[$i]["nombre"].'",
				  "'.$productos["nombre"].'",
				  "'.$recetas[$i]["batch"].'",
				  "'.$estados["descripcion"].'",
				  "'.$recetas[$i]["fechaInicio"].'",
				  "'.$recetas[$i]["fechaFin"].'",
				  "'.$recetas[$i]["codigoLote"].'",
				  "'.$botones.'",
			      "'.$opciones.'"
			    ],';
			}
		  

		  $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   '] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE RECETAS
=============================================*/ 
$activarRecetas = new TablaRecetas();
$activarRecetas -> mostrarTablaRecetas();

