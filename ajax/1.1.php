<?php
require_once "../controladores/inventarioinsumos.controlador.php";
require_once "../modelos/inventarioinsumos.modelo.php";

require_once "../controladores/insumos.controlador.php";
require_once "../modelos/insumos.modelo.php";

require_once "../controladores/marcas.controlador.php";
require_once "../modelos/marcas.modelo.php";

require_once "../controladores/unidadmedida.controlador.php";
require_once "../modelos/unidadmedida.modelo.php";

class TablaAgregarInsumos{

 	/*=============================================
 	 MOSTRAR LA TABLA DE INSUMOS
  	=============================================*/ 

	public function mostrarTablaAgregarInsumos(){

		$item = null;
    	$valor = null;

  		$inventarioinsumos = ControladorInventarioInsumos::ctrMostrarInventarioInsumos($item, $valor);	
		
		if(count($inventarioinsumos) == 0){

			echo '{"data": []}';

			return;
		}

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
 	 		TRAEMOS LA IMAGEN
  			=============================================*/ 
			  if($insumos["imagen"] != ""){

				$imagen = "<img src='".$insumos["imagen"]."' width='40px'>";

			  }else{

				$imagen = "<img src='vistas/img/insumos/default/insumo.png' class='img-thumbnail' width='40px'>";

			  };
		
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


			if($stock<10){
				$stock =  "<button class='btn btn-danger'>".$stock.' '.$unidadmedida["descripcion"]."</button>";				
			}else if($stock>9 & $stock<15){
				$stock =  "<button class='btn btn-warning'>".$stock.' '.$unidadmedida["descripcion"]."</button>";	
			}else{
				$stock =  "<button class='btn btn-success'>".$stock.' '.$unidadmedida["descripcion"]."</button>";
			}

			$botones =  "<div class='btn-group'><button class='btn btn-info agregarInsumo recuperarBoton' idInsumo='".$insumos["idMateria"]."'>Agregar</button></div>"; 


		  	$datosJson .='[
			      "'.($i+1).'",
				  "'.$imagen.'",
				  "'.$insumos["codigo"].'-'.$insumos["nombre"].'-'.$marcas["descripcion"].'",
			      "'.$stock.'",
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
ACTIVAR TABLA DE INSUMOS
=============================================*/ 
$activarAgregarInsumos = new TablaAgregarInsumos();
$activarAgregarInsumos -> mostrarTablaAgregarInsumos();