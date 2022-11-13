<?php
require_once "../controladores/inventariomateriales.controlador.php";
require_once "../modelos/inventariomateriales.modelo.php";

require_once "../controladores/materiales.controlador.php";
require_once "../modelos/materiales.modelo.php";

require_once "../controladores/marcas.controlador.php";
require_once "../modelos/marcas.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

class TablaInventarioMateriales{

 	/*=============================================
 	 MOSTRAR LA TABLA DE MATERIALES
  	=============================================*/ 

	public function mostrarTablaInventarioMateriales(){

		$item = null;
    	$valor = null;

  		$inventariomateriales = ControladorInventarioMateriales::ctrMostrarInventarioMateriales($item, $valor);	
		
		if(count($inventariomateriales) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($inventariomateriales); $i++){


			/*=============================================
 	 		TRAEMOS AL MATERIAL
  			=============================================*/ 

		  	$item1 = "idMateria";
		  	$valor1 = $inventariomateriales[$i]["idMateria"];

		  	$materiales = ControladorMateriales::ctrMostrarMateriales($item1, $valor1);

		
			/*=============================================
 	 		TRAEMOS LA MARCA
  			=============================================*/ 

		  	$item2 = "idMarca";
		  	$valor2 = $materiales["idMarca"];

		  	$marcas = ControladorMarcas::ctrMostrarMarcas($item2, $valor2);


			/*=============================================
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$item3 = "idUnidadMedida";
		  	$valor3 = $materiales["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($item3, $valor3);

			$stock=$inventariomateriales[$i]["stock"] ?? 0;


			if($stock<10){
				$stock =  "<button class='btn btn-danger'>".$stock.' '.$unidadmedida["descripcion"]."</button>";				
			}else if($stock>9 & $stock<15){
				$stock =  "<button class='btn btn-warning'>".$stock.' '.$unidadmedida["descripcion"]."</button>";	
			}else{
				$stock =  "<button class='btn btn-success'>".$stock.' '.$unidadmedida["descripcion"]."</button>";
			}

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$materiales["nombre"].' - '.$marcas["descripcion"].'",
			      "'.$stock.'"
			    ],';

		  }

		  $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   '] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE MATERIALES
=============================================*/ 
$activarInventarioMateriales = new TablaInventarioMateriales();
$activarInventarioMateriales -> mostrarTablaInventarioMateriales();