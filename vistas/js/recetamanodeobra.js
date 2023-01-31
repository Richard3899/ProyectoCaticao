/*=============================================
TABLA RECETA MANO DE OBRA
=============================================*/
var idRecetaC = $("#idReceta").val();

$('.tablaRecetaManodeObra').DataTable( {
	"ajax": "ajax/datatable-recetamanodeobra.ajax.php?idRecetaC="+idRecetaC,
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
CONSULTA DE RECETA MANO DE OBRA
=============================================*/
const idArrayRecetaManodeObra=[0];

$(".tablaRecetaManodeObra").on("draw.dt", function() {
	
	var x = $(".nm").val();

	if(x.length > 20){

		window.location ="recetas";

	}

	var idReceta = $("#idReceta").val();

	var datos = new FormData();

	datos.append("idReceta", idReceta);

	  $.ajax({

     	url:"ajax/recetamanodeobra.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
		
		for (var i=0; i<respuesta.length; i++) { 

			idArrayRecetaManodeObra.push(respuesta[i]["idMaquina"]);
		
		}
		
      	}

	})
})

/*=============================================
SELECCIONAR EMPLEADO DE LA RECETA
=============================================*/

$(".formularioRecetaManodeObra").on("change", "select.seleccionarNombreEmpleado", function(){
	
	var idEmpleado = $(this).val();

	var datos = new FormData();

	datos.append("idEmpleado", idEmpleado);
    
	  $.ajax({

     	url:"ajax/empleados.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

				if($(".seleccionarNombreEmpleado").val() == ""){

					$("#nuevoTiempoHoras").val(0);
					$(".precioManodeObra").val("");
					$("#precioTotal").val(0);
					
				}else{
						
					// for(i=0;i<idArrayRecetaManodeObra.length;i++){
		
					// 	if(idArrayRecetaManodeObra[i]==idEmpleado){
				
					// 		Swal.fire({
					// 			icon: "error",
					// 			title: "El empleado ya está en la receta",
					// 			showConfirmButton: false,
					// 		    timer: 2000
					// 		  })

					// 		$('#seleccionarNombreEmpleado').val(null).trigger('change');

					// 	}else{

							$("#idEmpleado").val(respuesta["idEmpleado"]);
							$("#nombreEmpleado").val(respuesta["nombre"]+" "+respuesta["apellido"]);
							$("#nuevoTiempoHoras").val(0);
							$("#precioUnitario").val(respuesta["precioUnitario"]);
							$(".precioManodeObra").val(0);
							$(".precioManodeObra").attr("precioReal",respuesta["precioUnitario"]);
							
						// }
					//  }

				}

			  
			  // SUMAR TOTAL DE PRECIOS
			  
			  sumaTotalPrecioRecetaManodeObra();

			  
      	}


	})

})

/*=============================================
SELECCIONAR MAQUINA DE LA RECETA
=============================================*/

$(".formularioRecetaManodeObra").on("change", "select.seleccionarNombreMaquina", function(){
	
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

						$("#idMaquina").val("");
						$("#nombreMaquina").val("");
							
					}else{

					for(i=0;i<idArrayRecetaManodeObra.length;i++){
		
						if(idArrayRecetaManodeObra[i]==idMaquina){
				
							Swal.fire({
								icon: "error",
								title: "La maquina ya está en la receta",
								showConfirmButton: false,
							    timer: 2000
							  })

							$('#seleccionarNombreMaquina').val(null).trigger('change');

						}else{

							$("#idMaquina").val(respuesta["idMaquina"]);
							$("#nombreMaquina").val(respuesta["nombre"]);

						}
					 }    

      	            }
	}


	})

})

/*=============================================
MODIFICAR LA TIEMPO HORAS
=============================================*/

