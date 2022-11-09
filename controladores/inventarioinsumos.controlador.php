<?php

class ControladorInventarioInsumos{

	/*=============================================
	MOSTRAR INSUMOS
	=============================================*/

	static public function ctrMostrarInventarioInsumos($item, $valor){

		$tabla = "inventariomateria";

		$respuesta = ModeloInventarioInsumos::MdlMostrarInventarioInsumos($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR INGRESO INSUMO
	=============================================*/

	static public function ctrCrearIngresoInsumo(){

		if(isset($_POST["nuevoInsumoI"])){


				$datos = array("idMateria" => $_POST["nuevoInsumoI"],
							   "cantidad" => $_POST["nuevaCantidadI"],
							   "observacion" => $_POST["nuevaObservacionI"],
							   "fecha" => $_POST["nuevaFechaI"]);
							 
				
				$respuesta = ModeloInventarioInsumos::mdlIngresoInsumo($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El insumo ha sido ingresado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "inventarioinsumos";
					
					});
					
					
					</script>';

				}


		}

	}


	/*=============================================
	CREAR INGRESO INSUMO
	=============================================*/

	static public function ctrCrearSalidaInsumo(){

		if(isset($_POST["nuevoInsumoS"])){


				$datos = array("idMateria" => $_POST["nuevoInsumoS"],
							   "cantidad" => $_POST["nuevaCantidadS"],
							   "observacion" => $_POST["nuevaObservacionS"],
							   "fecha" => $_POST["nuevaFechaS"]);
							 

				$respuesta = ModeloInventarioInsumos::mdlSalidaInsumo($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El insumo ha salido correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "inventarioinsumos";
					
					});
					
					
					</script>';

				}


		}

	}

}





	