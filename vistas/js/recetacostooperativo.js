/*=============================================
TABLA COSTO OPERATIVO
=============================================*/
var idRecetaC = $("#idReceta").val();

$('.tablaRecetaCostoOperativo').DataTable( {
	"ajax": "ajax/datatable-recetacostooperativo.ajax.php?idRecetaC="+idRecetaC,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all",
		 "orderable": false
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
CONSULTA DE COSTO OPERATIVO
=============================================*/
const idArrayRecetaCostoOperativo=[0];

$(".tablaRecetaCostoOperativo").on("draw.dt", function() {
	
	var x = $(".nm").val();

	if(x.length > 20){

		window.location ="recetas";

	}

	var idReceta = $("#idReceta").val();

	var datos = new FormData();

	datos.append("idReceta", idReceta);

	  $.ajax({

     	url:"ajax/recetacostooperativo.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
		
		for (var i=0; i<respuesta.length; i++) { 

			idArrayRecetaCostoOperativo.push(respuesta[i]["idGastoAdmin"]);
		
		}
		
      	}

	})
})

/*=============================================
SELECCIONAR MAQUINA DE LA RECETA
=============================================*/

$(".formularioRecetaCostoOperativo").on("change", "select.seleccionarNombreCostoOperativo", function(){
	
	var idCostoOperativo = $(this).val();

	var datos = new FormData();

	datos.append("idCostoOperativo", idCostoOperativo);
    
	  $.ajax({

     	url:"ajax/costooperativo.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

				if($(".seleccionarNombreCostoOperativo").val() == ""){

					$("#nuevaCantidad").val(0);
					$(".precioCostoOperativo").val("");
					$("#precioTotal").val(0);
					
				}else{
						
					for(i=0;i<idArrayRecetaCostoOperativo.length;i++){
		
						if(idArrayRecetaCostoOperativo[i]==idCostoOperativo){
				
							Swal.fire({
								icon: "error",
								title: "El costo operativo ya está en la receta",
								showConfirmButton: false,
							    timer: 2000
							  })

							$('#seleccionarNombreCostoOperativo').val(null).trigger('change');

						}else{

							$("#idCostoOperativo").val(respuesta["idGastoAdmin"]);
							$("#nombreCostoOperativo").val(respuesta["descripcion"]);
							$("#nuevaCantidad").val(0);
							$("#precio").val(respuesta["precio"]);
							$(".precioCostoOperativo").val(0);
							$(".precioCostoOperativo").attr("precioReal",respuesta["precio"]);
							
						}
					 }

				}

			  
			  // SUMAR TOTAL DE PRECIOS
			  
			  sumaTotalPrecioRecetaCostoOperativo();

			  
      	}


	})

})


/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

$(".formularioRecetaCostoOperativo").on("change", "input.nuevaCantidadCostoOperativo", function(){

	var precio = $(".precioCostoOperativo");

	var precioUnitarioFinal = $(this).val() * precio.attr("precioReal");

	precio.val(precioUnitarioFinal);

	$(".precioCostoOperativo").val(precioUnitarioFinal);

	if($('#seleccionarNombreCostoOperativo').val() == ""){
		
		$(this).val(0);

		precio.val(0);

		Swal.fire({
			title: "Seleccionar costo operativo",
			icon: "error",
			showConfirmButton: false,
			timer: 2000
		  });

	}

	// SUMAR TOTAL DE PRECIOS

	sumaTotalPrecioRecetaCostoOperativo()

	
})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumaTotalPrecioRecetaCostoOperativo(){

	var precioUnitarioItem = $(".precioCostoOperativo");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

		$(".precioCostoOperativo").number(true,2);
		$(".precioCostoOperativo").val(sumaTotalPrecioUnitario);
		$("#precioTotal").val(sumaTotalPrecioUnitario);

}

/*=============================================
EDITAR COSTO OPERATIVO DE LA RECETA
=============================================*/

$(".tablaRecetaCostoOperativo tbody").on("click", "button.btnEditarCostoOperativoReceta", function(){

	var idRecetaCostoOperativo = $(this).attr("idRecetaCostoOperativo");
	
	var datos = new FormData();

    datos.append("idRecetaCostoOperativo", idRecetaCostoOperativo);

     $.ajax({

      url:"ajax/recetacostooperativo.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editaridRecetaCostoOperativo").val(respuesta["idRecetaCostoOperativo"]);

		   $("#editarNombreCostoOperativo").val(respuesta["nombreCostoOperativo"]);
		   $("#editarNombreCostoOperativo").attr('disabled', 'disabled');	

		   $("#editarCantidad").val(respuesta["cantidad"]);

		   $(".editarPrecioCostoOperativo").val(respuesta["total"]);
		   $(".editarPrecioCostoOperativo").attr("editarprecioReal",respuesta["precio"]);
		   
		   editarsumaTotalPrecioRecetaCostoOperativo();
      }

  })

})


/*=============================================
MODIFICAR LA CANTIDAD AL EDITAR
=============================================*/

$(".formularioEditarRecetaCostoOperativo").on("change", "input.editarCantidadCostoOperativo", function(){

	var editarprecioUnitario = $(".editarPrecioCostoOperativo");

	var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioReal");

	editarprecioUnitario.val(precioUnitarioFinal);

	// SUMAR TOTAL DE PRECIOS

	editarsumaTotalPrecioRecetaCostoOperativo();


})

/*=============================================
SUMAR TODOS LOS PRECIOS AL EDITAR
=============================================*/

function editarsumaTotalPrecioRecetaCostoOperativo(){

	var precioUnitarioItem = $(".editarPrecioCostoOperativo");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

		$(".editarPrecioCostoOperativo").number(true,2);
		$(".editarPrecioCostoOperativo").val(sumaTotalPrecioUnitario);
		$("#editarPrecioTotal").val(sumaTotalPrecioUnitario);

}


/*=============================================
ELIMINAR COSTO OPERATIVO DE LA RECETA
=============================================*/

$(".tablaRecetaCostoOperativo tbody").on("click", "button.btnEliminarCostoOperativoReceta", function(){

	var codigoReceta = $("#codigoReceta").val();
	var idReceta = $("#idReceta").val();
	var nombreReceta = $("#nombreReceta").val();
	var idRecetaCostoOperativo = $(this).attr("idRecetaCostoOperativo");
	
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

        window.location = "index.php?ruta=recetacostooperativo&idRecetaCostoOperativo="+idRecetaCostoOperativo+
		                  "&codigoReceta="+codigoReceta+"&nombreReceta="+nombreReceta+"&idReceta="+idReceta;

        }


	})

})

