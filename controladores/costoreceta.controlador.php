<?php

class ControladorRecetaGastoAdminPorMes{

	/*=============================================
	MOSTRAR RECETAS Y GASTO ADMIN POR MES
	=============================================*/

	static public function ctrMostrarRecetaGastoAdminPorMes($valor){

		$respuesta = ModeloRecetaGastoAdminPorMes::MdlMostrarRecetaGastoAdminPorMes($valor);

		return $respuesta;
	} 


	/*=============================================
	MOSTRAR RECETAS Y GASTO ADMIN POR MES
	=============================================*/

	static public function ctrCrearRecetaGastoAdminPorMes(){

		if(isset($_POST["idReceta"])){

            $rc = !isset($_POST["idReceta"])? '0' : $_POST["idReceta"];

			if($rc==0){

			ModeloRecetaGastoAdminPorMes::mdlEliminarRecetaGastoAdminPorMes(1);

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

			ModeloRecetaGastoAdminPorMes::mdlEliminarRecetaGastoAdminPorMes(1);

			$indice = $_POST['indice'];
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
 
			if($respuesta == "ok"){
 
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡Los gastos adicionales han sido guardado correctamente!",
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
}


	