<?php
require_once "../controladores/kardexmateriales.controlador.php";
require_once "../modelos/kardexmateriales.modelo.php";

require_once "../controladores/movimiento.controlador.php";
require_once "../modelos/movimiento.modelo.php";

require_once "../controladores/materiales.controlador.php";
require_once "../modelos/materiales.modelo.php";

require_once "../controladores/marcas.controlador.php";
require_once "../modelos/marcas.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

class TablaKardexMateriales{

 	/*=============================================
 	 MOSTRAR LA TABLA DE MATERIALES
  	=============================================*/ 

	public function mostrarTablaKardexMateriales(){

		$idMaterial=$_GET["MaterialK"];

  		$kardexmateriales = ControladorKardexMateriales::ctrMostrarKardexMateriales2($idMaterial);	
		
		if($idMaterial == 0){

			echo '{"data": []}';

			return;
		}
		if(count($kardexmateriales) == 0){

			echo '{"data": []}';

			return;
		}


  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($kardexmateriales); $i++){


			/*=============================================
 	 		TRAEMOS AL MATERIAL
  			=============================================*/ 

		  	$item1 = "idMateria";
		  	$valor1 = $kardexmateriales[$i]["idMateria"];

		  	$materiales = ControladorMateriales::ctrMostrarMateriales($item1, $valor1);


			/*=============================================
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$item3 = "idUnidadMedida";
		  	$valor3 = $materiales["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($item3, $valor3);

			/*=============================================
 	 		TRAEMOS EL MOVIMIENTO
  			=============================================*/ 

		  	$item4 = "idMovimiento";
		  	$valor4 = $kardexmateriales[$i]["idMovimiento"];

		  	$movimiento = ControladorMovimiento::ctrMostrarMovimiento($item4, $valor4);

			$ingreso=0;
			$salida=0;
			$saldo=0;
			$movimientos="";

			if($kardexmateriales[$i]["ingreso"]>0){
				
				$ingreso =  "<p class='text-success'>".$kardexmateriales[$i]["ingreso"].' '.$unidadmedida["descripcion"]."</p>";				
			}

			if($kardexmateriales[$i]["salida"]>0){
				
				$salida =  "<p class='text-danger'>".$kardexmateriales[$i]["salida"].' '.$unidadmedida["descripcion"]."</p>";				
			}

			if($kardexmateriales[$i]["saldo"]){
				
				$saldo =  "<p class='text-primary'>".$kardexmateriales[$i]["saldo"].' '.$unidadmedida["descripcion"]."</p>";				
			}

			if($kardexmateriales[$i]["idMovimiento"]==1){
				
				$movimientos =  "<p class='text-success bg-success'>".$movimiento["descripcion"]."</p>";				
			}else{
				$movimientos =  "<p class='text-danger bg-danger'>".$movimiento["descripcion"]."</p>";	
			}




		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$kardexmateriales[$i]["hora"].'",
				  "'.$movimientos.'",
			      "'.$kardexmateriales[$i]["observacion"].'",
				  "'.$kardexmateriales[$i]["fecha"].'",
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
ACTIVAR TABLA DE MATERIALES
=============================================*/ 
$activarKardexMateriales = new TablaKardexMateriales();
$activarKardexMateriales -> mostrarTablaKardexMateriales();