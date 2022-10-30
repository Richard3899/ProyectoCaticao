<?php

require_once "conexion.php";

class ModeloMarcas{

	/*=============================================
<<<<<<< HEAD
=======
	CREAR Marcas
	=============================================*/

	static public function mdlIngresarMarca($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(marca) VALUES (:marca)");

		$stmt->bindParam(":marca", $datos, PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		$stmt->close();
		$stmt = null;

	}

	/*=============================================
>>>>>>> 18b23c17cd0c887f55db151efbfc4a769dd66667
	MOSTRAR MARCAS
	=============================================*/

	static public function mdlMostrarMarcas($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

<<<<<<< HEAD
		#$stmt -> close();
=======
		$stmt -> close();
>>>>>>> 18b23c17cd0c887f55db151efbfc4a769dd66667

		$stmt = null;

	}

<<<<<<< HEAD
}



=======
	/*=============================================
	EDITAR MARCAS
	=============================================*/

	static public function mdlEditarMarca($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("UPDATE $tabla SET marca = :marca WHERE idmarca = :idmarca");

		$stmt -> bindParam(":marca", $datos["marca"], PDO::PARAM_STR);
		$stmt -> bindParam(":idmarca", $datos["idmarca"], PDO::PARAM_INT);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		$stmt->close();
		$stmt = null;

	}

	/*=============================================
	BORRAR MARCA
	=============================================*/

	static public function mdlBorrarMarca($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE idmarca = :idmarca");

		$stmt -> bindParam(":idmarca", $datos, PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		$stmt -> close();

		$stmt = null;

	}

}
>>>>>>> 18b23c17cd0c887f55db151efbfc4a769dd66667

