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
							   "idLote" => $_POST["idLote"],
							   "codigoLote" => $_POST["nuevoCodigoLoteI"],
							   "fechaProduccion" => $_POST["nuevaFechaProduccionI"],
							   "fechaVencimiento" => $_POST["nuevaFechaVencimientoI"],
							   "fecha" => $_POST["nuevaFechaI"],
							   "observacion" => $_POST["nuevaObservacionI"]);
							 			
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
	CREAR SALIDA PRODUCTO
	=============================================*/

	static public function ctrCrearSalidaProducto(){

		if(isset($_POST["nuevoProductoS"])){

				$datos = array("idProducto" => $_POST["nuevoProductoS"],
							   "idLote" => $_POST["idLoteS"],
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





	