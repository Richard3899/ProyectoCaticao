var idRecetaC = $("#idReceta").val();

$('.tablaAgregarInsumos').DataTable( {
	"ajax": "ajax/datatable-agregarinsumos.ajax.php?idRecetaC="+idRecetaC,
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


const idArray=[0];

$(".tablaAgregarInsumos").on("draw.dt", function() {
	
	var x = $(".nm").val();

	if(x.length > 20){

		window.location ="recetas";

	}

	var idReceta = $("#idReceta").val();

	var datos = new FormData();

	datos.append("idReceta", idReceta);

	  $.ajax({

     	url:"ajax/agregarinsumos.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
		
		for (var i=0; i<respuesta.length; i++) { 

			idArray.push(respuesta[i]["idMateria"]);
		
		}
		
      	}

	})
})


/*=============================================
SELECCIONAR INSUMO
=============================================*/

$(".formularioAgregarInsumo").on("change", "select.nuevoNombreInsumo", function(){
	
	var idInsumoDetalle = $(this).val();

	var datos = new FormData();

	datos.append("idInsumoDetalle", idInsumoDetalle);
    
	  $.ajax({

     	url:"ajax/agregarinsumos.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

				if($(".nuevoNombreInsumo").val() == ""){

					$("#nuevaCantidad").val(0);
					$("#nuevoStock").val(0);
					$(".nuevoPrecioUnitarioInsumo").attr("precioUnitarioReal",0);
					$("#precioTotal").val(0);
					
				}else{
						
					for(i=0;i<idArray.length;i++){
		
						if(idArray[i]==idInsumoDetalle){
				
							Swal.fire({
								icon: "error",
								title: "El insumo ya está en la receta",
								showConfirmButton: false,
							    timer: 2000
							  })

							$('#nuevoNombreInsumo').val(null).trigger('change');

						}else{

							$("#idInsumo").val(respuesta["idMateria"]);
							$("#nuevoNombre").val(respuesta["nombre"]+" - "+respuesta["marca"]);
							$(".nuevaCantidadInsumo").attr("stock",respuesta["stock"]);
							$("#nuevaCantidad").val(1);
							$("#nuevoStock").val(respuesta["stock"]+" "+respuesta["unidadMedida"]);
							$("#precioUnitarioReal").val(respuesta["precioUnitario"]);
							$(".nuevoPrecioUnitarioInsumo").val(respuesta["precioUnitario"]);
							$(".nuevoPrecioUnitarioInsumo").attr("precioUnitarioReal",respuesta["precioUnitario"]);
							

							if(respuesta["stock"] <= 0){

								$("#nuevaCantidad").val(0);
								$("#nuevoStock").val("0 "+respuesta["unidadMedida"]);
								$(".nuevaCantidadInsumo").attr("stock",0);
							}
							
						}
					 }

				}

			  
			  // SUMAR TOTAL DE PRECIOS
			  
			  sumarTotalPrecioUnitario();
	
      	}


	})

})

/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

$(".formularioAgregarInsumo").on("change", "input.nuevaCantidadInsumo", function(){

	var precioUnitario = $(".nuevoPrecioUnitarioInsumo");

	var precioUnitarioFinal = $(this).val() * precioUnitario.attr("precioUnitarioReal");

	precioUnitario.val(precioUnitarioFinal);

	var nuevoStock = Number($(this).attr("stock")) - $(this).val();

	$(this).attr("nuevoStock", nuevoStock);

		if(Number($(this).val()) > Number($(this).attr("stock"))){


			if(Number($(this).attr("stock")) <= 0){
	
				$(this).val(0);
	
				precioUnitario.val(0);
				
				Swal.fire({
					title: "No hay stock disponible",
					icon: "error",
					showConfirmButton: false,
					timer: 2000
				  });
		
		
			 }else{
	
				/*=============================================
				SI LA CANTIDAD ES SUPERIOR AL STOCK REGRESAR VALORES INICIALES
				=============================================*/
				$(this).val($(this).attr("stock"));
	
				$(this).attr("nuevoStock", $(this).attr("stock"));
		
				var precioUnitarioFinal = $(this).val() * precioUnitario.attr("precioUnitarioReal");
		
				precioUnitario.val(precioUnitarioFinal);
		
				sumarTotalPrecioUnitario();
		
				Swal.fire({
				  title: "La cantidad supera el stock",
				  icon: "error",
				  showConfirmButton: false,
				  timer: 2000
				});
		
				return;
	
			 }
	
		}


	// SUMAR TOTAL DE PRECIOS

	sumarTotalPrecioUnitario()


})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumarTotalPrecioUnitario(){

	var precioUnitarioItem = $(".nuevoPrecioUnitarioInsumo");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

	if($(".nuevoPrecioUnitarioInsumo").attr("precioUnitarioReal") == 0){

		$(".nuevoPrecioUnitarioInsumo").val("");

	}else{

		$(".nuevoPrecioUnitarioInsumo").number(true,3);
		$(".nuevoPrecioUnitarioInsumo").val(sumaTotalPrecioUnitario);
		$("#precioTotal").val(sumaTotalPrecioUnitario);

	}

}

