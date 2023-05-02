/*=============================================
TABLA GASTO ADMIN POR MES
=============================================*/
var idCostoRecetasGastoAdminC = $("#idCostoRecetasGastoAdmin").val();

$('.tablaGastoAdminPorMes').DataTable( {
	"ajax": "ajax/datatable-gastoadminpormes.ajax.php?idCostoRecetasGastoAdminC="+idCostoRecetasGastoAdminC+"&permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all",
		 "sortable": false
		},
		//Tipo de dato (Número)
		{targets:[2], render: DataTable.render.number( '.', ',', 2)},
		{targets:[3], render: DataTable.render.number( '.', ',', 2, 'S/ ')},
		{targets:[4], render: DataTable.render.number( '.', ',', 2, 'S/ ')}
	  ],
	"retrieve": true,
	"processing": true,
	"aLengthMenu": [[10,25,50,-1],[10,25,50,"Todos"]],
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
const idArrayGastoAdminPorMes=[0];

$(".tablaGastoAdminPorMes").on("draw.dt", function() {
	
	var x = $(".nm").val();

	if(x.length > 20){

		window.location ="costorecetasgastoadmin";

	}

	var idCostoRecetasGastoAdmin = $("#idCostoRecetasGastoAdmin").val();

	var datos = new FormData();

	datos.append("idCostoRecetasGastoAdmin", idCostoRecetasGastoAdmin);

	  $.ajax({

     	url:"ajax/gastoadminpormes.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
		
		for (var i=0; i<respuesta.length; i++) { 

			idArrayGastoAdminPorMes.push(respuesta[i]["idGastoAdmin"]);
		}
		
      	}

	})
})

/*=============================================
MOSTRAR GASTO POR ID TIPO GASTO
=============================================*/

$(".nuevoidTipoGasto").on("change", function() {

	var idTipoGasto = $(this).val();

	var datos = new FormData();

	datos.append("idTipoGasto", idTipoGasto);

    if($(this).val()!=''){

	$("#seleccionarNombreGastoAdmin").prop("disabled", false);

	}else{

	$("#seleccionarNombreGastoAdmin").prop("disabled", true);
	}

	$("#seleccionarNombreGastoAdmin").empty();

	$.ajax({
        
     	url:"ajax/gastoadmin.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

		$(".seleccionarNombreGastoAdmin").append("<option value =''>Seleccionar :</option>");
		
		for (var i=0; i<respuesta.length; i++) { 

		$(".seleccionarNombreGastoAdmin").append("<option value ='"+respuesta[i]["idGastoAdmin"]+"'>"+respuesta[i]["descripcion"]+"</option>");

	    }

	    }
		
	})
})

/*=============================================
CALCULAR TOTAL
=============================================*/

$("#nuevaCantidad").on("change", function() {

var cantidad = $(this).val();
var precio = $("#nuevoPrecio").val();

var total= (cantidad*precio).toFixed(2);

$("#nuevoTotal").val(total);
})

$("#nuevoPrecio").on("change", function() {

var precio = $(this).val();
var cantidad = $("#nuevaCantidad").val();

var total= (precio*cantidad).toFixed(2);

$("#nuevoTotal").val(total);
})


/*=============================================
SELECCIONAR GASTO ADMIN
=============================================*/

$(".formularioGastoAdminPorMes").on("change", "select.seleccionarNombreGastoAdmin", function(){
	
	var idGastoAdmin = $(this).val();

	var datos = new FormData();

	datos.append("idGastoAdmin", idGastoAdmin);
    
	  $.ajax({

     	url:"ajax/gastoadmin.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

		if($(".seleccionarNombreGastoAdmin").val() == ""){
			
		}else{
				
			for(i=0;i<idArrayGastoAdminPorMes.length;i++){

				if(idArrayGastoAdminPorMes[i]==idGastoAdmin){
		
					Swal.fire({
						icon: "error",
						title: "El gasto ya está registrado",
						showConfirmButton: false,
						timer: 2000
					  })

					$('#seleccionarNombreGastoAdmin').val(null).trigger('change');

				}else{

					$("#idGastoAdmin").val(respuesta["idGastoAdmin"]);
					$("#nombreGastoAdmin").val(respuesta["descripcion"]);
					
				}
			 }

		}
  
      	}

	})

})


/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

// $(".formularioGastoAdminPorMes").on("change", "input.nuevaCantidadGastoAdmin", function(){

// 	var precio = $(".precioGastoAdmin");

// 	var precioUnitarioFinal = $(this).val() * precio.attr("precioReal");

// 	precio.val(precioUnitarioFinal);

