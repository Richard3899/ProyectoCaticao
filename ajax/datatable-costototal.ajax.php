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

require_once "../controladores/costoreceta.controlador.php";
require_once "../modelos/costoreceta.modelo.php";

require_once "../controladores/mesgasto.controlador.php";
require_once "../modelos/mesgasto.modelo.php";

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
 	 	TRAEMOS DESCRIPCIÓN DEL MES
  		=============================================*/

		$gastomes = ControladorMesGasto::ctrMostrarMesGasto3($idRecetaC);	
		$descripcionMes = $gastomes[0];

		/*=============================================
 	 	TRAEMOS GASTO ADMIN
  		=============================================*/
  		$recetagastoadmin = ControladorRecetaGastoAdminPorMes::ctrMostrarRecetaGastoAdmin($idRecetaC,1);	

		$sumatotalgastoadmin= ControladorRecetaGastoAdminPorMes::ctrSumaTotalRecetaGastoAdmin($idRecetaC,1);	

		$totalgastoadmin = $sumatotalgastoadmin[0];

		/*=============================================
 	 	TRAEMOS COSTO DE VENTA
  		=============================================*/

  		$recetacostoventa = ControladorRecetaGastoAdminPorMes::ctrMostrarRecetaGastoAdmin($idRecetaC,2);

		$sumatotalcostoventareceta = ControladorRecetaGastoAdminPorMes::ctrSumaTotalRecetaGastoAdmin($idRecetaC,2);

		$totalcostoventa = $sumatotalcostoventareceta[0];

		/*=============================================
 	 	TRAEMOS COSTO MARKETING
  		=============================================*/

  		$recetacostomarketing = ControladorRecetaGastoAdminPorMes::ctrMostrarRecetaGastoAdmin($idRecetaC,3);

		$sumatotalcostomarketingreceta = ControladorRecetaGastoAdminPorMes::ctrSumaTotalRecetaGastoAdmin($idRecetaC,3);

		$totalcostomarketing = $sumatotalcostomarketingreceta[0];

		/*=============================================
 	 	TRAEMOS COSTO OPERATIVO
  		=============================================*/

  		$recetacostooperativo = ControladorRecetaGastoAdminPorMes::ctrMostrarRecetaGastoAdmin($idRecetaC,4);	

		$sumatotalcostooperativoreceta = ControladorRecetaGastoAdminPorMes::ctrSumaTotalRecetaGastoAdmin($idRecetaC,4);	

		$totalcostooperativo = $sumatotalcostooperativoreceta[0];

		/*============================================
 	 	SUMA TOTAL DE RECETA
  		=============================================*/

		$datosJson = '{
			"data": [["<strong>INSUMOS</strong>","","",""],';
  
			for($i = 0; $i < count($recetainsumos); $i++){

				$datosJson .='[
					"'.($i+1).' - '.$recetainsumos[$i]["nombre"].'",
					"'.$recetainsumos[$i]["precioUnitario"].'",
					"'.$recetainsumos[$i]["cantidad"].'",
					"'.$recetainsumos[$i]["total"].'"
				  ],';
  
			};
  
		   $datosJson .='["TOTAL","","","'.$totalinsumos.'"],["","","",""],
		   				 ["<strong>MATERIALES</strong>","","",""],'; 
  
		   for($i = 0; $i < count($recetamateriales); $i++){
			  
				$datosJson .='[
					"'.($i+1).' - '.$recetamateriales[$i]["nombre"].'",
					"'.$recetamateriales[$i]["precioUnitario"].'",
					"'.$recetamateriales[$i]["cantidad"].'",
					"'.$recetamateriales[$i]["total"].'"
			  ],';
  
			};

			$datosJson .='["TOTAL","","","'.$totalmateriales.'"],["","","",""],
						  ["<strong>MANO DE OBRA</strong>","","",""],'; 
  
			for($i = 0; $i < count($recetamanodeobra); $i++){
			   
				 $datosJson .='[
					 "'.($i+1).' - '.$recetamanodeobra[$i]["nombreMaquina"].'",
					 "'.$recetamanodeobra[$i]["precioUnitario"].'",
					 "'.$recetamanodeobra[$i]["tiempoHoras"].'",
					 "'.$recetamanodeobra[$i]["total"].'"
			   ],';
   
			 };

			 $datosJson .='["TOTAL","","","'.$totalmanodeobra.'"],["","","",""],
			 			   ["<strong>DEPRECIACIÓN</strong>","","",""],'; 
  
			 for($i = 0; $i < count($recetadepreciacion); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetadepreciacion[$i]["nombreMaquina"].'",
					  "'.$recetadepreciacion[$i]["depreciacionHora"].'",
					  "'.$recetadepreciacion[$i]["tiempoHoras"].'",
					  "'.$recetadepreciacion[$i]["depreciacionPorBatch"].'"
				],';
	
			  };

			$datosJson .='["TOTAL","","","'.$totaldepreciacion.'"],["","","",""],
						  ["<strong>CONSUMO DE ENERGÍA</strong>","","",""],'; 

			 for($i = 0; $i < count($recetaconsumoenergia); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetaconsumoenergia[$i]["nombreMaquina"].'",
					  "'.$recetaconsumoenergia[$i]["tarifaKwh"].'",
					  "'.$recetaconsumoenergia[$i]["consumoKwh"].'",
					  "'.$recetaconsumoenergia[$i]["pagoPorBatch"].'"
				],';
	
			  };	
			  
			$datosJson .='["TOTAL","","","'.$totalconsumoenergia.'"],["","","",""],
			              ["<strong>CONSUMO DE GAS</strong>","","",""],';
						  
			 for($i = 0; $i < count($recetaconsumogas); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetaconsumogas[$i]["nombreMaquina"].'",
					  "'.$recetaconsumogas[$i]["tarifaGas"].'",
					  "'.$recetaconsumogas[$i]["pesoBalonGas"].'",
					  "'.$recetaconsumogas[$i]["pagoPorBatch"].'"
				],';
	
			  };	

			$datosJson .='["TOTAL","","","'.$totalconsumogas.'"],["","","",""],
						  ["<strong>( GASTOS '.$descripcionMes.' )</strong>","","",""],
						  ["","","",""],["<strong>GASTO ADMINISTRATIVO</strong>","","",""],'; 

			 for($i = 0; $i < count($recetagastoadmin); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetagastoadmin[$i]["nombreGastoAdmin"].'",
					  "'.$recetagastoadmin[$i]["precio"].'",
					  "('.$recetagastoadmin[$i]["cantidad"].' %)",
					  "'.$recetagastoadmin[$i]["total"].'"
				],';
	
			  };
			  
			$datosJson .='["TOTAL","","","'.$totalgastoadmin.'"],["","","",""],
			              ["<strong>COSTO DE VENTA</strong>","","",""],'; 

			 for($i = 0; $i < count($recetacostoventa); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetacostoventa[$i]["nombreGastoAdmin"].'",
					  "'.$recetacostoventa[$i]["precio"].'",
					  "('.$recetacostoventa[$i]["cantidad"].' %)",
					  "'.$recetacostoventa[$i]["total"].'"
				],';
	
			  };	
			  
			$datosJson .='["TOTAL","","","'.$totalcostoventa.'"],["","","",""],
			              ["<strong>COSTO DE MARKETING</strong>","","",""],'; 
						  
			 for($i = 0; $i < count($recetacostomarketing); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetacostomarketing[$i]["nombreGastoAdmin"].'",
					  "'.$recetacostomarketing[$i]["precio"].'",
					  "('.$recetacostomarketing[$i]["cantidad"].' %)",
					  "'.$recetacostomarketing[$i]["total"].'"
				],';
	
			  };	
			  
			$datosJson .='["TOTAL","","","'.$totalcostomarketing.'"],["","","",""],
			              ["<strong>COSTO OPERATIVO</strong>","","",""],'; 
						  
			 for($i = 0; $i < count($recetacostooperativo); $i++){
				
				  $datosJson .='[
					  "'.($i+1).' - '.$recetacostooperativo[$i]["nombreGastoAdmin"].'",
					  "'.$recetacostooperativo[$i]["precio"].'",
					  "('.$recetacostooperativo[$i]["cantidad"].' %)",
					  "'.$recetacostooperativo[$i]["total"].'"
				],';
	
			  };	
			  
			$datosJson .='["TOTAL","","","'.$totalcostooperativo.'"],["","","",""]'; 						  
			
			$datosJson .=',["Costo Total de Producción: ","","","'.$receta["costoTotal"].'"]
						  ,["Cantidad de Tabletas: ","","","['.$receta["cantidadTabletas"].']"]
			              ,["Costo Por Tableta: ","","","'.$receta["costoPorTableta"].'"]]}';

		    echo $datosJson;

	}

}

/*=============================================
ACTIVAR TABLA DE COSTO DE RECETA
=============================================*/ 
$activarCostoTotal = new TablaCostoTotal();
$activarCostoTotal -> mostrarTablaCostoTotal();