<?php

class ControladorCostoVenta{

	/*=============================================
	MOSTRAR COSTO DE VENTA
	=============================================*/

	static public function ctrMostrarCostoVenta($item, $valor){

		$tabla = "gastoadmin";

		$respuesta = ModeloCostoVenta::MdlMostrarCostoVenta($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR COSTO DE VENTA
	=============================================*/

	static public function ctrCrearCostoVenta(){

		if(isset($_POST["nuevaDescripcion"])){

				$datos = array("descripcion" => $_POST["nuevaDescripcion"],
							   "idUnidadMedida" => $_POST["nuevaUnidadMedida"],
							   "precio" => $_POST["nuevoPrecio"],
							   "idTipoCosto" => $_POST["nuevoTipoCosto"]);

				$respuesta = ModeloCostoVenta::mdlIngresarCostoVenta($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El costo de venta ha sido guardado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "costoventa";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	EDITAR COSTO DE VENTA
	=============================================*/

	static public function ctrEditarCostoVenta(){

		if(isset($_POST["editarDescripcion"])){

				$datos = array("idGastoAdmin" =>$_POST["idCostoVenta"],
                               "descripcion" => $_POST["editarDescripcion"],
							   "idUnidadMedida" => $_POST["editarUnidadMedida"],
							   "precio" => $_POST["editarPrecio"],
							   "idTipoCosto" => $_POST["editarTipoCosto"]);
							
				$respuesta = ModeloCostoVenta::mdlEditarCostoVenta($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El costo de venta ha sido editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "costoventa";
					
					});
					
					
					</script>';

					

				}


		}

	}

	/*=============================================
	BORRAR COSTO DE VENTA
	=============================================*/
	static public function ctrEliminarCostoVenta(){

		if(isset($_GET["idCostoVenta"])){

			$datos = $_GET["idCostoVenta"];

			$respuesta = ModeloCostoVenta::mdlEliminarCostoVenta($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El costo de venta ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "costoventa";
				
				});
				
				
				</script>';

			}else{
				echo '<script>

				Swal.fire({
				
					icon: "error",
					title: "¡El costo de venta está en uso!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "costoventa";
				
				});
				
				
				</script>';
			}	
		}


	}

}





	