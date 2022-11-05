<?php

require_once "../controladores/empleados.controlador.php";
require_once "../modelos/empleados.modelo.php";

class AjaxEmpleados{

	/*=============================================
	EDITAR EMPLEADO
	=============================================*/	

	public $idEmpleado;

	public function ajaxEditarEmpleado(){

		$item = "idEmpleado";
		$valor = $this->idEmpleado;

		$respuesta = ControladorEmpleados::ctrMostrarEmpleados($item, $valor);

		echo json_encode($respuesta);

	}

	
	/*=============================================
	VALIDAR NO REPETIR NUMERO DE DOCUMENTO DE EMPLEADO
	=============================================*/	

	public $validarNumeroDocumento;

	public function ajaxValidarNumeroDocumento(){

		$item = "numeroDocumento";
		$valor = $this->validarNumeroDocumento;

		$respuesta = ControladorEmpleados::ctrMostrarEmpleados($item, $valor);

		echo json_encode($respuesta);

	}


	
}

/*=============================================
EDITAR EMPLEADOS
=============================================*/
if(isset($_POST["idEmpleado"])){

	$editar = new AjaxEmpleados();
	$editar -> idEmpleado = $_POST["idEmpleado"];
	$editar -> ajaxEditarEmpleado();

}

/*=============================================
VALIDAR NO REPETIR NUMERO DE DOCUMENTO EMPLEADO
=============================================*/

if(isset( $_POST["validarNumeroDocumento"])){

	$valNumeroDocumento = new AjaxEmpleados();
	$valNumeroDocumento -> validarNumeroDocumento = $_POST["validarNumeroDocumento"];
	$valNumeroDocumento -> ajaxValidarNumeroDocumento();

}
