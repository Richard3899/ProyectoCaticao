<?php

require_once "../controladores/gastoadmin.controlador.php";
require_once "../modelos/gastoadmin.modelo.php";

require_once "../controladores/recetas.controlador.php";
require_once "../modelos/recetas.modelo.php";

class TablaGastoAdmin{

 	/*=============================================
 	 MOSTRAR LA TABLA DE GASTO ADMIN
  	=============================================*/ 

	public function mostrarTablaGastoAdmin(){

		$item = null;
    	$valor = null;

  		$gastoadmin = ControladorGastoAdmin::ctrMostrarGastoAdmin($item, $valor);	
		$recetas = ControladorRecetas::ctrMostrarRecetas($item, $valor);	

		if(count($gastoadmin) == 0 || count($recetas) == 0 ){

			echo '{"data": []}';

			return;
		}

		$checkI='';

		for($i = 1; $i < count($gastoadmin); $i++){
		  $checkI.='"';
		  $checkI.="<input type='checkbox' id='cbox1' value='first_checkbox'>";
		  $checkI.='",';
		}

		if(count($gastoadmin)>1){
		  $checkI.='"';
		  $checkI.="<input type='checkbox' id='cbox1' value='first_checkbox'>";
		  $checkI.='"';
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($recetas); $i++){
			
		  	$datosJson .='[
			      "'.($recetas[$i]["codigo"]).'",
				  '.$checkI.'
		
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