<?php

require_once "../controladores/maquinas.controlador.php";

require_once "../modelos/maquinas.modelo.php";


require_once "../controladores/inventariomaquinas.controlador.php";
require_once "../modelos/inventariomaquinas.modelo.php";

require_once "../controladores/kardexmaquinas.controlador.php";
require_once "../modelos/kardexmaquinas.modelo.php";
class TablaMaquinas{

 	/*=============================================
 	 MOSTRAR LA TABLA DE MAQUINAS
  	=============================================*/ 

	public function mostrarTablaMaquinas(){

		$item = null;
    	$valor = null;

  		$maquinas = ControladorMaquinas::ctrMostrarMaquinas($item, $valor);
		  
		if(count($maquinas) == 0){

			echo '{"data": []}';

			return;
		}	
		
  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($maquinas); $i++){

			/*==Botón Editar y Eliminar=*/
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarMaquina' idMaquina='".$maquinas[$i]["idMaquina"]."' data-toggle='modal' data-target='#modalEditarMaquina'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarMaquina' idMaquina='".$maquinas[$i]["idMaquina"]."' codigo='".$maquinas[$i]["codigo"]."'><i class='fa fa-times'></i></button></div>";				
			
		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$maquinas[$i]["codigo"].'",
			      "'.$maquinas[$i]["nombre"].'",
			      "'.$maquinas[$i]["descripcion"].'",
				  "'.$maquinas[$i]["serie"].'",
				  "'.$maquinas[$i]["modelo"].'",
				  "'.$maquinas[$i]["marca"].'",
				  "'.$maquinas[$i]["precio"].'",
				  "'.$maquinas[$i]["añoCompra"].'",
				  "'.$maquinas[$i]["capacidad"].'",
				  "'.$maquinas[$i]["potenciaHP"].'",
				  "'.$maquinas[$i]["vidaUtil"].'",
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
ACTIVAR TABLA DE MAQUINAS
=============================================*/ 
$activarMaquinas = new TablaMaquinas();
$activarMaquinas -> mostrarTablaMaquinas();

