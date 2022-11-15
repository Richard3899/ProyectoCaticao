<?php

class ControladorInventarioMaquinas{

	/*=============================================
	MOSTRAR MAQUINAS
	=============================================*/

	static public function ctrMostrarInventarioMaquinas($item, $valor){

		$tabla = "inventariomaquina";

		$respuesta = ModeloInventarioMaquinas::MdlMostrarInventarioMaquinas($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR INGRESO MAQUINA
	=============================================*/

	static public function ctrCrearIngresoMaquina(){

		if(isset($_POST["nuevoMaquinaI"])){


				$datos = array("idMaquina" => $_POST["nuevoMaquinaI"],
							   "cantidad" => $_POST["nuevaCantidadI"],
							   "observacion" => $_POST["nuevaObservacionI"],
							   "fecha" => $_POST["nuevaFechaI"]);
							 
				
				$respuesta = ModeloInventarioMaquinas::mdlIngresoMaquina($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El maquina ha sido ingresado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "inventariomaquinas";
					
					});
					
					
					</script>';

				}


		}

	}


	/*=============================================
	CREAR INGRESO MAQUINA
	=============================================*/

	static public function ctrCrearSalidaMaquina(){

		if(isset($_POST["nuevoMaquinaS"])){


				$datos = array("idMaquina" => $_POST["nuevoMaquinaS"],
							   "cantidad" => $_POST["nuevaCantidadS"],
							   "observacion" => $_POST["nuevaObservacionS"],
							   "fecha" => $_POST["nuevaFechaS"]);
							 

				$respuesta = ModeloInventarioMaquinas::mdlSalidaMaquina($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El maquina ha salido correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "inventariomaquinas";
					
					});
					
					
					</script>';

				}


		}

	}

}





	