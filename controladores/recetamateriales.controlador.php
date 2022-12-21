<?php

class ControladorRecetaMateriales{

	/*=============================================
	MOSTRAR LISTA DE RECETA MATERIALES
	=============================================*/

	static public function ctrMostrarRecetaMateriales($item,$valor){

		$respuesta = ModeloRecetaMateriales::mdlMostrarRecetaMateriales($item,$valor);

		return $respuesta;
	}
	/*=============================================
	MOSTRAR LISTA DETALLE MATERIALES
	=============================================*/
	static public function ctrMostrarDetalleMateriales($valor){

		$respuesta = ModeloRecetaMateriales::mdlMostrarDetallemateriales($valor);

		return $respuesta;
	}
	/*=============================================
	SUMAR TOTAL DE RECETA MATERIALES
	=============================================*/
	static public function ctrSumaTotalRecetaMateriales($valor){

		$respuesta = ModeloRecetaMateriales::mdlSumaTotalRecetaMateriales($valor);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS MATERIALES EN LA RECETA
	=============================================*/

	static public function ctrCrearRecetaMaterial(){
			
		if(isset($_POST["idMaterial"])){

			$datos = array("idReceta"=>$_POST["idReceta"],
						   "codigoReceta"=>$_POST["codigoReceta"],
						   "idMateria"=>$_POST["idMaterial"],
						   "nombre"=>$_POST["nombreMaterial"],
						   "cantidad"=>$_POST["nuevaCantidad"],
						   "precioUnitario"=>$_POST["precioUnitario"],
						   "total"=>$_POST["precioTotal"]);
		
			$respuesta = ModeloRecetaMateriales::mdlIngresarRecetaMaterial($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El material fue agregado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "index.php?ruta=recetamateriales&codigo='.$_POST["codigoReceta"].'&nombre='.$_POST["nombreReceta"].'&idReceta='.$_POST["idReceta"].'";
			
			    });
				
				</script>';

			}

		


		}

	}


	/*=============================================
	EDITAR MATERIALES DE LA RECETA
	=============================================*/

	static public function ctrEditarRecetaMaterial(){

		if(isset($_POST["editaridRecetaMaterial"])){

			$datos = array( "idMaterialReceta"=>$_POST["editaridRecetaMaterial"],
			                "idReceta"=>$_POST["editaridReceta"],
							"codigoReceta"=>$_POST["editarcodigoReceta"],
							"idMateria"=>$_POST["editaridMaterial"],
							"nombre"=>$_POST["editarNombreMaterial"],
							"cantidadAnterior"=>$_POST["cantidadAnterior"],
							"diferenciaCantidad"=>$_POST["diferenciaCantidad"],
							"cantidad"=>$_POST["editarCantidad"],
							"precioUnitario"=>$_POST["editarprecioUnitario"],
							"total"=>$_POST["editarprecioTotal"]);
							   
			$respuesta = ModeloRecetaMateriales::mdlEditarRecetaMaterial($datos);

				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡El material fue editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=recetamateriales&codigo='.$_POST["editarcodigoReceta"].'&nombre='.$_POST["editarnombreReceta"].'&idReceta='.$_POST["editaridReceta"].'";
				
					});
					
					</script>';
	
				}


		}

	}


	/*=============================================
	BORRAR MATERIAL DE LA RECETA
	=============================================*/
	static public function ctrEliminarRecetaMaterial(){

		if(isset($_GET["idRecetaMaterial"])){
            
			$datos = array("idRecetaMaterial"=>$_GET["idRecetaMaterial"],
						   "codigoReceta"=>$_GET["codigoReceta"],
			               "idMateria"=>$_GET["idMaterial"],
						   "cantidad"=>$_GET["cantidadMaterial"]);
			
			$respuesta = ModeloRecetaMateriales::mdlEliminarRecetaMaterial($datos);
			
			if($respuesta == "ok"){

				echo '<script>
				
				$(".cd").val("'.$_GET["codigoReceta"].'");

				$(".nm").val("'.$_GET["nombreReceta"].'");

				Swal.fire({
				
					icon: "success",
					title: "¡El material ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){

					window.location = "index.php?ruta=recetamateriales&codigo='.$_GET["codigoReceta"].'&nombre='.$_GET["nombreReceta"].'&idReceta='.$_GET["idReceta"].'";
			
			    });
				
				</script>';

			}		
		}


	}

}