<?php

require_once "../controladores/recetadepreciacion.controlador.php";
require_once "../modelos/recetadepreciacion.modelo.php";

class TablaRecetaDepreciacion{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETA DEPRECIACIÓN
  	=============================================*/ 

	public function mostrarTablaRecetaDepreciacion(){

    	$idRecetaC=$_GET["idRecetaC"];

		$item = "Receta";

  		$recetadepreciacion = ControladorRecetaDepreciacion::ctrMostrarRecetaDepreciacion($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA DEPRECIACIÓN
  		=============================================*/

		$sumatotaldepreciacionreceta = ControladorRecetaDepreciacion::ctrSumaTotalRecetaDepreciacion($idRecetaC);	

		$total = $sumatotaldepreciacionreceta[0];

		if(count($recetadepreciacion) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($recetadepreciacion); $i++){

			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarDepreciacionReceta' idRecetaDepreciacion='".$recetadepreciacion[$i]["idRecetaDepreciacion"]."' data-toggle='modal' data-target='#modalEditarDepreciacion'><i class='fa fa-pen'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){
				
			$botones =  "<div class='btn-group'><button class='btn btn-danger btnEliminarDepreciacionReceta' idRecetaDepreciacion='".$recetadepreciacion[$i]["idRecetaDepreciacion"]."'><i class='fa fa-times'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
				
		    }else{

			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarDepreciacionReceta' idRecetaDepreciacion='".$recetadepreciacion[$i]["idRecetaDepreciacion"]."' data-toggle='modal' data-target='#modalEditarDepreciacion'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarDepreciacionReceta' idRecetaDepreciacion='".$recetadepreciacion[$i]["idRecetaDepreciacion"]."'><i class='fa fa-times'></i></button></div>";				

			}

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$recetadepreciacion[$i]["nombreMaquina"].'",
			      "'.$recetadepreciacion[$i]["tiempoHoras"].'",
				  "'.$recetadepreciacion[$i]["depreciacionHora"].'",
				  "'.$recetadepreciacion[$i]["depreciacionPorBatch"].'",
				  "'.$botones.'"
			    ],';

		  }

		 $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   ',["Total","","","","S/. '.$total.'",""]] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE DEPRECIACIÓN
=============================================*/ 
$activarRecetaDepreciacion = new TablaRecetaDepreciacion();
$activarRecetaDepreciacion -> mostrarTablaRecetaDepreciacion();