<?php

require_once "../controladores/costoventa.controlador.php";
require_once "../modelos/costoventa.modelo.php";

require_once "../controladores/tipocosto.controlador.php";
require_once "../modelos/tipocosto.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

class TablaCostoVenta{

 	/*=============================================
 	 MOSTRAR LA TABLA DE COSTO DE VENTA
  	=============================================*/ 

	public function mostrarTablaCostoVenta(){

		$item = null;
    	$valor = null;

  		$costoventa = ControladorCostoVenta::ctrMostrarCostoVenta($item, $valor);	
		
		if(count($costoventa) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($costoventa); $i++){
	  

		  	/*=============================================
 	 		TRAEMOS LA TIPO DE COSTO
  			=============================================*/ 

		  	$item = "idTipoCosto";
		  	$valor = $costoventa[$i]["idTipoCosto"];

		  	$tipocosto = ControladorTipoCosto::ctrMostrarTipoCosto($item, $valor);

			/*=============================================
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$items = "idUnidadMedida";
		  	$valors = $costoventa[$i]["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($items, $valors);


		  	/*=============================================
 	 		TRAEMOS LAS ACCIONES
  			=============================================*/ 

		  	$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarCostoVenta' idCostoVenta='".$costoventa[$i]["idGastoAdmin"]."' data-toggle='modal' data-target='#modalEditarCostoVenta'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarCostoVenta' idCostoVenta='".$costoventa[$i]["idGastoAdmin"]."'><i class='fa fa-times'></i></button></div>"; 

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$costoventa[$i]["descripcion"].'",
				  "'.$unidadmedida["descripcion"].'",
			      "'."S/. ".$costoventa[$i]["precio"].'",
				  "'.$tipocosto["descripcion"].'",
			      "'.$botones.'"
			    ],';

		  }

		  $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   '] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE COSTO DE VENTA
=============================================*/ 
$activarCostoVenta = new TablaCostoVenta();
$activarCostoVenta -> mostrarTablaCostoVenta();