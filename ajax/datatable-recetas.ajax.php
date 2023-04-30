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
 	 		BOTÓN PARA VER DETALLES
  			=============================================*/
			$detalle =  "<button title='Detalle de la Receta' class='btn btn-info btnDetalleReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoLote='".$recetas[$i]["codigoLote"]."'  data-toggle='modal' data-target='#modalDetalleReceta' ><i class='fa fa-eye'></i></button>";
		  	
			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			if($recetas[$i]["cerrado"]==1){
				
			$botones = "<div class='btn-group'><button title='Duplicar Receta' class='btn btn-success btnDuplicarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoReceta='".$recetas[$i]["codigo"]."' codigoLote='".$recetas[$i]["codigoLote"]."'  data-toggle='modal' data-target='#modalDuplicarReceta' ><i class='fa fa-clone'></i></button><button title='Receta Cerrada' class='btn btn-info'><i class='fa fa-lock'></i></button></div>";
			$opciones ="<button title='Agregar Costos' class='btn btn-secondary'><i class='fas fa-caret-left'></i></button>";
			
		    }else{

			$botones =  "<div class='btn-group'><button title='Duplicar Receta' class='btn btn-success btnDuplicarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoReceta='".$recetas[$i]["codigo"]."' codigoLote='".$recetas[$i]["codigoLote"]."'  data-toggle='modal' data-target='#modalDuplicarReceta' ><i class='fa fa-clone'></i></button><button title='Editar' class='btn btn-warning btnEditarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoLote='".$recetas[$i]["codigoLote"]."' data-toggle='modal' data-target='#modalEditarReceta'><i class='fa fa-pen'></i></button><button title='Cerrar Receta' class='btn btn-success btnCerrarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoLote='".$recetas[$i]["codigoLote"]."' cantidadTabletas='".$recetas[$i]["cantidadTabletas"]."' idEstado='".$recetas[$i]["idEstado"]."'><i class='fa fa-lock'></i></button></div>";
			$opciones = "<div class='btn-group dropleft'><button title='Agregar Costos' type='button' class='btn btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'><i lass='fas fa-ellipsis-v'></i></button><div class='dropdown-menu' aria-labelledby='dropdownMenuButton'><a class='dropdown-item' href='index.php?ruta=recetainsumos&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Insumo</a><a class='dropdown-item' href='index.php?ruta=recetamateriales&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Material</a><a class='dropdown-item' href='index.php?ruta=recetamanodeobra&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Mano de Obra</a><a class='dropdown-item' href='index.php?ruta=recetadepreciacion&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Depreciación</a><a class='dropdown-item' href='index.php?ruta=recetaconsumoenergia&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Consumo de Energía</a><a class='dropdown-item' href='index.php?ruta=recetaconsumogas&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Consumo de Gas</a><a class='dropdown-item' href='index.php?ruta=recetacostoventa&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo de Venta</a><a class='dropdown-item' href='index.php?ruta=recetacostomarketing&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo de Marketing</a><a class='dropdown-item' href='index.php?ruta=recetacostooperativo&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo Operativo</a></div></div>";
	
		    }
			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){

			if($recetas[$i]["cerrado"]==1){

			$botones = "<div class='btn-group'><button title='Duplicar Receta' class='btn btn-success'><i class='fa fa-clone'></i></button><button title='Receta Cerrada' class='btn btn-info'><i class='fa fa-lock'></i></button></div>";
			$opciones ="<button title='Agregar Costos' class='btn btn-secondary'><i class='fas fa-caret-left'></i></button>";

		    }else{

			$botones =  "<div class='btn-group'><button title='Duplicar Receta' class='btn btn-success'><i class='fa fa-clone'></i></button><button title='Eliminar' class='btn btn-danger btnEliminarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoReceta='".$recetas[$i]["codigo"]."' codigoLote='".$recetas[$i]["codigoLote"]."'><i class='fa fa-times'></i></button></div>";
			$opciones = "<div class='btn-group dropleft'><button title='Agregar Costos' type='button' class='btn btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'><i lass='fas fa-ellipsis-v'></i></button><div class='dropdown-menu' aria-labelledby='dropdownMenuButton'><a class='dropdown-item' href='index.php?ruta=recetainsumos&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Insumo</a><a class='dropdown-item' href='index.php?ruta=recetamateriales&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Material</a><a class='dropdown-item' href='index.php?ruta=recetamanodeobra&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Mano de Obra</a><a class='dropdown-item' href='index.php?ruta=recetadepreciacion&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Depreciación</a><a class='dropdown-item' href='index.php?ruta=recetaconsumoenergia&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Consumo de Energía</a><a class='dropdown-item' href='index.php?ruta=recetaconsumogas&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Consumo de Gas</a><a class='dropdown-item' href='index.php?ruta=recetacostoventa&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo de Venta</a><a class='dropdown-item' href='index.php?ruta=recetacostomarketing&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo de Marketing</a><a class='dropdown-item' href='index.php?ruta=recetacostooperativo&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo Operativo</a></div></div>";
		    }

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			if($recetas[$i]["cerrado"]==1){

			$botones = "<button title='Receta Cerrada' class='btn btn-info'><i class='fa fa-lock'></i></button>";
			$opciones ="<button title='Agregar Costos' class='btn btn-secondary'><i class='fas fa-caret-left'></i></button>";

		    }else{

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
			$opciones = "<div class='btn-group dropleft'><button title='Agregar Costos' type='button' class='btn btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'><i lass='fas fa-ellipsis-v'></i></button><div class='dropdown-menu' aria-labelledby='dropdownMenuButton'><a class='dropdown-item' href='index.php?ruta=recetainsumos&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Insumo</a><a class='dropdown-item' href='index.php?ruta=recetamateriales&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Material</a><a class='dropdown-item' href='index.php?ruta=recetamanodeobra&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Mano de Obra</a><a class='dropdown-item' href='index.php?ruta=recetadepreciacion&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Depreciación</a><a class='dropdown-item' href='index.php?ruta=recetaconsumoenergia&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Consumo de Energía</a><a class='dropdown-item' href='index.php?ruta=recetaconsumogas&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Consumo de Gas</a><a class='dropdown-item' href='index.php?ruta=recetacostoventa&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo de Venta</a><a class='dropdown-item' href='index.php?ruta=recetacostomarketing&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo de Marketing</a><a class='dropdown-item' href='index.php?ruta=recetacostooperativo&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo Operativo</a></div></div>";
		    }

		    }else{

			if($recetas[$i]["cerrado"]==1){

			$botones = "<div class='btn-group'><button title='Duplicar Receta' class='btn btn-success btnDuplicarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoReceta='".$recetas[$i]["codigo"]."' codigoLote='".$recetas[$i]["codigoLote"]."'  data-toggle='modal' data-target='#modalDuplicarReceta' ><i class='fa fa-clone'></i></button><button title='Receta Cerrada' class='btn btn-info'><i class='fa fa-lock'></i></button></div>";
			$opciones ="<button title='Agregar Costos' class='btn btn-secondary'><i class='fas fa-caret-left'></i></button>";
			
		    }else{

			$botones =  "<div class='btn-group'><button title='Duplicar Receta' class='btn btn-success btnDuplicarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoReceta='".$recetas[$i]["codigo"]."' codigoLote='".$recetas[$i]["codigoLote"]."'  data-toggle='modal' data-target='#modalDuplicarReceta' ><i class='fa fa-clone'></i></button><button title='Editar' class='btn btn-warning btnEditarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoLote='".$recetas[$i]["codigoLote"]."' data-toggle='modal' data-target='#modalEditarReceta'><i class='fa fa-pen'></i></button><button title='Eliminar' class='btn btn-danger btnEliminarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoReceta='".$recetas[$i]["codigo"]."' codigoLote='".$recetas[$i]["codigoLote"]."'><i class='fa fa-times'></i></button><button title='Cerrar Receta' class='btn btn-success btnCerrarReceta' idReceta='".$recetas[$i]["idReceta"]."' codigoLote='".$recetas[$i]["codigoLote"]."' cantidadTabletas='".$recetas[$i]["cantidadTabletas"]."' idEstado='".$recetas[$i]["idEstado"]."'><i class='fa fa-lock'></i></button></div>";
			$opciones = "<div class='btn-group dropleft'><button title='Agregar Costos' type='button' class='btn btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'><i lass='fas fa-ellipsis-v'></i></button><div class='dropdown-menu' aria-labelledby='dropdownMenuButton'><a class='dropdown-item' href='index.php?ruta=recetainsumos&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Insumo</a><a class='dropdown-item' href='index.php?ruta=recetamateriales&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Material</a><a class='dropdown-item' href='index.php?ruta=recetamanodeobra&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Mano de Obra</a><a class='dropdown-item' href='index.php?ruta=recetadepreciacion&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Depreciación</a><a class='dropdown-item' href='index.php?ruta=recetaconsumoenergia&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Consumo de Energía</a><a class='dropdown-item' href='index.php?ruta=recetaconsumogas&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Consumo de Gas</a><a class='dropdown-item' href='index.php?ruta=recetacostoventa&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo de Venta</a><a class='dropdown-item' href='index.php?ruta=recetacostomarketing&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo de Marketing</a><a class='dropdown-item' href='index.php?ruta=recetacostooperativo&codigo=".$recetas[$i]["codigo"]."&nombre=".$recetas[$i]["nombre"]."&idReceta=".$recetas[$i]["idReceta"]."';>Agregar Costo Operativo</a></div></div>";
			
		    }
			}
		
			$datosJson .='[
			      "'.($i+1).'",
			      "'.$recetas[$i]["codigo"].'",
				  "'.$recetas[$i]["nombre"].'",
				  "'.$productos["nombre"].'",
				  "'.$recetas[$i]["batch"].'",
				  "'.$estado.'",
				  "'.$detalle.'",
			      "'.$opciones.'",
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
ACTIVAR TABLA DE RECETAS
=============================================*/ 
$activarRecetas = new TablaRecetas();
$activarRecetas -> mostrarTablaRecetas();

