<?php

require_once "../controladores/gastoadmin.controlador.php";
require_once "../modelos/gastoadmin.modelo.php";

require_once "../controladores/tipocosto.controlador.php";
require_once "../modelos/tipocosto.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

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
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/ 

		  	$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarGastoAdmin' idGastoAdmin='".$gastoadmin[$i]["idGastoAdmin"]."' data-toggle='modal' data-target='#modalEditarGastoAdmin'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarGastoAdmin' idGastoAdmin='".$gastoadmin[$i]["idGastoAdmin"]."'><i class='fa fa-times'></i></button></div>"; 

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$gastoadmin[$i]["descripcion"].'",
				  "'.$unidadmedida["descripcion"].'",
			      "'."S/. ".$gastoadmin[$i]["precio"].'",
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
ACTIVAR TABLA DE GASTO ADMIN
=============================================*/ 
$activarGastoAdmin = new TablaGastoAdmin();
$activarGastoAdmin -> mostrarTablaGastoAdmin();