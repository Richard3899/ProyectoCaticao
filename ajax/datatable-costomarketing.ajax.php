<?php

require_once "../controladores/costomarketing.controlador.php";
require_once "../modelos/costomarketing.modelo.php";

require_once "../controladores/tipocosto.controlador.php";
require_once "../modelos/tipocosto.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

class TablaCostoMarketing{

 	/*=============================================
 	 MOSTRAR LA TABLA DE COSTOS DE MARKETING
  	=============================================*/ 

	public function mostrarTablaCostoMarketing(){

		$item = null;
    	$valor = null;

  		$costomarketing = ControladorCostoMarketing::ctrMostrarCostoMarketing($item, $valor);	
		
		if(count($costomarketing) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($costomarketing); $i++){
	  

		  	/*=============================================
 	 		TRAEMOS LA TIPO DE COSTO
  			=============================================*/ 

		  	$item = "idTipoCosto";
		  	$valor = $costomarketing[$i]["idTipoCosto"];

		  	$tipocosto = ControladorTipoCosto::ctrMostrarTipoCosto($item, $valor);

			/*=============================================
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$items = "idUnidadMedida";
		  	$valors = $costomarketing[$i]["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($items, $valors);

			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarCostoMarketing' idCostoMarketing='".$costomarketing[$i]["idGastoAdmin"]."' data-toggle='modal' data-target='#modalEditarCostoMarketing'><i class='fa fa-pen'></i></button></div>"; 

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){

			$botones =  "<div class='btn-group'><button class='btn btn-danger btnEliminarCostoMarketing' idCostoMarketing='".$costomarketing[$i]["idGastoAdmin"]."'><i class='fa fa-times'></i></button></div>"; 

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
				
		    }else{

			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarCostoMarketing' idCostoMarketing='".$costomarketing[$i]["idGastoAdmin"]."' data-toggle='modal' data-target='#modalEditarCostoMarketing'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarCostoMarketing' idCostoMarketing='".$costomarketing[$i]["idGastoAdmin"]."'><i class='fa fa-times'></i></button></div>"; 

			}

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$costomarketing[$i]["descripcion"].'",
				  "'.$unidadmedida["descripcion"].'",
			      "'."S/. ".$costomarketing[$i]["precio"].'",
				  "'.$tipocosto["descripcion"].'",
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
ACTIVAR TABLA DE COSTOS DE MARKETING
=============================================*/ 
$activarCostoMarketing = new TablaCostoMarketing();
$activarCostoMarketing -> mostrarTablaCostoMarketing();