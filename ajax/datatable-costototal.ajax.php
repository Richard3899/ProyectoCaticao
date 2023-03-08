<?php
require_once "../controladores/recetas.controlador.php";
require_once "../modelos/recetas.modelo.php";

require_once "../controladores/recetainsumos.controlador.php";
require_once "../modelos/recetainsumos.modelo.php";

require_once "../controladores/recetamateriales.controlador.php";
require_once "../modelos/recetamateriales.modelo.php";

require_once "../controladores/recetamanodeobra.controlador.php";
require_once "../modelos/recetamanodeobra.modelo.php";

require_once "../controladores/recetadepreciacion.controlador.php";
require_once "../modelos/recetadepreciacion.modelo.php";

require_once "../controladores/recetaconsumoenergia.controlador.php";
require_once "../modelos/recetaconsumoenergia.modelo.php";

require_once "../controladores/recetaconsumogas.controlador.php";
require_once "../modelos/recetaconsumogas.modelo.php";

require_once "../controladores/recetacostoventa.controlador.php";
require_once "../modelos/recetacostoventa.modelo.php";

require_once "../controladores/recetacostomarketing.controlador.php";
require_once "../modelos/recetacostomarketing.modelo.php";

require_once "../controladores/recetacostooperativo.controlador.php";
require_once "../modelos/recetacostooperativo.modelo.php";

class TablaCostoTotal{

 	/*=============================================
 	 MOSTRAR LA TABLA DE COSTO DE RECETA
  	=============================================*/ 

