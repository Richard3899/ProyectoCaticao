<?php

class ControladorAgregarInsumos{

	/*=============================================
	MOSTRAR LISTA DE INSUMOS
	=============================================*/

	static public function ctrMostrarAgregarInsumos($item,$valor){

		$respuesta = ModeloAgregarInsumos::mdlMostrarAgregarInsumos($item,$valor);

		return $respuesta;
	}

	static public function ctrMostrarDetalleInsumos($valor){

		$respuesta = ModeloAgregarInsumos::mdlMostrarDetalleinsumos($valor);

		return $respuesta;
	}

	static public function ctrSumaTotalAgregarInsumos($valor){

		$respuesta = ModeloAgregarInsumos::mdlSumaTotalAgregarInsumos($valor);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS INSUMOS
	=============================================*/

	static public function ctrCrearAgregarInsumo(){
			
		if(isset($_POST["idInsumo"])){

			/*=============================================
			GUARDAR LOS INSUMOS
			=============================================*/	

			$datos = array("idReceta"=>$_POST["idReceta"],
						   "codigoReceta"=>$_POST["codigoReceta"],
						   "idMateria"=>$_POST["idInsumo"],
						   "nombre"=>$_POST["nuevoNombre"],
						   "cantidad"=>$_POST["nuevaCantidad"],
						   "precioUnitario"=>$_POST["precioUnitarioReal"],
						   "total"=>$_POST["precioTotal"]);
		
			$respuesta = ModeloAgregarInsumos::mdlIngresarAgregarInsumo($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El insumo fue agregado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "index.php?ruta=agregarinsumos&codigo='.$_POST["codigoReceta"].'&nombre='.$_POST["nombreReceta"].'&idReceta='.$_POST["idReceta"].'";
			
			    });
				
				</script>';

			}

		


		}

	}


	/*=============================================
	EDITAR INSUMOS
	=============================================*/

	static public function ctrEditarAgregarInsumo(){

		if(isset($_POST["editaridInsumoReceta"])){

			$datos = array( "idInsumoReceta"=>$_POST["editaridInsumoReceta"],
			                "idReceta"=>$_POST["editaridReceta"],
							"codigoReceta"=>$_POST["editarcodigoReceta"],
							"idMateria"=>$_POST["editaridInsumo"],
							"nombre"=>$_POST["editarNombre"],
							"cantidadAnterior"=>$_POST["cantidadAnterior"],
							"diferenciaCantidad"=>$_POST["diferenciaCantidad"],
							"cantidad"=>$_POST["editarCantidad"],
							"precioUnitario"=>$_POST["editarprecioUnitarioReal"],
							"total"=>$_POST["editarprecioTotal"]);
							   
			$respuesta = ModeloAgregarInsumos::mdlEditarAgregarInsumo($datos);

				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡El insumo fue editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=agregarinsumos&codigo='.$_POST["editarcodigoReceta"].'&nombre='.$_POST["editarnombreReceta"].'&idReceta='.$_POST["editaridReceta"].'";
				
					});
					
					</script>';
	
				}


		}

	}


	/*=============================================
	BORRAR INSUMO
	=============================================*/
	static public function ctrEliminarAgregarInsumo(){

		if(isset($_GET["idRecetaInsumo"])){
            
			$datos = array("idRecetaInsumo"=>$_GET["idRecetaInsumo"],
						   "codigoReceta"=>$_GET["codigoReceta"],
			               "idMateria"=>$_GET["idInsumo"],
						   "cantidad"=>$_GET["cantidadInsumo"]);
			
			$respuesta = ModeloAgregarInsumos::mdlEliminarAgregarInsumo($datos);
			
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

					window.location = "index.php?ruta=agregarinsumos&codigo='.$_GET["codigoReceta"].'&nombre='.$_GET["nombreReceta"].'&idReceta='.$_GET["idReceta"].'";
			
			    });
				
				</script>';

			}		
		}


	}

}