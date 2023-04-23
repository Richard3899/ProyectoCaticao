<?php

require_once "../controladores/recetas.controlador.php";
require_once "../modelos/recetas.modelo.php";

class TablaCostoReceta{

 	/*=============================================
 	 MOSTRAR LA TABLA DE COSTO DE RECETA
  	=============================================*/ 

	public function mostrarTablaCostoReceta(){

		$item = null;
    	$valor = null;

  		$recetas = ControladorRecetas::ctrMostrarRecetas($item, $valor);
		
		if(count($recetas) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($recetas); $i++){
	  
		  	/*=============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/ 

		  	$botones =  "<div class='btn-group'><a class='btn btn-success' href='index.php?ruta=costototal&idReceta=".$recetas[$i]["idReceta"]."&codigo=".$recetas[$i]["codigo"]."'>Costo Total</a></div>"; 

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$recetas[$i]["codigo"].'",
			      "'.$recetas[$i]["nombre"].'",
				  "'.$recetas[$i]["batch"].'",
				  "'.$recetas[$i]["fechaFin"].'",
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
ACTIVAR TABLA DE COSTO DE RECETA
=============================================*/ 
$activarCostoReceta = new TablaCostoReceta();
$activarCostoReceta -> mostrarTablaCostoReceta();