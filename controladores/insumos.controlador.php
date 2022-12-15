<?php

class ControladorInsumos{

	/*=============================================
	MOSTRAR INSUMOS
	=============================================*/

	static public function ctrMostrarInsumos($item, $valor){

		$tabla = "materia";

		$respuesta = ModeloInsumos::MdlMostrarInsumos($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR INSUMO
	=============================================*/

	static public function ctrCrearInsumo(){

		if(isset($_POST["nuevaDescripcion"])){

		   		/*=============================================
				VALIDAR IMAGEN
				=============================================*/

			   	$ruta = "";

			   	if(is_uploaded_file($_FILES["nuevaImagenInsumo"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["nuevaImagenInsumo"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;

					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

					$directorio = "vistas/img/insumos/".$_POST["nuevoCodigo"];

					mkdir($directorio, 0755);

					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/

					if($_FILES["nuevaImagenInsumo"]["type"] == "image/jpeg"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/insumos/".$_POST["nuevoCodigo"]."/".$aleatorio.".jpg";

						$origen = imagecreatefromjpeg($_FILES["nuevaImagenInsumo"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);

					}

					if($_FILES["nuevaImagenInsumo"]["type"] == "image/png"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/insumos/".$_POST["nuevoCodigo"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["nuevaImagenInsumo"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}

				$datos = array("codigo" => $_POST["nuevoCodigo"],
							   "nombre" => $_POST["nuevoNombre"],
							   "descripcion" => $_POST["nuevaDescripcion"],
							   "idUnidadMedida" => $_POST["nuevaUnidadMedida"],
							   "idMarca" => $_POST["nuevaMarca"],
							   "cantidad" => $_POST["nuevaCantidad"],
							   "precio" => $_POST["nuevoPrecio"],
							   "imagen" => $ruta);
							 

				$respuesta = ModeloInsumos::mdlIngresarInsumo($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El insumo ha sido guardado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "insumos";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	EDITAR INSUMO
	=============================================*/

	static public function ctrEditarInsumo(){

		if(isset($_POST["editarDescripcion"])){

		   		/*=============================================
				VALIDAR IMAGEN
				=============================================*/

			   	$ruta = $_POST["ImagenInsumoActual"];

			   	if(isset($_FILES["editarImagenInsumo"]["tmp_name"]) && !empty($_FILES["editarImagenInsumo"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["editarImagenInsumo"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;

					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

					$directorio = "vistas/img/insumos/".$_POST["editarCodigo"];

					/*=============================================
					PRIMERO PREGUNTAMOS SI EXISTE OTRA IMAGEN EN LA BD
					=============================================*/

					if(!empty($_POST["ImagenInsumoActual"]) && $_POST["ImagenInsumoActual"] != "vistas/img/insumos/default/insumo.png"){

						unlink($_POST["ImagenInsumoActual"]);

					}else{

						mkdir($directorio, 0755);	
					
					}
					
					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/

					if($_FILES["editarImagenInsumo"]["type"] == "image/jpeg"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/insumos/".$_POST["editarCodigo"]."/".$aleatorio.".jpg";

						$origen = imagecreatefromjpeg($_FILES["editarImagenInsumo"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);

					}

					if($_FILES["editarImagenInsumo"]["type"] == "image/png"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/insumos/".$_POST["editarCodigo"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["editarImagenInsumo"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}


				$datos = array("idMateria" =>$_POST["idInsumo"],
							   "nombre" => $_POST["editarNombre"],
							   "descripcion" => $_POST["editarDescripcion"],
							   "idMarca" => $_POST["editarMarca"],
							   "idUnidadMedida" => $_POST["editarUnidadMedida"],
							   "cantidad" => $_POST["editarCantidad"],
							   "precio" => $_POST["editarPrecio"],
							   "imagen" => $ruta);
							   
				

				$respuesta = ModeloInsumos::mdlEditarInsumo($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El insumo ha sido editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "insumos";
					
					});
					
					
					</script>';

					

				}


		}

	}

	/*=============================================
	BORRAR INSUMO
	=============================================*/
	static public function ctrEliminarInsumo(){

		if(isset($_GET["idInsumo"])){

			$datos = $_GET["idInsumo"];

			if($_GET["imagen"] != "" && $_GET["imagen"] != "vistas/img/insumos/default/insumo.png"){

				unlink($_GET["imagen"]);
				rmdir('vistas/img/insumos/'.$_GET["codigo"]);

			}

			$respuesta = ModeloInsumos::mdlEliminarInsumo($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El insumo ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "insumos";
				
				});
				
				
				</script>';

			}else{
				echo '<script>

				Swal.fire({
				
					icon: "error",
					title: "¡El insumo está en uso!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "insumos";
				
				});
				
				
				</script>';
			}		
		}


	}

}





	