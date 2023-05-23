<?php

class ControladorMesGasto{

	/*=============================================
	MOSTRAR MES GASTO
	=============================================*/

	static public function ctrMostrarMesGasto($item, $valor){

		$tabla = "mesgasto";

		$respuesta = ModeloMesGasto::MdlMostrarMesGasto($tabla, $item, $valor);

		return $respuesta;
	}

	/*=============================================
	CREAR MES GASTO
	=============================================*/

	static public function ctrCrearMesGasto(){

		if(isset($_POST["nuevaDescripcion"])){

				$datos = array("descripcion" => $_POST["nuevaDescripcion"],
							   "mes" => $_POST["nuevoMes"].'-01');

				$respuesta = ModeloMesGasto::mdlIngresarMesGasto($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El costo de recetas y gasto admin ha sido guardado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "mesgasto";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	EDITAR MES GASTO
	=============================================*/

	static public function ctrEditarMesGasto(){

		if(isset($_POST["editarDescripcion"])){

				$datos = array("idMesGasto" => $_POST["idMesGasto"],
							   "descripcion" => $_POST["editarDescripcion"]);

				$respuesta = ModeloMesGasto::mdlEditarMesGasto($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El costo de recetas y gasto admin ha sido editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "mesgasto";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	BORRAR MES GASTO
	=============================================*/
	static public function ctrEliminarMesGasto(){

		if(isset($_GET["idMesGasto"])){

			$datos = $_GET["idMesGasto"];

			$respuesta = ModeloMesGasto::mdlEliminarMesGasto($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El costo de recetas y gasto admin ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "mesgasto";
				
				});
				
				
				</script>';

			}	
		}


	}

	/*=============================================
	CERRAR MES
	=============================================*/
	static public function ctrCerrarMes(){

		if(isset($_GET["idMGasto"])){
					
			$datos = array( "idMesGasto" => $_GET["idMGasto"]);

			$respuesta = ModeloMesGasto::mdlCerrarMes($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El mes ha sido cerrado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "mesgasto";
				
				});
				
				</script>';

			}
	
		}

	}

}





	