<?php

class ControladorEmpleados{

	/*=============================================
	MOSTRAR EMPLEADOS
	=============================================*/

	static public function ctrMostrarEmpleados($item, $valor){

		$tabla = "empleado";

		$respuesta = ModeloEmpleados::MdlMostrarEmpleados($tabla, $item, $valor);

		return $respuesta;
	}


	/*=============================================
	CREAR EMPLEADO
	=============================================*/

	static public function ctrCrearEmpleado(){

		if(isset($_POST["nuevoNombre"])){

				$datos = array("nombre" => $_POST["nuevoNombre"],
							   "apellido" => $_POST["nuevoApellido"],
							   "idUsuario" => $_POST["nuevoUsuarioEmpleado"],
							   "correo" => $_POST["nuevoCorreo"],
							   "idTipoDocumento" => $_POST["nuevoTipoDocumento"],
							   "numeroDocumento" => $_POST["nuevoNumeroDocumento"],
							   "direccion" => $_POST["nuevaDireccion"],
							   "telefono" => $_POST["nuevoTelefono"],
							   "fechaNacimiento" => $_POST["nuevaFechaNacimiento"],
							   "cargo" => $_POST["nuevoCargo"],
							   "horarioTrabajo" => $_POST["nuevoHorarioTrabajo"],
							   "horasPorDia" => $_POST["nuevoHorasPorDia"],
							   "sueldoPorDia" => $_POST["nuevoSueldoPorDia"],
							   "sueldoPorMes" => $_POST["nuevoSueldoPorMes"],
							   "idTipoCosto" => $_POST["nuevoTipoCosto"]);
							 

				$respuesta = ModeloEmpleados::mdlIngresarEmpleado($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El empleado ha sido guardado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "empleados";
					
					});
					
					
					</script>';

				}


		}

	}

	/*=============================================
	EDITAR EMPLEADO
	=============================================*/

	static public function ctrEditarEmpleado(){

		if(isset($_POST["editarNombre"])){

				$datos = array("nombre" => $_POST["editarNombre"],
						"apellido" => $_POST["editarApellido"],
						"idUsuario" => $_POST["editarUsuarioEmpleado"],
						"correo" => $_POST["editarCorreo"],
						"idTipoDocumento" => $_POST["editarTipoDocumento"],
						"numeroDocumento" => $_POST["editarNumeroDocumento"],
						"direccion" => $_POST["editarDireccion"],
						"telefono" => $_POST["editarTelefono"],
						"fechaNacimiento" => $_POST["editarFechaNacimiento"],
						"cargo" => $_POST["editarCargo"],
						"horarioTrabajo" => $_POST["editarHorarioTrabajo"],
						"horasPorDia" => $_POST["editarHorasPorDia"],
						"sueldoPorDia" => $_POST["editarSueldoPorDia"],
						"sueldoPorMes" => $_POST["editarSueldoPorMes"],
						"idTipoCosto" => $_POST["editarTipoCosto"]);		   
							   
				$respuesta = ModeloEmpleados::mdlEditarEmpleado($datos);

				if($respuesta == "ok"){

					echo '<script>

					Swal.fire({
					
						icon: "success",
						title: "¡El empleado ha sido editado correctamente!",
						showConfirmButton: false,
						timer: 1500
					
					}).then(function(result){
					
							window.location = "empleados";
					
					});
					
					
					</script>';

					

				}


		}

	}

	/*=============================================
	ELIMINAR EMPLEADO
	=============================================*/
	static public function ctrEliminarEmpleado(){

		if(isset($_GET["idEmpleado"])){

			$datos = $_GET["idEmpleado"];

			$respuesta = ModeloEmpleados::mdlEliminarEmpleado($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡El empleado ha sido eliminado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "empleados";
				
				});
				
				
				</script>';

			}		
		}


	}

}





	