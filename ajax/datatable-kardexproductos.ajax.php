<?php
require_once "../controladores/kardexproductos.controlador.php";
require_once "../modelos/kardexproductos.modelo.php";

require_once "../controladores/movimiento.controlador.php";
require_once "../modelos/movimiento.modelo.php";

require_once "../controladores/productos.controlador.php";
require_once "../modelos/productos.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

require_once "../controladores/lotes.controlador.php";
require_once "../modelos/lotes.modelo.php";

class TablaKardexProductos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE PRODUCTOS
  	=============================================*/ 

	public function mostrarTablaKardexProductos(){

		$idProducto=$_GET["ProductoK"];

  		$kardexproductos = ControladorKardexProductos::ctrMostrarKardexProductos($idProducto);	
		
		if($idProducto == 0){

			echo '{"data": []}';

			return;
		}
		if(count($kardexproductos) == 0){

			echo '{"data": []}';

			return;
		}


  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($kardexproductos); $i++){

			/*=============================================
 	 		TRAEMOS AL PRODUCTO
  			=============================================*/ 

		  	$item1 = "idProducto";
		  	$valor1 = $kardexproductos[$i]["idProducto"];

		  	$productos = ControladorProductos::ctrMostrarProductos($item1, $valor1);

			/*=============================================
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$item3 = "idUnidadMedida";
		  	$valor3 = $productos["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($item3, $valor3);

			/*=============================================
 	 		TRAEMOS EL MOVIMIENTO
  			=============================================*/ 

		  	$item4 = "idMovimiento";
		  	$valor4 = $kardexproductos[$i]["idMovimiento"];

		  	$movimiento = ControladorMovimiento::ctrMostrarMovimiento($item4, $valor4);

			$movimientos="";

			if($kardexproductos[$i]["idMovimiento"]==1){
				
				$movimientos =  "<p class='text-success bg-success'>".$movimiento["descripcion"]."</p>";				
			}else{
				$movimientos =  "<p class='text-danger bg-danger'>".$movimiento["descripcion"]."</p>";	
			}

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$kardexproductos[$i]["hora"].'",
				  "'.$movimientos.'",
			      "'.$kardexproductos[$i]["observacion"].'",
				  "'.$kardexproductos[$i]["fecha"].'",
				  "'.$kardexproductos[$i]["codigoLote"].'",
				  "'.$kardexproductos[$i]["ingreso"].'",
				  "'.$kardexproductos[$i]["salida"].'",
				  "'.$kardexproductos[$i]["saldo"].'"
			    ],';

		  }

		  $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   '] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE PRODUCTOS
=============================================*/ 
$activarKardexProductos = new TablaKardexProductos();
$activarKardexProductos -> mostrarTablaKardexProductos();