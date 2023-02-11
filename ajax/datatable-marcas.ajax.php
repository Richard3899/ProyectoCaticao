<?php
require_once "../controladores/marcas.controlador.php";
require_once "../modelos/marcas.modelo.php";

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

			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
			
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarMarca' idMarca='".$marcas[$i]["idMarca"]."' data-toggle='modal' data-target='#modalEditarMarca'><i class='fa fa-pen'></i></button></div>"; 

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){
				
			$botones =  "<div class='btn-group'><button class='btn btn-danger btnEliminarMarca' idMarca='".$marcas[$i]["idMarca"]."'><i class='fa fa-times'></i></button></div>"; 

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
				
		    }else{

			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarMarca' idMarca='".$marcas[$i]["idMarca"]."' data-toggle='modal' data-target='#modalEditarMarca'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarMarca' idMarca='".$marcas[$i]["idMarca"]."'><i class='fa fa-times'></i></button></div>"; 

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

