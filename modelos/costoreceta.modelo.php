<?php

require_once "conexion.php";

class ModeloRecetaGastoAdminPorMes{

	/*=============================================
	MOSTRAR RECETAS Y GASTO POR MES
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
	REGISTRO DE RECETAS Y GASTO POR MES
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
	ACTUALIZAR COSTO TOTAL DE LA RECETA
	=============================================*/

	static public function mdlActualizarCostoTotalReceta($valor){

		$stmt = Conexion::conectar()->prepare("call sumatotal_costoporreceta(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);
		
		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	ELIMINAR RECETAS Y GASTO POR MES
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
	OCULTAR ADICIONALES
	=============================================*/

	// static public function mdlOcultarAdicional($datos){

	// 	$stmt = Conexion::conectar()->prepare("call ocultar_adicional(?)");

	// 	$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);

	// 	if($stmt -> execute()){

	// 		return "ok";
		
	// 	}else{

	// 		return "error";	

	// 	}

	// 	#$stmt -> close();

	// 	$stmt = null;


	// }

	// static public function mdlValidarMesOculto($valor){

	// 	$stmt = Conexion::conectar()->prepare("call validar_MesOculto(?)");

	// 	$stmt->bindParam(1, $valor, PDO::PARAM_INT);

	// 	$stmt -> execute();

	// 	return $stmt -> fetch();
		
	// 	#$stmt -> close();

	// 	$stmt = null;

	// }

	static public function mdlValidarGastoNoAgregado($valor){

		$stmt = Conexion::conectar()->prepare("call validar_gastonoagregado(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();
		
		#$stmt -> close();

		$stmt = null;

	}

	static public function mdlMostrarRecetasDelMes($valor){

		$stmt = Conexion::conectar()->prepare("call mostrar_recetasdelmes(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();
		
		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	MOSTRAR RECETAS Y GASTOS POR MES
	=============================================*/

	static public function mdlMostrarRecetaGastoAdmin($valor1,$valor2){

		$stmt = Conexion::conectar()->prepare("call mostrar_recetagastoadmin(?,?)");

		$stmt->bindParam(1, $valor1, PDO::PARAM_INT);
		$stmt->bindParam(2, $valor2, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetchAll();
		
		#$stmt -> close();

		$stmt = null;

	}

	static public function mdlSumaTotalRecetaGastoAdmin($valor1,$valor2){

		$stmt = Conexion::conectar()->prepare("call sumatotal_recetagastoadmin(?,?,@variable)");

		$stmt->bindParam(1, $valor1, PDO::PARAM_INT);
		$stmt->bindParam(2, $valor2, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();
		
		#$stmt -> close();

		$stmt = null;

	}

}