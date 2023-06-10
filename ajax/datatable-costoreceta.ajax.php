<?php

require_once "../controladores/recetas.controlador.php";
require_once "../modelos/recetas.modelo.php";

class TablaCostoReceta{

 	/*=============================================
 	 MOSTRAR LA TABLA DE COSTO DE RECETA
  	=============================================*/ 

	public function mostrarTablaCostoReceta(){

  		$recetas = ControladorRecetas::ctrMostrarRecetasCerradas();
		
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

			if($_GET["permisoEditar"]==0){
			
			if($recetas[$i]["ocultoAdicional"]==1){
				
			$botones =  "<div class='btn-group'><a class='btn btn-success' href='index.php?ruta=costototal&idReceta=".$recetas[$i]["idReceta"]."&codigo=".$recetas[$i]["codigo"]."'>Costo Total</a><button title='Receta oculta en adicionales' class='btn btn-dark' ><i class='fa fa-lock'></i></button></div>"; 
			
			}else{

			$botones =  "<div class='btn-group'><a class='btn btn-success' href='index.php?ruta=costototal&idReceta=".$recetas[$i]["idReceta"]."&codigo=".$recetas[$i]["codigo"]."'>Costo Total</a></div>"; 
			
		    }
			}else{

			if($recetas[$i]["ocultoAdicional"]==1){

			$botones =  "<div class='btn-group'><a class='btn btn-success' href='index.php?ruta=costototal&idReceta=".$recetas[$i]["idReceta"]."&codigo=".$recetas[$i]["codigo"]."'>Costo Total</a><button title='Receta oculta en adicionales' class='btn btn-dark' ><i class='fa fa-lock'></i></button></div>"; 
			
			}else{

			$botones =  "<div class='btn-group'><a class='btn btn-success' href='index.php?ruta=costototal&idReceta=".$recetas[$i]["idReceta"]."&codigo=".$recetas[$i]["codigo"]."'>Costo Total</a><button title='Receta visible en adicionales' class='btn btn-secondary btnOcultarAdicional' idReceta='".$recetas[$i]["idReceta"]."'><i class='fa fa-lock-open'></i></button></div>"; 
			
			}
			}

			if($recetas[$i]["agregadoAdicional"]==0){
				$agregadoAdicional="<span class='bg-warning btn-sm'>No Asignado</span>";
			}else{
				$agregadoAdicional="<span class='bg-primary btn-sm'>Asignado</span>";
			}
			

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$recetas[$i]["codigo"].'",
			      "'.$recetas[$i]["nombre"].'",
				  "'.$recetas[$i]["batch"].'",
				  "'.$recetas[$i]["fechaFin"].'",
				  "'.$agregadoAdicional.'",
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