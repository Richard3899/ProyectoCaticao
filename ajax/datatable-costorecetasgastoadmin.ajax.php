<?php

require_once "../controladores/costorecetasgastoadmin.controlador.php";
require_once "../modelos/costorecetasgastoadmin.modelo.php";

class TablaCostoRecetasGastoAdmin{

 	/*=============================================
 	 MOSTRAR LA TABLA DE COSTO DE RECETAS Y GASTO ADMINISTRATIVO
  	=============================================*/ 

	public function mostrarTablaCostoRecetasGastoAdmin(){

		$item = null;
    	$valor = null;

  		$costorecetasgastoadmin = ControladorCostoRecetasGastoAdmin::ctrMostrarCostoRecetasGastoAdmin($item, $valor);	
		
		if(count($costorecetasgastoadmin) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($costorecetasgastoadmin); $i++){
	  
			/*==Botón Editar y Eliminar=*/

			if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
				$botones =  "<div class='btn-group'><a type='button'class='btn btn-primary' href='index.php?ruta=gastoadminpormes&idCostoRecetasGastoAdmin=".$costorecetasgastoadmin[$i]["idCostoRecetasGastoAdmin"]."&descripcion=".$costorecetasgastoadmin[$i]["descripcion"]."';>Gasto Administrativo</a><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idCostoRecetasGastoAdmin=".$costorecetasgastoadmin[$i]["idCostoRecetasGastoAdmin"]."&mes=".$costorecetasgastoadmin[$i]["mes"]."&descripcion=".$costorecetasgastoadmin[$i]["descripcion"]."'>Costo Total</a><button title='Editar' class='btn btn-warning btnEditarCostoRecetasGastoAdmin' idCostoRecetasGastoAdmin='".$costorecetasgastoadmin[$i]["idCostoRecetasGastoAdmin"]."' data-toggle='modal' data-target='#modalEditarCostoRecetasGastoAdmin'><i class='fa fa-pen'></i></button></div>"; 

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){

				$botones =  "<div class='btn-group'><a type='button'class='btn btn-primary' href='index.php?ruta=gastoadminpormes&idCostoRecetasGastoAdmin=".$costorecetasgastoadmin[$i]["idCostoRecetasGastoAdmin"]."&descripcion=".$costorecetasgastoadmin[$i]["descripcion"]."';>Gasto Administrativo</a><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idCostoRecetasGastoAdmin=".$costorecetasgastoadmin[$i]["idCostoRecetasGastoAdmin"]."&mes=".$costorecetasgastoadmin[$i]["mes"]."&descripcion=".$costorecetasgastoadmin[$i]["descripcion"]."'>Costo Total</a><button title='Eliminar' class='btn btn-danger btnEliminarCostoRecetasGastoAdmin' idCostoRecetasGastoAdmin='".$costorecetasgastoadmin[$i]["idCostoRecetasGastoAdmin"]."'><i class='fa fa-times'></i></button></div>"; 
	
			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){
	
				$botones =  "<div class='btn-group'><a type='button'class='btn btn-primary' href='index.php?ruta=gastoadminpormes&idCostoRecetasGastoAdmin=".$costorecetasgastoadmin[$i]["idCostoRecetasGastoAdmin"]."&descripcion=".$costorecetasgastoadmin[$i]["descripcion"]."';>Gasto Administrativo</a><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idCostoRecetasGastoAdmin=".$costorecetasgastoadmin[$i]["idCostoRecetasGastoAdmin"]."&mes=".$costorecetasgastoadmin[$i]["mes"]."&descripcion=".$costorecetasgastoadmin[$i]["descripcion"]."'>Costo Total</a><button class='btn btn-danger'><i class='fa fa-lock'></i></button></div>"; 

			}else{

				$botones =  "<div class='btn-group'><a type='button'class='btn btn-primary' href='index.php?ruta=gastoadminpormes&idCostoRecetasGastoAdmin=".$costorecetasgastoadmin[$i]["idCostoRecetasGastoAdmin"]."&descripcion=".$costorecetasgastoadmin[$i]["descripcion"]."';>Gasto Administrativo</a><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idCostoRecetasGastoAdmin=".$costorecetasgastoadmin[$i]["idCostoRecetasGastoAdmin"]."&mes=".$costorecetasgastoadmin[$i]["mes"]."&descripcion=".$costorecetasgastoadmin[$i]["descripcion"]."'>Costo Total</a><button title='Editar' class='btn btn-warning btnEditarCostoRecetasGastoAdmin' idCostoRecetasGastoAdmin='".$costorecetasgastoadmin[$i]["idCostoRecetasGastoAdmin"]."' data-toggle='modal' data-target='#modalEditarCostoRecetasGastoAdmin'><i class='fa fa-pen'></i></button><button title='Eliminar' class='btn btn-danger btnEliminarCostoRecetasGastoAdmin' idCostoRecetasGastoAdmin='".$costorecetasgastoadmin[$i]["idCostoRecetasGastoAdmin"]."'><i class='fa fa-times'></i></button></div>"; 
	
			}

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$costorecetasgastoadmin[$i]["descripcion"].'",
				  "'.$costorecetasgastoadmin[$i]["mesV"].'",
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
ACTIVAR TABLA DE COSTO DE RECETAS Y GASTO ADMINISTRATIVO
=============================================*/ 
$activarCostoRecetasGastoAdmin = new TablaCostoRecetasGastoAdmin();
$activarCostoRecetasGastoAdmin -> mostrarTablaCostoRecetasGastoAdmin();