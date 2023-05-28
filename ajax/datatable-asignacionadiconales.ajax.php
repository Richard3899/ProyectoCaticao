<?php

require_once "../controladores/gastoadminpormes.controlador.php";
require_once "../modelos/gastoadminpormes.modelo.php";

require_once "../controladores/recetas.controlador.php";
require_once "../modelos/recetas.modelo.php";

class TablaRecetaGastoAdminPorMes{

 	/*=============================================
 	 MOSTRAR LA TABLA DE GASTO ADMIN
  	=============================================*/ 

	public function mostrarTablaRecetaGastoAdminPorMes(){

		$idTipoGasto=(!empty($_GET['idTipoGasto'])) ? $_GET['idTipoGasto'] : NULL;
		$idMesGasto=(!empty($_GET['idMesGasto'])) ? $_GET['idMesGasto'] : NULL;
		
		$k=0;
		$index=0;
  		$gastoadminpormes = ControladorGastoAdminPorMes::ctrMostrarGastoAdminPorMesTG($idMesGasto,$idTipoGasto);	
		$recetas = ControladorRecetas::ctrMostrarRecetasCerradas2();	

		if(count($gastoadminpormes) == 0 || count($recetas) == 0){

			echo '{"data": []}';

			return;
		};
           
  		$datosJson = '{
		  "data": [';
		  for($i = 0; $i < count($recetas); $i++){

			if((count($gastoadminpormes)-$k)==1){
				$index=$index+count($gastoadminpormes);
			}
			
			$datosJson .='[';
			$datosJson.='"';
			$datosJson.=($i+1);
			$datosJson.='"';
			$datosJson .=',';
			$datosJson.='"';
			$datosJson.=$recetas[$i]["codigo"];
			$datosJson.='"';
			$datosJson .=',';

			for($k = 0; $k < count($gastoadminpormes); $k++){	
				$index++;
				$datosJson.='"';
				$datosJson.="<input index='".$index."' id='".$gastoadminpormes[$k]["idGastoAdminPorMes"]."' idMesGasto='".$gastoadminpormes[$k]["idMesGasto"]."' idReceta='".$recetas[$i]["idReceta"]."' idGastoAdmin='".$gastoadminpormes[$k]["idGastoAdmin"]."' idTipoGasto='".$gastoadminpormes[$k]["idTipoGasto"]."' class='checkGastos' type='checkbox' value='".$gastoadminpormes[$k]["idGastoAdminPorMes"]."'>";
				if( (count($gastoadminpormes)-$k) ==1){
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
$activarGastoAdmin = new TablaRecetaGastoAdminPorMes();
$activarGastoAdmin -> mostrarTablaRecetaGastoAdminPorMes();