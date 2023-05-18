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

			$idReceta = $_POST['idReceta'];
			$idGastoAdminPorMes = $_POST['idGastoAdminPorMes'];
			$idReceta=explode( ',', $idReceta );
			$idGastoAdminPorMes=explode( ',', $idGastoAdminPorMes );

			foreach($idReceta as $i => $valor){

				$datos = array("idReceta" => $valor,"idGastoAdminPorMes" => $idGastoAdminPorMes[$i]);

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


	