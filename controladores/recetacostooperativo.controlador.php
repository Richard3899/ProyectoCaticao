<?php

class ControladorRecetaCostoOperativo{

	/*=============================================
	MOSTRAR LISTA DE RECETA COSTO OPERATIVO
	=============================================*/

	static public function ctrMostrarRecetaCostoOperativo($item,$valor){

		$respuesta = ModeloRecetaCostoOperativo::mdlMostrarRecetaCostoOperativo($item,$valor);

		return $respuesta;
	}

	/*=============================================
	SUMAR TOTAL DE RECETA COSTO OPERATIVO
	=============================================*/
	static public function ctrSumaTotalRecetaCostoOperativo($valor){

		$respuesta = ModeloRecetaCostoOperativo::mdlSumaTotalRecetaCostoOperativo($valor);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS COSTO OPERATIVO EN LA RECETA
	=============================================*/

	static public function ctrCrearRecetaCostoOperativo(){
			
		if(isset($_POST["idCostoOperativo"])){

			$datos = array("idReceta"=>$_POST["idReceta"],
						   "idCostoOperativo"=>$_POST["idCostoOperativo"],
						   "nombreCostoOperativo"=>$_POST["nombreCostoOperativo"],
						   "cantidad"=>$_POST["nuevaCantidad"],
						   "precio"=>$_POST["precio"],
						   "total"=>$_POST["precioTotal"]);
		
			$respuesta = ModeloRecetaCostoOperativo::mdlIngresarRecetaCostoOperativo($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El costo operativo fue agregado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "index.php?ruta=recetacostooperativo&codigo='.$_POST["codigoReceta"].'&nombre='.$_POST["nombreReceta"].'&idReceta='.$_POST["idReceta"].'";
			
			    });
				
				</script>';

			}

		


		}

	}


	/*=============================================
	EDITAR COSTO OPERATIVO DE LA RECETA
	=============================================*/

	static public function ctrEditarRecetaCostoOperativo(){

		if(isset($_POST["editaridRecetaCostoOperativo"])){

			$datos = array( "idRecetaCostoOperativo"=>$_POST["editaridRecetaCostoOperativo"],
							"cantidad"=>$_POST["editarCantidad"],
							"total"=>$_POST["editarPrecioTotal"]);
							   
			$respuesta = ModeloRecetaCostoOperativo::mdlEditarRecetaCostoOperativo($datos);
		
				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡El costo operativo fue editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=recetacostooperativo&codigo='.$_POST["editarcodigoReceta"].'&nombre='.$_POST["editarnombreReceta"].'&idReceta='.$_POST["editaridReceta"].'";
				
					});
					
					</script>';
	
				}


		}

	}


	/*=============================================
	BORRAR COSTO OPERATIVO DE LA RECETA
	=============================================*/
	static public function ctrEliminarRecetaCostoOperativo(){

		if(isset($_GET["idRecetaCostoOperativo"])){
            
			$datos = array("idRecetaCostoOperativo"=>$_GET["idRecetaCostoOperativo"]);
			
			$respuesta = ModeloRecetaCostoOperativo::mdlEliminarRecetaCostoOperativo($datos);
			
			if($respuesta == "ok"){

				echo '<script>
				
				$(".cd").val("'.$_GET["codigoReceta"].'");

				$(".nm").val("'.$_GET["nombreReceta"].'");

				Swal.fire({
				
					icon: "success",
					title: "¡El costo operativo ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){

					window.location = "index.php?ruta=recetacostooperativo&codigo='.$_GET["codigoReceta"].'&nombre='.$_GET["nombreReceta"].'&idReceta='.$_GET["idReceta"].'";
			
			    });
				
				</script>';

			}		
		}


	}

}