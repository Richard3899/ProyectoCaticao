<?php

require_once "../controladores/recetainsumos.controlador.php";
require_once "../modelos/recetainsumos.modelo.php";

class TablaRecetaInsumos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETA INSUMOS
  	=============================================*/ 

	public function mostrarTablaRecetaInsumos(){

    	$idRecetaC=$_GET["idRecetaC"];

		$item = "Receta";

  		$insumosreceta = ControladorRecetaInsumos::ctrMostrarRecetaInsumos($item,$idRecetaC);	

		/*=============================================
 	 	TRAEMOS EL TOTAL DE RECETA INSUMOS
  		=============================================*/

		$sumatotalinsumosreceta = ControladorRecetaInsumos::ctrSumaTotalRecetaInsumos($idRecetaC);	

		$total = $sumatotalinsumosreceta[0];

		if(count($insumosreceta) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($insumosreceta); $i++){
			
			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarInsumoReceta' idRecetaInsumo='".$insumosreceta[$i]["idRecetaMateria"]."' data-toggle='modal' data-target='#modalEditarInsumo'><i class='fa fa-pen'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){
				
			$botones =  "<div class='btn-group'><button class='btn btn-danger btnEliminarInsumoReceta' idRecetaInsumo='".$insumosreceta[$i]["idRecetaMateria"]."' idInsumo='".$insumosreceta[$i]["idMateria"]."'><i class='fa fa-times'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
				
		    }else{

			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarInsumoReceta' idRecetaInsumo='".$insumosreceta[$i]["idRecetaMateria"]."' data-toggle='modal' data-target='#modalEditarInsumo'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarInsumoReceta' idRecetaInsumo='".$insumosreceta[$i]["idRecetaMateria"]."' idInsumo='".$insumosreceta[$i]["idMateria"]."'><i class='fa fa-times'></i></button></div>";				

			}

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$insumosreceta[$i]["nombre"].'",
			      "'.$insumosreceta[$i]["cantidad"].'",
				  "'.$insumosreceta[$i]["precioUnitario"].'",
				  "'.$insumosreceta[$i]["total"].'",
				  "'.$botones.'"
			    ],';

		  }

		  $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   ',["Total","","","","'.$total.'",""]] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE INSUMOS
=============================================*/ 
$activarRecetaInsumos = new TablaRecetaInsumos();
$activarRecetaInsumos -> mostrarTablaRecetaInsumos();