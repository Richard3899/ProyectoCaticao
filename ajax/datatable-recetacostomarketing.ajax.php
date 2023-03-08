<?php

require_once "../controladores/recetacostomarketing.controlador.php";
require_once "../modelos/recetacostomarketing.modelo.php";

class TablaRecetaCostoMarketing{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETA COSTO DE MARKETING
  	=============================================*/ 

	public function mostrarTablaRecetaCostoMarketing(){

    	$idRecetaC=$_GET["idRecetaC"];

		$item = "Receta";

  		$recetacostomarketing = ControladorRecetaCostoMarketing::ctrMostrarRecetaCostoMarketing($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA COSTO DE MARKETING
  		=============================================*/

		$sumatotalcostomarketingreceta = ControladorRecetaCostoMarketing::ctrSumaTotalRecetaCostoMarketing($idRecetaC);	

		$total = $sumatotalcostomarketingreceta[0];

		if(count($recetacostomarketing) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($recetacostomarketing); $i++){
			
			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarCostoMarketingReceta' idRecetaCostoMarketing='".$recetacostomarketing[$i]["idRecetaCostoMarketing"]."' data-toggle='modal' data-target='#modalEditarCostoMarketing'><i class='fa fa-pen'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){

			$botones =  "<div class='btn-group'><button class='btn btn-danger btnEliminarCostoMarketingReceta' idRecetaCostoMarketing='".$recetacostomarketing[$i]["idRecetaCostoMarketing"]."'><i class='fa fa-times'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
				
		    }else{

			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarCostoMarketingReceta' idRecetaCostoMarketing='".$recetacostomarketing[$i]["idRecetaCostoMarketing"]."' data-toggle='modal' data-target='#modalEditarCostoMarketing'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarCostoMarketingReceta' idRecetaCostoMarketing='".$recetacostomarketing[$i]["idRecetaCostoMarketing"]."'><i class='fa fa-times'></i></button></div>";				

			}

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$recetacostomarketing[$i]["nombreCostoMarketing"].'",
			      "'.$recetacostomarketing[$i]["cantidad"].'",
				  "'.$recetacostomarketing[$i]["precio"].'",
				  "'.$recetacostomarketing[$i]["total"].'",
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
ACTIVAR TABLA DE COSTO DE MARKETING
=============================================*/ 
$activarRecetaCostoMarketing = new TablaRecetaCostoMarketing();
$activarRecetaCostoMarketing -> mostrarTablaRecetaCostoMarketing();