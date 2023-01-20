/*=============================================
TABLA GASTO ADMIN POR MES
=============================================*/
var idCostoRecetasGastoAdminC = $("#idCostoRecetasGastoAdmin").val();

$('.tablaGastoAdminPorMes').DataTable( {
	"ajax": "ajax/datatable-gastoadminpormes.ajax.php?idCostoRecetasGastoAdminC="+idCostoRecetasGastoAdminC,
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

					$("#nuevaCantidad").val(0);
					$(".precioGastoAdmin").val("");
					$("#precioTotal").val(0);
					
				}else{
						
					for(i=0;i<idArrayGastoAdminPorMes.length;i++){
		
						if(idArrayGastoAdminPorMes[i]==idGastoAdmin){
				
							Swal.fire({
								icon: "error",
								title: "El gasto administrativo ya está en la receta",
								showConfirmButton: false,
							    timer: 2000
							  })

							$('#seleccionarNombreGastoAdmin').val(null).trigger('change');

						}else{

							$("#idGastoAdmin").val(respuesta["idGastoAdmin"]);
							$("#nombreGastoAdmin").val(respuesta["descripcion"]);
							$("#nuevaCantidad").val(0);
							$("#precio").val(respuesta["precio"]);
							$(".precioGastoAdmin").val(0);
							$(".precioGastoAdmin").attr("precioReal",respuesta["precio"]);
							
						}
					 }

				}

			  
			  // SUMAR TOTAL DE PRECIOS
			  
			  sumaTotalPrecioGastoAdminPorMes();

			  
      	}


	})

})


/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

$(".formularioGastoAdminPorMes").on("change", "input.nuevaCantidadGastoAdmin", function(){

	var precio = $(".precioGastoAdmin");

	var precioUnitarioFinal = $(this).val() * precio.attr("precioReal");

	precio.val(precioUnitarioFinal);

	$(".precioGastoAdmin").val(precioUnitarioFinal);

	if($('#seleccionarNombreGastoAdmin').val() == ""){
		
		$(this).val(0);

		precio.val(0);

		Swal.fire({
			title: "Seleccionar gasto administrativo",
			icon: "error",
			showConfirmButton: false,
			timer: 2000
		  });

	}

	// SUMAR TOTAL DE PRECIOS

	sumaTotalPrecioGastoAdminPorMes()

	
})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumaTotalPrecioGastoAdminPorMes(){

	var precioUnitarioItem = $(".precioGastoAdmin");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

		$(".precioGastoAdmin").number(true,2);
		$(".precioGastoAdmin").val(sumaTotalPrecioUnitario);
		$("#precioTotal").val(sumaTotalPrecioUnitario);

}

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
		   $("#editarNombreGastoAdmin").attr('disabled', 'disabled');	

		   $("#editarCantidad").val(respuesta["cantidad"]);

		   $(".editarPrecioGastoAdmin").val(respuesta["total"]);
		   $(".editarPrecioGastoAdmin").attr("editarprecioReal",respuesta["precio"]);
	
		   editarsumaTotalPrecioGastoAdminPorMes();

      }

  })

})


/*=============================================
MODIFICAR LA CANTIDAD AL EDITAR
=============================================*/

$(".formularioEditarGastoAdminPorMes").on("change", "input.editarCantidadGastoAdmin", function(){

	var editarprecioUnitario = $(".editarPrecioGastoAdmin");

	var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioReal");

	editarprecioUnitario.val(precioUnitarioFinal);

	// SUMAR TOTAL DE PRECIOS

	editarsumaTotalPrecioGastoAdminPorMes();


})

/*=============================================
SUMAR TODOS LOS PRECIOS AL EDITAR
=============================================*/

function editarsumaTotalPrecioGastoAdminPorMes(){

	var precioUnitarioItem = $(".editarPrecioGastoAdmin");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

		$(".editarPrecioGastoAdmin").number(true,2);
		$(".editarPrecioGastoAdmin").val(sumaTotalPrecioUnitario);
		$("#editarPrecioTotal").val(sumaTotalPrecioUnitario);

}


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

