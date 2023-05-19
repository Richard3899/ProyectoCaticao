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
		$mes=$_GET["mes"];

		/*============================================
 	 	TRAEMOS EL TOTAL DE GASTOS ADMINISTRATIVOS POR MES
  		=============================================*/

		$sumatotalgastoadminpormes = ControladorGastoAdminPorMes::ctrSumaTotalGastoAdminPorMes($idMesGastoC);	

		$totalgastosadmin = $sumatotalgastoadminpormes[0];

		/*============================================
 	 	TRAEMOS EL COSTO TOTAL POR MES
  		=============================================*/

		$sumacostototalpormes = ControladorCostoTotalPorMes::ctrSumaTotalCostoTotalPorMes($mes);	

		$costototalpormes = $sumacostototalpormes[0];
		$cantidadTabletas = $sumacostototalpormes[1];

		/*============================================
 	 	SUMA TOTAL
  		=============================================*/

		$costototal=$costototalpormes+$totalgastosadmin;
		
		if($costototal==0){
			$costoPorTableta=0;
		}else {
			if($cantidadTabletas==0){
				$costoPorTableta=0;
			}else{
				$costoPorTableta=$costototal/$cantidadTabletas;
			}
		}
		

		$datosJson = '{
			"data": [["Costo total de las recetas","'.$costototalpormes.'"],';				  
			
			$datosJson .='["Gastos administrativos","'.$totalgastosadmin.'"],
			          ["",""],["Costo total de producción  del mes : ","'.$costototal.'"],
					  ["Costo total por tableta : ","'.$costoPorTableta.'"]]}';

		    echo $datosJson;

	}


}

/*=============================================
ACTIVAR TABLA DE COSTO DE RECETA
=============================================*/ 
$activarCostoTotal = new TablaCostoTotal();
$activarCostoTotal -> mostrarTablaCostoTotal();