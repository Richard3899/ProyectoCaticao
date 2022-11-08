<?php

class ControladorMaquinas{

	/*=============================================
	MOSTRAR MAQUINAS
	=============================================*/

	static public function ctrMostrarMaquinas($item, $valor){

		$tabla = "maquina";

		$respuesta = ModeloMaquinas::MdlMostrarMaquinas($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR MAQUINA
	=============================================*/

	static public function ctrCrearMaquina(){

		if(isset($_POST["nuevaDescripcion"])){

				$datos = array("codigo" => $_POST["nuevoCodigoMaquina"],
							   "nombre" => $_POST["nuevoNombre"],
							   "descripcion" => $_POST["nuevaDescripcion"],
							   "serie" => $_POST["nuevaSerie"],
							   "modelo" => $_POST["nuevoModelo"],
							   "marca" => $_POST["nuevaMarca"],
							   "precio" => $_POST["nuevoPrecio"],
							   "añoCompra" => $_POST["nuevoAñoCompra"],
							   "capacidad" => $_POST["nuevaCapacidad"],
							   "potencia" => $_POST["nuevaPotencia"],
							   "vidaUtil" => $_POST["nuevaVidaUtil"]);
							 

				$respuesta = ModeloMaquinas::mdlIngresarMaquina($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El maquina ha sido guardada correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "maquinas";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	EDITAR MAQUINA
	=============================================*/

	static public function ctrEditarMaquina(){

		if(isset($_POST["editarDescripcion"])){

				$datos = array("idMaquina" => $_POST["idMaquina"],
							   "nombre" => $_POST["editarNombre"],
							   "descripcion" => $_POST["editarDescripcion"],
							   "serie" => $_POST["editarSerie"],
							   "modelo" => $_POST["editarModelo"],
							   "marca" => $_POST["editarMarca"],
							   "precio" => $_POST["editarPrecio"],
							   "añoCompra" => $_POST["editarAñoCompra"],
							   "capacidad" => $_POST["editarCapacidad"],
							   "potencia" => $_POST["editarPotencia"],
							   "vidaUtil" => $_POST["editarVidaUtil"]);			   
							   
				$respuesta = ModeloMaquinas::mdlEditarMaquina($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El maquina ha sido editada correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "maquinas";
					
					});
					
					
					</script>';

					

				}


		}

	}

	/*=============================================
	ELIMINAR MAQUINA
	=============================================*/
	static public function ctrEliminarMaquina(){

		if(isset($_GET["idMaquina"])){

			$datos = $_GET["idMaquina"];

			$respuesta = ModeloMaquinas::mdlEliminarMaquina($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El maquina ha sido eliminada correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "maquinas";
				
				});
				
				
				</script>';

			}		
		}


	}

}





	