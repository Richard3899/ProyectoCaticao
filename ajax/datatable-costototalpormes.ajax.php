<?php
require_once "../controladores/gastoadminpormes.controlador.php";
require_once "../modelos/gastoadminpormes.modelo.php";

require_once "../controladores/costototalpormes.controlador.php";
require_once "../modelos/costototalpormes.modelo.php";

class TablaCostoTotal{

 	/*=============================================
 	 MOSTRAR LA TABLA DE COSTO DE RECETA
  	=============================================*/ 

	public function mostrarTablaCostoTotal(){
	
		/*=============================================
 	 	TRAEMOS LOS PARAMETROS
  		=============================================*/

		$idMesGastoC=$_GET["idMesGasto"];
		// $mes=$_GET["mes"];

		/*============================================
 	 	TRAEMOS EL TOTAL DE GASTOS DEL MES
  		=============================================*/

		$sumatotalgastoadmindelmes = ControladorGastoAdminPorMes::ctrSumaTotalGastoAdminPorMes($idMesGastoC,1);	

		$totalgastosadmin = $sumatotalgastoadmindelmes[0];

		$sumatotalcostoventadelmes = ControladorGastoAdminPorMes::ctrSumaTotalGastoAdminPorMes($idMesGastoC,2);	

		$totalcostoventa = $sumatotalcostoventadelmes[0];

		$sumatotalcostomarketingdelmes = ControladorGastoAdminPorMes::ctrSumaTotalGastoAdminPorMes($idMesGastoC,3);	

		$totalcostomarketing = $sumatotalcostomarketingdelmes[0];

		$sumatotalcostooperativodelmes = ControladorGastoAdminPorMes::ctrSumaTotalGastoAdminPorMes($idMesGastoC,4);	

		$totalcostooperativo = $sumatotalcostooperativodelmes[0];

		$sumatotalgastosdelmes = ControladorGastoAdminPorMes::ctrSumaTotalGastoAdminPorMes($idMesGastoC,0);	

		$totalgastosdelmes = $sumatotalgastosdelmes[0];

		/*============================================
 	 	TRAEMOS EL COSTO TOTAL DE LAS RECETAS DEL MES
  		=============================================*/

		// $sumacostototalpormes = ControladorCostoTotalPorMes::ctrSumaTotalCostoTotalPorMes($mes);	

		// $costototalpormes = $sumacostototalpormes[0];
		// $cantidadTabletas = $sumacostototalpormes[1];

		/*============================================
 	 	SUMA TOTAL
  		=============================================*/

		$datosJson = '{"data": [';
					  
			$datosJson .='	["Gastos administrativos","'.$totalgastosadmin.'"],
							["Costos de Ventas","'.$totalcostoventa.'"],
							["Costos de Marketing","'.$totalcostomarketing.'"],
							["Costos Operativos","'.$totalcostooperativo.'"],
							["",""],
							["Costo total: ","'.$totalgastosdelmes.'"]]}';

		    echo $datosJson;

	}


}

/*=============================================
ACTIVAR TABLA DE COSTO DE RECETA
=============================================*/ 
$activarCostoTotal = new TablaCostoTotal();
$activarCostoTotal -> mostrarTablaCostoTotal();