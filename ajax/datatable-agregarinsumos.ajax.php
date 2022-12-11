<?php

require_once "../controladores/agregarinsumos.controlador.php";
require_once "../modelos/agregarinsumos.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

class TablaAgregarInsumos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE INSUMOS
  	=============================================*/ 

	public function mostrarTablaAgregarInsumos(){

    	$idRecetaC=$_GET["idRecetaC"];

		$item = "Receta";
         
  		$insumosreceta = ControladorAgregarInsumos::ctrMostrarAgregarInsumos($item,$idRecetaC);	

		if(count($insumosreceta) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($insumosreceta); $i++){
			
			/*==Botón Editar y Eliminar=*/
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarInsumoReceta' idInsumoReceta='".$insumosreceta[$i]["idRecetaMateria"]."' data-toggle='modal' data-target='#modalEditarInsumo'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarInsumoReceta' idRecetaInsumo='".$insumosreceta[$i]["idRecetaMateria"]."' idInsumo='".$insumosreceta[$i]["idMateria"]."' cantidadInsumo='".$insumosreceta[$i]["cantidad"]."' ><i class='fa fa-times'></i></button></div>";				
				
		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$insumosreceta[$i]["nombre"].'",
			      "'.$insumosreceta[$i]["cantidad"]." ".$insumosreceta[$i]["unidadMedida"].'",
				  "'.$insumosreceta[$i]["precioUnitario"].'",
				  "'.$insumosreceta[$i]["total"].'",
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
ACTIVAR TABLA DE INSUMOS
=============================================*/ 
$activarAgregarInsumos = new TablaAgregarInsumos();
$activarAgregarInsumos -> mostrarTablaAgregarInsumos();