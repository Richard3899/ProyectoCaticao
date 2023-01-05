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


			if($estados["idEstado"]==1){
				$estado =  "<button class='btn btn-success'>".$estados["descripcion"]."</button>";				
			}else if($estados["idEstado"]==2){
				$estado =  "<button class='btn btn-primary'>".$estados["descripcion"]."</button>";	
			}else{
				$estado =  "<button class='btn btn-danger'>".$estados["descripcion"]."</button>";
			}
		  	/*=============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoLote='".$recetas[$i]["codigoLote"]."' data-toggle='modal' data-target='#modalEditarReceta'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoLote='".$recetas[$i]["codigoLote"]."'><i class='fa fa-times'></i></button></div>";				
			
			/*=============================================
 	 		TRAEMOS LAS OPCIONES
  			=============================================*/
			$opciones = "<div class='btn-group dropleft'><button type='button' class='btn btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'><i lass='fas fa-ellipsis-v'></i></button><div class='dropdown-menu' aria-labelledby='dropdownMenuButton'><a class='dropdown-item' href='index.php?ruta=recetainsumos&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Insumo</a><a class='dropdown-item' href='index.php?ruta=recetamateriales&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Material</a><a class='dropdown-item' href='index.php?ruta=recetamanodeobra&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Mano de Obra</a><a class='dropdown-item' href='index.php?ruta=recetadepreciacion&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Depreciación</a><a class='dropdown-item' href='index.php?ruta=recetaconsumoenergia&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Consumo de Energía</a><a class='dropdown-item' href='index.php?ruta=recetaconsumogas&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Consumo de Gas</a><a class='dropdown-item' href='index.php?ruta=recetacostoventa&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo de Venta</a><a class='dropdown-item' href='index.php?ruta=recetacostomarketing&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo de Marketing</a><a class='dropdown-item' href='index.php?ruta=recetacostooperativo&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo Operativo</a></div></div>";
			
			/*=============================================
 	 		DESIGNAR ID A RECETA DUPLICADA
  			=============================================*/
			$CantidadId=count($recetas)-1;
			$NuevoId=$recetas[$CantidadId]["idReceta"]+1;
			
			/*=============================================
 	 		BOTÓN PARA DUPLICAR
  			=============================================*/
			$duplicar =  "<div class='btn-group'><button class='btn btn-success btnDuplicarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoReceta='".$recetas[$i]["codigo"]."' codigoLote='".$recetas[$i]["codigoLote"]."' nuevoIdReceta='".$NuevoId."'  data-toggle='modal' data-target='#modalDuplicarReceta' ><i class='fa fa-clone'></i></button></div>";
		  	
			$datosJson .='[
			      "'.($i+1).'",
			      "'.$recetas[$i]["codigo"].'",
				  "'.$recetas[$i]["nombre"].'",
				  "'.$productos["nombre"].'",
				  "'.$recetas[$i]["batch"].'",
				  "'.$estado.'",
				  "'.$lotes["codigoLote"].'",
				  "'.$botones.'",
				  "'.$duplicar.'",
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

