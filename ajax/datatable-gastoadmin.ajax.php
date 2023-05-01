<?php

require_once "../controladores/gastoadmin.controlador.php";
require_once "../modelos/gastoadmin.modelo.php";

require_once "../controladores/tipocosto.controlador.php";
require_once "../modelos/tipocosto.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

require_once "../controladores/tipogasto.controlador.php";
require_once "../modelos/tipogasto.modelo.php";

class TablaGastoAdmin{

 	/*=============================================
 	 MOSTRAR LA TABLA DE GASTO ADMIN
  	=============================================*/ 

	public function mostrarTablaGastoAdmin(){

		$item = null;
    	$valor = null;

  		$gastoadmin = ControladorGastoAdmin::ctrMostrarGastoAdmin($item, $valor);	
		
		if(count($gastoadmin) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($gastoadmin); $i++){
	  

		  	/*=============================================
 	 		TRAEMOS LA TIPO DE COSTO
  			=============================================*/ 

		  	$item = "idTipoCosto";
		  	$valor = $gastoadmin[$i]["idTipoCosto"];

		  	$tipocosto = ControladorTipoCosto::ctrMostrarTipoCosto($item, $valor);

			/*=============================================
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$items = "idUnidadMedida";
		  	$valors = $gastoadmin[$i]["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($items, $valors);

			/*=============================================
 	 		TRAEMOS EL TIPO DE GASTO
  			=============================================*/ 

		  	$item3 = "idTipoGasto";
		  	$valor3 = $gastoadmin[$i]["idTipoGasto"];

		  	$tipogasto = ControladorTipoGasto::ctrMostrarTipoGasto($item3, $valor3);

			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			$botones =  "<div class='btn-group'><button title='Editar' class='btn btn-warning btnEditarGastoAdmin' idGastoAdmin='".$gastoadmin[$i]["idGastoAdmin"]."' data-toggle='modal' data-target='#modalEditarGastoAdmin'><i class='fa fa-pen'></i></button></div>"; 

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){

			$botones =  "<div class='btn-group'><button title='Eliminar' class='btn btn-danger btnEliminarGastoAdmin' idGastoAdmin='".$gastoadmin[$i]["idGastoAdmin"]."'><i class='fa fa-times'></i></button></div>"; 

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
				
		    }else{

			$botones =  "<div class='btn-group'><button title='Editar' class='btn btn-warning btnEditarGastoAdmin' idGastoAdmin='".$gastoadmin[$i]["idGastoAdmin"]."' data-toggle='modal' data-target='#modalEditarGastoAdmin'><i class='fa fa-pen'></i></button><button title='Eliminar' class='btn btn-danger btnEliminarGastoAdmin' idGastoAdmin='".$gastoadmin[$i]["idGastoAdmin"]."'><i class='fa fa-times'></i></button></div>"; 

			}

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$gastoadmin[$i]["codigo"].'",
			      "'.$gastoadmin[$i]["descripcion"].'",
				  "'.$unidadmedida["descripcion"].'",
				  "'.$tipocosto["descripcion"].'",
				  "'.$tipogasto["descripcion"].'",
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
ACTIVAR TABLA DE GASTO ADMIN
=============================================*/ 
$activarGastoAdmin = new TablaGastoAdmin();
$activarGastoAdmin -> mostrarTablaGastoAdmin();