	public function mostrarTablaCostoTotal(){

		$idRecetaC=$_GET["idRecetaC"];

		$item = "Receta";

		$receta = ControladorRecetas::ctrMostrarRecetas("idReceta",$idRecetaC);

    	/*=============================================
 	 	TRAEMOS INSUMOS
  		=============================================*/

  		$recetainsumos = ControladorRecetaInsumos::ctrMostrarRecetaInsumos($item,$idRecetaC);	

		/*=============================================
 	 	TRAEMOS EL TOTAL DE RECETA INSUMOS
  		=============================================*/

		$sumatotalrecetainsumos = ControladorRecetaInsumos::ctrSumaTotalRecetaInsumos($idRecetaC);	

		$totalinsumos = $sumatotalrecetainsumos[0];

		/*=============================================
 	 	TRAEMOS MATERIALES
  		=============================================*/

  		$recetamateriales = ControladorRecetaMateriales::ctrMostrarRecetaMateriales($item,$idRecetaC);	

		/*=============================================
 	 	TRAEMOS EL TOTAL DE RECETA MATERIALES
  		=============================================*/

		$sumatotalrecetamateriales = ControladorRecetaMateriales::ctrSumaTotalRecetaMateriales($idRecetaC);	

		$totalmateriales = $sumatotalrecetamateriales[0];

		/*=============================================
 	 	TRAEMOS MANO DE OBRA
  		=============================================*/
		$recetamanodeobra = ControladorRecetaManodeObra::ctrMostrarRecetaManodeObra($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA MANO DE OBRA
  		=============================================*/

		$sumatotalmanodeobrareceta = ControladorRecetaManodeObra::ctrSumaTotalRecetaManodeObra($idRecetaC);	

		$totalmanodeobra = $sumatotalmanodeobrareceta[0];

		/*=============================================
 	 	TRAEMOS DEPRECIACIÓN
  		=============================================*/
		$recetadepreciacion = ControladorRecetaDepreciacion::ctrMostrarRecetaDepreciacion($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA DEPRECIACIÓN
  		=============================================*/

		$sumatotaldepreciacionreceta = ControladorRecetaDepreciacion::ctrSumaTotalRecetaDepreciacion($idRecetaC);	

		$totaldepreciacion = $sumatotaldepreciacionreceta[0];

		/*=============================================
 	 	TRAEMOS CONSUMO DE ENERGÍA
  		=============================================*/

		$recetaconsumoenergia = ControladorRecetaConsumoEnergia::ctrMostrarRecetaConsumoEnergia($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA CONSUMO DE ENERGÍA
  		=============================================*/

		$sumatotalconsumoenergiareceta = ControladorRecetaConsumoEnergia::ctrSumaTotalRecetaConsumoEnergia($idRecetaC);	

		$totalconsumoenergia = $sumatotalconsumoenergiareceta[0];

		/*=============================================
 	 	TRAEMOS CONSUMO DE GAS
  		=============================================*/
  		$recetaconsumogas = ControladorRecetaConsumoGas::ctrMostrarRecetaConsumoGas($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA CONSUMO DE GAS
  		=============================================*/

		$sumatotalconsumogasreceta = ControladorRecetaConsumoGas::ctrSumaTotalRecetaConsumoGas($idRecetaC);	

		$totalconsumogas = $sumatotalconsumogasreceta[0];

		/*=============================================
 	 	TRAEMOS COSTO DE VENTA
  		=============================================*/

  		$recetacostoventa = ControladorRecetaCostoVenta::ctrMostrarRecetaCostoVenta($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA COSTO DE VENTA
  		=============================================*/

		$sumatotalcostoventareceta = ControladorRecetaCostoVenta::ctrSumaTotalRecetaCostoVenta($idRecetaC);	

		$totalcostoventa = $sumatotalcostoventareceta[0];

		/*=============================================
 	 	TRAEMOS COSTO MARKETING
  		=============================================*/

  		$recetacostomarketing = ControladorRecetaCostoMarketing::ctrMostrarRecetaCostoMarketing($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA COSTO DE MARKETING
  		=============================================*/

		$sumatotalcostomarketingreceta = ControladorRecetaCostoMarketing::ctrSumaTotalRecetaCostoMarketing($idRecetaC);	

		$totalcostomarketing = $sumatotalcostomarketingreceta[0];

		/*=============================================
 	 	TRAEMOS COSTO OPERATIVO
  		=============================================*/

  		$recetacostooperativo = ControladorRecetaCostoOperativo::ctrMostrarRecetaCostoOperativo($item,$idRecetaC);	

		/*============================================
 	 	TRAEMOS EL TOTAL DE RECETA COSTO OPERATIVO
  		=============================================*/

		$sumatotalcostooperativoreceta = ControladorRecetaCostoOperativo::ctrSumaTotalRecetaCostoOperativo($idRecetaC);	

		$totalcostooperativo = $sumatotalcostooperativoreceta[0];

		/*============================================
 	 	VALIDAR SI LA RECETA TIENE DATOS
  		=============================================*/
		if(count($recetamateriales) == 0  && count($recetainsumos) == 0 && count($recetamanodeobra) == 0 
		&& count($recetadepreciacion) == 0 && count($recetaconsumoenergia) == 0 && count($recetaconsumogas) == 0 
		&& count($recetacostoventa) == 0 && count($recetacostomarketing) == 0 && count($recetacostooperativo) == 0){

			echo '{"data": []}';
			
			return;
		}

		/*============================================
 	 	SUMA TOTAL DE RECETA
  		=============================================*/

		$totalreceta = $receta[13];
		$totalPorTableta=$receta[14];

		$datosJson = '{
			"data": [["INSUMOS","","",""],';
  
			for($i = 0; $i < count($recetainsumos); $i++){

				$datosJson .='[
					"'.($i+1).' - '.$recetainsumos[$i]["nombre"].'",
					"'.$recetainsumos[$i]["precioUnitario"].'",
					"'.$recetainsumos[$i]["cantidad"].'",
					"'.$recetainsumos[$i]["total"].'"
				  ],';
  
			};
  
		   $datosJson .='["TOTAL","","","'.$totalinsumos.'"],["","","",""],
		   				 ["MATERIALES","","",""],'; 
  
		   for($i = 0; $i < count($recetamateriales); $i++){
			  
				$datosJson .='[
					"'.($i+1).' - '.$recetamateriales[$i]["nombre"].'",
					"'.$recetamateriales[$i]["precioUnitario"].'",
					"'.$recetamateriales[$i]["cantidad"].'",
					"'.$recetamateriales[$i]["total"].'"
			  ],';
  
			};

			$datosJson .='["TOTAL","","","'.$totalmateriales.'"],["","","",""],
						  ["MANO DE OBRA","","",""],'; 
  
			for($i = 0; $i < count($recetamanodeobra); $i++){
			   
				 $datosJson .='[
					 "'.($i+1).' - '.$recetamanodeobra[$i]["nombreMaquina"].'",
					 "'.$recetamanodeobra[$i]["precioUnitario"].'",
					 "'.$recetamanodeobra[$i]["tiempoHoras"].'",
					 "'.$recetamanodeobra[$i]["total"].'"
			   ],';
   
			 };

			 $datosJson .='["TOTAL","","","'.$totalmanodeobra.'"],["","","",""],
			 			   ["DEPRECIACIÓN","","",""],'; 
  
			 for($i = 0; $i < count($recetadepreciacion); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetadepreciacion[$i]["nombreMaquina"].'",
					  "'.$recetadepreciacion[$i]["depreciacionHora"].'",
					  "'.$recetadepreciacion[$i]["tiempoHoras"].'",
					  "'.$recetadepreciacion[$i]["depreciacionPorBatch"].'"
				],';
	
			  };

			$datosJson .='["TOTAL","","","'.$totaldepreciacion.'"],["","","",""],
						  ["CONSUMO DE ENERGÍA","","",""],'; 

			 for($i = 0; $i < count($recetaconsumoenergia); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetaconsumoenergia[$i]["nombreMaquina"].'",
					  "'.$recetaconsumoenergia[$i]["tarifaKwh"].'",
					  "'.$recetaconsumoenergia[$i]["consumoKwh"].'",
					  "'.$recetaconsumoenergia[$i]["pagoPorBatch"].'"
				],';
	
			  };	
			  
			$datosJson .='["TOTAL","","","'.$totalconsumoenergia.'"],["","","",""],
			              ["CONSUMO DE GAS","","",""],';
						  
			 for($i = 0; $i < count($recetaconsumogas); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetaconsumogas[$i]["nombreMaquina"].'",
					  "'.$recetaconsumogas[$i]["tarifaGas"].'",
					  "'.$recetaconsumogas[$i]["pesoBalonGas"].'",
					  "'.$recetaconsumogas[$i]["pagoPorBatch"].'"
				],';
	
			  };	
			  
			$datosJson .='["TOTAL","","","'.$totalconsumogas.'"],["","","",""],
			              ["COSTO DE VENTA","","",""],'; 

			 for($i = 0; $i < count($recetacostoventa); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetacostoventa[$i]["nombreCostoVenta"].'",
					  "'.$recetacostoventa[$i]["precio"].'",
					  "'.$recetacostoventa[$i]["cantidad"].'",
					  "'.$recetacostoventa[$i]["total"].'"
				],';
	
			  };	
			  
			$datosJson .='["TOTAL","","","'.$totalcostoventa.'"],["","","",""],
			              ["COSTO DE MARKETING","","",""],'; 
						  
			 for($i = 0; $i < count($recetacostomarketing); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetacostomarketing[$i]["nombreCostoMarketing"].'",
					  "'.$recetacostomarketing[$i]["precio"].'",
					  "'.$recetacostomarketing[$i]["cantidad"].'",
					  "'.$recetacostomarketing[$i]["total"].'"
				],';
	
			  };	
			  
			$datosJson .='["TOTAL","","","'.$totalcostomarketing.'"],["","","",""],
			              ["COSTO OPERATIVO","","",""],'; 
						  
			 for($i = 0; $i < count($recetacostooperativo); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetacostooperativo[$i]["nombreCostoOperativo"].'",
					  "'.$recetacostooperativo[$i]["precio"].'",
					  "'.$recetacostooperativo[$i]["cantidad"].'",
					  "'.$recetacostooperativo[$i]["total"].'"
				],';
	
			  };	
			  
			$datosJson .='["TOTAL","","","'.$totalcostooperativo.'"],["","","",""]'; 						  
			
			$datosJson .=',["Costo Total de Producción: ","","","'.$totalreceta.'"]
			              ,["Costo Por Tableta: ","","","'.$totalPorTableta.'"]]}';

		    echo $datosJson;

	}


}

/*=============================================
ACTIVAR TABLA DE COSTO DE RECETA
=============================================*/ 
$activarCostoTotal = new TablaCostoTotal();
$activarCostoTotal -> mostrarTablaCostoTotal();