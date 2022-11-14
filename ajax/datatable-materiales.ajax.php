<?php

require_once "../controladores/materiales.controlador.php";
require_once "../modelos/materiales.modelo.php";

require_once "../controladores/marcas.controlador.php";
require_once "../modelos/marcas.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

require_once "../controladores/inventariomateriales.controlador.php";
require_once "../modelos/inventariomateriales.modelo.php";

require_once "../controladores/kardexmateriales.controlador.php";
require_once "../modelos/kardexmateriales.modelo.php";

class TablaMateriales{

 	/*=============================================
 	 MOSTRAR LA TABLA DE MATERIALES
  	=============================================*/ 

	public function mostrarTablaMateriales(){

		$item = null;
    	$valor = null;

  		$materiales = Controladormateriales::ctrMostrarMateriales($item, $valor);	
		
		if(count($materiales) == 0){

			echo '{"data": []}';

			return;
		}
		
  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($materiales); $i++){

		  	/*=============================================
 	 		TRAEMOS LA IMAGEN
  			=============================================*/ 
			  if($materiales[$i]["imagen"] != ""){

				$imagen = "<img src='".$materiales[$i]["imagen"]."' width='40px'>";

			  }else{

				$imagen = "<img src='vistas/img/materiales/default/material.png' class='img-thumbnail' width='40px'>";

			  };
			  

		  	/*=============================================
 	 		TRAEMOS LA MARCA
  			=============================================*/ 

		  	$item = "idMarca";
		  	$valor = $materiales[$i]["idMarca"];

		  	$marcas = ControladorMarcas::ctrMostrarMarcas($item, $valor);

			/*=============================================
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$items = "idUnidadMedida";
		  	$valors = $materiales[$i]["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($items, $valors);



			$item2 = "idMateria";
		  	$valor2 = $materiales[$i]["idMateria"];


			/*=============================================
 	 		TRAEMOS AL INVENTARIO MATERIALES
  			=============================================*/ 
		  	$inventariomateriales = ControladorInventarioMateriales::ctrMostrarInventarioMateriales($item2, $valor2);
  
			$v1=$inventariomateriales['idMateria'] ?? 'usado';
			/*=============================================
 	 		TRAEMOS A KARDEX MATERIALES
  			=============================================*/ 

			$kardexmateriales = ControladorKardexMateriales::ctrMostrarKardexMateriales($item2, $valor2);
  
			$v2=$kardexmateriales['idMateria'] ?? 'usado';


		  	/*=============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/
		  	
			if($v1!="usado" ||  $v2!="usado"){
            /*==Botón Editar=*/
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarMaterial' idMaterial='".$materiales[$i]["idMateria"]."' data-toggle='modal' data-target='#modalEditarMaterial'><i class='fa fa-pen'></i></button></div>";				
			}else{
			/*==Botón Editar y Eliminar=*/
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarMaterial' idMaterial='".$materiales[$i]["idMateria"]."' data-toggle='modal' data-target='#modalEditarMaterial'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarMaterial' idMaterial='".$materiales[$i]["idMateria"]."' codigo='".$materiales[$i]["codigo"]."' imagen='".$materiales[$i]["imagen"]."'><i class='fa fa-times'></i></button></div>";				
			}


		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$imagen.'",
			      "'.$materiales[$i]["codigo"].'",
				  "'.$materiales[$i]["nombre"].'",
			      "'.$materiales[$i]["descripcion"].'",
			      "'.$marcas["descripcion"].'",
				  "'.$unidadmedida["descripcion"].'",
			      "'.$materiales[$i]["cantidad"].'",
			      "'."S/. ".$materiales[$i]["precio"].'",
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
ACTIVAR TABLA DE MATERIALES
=============================================*/ 
$activarMateriales = new TablaMateriales();
$activarMateriales -> mostrarTablaMateriales();