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

		$item = null;
    	$valor = null;

  		$kardexinsumos = ControladorKardexInsumos::ctrMostrarKardexInsumos($item, $valor);	
		
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
 	 		TRAEMOS LA MARCA
  			=============================================*/ 

		  	$item2 = "idMarca";
		  	$valor2 = $insumos["idMarca"];

		  	$marcas = ControladorMarcas::ctrMostrarMarcas($item2, $valor2);


			/*=============================================
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$item3 = "idUnidadMedida";
		  	$valor3 = $insumos["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($item3, $valor3);

			$stock=$kardexinsumos[$i]["stock"] ?? 0;

			/*=============================================
 	 		TRAEMOS EL MOVIMIENTO
  			=============================================*/ 

		  	$item4 = "idMovimiento";
		  	$valor4 = $kardexinsumos[$i]["idMovimiento"];

		  	$movimiento = ControladorMovimiento::ctrMostrarMovimiento($item4, $valor4);

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$insumos["nombre"].' - '.$marcas["descripcion"].'",
				  "'.$movimiento["descripcion"].'",
			      "'.$kardexinsumos[$i]["observacion"].'",
				  "'.$kardexinsumos[$i]["fecha"].'",
				  "'.$kardexinsumos[$i]["hora"].'",
				  "'.$kardexinsumos[$i]["ingreso"].'",
				  "'.$kardexinsumos[$i]["salida"].'",
				  "'.$kardexinsumos[$i]["saldo"].'"
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