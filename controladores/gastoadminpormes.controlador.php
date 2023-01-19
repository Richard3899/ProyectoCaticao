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

			$datos = array("idCostoRecetasGastoAdmin"=>$_POST["idCostoRecetasGastoAdmin"],
						   "idGastoAdmin"=>$_POST["idGastoAdmin"],
						   "nombreGastoAdmin"=>$_POST["nombreGastoAdmin"],
						   "cantidad"=>$_POST["nuevaCantidad"],
						   "precio"=>$_POST["precio"],
						   "total"=>$_POST["precioTotal"]);
		
			$respuesta = ModeloGastoAdminPorMes::mdlIngresarGastoAdminPorMes($datos);

			if($respuesta == "ok"){
		    
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El gasto administrativo fue agregado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
					window.location = "index.php?ruta=gastoadminpormes&idCostoRecetasGastoAdmin='.$_POST["idCostoRecetasGastoAdmin"].'&descripcion='.$_POST["descripcion"].'";
			
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
							"total"=>$_POST["editarPrecioTotal"]);
							   
			$respuesta = ModeloGastoAdminPorMes::mdlEditarGastoAdminPorMes($datos);
		
				if($respuesta == "ok"){
		    
					echo '<script>
	
					Swal.fire({
					
						icon: "success",
						title: "¡El gasto administrativo fue editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
						window.location = "index.php?ruta=gastoadminpormes&idCostoRecetasGastoAdmin='.$_POST["editarIdCostoRecetasGastoAdmin"].'&descripcion='.$_POST["editarDescripcion"].'";
				
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

					window.location = "index.php?ruta=gastoadminpormes&idCostoRecetasGastoAdmin='.$_GET["idCostoRecetasGastoAdmin"].'&descripcion='.$_GET["descripcion"].'";
			
			    });
				
				</script>';

			}		
		}


	}

}