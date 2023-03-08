<?php

require_once "../controladores/costooperativo.controlador.php";
require_once "../modelos/costooperativo.modelo.php";

require_once "../controladores/tipocosto.controlador.php";
require_once "../modelos/tipocosto.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

class TablaCostoOperativo{

 	/*=============================================
 	 MOSTRAR LA TABLA DE COSTOS OPERATIVOS
  	=============================================*/ 

	public function mostrarTablaCostoOperativo(){

		$item = null;
    	$valor = null;

  		$costooperativo = ControladorCostoOperativo::ctrMostrarCostoOperativo($item, $valor);	
		
		if(count($costooperativo) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($costooperativo); $i++){
	  

		  	/*=============================================
 	 		TRAEMOS LA TIPO DE COSTO
  			=============================================*/ 

		  	$item = "idTipoCosto";
		  	$valor = $costooperativo[$i]["idTipoCosto"];

		  	$tipocosto = ControladorTipoCosto::ctrMostrarTipoCosto($item, $valor);

			/*=============================================
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$items = "idUnidadMedida";
		  	$valors = $costooperativo[$i]["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($items, $valors);

			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			$botones = "<div class='btn-group'><button class='btn btn-warning btnEditarCostoOperativo' idCostoOperativo='".$costooperativo[$i]["idGastoAdmin"]."' data-toggle='modal' data-target='#modalEditarCostoOperativo'><i class='fa fa-pen'></i></button></div>"; 

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){

			$botones = "<div class='btn-group'><button class='btn btn-danger btnEliminarCostoOperativo' idCostoOperativo='".$costooperativo[$i]["idGastoAdmin"]."'><i class='fa fa-times'></i></button></div>"; 

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
				
		    }else{

			$botones = "<div class='btn-group'><button class='btn btn-warning btnEditarCostoOperativo' idCostoOperativo='".$costooperativo[$i]["idGastoAdmin"]."' data-toggle='modal' data-target='#modalEditarCostoOperativo'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarCostoOperativo' idCostoOperativo='".$costooperativo[$i]["idGastoAdmin"]."'><i class='fa fa-times'></i></button></div>"; 

			}

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$costooperativo[$i]["descripcion"].'",
				  "'.$unidadmedida["descripcion"].'",
			      "'.$costooperativo[$i]["precio"].'",
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
ACTIVAR TABLA DE COSTOS OPERATIVOS
=============================================*/ 
$activarCostoOperativo = new TablaCostoOperativo();
$activarCostoOperativo -> mostrarTablaCostoOperativo();