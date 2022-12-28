/*=============================================
TABLA RECETA DEPRECIACION
=============================================*/
var idRecetaC = $("#idReceta").val();

$('.tablaRecetaDepreciacion').DataTable( {
	"ajax": "ajax/datatable-recetadepreciacion.ajax.php?idRecetaC="+idRecetaC,
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
CONSULTA DE RECETA DEPRECIACION
=============================================*/
const idArrayRecetaDepreciacion=[0];

$(".tablaRecetaDepreciacion").on("draw.dt", function() {
	
	var x = $(".nm").val();

	if(x.length > 50){

		window.location ="recetas";

	}

	var idReceta = $("#idReceta").val();

	var datos = new FormData();

	datos.append("idReceta", idReceta);

	  $.ajax({

     	url:"ajax/recetadepreciacion.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
		
		for (var i=0; i<respuesta.length; i++) { 

			idArrayRecetaDepreciacion.push(respuesta[i]["idMateria"]);
		
		}
		
      	}

	})
})


/*=============================================
SELECCIONAR DEPRECIACION DE LA RECETA
=============================================*/

$(".formularioRecetaDepreciacion").on("change", "select.seleccionarNombreDepreciacion", function(){
	
	var idDepreciacionDetalle = $(this).val();

	var datos = new FormData();

	datos.append("idDepreciacionDetalle", idDepreciacionDetalle);
    
	  $.ajax({

     	url:"ajax/recetadepreciacion.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

				if($(".seleccionarNombreDepreciacion").val() == ""){

					$("#nuevaCantidad").val(0);
					$("#nuevoStock").val(0);
					$(".precioDepreciacion").attr("precioReal",0);
					$("#precioTotal").val(0);
					
				}else{
						
					for(i=0;i<idArrayRecetaDepreciacion.length;i++){
		
						if(idArrayRecetaDepreciacion[i]==idDepreciacionDetalle){
				
							Swal.fire({
								icon: "error",
								title: "El depreciacion ya está en la receta",
								showConfirmButton: false,
							    timer: 2000
							  })

							$('#seleccionarNombreDepreciacion').val(null).trigger('change');

						}else{

							$("#idDepreciacion").val(respuesta["idMateria"]);
							$("#nombreDepreciacion").val(respuesta["nombre"]+" - "+respuesta["marca"]);
							$(".nuevaCantidadDepreciacion").attr("stock",respuesta["stock"]);
							$("#nuevaCantidad").val(0);
							$("#nuevoStock").val(respuesta["stock"]+" "+respuesta["unidadMedida"]);
							$("#precioUnitario").val(respuesta["precioUnitario"]);
							$(".precioDepreciacion").val(0);
							$(".precioDepreciacion").attr("precioReal",respuesta["precioUnitario"]);
							

							if(respuesta["stock"] <= 0){

								$("#nuevaCantidad").val(0);
								$("#nuevoStock").val("0 "+respuesta["unidadMedida"]);
								$(".nuevaCantidadDepreciacion").attr("stock",0);
							}
							
						}
					 }

				}

			  
			  // SUMAR TOTAL DE PRECIOS
			  
			  sumaTotalPrecioRecetaDepreciacion();

			  
	
      	}


	})

})

/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

