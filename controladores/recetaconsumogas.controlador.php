<?php

class ControladorRecetaConsumoGas{

	/*=============================================
	MOSTRAR LISTA DE RECETA CONSUMO DE GAS
	=============================================*/

	static public function ctrMostrarRecetaConsumoGas($item,$valor){

		$respuesta = ModeloRecetaConsumoGas::mdlMostrarRecetaConsumoGas($item,$valor);

		return $respuesta;
	}

	/*=============================================
	SUMAR TOTAL DE RECETA CONSUMO DE GAS
	=============================================*/
	static public function ctrSumaTotalRecetaConsumoGas($valor){

		$respuesta = ModeloRecetaConsumoGas::mdlSumaTotalRecetaConsumoGas($valor);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS CONSUMO DE GAS EN LA RECETA
	=============================================*/

	static public function ctrCrearRecetaConsumoGas(){
			
		if(isset($_POST["idMaquina"])){

			$datos = array("idReceta"=>$_POST["idReceta"],
						   "idMaquina"=>$_POST["idMaquina"],
						   "nombreMaquina"=>$_POST["nombreMaquina"],
						   "trabajoPorBatch"=>$_POST["nuevoTrabajoPorBatch"],
						   "pesoBalonGas"=>$_POST["nuevoPesoBalonGas"],
						   "tarifaGas"=>$_POST["nuevaTarifaGas"]);
		
			$respuesta = ModeloRecetaConsumoGas::mdlIngresarRecetaConsumoGas($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El consumo gas fue agregada correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "index.php?ruta=recetaconsumogas&codigo='.$_POST["codigoReceta"].'&nombre='.$_POST["nombreReceta"].'&idReceta='.$_POST["idReceta"].'";
			
			    });
				
				</script>';

			}

		


		}

	}


	/*=============================================
	EDITAR CONSUMO DE GAS DE LA RECETA
	=============================================*/

	static public function ctrEditarRecetaConsumoGas(){

		if(isset($_POST["editaridRecetaConsumoGas"])){

			$datos = array( "idRecetaConsumoGas"=>$_POST["editaridRecetaConsumoGas"],
							"trabajoPorBatch"=>$_POST["editarTrabajoPorBatch"],
							"pesoBalonGas"=>$_POST["editarPesoBalonGas"],
							"tarifaGas"=>$_POST["editarTarifaGas"]);
							   
			$respuesta = ModeloRecetaConsumoGas::mdlEditarRecetaConsumoGas($datos);
		
				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡El consumo gas fue editada correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=recetaconsumogas&codigo='.$_POST["editarcodigoReceta"].'&nombre='.$_POST["editarnombreReceta"].'&idReceta='.$_POST["editaridReceta"].'";
				
					});
					
					</script>';
	
				}


		}

	}


	/*=============================================
	BORRAR CONSUMO DE GAS DE LA RECETA
	=============================================*/
	static public function ctrEliminarRecetaConsumoGas(){

		if(isset($_GET["idRecetaConsumoGas"])){
            
			$datos = array("idRecetaConsumoGas"=>$_GET["idRecetaConsumoGas"]);
			
			$respuesta = ModeloRecetaConsumoGas::mdlEliminarRecetaConsumoGas($datos);
			
			if($respuesta == "ok"){

				echo '<script>
				
				$(".cd").val("'.$_GET["codigoReceta"].'");

				$(".nm").val("'.$_GET["nombreReceta"].'");

				Swal.fire({
				
					icon: "success",
					title: "¡El consumo gas ha sido eliminada correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){

					window.location = "index.php?ruta=recetaconsumogas&codigo='.$_GET["codigoReceta"].'&nombre='.$_GET["nombreReceta"].'&idReceta='.$_GET["idReceta"].'";
			
			    });
				
				</script>';

			}		
		}


	}

}