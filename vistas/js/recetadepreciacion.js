/*=============================================
TABLA DEPRECIACIÓN
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
CONSULTA DE DEPRECIACIÓN
=============================================*/
const idArrayRecetaDepreciacion=[0];

$(".tablaRecetaDepreciacion").on("draw.dt", function() {
	
	var x = $(".nm").val();

	if(x.length > 20){

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

			idArrayRecetaDepreciacion.push(respuesta[i]["idMaquina"]);
		
		}
		
      	}

	})
})


/*=============================================
SELECCIONAR MAQUINA DE LA RECETA
=============================================*/

$(".formularioRecetaDepreciacion").on("change", "select.seleccionarNombreMaquina", function(){
	
	var idMaquina = $(this).val();

	var datos = new FormData();

	datos.append("idMaquina", idMaquina);
    
	  $.ajax({

     	url:"ajax/maquinas.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

				if($(".seleccionarNombreMaquina").val() == ""){

					$("#nuevoTiempoHoras").val(0);
					$(".precioDepreciacion").attr("precioReal",0);
					$("#precioTotal").val(0);
					
				}else{
						
					for(i=0;i<idArrayRecetaDepreciacion.length;i++){
		
						if(idArrayRecetaDepreciacion[i]==idMaquina){
				
							Swal.fire({
								icon: "error",
								title: "El maquina ya está en la receta",
								showConfirmButton: false,
							    timer: 2000
							  })

							$('#seleccionarNombreMaquina').val(null).trigger('change');

						}else{

							$("#idMaquina").val(respuesta["idMaquina"]);
							$("#nombreMaquina").val(respuesta["nombre"]);
							$("#nuevoTiempoHoras").val(0);
							$("#precioUnitario").val(respuesta["depreciacionHora"]);
							$(".precioDepreciacion").val(0);
							$(".precioDepreciacion").attr("precioReal",respuesta["depreciacionHora"]);
							
						}
					 }

				}

			  
			  // SUMAR TOTAL DE PRECIOS
			  
			  sumaTotalPrecioRecetaDepreciacion();

			  
      	}


	})

})


/*=============================================
MODIFICAR LA TIEMPO HORAS
=============================================*/

$(".formularioRecetaDepreciacion").on("change", "input.nuevoTiempoHorasDepreciacion", function(){

	var precioUnitario = $(".precioDepreciacion");

	var precioUnitarioFinal = $(this).val() * precioUnitario.attr("precioReal");

	precioUnitario.val(precioUnitarioFinal);

	$(".precioDepreciacion").val(precioUnitarioFinal);

	if($('#seleccionarNombreMaquina').val() == ""){
		
		$(this).val(0);

		precioUnitario.val(0);

		Swal.fire({
			title: "Seleccionar maquina",
			icon: "error",
			showConfirmButton: false,
			timer: 2000
		  });

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
EDITAR DEPRECIACIÓN DE LA RECETA
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

		   $("#editaridRecetaDepreciacion").val(respuesta["idRecetaDepreciacion"]);

		   $("#editarNombreMaquina").val(respuesta["nombreMaquina"]);
		   $("#editarNombreMaquina").attr('disabled', 'disabled');	

		   $("#editarTiempoHoras").val(respuesta["tiempoHoras"]);

		   $(".editarPrecioDepreciacion").val(respuesta["depreciacionPorBatch"]);
		   $(".editarPrecioDepreciacion").attr("editarprecioReal",respuesta["depreciacionHora"]);
		   
		   editarsumaTotalPrecioRecetaDepreciacion();
      }

  })

})


/*=============================================
MODIFICAR LA TIEMPO HORAS AL EDITAR
=============================================*/

$(".formularioEditarRecetaDepreciacion").on("change", "input.editarTiempoHorasDepreciacion", function(){

	var editarprecioUnitario = $(".editarPrecioDepreciacion");

	var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioReal");

	editarprecioUnitario.val(precioUnitarioFinal);

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
ELIMINAR DEPRECIACIÓN DE LA RECETA
=============================================*/

$(".tablaRecetaDepreciacion tbody").on("click", "button.btnEliminarDepreciacionReceta", function(){

	var codigoReceta = $("#codigoReceta").val();
	var idReceta = $("#idReceta").val();
	var nombreReceta = $("#nombreReceta").val();
	var idRecetaDepreciacion = $(this).attr("idRecetaDepreciacion");
	
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

        window.location = "index.php?ruta=recetadepreciacion&idRecetaDepreciacion="+idRecetaDepreciacion+
		                  "&codigoReceta="+codigoReceta+"&nombreReceta="+nombreReceta+"&idReceta="+idReceta;

        }


	})

})

