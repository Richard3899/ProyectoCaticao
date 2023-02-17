<?php
require_once "../controladores/kardexinsumos.controlador.php";
require_once "../modelos/kardexinsumos.modelo.php";

require_once "../controladores/movimiento.controlador.php";
require_once "../modelos/movimiento.modelo.php";

require_once "../controladores/insumos.controlador.php";
require_once "../modelos/insumos.modelo.php";

require_once "../controladores/marcas.controlador.php";
require_once "../modelos/marcas.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

class TablaKardexInsumos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE INSUMOS
  	=============================================*/ 

	public function mostrarTablaKardexInsumos(){

		$idInsumo=$_GET["InsumoK"];

  		$kardexinsumos = ControladorKardexInsumos::ctrMostrarKardexInsumos($idInsumo);	
		
		if($idInsumo == 0){

			echo '{"data": []}';

			return;
		}
		if(count($kardexinsumos) == 0){

			echo '{"data": []}';

			return;
		}


  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($kardexinsumos); $i++){


			/*=============================================
 	 		TRAEMOS AL INSUMO
  			=============================================*/ 

		  	$item1 = "idMateria";
		  	$valor1 = $kardexinsumos[$i]["idMateria"];

		  	$insumos = ControladorInsumos::ctrMostrarInsumos($item1, $valor1);


			/*=============================================
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$item3 = "idUnidadMedida";
		  	$valor3 = $insumos["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($item3, $valor3);

			/*=============================================
 	 		TRAEMOS EL MOVIMIENTO
  			=============================================*/ 

		  	$item4 = "idMovimiento";
		  	$valor4 = $kardexinsumos[$i]["idMovimiento"];

		  	$movimiento = ControladorMovimiento::ctrMostrarMovimiento($item4, $valor4);

			$ingreso=0;
			$salida=0;
			$saldo=0;
			$movimientos="";

			if($kardexinsumos[$i]["ingreso"]>0){
				
				$ingreso =  "<p class='text-success'>".$kardexinsumos[$i]["ingreso"].' '.$unidadmedida["descripcion"]."</p>";				
			}

			if($kardexinsumos[$i]["salida"]>0){
				
				$salida =  "<p class='text-danger'>".$kardexinsumos[$i]["salida"].' '.$unidadmedida["descripcion"]."</p>";				
			}

			if($kardexinsumos[$i]["saldo"]){
				
				$saldo =  "<p class='text-primary'>".$kardexinsumos[$i]["saldo"].' '.$unidadmedida["descripcion"]."</p>";				
			}

			if($kardexinsumos[$i]["idMovimiento"]==1){
				
				$movimientos =  "<p class='text-success bg-success'>".$movimiento["descripcion"]."</p>";				
			}else{
				$movimientos =  "<p class='text-danger bg-danger'>".$movimiento["descripcion"]."</p>";	
			}




		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$kardexinsumos[$i]["hora"].'",
				  "'.$movimientos.'",
			      "'.$kardexinsumos[$i]["observacion"].'",
				  "'.$kardexinsumos[$i]["codigoReceta"].'",
				  "'.$kardexinsumos[$i]["fecha"].'",
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
ACTIVAR TABLA DE INSUMOS
=============================================*/ 
$activarKardexInsumos = new TablaKardexInsumos();
$activarKardexInsumos -> mostrarTablaKardexInsumos();