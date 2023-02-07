<?php

class ControladorUsuarios{

	/*=============================================
	INGRESO DE USUARIO
	=============================================*/

	static public function ctrIngresoUsuario(){

		if(isset($_POST["ingUsuario"])){

			if(preg_match('/^[a-zA-Z0-9]+$/', $_POST["ingUsuario"]) &&
			   preg_match('/^[a-zA-Z0-9]+$/', $_POST["ingPassword"])){

				$encriptar = crypt($_POST["ingPassword"], '$2a$07$asxx54ahjppf45sd87a5a4dDDGsystemdev$');

				$tabla = "usuario";
				
				$item = "usuario";

				$valor = $_POST["ingUsuario"];

				$respuesta = ModeloUsuarios::MdlMostrarUsuarios($tabla, $item, $valor);


				if(is_array($respuesta)){

					if($respuesta["usuario"] == $_POST["ingUsuario"] && 
					   $respuesta["password"] == $encriptar){
 
						if($respuesta["estado"] == 1){

						$modulos = ModeloUsuariosModulos::mdlMostrarUsuariosModulos($respuesta["idUsuario"]);
						
						$arrayidModulos = array();
						$arrayDescripcionModulos = array();

						foreach($modulos as $value){ 

							array_push($arrayidModulos, $value["idModulo"]);
							array_push($arrayDescripcionModulos, $value["descripcion"]);
						}

				        $_SESSION["idModulos"] = $arrayidModulos;
						$_SESSION["descripcionModulos"] = $arrayDescripcionModulos;

						$_SESSION["iniciarSesion"] = "ok";
						$_SESSION["idUsuario"] = $respuesta["idUsuario"];
						$_SESSION["nombre"] = $respuesta["nombre"];
						$_SESSION["usuario"] = $respuesta["usuario"];
						$_SESSION["foto"] = $respuesta["foto"];
						$_SESSION["perfil"] = $respuesta["perfil"];

						/*=============================================
						REGISTRAR FECHA PARA SABER EL ÚLTIMO LOGIN
						=============================================*/

						date_default_timezone_set('America/Bogota');

						$fecha = date('Y-m-d');
						$hora = date('H:i:s');

						$fechaActual = $fecha.' '.$hora;

						$item1 = "ultimo_login";
						$valor1 = $fechaActual;

						$item2 = "idUsuario";
						$valor2 = $respuesta["idUsuario"];

						$ultimoLogin = ModeloUsuarios::mdlActualizarUsuario($tabla, $item1, $valor1, $item2, $valor2);

						if($ultimoLogin == "ok"){

							echo '<script>
					
							Swal.fire({

							icon: "success",
							title: "Bienvenido al sistema",
							showConfirmButton: false,
							timer: 1000

							}).then(function(result){

								window.location = "inicio";


							});

							</script>';

						}				
						
					}else{

						echo '<br>
							<div class="alert alert-danger">El usuario aún no está activado</div>';

					}
 
				 }else{
 
					 echo '<br><div class="alert alert-danger">Usuario o Contraseña incorrecta.</div>';
 
				 }
				}else{
 
					echo '<br><div class="alert alert-danger">Usuario o Contraseña incorrecta.</div>';

				}
				
				
			}else{
				     echo '<br><div class="alert alert-danger">Usuario o Contraseña incorrecta.</div>';
			}

		}

	}


	/*=============================================
	REGISTRO DE USUARIO
	=============================================*/

