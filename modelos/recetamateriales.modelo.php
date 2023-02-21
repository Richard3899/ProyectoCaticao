<?php

require_once "conexion.php";

class ModeloRecetaMateriales{


	/*=============================================
	MOSTRAR MATERIALES DE LA RECETA
	=============================================*/

	static public function mdlMostrarRecetaMateriales($item,$valor){
		
		if($item != "Receta"){ 

			$stmt = Conexion::conectar()->prepare("call mostrar_recetamateriales1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_recetamateriales2(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
		
			return $stmt -> fetchAll();
		}


		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	MOSTRAR DETALLE MATERIALES
	=============================================*/

	static public function mdlMostrarDetalleMateriales($valor){

		if($valor != null){

			$stmt = Conexion::conectar()->prepare("call mostrar_detallemateriales1(?)");

			$stmt->bindParam(1, $valor, PDO::PARAM_INT);
	
			$stmt -> execute();
	
			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_detallemateriales2");
	
			$stmt -> execute();
	
			return $stmt -> fetchAll();

		}

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	REGISTRO DE MATERIALES DE LA RECETA
	=============================================*/

	static public function mdlIngresarRecetaMaterial($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_recetamaterial(?,?,?,?,?,?,?)");

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
	EDITAR RECETA MATERIAL
	=============================================*/

	static public function mdlEditarRecetaMaterial($datos){

		$stmt = Conexion::conectar()->prepare("call editar_recetamaterial(?,?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["idMaterialReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["codigoReceta"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["idMateria"], PDO::PARAM_INT);		
		$stmt->bindParam(5, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(6, $datos["cantidad"], PDO::PARAM_STR);
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
	ELIMINAR RECETA MATERIAL
	=============================================*/

	static public function mdlEliminarRecetaMaterial($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_recetamaterial(?,?,?,?)");

		$stmt->bindParam(1, $datos["idRecetaMaterial"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(3, $datos["codigoReceta"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["idMateria"], PDO::PARAM_INT);
		

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		#$stmt->close();
		$stmt = null;

	}


	/*=============================================
	SUMAR EL TOTAL DE RECETA MATERIALES
	=============================================*/

	static public function mdlSumaTotalRecetaMateriales($valor){

		$stmt = Conexion::conectar()->prepare("call sumatotal_recetamaterial(?)");

		$stmt->bindParam(1, $valor, PDO::PARAM_INT);

		$stmt -> execute();

		return $stmt -> fetch();

		#$stmt -> close();

		$stmt = null;

	}

	
}