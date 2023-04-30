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
	MOSTRAR RECETAS CERRADAS
	=============================================*/

	static public function ctrMostrarRecetasCerradas(){

		$respuesta = ModeloRecetas::mdlMostrarRecetasCerradas();

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
							   "fechaFin" => (!empty($_POST['nuevaFechaFin'])) ? $_POST['nuevaFechaFin'] : NULL,
							   "codigoLote" => $_POST['nuevoCodigoLote'],
							   "fechaVencimiento" => (!empty($_POST['nuevaFechaVencimiento'])) ? $_POST['nuevaFechaVencimiento'] : NULL,
							   "pesoPorTableta" => (!empty($_POST['nuevoPesoPorTableta'])) ? $_POST['nuevoPesoPorTableta'] : NULL,
							   "pesoEnTableta" => (!empty($_POST['nuevoPesoEnTableta'])) ? $_POST['nuevoPesoEnTableta'] : NULL,
							   "merma" => (!empty($_POST['nuevaMerma'])) ? $_POST['nuevaMerma'] : NULL,
							   "reproceso" => (!empty($_POST['nuevoReproceso'])) ? $_POST['nuevoReproceso'] : NULL,
							   "cantidadTabletas" => (!empty($_POST['nuevaCantidadTabletas'])) ? $_POST['nuevaCantidadTabletas'] : NULL);
							 
				$respuesta = ModeloRecetas::mdlIngresarReceta($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡La receta ha sido guardada correctamente!",
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
							"fechaFin" => (!empty($_POST['editarFechaFin'])) ? $_POST['editarFechaFin'] : NULL,
							"codigoLote" => ($_POST['editarCodigoLote']),
							"fechaVencimiento" => (!empty($_POST['editarFechaVencimiento'])) ? $_POST['editarFechaVencimiento'] : NULL,
							"pesoPorTableta" => (!empty($_POST['editarPesoPorTableta'])) ? $_POST['editarPesoPorTableta'] : NULL,
							"pesoEnTableta" => (!empty($_POST['editarPesoEnTableta'])) ? $_POST['editarPesoEnTableta'] : NULL,
							"merma" => (!empty($_POST['editarMerma'])) ? $_POST['editarMerma'] : NULL,
							"reproceso" => (!empty($_POST['editarReproceso'])) ? $_POST['editarReproceso'] : NULL,
							"cantidadTabletas" => (!empty($_POST['editarCantidadTabletas'])) ? $_POST['editarCantidadTabletas'] : NULL);					   

				$respuesta = ModeloRecetas::mdlEditarReceta($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡La receta ha sido editada correctamente!",
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

		if(isset($_GET["idReceta"]) && isset($_GET["CDPE"])){

			$datos = array("idReceta" => $_GET["idReceta"],
						   "codigoReceta" => $_GET["codigoReceta"],
						   "codigoLote" => $_GET["codigoLote"]);

			$respuesta = ModeloRecetas::mdlEliminarReceta($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡La receta ha sido eliminada correctamente!",
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
	CERRAR RECETA
	=============================================*/
	static public function ctrCerrarReceta(){

		if(isset($_GET["idReceta"]) && isset($_GET["idEstado"]) && isset($_GET["cantidadTabletas"])){

			if($_GET["idEstado"]!=3){

				echo '<script>

				Swal.fire({
				
					icon: "error",
					title: "¡El estado de la receta debe estar Terminado!",
					showConfirmButton: false,
					timer: 2500
				
				}).then(function(result){
				
					window.location = "recetas";
				
				});
				
				</script>';
				
			}else{

				if($_GET["cantidadTabletas"]!="" || $_GET["cantidadTabletas"]!=0){
					
					$datos = array( "idReceta" => $_GET["idReceta"],
					"codigoLote" => $_GET["codigoLote"],
					"cantidadTabletas" => $_GET["cantidadTabletas"],
					"idEstado" => $_GET["idEstado"]);

					$respuesta = ModeloRecetas::mdlCerrarReceta($datos);
			
					if($respuesta == "ok"){
		
						echo '<script>
		
						Swal.fire({
						
							icon: "success",
							title: "¡La receta ha sido cerrada correctamente!",
							showConfirmButton: false,
							timer: 1500
						
						}).then(function(result){
						
							window.location = "recetas";
						
						});
						
						</script>';
		
					}

				}else{

						echo '<script>

						Swal.fire({
						
							icon: "error",
							title: "¡Completar todos los datos correctamente!",
							showConfirmButton: false,
							timer: 2500
						
						}).then(function(result){
						
								window.location = "recetas";
						
						});
						
						</script>';
				}

			}
	
		}

	}

	/*=============================================
	DUPLICAR RECETA
	=============================================*/
	static public function ctrDuplicarReceta(){

		if(isset($_POST["duplicarCodigoReceta"])){

			$datos = array("idReceta" => $_POST["duplicarIdReceta"],
						   "codigoReceta" => $_POST["duplicarCodigoReceta"],
						   "codigoLote" => $_POST["codigoLote"],
						   "nuevoIdReceta" => $_POST["nuevoIdReceta"]);

			$respuesta = ModeloRecetas::mdlDuplicarReceta($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡La receta ha sido duplicada correctamente!",
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





	