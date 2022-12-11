<?php

class ControladorRecetas{

	/*=============================================
	MOSTRAR RECETAS
	=============================================*/

	static public function ctrMostrarRecetas($item, $valor){

		$tabla = "receta";

		$respuesta = ModeloRecetas::MdlMostrarRecetas($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR RECETA
	=============================================*/

	static public function ctrCrearReceta(){

		if(isset($_POST["nuevoCodigoReceta"])){

				$datos = array("codigo" => $_POST["nuevoCodigoReceta"],
							   "nombre" => $_POST["nuevoNombre"],
							   "idProducto" => $_POST["nuevoidProducto"],
							   "batch" => $_POST["nuevoBatch"],
							   "idEstado" => $_POST["nuevoidEstado"],
							   "fechaInicio" => $_POST["nuevaFechaInicio"],
							   "fechaFin" => $_POST["nuevaFechaFin"],
							   "codigoLote" => $_POST["nuevoCodigoLote"],
							   "fechaVencimiento" => $_POST["nuevaFechaVencimiento"],
							   "pesoPorTableta" => $_POST["nuevoPesoPorTableta"],
							   "pesoEnTableta" => $_POST["nuevoPesoEnTableta"],
							   "merma" => $_POST["nuevaMerma"],
							   "reproceso" => $_POST["nuevoReproceso"]);
							 

				$respuesta = ModeloRecetas::mdlIngresarReceta($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El receta ha sido guardado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "recetas";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	EDITAR RECETA
	=============================================*/

	static public function ctrEditarReceta(){

		if(isset($_POST["editarCodigoReceta"])){


			$datos = array( "idReceta" => $_POST["idReceta"],
							"idLote" => $_POST["idLote"],
				            "codigo" => $_POST["editarCodigoReceta"],
							"nombre" => $_POST["editarNombre"],
							"idProducto" => $_POST["editaridProducto"],
							"batch" => $_POST["editarBatch"],
							"idEstado" => $_POST["editaridEstado"],
							"fechaInicio" => $_POST["editarFechaInicio"],
							"fechaFin" => $_POST["editarFechaFin"],
							"codigoLote" => $_POST["editarCodigoLote"],
							"fechaVencimiento" => $_POST["editarFechaVencimiento"],
							"pesoPorTableta" => $_POST["editarPesoPorTableta"],
							"pesoEnTableta" => $_POST["editarPesoEnTableta"],
							"merma" => $_POST["editarMerma"],
							"reproceso" => $_POST["editarReproceso"]);
							   
				

				$respuesta = ModeloRecetas::mdlEditarReceta($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El receta ha sido editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "recetas";
					
					});
					
					
					</script>';

					

				}


		}

	}

	/*=============================================
	ELIMINAR RECETA
	=============================================*/
	static public function ctrEliminarReceta(){

		if(isset($_GET["idReceta"])){

			$datos = $_GET["idReceta"];

			$respuesta = ModeloRecetas::mdlEliminarReceta($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El receta ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "recetas";
				
				});
				
				
				</script>';

			}else{

				echo '<script>

				Swal.fire({
				
					icon: "error",
					title: "¡No se puede eliminar la receta!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "recetas";
				
				});
				
				
				</script>';

			}		
		}


	}

}





	