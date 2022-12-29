<?php

require_once "conexion.php";

class ModeloRecetaManodeObra{


	/*=============================================
	MOSTRAR MANO DE OBRA DE LA RECETA
	=============================================*/

	static public function mdlMostrarRecetaManodeObra($item,$valor){
		
		if($item != "Receta"){ 

			$stmt = Conexion::conectar()->prepare("call mostrar_recetamanodeobra1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_recetamanodeobra2(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}


		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE MANO DE OBRA DE LA RECETA
	=============================================*/

	static public function mdlIngresarRecetaManodeObra($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_recetamanodeobra(?,?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idEmpleado"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["idMaquina"], PDO::PARAM_INT);
		$stmt->bindParam(4, $datos["nombreEmpleado"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["nombreMaquina"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["tiempoHoras"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["precioUnitario"], PDO::PARAM_STR);
		$stmt->bindParam(8, $datos["total"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	EDITAR RECETA MANO DE OBRA
	=============================================*/

	static public function mdlEditarRecetaManodeObra($datos){

		$stmt = Conexion::conectar()->prepare("call editar_recetamanodeobra(?,?,?)");

		$stmt->bindParam(1, $datos["idRecetaManodeObra"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["tiempoHoras"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["total"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	ELIMINAR RECETA MANO DE OBRA
	=============================================*/

	static public function mdlEliminarRecetaManodeObra($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_recetamanodeobra(?)");

		$stmt->bindParam(1, $datos["idRecetaManodeObra"], PDO::PARAM_INT);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}


	/*=============================================
	SUMAR EL TOTAL DE RECETA MANO DE OBRA
	=============================================*/

	static public function mdlSumaTotalRecetaManodeObra($valor){

		$stmt = Conexion::conectar()->prepare("call sumatotal_recetamanodeobra(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	
}