<?php

require_once "conexion.php";

class ModeloRecetaDepreciacion{


	/*=============================================
	MOSTRAR DEPRECIACION DE LA RECETA
	=============================================*/

	static public function mdlMostrarRecetaDepreciacion($item,$valor){
		
		if($item != "Receta"){ 

			$stmt = Conexion::conectar()->prepare("call mostrar_recetadepreciacion1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_recetadepreciacion2(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}


		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	REGISTRO DE DEPRECIACION DE LA RECETA
	=============================================*/

	static public function mdlIngresarRecetaDepreciacion($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_recetadepreciacion(?,?,?,?,?,?,?)");

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
	EDITAR RECETA DEPRECIACION
	=============================================*/

	static public function mdlEditarRecetaDepreciacion($datos){

		$stmt = Conexion::conectar()->prepare("call editar_recetadepreciacion(?,?,?,?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idDepreciacionReceta"], PDO::PARAM_INT);
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
	ELIMINAR RECETA DEPRECIACION
	=============================================*/

	static public function mdlEliminarRecetaDepreciacion($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_recetadepreciacion(?,?,?,?)");

		$stmt->bindParam(1, $datos["idRecetaDepreciacion"], PDO::PARAM_INT);
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
	SUMAR EL TOTAL DE RECETA DEPRECIACION
	=============================================*/

	static public function mdlSumaTotalRecetaDepreciacion($valor){

		$stmt = Conexion::conectar()->prepare("call sumatotal_recetadepreciacion(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	
}