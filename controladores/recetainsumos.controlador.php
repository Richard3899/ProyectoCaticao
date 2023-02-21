<?php

class ControladorRecetaInsumos{

	/*=============================================
	MOSTRAR LISTA DE RECETA INSUMOS
	=============================================*/

	static public function ctrMostrarRecetaInsumos($item,$valor){

		$respuesta = ModeloRecetaInsumos::mdlMostrarRecetaInsumos($item,$valor);

		return $respuesta;
	}
	/*=============================================
	MOSTRAR LISTA DETALLE INSUMOS
	=============================================*/
	static public function ctrMostrarDetalleInsumos($valor){

		$respuesta = ModeloRecetaInsumos::mdlMostrarDetalleinsumos($valor);

		return $respuesta;
	}
	/*=============================================
	SUMAR TOTAL DE RECETA INSUMOS
	=============================================*/
	static public function ctrSumaTotalRecetaInsumos($valor){

		$respuesta = ModeloRecetaInsumos::mdlSumaTotalRecetaInsumos($valor);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS INSUMOS EN LA RECETA
	=============================================*/

	static public function ctrCrearRecetaInsumo(){
			
		if(isset($_POST["idInsumo"])){

			$datos = array("idReceta"=>$_POST["idReceta"],
						   "codigoReceta"=>$_POST["codigoReceta"],
						   "idMateria"=>$_POST["idInsumo"],
						   "nombre"=>$_POST["nombreInsumo"],
						   "cantidad"=>$_POST["nuevaCantidad"],
						   "precioUnitario"=>$_POST["precioUnitario"],
						   "total"=>$_POST["precioTotal"]);
		
			$respuesta = ModeloRecetaInsumos::mdlIngresarRecetaInsumo($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El insumo fue agregado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "index.php?ruta=recetainsumos&codigo='.$_POST["codigoReceta"].'&nombre='.$_POST["nombreReceta"].'&idReceta='.$_POST["idReceta"].'";
			
			    });
				
				</script>';

			}

		


		}

	}


	/*=============================================
	EDITAR INSUMOS DE LA RECETA
	=============================================*/

	static public function ctrEditarRecetaInsumo(){

		if(isset($_POST["editaridRecetaInsumo"])){

			$datos = array( "idInsumoReceta"=>$_POST["editaridRecetaInsumo"],
			                "idReceta"=>$_POST["editaridReceta"],
							"codigoReceta"=>$_POST["editarcodigoReceta"],
							"idMateria"=>$_POST["editaridInsumo"],
							"nombre"=>$_POST["editarNombreInsumo"],
							"cantidad"=>$_POST["editarCantidad"],
							"precioUnitario"=>$_POST["editarprecioUnitario"],
							"total"=>$_POST["editarprecioTotal"]);
							   
			$respuesta = ModeloRecetaInsumos::mdlEditarRecetaInsumo($datos);

				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡El insumo fue editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=recetainsumos&codigo='.$_POST["editarcodigoReceta"].'&nombre='.$_POST["editarnombreReceta"].'&idReceta='.$_POST["editaridReceta"].'";
				
					});
					
					</script>';
	
				}


		}

	}


	/*=============================================
	BORRAR INSUMO DE LA RECETA
	=============================================*/
	static public function ctrEliminarRecetaInsumo(){

		if(isset($_GET["idRecetaInsumo"])){
            
			$datos = array("idRecetaInsumo"=>$_GET["idRecetaInsumo"],
						   "idReceta"=>$_GET["idReceta"],
						   "codigoReceta"=>$_GET["codigoReceta"],
			               "idMateria"=>$_GET["idInsumo"]);
			
			$respuesta = ModeloRecetaInsumos::mdlEliminarRecetaInsumo($datos);
			
			if($respuesta == "ok"){

				echo '<script>
				
				$(".cd").val("'.$_GET["codigoReceta"].'");

				$(".nm").val("'.$_GET["nombreReceta"].'");

				Swal.fire({
				
					icon: "success",
					title: "¡El insumo ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){

					window.location = "index.php?ruta=recetainsumos&codigo='.$_GET["codigoReceta"].'&nombre='.$_GET["nombreReceta"].'&idReceta='.$_GET["idReceta"].'";
			
			    });
				
				</script>';

			}		
		}


	}

}