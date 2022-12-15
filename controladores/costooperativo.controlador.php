<?php

class ControladorCostoOperativo{

	/*=============================================
	MOSTRAR COSTOS OPERATIVOS
	=============================================*/

	static public function ctrMostrarCostoOperativo($item, $valor){

		$tabla = "gastoadmin";

		$respuesta = ModeloCostoOperativo::MdlMostrarCostoOperativo($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR COSTOS OPERATIVOS
	=============================================*/

	static public function ctrCrearCostoOperativo(){

		if(isset($_POST["nuevaDescripcion"])){

				$datos = array("descripcion" => $_POST["nuevaDescripcion"],
							   "idUnidadMedida" => $_POST["nuevaUnidadMedida"],
							   "precio" => $_POST["nuevoPrecio"],
							   "idTipoCosto" => $_POST["nuevoTipoCosto"]);

				$respuesta = ModeloCostoOperativo::mdlIngresarCostoOperativo($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El costo operativo ha sido guardado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "costooperativo";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	EDITAR COSTOS OPERATIVOS
	=============================================*/

	static public function ctrEditarCostoOperativo(){

		if(isset($_POST["editarDescripcion"])){

				$datos = array("idGastoAdmin" =>$_POST["idCostoOperativo"],
                               "descripcion" => $_POST["editarDescripcion"],
							   "idUnidadMedida" => $_POST["editarUnidadMedida"],
							   "precio" => $_POST["editarPrecio"],
							   "idTipoCosto" => $_POST["editarTipoCosto"]);
							
				$respuesta = ModeloCostoOperativo::mdlEditarCostoOperativo($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El costo operativo ha sido editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "costooperativo";
					
					});
					
					
					</script>';

					

				}


		}

	}

	/*=============================================
	BORRAR COSTOS OPERATIVOS
	=============================================*/
	static public function ctrEliminarCostoOperativo(){

		if(isset($_GET["idCostoOperativo"])){

			$datos = $_GET["idCostoOperativo"];

			$respuesta = ModeloCostoOperativo::mdlEliminarCostoOperativo($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El costo operativo ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "costooperativo";
				
				});
				
				
				</script>';

			}else{
				echo '<script>

				Swal.fire({
				
					icon: "error",
					title: "¡El costo operativo está en uso!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "costooperativo";
				
				});
				
				
				</script>';
			}			
		}


	}

}





	