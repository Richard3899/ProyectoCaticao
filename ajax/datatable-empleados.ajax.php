<?php

require_once "../controladores/empleados.controlador.php";
require_once "../controladores/tipocosto.controlador.php";
require_once "../controladores/tipodocumento.controlador.php";
require_once "../controladores/usuarios.controlador.php";

require_once "../modelos/empleados.modelo.php";
require_once "../modelos/tipocosto.modelo.php";
require_once "../modelos/tipodocumento.modelo.php";
require_once "../modelos/usuarios.modelo.php";

class TablaEmpleados{

 	/*=============================================
 	 MOSTRAR LA TABLA DE EMPLEADOS
  	=============================================*/ 

	public function mostrarTablaEmpleados(){

		$item = null;
    	$valor = null;

  		$empleados = ControladorEmpleados::ctrMostrarEmpleados($item, $valor);	
		
		if(count($empleados) == 0){

			echo '{"data": []}';

			return;
		}

  		$datosJson = '{
		  "data": [';

		  for($i = 0; $i < count($empleados); $i++){

			/*=============================================
 	 		TRAEMOS EL USUARIO
  			=============================================*/ 

		  	$item1 = "idUsuario";
		  	$valor1 = $empleados[$i]["idUsuario"];

		  	$usuario = ControladorUsuarios::ctrMostrarUsuarios($item1, $valor1);

            $user=$usuario['usuario'] ?? 'No tiene usuario';


			/*=============================================
 	 		TRAEMOS LA TIPO DE DOCUMENTO
  			=============================================*/ 

		  	$item2 = "idTipoDocumento";
		  	$valor2 = $empleados[$i]["idTipoDocumento"];

		  	$tipodocumento = ControladorTipoDocumento::ctrMostrarTipoDocumento($item2, $valor2);
			
			/*=============================================
 	 		TRAEMOS LA TIPO DE COSTO
  			=============================================*/ 

		  	$item3 = "idTipoCosto";
		  	$valor3 = $empleados[$i]["idTipoCosto"];

		  	$tipocosto = ControladorTipoCosto::ctrMostrarTipoCosto($item3, $valor3);

			/*==Botón Editar y Eliminar=*/

            if($_GET["permisoEditar"]==1 && $_GET["permisoEliminar"]==0){
				
			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarEmpleado' idEmpleado='".$empleados[$i]["idEmpleado"]."' data-toggle='modal' data-target='#modalEditarEmpleado'><i class='fa fa-pen'></i></button></div>"; 

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==1){

			$botones =  "<div class='btn-group'><button class='btn btn-danger btnEliminarEmpleado' idEmpleado='".$empleados[$i]["idEmpleado"]."'><i class='fa fa-times'></i></button></div>"; 

			}else if($_GET["permisoEditar"]==0 && $_GET["permisoEliminar"]==0){

			$botones = "<button class='btn btn-danger'><i class='fa fa-lock'></i></button>";
				
		    }else{

			$botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarEmpleado' idEmpleado='".$empleados[$i]["idEmpleado"]."' data-toggle='modal' data-target='#modalEditarEmpleado'><i class='fa fa-pen'></i></button><button class='btn btn-danger btnEliminarEmpleado' idEmpleado='".$empleados[$i]["idEmpleado"]."'><i class='fa fa-times'></i></button></div>"; 

			}

		  	$datosJson .='[
			      "'.($i+1).'",
			      "'.$empleados[$i]["nombre"].'",
			      "'.$empleados[$i]["apellido"].'",
			      "'.$user.'",
				  "'.$empleados[$i]["correo"].'",
				  "'.$tipodocumento["descripcion"].'",
				  "'.$empleados[$i]["numeroDocumento"].'",
				  "'.$empleados[$i]["direccion"].'",
				  "'.$empleados[$i]["telefono"].'",
				  "'.$empleados[$i]["fechaNacimiento"].'",
				  "'.$empleados[$i]["cargo"].'",
				  "'.$empleados[$i]["horarioTrabajo"].'",
				  "'.$empleados[$i]["horasPorDia"].'",
				  "'.$empleados[$i]["sueldoPorDia"].'",
				  "'.$empleados[$i]["sueldoPorMes"].'",
				  "'.$tipocosto["descripcion"].'",
			      "'.$botones.'"
			    ],';

		  }

		  $datosJson = substr($datosJson, 0, -1);

		 $datosJson .=   '] 

		 }';
		
		echo $datosJson;


	}


}

/*=============================================
ACTIVAR TABLA DE EMPLEADOS
=============================================*/ 
$activarEmpleados = new TablaEmpleados();
$activarEmpleados -> mostrarTablaEmpleados();

