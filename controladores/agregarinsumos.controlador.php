<?php

class ControladorAgregarInsumos{

	/*=============================================
	MOSTRAR AGREGAR INSUMOS
	=============================================*/

	// static public function ctrMostrarAgregarInsumos($item, $valor){

	// 	$tabla = "ventas";

	// 	$respuesta = ModeloAgregarInsumos::mdlMostrarAgregarInsumos($tabla, $item, $valor);

	// 	return $respuesta;

	// }

	/*=============================================
	CREAR AGREGAR INSUMO
	=============================================*/

	static public function ctrCrearAgregarInsumo(){

		if(isset($_POST["nuevoCodigo"])){

			/*=============================================
			ACTUALIZAR LAS COMPRAS DEL CLIENTE Y REDUCIR EL STOCK Y AUMENTAR LAS AGREGAR INSUMOS DE LOS PRODUCTOS
			=============================================*/

			if($_POST["listaInsumos"] == ""){

				echo'<script>

				Swal.fire({
					  icon: "error",
					  title: "No se guardará la lista si no hay insumos",
					  showConfirmButton: true,
					  confirmButtonText: "Cerrar"
					  }).then(function(result){
								if (result.value) {

								window.location = "agregarinsumos";

								}
							})

				</script>';

				return;
			}

			// $listaInsumos = json_decode($_POST["listaInsumos"], true);

			// $totalInsumosComprados = array();

			// foreach ($listaInsumos as $key => $value) {

			//    array_push($totalInsumosComprados, $value["cantidad"]);
				
			//    $tablaInsumos = "productos";

			//     $item = "id";
			//     $valor = $value["id"];
			//     $orden = "id";

			//     $traerInsumo = ModeloInsumos::mdlMostrarInsumos($tablaInsumos, $item, $valor, $orden);

			// 	$item1a = "ventas";
			// 	$valor1a = $value["cantidad"] + $traerInsumo["ventas"];

			//     $nuevasAgregarInsumos = ModeloInsumos::mdlActualizarInsumo($tablaInsumos, $item1a, $valor1a, $valor);

			// 	$item1b = "stock";
			// 	$valor1b = $value["stock"];

			// 	$nuevoStock = ModeloInsumos::mdlActualizarInsumo($tablaInsumos, $item1b, $valor1b, $valor);

			// }

			// $tablaClientes = "clientes";

			// $item = "id";
			// $valor = $_POST["seleccionarCliente"];

			// $traerCliente = ModeloClientes::mdlMostrarClientes($tablaClientes, $item, $valor);

			// $item1a = "compras";
				
			// $valor1a = array_sum($totalInsumosComprados) + $traerCliente["compras"];

			// $comprasCliente = ModeloClientes::mdlActualizarCliente($tablaClientes, $item1a, $valor1a, $valor);

			// $item1b = "ultima_compra";

			// date_default_timezone_set('America/Bogota');

			// $fecha = date('Y-m-d');
			// $hora = date('H:i:s');
			// $valor1b = $fecha.' '.$hora;

			// $fechaCliente = ModeloClientes::mdlActualizarCliente($tablaClientes, $item1b, $valor1b, $valor);

			/*=============================================
			GUARDAR LOS INSUMOS
			=============================================*/	


			$datos = array("insumos"=>$_POST["listaInsumos"],
						   "pesoneto"=>$_POST["nuevoPrecioUnitarioInsumo"],
						   "costo"=>$_POST["totalInsumos"],
						   "total"=>$_POST["totalInsumos"],
						   "idMateria"=>1,
						   "idReceta"=>$_POST["idReceta"]);

			$respuesta = ModeloAgregarInsumos::mdlIngresarAgregarInsumo($datos);

			if($respuesta == "ok"){

				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡Los insumos han sido guardado correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "recetas";
				
				});
				
				
				</script>';

			}

		}

	}

	/*=============================================
	EDITAR AGREGAR INSUMO
	=============================================*/

	static public function ctrEditarAgregarInsumo(){

		if(isset($_POST["editarAgregarInsumo"])){

			/*=============================================
			FORMATEAR TABLA DE PRODUCTOS Y LA DE CLIENTES
			=============================================*/
			$tabla = "ventas";

			$item = "codigo";
			$valor = $_POST["editarAgregarInsumo"];

			$traerAgregarInsumo = ModeloAgregarInsumos::mdlMostrarAgregarInsumos($tabla, $item, $valor);

			/*=============================================
			REVISAR SI VIENE PRODUCTOS EDITADOS
			=============================================*/

			if($_POST["listaInsumos"] == ""){

				$listaInsumos = $traerAgregarInsumo["productos"];
				$cambioInsumo = false;


			}else{

				$listaInsumos = $_POST["listaInsumos"];
				$cambioInsumo = true;
			}

			if($cambioInsumo){

				$productos =  json_decode($traerAgregarInsumo["productos"], true);

				$totalInsumosComprados = array();

				foreach ($productos as $key => $value) {

					array_push($totalInsumosComprados, $value["cantidad"]);
					
					$tablaInsumos = "productos";

					$item = "id";
					$valor = $value["id"];
					$orden = "id";

					$traerInsumo = ModeloInsumos::mdlMostrarInsumos($tablaInsumos, $item, $valor, $orden);

					$item1a = "ventas";
					$valor1a = $traerInsumo["ventas"] - $value["cantidad"];

					$nuevasAgregarInsumos = ModeloInsumos::mdlActualizarInsumo($tablaInsumos, $item1a, $valor1a, $valor);

					$item1b = "stock";
					$valor1b = $value["cantidad"] + $traerInsumo["stock"];

					$nuevoStock = ModeloInsumos::mdlActualizarInsumo($tablaInsumos, $item1b, $valor1b, $valor);

				}

				$tablaClientes = "clientes";

				$itemCliente = "id";
				$valorCliente = $_POST["seleccionarCliente"];

				$traerCliente = ModeloClientes::mdlMostrarClientes($tablaClientes, $itemCliente, $valorCliente);

				$item1a = "compras";
				$valor1a = $traerCliente["compras"] - array_sum($totalInsumosComprados);		

				$comprasCliente = ModeloClientes::mdlActualizarCliente($tablaClientes, $item1a, $valor1a, $valorCliente);

				/*=============================================
				ACTUALIZAR LAS COMPRAS DEL CLIENTE Y REDUCIR EL STOCK Y AUMENTAR LAS AGREGAR INSUMOS DE LOS PRODUCTOS
				=============================================*/

				$listaInsumos_2 = json_decode($listaInsumos, true);

				$totalInsumosComprados_2 = array();

				foreach ($listaInsumos_2 as $key => $value) {

					array_push($totalInsumosComprados_2, $value["cantidad"]);
					
					$tablaInsumos_2 = "productos";

					$item_2 = "id";
					$valor_2 = $value["id"];
					$orden = "id";

					$traerInsumo_2 = ModeloInsumos::mdlMostrarInsumos($tablaInsumos_2, $item_2, $valor_2, $orden);

					$item1a_2 = "ventas";
					$valor1a_2 = $value["cantidad"] + $traerInsumo_2["ventas"];

					$nuevasAgregarInsumos_2 = ModeloInsumos::mdlActualizarInsumo($tablaInsumos_2, $item1a_2, $valor1a_2, $valor_2);

					$item1b_2 = "stock";
					$valor1b_2 = $traerInsumo_2["stock"] - $value["cantidad"];

					$nuevoStock_2 = ModeloInsumos::mdlActualizarInsumo($tablaInsumos_2, $item1b_2, $valor1b_2, $valor_2);

				}

				$tablaClientes_2 = "clientes";

				$item_2 = "id";
				$valor_2 = $_POST["seleccionarCliente"];

				$traerCliente_2 = ModeloClientes::mdlMostrarClientes($tablaClientes_2, $item_2, $valor_2);

				$item1a_2 = "compras";

				$valor1a_2 = array_sum($totalInsumosComprados_2) + $traerCliente_2["compras"];

				$comprasCliente_2 = ModeloClientes::mdlActualizarCliente($tablaClientes_2, $item1a_2, $valor1a_2, $valor_2);

				$item1b_2 = "ultima_compra";

				date_default_timezone_set('America/Bogota');

				$fecha = date('Y-m-d');
				$hora = date('H:i:s');
				$valor1b_2 = $fecha.' '.$hora;

				$fechaCliente_2 = ModeloClientes::mdlActualizarCliente($tablaClientes_2, $item1b_2, $valor1b_2, $valor_2);

			}

			/*=============================================
			GUARDAR CAMBIOS DE LA COMPRA
			=============================================*/	

			$datos = array("id_vendedor"=>$_POST["idVendedor"],
						   "id_cliente"=>$_POST["seleccionarCliente"],
						   "codigo"=>$_POST["editarAgregarInsumo"],
						   "productos"=>$listaInsumos,
						   "impuesto"=>$_POST["nuevoPrecioImpuesto"],
						   "neto"=>$_POST["nuevoPrecioNeto"],
						   "total"=>$_POST["totalAgregarInsumo"],
						   "metodo_pago"=>$_POST["listaMetodoPago"]);


			$respuesta = ModeloAgregarInsumos::mdlEditarAgregarInsumo($tabla, $datos);

			if($respuesta == "ok"){

				echo'<script>

				localStorage.removeItem("rango");

				swal({
					  type: "success",
					  title: "La venta ha sido editada correctamente",
					  showConfirmButton: true,
					  confirmButtonText: "Cerrar"
					  }).then((result) => {
								if (result.value) {

								window.location = "ventas";

								}
							})

				</script>';

			}

		}

	}


	/*=============================================
	ELIMINAR AGREGAR INSUMO
	=============================================*/

	static public function ctrEliminarAgregarInsumo(){

		if(isset($_GET["idAgregarInsumo"])){

			$tabla = "ventas";

			$item = "id";
			$valor = $_GET["idAgregarInsumo"];

			$traerAgregarInsumo = ModeloAgregarInsumos::mdlMostrarAgregarInsumos($tabla, $item, $valor);

			/*=============================================
			ACTUALIZAR FECHA ÚLTIMA COMPRA
			=============================================*/

			$tablaClientes = "clientes";

			$itemAgregarInsumos = null;
			$valorAgregarInsumos = null;

			$traerAgregarInsumos = ModeloAgregarInsumos::mdlMostrarAgregarInsumos($tabla, $itemAgregarInsumos, $valorAgregarInsumos);

			$guardarFechas = array();

			foreach ($traerAgregarInsumos as $key => $value) {
				
				if($value["id_cliente"] == $traerAgregarInsumo["id_cliente"]){

					array_push($guardarFechas, $value["fecha"]);

				}

			}

			if(count($guardarFechas) > 1){

				if($traerAgregarInsumo["fecha"] > $guardarFechas[count($guardarFechas)-2]){

					$item = "ultima_compra";
					$valor = $guardarFechas[count($guardarFechas)-2];
					$valorIdCliente = $traerAgregarInsumo["id_cliente"];

					$comprasCliente = ModeloClientes::mdlActualizarCliente($tablaClientes, $item, $valor, $valorIdCliente);

				}else{

					$item = "ultima_compra";
					$valor = $guardarFechas[count($guardarFechas)-1];
					$valorIdCliente = $traerAgregarInsumo["id_cliente"];

					$comprasCliente = ModeloClientes::mdlActualizarCliente($tablaClientes, $item, $valor, $valorIdCliente);

				}


			}else{

				$item = "ultima_compra";
				$valor = "0000-00-00 00:00:00";
				$valorIdCliente = $traerAgregarInsumo["id_cliente"];

				$comprasCliente = ModeloClientes::mdlActualizarCliente($tablaClientes, $item, $valor, $valorIdCliente);

			}

			/*=============================================
			FORMATEAR TABLA DE PRODUCTOS Y LA DE CLIENTES
			=============================================*/

			$productos =  json_decode($traerAgregarInsumo["productos"], true);

			$totalInsumosComprados = array();

			foreach ($productos as $key => $value) {

				array_push($totalInsumosComprados, $value["cantidad"]);
				
				$tablaInsumos = "productos";

				$item = "id";
				$valor = $value["id"];
				$orden = "id";

				$traerInsumo = ModeloInsumos::mdlMostrarInsumos($tablaInsumos, $item, $valor, $orden);

				$item1a = "ventas";
				$valor1a = $traerInsumo["ventas"] - $value["cantidad"];

				$nuevasAgregarInsumos = ModeloInsumos::mdlActualizarInsumo($tablaInsumos, $item1a, $valor1a, $valor);

				$item1b = "stock";
				$valor1b = $value["cantidad"] + $traerInsumo["stock"];

				$nuevoStock = ModeloInsumos::mdlActualizarInsumo($tablaInsumos, $item1b, $valor1b, $valor);

			}

			$tablaClientes = "clientes";

			$itemCliente = "id";
			$valorCliente = $traerAgregarInsumo["id_cliente"];

			$traerCliente = ModeloClientes::mdlMostrarClientes($tablaClientes, $itemCliente, $valorCliente);

			$item1a = "compras";
			$valor1a = $traerCliente["compras"] - array_sum($totalInsumosComprados);

			$comprasCliente = ModeloClientes::mdlActualizarCliente($tablaClientes, $item1a, $valor1a, $valorCliente);

			/*=============================================
			ELIMINAR AGREGAR INSUMO
			=============================================*/

			$respuesta = ModeloAgregarInsumos::mdlEliminarAgregarInsumo($tabla, $_GET["idAgregarInsumo"]);

			if($respuesta == "ok"){

				echo'<script>

				swal({
					  type: "success",
					  title: "La venta ha sido borrada correctamente",
					  showConfirmButton: true,
					  confirmButtonText: "Cerrar"
					  }).then(function(result){
								if (result.value) {

								window.location = "ventas";

								}
							})

				</script>';

			}		
		}

	}

	/*=============================================
	RANGO FECHAS
	=============================================*/	

	static public function ctrRangoFechasAgregarInsumos($fechaInicial, $fechaFinal){

		$tabla = "ventas";

		$respuesta = ModeloAgregarInsumos::mdlRangoFechasAgregarInsumos($tabla, $fechaInicial, $fechaFinal);

		return $respuesta;
		
	}

	/*=============================================
	DESCARGAR EXCEL
	=============================================*/

	public function ctrDescargarReporte(){

		if(isset($_GET["reporte"])){

			$tabla = "ventas";

			if(isset($_GET["fechaInicial"]) && isset($_GET["fechaFinal"])){

				$ventas = ModeloAgregarInsumos::mdlRangoFechasAgregarInsumos($tabla, $_GET["fechaInicial"], $_GET["fechaFinal"]);

			}else{

				$item = null;
				$valor = null;

				$ventas = ModeloAgregarInsumos::mdlMostrarAgregarInsumos($tabla, $item, $valor);

			}


			/*=============================================
			CREAMOS EL ARCHIVO DE EXCEL
			=============================================*/

			$Name = $_GET["reporte"].'.xls';

			header('Expires: 0');
			header('Cache-control: private');
			header("Content-type: application/vnd.ms-excel"); // Archivo de Excel
			header("Cache-Control: cache, must-revalidate"); 
			header('Content-Description: File Transfer');
			header('Last-Modified: '.date('D, d M Y H:i:s'));
			header("Pragma: public"); 
			header('Content-Disposition:; filename="'.$Name.'"');
			header("Content-Transfer-Encoding: binary");
		
			echo utf8_decode("<table border='0'> 

					<tr> 
					<td style='font-weight:bold; border:1px solid #eee;'>CÓDIGO</td> 
					<td style='font-weight:bold; border:1px solid #eee;'>CLIENTE</td>
					<td style='font-weight:bold; border:1px solid #eee;'>VENDEDOR</td>
					<td style='font-weight:bold; border:1px solid #eee;'>CANTIDAD</td>
					<td style='font-weight:bold; border:1px solid #eee;'>PRODUCTOS</td>
					<td style='font-weight:bold; border:1px solid #eee;'>IMPUESTO</td>
					<td style='font-weight:bold; border:1px solid #eee;'>NETO</td>		
					<td style='font-weight:bold; border:1px solid #eee;'>TOTAL</td>		
					<td style='font-weight:bold; border:1px solid #eee;'>METODO DE PAGO</td	
					<td style='font-weight:bold; border:1px solid #eee;'>FECHA</td>		
					</tr>");

			foreach ($ventas as $row => $item){

				$cliente = ControladorClientes::ctrMostrarClientes("id", $item["id_cliente"]);
				$vendedor = ControladorUsuarios::ctrMostrarUsuarios("id", $item["id_vendedor"]);

			 echo utf8_decode("<tr>
			 			<td style='border:1px solid #eee;'>".$item["codigo"]."</td> 
			 			<td style='border:1px solid #eee;'>".$cliente["nombre"]."</td>
			 			<td style='border:1px solid #eee;'>".$vendedor["nombre"]."</td>
			 			<td style='border:1px solid #eee;'>");

			 	$productos =  json_decode($item["productos"], true);

			 	foreach ($productos as $key => $valueInsumos) {
			 			
			 			echo utf8_decode($valueInsumos["cantidad"]."<br>");
			 		}

			 	echo utf8_decode("</td><td style='border:1px solid #eee;'>");	

		 		foreach ($productos as $key => $valueInsumos) {
			 			
		 			echo utf8_decode($valueInsumos["descripcion"]."<br>");
		 		
		 		}

		 		echo utf8_decode("</td>
					<td style='border:1px solid #eee;'>$ ".number_format($item["impuesto"],2)."</td>
					<td style='border:1px solid #eee;'>$ ".number_format($item["neto"],2)."</td>	
					<td style='border:1px solid #eee;'>$ ".number_format($item["total"],2)."</td>
					<td style='border:1px solid #eee;'>".$item["metodo_pago"]."</td>
					<td style='border:1px solid #eee;'>".substr($item["fecha"],0,10)."</td>		
		 			</tr>");


			}


			echo "</table>";

		}

	}


	/*=============================================
	SUMA TOTAL AGREGAR INSUMOS
	=============================================*/

	public function ctrSumaTotalAgregarInsumos(){

		$tabla = "ventas";

		$respuesta = ModeloAgregarInsumos::mdlSumaTotalAgregarInsumos($tabla);

		return $respuesta;

	}

	/*=============================================
	DESCARGAR XML
	=============================================*/

	static public function ctrDescargarXML(){

		if(isset($_GET["xml"])){


			$tabla = "ventas";
			$item = "codigo";
			$valor = $_GET["xml"];

			$ventas = ModeloAgregarInsumos::mdlMostrarAgregarInsumos($tabla, $item, $valor);

			// PRODUCTOS

			$listaInsumos = json_decode($ventas["productos"], true);

			// CLIENTE

			$tablaClientes = "clientes";
			$item = "id";
			$valor = $ventas["id_cliente"];

			$traerCliente = ModeloClientes::mdlMostrarClientes($tablaClientes, $item, $valor);

			// VENDEDOR

			$tablaVendedor = "usuarios";
			$item = "id";
			$valor = $ventas["id_vendedor"];

			$traerVendedor = ModeloUsuarios::mdlMostrarUsuarios($tablaVendedor, $item, $valor);

			//http://php.net/manual/es/book.xmlwriter.php

			$objetoXML = new XMLWriter();

			$objetoXML->openURI($_GET["xml"].".xml"); //Creación del archivo XML

			$objetoXML->setIndent(true); //recibe un valor booleano para establecer si los distintos niveles de nodos XML deben quedar indentados o no.

			$objetoXML->setIndentString("\t"); // carácter \t, que corresponde a una tabulación

			$objetoXML->startDocument('1.0', 'utf-8');// Inicio del documento
			
			// $objetoXML->startElement("etiquetaPrincipal");// Inicio del nodo raíz

			// $objetoXML->writeAttribute("atributoEtiquetaPPal", "valor atributo etiqueta PPal"); // Atributo etiqueta principal

			// 	$objetoXML->startElement("etiquetaInterna");// Inicio del nodo hijo

			// 		$objetoXML->writeAttribute("atributoEtiquetaInterna", "valor atributo etiqueta Interna"); // Atributo etiqueta interna

			// 		$objetoXML->text("Texto interno");// Inicio del nodo hijo
			
			// 	$objetoXML->endElement(); // Final del nodo hijo
			
			// $objetoXML->endElement(); // Final del nodo raíz


			$objetoXML->writeRaw('<fe:Invoice xmlns:fe="http://www.dian.gov.co/contratos/facturaelectronica/v1" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:clm54217="urn:un:unece:uncefact:codelist:specification:54217:2001" xmlns:clm66411="urn:un:unece:uncefact:codelist:specification:66411:2001" xmlns:clmIANAMIMEMediaType="urn:un:unece:uncefact:codelist:specification:IANAMIMEMediaType:2003" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:sts="http://www.dian.gov.co/contratos/facturaelectronica/v1/Structures" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.dian.gov.co/contratos/facturaelectronica/v1 ../xsd/DIAN_UBL.xsd urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2 ../../ubl2/common/UnqualifiedDataTypeSchemaModule-2.0.xsd urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2 ../../ubl2/common/UBL-QualifiedDatatypes-2.0.xsd">');

			$objetoXML->writeRaw('<ext:UBLExtensions>');

			foreach ($listaInsumos as $key => $value) {
				
				$objetoXML->text($value["descripcion"].", ");
			
			}

			

			$objetoXML->writeRaw('</ext:UBLExtensions>');

			$objetoXML->writeRaw('</fe:Invoice>');

			$objetoXML->endDocument(); // Final del documento

			return true;	
		}

	}

}