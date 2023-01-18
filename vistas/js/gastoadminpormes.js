/*=============================================
TABLA GASTO ADMIN POR MES
=============================================*/
var idRecetaC = $("#idReceta").val();

$('.tablaRecetaCostoVenta').DataTable( {
	"ajax": "ajax/datatable-recetacostoventa.ajax.php?idRecetaC="+idRecetaC,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all",
		 "sortable": false
		}
	  ],
	"retrieve": true,
	"processing": true,
	"language": {

			"sProcessing":     "Procesando...",
			"sLengthMenu":     "Mostrar _MENU_ registros",
			"sZeroRecords":    "No se encontraron resultados",
			"sEmptyTable":     "Ningún dato disponible en esta tabla",
			"sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
			"sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0",
			"sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
			"sInfoPostFix":    "",
			"sSearch":         "Buscar:",
			"sUrl":            "",
			"sInfoThousands":  ",",
			"sLoadingRecords": "Cargando...",
			"oPaginate": {
			"sFirst":    "Primero",
			"sLast":     "Último",
			"sNext":     "Siguiente",
			"sPrevious": "Anterior"
			},
			"oAria": {
				"sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
				"sSortDescending": ": Activar para ordenar la columna de manera descendente"
			}

	}

} );

/*=============================================
CONSULTA DE GASTO ADMIN POR MES
=============================================*/
const idArrayRecetaCostoVenta=[0];

$(".tablaRecetaCostoVenta").on("draw.dt", function() {
	
	var x = $(".nm").val();

	if(x.length > 20){

		window.location ="recetas";

	}

	var idReceta = $("#idReceta").val();

	var datos = new FormData();

	datos.append("idReceta", idReceta);

	  $.ajax({

     	url:"ajax/recetacostoventa.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
		
		for (var i=0; i<respuesta.length; i++) { 

			idArrayRecetaCostoVenta.push(respuesta[i]["idGastoAdmin"]);
		
		}
		
      	}

	})
})

/*=============================================
SELECCIONAR GASTO ADMIN
=============================================*/

$(".formularioRecetaCostoVenta").on("change", "select.seleccionarNombreCostoVenta", function(){
	
	var idCostoVenta = $(this).val();

	var datos = new FormData();

	datos.append("idCostoVenta", idCostoVenta);
    
	  $.ajax({

     	url:"ajax/costoventa.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

				if($(".seleccionarNombreCostoVenta").val() == ""){

					$("#nuevaCantidad").val(0);
					$(".precioCostoVenta").val("");
					$("#precioTotal").val(0);
					
				}else{
						
					for(i=0;i<idArrayRecetaCostoVenta.length;i++){
		
						if(idArrayRecetaCostoVenta[i]==idCostoVenta){
				
							Swal.fire({
								icon: "error",
								title: "El costo de venta ya está en la receta",
								showConfirmButton: false,
							    timer: 2000
							  })

							$('#seleccionarNombreCostoVenta').val(null).trigger('change');

						}else{

							$("#idCostoVenta").val(respuesta["idGastoAdmin"]);
							$("#nombreCostoVenta").val(respuesta["descripcion"]);
							$("#nuevaCantidad").val(0);
							$("#precio").val(respuesta["precio"]);
							$(".precioCostoVenta").val(0);
							$(".precioCostoVenta").attr("precioReal",respuesta["precio"]);
							
						}
					 }

				}

			  
			  // SUMAR TOTAL DE PRECIOS
			  
			  sumaTotalPrecioRecetaCostoVenta();

			  
      	}


	})

})


/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

$(".formularioRecetaCostoVenta").on("change", "input.nuevaCantidadCostoVenta", function(){

	var precio = $(".precioCostoVenta");

	var precioUnitarioFinal = $(this).val() * precio.attr("precioReal");

	precio.val(precioUnitarioFinal);

	$(".precioCostoVenta").val(precioUnitarioFinal);

	if($('#seleccionarNombreCostoVenta').val() == ""){
		
		$(this).val(0);

		precio.val(0);

		Swal.fire({
			title: "Seleccionar costo de venta",
			icon: "error",
			showConfirmButton: false,
			timer: 2000
		  });

	}

	// SUMAR TOTAL DE PRECIOS

	sumaTotalPrecioRecetaCostoVenta()

	
})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumaTotalPrecioRecetaCostoVenta(){

	var precioUnitarioItem = $(".precioCostoVenta");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

		$(".precioCostoVenta").number(true,3);
		$(".precioCostoVenta").val(sumaTotalPrecioUnitario);
		$("#precioTotal").val(sumaTotalPrecioUnitario);

}

/*=============================================
EDITAR GASTO ADMIN POR MES
=============================================*/

$(".tablaRecetaCostoVenta tbody").on("click", "button.btnEditarCostoVentaReceta", function(){

	var idRecetaCostoVenta = $(this).attr("idRecetaCostoVenta");
	
	var datos = new FormData();

    datos.append("idRecetaCostoVenta", idRecetaCostoVenta);

     $.ajax({

      url:"ajax/recetacostoventa.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editaridRecetaCostoVenta").val(respuesta["idRecetaCostoVenta"]);

		   $("#editarNombreCostoVenta").val(respuesta["nombreCostoVenta"]);
		   $("#editarNombreCostoVenta").attr('disabled', 'disabled');	

		   $("#editarCantidad").val(respuesta["cantidad"]);

		   $(".editarPrecioCostoVenta").val(respuesta["precio"]);
		   $(".editarPrecioCostoVenta").attr("editarprecioReal",respuesta["precio"]);
		   
		   editarsumaTotalPrecioRecetaCostoVenta();
      }

  })

})


/*=============================================
MODIFICAR LA CANTIDAD AL EDITAR
=============================================*/

$(".formularioEditarRecetaCostoVenta").on("change", "input.editarCantidadCostoVenta", function(){

	var editarprecioUnitario = $(".editarPrecioCostoVenta");

	var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioReal");

	editarprecioUnitario.val(precioUnitarioFinal);

	// SUMAR TOTAL DE PRECIOS

	editarsumaTotalPrecioRecetaCostoVenta();


})

/*=============================================
SUMAR TODOS LOS PRECIOS AL EDITAR
=============================================*/

function editarsumaTotalPrecioRecetaCostoVenta(){

	var precioUnitarioItem = $(".editarPrecioCostoVenta");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

		$(".editarPrecioCostoVenta").number(true,3);
		$(".editarPrecioCostoVenta").val(sumaTotalPrecioUnitario);
		$("#editarPrecioTotal").val(sumaTotalPrecioUnitario);

}


/*=============================================
ELIMINAR GASTO ADMIN POR MES
=============================================*/

$(".tablaRecetaCostoVenta tbody").on("click", "button.btnEliminarCostoVentaReceta", function(){

	var codigoReceta = $("#codigoReceta").val();
	var idReceta = $("#idReceta").val();
	var nombreReceta = $("#nombreReceta").val();
	var idRecetaCostoVenta = $(this).attr("idRecetaCostoVenta");
	
	Swal.fire({

		title: '¿Está seguro de borrar la mano de obra?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar mano de obra!'
        }).then(function(result){
        if (result.value) {

        window.location = "index.php?ruta=recetacostoventa&idRecetaCostoVenta="+idRecetaCostoVenta+
		                  "&codigoReceta="+codigoReceta+"&nombreReceta="+nombreReceta+"&idReceta="+idReceta;

        }


	})

})

