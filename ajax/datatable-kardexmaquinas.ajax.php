<?php
require_once "../controladores/kardexmaquinas.controlador.php";
require_once "../modelos/kardexmaquinas.modelo.php";

require_once "../controladores/movimiento.controlador.php";
require_once "../modelos/movimiento.modelo.php";

require_once "../controladores/maquinas.controlador.php";
require_once "../modelos/maquinas.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

class TablaKardexMaquinas{

 	/*=============================================
 	 MOSTRAR LA TABLA DE MAQUINAS
  	=============================================*/ 

	public function mostrarTablaKardexMaquinas(){

		$idMaquina=$_GET["MaquinaK"];

  		$kardexmaquinas = ControladorKardexMaquinas::ctrMostrarKardexMaquinas2($idMaquina);	
		
		if($idMaquina == 0){

			echo '{"data": []}';

			return;
		}
		if(count($kardexmaquinas) == 0){

			echo '{"data": []}';

			return;
		}


  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($kardexmaquinas); $i++){


			/*=============================================
 	 		TRAEMOS AL MAQUINA
  			=============================================*/ 

		  	$item1 = "idMaquina";
		  	$valor1 = $kardexmaquinas[$i]["idMaquina"];

		  	$maquinas = ControladorMaquinas::ctrMostrarMaquinas($item1, $valor1);


			/*=============================================
 	 		TRAEMOS EL MOVIMIENTO
  			=============================================*/ 

		  	$item4 = "idMovimiento";
		  	$valor4 = $kardexmaquinas[$i]["idMovimiento"];

		  	$movimiento = ControladorMovimiento::ctrMostrarMovimiento($item4, $valor4);

			$ingreso=0;
			$salida=0;
			$saldo=0;
			$movimientos="";

			if($kardexmaquinas[$i]["ingreso"]>0){
				
				$ingreso =  "<p class='text-success'>".$kardexmaquinas[$i]["ingreso"]."</p>";				
			}

			if($kardexmaquinas[$i]["salida"]>0){
				
				$salida =  "<p class='text-danger'>".$kardexmaquinas[$i]["salida"]."</p>";				
			}

			if($kardexmaquinas[$i]["saldo"]){
				
				$saldo =  "<p class='text-primary'>".$kardexmaquinas[$i]["saldo"]."</p>";				
			}

			if($kardexmaquinas[$i]["idMovimiento"]==1){
				
				$movimientos =  "<p class='text-success bg-success'>".$movimiento["descripcion"]."</p>";				
			}else{
				$movimientos =  "<p class='text-danger bg-danger'>".$movimiento["descripcion"]."</p>";	
			}




		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$kardexmaquinas[$i]["hora"].'",
				  "'.$movimientos.'",
			      "'.$kardexmaquinas[$i]["observacion"].'",
				  "'.$kardexmaquinas[$i]["fecha"].'",
				  "'.$ingreso.'",
				  "'.$salida.'",
				  "'.$saldo.'"
			    ],';

		  }

		  $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   '] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE MAQUINAS
=============================================*/ 
$activarKardexMaquinas = new TablaKardexMaquinas();
$activarKardexMaquinas -> mostrarTablaKardexMaquinas();