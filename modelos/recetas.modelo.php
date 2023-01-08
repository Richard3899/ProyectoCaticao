<?php

require_once "conexion.php";

class ModeloRecetas{

	/*=============================================
	MOSTRAR RECETA
	=============================================*/

	static public function mdlMostrarRecetas($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("call mostrar_recetas");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}
		

		#$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	REGISTRO DE RECETA
	=============================================*/

	static public function mdlIngresarReceta($datos){

		$stmt = Conexion::conectar()->prepare("call insertar_receta(?,?,?,?,?,?,?,?,?,?,?,?,?)");

		$stmt->bindParam(1, $datos["codigo"], PDO::PARAM_STR);
		$stmt->bindParam(2, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["idProducto"], PDO::PARAM_INT);
		$stmt->bindParam(4, $datos["batch"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["idEstado"], PDO::PARAM_INT);
		$stmt->bindParam(6, $datos["fechaInicio"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["fechaFin"], PDO::PARAM_STR);
		$stmt->bindParam(8, $datos["codigoLote"], PDO::PARAM_STR);
		$stmt->bindParam(9, $datos["fechaVencimiento"], PDO::PARAM_STR);
		$stmt->bindParam(10, $datos["pesoPorTableta"], PDO::PARAM_STR);
		$stmt->bindParam(11, $datos["pesoEnTableta"], PDO::PARAM_STR);
		$stmt->bindParam(12, $datos["merma"], PDO::PARAM_STR);
		$stmt->bindParam(13, $datos["reproceso"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";	

		}else{

			return "error";
		
		}

		#$stmt->close();
		
		$stmt = null;

	}

	/*=============================================
	EDITAR RECETA
	=============================================*/

	static public function mdlEditarReceta($datos){
	
		$stmt = Conexion::conectar()->prepare("call editar_receta(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
		$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["idLote"], PDO::PARAM_INT);		
		$stmt->bindParam(3, $datos["codigo"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["nombre"], PDO::PARAM_STR);
		$stmt->bindParam(5, $datos["idProducto"], PDO::PARAM_INT);
		$stmt->bindParam(6, $datos["batch"], PDO::PARAM_STR);
		$stmt->bindParam(7, $datos["idEstado"], PDO::PARAM_INT);
		$stmt->bindParam(8, $datos["fechaInicio"], PDO::PARAM_STR);
		$stmt->bindParam(9, $datos["fechaFin"], PDO::PARAM_STR);
		$stmt->bindParam(10, $datos["codigoLote"], PDO::PARAM_STR);
		$stmt->bindParam(11, $datos["fechaVencimiento"], PDO::PARAM_STR);
		$stmt->bindParam(12, $datos["pesoPorTableta"], PDO::PARAM_STR);
		$stmt->bindParam(13, $datos["pesoEnTableta"], PDO::PARAM_STR);
		$stmt->bindParam(14, $datos["merma"], PDO::PARAM_STR);
		$stmt->bindParam(15, $datos["reproceso"], PDO::PARAM_STR);
		

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	BORRAR RECETA
	=============================================*/

	static public function mdlEliminarReceta($datos){

		$stmt = Conexion::conectar()->prepare("call eliminar_receta(?,?,?)");

		$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["codigoReceta"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["codigoLote"], PDO::PARAM_STR);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;


	}

	/*=============================================
	DUPLICAR RECETA
	=============================================*/

	static public function mdlDuplicarReceta($datos){

		$stmt = Conexion::conectar()->prepare("call duplicar_receta(?,?,?,?)");

		$stmt->bindParam(1, $datos["idReceta"], PDO::PARAM_INT);
		$stmt->bindParam(2, $datos["codigoReceta"], PDO::PARAM_STR);
		$stmt->bindParam(3, $datos["codigoLote"], PDO::PARAM_STR);
		$stmt->bindParam(4, $datos["nuevoIdReceta"], PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		#$stmt -> close();

		$stmt = null;


	}

}