$(".formularioRecetaDepreciacion").on("change", "input.nuevaCantidadDepreciacion", function(){

	var precioUnitario = $(".precioDepreciacion");

	var precioUnitarioFinal = $(this).val() * precioUnitario.attr("precioReal");

	precioUnitario.val(precioUnitarioFinal);

	var nuevoStock = (Number($(this).attr("stock")) - $(this).val()).toFixed(3);

	$(this).attr("nuevoStock", nuevoStock);

	$("#nuevoStock").val(nuevoStock);

		if(Number($(this).val()) > Number($(this).attr("stock"))){


			if(Number($(this).attr("stock")) <= 0){
	
				$(this).val(0);
	
				precioUnitario.val(0);

				$("#nuevoStock").val(0);
				
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

				$("#nuevoStock").val(0);
		
				var precioUnitarioFinal = $(this).val() * precioUnitario.attr("precioReal");
		
				precioUnitario.val(precioUnitarioFinal);
		
				sumaTotalPrecioRecetaDepreciacion();
		
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

	sumaTotalPrecioRecetaDepreciacion()

	
})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumaTotalPrecioRecetaDepreciacion(){

	var precioUnitarioItem = $(".precioDepreciacion");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

	if($(".precioDepreciacion").attr("precioReal") == 0){

		$(".precioDepreciacion").val("");

	}else{

		$(".precioDepreciacion").number(true,3);
		$(".precioDepreciacion").val(sumaTotalPrecioUnitario);
		$("#precioTotal").val(sumaTotalPrecioUnitario);
		
	}

}

/*=============================================
EDITAR DEPRECIACION DE LA RECETA
=============================================*/

$(".tablaRecetaDepreciacion tbody").on("click", "button.btnEditarDepreciacionReceta", function(){

	var idRecetaDepreciacion = $(this).attr("idRecetaDepreciacion");
	
	var datos = new FormData();

    datos.append("idRecetaDepreciacion", idRecetaDepreciacion);

     $.ajax({

      url:"ajax/recetadepreciacion.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editaridRecetaDepreciacion").val(respuesta["idRecetaMateria"]);
		   $("#editaridDepreciacion").val(respuesta["idMateria"]);
		   $("#editarNombreDepreciacion").val(respuesta["nombre"]);
	       $("#editarNombreI").attr('disabled', 'disabled');
		   $("#editarNombreI").val(respuesta["nombre"]);

		   $(".editarCantidadDepreciacion").attr("edStock",(Number(respuesta["stock"])+Number(respuesta["cantidad"])));
		   $("#editarCantidad").val(respuesta["cantidad"]);
		   $("#editarStock").val(Number(respuesta["stock"]).toFixed(3)+" "+respuesta["unidadMedida"]);
		   $("#cantidadAnterior").val(respuesta["cantidad"]);

		   $("#editarprecioUnitario").val(respuesta["precioUnitario"]);
		   $(".editarPrecioDepreciacion").val(respuesta["total"]);
		   $(".editarPrecioDepreciacion").attr("editarprecioReal",respuesta["precioUnitario"]);
		   
		   editarsumaTotalPrecioRecetaDepreciacion();
      }

  })

})


/*=============================================
MODIFICAR LA CANTIDAD AL EDITAR
=============================================*/

$(".formularioEditarRecetaDepreciacion").on("change", "input.editarCantidadDepreciacion", function(){

	var editarprecioUnitario = $(".editarPrecioDepreciacion");

	var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioReal");

	editarprecioUnitario.val(precioUnitarioFinal);

	var editarStock = (Number($(this).attr("edStock")) - $(this).val()).toFixed(3);

    $(this).attr("editarStock", editarStock);

	var diferenciaCantidad= Number($("#cantidadAnterior").val()) - $(this).val();

	$("#editarStock").val(editarStock);
	
	$("#diferenciaCantidad").val(diferenciaCantidad);
    
		if(Number($(this).val()) > Number($(this).attr("edStock"))){


			if(Number($(this).attr("edStock")) <= 0){
	
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
				$(this).val($(this).attr("edStock"));
	
				$(this).attr("editarStock", $(this).attr("edStock"));
				
				$("#editarStock").val(0);

				var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioReal");
		
				editarprecioUnitario.val(precioUnitarioFinal);
		
				editarsumaTotalPrecioRecetaDepreciacion();
		
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

	editarsumaTotalPrecioRecetaDepreciacion();


})

/*=============================================
SUMAR TODOS LOS PRECIOS AL EDITAR
=============================================*/

function editarsumaTotalPrecioRecetaDepreciacion(){

	var precioUnitarioItem = $(".editarPrecioDepreciacion");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

	if($(".editarPrecioDepreciacion").attr("editarprecioReal") == 0){

		$(".editarPrecioDepreciacion").val("");

	}else{

		$(".editarPrecioDepreciacion").number(true,3);
		$(".editarPrecioDepreciacion").val(sumaTotalPrecioUnitario);
		$("#editarprecioTotal").val(sumaTotalPrecioUnitario);

	}

}


/*=============================================
ELIMINAR DEPRECIACION DE LA RECETA
=============================================*/

$(".tablaRecetaDepreciacion tbody").on("click", "button.btnEliminarDepreciacionReceta", function(){

	var codigoReceta = $("#codigoReceta").val();
	var idReceta = $("#idReceta").val();
	var nombreReceta = $("#nombreReceta").val();
	var idRecetaDepreciacion = $(this).attr("idRecetaDepreciacion");
	var idDepreciacion = $(this).attr("idDepreciacion");
	var cantidadDepreciacion = $(this).attr("cantidadDepreciacion");
	
	Swal.fire({

		title: '¿Está seguro de borrar el depreciacion?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar depreciacion!'
        }).then(function(result){
        if (result.value) {

        window.location = "index.php?ruta=recetadepreciacion&idRecetaDepreciacion="+idRecetaDepreciacion+"&idDepreciacion="+idDepreciacion+"&cantidadDepreciacion="+
			               cantidadDepreciacion+"&codigoReceta="+codigoReceta+"&nombreReceta="+nombreReceta+"&idReceta="+idReceta;

        }


	})

})

