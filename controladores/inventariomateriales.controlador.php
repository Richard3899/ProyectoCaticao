<?php

class ControladorInventarioMateriales{

	/*=============================================
	MOSTRAR MATERIALES
	=============================================*/

	static public function ctrMostrarInventarioMateriales($item, $valor){

		$tabla = "inventariomateria";

		$respuesta = ModeloInventarioMateriales::MdlMostrarInventarioMateriales($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR INGRESO MATERIAL
	=============================================*/

	static public function ctrCrearIngresoMaterial(){

		if(isset($_POST["nuevoMaterialI"])){


				$datos = array("idMateria" => $_POST["nuevoMaterialI"],
							   "cantidad" => $_POST["nuevaCantidadI"],
							   "observacion" => $_POST["nuevaObservacionI"],
							   "fecha" => $_POST["nuevaFechaI"]);
							 
				
				$respuesta = ModeloInventarioMateriales::mdlIngresoMaterial($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El material ha sido ingresado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "inventariomateriales";
					
					});
					
					
					</script>';

				}


		}

	}


	/*=============================================
	CREAR INGRESO MATERIAL
	=============================================*/

	static public function ctrCrearSalidaMaterial(){

		if(isset($_POST["nuevoMaterialS"])){


				$datos = array("idMateria" => $_POST["nuevoMaterialS"],
							   "cantidad" => $_POST["nuevaCantidadS"],
							   "observacion" => $_POST["nuevaObservacionS"],
							   "fecha" => $_POST["nuevaFechaS"]);
							 

				$respuesta = ModeloInventarioMateriales::mdlSalidaMaterial($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El material ha salido correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "inventariomateriales";
					
					});
					
					
					</script>';

				}


		}

	}

}





	