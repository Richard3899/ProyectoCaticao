<?php

class ControladorGastoAdminPorMes{

	/*=============================================
	MOSTRAR LISTA GASTO ADMIN POR MES
	=============================================*/

	static public function ctrMostrarGastoAdminPorMes($item,$valor){

		$respuesta = ModeloGastoAdminPorMes::mdlMostrarGastoAdminPorMes($item,$valor);

		return $respuesta;
	}

	/*=============================================
	MOSTRAR GASTO POR ID TIPO GASTO
	=============================================*/

	static public function ctrMostrarGastoAdminPorMesTG($valor){

		$respuesta = ModeloGastoAdminPorMes::mdlMostrarGastoAdminPorMesTG($valor);

		return $respuesta;
	}

	/*=============================================
	SUMAR TOTAL DE GASTO ADMIN POR MES
	=============================================*/
	static public function ctrSumaTotalGastoAdminPorMes($valor){

		$respuesta = ModeloGastoAdminPorMes::mdlSumaTotalGastoAdminPorMes($valor);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS GASTO ADMIN POR MES
	=============================================*/

	static public function ctrCrearGastoAdminPorMes(){
			
		if(isset($_POST["idGastoAdmin"])){

			$datos = array("idMesGasto"=>$_POST["idMesGasto"],
						   "idGastoAdmin"=>$_POST["idGastoAdmin"],
						   "nombreGastoAdmin"=>$_POST["nombreGastoAdmin"],
						   "cantidad"=>$_POST["nuevaCantidad"],
						   "precio"=>$_POST["nuevoPrecio"],
						   "total"=>$_POST["nuevoTotal"]);
		
			$respuesta = ModeloGastoAdminPorMes::mdlIngresarGastoAdminPorMes($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El gasto administrativo fue agregado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "index.php?ruta=gastoadminpormes&idMesGasto='.$_POST["idMesGasto"].'&descripcion='.$_POST["descripcion"].'";
			
			    });
				
				</script>';

			}

		


		}

	}


	/*=============================================
	EDITAR GASTO ADMIN POR MES
	=============================================*/

	static public function ctrEditarGastoAdminPorMes(){

		if(isset($_POST["editaridGastoAdminPorMes"])){

			$datos = array( "idGastoAdminPorMes"=>$_POST["editaridGastoAdminPorMes"],
							"cantidad"=>$_POST["editarCantidad"],
							"precio"=>$_POST["editarPrecio"],
							"total"=>$_POST["editarTotal"]);
							   
			$respuesta = ModeloGastoAdminPorMes::mdlEditarGastoAdminPorMes($datos);
		
				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡El gasto administrativo fue editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=gastoadminpormes&idMesGasto='.$_POST["editaridMesGasto"].'&descripcion='.$_POST["editarDescripcion"].'";
				
					});
					
					</script>';
	
				}


		}

	}


	/*=============================================
	BORRAR GASTO ADMIN POR MES
	=============================================*/
	static public function ctrEliminarGastoAdminPorMes(){

		if(isset($_GET["idGastoAdminPorMes"])){
            
			$datos = array("idGastoAdminPorMes"=>$_GET["idGastoAdminPorMes"]);
			
			$respuesta = ModeloGastoAdminPorMes::mdlEliminarGastoAdminPorMes($datos);
			
			if($respuesta == "ok"){

				echo '<script>
				
				$(".nm").val("'.$_GET["descripcion"].'");

				Swal.fire({
				
					icon: "success",
					title: "¡El gasto administrativo ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){

					window.location = "index.php?ruta=gastoadminpormes&idMesGasto='.$_GET["idMesGasto"].'&descripcion='.$_GET["descripcion"].'";
			
			    });
				
				</script>';

			}		
		}


	}

}