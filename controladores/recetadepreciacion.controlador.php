<?php

class ControladorRecetaDepreciacion{

	/*=============================================
	MOSTRAR LISTA DE RECETA DEPRECIACION
	=============================================*/

	static public function ctrMostrarRecetaDepreciacion($item,$valor){

		$respuesta = ModeloRecetaDepreciacion::mdlMostrarRecetaDepreciacion($item,$valor);

		return $respuesta;
	}

	/*=============================================
	SUMAR TOTAL DE RECETA DEPRECIACION
	=============================================*/
	static public function ctrSumaTotalRecetaDepreciacion($valor){

		$respuesta = ModeloRecetaDepreciacion::mdlSumaTotalRecetaDepreciacion($valor);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS DEPRECIACION EN LA RECETA
	=============================================*/

	static public function ctrCrearRecetaDepreciacion(){
			
		if(isset($_POST["idDepreciacion"])){

			$datos = array("idReceta"=>$_POST["idReceta"],
						   "codigoReceta"=>$_POST["codigoReceta"],
						   "idMateria"=>$_POST["idDepreciacion"],
						   "nombre"=>$_POST["nombreDepreciacion"],
						   "cantidad"=>$_POST["nuevaCantidad"],
						   "precioUnitario"=>$_POST["precioUnitario"],
						   "total"=>$_POST["precioTotal"]);
		
			$respuesta = ModeloRecetaDepreciacion::mdlIngresarRecetaDepreciacion($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El depreciacion fue agregado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "index.php?ruta=recetadepreciacion&codigo='.$_POST["codigoReceta"].'&nombre='.$_POST["nombreReceta"].'&idReceta='.$_POST["idReceta"].'";
			
			    });
				
				</script>';

			}

		


		}

	}


	/*=============================================
	EDITAR DEPRECIACION DE LA RECETA
	=============================================*/

	static public function ctrEditarRecetaDepreciacion(){

		if(isset($_POST["editaridRecetaDepreciacion"])){

			$datos = array( "idDepreciacionReceta"=>$_POST["editaridRecetaDepreciacion"],
			                "idReceta"=>$_POST["editaridReceta"],
							"codigoReceta"=>$_POST["editarcodigoReceta"],
							"idMateria"=>$_POST["editaridDepreciacion"],
							"nombre"=>$_POST["editarNombreDepreciacion"],
							"cantidadAnterior"=>$_POST["cantidadAnterior"],
							"diferenciaCantidad"=>$_POST["diferenciaCantidad"],
							"cantidad"=>$_POST["editarCantidad"],
							"precioUnitario"=>$_POST["editarprecioUnitario"],
							"total"=>$_POST["editarprecioTotal"]);
							   
			$respuesta = ModeloRecetaDepreciacion::mdlEditarRecetaDepreciacion($datos);

				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡El depreciacion fue editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=recetadepreciacion&codigo='.$_POST["editarcodigoReceta"].'&nombre='.$_POST["editarnombreReceta"].'&idReceta='.$_POST["editaridReceta"].'";
				
					});
					
					</script>';
	
				}


		}

	}


	/*=============================================
	BORRAR DEPRECIACION DE LA RECETA
	=============================================*/
	static public function ctrEliminarRecetaDepreciacion(){

		if(isset($_GET["idRecetaDepreciacion"])){
            
			$datos = array("idRecetaDepreciacion"=>$_GET["idRecetaDepreciacion"],
						   "codigoReceta"=>$_GET["codigoReceta"],
			               "idMateria"=>$_GET["idDepreciacion"],
						   "cantidad"=>$_GET["cantidadDepreciacion"]);
			
			$respuesta = ModeloRecetaDepreciacion::mdlEliminarRecetaDepreciacion($datos);
			
			if($respuesta == "ok"){

				echo '<script>
				
				$(".cd").val("'.$_GET["codigoReceta"].'");

				$(".nm").val("'.$_GET["nombreReceta"].'");

				Swal.fire({
				
					icon: "success",
					title: "¡El depreciacion ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){

					window.location = "index.php?ruta=recetadepreciacion&codigo='.$_GET["codigoReceta"].'&nombre='.$_GET["nombreReceta"].'&idReceta='.$_GET["idReceta"].'";
			
			    });
				
				</script>';

			}		
		}


	}

}