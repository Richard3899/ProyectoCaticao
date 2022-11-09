<?php
require_once "../controladores/inventarioinsumos.controlador.php";
require_once "../modelos/inventarioinsumos.modelo.php";

require_once "../controladores/insumos.controlador.php";
require_once "../modelos/insumos.modelo.php";

require_once "../controladores/marcas.controlador.php";
require_once "../modelos/marcas.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

class TablaInventarioInsumos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE INSUMOS
  	=============================================*/ 

	public function mostrarTablaInventarioInsumos(){

		$item = null;
    	$valor = null;

  		$inventarioinsumos = ControladorInventarioInsumos::ctrMostrarInventarioInsumos($item, $valor);	
		
  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($inventarioinsumos); $i++){


			/*=============================================
 	 		TRAEMOS AL INSUMO
  			=============================================*/ 

		  	$item1 = "idMateria";
		  	$valor1 = $inventarioinsumos[$i]["idMateria"];

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

			$stock=$inventarioinsumos[$i]["stock"] ?? 0;

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$insumos["nombre"].' - '.$marcas["descripcion"].'",
			      "'.$stock.' - '.$unidadmedida["descripcion"].'"
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
$activarInventarioInsumos = new TablaInventarioInsumos();
$activarInventarioInsumos -> mostrarTablaInventarioInsumos();