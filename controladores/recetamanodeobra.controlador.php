<?php

class ControladorRecetaManodeObra{

	/*=============================================
	MOSTRAR LISTA DE RECETA MANO DE OBRA
	=============================================*/

	static public function ctrMostrarRecetaManodeObra($item,$valor){

		$respuesta = ModeloRecetaManodeObra::mdlMostrarRecetaManodeObra($item,$valor);

		return $respuesta;
	}

	/*=============================================
	SUMAR TOTAL DE RECETA MANO DE OBRA
	=============================================*/
	static public function ctrSumaTotalRecetaManodeObra($valor){

		$respuesta = ModeloRecetaManodeObra::mdlSumaTotalRecetaManodeObra($valor);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS MANO DE OBRA EN LA RECETA
	=============================================*/

	static public function ctrCrearRecetaManodeObra(){
			
		if(isset($_POST["idEmpleado"])){

			$datos = array("idReceta"=>$_POST["idReceta"],
						   "idEmpleado"=>$_POST["idEmpleado"],
						   "idMaquina"=>$_POST["idMaquina"],
						   "nombreEmpleado"=>$_POST["nombreEmpleado"],
						   "nombreMaquina"=>$_POST["nombreMaquina"],
						   "tiempoHoras"=>$_POST["nuevoTiempoHoras"],
						   "precioUnitario"=>$_POST["precioUnitario"],
						   "total"=>$_POST["precioTotal"]);
		
			$respuesta = ModeloRecetaManodeObra::mdlIngresarRecetaManodeObra($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡La mano de obra fue agregada correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "index.php?ruta=recetamanodeobra&codigo='.$_POST["codigoReceta"].'&nombre='.$_POST["nombreReceta"].'&idReceta='.$_POST["idReceta"].'";
			
			    });
				
				</script>';

			}

		


		}

	}


	/*=============================================
	EDITAR MANO DE OBRA DE LA RECETA
	=============================================*/

	static public function ctrEditarRecetaManodeObra(){

		if(isset($_POST["editaridRecetaManodeObra"])){

			$datos = array( "idRecetaManodeObra"=>$_POST["editaridRecetaManodeObra"],
							"tiempoHoras"=>$_POST["editarTiempoHoras"],
							"total"=>$_POST["editarprecioTotal"]);
							   
			$respuesta = ModeloRecetaManodeObra::mdlEditarRecetaManodeObra($datos);

				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡La mano de obra fue editada correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=recetamanodeobra&codigo='.$_POST["editarcodigoReceta"].'&nombre='.$_POST["editarnombreReceta"].'&idReceta='.$_POST["editaridReceta"].'";
				
					});
					
					</script>';
	
				}


		}

	}


	/*=============================================
	BORRAR MANO DE OBRA DE LA RECETA
	=============================================*/
	static public function ctrEliminarRecetaManodeObra(){

		if(isset($_GET["idRecetaManodeObra"])){
            
			$datos = array("idRecetaManodeObra"=>$_GET["idRecetaManodeObra"]);
			
			$respuesta = ModeloRecetaManodeObra::mdlEliminarRecetaManodeObra($datos);
			
			if($respuesta == "ok"){

				echo '<script>
				
				$(".cd").val("'.$_GET["codigoReceta"].'");

				$(".nm").val("'.$_GET["nombreReceta"].'");

				Swal.fire({
				
					icon: "success",
					title: "¡La mano de obra ha sido eliminada correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){

					window.location = "index.php?ruta=recetamanodeobra&codigo='.$_GET["codigoReceta"].'&nombre='.$_GET["nombreReceta"].'&idReceta='.$_GET["idReceta"].'";
			
			    });
				
				</script>';

			}		
		}


	}

}