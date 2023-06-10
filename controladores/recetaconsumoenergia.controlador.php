<?php

class ControladorRecetaConsumoEnergia{

	/*=============================================
	MOSTRAR TARIFA KWH
	=============================================*/

	static public function ctrMostrarTarifaKwh(){

		$respuesta = ModeloRecetaConsumoEnergia::mdlMostrarTarifaKwh();

		return $respuesta;
	}

	/*=============================================
	EDITAR TARIFA KWH
	=============================================*/

	static public function ctrEditarTarifaKwh(){

		if(isset($_POST["editarTarifaKwh"])){

			$datos = array( "tarifaKwh"=>$_POST["editarTarifaKwh"]);
							   
			$respuesta = ModeloRecetaConsumoEnergia::mdlEditarTarifaKwh($datos);
		
				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡La tarifa Kwh fue editada correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=recetaconsumoenergia&codigo='.$_POST["codigoRecetaTF"].'&nombre='.$_POST["nombreRecetaTF"].'&idReceta='.$_POST["idRecetaTF"].'";
				
					});
					
					</script>';
	
				}


		}

	}
	/*=============================================
	MOSTRAR LISTA DE RECETA CONSUMO DE ENERGÍA
	=============================================*/

	static public function ctrMostrarRecetaConsumoEnergia($item,$valor){

		$respuesta = ModeloRecetaConsumoEnergia::mdlMostrarRecetaConsumoEnergia($item,$valor);

		return $respuesta;
	}

	/*=============================================
	SUMAR TOTAL DE RECETA CONSUMO DE ENERGÍA
	=============================================*/
	static public function ctrSumaTotalRecetaConsumoEnergia($valor){

		$respuesta = ModeloRecetaConsumoEnergia::mdlSumaTotalRecetaConsumoEnergia($valor);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS CONSUMO DE ENERGÍA EN LA RECETA
	=============================================*/

	static public function ctrCrearRecetaConsumoEnergia(){
			
		if(isset($_POST["idMaquina"])){

			$datos = array("idReceta"=>$_POST["idReceta"],
						   "idMaquina"=>$_POST["idMaquina"],
						   "nombreMaquina"=>$_POST["nombreMaquina"],
						   "potenciaKw"=>$_POST["potenciaKw"],
						   "horasTrabajoBatch"=>$_POST["nuevoTiempoHoras"],
						   "consumoKwh"=>$_POST["consumoKwh"],
						   "tarifaKwh"=>$_POST["tarifaKwh"],
						   "pagoPorBatch"=>$_POST["precioTotal"]);
		
			$respuesta = ModeloRecetaConsumoEnergia::mdlIngresarRecetaConsumoEnergia($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El consumo de energía fue agregado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "index.php?ruta=recetaconsumoenergia&codigo='.$_POST["codigoReceta"].'&nombre='.$_POST["nombreReceta"].'&idReceta='.$_POST["idReceta"].'";
			
			    });
				
				</script>';

			}

		


		}

	}


	/*=============================================
	EDITAR CONSUMO DE ENERGÍA DE LA RECETA
	=============================================*/

	static public function ctrEditarRecetaConsumoEnergia(){

		if(isset($_POST["editaridRecetaConsumoEnergia"])){

			$datos = array( "idRecetaConsumoEnergia"=>$_POST["editaridRecetaConsumoEnergia"],
						    "idReceta"=>$_POST["editaridReceta"],
							"horasTrabajoBatch"=>$_POST["editarTiempoHoras"],
							"consumoKwh"=>$_POST["editarConsumoKwh"],
							"pagoPorBatch"=>$_POST["editarprecioTotal"]);
							   
			$respuesta = ModeloRecetaConsumoEnergia::mdlEditarRecetaConsumoEnergia($datos);
		
				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡El consumo de energía fue editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=recetaconsumoenergia&codigo='.$_POST["editarcodigoReceta"].'&nombre='.$_POST["editarnombreReceta"].'&idReceta='.$_POST["editaridReceta"].'";
				
					});
					
					</script>';
	
				}


		}

	}


	/*=============================================
	BORRAR CONSUMO DE ENERGÍA DE LA RECETA
	=============================================*/
	static public function ctrEliminarRecetaConsumoEnergia(){

		if(isset($_GET["idRecetaConsumoEnergia"])){
            
			$datos = array("idRecetaConsumoEnergia"=>$_GET["idRecetaConsumoEnergia"],
						   "idReceta"=>$_GET["idReceta"]);
			
			$respuesta = ModeloRecetaConsumoEnergia::mdlEliminarRecetaConsumoEnergia($datos);
			
			if($respuesta == "ok"){

				echo '<script>
				
				$(".cd").val("'.$_GET["codigoReceta"].'");

				$(".nm").val("'.$_GET["nombreReceta"].'");

				Swal.fire({
				
					icon: "success",
					title: "¡La consumo de energía ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){

					window.location = "index.php?ruta=recetaconsumoenergia&codigo='.$_GET["codigoReceta"].'&nombre='.$_GET["nombreReceta"].'&idReceta='.$_GET["idReceta"].'";
			
			    });
				
				</script>';

			}		
		}


	}

}