<?php

class ControladorMateriales{

	/*=============================================
	MOSTRAR MATERIAL
	=============================================*/

	static public function ctrMostrarMateriales($item, $valor){

		$tabla = "materia";

		$respuesta = ModeloMateriales::MdlMostrarMateriales($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR MATERIAL
	=============================================*/

	static public function ctrCrearMaterial(){

		if(isset($_POST["nuevaDescripcion"])){

		   		/*=============================================
				VALIDAR IMAGEN
				=============================================*/

			   	$ruta = "";

			   	if(is_uploaded_file($_FILES["nuevaImagenMaterial"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["nuevaImagenMaterial"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;

					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

					$directorio = "vistas/img/materiales/".$_POST["nuevoCodigoMaterial"];

					mkdir($directorio, 0755);

					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/

					if($_FILES["nuevaImagenMaterial"]["type"] == "image/jpeg"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/materiales/".$_POST["nuevoCodigoMaterial"]."/".$aleatorio.".jpg";

						$origen = imagecreatefromjpeg($_FILES["nuevaImagenMaterial"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);

					}

					if($_FILES["nuevaImagenMaterial"]["type"] == "image/png"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/materiales/".$_POST["nuevoCodigoMaterial"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["nuevaImagenMaterial"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}

				$datos = array("idMateria" => $_POST["idMaterial"],
							   "codigo" => $_POST["nuevoCodigoMaterial"],
							   "nombre" => $_POST["nuevoNombre"],
							   "descripcion" => $_POST["nuevaDescripcion"],
							   "idUnidadMedida" => $_POST["nuevaUnidadMedida"],
							   "idMarca" => $_POST["nuevaMarca"],
							   "cantidad" => $_POST["nuevaCantidad"],
							   "precio" => $_POST["nuevoPrecio"],
							   "imagen" => $ruta);
							 
				$respuesta = ModeloMateriales::mdlIngresarMaterial($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El material ha sido guardado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "materiales";
					
					});
					
					
					</script>';

				}

		}

	}

	/*=============================================
	EDITAR MATERIAL
	=============================================*/

	static public function ctrEditarMaterial(){

		if(isset($_POST["editarDescripcion"])){

		   		/*=============================================
				VALIDAR IMAGEN
				=============================================*/

			   	if(isset($_FILES["editarImagenMaterial"]["tmp_name"]) && !empty($_FILES["editarImagenMaterial"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["editarImagenMaterial"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;

					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

					$directorio = "vistas/img/materiales/".$_POST["editarCodigo"];

					/*=============================================
					PRIMERO PREGUNTAMOS SI EXISTE OTRA IMAGEN EN LA BD
					=============================================*/

					if(!empty($_POST["ImagenMaterialActual"]) && $_POST["ImagenMaterialActual"] != "vistas/img/materiales/default/material.png"){

						unlink($_POST["ImagenMaterialActual"]);

					}else{

						mkdir($directorio, 0755);	
					
					}
					
					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/

					if($_FILES["editarImagenMaterial"]["type"] == "image/jpeg"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/materiales/".$_POST["editarCodigo"]."/".$aleatorio.".jpg";

						$origen = imagecreatefromjpeg($_FILES["editarImagenMaterial"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);

					}

					if($_FILES["editarImagenMaterial"]["type"] == "image/png"){

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/materiales/".$_POST["editarCodigo"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["editarImagenMaterial"]["tmp_name"]);						

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}else{
					$ruta = $_POST["ImagenMaterialActual"];
				}


				$datos = array("idMateria" =>$_POST["editaridMaterial"],
							   "nombre" => $_POST["editarNombre"],
							   "descripcion" => $_POST["editarDescripcion"],
							   "idMarca" => $_POST["editarMarca"],
							   "idUnidadMedida" => $_POST["editarUnidadMedida"],
							   "cantidad" => $_POST["editarCantidad"],
							   "precio" => $_POST["editarPrecio"],
							   "imagen" => $ruta);
							   
				echo var_dump($datos );

				$respuesta = ModeloMateriales::mdlEditarMaterial($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El material ha sido editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "materiales";
					
					});
					
					
					</script>';

					

				}


		}

	}

	/*=============================================
	BORRAR MATERIAL
	=============================================*/
	static public function ctrEliminarMaterial(){

		if(isset($_GET["idMaterial"])){

			$datos = $_GET["idMaterial"];

			if($_GET["imagen"] != "" && $_GET["imagen"] != "vistas/img/materiales/default/material.png"){

				unlink($_GET["imagen"]);
				rmdir('vistas/img/materiales/'.$_GET["codigo"]);

			}

			$movimientosMateriales = ModeloKardexMateriales::mdlMostrarKardexMateriales($_GET["idMaterial"]);

			if(count($movimientosMateriales)==0){

				$respuesta = ModeloMateriales::mdlEliminarMaterial($datos);

				if($respuesta == "ok"){
	
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡El material ha sido eliminado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "materiales";
					
					});
					
					
					</script>';
	
				}else{
					echo '<script>
	
					Swal.fire({
					
						icon: "error",
						title: "¡El material está en uso!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "materiales";
					
					});
					
					
					</script>';
				}	
			}else{

					echo '<script>
	
					Swal.fire({
					
						icon: "error",
						title: "¡El material está en uso!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "materiales";
					
					});
					
					</script>';

			}

	
		}


	}

}





	