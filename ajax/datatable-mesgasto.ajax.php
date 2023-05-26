<?php

require_once "../controladores/mesgasto.controlador.php";
require_once "../modelos/mesgasto.modelo.php";

class TablaMesGasto{

 	/*=============================================
 	 MOSTRAR LA TABLA MES GASTO
  	=============================================*/ 

	public function mostrarTablaMesGasto(){

		$item = null;
    	$valor = null;

  		$mesgasto = ControladorMesGasto::ctrMostrarMesGasto($item, $valor);	
		
		if(count($mesgasto) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($mesgasto); $i++){
	
			/*==Botón Editar y Eliminar=*/

			if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){

				if($mesgasto[$i]["cerradoMes"]==1){
					
					if($mesgasto[$i]["ocultoMes"]==1){

						$botones =  "<div class='btn-group'><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&mes=".$mesgasto[$i]["mes"]."&descripcion=".$mesgasto[$i]["descripcion"]."'>Costo Total</a><button title='Mes Cerrado' class='btn btn-info'><i class='fa fa-lock'></i></button><button title='Mes oculto en adicionales' class='btn btn-dark'><i class='fa fa-check-circle'></i></button></div>"; 

					}else{

						$botones =  "<div class='btn-group'><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&mes=".$mesgasto[$i]["mes"]."&descripcion=".$mesgasto[$i]["descripcion"]."'>Costo Total</a><button title='Mes Cerrado' class='btn btn-info'><i class='fa fa-lock'></i></button><button title='Ocultar mes en adicionales' class='btn btn-secondary btnOcultarMes' idMesGasto='".$mesgasto[$i]["idMesGasto"]."'><i class='fa fa-check-circle'></i></button></div>"; 

					} 
				
				}else{
			
				$botones =  "<div class='btn-group'><a type='button'class='btn btn-primary' href='index.php?ruta=gastoadminpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&descripcion=".$mesgasto[$i]["descripcion"]."';>Gastos y Costos</a><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&mes=".$mesgasto[$i]["mes"]."&descripcion=".$mesgasto[$i]["descripcion"]."'>Costo Total</a><button title='Editar' class='btn btn-warning btnEditarMesGasto' idMesGasto='".$mesgasto[$i]["idMesGasto"]."' data-toggle='modal' data-target='#modalEditarMesGasto'><i class='fa fa-pen'></i></button><button title='Cerrar Mes' class='btn btn-success btnCerrarMes' idMesGasto='".$mesgasto[$i]["idMesGasto"]."'><i class='fa fa-lock'></i></button></div>"; 
						
				}

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){

				if($mesgasto[$i]["cerradoMes"]==1){

					if($mesgasto[$i]["ocultoMes"]==1){

						$botones =  "<div class='btn-group'><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&mes=".$mesgasto[$i]["mes"]."&descripcion=".$mesgasto[$i]["descripcion"]."'>Costo Total</a><button title='Mes Cerrado' class='btn btn-info'><i class='fa fa-lock'></i></button><button title='Mes oculto en adicionales' class='btn btn-dark'><i class='fa fa-check-circle'></i></button></div>"; 

					}else{

						$botones =  "<div class='btn-group'><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&mes=".$mesgasto[$i]["mes"]."&descripcion=".$mesgasto[$i]["descripcion"]."'>Costo Total</a><button title='Mes Cerrado' class='btn btn-info'><i class='fa fa-lock'></i></button></div>"; 

					} 
				
				}else{
			
				$botones =  "<div class='btn-group'><a type='button'class='btn btn-primary' href='index.php?ruta=gastoadminpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&descripcion=".$mesgasto[$i]["descripcion"]."';>Gastos y Costos</a><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&mes=".$mesgasto[$i]["mes"]."&descripcion=".$mesgasto[$i]["descripcion"]."'>Costo Total</a><button title='Eliminar' class='btn btn-danger btnEliminarMesGasto' idMesGasto='".$mesgasto[$i]["idMesGasto"]."'><i class='fa fa-times'></i></button></div>"; 
						
				}

	
			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){
	

				if($mesgasto[$i]["cerradoMes"]==1){

					if($mesgasto[$i]["ocultoMes"]==1){

						$botones =  "<div class='btn-group'><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&mes=".$mesgasto[$i]["mes"]."&descripcion=".$mesgasto[$i]["descripcion"]."'>Costo Total</a><button title='Mes Cerrado' class='btn btn-info'><i class='fa fa-lock'></i></button><button title='Mes oculto en adicionales' class='btn btn-dark'><i class='fa fa-check-circle'></i></button></div>"; 

					}else{

						$botones =  "<div class='btn-group'><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&mes=".$mesgasto[$i]["mes"]."&descripcion=".$mesgasto[$i]["descripcion"]."'>Costo Total</a><button title='Mes Cerrado' class='btn btn-info'><i class='fa fa-lock'></i></button></div>"; 

					} 

				}else{
			
					$botones =  "<div class='btn-group'><a type='button'class='btn btn-primary' href='index.php?ruta=gastoadminpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&descripcion=".$mesgasto[$i]["descripcion"]."';>Gastos y Costos</a><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&mes=".$mesgasto[$i]["mes"]."&descripcion=".$mesgasto[$i]["descripcion"]."'>Costo Total</a><button class='btn btn-danger'><i class='fa fa-lock'></i></button></div>"; 
						
				}

			}else{

				if($mesgasto[$i]["cerradoMes"]==1){

					if($mesgasto[$i]["ocultoMes"]==1){

						$botones =  "<div class='btn-group'><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&mes=".$mesgasto[$i]["mes"]."&descripcion=".$mesgasto[$i]["descripcion"]."'>Costo Total</a><button title='Mes Cerrado' class='btn btn-info'><i class='fa fa-lock'></i></button><button title='Mes oculto en adicionales' class='btn btn-dark'><i class='fa fa-check-circle'></i></button></div>"; 

					}else{

						$botones =  "<div class='btn-group'><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&mes=".$mesgasto[$i]["mes"]."&descripcion=".$mesgasto[$i]["descripcion"]."'>Costo Total</a><button title='Mes Cerrado' class='btn btn-info'><i class='fa fa-lock'></i></button><button title='Ocultar mes en adicionales' class='btn btn-secondary btnOcultarMes' idMesGasto='".$mesgasto[$i]["idMesGasto"]."'><i class='fa fa-check-circle'></i></button></div>"; 

					}

				}else{
			
				$botones =  "<div class='btn-group'><a type='button'class='btn btn-primary' href='index.php?ruta=gastoadminpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&descripcion=".$mesgasto[$i]["descripcion"]."';>Gastos y Costos</a><a type='button'class='btn btn-success' href='index.php?ruta=costototalpormes&idMesGasto=".$mesgasto[$i]["idMesGasto"]."&mes=".$mesgasto[$i]["mes"]."&descripcion=".$mesgasto[$i]["descripcion"]."'>Costo Total</a><button title='Editar' class='btn btn-warning btnEditarMesGasto' idMesGasto='".$mesgasto[$i]["idMesGasto"]."' data-toggle='modal' data-target='#modalEditarMesGasto'><i class='fa fa-pen'></i></button><button title='Eliminar' class='btn btn-danger btnEliminarMesGasto' idMesGasto='".$mesgasto[$i]["idMesGasto"]."'><i class='fa fa-times'></i></button><button title='Cerrar Mes' class='btn btn-success btnCerrarMes' idMesGasto='".$mesgasto[$i]["idMesGasto"]."'><i class='fa fa-lock'></i></button></div>"; 
						
				}

			}

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$mesgasto[$i]["descripcion"].'",
				  "'.$mesgasto[$i]["mesV"].'",
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
ACTIVAR TABLA DE MES GASTO
=============================================*/ 
$activarMesGasto = new TablaMesGasto();
$activarMesGasto -> mostrarTablaMesGasto();