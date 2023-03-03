<?php
require_once "../controladores/inventariomaquinas.controlador.php";
require_once "../modelos/inventariomaquinas.modelo.php";

require_once "../controladores/maquinas.controlador.php";
require_once "../modelos/maquinas.modelo.php";

class TablaInventarioMaquinas{

 	/*=============================================
 	 MOSTRAR LA TABLA DE MAQUINAS
  	=============================================*/ 

	public function mostrarTablaInventarioMaquinas(){

		$item = null;
    	$valor = null;

  		$inventariomaquinas = ControladorInventarioMaquinas::ctrMostrarInventarioMaquinas($item, $valor);	
		
		if(count($inventariomaquinas) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($inventariomaquinas); $i++){


			/*=============================================
 	 		TRAEMOS AL MAQUINA
  			=============================================*/ 

		  	$item1 = "idMaquina";
		  	$valor1 = $inventariomaquinas[$i]["idMaquina"];

		  	$maquinas = ControladorMaquinas::ctrMostrarMaquinas($item1, $valor1);
			
			$stock=$inventariomaquinas[$i]["stock"] ?? 0;

			if($stock<2){
				$stock =  "<button class='btn btn-danger'>".$stock."</button>";				
		    }else{
				$stock =  "<button class='btn btn-success'>".$stock."</button>";
			}

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$maquinas["nombre"].'",
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
ACTIVAR TABLA DE MAQUINAS
=============================================*/ 
$activarInventarioMaquinas = new TablaInventarioMaquinas();
$activarInventarioMaquinas -> mostrarTablaInventarioMaquinas();