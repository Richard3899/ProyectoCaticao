<?php

class ControladorRecetaDepreciacion{

	/*=============================================
	MOSTRAR LISTA DE RECETA DEPRECIACIÓN
	=============================================*/

	static public function ctrMostrarRecetaDepreciacion($item,$valor){

		$respuesta = ModeloRecetaDepreciacion::mdlMostrarRecetaDepreciacion($item,$valor);

		return $respuesta;
	}

	/*=============================================
	SUMAR TOTAL DE RECETA DEPRECIACIÓN
	=============================================*/
	static public function ctrSumaTotalRecetaDepreciacion($valor){

		$respuesta = ModeloRecetaDepreciacion::mdlSumaTotalRecetaDepreciacion($valor);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS DEPRECIACIÓN EN LA RECETA
	=============================================*/

	static public function ctrCrearRecetaDepreciacion(){
			
		if(isset($_POST["idMaquina"])){

			$datos = array("idReceta"=>$_POST["idReceta"],
						   "idMaquina"=>$_POST["idMaquina"],
						   "nombreMaquina"=>$_POST["nombreMaquina"],
						   "tiempoHoras"=>$_POST["nuevoTiempoHoras"],
						   "precioUnitario"=>$_POST["precioUnitario"],
						   "total"=>$_POST["precioTotal"]);
		
			$respuesta = ModeloRecetaDepreciacion::mdlIngresarRecetaDepreciacion($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡La depreciación fue agregada correctamente!",
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
	EDITAR DEPRECIACIÓN DE LA RECETA
	=============================================*/

	static public function ctrEditarRecetaDepreciacion(){

		if(isset($_POST["editaridRecetaDepreciacion"])){

			$datos = array( "idRecetaDepreciacion"=>$_POST["editaridRecetaDepreciacion"],
							"idReceta"=>$_POST["editaridReceta"],
							"tiempoHoras"=>$_POST["editarTiempoHoras"],
							"total"=>$_POST["editarprecioTotal"]);
							   
			$respuesta = ModeloRecetaDepreciacion::mdlEditarRecetaDepreciacion($datos);
		
				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡La depreciación fue editada correctamente!",
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
	BORRAR DEPRECIACIÓN DE LA RECETA
	=============================================*/
	static public function ctrEliminarRecetaDepreciacion(){

		if(isset($_GET["idRecetaDepreciacion"])){
            
			$datos = array("idRecetaDepreciacion"=>$_GET["idRecetaDepreciacion"],
						   "idReceta"=>$_GET["idReceta"]);
			
			$respuesta = ModeloRecetaDepreciacion::mdlEliminarRecetaDepreciacion($datos);
			
			if($respuesta == "ok"){

				echo '<script>
				
				$(".cd").val("'.$_GET["codigoReceta"].'");

				$(".nm").val("'.$_GET["nombreReceta"].'");

				Swal.fire({
				
					icon: "success",
					title: "¡La depreciación ha sido eliminada correctamente!",
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