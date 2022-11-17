<?php

class ControladorLotes{

	/*=============================================
	MOSTRAR LOTES
	=============================================*/

	static public function ctrMostrarLotes($item, $valor){

		$tabla = "lote";

		$respuesta = ModeloLotes::MdlMostrarLotes($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR LOTES
	=============================================*/

	static public function ctrCrearLote(){

		if(isset($_POST["nuevaDescripcionLote"])){

		   		
				$datos = array("descripcion" => $_POST["nuevaDescripcionLote"]
			     );
							   
				$respuesta = ModeloLotes::mdlIngresarLote($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡La lote ha sido guardada correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "lotes";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	EDITAR LOTES
	=============================================*/

	static public function ctrEditarLote(){

		if(isset($_POST["editarDescripcionLote"])){


				$datos = array("idLote" =>$_POST["idLote"],
							   "descripcion" => $_POST["editarDescripcionLote"]
							);
							   
				

				$respuesta = ModeloLotes::mdlEditarLote($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡La lote ha sido editada correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "lotes";
					
					});
					
					
					</script>';

					

				}


		}

	}

	/*=============================================
	ELIMINAR LOTES
	=============================================*/
	static public function ctrEliminarLote(){

		if(isset($_GET["idLote"])){

			$datos = $_GET["idLote"];


			$respuesta = ModeloLotes::mdlEliminarLote($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡La lote ha sido eliminada correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "lotes";
				
				});
				
				
				</script>';

			}		
		}


	}

}





	