	static public function ctrCrearUsuario(){

		if(isset($_POST["nuevoUsuario"])){

			   	/*=============================================
				VALIDAR IMAGEN
				=============================================*/

				$ruta = "";

				if(is_uploaded_file($_FILES["nuevaFoto"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["nuevaFoto"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;

					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

					$directorio = "vistas/img/usuarios/".$_POST["nuevoUsuario"];

					mkdir($directorio, 0755);

					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/

					if($_FILES["nuevaFoto"]["type"] == "image/jpeg"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/usuarios/".$_POST["nuevoUsuario"]."/".$aleatorio.".jpg";

						$origen = imagecreatefromjpeg($_FILES["nuevaFoto"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);

					}

					if($_FILES["nuevaFoto"]["type"] == "image/png"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/usuarios/".$_POST["nuevoUsuario"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["nuevaFoto"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}

				$encriptar = crypt($_POST["nuevoPassword"], '$2a$07$asxx54ahjppf45sd87a5a4dDDGsystemdev$');
                
				$idUsuario=$_POST["idUsuario"];

				$datos1 = array("idUsuario" => $idUsuario,
				"nombre" => $_POST["nuevoNombre"],
				"usuario" => $_POST["nuevoUsuario"],
				"password" => $encriptar,
				"perfil" => $_POST["nuevoPerfil"],
				"foto"=>$ruta);

				$respuesta = ModeloUsuarios::mdlIngresarUsuario($datos1);

				foreach($_POST['checkListPermisos'] as $value){

				$datos2 = array("idUsuario" => $idUsuario,"idModulo" => $value);

				ModeloUsuariosModulos::mdlIngresarUsuariosModulos($datos2);
   
				}

				if($respuesta == "ok"){

						echo '<script>
	
						Swal.fire({
						
							icon: "success",
							title: "¡El usuario ha sido guardado correctamente!",
							showConfirmButton: false,
							timer: 1500
						
						}).then(function(result){
						
								window.location = "usuarios";
						
						});
						
						
						</script>';
	
	
					}	
			
		}


	}





	/*=============================================
	MOSTRAR USUARIO
	=============================================*/

	static public function ctrMostrarUsuarios($item, $valor){

		$tabla = "usuario";

		$respuesta = ModeloUsuarios::MdlMostrarUsuarios($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	EDITAR USUARIO
	=============================================*/

	static public function ctrEditarUsuario(){

		if(isset($_POST["editarUsuario"])){

				/*=============================================
				VALIDAR IMAGEN
				=============================================*/

				$ruta = $_POST["fotoActual"];

				if(isset($_FILES["editarFoto"]["tmp_name"]) && !empty($_FILES["editarFoto"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["editarFoto"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;

					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

					$directorio = "vistas/img/usuarios/".$_POST["editarUsuario"];

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

						$ruta = "vistas/img/usuarios/".$_POST["editarUsuario"]."/".$aleatorio.".jpg";

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

						$ruta = "vistas/img/usuarios/".$_POST["editarUsuario"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["editarFoto"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}

				if($_POST["editarPassword"] != ""){

					$encriptar = crypt($_POST["editarPassword"], '$2a$07$asxx54ahjppf45sd87a5a4dDDGsystemdev$');

				}else{

					$encriptar = $_POST["passwordActual"];

				}

				$datos = array("nombre" => $_POST["editarNombre"],
							   "usuario" => $_POST["editarUsuario"],
							   "password" => $encriptar,
							   "perfil" => $_POST["editarPerfil"],
							   "foto" => $ruta);

				$respuesta = ModeloUsuarios::mdlEditarUsuario($datos);

				$idUsuario=$_POST["editaridUsuario"];

				if($idUsuario != 1){

					ModeloUsuariosModulos::mdlEliminarUsuariosModulos($idUsuario);

					foreach($_POST['editarCheckListPermisos'] as $value){

						$datos2 = array("idUsuario" => $idUsuario,"idModulo" => $value);
		
						ModeloUsuariosModulos::mdlIngresarUsuariosModulos($datos2);
					}
				}

				if($respuesta == "ok"){

					echo'<script>

					Swal.fire({
						  icon: "success",
						  title: "El usuario ha sido editado correctamente",
						  showConfirmButton: false,
						  timer: 1500
						  }).then(function(result){

									window.location = "usuarios";

								})

					</script>';

			}

		}

	}

	/*=============================================
	BORRAR USUARIO
	=============================================*/

	static public function ctrBorrarUsuario(){

		if(isset($_GET["idUsuario"])){

			$datos = $_GET["idUsuario"];

			if($_GET["fotoUsuario"] != ""){

				unlink($_GET["fotoUsuario"]);
				rmdir('vistas/img/usuarios/'.$_GET["usuario"]);

			}

			$respuesta = ModeloUsuarios::mdlBorrarUsuario($datos);

			if($respuesta == "ok"){

				echo'<script>

				Swal.fire({
					  icon: "success",
					  title: "El usuario ha sido borrado correctamente",
					  showConfirmButton: false,
					timer: 1500
					  }).then(function(result){
								

								window.location = "usuarios";

								
							})

				</script>';

			}		

		}

	}

}


	