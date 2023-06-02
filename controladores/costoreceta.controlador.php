<?php

class ControladorRecetaGastoAdminPorMes{

	/*=============================================
	MOSTRAR RECETAS Y GASTO ADMIN POR MES
	=============================================*/

	static public function ctrMostrarRecetaGastoAdminPorMes($valor1,$valor2){

		$respuesta = ModeloRecetaGastoAdminPorMes::MdlMostrarRecetaGastoAdminPorMes($valor1,$valor2);

		return $respuesta;
	}

	static public function ctrMostrarTipoGastoPorMes($valor){

		$respuesta = ModeloRecetaGastoAdminPorMes::mdlMostrarTipoGastoPorMes($valor);

		return $respuesta;
	}


	/*=============================================
	MOSTRAR RECETAS Y GASTO ADMIN POR MES
	=============================================*/

	static public function ctrCrearRecetaGastoAdminPorMes(){

		if(isset($_POST["idReceta"])){

            $indice = !isset($_POST["indice"])? '0' : $_POST["indice"];

			$idMesGasto = $_POST['seleccionarMesGasto'];
			$idTipoGasto = $_POST['nuevoTipoGasto'];

			if($indice==0){

			ModeloRecetaGastoAdminPorMes::mdlEliminarRecetaGastoAdminPorMes($idMesGasto,$idTipoGasto);

			echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡Los gastos adicionales han sido actualizados correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "costoreceta";
				
				});

				</script>';

			}else{

			ModeloRecetaGastoAdminPorMes::mdlEliminarRecetaGastoAdminPorMes($idMesGasto,$idTipoGasto);

			$idReceta = $_POST['idReceta'];
			$idGastoAdminPorMes = $_POST['idGastoAdminPorMes'];
			$RecetasActualizar=$_POST['RecetasActualizar'];

			$indice=explode( ',', $indice );
			$idReceta=explode( ',', $idReceta );
			$idGastoAdminPorMes=explode( ',', $idGastoAdminPorMes );
			$RecetasActualizar=explode( ',', $RecetasActualizar );

			foreach($idReceta as $i => $valor){

				$datos = array("idReceta" => $valor,
				               "idGastoAdminPorMes" => $idGastoAdminPorMes[$i],
							   "indice" => $indice[$i]);

				$respuesta=ModeloRecetaGastoAdminPorMes::mdlIngresarRecetaGastoAdminPorMes($datos);
			}
			
			foreach($RecetasActualizar as $valor){

				ModeloRecetaGastoAdminPorMes::mdlActualizarCostoTotalReceta($valor);

			}
 
			if($respuesta == "ok"){
 
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡Los gastos adicionales han sido actualizados correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "costoreceta";
				
				});

				</script>';

			}	
			}

		}
	} 

	/*=============================================
	CERRAR ADICIONAL
	=============================================*/
	static public function ctrOcultarAdicional(){

		if(isset($_GET["idReceta"])){
					
			$datos = array( "idReceta" => $_GET["idReceta"]);

			$respuesta = ModeloRecetaGastoAdminPorMes::mdlOcultarAdicional($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡La receta a sido oculta en adicionales correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "costoreceta";
				
				});
				
				</script>';

			}
	
		}

	}

	static public function ctrValidarMesOculto($valor){

		$respuesta = ModeloRecetaGastoAdminPorMes::mdlValidarMesOculto($valor);

		return $respuesta;
	}

	static public function ctrValidarGastoNoAgregado($valor){

		$respuesta = ModeloRecetaGastoAdminPorMes::mdlValidarGastoNoAgregado($valor);

		return $respuesta;
	}

	/*=============================================
	MOSTRAR RECETAS Y GASTOS POR MES
	=============================================*/

	static public function ctrMostrarRecetaGastoAdmin($valor1,$valor2){

		$respuesta = ModeloRecetaGastoAdminPorMes::MdlMostrarRecetaGastoAdmin($valor1,$valor2);

		return $respuesta;
	}

	/*=============================================
	MOSTRAR RECETAS Y GASTOS POR MES
	=============================================*/

	static public function ctrSumaTotalRecetaGastoAdmin($valor1,$valor2){

		$respuesta = ModeloRecetaGastoAdminPorMes::MdlSumaTotalRecetaGastoAdmin($valor1,$valor2);

		return $respuesta;
	}

}


	