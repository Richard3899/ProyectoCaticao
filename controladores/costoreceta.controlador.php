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

			$indice=explode( ',', $indice );
			$idReceta=explode( ',', $idReceta );
			$idGastoAdminPorMes=explode( ',', $idGastoAdminPorMes );

			foreach($idReceta as $i => $valor){

				$datos = array("idReceta" => $valor,
				               "idGastoAdminPorMes" => $idGastoAdminPorMes[$i],
							   "indice" => $indice[$i]);

				$respuesta=ModeloRecetaGastoAdminPorMes::mdlIngresarRecetaGastoAdminPorMes($datos);
			}


		// 	------------------------------------
		// AGREGAR UN PROCEDIMIENTO ALMACENADO PARA ACTUALIZAR LOS PRECIOS (POR RECETA)

		// CALL sumatotal_costoporreceta(idRecetaI);
		// --------------------------------------------------------------------------

		// 	------------------------------------
		//  CREAR CONDICION SI VA A CERRAR LOS ADICIONALES PRIMERO QUE OCULTE CIERRE EL MES
		// --------------------------------------------------------------------------
 
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
	static public function ctrCerrarAdicional(){

		if(isset($_GET["idReceta"])){
					
			$datos = array( "idReceta" => $_GET["idReceta"]);

			$respuesta = ModeloRecetaGastoAdminPorMes::mdlCerrarAdicional($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡Los adicionales ha sido cerrado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "costoreceta";
				
				});
				
				</script>';

			}
	
		}

	}

	/*=============================================
	MOSTRAR RECETAS Y GASTOS POR MES
	=============================================*/

	static public function ctrMostrarRecetaGastoAdmin($valor){

		$respuesta = ModeloRecetaGastoAdminPorMes::MdlMostrarRecetaGastoAdmin($valor);

		return $respuesta;
	}

	/*=============================================
	MOSTRAR RECETAS Y GASTOS POR MES
	=============================================*/

	static public function ctrSumaTotalRecetaGastoAdmin($valor){

		$respuesta = ModeloRecetaGastoAdminPorMes::MdlSumaTotalRecetaGastoAdmin($valor);

		return $respuesta;
	}

}


	