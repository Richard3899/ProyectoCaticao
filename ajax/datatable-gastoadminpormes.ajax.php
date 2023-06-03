<?php

require_once "../controladores/gastoadminpormes.controlador.php";
require_once "../modelos/gastoadminpormes.modelo.php";

class TablaGastoAdminPorMes{

 	/*=============================================
 	 MOSTRAR LA TABLA DE GASTOS ADMINISTRATIVOS POR MES
  	=============================================*/ 

	public function mostrarTablaGastoAdminPorMes(){

    	$idMesGastoC=$_GET["idMesGastoC"];

		$item = "MesGasto";

  		$gastoadminpormes = ControladorGastoAdminPorMes::ctrMostrarGastoAdminPorMes($item,$idMesGastoC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE GASTOS ADMINISTRATIVOS POR MES
  		=============================================*/

		$sumatotalgastoadminpormes = ControladorGastoAdminPorMes::ctrSumaTotalGastoAdminPorMes($idMesGastoC,0);	

		$total = $sumatotalgastoadminpormes[0];

		if(count($gastoadminpormes) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($gastoadminpormes); $i++){
			
			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarGastoAdminPorMes' idGastoAdminPorMes='".$gastoadminpormes[$i]["idGastoAdminPorMes"]."' data-toggle='modal' data-target='#modalEditarGastoAdminPorMes'><i class='fa fa-pen'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){

			$botones =  "<div class='btn-group'><button class='btn btn-danger btnEliminarGastoAdminPorMes' idGastoAdminPorMes='".$gastoadminpormes[$i]["idGastoAdminPorMes"]."'><i class='fa fa-times'></i></button></div>";				

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
				
		    }else{

			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarGastoAdminPorMes' idGastoAdminPorMes='".$gastoadminpormes[$i]["idGastoAdminPorMes"]."' data-toggle='modal' data-target='#modalEditarGastoAdminPorMes'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarGastoAdminPorMes' idGastoAdminPorMes='".$gastoadminpormes[$i]["idGastoAdminPorMes"]."'><i class='fa fa-times'></i></button></div>";				

			}

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$gastoadminpormes[$i]["nombreGastoAdmin"].'",
				  "'.$gastoadminpormes[$i]["descripcionTipoGasto"].'",
			      "'.$gastoadminpormes[$i]["cantidad"].'",
				  "'.$gastoadminpormes[$i]["precio"].'",
				  "'.$gastoadminpormes[$i]["total"].'",
				  "'.$botones.'"
			    ],';

		  }

		 $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   ',["Total","","","","","'.$total.'",""]] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE COSTO DE VENTA
=============================================*/ 
$activarGastoAdminPorMes = new TablaGastoAdminPorMes();
$activarGastoAdminPorMes -> mostrarTablaGastoAdminPorMes();