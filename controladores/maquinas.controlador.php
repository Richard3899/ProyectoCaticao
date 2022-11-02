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

		   		/*=============================================
				VALIDAR IMAGEN
				=============================================*/

			   	$ruta = "";

			   	if(is_uploaded_file($_FILES["nuevaImagenMaquina"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["nuevaImagenMaquina"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;

					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

					$directorio = "vistas/img/maquinas/".$_POST["nuevoCodigo"];

					mkdir($directorio, 0755);

					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/

					if($_FILES["nuevaImagenMaquina"]["type"] == "image/jpeg"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/maquinas/".$_POST["nuevoCodigo"]."/".$aleatorio.".jpg";

						$origen = imagecreatefromjpeg($_FILES["nuevaImagenMaquina"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);

					}

					if($_FILES["nuevaImagenMaquina"]["type"] == "image/png"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/maquinas/".$_POST["nuevoCodigo"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["nuevaImagenMaquina"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}

				$datos = array("codigo" => $_POST["nuevoCodigo"],
							   "nombre" => $_POST["nuevoNombre"],
							   "descripcion" => $_POST["nuevaDescripcion"],
							   "idUnidadMedida" => $_POST["nuevaUnidadMedida"],
							   "cantidad" => $_POST["nuevaCantidad"],
							   "idTipoMaquina" => $_POST["nuevoTipoMaquina"],
							   "imagen" => $ruta);
							 

				$respuesta = ModeloMaquinas::mdlIngresarMaquina($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El maquina ha sido guardado correctamente!",
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

		   		/*=============================================
				VALIDAR IMAGEN
				=============================================*/

			   	$ruta = $_POST["ImagenMaquinaActual"];

			   	if(isset($_FILES["editarImagenMaquina"]["tmp_name"]) && !empty($_FILES["editarImagenMaquina"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["editarImagenMaquina"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;

					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

					$directorio = "vistas/img/maquinas/".$_POST["editarCodigo"];

					/*=============================================
					PRIMERO PREGUNTAMOS SI EXISTE OTRA IMAGEN EN LA BD
					=============================================*/

					if(!empty($_POST["ImagenMaquinaActual"]) && $_POST["ImagenMaquinaActual"] != "vistas/img/maquinas/default/maquina.png"){

						unlink($_POST["ImagenMaquinaActual"]);

					}else{

						mkdir($directorio, 0755);	
					
					}
					
					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/

					if($_FILES["editarImagenMaquina"]["type"] == "image/jpeg"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/maquinas/".$_POST["editarCodigo"]."/".$aleatorio.".jpg";

						$origen = imagecreatefromjpeg($_FILES["editarImagenMaquina"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);

					}

					if($_FILES["editarImagenMaquina"]["type"] == "image/png"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/maquinas/".$_POST["editarCodigo"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["editarImagenMaquina"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}


				$datos = array("idMaquina" =>$_POST["idMaquina"],
							   "nombre" => $_POST["editarNombre"],
							   "descripcion" => $_POST["editarDescripcion"],
							   "idUnidadMedida" => $_POST["editarUnidadMedida"],
							   "cantidad" => $_POST["editarCantidad"],
							   "idTipoMaquina" => $_POST["editarTipoMaquina"],
							   "imagen" => $ruta);
							   
				

				$respuesta = ModeloMaquinas::mdlEditarMaquina($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El maquina ha sido editado correctamente!",
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

			if($_GET["imagen"] != "" && $_GET["imagen"] != "vistas/img/maquinas/default/maquina.png"){

				unlink($_GET["imagen"]);
				rmdir('vistas/img/maquinas/'.$_GET["codigo"]);

			}

			$respuesta = ModeloMaquinas::mdlEliminarMaquina($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El maquina ha sido eliminado correctamente!",
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





	