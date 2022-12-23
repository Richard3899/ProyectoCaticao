/*=============================================
TABLA RECETA INSUMO
=============================================*/
var idRecetaC = $("#idReceta").val();

$('.tablaRecetaInsumos').DataTable( {
	"ajax": "ajax/datatable-recetainsumos.ajax.php?idRecetaC="+idRecetaC,
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
CONSULTA DE RECETA INSUMO
=============================================*/
const idArrayRecetaInsumos=[0];

$(".tablaRecetaInsumos").on("draw.dt", function() {
	
	var x = $(".nm").val();

	if(x.length > 50){

		window.location ="recetas";

	}

	var idReceta = $("#idReceta").val();

	var datos = new FormData();

	datos.append("idReceta", idReceta);

	  $.ajax({

     	url:"ajax/recetainsumos.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
		
		for (var i=0; i<respuesta.length; i++) { 

			idArrayRecetaInsumos.push(respuesta[i]["idMateria"]);
		
		}
		
      	}

	})
})


/*=============================================
SELECCIONAR INSUMO DE LA RECETA
=============================================*/

$(".formularioRecetaInsumos").on("change", "select.seleccionarNombreInsumo", function(){
	
	var idInsumoDetalle = $(this).val();

	var datos = new FormData();

	datos.append("idInsumoDetalle", idInsumoDetalle);
    
	  $.ajax({

     	url:"ajax/recetainsumos.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

				if($(".seleccionarNombreInsumo").val() == ""){

					$("#nuevaCantidad").val(0);
					$("#nuevoStock").val(0);
					$(".precioInsumo").attr("precioReal",0);
					$("#precioTotal").val(0);
					
				}else{
						
					for(i=0;i<idArrayRecetaInsumos.length;i++){
		
						if(idArrayRecetaInsumos[i]==idInsumoDetalle){
				
							Swal.fire({
								icon: "error",
								title: "El insumo ya está en la receta",
								showConfirmButton: false,
							    timer: 2000
							  })

							$('#seleccionarNombreInsumo').val(null).trigger('change');

						}else{

							$("#idInsumo").val(respuesta["idMateria"]);
							$("#nombreInsumo").val(respuesta["nombre"]+" - "+respuesta["marca"]);
							$(".nuevaCantidadInsumo").attr("stock",respuesta["stock"]);
							$("#nuevaCantidad").val(0);
							$("#nuevoStock").val(respuesta["stock"]+" "+respuesta["unidadMedida"]);
							$("#precioUnitario").val(respuesta["precioUnitario"]);
							$(".precioInsumo").val(0);
							$(".precioInsumo").attr("precioReal",respuesta["precioUnitario"]);
							

							if(respuesta["stock"] <= 0){

								$("#nuevaCantidad").val(0);
								$("#nuevoStock").val("0 "+respuesta["unidadMedida"]);
								$(".nuevaCantidadInsumo").attr("stock",0);
							}
							
						}
					 }

				}

			  
			  // SUMAR TOTAL DE PRECIOS
			  
			  sumaTotalPrecioRecetaInsumos();

			  
	
      	}


	})

})

/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

$(".formularioRecetaInsumos").on("change", "input.nuevaCantidadInsumo", function(){

	var precioUnitario = $(".precioInsumo");

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
		
				sumaTotalPrecioRecetaInsumos();
		
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

	sumaTotalPrecioRecetaInsumos()

	
})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumaTotalPrecioRecetaInsumos(){

	var precioUnitarioItem = $(".precioInsumo");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

	if($(".precioInsumo").attr("precioReal") == 0){

		$(".precioInsumo").val("");

	}else{

		$(".precioInsumo").number(true,3);
		$(".precioInsumo").val(sumaTotalPrecioUnitario);
		$("#precioTotal").val(sumaTotalPrecioUnitario);
		
	}

}

/*=============================================
EDITAR INSUMO DE LA RECETA
=============================================*/

$(".tablaRecetaInsumos tbody").on("click", "button.btnEditarInsumoReceta", function(){

	var idRecetaInsumo = $(this).attr("idRecetaInsumo");
	
	var datos = new FormData();

    datos.append("idRecetaInsumo", idRecetaInsumo);

     $.ajax({

      url:"ajax/recetainsumos.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editaridRecetaInsumo").val(respuesta["idRecetaMateria"]);
		   $("#editaridInsumo").val(respuesta["idMateria"]);
		   $("#editarNombreInsumo").val(respuesta["nombre"]);
	       $("#editarNombreI").attr('disabled', 'disabled');
		   $("#editarNombreI").val(respuesta["nombre"]);

		   $(".editarCantidadInsumo").attr("edStock",(Number(respuesta["stock"])+Number(respuesta["cantidad"])));
		   $("#editarCantidad").val(respuesta["cantidad"]);
		   $("#editarStock").val(Number(respuesta["stock"]).toFixed(3)+" "+respuesta["unidadMedida"]);
		   $("#cantidadAnterior").val(respuesta["cantidad"]);

		   $("#editarprecioUnitario").val(respuesta["precioUnitario"]);
		   $(".editarPrecioInsumo").val(respuesta["total"]);
		   $(".editarPrecioInsumo").attr("editarprecioReal",respuesta["precioUnitario"]);
		   
		   editarsumaTotalPrecioRecetaInsumos();
      }

  })

})


/*=============================================
MODIFICAR LA CANTIDAD AL EDITAR
=============================================*/

$(".formularioEditarRecetaInsumo").on("change", "input.editarCantidadInsumo", function(){

	var editarprecioUnitario = $(".editarPrecioInsumo");

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
		
				editarsumaTotalPrecioRecetaInsumos();
		
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

	editarsumaTotalPrecioRecetaInsumos();


})

/*=============================================
SUMAR TODOS LOS PRECIOS AL EDITAR
=============================================*/

function editarsumaTotalPrecioRecetaInsumos(){

	var precioUnitarioItem = $(".editarPrecioInsumo");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

	if($(".editarPrecioInsumo").attr("editarprecioReal") == 0){

		$(".editarPrecioInsumo").val("");

	}else{

		$(".editarPrecioInsumo").number(true,3);
		$(".editarPrecioInsumo").val(sumaTotalPrecioUnitario);
		$("#editarprecioTotal").val(sumaTotalPrecioUnitario);

	}

}


/*=============================================
ELIMINAR INSUMO DE LA RECETA
=============================================*/

$(".tablaRecetaInsumos tbody").on("click", "button.btnEliminarInsumoReceta", function(){

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

        window.location = "index.php?ruta=recetainsumos&idRecetaInsumo="+idRecetaInsumo+"&idInsumo="+idInsumo+"&cantidadInsumo="+
			               cantidadInsumo+"&codigoReceta="+codigoReceta+"&nombreReceta="+nombreReceta+"&idReceta="+idReceta;

        }


	})

})

