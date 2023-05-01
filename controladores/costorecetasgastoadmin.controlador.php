<?php

class ControladorCostoRecetasGastoAdmin{

	/*=============================================
	MOSTRAR COSTO DE RECETAS Y GASTO ADMINISTRATIVO
	=============================================*/

	static public function ctrMostrarCostoRecetasGastoAdmin($item, $valor){

		$tabla = "costorecetasgastoadmin";

		$respuesta = ModeloCostoRecetasGastoAdmin::MdlMostrarCostoRecetasGastoAdmin($tabla, $item, $valor);

		return $respuesta;
	}

	/*=============================================
	CREAR COSTO DE RECETAS Y GASTO ADMINISTRATIVO
	=============================================*/

	static public function ctrCrearCostoRecetasGastoAdmin(){

		if(isset($_POST["nuevaDescripcion"])){

				$datos = array("descripcion" => $_POST["nuevaDescripcion"],
							   "mes" => $_POST["nuevoMes"].'-01');

				$respuesta = ModeloCostoRecetasGastoAdmin::mdlIngresarCostoRecetasGastoAdmin($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El costo de recetas y gasto admin ha sido guardado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "costorecetasgastoadmin";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	CREAR COSTO DE RECETAS Y GASTO ADMINISTRATIVO
	=============================================*/

	static public function ctrEditarCostoRecetasGastoAdmin(){

		if(isset($_POST["editarDescripcion"])){

				$datos = array("idCostoRecetasGastoAdmin" => $_POST["idCostoRecetasGastoAdmin"],
							   "descripcion" => $_POST["editarDescripcion"]);

				$respuesta = ModeloCostoRecetasGastoAdmin::mdlEditarCostoRecetasGastoAdmin($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El costo de recetas y gasto admin ha sido editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "costorecetasgastoadmin";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	BORRAR COSTO DE RECETAS Y GASTO ADMINISTRATIVO
	=============================================*/
	static public function ctrEliminarCostoRecetasGastoAdmin(){

		if(isset($_GET["idCostoRecetasGastoAdmin"])){

			$datos = $_GET["idCostoRecetasGastoAdmin"];

			$respuesta = ModeloCostoRecetasGastoAdmin::mdlEliminarCostoRecetasGastoAdmin($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El costo de recetas y gasto admin ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "costorecetasgastoadmin";
				
				});
				
				
				</script>';

			}	
		}


	}

}





	