<?php

class ControladorGastoAdmin{

	/*=============================================
	MOSTRAR GASTOS ADMIN
	=============================================*/

	static public function ctrMostrarGastoAdmin($item, $valor){

		$tabla = "gastoadmin";

		$respuesta = ModeloGastoAdmin::MdlMostrarGastoAdmin($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR GASTOS ADMIN
	=============================================*/

	static public function ctrCrearGastoAdmin(){

		if(isset($_POST["nuevaDescripcion"])){

				$datos = array("descripcion" => $_POST["nuevaDescripcion"],
							   "idUnidadMedida" => $_POST["nuevaUnidadMedida"],
							   "precio" => $_POST["nuevoPrecio"],
							   "idTipoCosto" => $_POST["nuevoTipoCosto"]);

				$respuesta = ModeloGastoAdmin::mdlIngresarGastoAdmin($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El gasto administrativo ha sido guardado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "gastoadmin";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	EDITAR GASTOS ADMIN
	=============================================*/

	static public function ctrEditarGastoAdmin(){

		if(isset($_POST["editarDescripcion"])){

				$datos = array("idGastoAdmin" =>$_POST["idGastoAdmin"],
                               "descripcion" => $_POST["editarDescripcion"],
							   "idUnidadMedida" => $_POST["editarUnidadMedida"],
							   "precio" => $_POST["editarPrecio"],
							   "idTipoCosto" => $_POST["editarTipoCosto"]);
							
				$respuesta = ModeloGastoAdmin::mdlEditarGastoAdmin($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El gasto administrativo ha sido editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "gastoadmin";
					
					});
					
					
					</script>';

					

				}


		}

	}

	/*=============================================
	BORRAR GASTOS ADMIN
	=============================================*/
	static public function ctrEliminarGastoAdmin(){

		if(isset($_GET["idGastoAdmin"])){

			$datos = $_GET["idGastoAdmin"];

			$respuesta = ModeloGastoAdmin::mdlEliminarGastoAdmin($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El gasto administrativo ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "gastoadmin";
				
				});
				
				
				</script>';

			}else{
				echo '<script>

				Swal.fire({
				
					icon: "error",
					title: "¡El gasto administrativo está en uso!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "gastoadmin";
				
				});
				
				
				</script>';
			}		
		}


	}

}





	