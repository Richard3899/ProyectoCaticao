<?php

class ControladorGastoAdminPorMes{

	/*=============================================
	MOSTRAR LISTA GASTO POR MES
	=============================================*/

	static public function ctrMostrarGastoAdminPorMes($item,$valor){

		$respuesta = ModeloGastoAdminPorMes::mdlMostrarGastoAdminPorMes($item,$valor);

		return $respuesta;
	}

	/*=============================================
	MOSTRAR GASTO POR ID TIPO GASTO
	=============================================*/

	static public function ctrMostrarGastoAdminPorMesTG($valor1,$valor2){

		$respuesta = ModeloGastoAdminPorMes::mdlMostrarGastoAdminPorMesTG($valor1,$valor2);

		return $respuesta;
	}

	static public function ctrMostrarGastoAdminPorMes3($valor1,$valor2,$valor3,$valor4,$valor5){

		$respuesta = ModeloGastoAdminPorMes::mdlMostrarGastoAdminPorMes3($valor1,$valor2,$valor3,$valor4,$valor5);

		return $respuesta;
	} 

	/*=============================================
	SUMAR TOTAL DE GASTO POR MES
	=============================================*/
	static public function ctrSumaTotalGastoAdminPorMes($valor1,$valor2){

		$respuesta = ModeloGastoAdminPorMes::mdlSumaTotalGastoAdminPorMes($valor1,$valor2);

		return $respuesta;
	}

	/*=============================================
	AGREGAR LOS GASTO POR MES
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
					title: "¡El gasto fue agregado correctamente!",
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
	EDITAR GASTO POR MES
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
						title: "¡El gasto fue editado correctamente!",
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
	BORRAR GASTO POR MES
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
					title: "¡El gasto ha sido eliminado correctamente!",
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