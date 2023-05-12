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

		$idTipoGasto=(!empty($_GET['idTipoGasto'])) ? $_GET['idTipoGasto'] : NULL;

		$item = null;
    	$valor = null;

  		$gastoadmin = ControladorGastoAdmin::ctrMostrarGastoAdmin2($idTipoGasto);	
		$recetas = ControladorRecetas::ctrMostrarRecetas($item, $valor);	

		if(count($gastoadmin) == 0 || count($recetas) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';
		  for($i = 0; $i < count($recetas); $i++){

			$datosJson .='[';
			$datosJson.='"';
			$datosJson.=$recetas[$i]["codigo"];
			$datosJson.='"';
			$datosJson .=',';

			for($k = 0; $k < count($gastoadmin); $k++){	
				$datosJson.='"';
				$datosJson.="<input id='".$gastoadmin[$k]["idGastoAdmin"]."' idReceta='".$recetas[$i]["idReceta"]."'  class='checkGastos' type='checkbox' value='".$gastoadmin[$k]["idGastoAdmin"]."'>";
				if( (count($gastoadmin)-$k) ==1){
				  $datosJson.='"';
				}else{
				  $datosJson.='",';
				}
			}

			$datosJson .='],';

		  }

		 $datosJson = substr($datosJson, 0, -1);

		 $datosJson .= '] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE GASTO ADMIN
=============================================*/ 
$activarGastoAdmin = new TablaGastoAdmin();
$activarGastoAdmin -> mostrarTablaGastoAdmin();