<?php
require_once "../controladores/marcas.controlador.php";
require_once "../modelos/marcas.modelo.php";

require_once "../controladores/insumos.controlador.php";
require_once "../modelos/insumos.modelo.php";

require_once "../controladores/materiales.controlador.php";
require_once "../modelos/materiales.modelo.php";

class TablaMarcas{

 	/*=============================================
 	 MOSTRAR LA TABLA DE MARCAS
  	=============================================*/ 

	public function mostrarTablaMarcas(){

		$item = null;
    	$valor = null;

  		$marcas = ControladorMarcas::ctrMostrarMarcas($item, $valor);	

		if(count($marcas) == 0){

			echo '{"data": []}';

			return;
		}		
		
  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($marcas); $i++){


		  	$item2 = "idMarca";
		  	$valor2 = $marcas[$i]["idMarca"];

		  	$insumos = ControladorInsumos::ctrMostrarInsumos($item2, $valor2);
  
			$v1=$insumos['idMarca'] ?? 'usado';

			$materiales = ControladorMateriales::ctrMostrarMateriales($item2, $valor2);
  
			$v2=$materiales['idMarca'] ?? 'usado';


		  	/*=============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/
		  	
			if($v1!="usado" ||  $v2!="usado"){

				$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarMarca' idMarca='".$marcas[$i]["idMarca"]."' data-toggle='modal' data-target='#modalEditarMarca'><i class='fa fa-pen'></i></button></div>"; 
				
			}else{

				$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarMarca' idMarca='".$marcas[$i]["idMarca"]."' data-toggle='modal' data-target='#modalEditarMarca'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarMarca' idMarca='".$marcas[$i]["idMarca"]."' descripcion='".$marcas[$i]["descripcion"]."'><i class='fa fa-times'></i></button></div>"; 
				
			}
			
			$datosJson .='[
			      "'.($i+1).'",
			      "'.$marcas[$i]["descripcion"].'",
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
ACTIVAR TABLA DE MARCAS
=============================================*/ 
$activarMarcas = new TablaMarcas();
$activarMarcas -> mostrarTablaMarcas();

