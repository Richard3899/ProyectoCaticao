<?php

require_once "conexion.php";

class ModeloGastoAdminPorMes{


	/*=============================================
	MOSTRAR GASTO ADMIN POR MES
	=============================================*/

	static public function mdlMostrarGastoAdminPorMes($item,$valor){
		
		if($item != "MesGasto"){ 

			$stmt = Conexion::conectar()->prepare("call mostrar_gastoadminpormes1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_gastoadminpormes2(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}


		#$stmt -> close();

		$stmt = null;

	}

	static public function mdlMostrarGastoAdminPorMes3($valor1,$valor2,$valor3,$valor4,$valor5){

		$stmt = Conexion::conectar()->prepare("call mostrar_gastoadminpormes3(?,?,?,?,?)");

		$stmt->bindParam(1, $valor1, PDO::PARAM_INT);
		$stmt->bindParam(2, $valor2, PDO::PARAM_INT);
		$stmt->bindParam(3, $valor3, PDO::PARAM_INT);
		$stmt->bindParam(4, $valor4, PDO::PARAM_INT);
		$stmt->bindParam(5, $valor5, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();
		
		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE GASTO ADMIN POR MES
	=============================================*/

	static public function mdlIngresarGastoAdminPorMes($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_gastoadminpormes(?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idMesGasto"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idGastoAdmin"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["nombreGastoAdmin"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["total"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	EDITAR GASTO ADMIN POR MES
	=============================================*/

	static public function mdlEditarGastoAdminPorMes($datos){

		$stmt = Conexion::conectar()->prepare("call editar_gastoadminpormes(?,?,?,?)");

		$stmt->bindParam(1, $datos["idGastoAdminPorMes"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["precio"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["total"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	ELIMINAR GASTO ADMIN POR MES
	=============================================*/

	static public function mdlEliminarGastoAdminPorMes($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_gastoadminpormes(?)");

		$stmt->bindParam(1, $datos["idGastoAdminPorMes"], PDO::PARAM_INT);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}


	/*=============================================
	SUMAR EL TOTAL DE GASTO ADMIN POR MES
	=============================================*/

	static public function mdlSumaTotalGastoAdminPorMes($valor1,$valor2){

		$stmt = Conexion::conectar()->prepare("call sumatotal_gastoadminpormes(?,?)");

		$stmt->bindParam(1, $valor1, PDO::PARAM_INT);
		$stmt->bindParam(2, $valor2, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	MOSTRAR GASTO POR ID TIPO GASTO
	=============================================*/

	static public function mdlMostrarGastoAdminPorMesTG($valor1,$valor2){

		$stmt = Conexion::conectar()->prepare("call mostrar_gastoadminpormestg(?,?)");

		$stmt->bindParam(1, $valor1, PDO::PARAM_INT);
		$stmt->bindParam(2, $valor2, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();

		#$stmt -> close();

		$stmt = null;

	}

	
}