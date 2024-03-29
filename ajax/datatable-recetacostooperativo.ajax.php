<?php

require_once "../controladores/recetacostooperativo.controlador.php";
require_once "../modelos/recetacostooperativo.modelo.php";

class TablaRecetaCostoOperativo{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETA COSTO OPERATIVO
  	=============================================*/ 

	public function mostrarTablaRecetaCostoOperativo(){

    	$idRecetaC=$_GET["idRecetaC"];

		$item = "Receta";

  		$recetacostooperativo = ControladorRecetaCostoOperativo::ctrMostrarRecetaCostoOperativo($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA COSTO OPERATIVO
  		=============================================*/

		$sumatotalcostooperativoreceta = ControladorRecetaCostoOperativo::ctrSumaTotalRecetaCostoOperativo($idRecetaC);	

		$total = $sumatotalcostooperativoreceta[0];

		if(count($recetacostooperativo) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($recetacostooperativo); $i++){
			
			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarCostoOperativoReceta' idRecetaCostoOperativo='".$recetacostooperativo[$i]["idRecetaCostoOperativo"]."' data-toggle='modal' data-target='#modalEditarCostoOperativo'><i class='fa fa-pen'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){
				
			$botones =  "<div class='btn-group'><button class='btn btn-danger btnEliminarCostoOperativoReceta' idRecetaCostoOperativo='".$recetacostooperativo[$i]["idRecetaCostoOperativo"]."'><i class='fa fa-times'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
				
		    }else{

			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarCostoOperativoReceta' idRecetaCostoOperativo='".$recetacostooperativo[$i]["idRecetaCostoOperativo"]."' data-toggle='modal' data-target='#modalEditarCostoOperativo'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarCostoOperativoReceta' idRecetaCostoOperativo='".$recetacostooperativo[$i]["idRecetaCostoOperativo"]."'><i class='fa fa-times'></i></button></div>";				

			}

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$recetacostooperativo[$i]["nombreCostoOperativo"].'",
			      "'.$recetacostooperativo[$i]["cantidad"].'",
				  "'.$recetacostooperativo[$i]["precio"].'",
				  "'.$recetacostooperativo[$i]["total"].'",
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
ACTIVAR TABLA DE COSTO OPERATIVO
=============================================*/ 
$activarRecetaCostoOperativo = new TablaRecetaCostoOperativo();
$activarRecetaCostoOperativo -> mostrarTablaRecetaCostoOperativo();