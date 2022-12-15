<?php

class ControladorCostoMarketing{

	/*=============================================
	MOSTRAR COSTOS DE MARKETING
	=============================================*/

	static public function ctrMostrarCostoMarketing($item, $valor){

		$tabla = "gastoadmin";

		$respuesta = ModeloCostoMarketing::MdlMostrarCostoMarketing($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR COSTOS DE MARKETING
	=============================================*/

	static public function ctrCrearCostoMarketing(){

		if(isset($_POST["nuevaDescripcion"])){

				$datos = array("descripcion" => $_POST["nuevaDescripcion"],
							   "idUnidadMedida" => $_POST["nuevaUnidadMedida"],
							   "precio" => $_POST["nuevoPrecio"],
							   "idTipoCosto" => $_POST["nuevoTipoCosto"]);

				$respuesta = ModeloCostoMarketing::mdlIngresarCostoMarketing($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El costo de marketing ha sido guardado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "costomarketing";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	EDITAR COSTOS DE MARKETING
	=============================================*/

	static public function ctrEditarCostoMarketing(){

		if(isset($_POST["editarDescripcion"])){

				$datos = array("idGastoAdmin" =>$_POST["idCostoMarketing"],
                               "descripcion" => $_POST["editarDescripcion"],
							   "idUnidadMedida" => $_POST["editarUnidadMedida"],
							   "precio" => $_POST["editarPrecio"],
							   "idTipoCosto" => $_POST["editarTipoCosto"]);
							
				$respuesta = ModeloCostoMarketing::mdlEditarCostoMarketing($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El costo de marketing ha sido editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "costomarketing";
					
					});
					
					
					</script>';

					

				}


		}

	}

	/*=============================================
	BORRAR COSTOS DE MARKETING
	=============================================*/
	static public function ctrEliminarCostoMarketing(){

		if(isset($_GET["idCostoMarketing"])){

			$datos = $_GET["idCostoMarketing"];

			$respuesta = ModeloCostoMarketing::mdlEliminarCostoMarketing($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El costo de marketing ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "costomarketing";
				
				});
				
				
				</script>';

			}else{
				echo '<script>

				Swal.fire({
				
					icon: "error",
					title: "¡El costo de marketing está en uso!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "costomarketing";
				
				});
				
				
				</script>';
			}		
		}


	}

}





	