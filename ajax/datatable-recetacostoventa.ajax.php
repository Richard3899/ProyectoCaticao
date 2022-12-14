<?php

require_once "../controladores/recetacostoventa.controlador.php";
require_once "../modelos/recetacostoventa.modelo.php";

class TablaRecetaCostoVenta{

 	/*=============================================
 	 MOSTRAR LA TABLA DE RECETA COSTO DE VENTA
  	=============================================*/ 

	public function mostrarTablaRecetaCostoVenta(){

    	$idRecetaC=$_GET["idRecetaC"];

		$item = "Receta";

  		$recetacostoventa = ControladorRecetaCostoVenta::ctrMostrarRecetaCostoVenta($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA COSTO DE VENTA
  		=============================================*/

		$sumatotalcostoventareceta = ControladorRecetaCostoVenta::ctrSumaTotalRecetaCostoVenta($idRecetaC);	

		$total = $sumatotalcostoventareceta[0];

		if(count($recetacostoventa) == 0){

			echo '{"data": []}';
			
			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($recetacostoventa); $i++){
			
			/*============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarCostoVentaReceta' idRecetaCostoVenta='".$recetacostoventa[$i]["idRecetaCostoVenta"]."' data-toggle='modal' data-target='#modalEditarCostoVenta'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarCostoVentaReceta' idRecetaCostoVenta='".$recetacostoventa[$i]["idRecetaCostoVenta"]."'><i class='fa fa-times'></i></button></div>";				
				
		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$recetacostoventa[$i]["nombreCostoVenta"].'",
			      "'.$recetacostoventa[$i]["cantidad"].'",
				  "'.$recetacostoventa[$i]["precio"].'",
				  "'.$recetacostoventa[$i]["total"].'",
				  "'.$botones.'"
			    ],';

		  }

		 $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   ',["Total","","","","S/. '.$total.'",""]] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE COSTO DE VENTA
=============================================*/ 
$activarRecetaCostoVenta = new TablaRecetaCostoVenta();
$activarRecetaCostoVenta -> mostrarTablaRecetaCostoVenta();