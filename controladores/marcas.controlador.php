<?php

class ControladorMarcas{

	/*=============================================
	MOSTRAR MARCAS
	=============================================*/

	static public function ctrMostrarMarcas($item, $valor){

		$tabla = "marca";

		$respuesta = ModeloMarcas::MdlMostrarMarcas($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR MARCAS
	=============================================*/

	static public function ctrCrearMarca(){

		if(isset($_POST["nuevaDescripcionMarca"])){

		   		
				$datos = array("descripcion" => $_POST["nuevaDescripcionMarca"]
			     );
							   
				$respuesta = ModeloMarcas::mdlIngresarMarca($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡La marca ha sido guardada correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "marcas";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	EDITAR MARCAS
	=============================================*/

	static public function ctrEditarMarca(){

		if(isset($_POST["editarDescripcionMarca"])){


				$datos = array("idMarca" =>$_POST["idMarca"],
							   "descripcion" => $_POST["editarDescripcionMarca"]
							);
							   
				

				$respuesta = ModeloMarcas::mdlEditarMarca($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡La marca ha sido editada correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "marcas";
					
					});
					
					
					</script>';

					

				}


		}

	}

	/*=============================================
	ELIMINAR MARCAS
	=============================================*/
	static public function ctrEliminarMarca(){

		if(isset($_GET["idMarca"])){

			$datos = $_GET["idMarca"];


			$respuesta = ModeloMarcas::mdlEliminarMarca($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡La marca ha sido eliminada correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "marcas";
				
				});
				
				
				</script>';

			}		
		}


	}

}





	