// 	$(".precioGastoAdmin").val(precioUnitarioFinal);

// 	if($('#seleccionarNombreGastoAdmin').val() == ""){
		
// 		$(this).val(0);

// 		precio.val(0);

// 		Swal.fire({
// 			title: "Seleccionar gasto administrativo",
// 			icon: "error",
// 			showConfirmButton: false,
// 			timer: 2000
// 		  });

// 	}

// 	// SUMAR TOTAL DE PRECIOS

// 	 sumaTotalPrecioGastoAdminPorMes()

	
// })

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

// function sumaTotalPrecioGastoAdminPorMes(){

// 	var precioUnitarioItem = $(".precioGastoAdmin");

// 	var arraySumaPrecioUnitario = [];  

// 	for(var i = 0; i < precioUnitarioItem.length; i++){

// 		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
// 	}


// 	function sumaArrayPrecioUnitario(total, numero){

// 		return total + numero;

// 	}

// 	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

// 		$(".precioGastoAdmin").val(sumaTotalPrecioUnitario.toFixed(2));
// 		$("#precioTotal").val(sumaTotalPrecioUnitario);

// }

/*=============================================
EDITAR GASTO ADMIN POR MES
=============================================*/

$(".tablaGastoAdminPorMes tbody").on("click", "button.btnEditarGastoAdminPorMes", function(){

	var idGastoAdminPorMes = $(this).attr("idGastoAdminPorMes");
	
	var datos = new FormData();

    datos.append("idGastoAdminPorMes", idGastoAdminPorMes);

     $.ajax({

      url:"ajax/gastoadminpormes.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editaridGastoAdminPorMes").val(respuesta["idGastoAdminPorMes"]);
		   $("#editarNombreGastoAdmin").val(respuesta["nombreGastoAdmin"]);	

		   $("#editarCantidad").val(respuesta["cantidad"]);
		   $("#editarPrecio").val(respuesta["precio"]);
		   $("#editarTotal").val(respuesta["total"]);
	
      }

  })

})

/*=============================================
CALCULAR TOTAL EDITAR
=============================================*/

$("#editarCantidad").on("change", function() {

var cantidad = $(this).val();
var precio = $("#editarPrecio").val();

var total= (cantidad*precio).toFixed(2);

$("#editarTotal").val(total);
})
	
$("#editarPrecio").on("change", function() {
	
var precio = $(this).val();
var cantidad = $("#editarCantidad").val();

var total= (precio*cantidad).toFixed(2);

$("#editarTotal").val(total);
})
	


/*=============================================
MODIFICAR LA CANTIDAD AL EDITAR
=============================================*/

// $(".formularioEditarGastoAdminPorMes").on("change", "input.editarCantidadGastoAdmin", function(){

// 	var editarprecioUnitario = $(".editarPrecioGastoAdmin");

// 	var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioReal");

// 	editarprecioUnitario.val(precioUnitarioFinal);

// 	// SUMAR TOTAL DE PRECIOS

// 	editarsumaTotalPrecioGastoAdminPorMes();


// })

/*=============================================
SUMAR TODOS LOS PRECIOS AL EDITAR
=============================================*/

// function editarsumaTotalPrecioGastoAdminPorMes(){

// 	var precioUnitarioItem = $(".editarPrecioGastoAdmin");

// 	var arraySumaPrecioUnitario = [];  

// 	for(var i = 0; i < precioUnitarioItem.length; i++){

// 		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
// 	}


// 	function sumaArrayPrecioUnitario(total, numero){

// 		return total + numero;

// 	}

// 	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

// 		$(".editarPrecioGastoAdmin").val(sumaTotalPrecioUnitario.toFixed(2));
// 		$("#editarPrecioTotal").val(sumaTotalPrecioUnitario);

// }


/*=============================================
ELIMINAR GASTO ADMIN POR MES
=============================================*/

$(".tablaGastoAdminPorMes tbody").on("click", "button.btnEliminarGastoAdminPorMes", function(){

	var idCostoRecetasGastoAdmin = $("#idCostoRecetasGastoAdmin").val();
	var descripcion = $("#descripcion").val();
	var idGastoAdminPorMes = $(this).attr("idGastoAdminPorMes");
	
	Swal.fire({

		title: '¿Está seguro de borrar el gasto admin?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar gasto admin!'
        }).then(function(result){
        if (result.value) {

        window.location = "index.php?ruta=gastoadminpormes&idGastoAdminPorMes="+idGastoAdminPorMes+"&descripcion="+
		                   descripcion+"&idCostoRecetasGastoAdmin="+idCostoRecetasGastoAdmin;

        }


	})

})