/*=============================================
EDITAR INSUMO
=============================================*/

$(".tablaAgregarInsumos tbody").on("click", "button.btnEditarInsumoReceta", function(){

	var idInsumoReceta = $(this).attr("idInsumoReceta");
	
	var datos = new FormData();

    datos.append("idInsumoReceta", idInsumoReceta);

     $.ajax({

      url:"ajax/agregarinsumos.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editaridInsumo").val(respuesta["idMateria"]);
		   $("#editaridInsumoReceta").val(respuesta["idRecetaMateria"]);
		   $("#editarNombreInsumo").val(respuesta["idMateria"]);
		   $("#editarNombreInsumo").attr('disabled', 'disabled');	
		   $("#editarNombreInsumo").trigger('change');
		   $("#editarNombre").val(respuesta["nombre"]);

		   $(".editarCantidadInsumo").attr("edistock",(Number(respuesta["stock"])+Number(respuesta["cantidad"])));
		   $("#editarCantidad").val(respuesta["cantidad"]);
		   $("#editarStock").val((Number(respuesta["stock"])+Number(respuesta["cantidad"]))+" "+respuesta["unidadMedida"]);
		   $("#cantidadAnterior").val(respuesta["cantidad"]);

		   $("#editarprecioUnitarioReal").val(respuesta["precioUnitario"]);
		   $(".editarPrecioUnitarioInsumo").val(respuesta["total"]);
		   $(".editarPrecioUnitarioInsumo").attr("editarprecioUnitarioReal",respuesta["precioUnitario"]);
		   
		   editarsumarTotalPrecioUnitario();
      }

  })

})


/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

$(".formularioEditarAgregarInsumo").on("change", "input.editarCantidadInsumo", function(){

	var editarprecioUnitario = $(".editarPrecioUnitarioInsumo");

	var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioUnitarioReal");

	editarprecioUnitario.val(precioUnitarioFinal);

	var editarStock = Number($(this).attr("edistock")) - $(this).val();

    $(this).attr("editarStock", editarStock);

	var diferenciaCantidad= Number($("#cantidadAnterior").val()) - $(this).val();
	
	$("#diferenciaCantidad").val(diferenciaCantidad);
    
		if(Number($(this).val()) > Number($(this).attr("edistock"))){


			if(Number($(this).attr("edistock")) <= 0){
	
				$(this).val(0);
	
				editarprecioUnitario.val(0);
				
				Swal.fire({
					title: "No hay stock disponible",
					icon: "error",
					showConfirmButton: false,
					timer: 2000
				  });
		
		
			 }else{
	
				/*=============================================
				SI LA CANTIDAD ES SUPERIOR AL STOCK REGRESAR VALORES INICIALES
				=============================================*/
				$(this).val($(this).attr("edistock"));
	
				$(this).attr("editarStock", $(this).attr("edistock"));
		
				var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioUnitarioReal");
		
				editarprecioUnitario.val(precioUnitarioFinal);
		
				editarsumarTotalPrecioUnitario();
		
				Swal.fire({
				  title: "La cantidad supera el stock",
				  icon: "error",
				  showConfirmButton: false,
				  timer: 2000
				});
		
				return;
	
			 }
	
		}


	// SUMAR TOTAL DE PRECIOS

	editarsumarTotalPrecioUnitario();


})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function editarsumarTotalPrecioUnitario(){

	var precioUnitarioItem = $(".editarPrecioUnitarioInsumo");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

	if($(".editarPrecioUnitarioInsumo").attr("editarprecioUnitarioReal") == 0){

		$(".editarPrecioUnitarioInsumo").val("");

	}else{

		$(".editarPrecioUnitarioInsumo").number(true,3);
		$(".editarPrecioUnitarioInsumo").val(sumaTotalPrecioUnitario);
		$("#editarprecioTotal").val(sumaTotalPrecioUnitario);

	}

}


/*=============================================
ELIMINAR INSUMO
=============================================*/

$(".tablaAgregarInsumos tbody").on("click", "button.btnEliminarInsumoReceta", function(){
	var codigoReceta = $("#codigoReceta").val();
	var idReceta = $("#idReceta").val();
	var nombreReceta = $("#nombreReceta").val();
	var idRecetaInsumo = $(this).attr("idRecetaInsumo");
	var idInsumo = $(this).attr("idInsumo");
	var cantidadInsumo = $(this).attr("cantidadInsumo");
	
	Swal.fire({

		title: '¿Está seguro de borrar el insumo?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar insumo!'
        }).then(function(result){
        if (result.value) {

        window.location = "index.php?ruta=agregarinsumos&idRecetaInsumo="+idRecetaInsumo+"&idInsumo="+idInsumo+"&cantidadInsumo="+
			               cantidadInsumo+"&codigoReceta="+codigoReceta+"&nombreReceta="+nombreReceta+"&idReceta="+idReceta;

        }


	})

})

