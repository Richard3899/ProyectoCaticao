/*=============================================
TABLA COSTO DE MARKETING
=============================================*/
var idRecetaC = $("#idReceta").val();

$('.tablaRecetaCostoMarketing').DataTable( {
	"ajax": "ajax/datatable-recetacostomarketing.ajax.php?idRecetaC="+idRecetaC+"&permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
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
CONSULTA DE COSTO DE MARKETING
=============================================*/
const idArrayRecetaCostoMarketing=[0];

$(".tablaRecetaCostoMarketing").on("draw.dt", function() {
	
	var x = $(".nm").val();

	if(x.length > 20){

		window.location ="recetas";

	}

	var idReceta = $("#idReceta").val();

	var datos = new FormData();

	datos.append("idReceta", idReceta);

	  $.ajax({

     	url:"ajax/recetacostomarketing.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
		
		for (var i=0; i<respuesta.length; i++) { 

			idArrayRecetaCostoMarketing.push(respuesta[i]["idGastoAdmin"]);
		
		}
		
      	}

	})
})

/*=============================================
SELECCIONAR MAQUINA DE LA RECETA
=============================================*/

$(".formularioRecetaCostoMarketing").on("change", "select.seleccionarNombreCostoMarketing", function(){
	
	var idCostoMarketing = $(this).val();

	var datos = new FormData();

	datos.append("idCostoMarketing", idCostoMarketing);
    
	  $.ajax({

     	url:"ajax/costomarketing.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

				if($(".seleccionarNombreCostoMarketing").val() == ""){

					$("#nuevaCantidad").val(0);
					$(".precioCostoMarketing").val("");
					$("#precioTotal").val(0);
					
				}else{
						
					for(i=0;i<idArrayRecetaCostoMarketing.length;i++){
		
						if(idArrayRecetaCostoMarketing[i]==idCostoMarketing){
				
							Swal.fire({
								icon: "error",
								title: "El costo de marketing ya está en la receta",
								showConfirmButton: false,
							    timer: 2000
							  })

							$('#seleccionarNombreCostoMarketing').val(null).trigger('change');

						}else{

							$("#idCostoMarketing").val(respuesta["idGastoAdmin"]);
							$("#nombreCostoMarketing").val(respuesta["descripcion"]);
							$("#nuevaCantidad").val(0);
							$("#precio").val(respuesta["precio"]);
							$(".precioCostoMarketing").val(0);
							$(".precioCostoMarketing").attr("precioReal",respuesta["precio"]);
							
						}
					 }

				}

			  
			  // SUMAR TOTAL DE PRECIOS
			  
			  sumaTotalPrecioRecetaCostoMarketing();

			  
      	}


	})

})


/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

$(".formularioRecetaCostoMarketing").on("change", "input.nuevaCantidadCostoMarketing", function(){

	var precio = $(".precioCostoMarketing");

	var precioUnitarioFinal = $(this).val() * precio.attr("precioReal");

	precio.val(precioUnitarioFinal);

	$(".precioCostoMarketing").val(precioUnitarioFinal);

	if($('#seleccionarNombreCostoMarketing').val() == ""){
		
		$(this).val(0);

		precio.val(0);

		Swal.fire({
			title: "Seleccionar costo de marketing",
			icon: "error",
			showConfirmButton: false,
			timer: 2000
		  });

	}

	// SUMAR TOTAL DE PRECIOS

	sumaTotalPrecioRecetaCostoMarketing()

	
})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumaTotalPrecioRecetaCostoMarketing(){

	var precioUnitarioItem = $(".precioCostoMarketing");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

		$(".precioCostoMarketing").val(sumaTotalPrecioUnitario.toFixed(2));
		$("#precioTotal").val(sumaTotalPrecioUnitario);

}

/*=============================================
EDITAR COSTO DE MARKETING DE LA RECETA
=============================================*/

$(".tablaRecetaCostoMarketing tbody").on("click", "button.btnEditarCostoMarketingReceta", function(){

	var idRecetaCostoMarketing = $(this).attr("idRecetaCostoMarketing");
	
	var datos = new FormData();

    datos.append("idRecetaCostoMarketing", idRecetaCostoMarketing);

     $.ajax({

      url:"ajax/recetacostomarketing.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editaridRecetaCostoMarketing").val(respuesta["idRecetaCostoMarketing"]);

		   $("#editarNombreCostoMarketing").val(respuesta["nombreCostoMarketing"]);
		   $("#editarNombreCostoMarketing").attr('disabled', 'disabled');	

		   $("#editarCantidad").val(respuesta["cantidad"]);

		   $(".editarPrecioCostoMarketing").val(respuesta["total"]);
		   $(".editarPrecioCostoMarketing").attr("editarprecioReal",respuesta["precio"]);
		   
		   editarsumaTotalPrecioRecetaCostoMarketing();
      }

  })

})


/*=============================================
MODIFICAR LA CANTIDAD AL EDITAR
=============================================*/

$(".formularioEditarRecetaCostoMarketing").on("change", "input.editarCantidadCostoMarketing", function(){

	var editarprecioUnitario = $(".editarPrecioCostoMarketing");

	var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioReal");

	editarprecioUnitario.val(precioUnitarioFinal);

	// SUMAR TOTAL DE PRECIOS

	editarsumaTotalPrecioRecetaCostoMarketing();


})

/*=============================================
SUMAR TODOS LOS PRECIOS AL EDITAR
=============================================*/

function editarsumaTotalPrecioRecetaCostoMarketing(){

	var precioUnitarioItem = $(".editarPrecioCostoMarketing");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

		$(".editarPrecioCostoMarketing").val(sumaTotalPrecioUnitario.toFixed(2));
		$("#editarPrecioTotal").val(sumaTotalPrecioUnitario);

}


/*=============================================
ELIMINAR COSTO DE MARKETING DE LA RECETA
=============================================*/

$(".tablaRecetaCostoMarketing tbody").on("click", "button.btnEliminarCostoMarketingReceta", function(){

	var codigoReceta = $("#codigoReceta").val();
	var idReceta = $("#idReceta").val();
	var nombreReceta = $("#nombreReceta").val();
	var idRecetaCostoMarketing = $(this).attr("idRecetaCostoMarketing");
	
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

        window.location = "index.php?ruta=recetacostomarketing&idRecetaCostoMarketing="+idRecetaCostoMarketing+
		                  "&codigoReceta="+codigoReceta+"&nombreReceta="+nombreReceta+"&idReceta="+idReceta;

        }


	})

})

