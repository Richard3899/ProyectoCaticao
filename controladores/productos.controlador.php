<?php

class ControladorProductos{


	/*=============================================
	MOSTRAR productos
	=============================================*/

	static public function ctrMostrarProductos($item, $valor){

		$tabla = "producto";

		$respuesta = ModeloProductos::MdlMostrarProductos($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	EDITAR productos
	=============================================*/

	static public function ctrEditarproductos(){

		if(isset($_POST["editarproductos"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarNombre"])){

				/*=============================================
				VALIDAR IMAGEN
				=============================================*/

				$ruta = $_POST["fotoActual"];

				if(isset($_FILES["editarFoto"]["tmp_name"]) && !empty($_FILES["editarFoto"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["editarFoto"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;

					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL productos
					=============================================*/

					$directorio = "vistas/img/productoss/".$_POST["editarproductos"];

					/*=============================================
					PRIMERO PREGUNTAMOS SI EXISTE OTRA IMAGEN EN LA BD
					=============================================*/

					if(!empty($_POST["fotoActual"])){

						unlink($_POST["fotoActual"]);

					}else{

						mkdir($directorio, 0755);

					}	

					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/

					if($_FILES["editarFoto"]["type"] == "image/jpeg"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/productoss/".$_POST["editarproductos"]."/".$aleatorio.".jpg";

						$origen = imagecreatefromjpeg($_FILES["editarFoto"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);

					}

					if($_FILES["editarFoto"]["type"] == "image/png"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/productoss/".$_POST["editarproductos"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["editarFoto"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}


				if($_POST["editarPassword"] != ""){

					if(preg_match('/^[a-zA-Z0-9]+$/', $_POST["editarPassword"])){

						$encriptar = crypt($_POST["editarPassword"], '$2a$07$asxx54ahjppf45sd87a5a4dDDGsystemdev$');

					}else{

						echo'<script>

								Swal.fire({
									  icon: "error",
									  title: "¡La contraseña no puede ir vacía o llevar caracteres especiales!",
									  showConfirmButton: true,
									  confirmButtonText: "Cerrar"
									  }).then(function(result){
										if (result.value) {

										window.location = "productoss";

										}
									})

						  	</script>';

					}

				}else{

					$encriptar = $_POST["passwordActual"];

				}

				$datos = array("nombre" => $_POST["editarNombre"],
							   "productos" => $_POST["editarproductos"],
							   "password" => $encriptar,
							   "perfil" => $_POST["editarPerfil"],
							   "foto" => $ruta);

				$respuesta = Modeloproductos::mdlEditarproductos($datos);

				if($respuesta == "ok"){

					echo'<script>

					Swal.fire({
						  icon: "success",
						  title: "El productos ha sido editado correctamente",
						  showConfirmButton: false,
						  timer: 1500
						  }).then(function(result){
									

									window.location = "productoss";

									
								})

					</script>';

				}


			}else{

				echo'<script>

					Swal.fire({
						  icon: "error",
						  title: "¡El nombre no puede ir vacío o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "productoss";

							}
						})

			  	</script>';

			}

		}

	}

	/*=============================================
	BORRAR productos
	=============================================*/

	static public function ctrBorrarproductos(){

		if(isset($_GET["idproductos"])){

			$datos = $_GET["idproductos"];

			if($_GET["fotoproductos"] != ""){

				unlink($_GET["fotoproductos"]);
				rmdir('vistas/img/productoss/'.$_GET["productos"]);

			}

			$respuesta = Modeloproductos::mdlBorrarproductos($datos);

			if($respuesta == "ok"){

				echo'<script>

				Swal.fire({
					  icon: "success",
					  title: "El productos ha sido borrado correctamente",
					  showConfirmButton: false,
					timer: 1500
					  }).then(function(result){
								

								window.location = "productoss";

								
							})

				</script>';

			}		

		}

	}

}


	