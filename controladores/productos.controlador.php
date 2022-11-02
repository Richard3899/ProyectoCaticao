<?php

class ControladorProductos{

	/*=============================================
	MOSTRAR PRODUCTOS
	=============================================*/

	static public function ctrMostrarProductos($item, $valor){

		$tabla = "producto";

		$respuesta = ModeloProductos::MdlMostrarProductos($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR PRODUCTO
	=============================================*/

	static public function ctrCrearProducto(){

		if(isset($_POST["nuevaDescripcion"])){

		   		/*=============================================
				VALIDAR IMAGEN
				=============================================*/

			   	$ruta = "";

			   	if(is_uploaded_file($_FILES["nuevaImagenProducto"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["nuevaImagenProducto"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;

					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

					$directorio = "vistas/img/productos/".$_POST["nuevoCodigoProducto"];

					mkdir($directorio, 0755);

					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/

					if($_FILES["nuevaImagenProducto"]["type"] == "image/jpeg"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/productos/".$_POST["nuevoCodigoProducto"]."/".$aleatorio.".jpg";

						$origen = imagecreatefromjpeg($_FILES["nuevaImagenProducto"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);

					}

					if($_FILES["nuevaImagenProducto"]["type"] == "image/png"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/productos/".$_POST["nuevoCodigoProducto"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["nuevaImagenProducto"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}

				$datos = array("codigo" => $_POST["nuevoCodigoProducto"],
							   "nombre" => $_POST["nuevoNombre"],
							   "descripcion" => $_POST["nuevaDescripcion"],
							   "idUnidadMedida" => $_POST["nuevaUnidadMedida"],
							   "cantidad" => $_POST["nuevaCantidad"],
							   "idTipoProducto" => $_POST["nuevoTipoProducto"],
							   "imagen" => $ruta);
							 

				$respuesta = ModeloProductos::mdlIngresarProducto($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El producto ha sido guardado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "productos";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	EDITAR PRODUCTO
	=============================================*/

	static public function ctrEditarProducto(){

		if(isset($_POST["editarDescripcion"])){

		   		/*=============================================
				VALIDAR IMAGEN
				=============================================*/

			   	$ruta = $_POST["ImagenProductoActual"];

			   	if(isset($_FILES["editarImagenProducto"]["tmp_name"]) && !empty($_FILES["editarImagenProducto"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["editarImagenProducto"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;

					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

					$directorio = "vistas/img/productos/".$_POST["editarCodigo"];

					/*=============================================
					PRIMERO PREGUNTAMOS SI EXISTE OTRA IMAGEN EN LA BD
					=============================================*/

					if(!empty($_POST["ImagenProductoActual"]) && $_POST["ImagenProductoActual"] != "vistas/img/productos/default/producto.png"){

						unlink($_POST["ImagenProductoActual"]);

					}else{

						mkdir($directorio, 0755);	
					
					}
					
					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/

					if($_FILES["editarImagenProducto"]["type"] == "image/jpeg"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/productos/".$_POST["editarCodigo"]."/".$aleatorio.".jpg";

						$origen = imagecreatefromjpeg($_FILES["editarImagenProducto"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);

					}

					if($_FILES["editarImagenProducto"]["type"] == "image/png"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/productos/".$_POST["editarCodigo"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["editarImagenProducto"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}


				$datos = array("idProducto" =>$_POST["idProducto"],
							   "nombre" => $_POST["editarNombre"],
							   "descripcion" => $_POST["editarDescripcion"],
							   "idUnidadMedida" => $_POST["editarUnidadMedida"],
							   "cantidad" => $_POST["editarCantidad"],
							   "idTipoProducto" => $_POST["editarTipoProducto"],
							   "imagen" => $ruta);
							   
				

				$respuesta = ModeloProductos::mdlEditarProducto($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El producto ha sido editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "productos";
					
					});
					
					
					</script>';

					

				}


		}

	}

	/*=============================================
	ELIMINAR PRODUCTO
	=============================================*/
	static public function ctrEliminarProducto(){

		if(isset($_GET["idProducto"])){

			$datos = $_GET["idProducto"];

			if($_GET["imagen"] != "" && $_GET["imagen"] != "vistas/img/productos/default/producto.png"){

				unlink($_GET["imagen"]);
				rmdir('vistas/img/productos/'.$_GET["codigo"]);

			}

			$respuesta = ModeloProductos::mdlEliminarProducto($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El producto ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "productos";
				
				});
				
				
				</script>';

			}		
		}


	}

}





	