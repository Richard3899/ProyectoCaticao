<?php

require_once "conexion.php";

class ModeloRecetaGastoAdminPorMes{


	/*=============================================
	MOSTRAR RECETAS Y GASTO ADMIN POR MES
	=============================================*/

	static public function mdlMostrarRecetaGastoAdminPorMes($valor1,$valor2){

		$stmt = Conexion::conectar()->prepare("call mostrar_recetagastoadminpormes(?,?)");

		$stmt->bindParam(1, $valor1, PDO::PARAM_INT);
		$stmt->bindParam(2, $valor2, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();
		
		#$stmt -> close();

		$stmt = null;

	}

	static public function mdlMostrarTipoGastoPorMes($valor){

		$stmt = Conexion::conectar()->prepare("call mostrar_tipogastopormes(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();
		
		#$stmt -> close();

		$stmt = null;

	}
	/*=============================================
	REGISTRO DE RECETAS Y GASTO ADMIN POR MES
	=============================================*/

	static public function mdlIngresarRecetaGastoAdminPorMes($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_recetagastoadminpormes(?,?,?)");

		$stmt->bindParam(1, $datos["indice"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["idGastoAdminPorMes"], PDO::PARAM_INT);
		
		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	ELIMINAR RECETAS Y GASTO ADMIN POR MES
	=============================================*/

	static public function mdlEliminarRecetaGastoAdminPorMes($valor1,$valor2){
	
		$stmt = Conexion::conectar()->prepare("call eliminar_recetagastoadminpormes(?,?)");
		
		$stmt->bindParam(1, $valor1, PDO::PARAM_INT);
		$stmt->bindParam(2, $valor2, PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	CERRAR ADICIONALES
	=============================================*/

	static public function mdlCerrarAdicional($datos){

		$stmt = Conexion::conectar()->prepare("call cerrar_adicional(?)");

		$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;


	}


}