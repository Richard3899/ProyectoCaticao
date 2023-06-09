<?php
require_once "../controladores/inventarioproductos.controlador.php";
require_once "../modelos/inventarioproductos.modelo.php";

require_once "../controladores/productos.controlador.php";
require_once "../modelos/productos.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

require_once "../controladores/tipoproducto.controlador.php";
require_once "../modelos/tipoproducto.modelo.php";

class TablaInventarioProductos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE PRODUCTOS
  	=============================================*/ 

	public function mostrarTablaInventarioProductos(){

		$item = null;
    	$valor = null;

  		$inventarioproductos = ControladorInventarioProductos::ctrMostrarInventarioProductos($item, $valor);	
		
		if(count($inventarioproductos) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($inventarioproductos); $i++){


			/*=============================================
 	 		TRAEMOS AL PRODUCTO
  			=============================================*/ 

		  	$item1 = "idProducto";
		  	$valor1 = $inventarioproductos[$i]["idProducto"];

		  	$productos = ControladorProductos::ctrMostrarProductos($item1, $valor1);


			/*=============================================
 	 		TRAEMOS LA UNIDAD DE MEDIDA
  			=============================================*/ 

		  	$item3 = "idUnidadMedida";
		  	$valor3 = $productos["idUnidadMedida"];

		  	$unidadmedida = ControladorUnidadMedida::ctrMostrarUnidadMedida($item3, $valor3);

			/*=============================================
 	 		TRAEMOS TIPO PRODUCTO
  			=============================================*/ 

		  	$item = "idTipoProducto";
		  	$valor = $productos["idTipoProducto"];

		  	$tipoproducto = ControladorTipoProducto::ctrMostrarTipoProducto($item, $valor);

			if($productos["idTipoProducto"]==1){

				$tp =  "<button class='btn btn-success'>".$tipoproducto["descripcion"]."</button>";
					
							
			}else{

				$tp =  "<button class='btn btn-info'>".$tipoproducto["descripcion"]."</button>";
				
			}

		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$productos["nombre"].'",
				  "'.$tp.'",
			      "'.$inventarioproductos[$i]["stock"].'",
				  "'.$unidadmedida["descripcion"].'",
				  "'.$inventarioproductos[$i]["ultimoMovimiento"].'"
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
$activarInventarioProductos = new TablaInventarioProductos();
$activarInventarioProductos -> mostrarTablaInventarioProductos();