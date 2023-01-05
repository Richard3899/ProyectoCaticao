<?php

class ControladorRecetaCostoMarketing{

	/*=============================================
	MOSTRAR LISTA DE RECETA COSTO DE MARKETING
	=============================================*/

	static public function ctrMostrarRecetaCostoMarketing($item,$valor){

		$respuesta = ModeloRecetaCostoMarketing::mdlMostrarRecetaCostoMarketing($item,$valor);

		return $respuesta;
	}

	/*=============================================
	SUMAR TOTAL DE RECETA COSTO DE MARKETING
	=============================================*/
	static public function ctrSumaTotalRecetaCostoMarketing($valor){

		$respuesta = ModeloRecetaCostoMarketing::mdlSumaTotalRecetaCostoMarketing($valor);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS COSTO DE MARKETING EN LA RECETA
	=============================================*/

	static public function ctrCrearRecetaCostoMarketing(){
			
		if(isset($_POST["idCostoMarketing"])){

			$datos = array("idReceta"=>$_POST["idReceta"],
						   "idCostoMarketing"=>$_POST["idCostoMarketing"],
						   "nombreCostoMarketing"=>$_POST["nombreCostoMarketing"],
						   "cantidad"=>$_POST["nuevaCantidad"],
						   "precio"=>$_POST["precio"],
						   "total"=>$_POST["precioTotal"]);
		
			$respuesta = ModeloRecetaCostoMarketing::mdlIngresarRecetaCostoMarketing($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El costo de marketing fue agregado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "index.php?ruta=recetacostomarketing&codigo='.$_POST["codigoReceta"].'&nombre='.$_POST["nombreReceta"].'&idReceta='.$_POST["idReceta"].'";
			
			    });
				
				</script>';

			}

		


		}

	}


	/*=============================================
	EDITAR COSTO DE MARKETING DE LA RECETA
	=============================================*/

	static public function ctrEditarRecetaCostoMarketing(){

		if(isset($_POST["editaridRecetaCostoMarketing"])){

			$datos = array( "idRecetaCostoMarketing"=>$_POST["editaridRecetaCostoMarketing"],
							"cantidad"=>$_POST["editarCantidad"],
							"total"=>$_POST["editarPrecioTotal"]);
							   
			$respuesta = ModeloRecetaCostoMarketing::mdlEditarRecetaCostoMarketing($datos);
		
				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡El costo de marketing fue editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=recetacostomarketing&codigo='.$_POST["editarcodigoReceta"].'&nombre='.$_POST["editarnombreReceta"].'&idReceta='.$_POST["editaridReceta"].'";
				
					});
					
					</script>';
	
				}


		}

	}


	/*=============================================
	BORRAR COSTO DE MARKETING DE LA RECETA
	=============================================*/
	static public function ctrEliminarRecetaCostoMarketing(){

		if(isset($_GET["idRecetaCostoMarketing"])){
            
			$datos = array("idRecetaCostoMarketing"=>$_GET["idRecetaCostoMarketing"]);
			
			$respuesta = ModeloRecetaCostoMarketing::mdlEliminarRecetaCostoMarketing($datos);
			
			if($respuesta == "ok"){

				echo '<script>
				
				$(".cd").val("'.$_GET["codigoReceta"].'");

				$(".nm").val("'.$_GET["nombreReceta"].'");

				Swal.fire({
				
					icon: "success",
					title: "¡El costo de marketing ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){

					window.location = "index.php?ruta=recetacostomarketing&codigo='.$_GET["codigoReceta"].'&nombre='.$_GET["nombreReceta"].'&idReceta='.$_GET["idReceta"].'";
			
			    });
				
				</script>';

			}		
		}


	}

}