<?php

require_once "conexion.php";

class ModeloRecetaConsumoEnergia{

	/*=============================================
	MOSTRAR TARIFA KWH
	=============================================*/

	static public function mdlMostrarTarifaKwh(){
		
		$stmt = Conexion::conectar()->prepare("call mostrar_tarifaKwh");

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	EDITAR TARIFA KWH
	=============================================*/

	static public function mdlEditarTarifaKwh($datos){

		$stmt = Conexion::conectar()->prepare("call editar_tarifaKwh(?)");

		$stmt->bindParam(1, $datos["tarifaKwh"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}


	/*=============================================
	MOSTRAR CONSUMO DE ENERGÍA DE LA RECETA
	=============================================*/

	static public function mdlMostrarRecetaConsumoEnergia($item,$valor){
		
		if($item != "Receta"){ 

			$stmt = Conexion::conectar()->prepare("call mostrar_recetaconsumoenergia1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_recetaconsumoenergia2(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE CONSUMO DE ENERGÍA DE LA RECETA
	=============================================*/

	static public function mdlIngresarRecetaConsumoEnergia($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_recetaconsumoenergia(?,?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idMaquina"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["nombreMaquina"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["potenciaKw"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["horasTrabajoBatch"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["consumoKwh"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["tarifaKwh"], PDO::PARAM_STR);
		$stmt->bindParam(8, $datos["pagoPorBatch"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	EDITAR RECETA CONSUMO DE ENERGÍA
	=============================================*/

	static public function mdlEditarRecetaConsumoEnergia($datos){

		$stmt = Conexion::conectar()->prepare("call editar_recetaconsumoenergia(?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idRecetaConsumoEnergia"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["horasTrabajoBatch"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["consumoKwh"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["pagoPorBatch"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	ELIMINAR RECETA CONSUMO DE ENERGÍA
	=============================================*/

	static public function mdlEliminarRecetaConsumoEnergia($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_recetaconsumoenergia(?,?)");

		$stmt->bindParam(1, $datos["idRecetaConsumoEnergia"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idReceta"], PDO::PARAM_INT);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}


	/*=============================================
	SUMAR EL TOTAL DE RECETA CONSUMO DE ENERGÍA
	=============================================*/

	static public function mdlSumaTotalRecetaConsumoEnergia($valor){

		$stmt = Conexion::conectar()->prepare("call sumatotal_recetaconsumoenergia(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	
}