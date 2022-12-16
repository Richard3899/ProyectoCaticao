<?php

require_once "conexion.php";

class ModeloRecetaInsumos{


	/*=============================================
	MOSTRAR DETALLE INSUMOS
	=============================================*/

	static public function mdlMostrarRecetaInsumos($item,$valor){
		
		if($item != "Receta"){ 

			$stmt = Conexion::conectar()->prepare("call mostrar_recetainsumos1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_recetainsumos2(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}


		#$stmt -> close();

		$stmt = null;

	}

	static public function mdlMostrarDetalleInsumos($valor){

		if($valor != null){

			$stmt = Conexion::conectar()->prepare("call mostrar_detalleinsumos1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
	
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_detalleinsumos2");
	
			$stmt -> execute();
	
			return $stmt -> fetchAll();

		}

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	REGISTRO DE INSUMOS
	=============================================*/

	static public function mdlIngresarRecetaInsumo($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_recetainsumo(?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["codigoReceta"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["idMateria"], PDO::PARAM_INT);
		$stmt->bindParam(4, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["precioUnitario"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["total"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	EDITAR AGREGAR INSUMO
	=============================================*/

	static public function mdlEditarRecetaInsumo($datos){

		$stmt = Conexion::conectar()->prepare("call editar_recetainsumo(?,?,?,?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idInsumoReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["codigoReceta"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["idMateria"], PDO::PARAM_INT);		
		$stmt->bindParam(5, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["cantidadAnterior"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["diferenciaCantidad"], PDO::PARAM_STR);
		$stmt->bindParam(8, $datos["cantidad"], PDO::PARAM_STR);
		$stmt->bindParam(9, $datos["precioUnitario"], PDO::PARAM_STR);
		$stmt->bindParam(10, $datos["total"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}

	/*=============================================
	ELIMINAR AGREGAR INSUMO
	=============================================*/

	static public function mdlEliminarRecetaInsumo($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_recetainsumo(?,?,?,?)");

		$stmt->bindParam(1, $datos["idRecetaInsumo"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["codigoReceta"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["idMateria"], PDO::PARAM_INT);
		$stmt->bindParam(4, $datos["cantidad"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}


	/*=============================================
	SUMAR EL TOTAL DE AGREGAR INSUMOS
	=============================================*/

	static public function mdlSumaTotalRecetaInsumos($valor){	

		$stmt = Conexion::conectar()->prepare("call sumatotal_recetainsumo(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	
}