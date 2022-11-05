<?php

require_once "conexion.php";

class ModeloEmpleados{

	/*=============================================
	MOSTRAR EMPLEADOS
	=============================================*/

	static public function mdlMostrarEmpleados($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_empleados");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	REGISTRO DE EMPLEADO
	=============================================*/

	static public function mdlIngresarEmpleado($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_empleado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(2, $datos["apellido"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["idUsuario"], PDO::PARAM_INT);
		$stmt->bindParam(4, $datos["correo"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["idTipoDocumento"], PDO::PARAM_INT);
		$stmt->bindParam(6, $datos["numeroDocumento"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["direccion"], PDO::PARAM_STR);
		$stmt->bindParam(8, $datos["telefono"], PDO::PARAM_STR);
		$stmt->bindParam(9, $datos["fechaNacimiento"], PDO::PARAM_STR);
		$stmt->bindParam(10, $datos["cargo"], PDO::PARAM_STR);
		$stmt->bindParam(11, $datos["horarioTrabajo"], PDO::PARAM_STR);
		$stmt->bindParam(12, $datos["horasPorDia"], PDO::PARAM_STR);
		$stmt->bindParam(13, $datos["sueldoPorDia"], PDO::PARAM_STR);
		$stmt->bindParam(14, $datos["sueldoPorMes"], PDO::PARAM_STR);
		$stmt->bindParam(15, $datos["idTipoCosto"], PDO::PARAM_INT);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR EMPLEADO
	=============================================*/

	static public function mdlEditarEmpleado($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_empleado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
		$stmt->bindParam(1, $datos["idEmpleado"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["apellido"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["idUsuario"], PDO::PARAM_INT);
		$stmt->bindParam(5, $datos["correo"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["idTipoDocumento"], PDO::PARAM_INT);
		$stmt->bindParam(7, $datos["numeroDocumento"], PDO::PARAM_STR);
		$stmt->bindParam(8, $datos["direccion"], PDO::PARAM_STR);
		$stmt->bindParam(9, $datos["telefono"], PDO::PARAM_STR);
		$stmt->bindParam(10, $datos["fechaNacimiento"], PDO::PARAM_STR);
		$stmt->bindParam(11, $datos["cargo"], PDO::PARAM_STR);
		$stmt->bindParam(12, $datos["horarioTrabajo"], PDO::PARAM_STR);
		$stmt->bindParam(13, $datos["horasPorDia"], PDO::PARAM_STR);
		$stmt->bindParam(14, $datos["sueldoPorDia"], PDO::PARAM_STR);
		$stmt->bindParam(15, $datos["sueldoPorMes"], PDO::PARAM_STR);
		$stmt->bindParam(16, $datos["idTipoCosto"], PDO::PARAM_INT);
		

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	BORRAR EMPLEADO
	=============================================*/

	static public function mdlEliminarEmpleado($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_empleado(?)");

		$stmt -> bindParam(1, $datos, PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;


	}

}