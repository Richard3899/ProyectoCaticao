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

		$idCostoRecetasGastoAdminC=$_GET["idCostoRecetasGastoAdmin"];
		$mes=$_GET["mes"];

		/*============================================
 	 	TRAEMOS EL TOTAL DE GASTOS ADMINISTRATIVOS POR MES
  		=============================================*/

		$sumatotalgastoadminpormes = ControladorGastoAdminPorMes::ctrSumaTotalGastoAdminPorMes($idCostoRecetasGastoAdminC);	

		$totalgastosadmin = $sumatotalgastoadminpormes[0];

		/*============================================
 	 	TRAEMOS EL COSTO TOTAL POR MES
  		=============================================*/

		$sumacostototalpormes = ControladorCostoTotalPorMes::ctrSumaTotalCostoTotalPorMes($mes);	

		$costototalpormes = $sumacostototalpormes[0];

	    /*============================================
 	 	VALIDAR SI TIENEN VALOR LOS TOTALES
  		=============================================*/

		if($totalgastosadmin==""){ $totalgastosadmin=0; }
		if($costototalpormes==""){ $costototalpormes=0; }

		/*============================================
 	 	SUMA TOTAL
  		=============================================*/

		$costototal=$costototalpormes+$totalgastosadmin;

		$datosJson = '{
			"data": [["Costo Total de las Recetas","'.$costototalpormes.'"],';				  
			
			$datosJson .='["Gastos Administrativos","'.$totalgastosadmin.'"],["",""],["Costo Total","'.$costototal.'"]]}';

		    echo $datosJson;

	}


}

/*=============================================
ACTIVAR TABLA DE COSTO DE RECETA
=============================================*/ 
$activarCostoTotal = new TablaCostoTotal();
$activarCostoTotal -> mostrarTablaCostoTotal();