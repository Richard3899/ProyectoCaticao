<?php

class ControladorInventarioProductos{

	/*=============================================
	MOSTRAR PRODUCTOS
	=============================================*/

	static public function ctrMostrarInventarioProductos($item, $valor){

		$tabla = "inventarioproducto";

		$respuesta = ModeloInventarioProductos::MdlMostrarInventarioProductos($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR INGRESO PRODUCTO
	=============================================*/

	static public function ctrCrearIngresoProducto(){

		if(isset($_POST["nuevoProductoI"])){


				$datos = array("idProducto" => $_POST["nuevoProductoI"],
							   "cantidad" => $_POST["nuevaCantidadI"],
							   "observacion" => $_POST["nuevaObservacionI"],
							   "fecha" => $_POST["nuevaFechaI"]);
							 
				
				$respuesta = ModeloInventarioProductos::mdlIngresoProducto($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El producto ha sido ingresado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "inventarioproductos";
					
					});
					
					
					</script>';

				}


		}

	}


	/*=============================================
	CREAR INGRESO PRODUCTO
	=============================================*/

	static public function ctrCrearSalidaProducto(){

		if(isset($_POST["nuevoProductoS"])){


				$datos = array("idProducto" => $_POST["nuevoProductoS"],
							   "cantidad" => $_POST["nuevaCantidadS"],
							   "observacion" => $_POST["nuevaObservacionS"],
							   "fecha" => $_POST["nuevaFechaS"]);
							 

				$respuesta = ModeloInventarioProductos::mdlSalidaProducto($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El producto ha salido correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "inventarioproductos";
					
					});
					
					
					</script>';

				}


		}

	}

}





	