$(".formularioRecetaManodeObra").on("change", "input.nuevoTiempoHorasManodeObra", function(){

	var precioUnitario = $(".precioManodeObra");

	var precioUnitarioFinal = $(this).val() * precioUnitario.attr("precioReal");

	precioUnitario.val(precioUnitarioFinal);

	$(".precioManodeObra").val(precioUnitarioFinal);

	if($('#seleccionarNombreEmpleado').val() == ""){
		
		$(this).val(0);

		precioUnitario.val(0);

		Swal.fire({
			title: "Seleccionar empleado",
			icon: "error",
			showConfirmButton: false,
			timer: 2000
		  });

	}

	// SUMAR TOTAL DE PRECIOS

	sumaTotalPrecioRecetaManodeObra()

	
})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumaTotalPrecioRecetaManodeObra(){

	var precioUnitarioItem = $(".precioManodeObra");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

		$(".precioManodeObra").number(true,2);
		$(".precioManodeObra").val(sumaTotalPrecioUnitario);
		$("#precioTotal").val(sumaTotalPrecioUnitario);

}

/*=============================================
EDITAR MANO DE OBRA DE LA RECETA
=============================================*/

$(".tablaRecetaManodeObra tbody").on("click", "button.btnEditarManodeObraReceta", function(){

	var idRecetaManodeObra = $(this).attr("idRecetaManodeObra");
	
	var datos = new FormData();

    datos.append("idRecetaManodeObra", idRecetaManodeObra);

     $.ajax({

      url:"ajax/recetamanodeobra.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editaridRecetaManodeObra").val(respuesta["idRecetaManodeObra"]);

		   $("#editarNombreEmpleado").val(respuesta["nombreEmpleado"]);
		   $("#editarNombreEmpleado").attr('disabled', 'disabled');	

		   $("#editarNombreMaquina").val(respuesta["nombreMaquina"]);
		   $("#editarNombreMaquina").attr('disabled', 'disabled');	

		   $("#editarTiempoHoras").val(respuesta["tiempoHoras"]);

		   $(".editarPrecioManodeObra").val(respuesta["total"]);
		   $(".editarPrecioManodeObra").attr("editarprecioReal",respuesta["precioUnitario"]);
		   
		   editarsumaTotalPrecioRecetaManodeObra();
      }

  })

})


/*=============================================
MODIFICAR LA TIEMPO HORAS AL EDITAR
=============================================*/

$(".formularioEditarRecetaManodeObra").on("change", "input.editarTiempoHorasManodeObra", function(){

	var editarprecioUnitario = $(".editarPrecioManodeObra");

	var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioReal");

	editarprecioUnitario.val(precioUnitarioFinal);

	// SUMAR TOTAL DE PRECIOS

	editarsumaTotalPrecioRecetaManodeObra();


})

/*=============================================
SUMAR TODOS LOS PRECIOS AL EDITAR
=============================================*/

function editarsumaTotalPrecioRecetaManodeObra(){

	var precioUnitarioItem = $(".editarPrecioManodeObra");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

	if($(".editarPrecioManodeObra").attr("editarprecioReal") == 0){

		$(".editarPrecioManodeObra").val("");

	}else{

		$(".editarPrecioManodeObra").number(true,2);
		$(".editarPrecioManodeObra").val(sumaTotalPrecioUnitario);
		$("#editarprecioTotal").val(sumaTotalPrecioUnitario);

	}

}


/*=============================================
ELIMINAR MANO DE OBRA DE LA RECETA
=============================================*/

$(".tablaRecetaManodeObra tbody").on("click", "button.btnEliminarManodeObraReceta", function(){

	var codigoReceta = $("#codigoReceta").val();
	var idReceta = $("#idReceta").val();
	var nombreReceta = $("#nombreReceta").val();
	var idRecetaManodeObra = $(this).attr("idRecetaManodeObra");
	
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

        window.location = "index.php?ruta=recetamanodeobra&idRecetaManodeObra="+idRecetaManodeObra+
		                  "&codigoReceta="+codigoReceta+"&nombreReceta="+nombreReceta+"&idReceta="+idReceta;

        }


	})

})

