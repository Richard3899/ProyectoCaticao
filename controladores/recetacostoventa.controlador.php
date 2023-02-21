<?php

class ControladorRecetaCostoVenta{

	/*=============================================
	MOSTRAR LISTA DE RECETA COSTO DE VENTA
	=============================================*/

	static public function ctrMostrarRecetaCostoVenta($item,$valor){

		$respuesta = ModeloRecetaCostoVenta::mdlMostrarRecetaCostoVenta($item,$valor);

		return $respuesta;
	}

	/*=============================================
	SUMAR TOTAL DE RECETA COSTO DE VENTA
	=============================================*/
	static public function ctrSumaTotalRecetaCostoVenta($valor){

		$respuesta = ModeloRecetaCostoVenta::mdlSumaTotalRecetaCostoVenta($valor);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS COSTO DE VENTA EN LA RECETA
	=============================================*/

	static public function ctrCrearRecetaCostoVenta(){
			
		if(isset($_POST["idCostoVenta"])){

			$datos = array("idReceta"=>$_POST["idReceta"],
						   "idCostoVenta"=>$_POST["idCostoVenta"],
						   "nombreCostoVenta"=>$_POST["nombreCostoVenta"],
						   "cantidad"=>$_POST["nuevaCantidad"],
						   "precio"=>$_POST["precio"],
						   "total"=>$_POST["precioTotal"]);
		
			$respuesta = ModeloRecetaCostoVenta::mdlIngresarRecetaCostoVenta($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El costo de venta fue agregado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "index.php?ruta=recetacostoventa&codigo='.$_POST["codigoReceta"].'&nombre='.$_POST["nombreReceta"].'&idReceta='.$_POST["idReceta"].'";
			
			    });
				
				</script>';

			}

		


		}

	}


	/*=============================================
	EDITAR COSTO DE VENTA DE LA RECETA
	=============================================*/

	static public function ctrEditarRecetaCostoVenta(){

		if(isset($_POST["editaridRecetaCostoVenta"])){

			$datos = array( "idRecetaCostoVenta"=>$_POST["editaridRecetaCostoVenta"],
						    "idReceta"=>$_POST["editaridReceta"],
							"cantidad"=>$_POST["editarCantidad"],
							"total"=>$_POST["editarPrecioTotal"]);
							   
			$respuesta = ModeloRecetaCostoVenta::mdlEditarRecetaCostoVenta($datos);
		
				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡El costo de venta fue editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=recetacostoventa&codigo='.$_POST["editarcodigoReceta"].'&nombre='.$_POST["editarnombreReceta"].'&idReceta='.$_POST["editaridReceta"].'";
				
					});
					
					</script>';
	
				}


		}

	}


	/*=============================================
	BORRAR COSTO DE VENTA DE LA RECETA
	=============================================*/
	static public function ctrEliminarRecetaCostoVenta(){

		if(isset($_GET["idRecetaCostoVenta"])){
            
			$datos = array("idRecetaCostoVenta"=>$_GET["idRecetaCostoVenta"],
						   "idReceta"=>$_GET["idReceta"]);
			
			$respuesta = ModeloRecetaCostoVenta::mdlEliminarRecetaCostoVenta($datos);
			
			if($respuesta == "ok"){

				echo '<script>
				
				$(".cd").val("'.$_GET["codigoReceta"].'");

				$(".nm").val("'.$_GET["nombreReceta"].'");

				Swal.fire({
				
					icon: "success",
					title: "¡El costo de venta ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){

					window.location = "index.php?ruta=recetacostoventa&codigo='.$_GET["codigoReceta"].'&nombre='.$_GET["nombreReceta"].'&idReceta='.$_GET["idReceta"].'";
			
			    });
				
				</script>';

			}		
		}


	}

}