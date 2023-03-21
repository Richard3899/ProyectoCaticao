/*=============================================
TABLA CONSUMO DE ENERGÍA
=============================================*/
var idRecetaC = $("#idReceta").val();

$('.tablaRecetaConsumoEnergia').DataTable( {
	"ajax": "ajax/datatable-recetaconsumoenergia.ajax.php?idRecetaC="+idRecetaC+"&permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all",
		 "sortable": false
		},
		//Tipo de dato (Número)
		{targets:[2], render: DataTable.render.number( '.', ',', 2)},
		{targets:[3], render: DataTable.render.number( '.', ',', 2)},
		{targets:[4], render: DataTable.render.number( '.', ',', 2)},
		{targets:[5], render: DataTable.render.number( '.', ',', 2, 'S/ ')},
		{targets:[6], render: DataTable.render.number( '.', ',', 2, 'S/ ')}
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
EDITAR TARIFA KWH
=============================================*/

$(document).on('click','#btnEditarTarifaKwh',function(){

	var tarifaKwh = "1";
	
	var datos = new FormData();

    datos.append("tarifaKwh", tarifaKwh);

     $.ajax({

      url:"ajax/recetaconsumoenergia.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editarTarifaKwh").val(respuesta["tarifaKwh"]);

      }

  })

})


/*=============================================
CONSULTA DE CONSUMO DE ENERGÍA
=============================================*/
const idArrayRecetaConsumoEnergia=[0];

$(".tablaRecetaConsumoEnergia").on("draw.dt", function() {
	
	var x = $(".nm").val();

	if(x.length > 20){

		window.location ="recetas";

	}

	var idReceta = $("#idReceta").val();

	var datos = new FormData();

	datos.append("idReceta", idReceta);

	  $.ajax({

     	url:"ajax/recetaconsumoenergia.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
		
		for (var i=0; i<respuesta.length; i++) { 

			idArrayRecetaConsumoEnergia.push(respuesta[i]["idMaquina"]);
		
		}
		
      	}

	})


	$tarifaKwh = "1";
	
	var datos = new FormData();

    datos.append("tarifaKwh", $tarifaKwh);

     $.ajax({

      url:"ajax/recetaconsumoenergia.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){
		
		  $tarifaKwh= respuesta["tarifaKwh"];

      }

  })
})


/*=============================================
SELECCIONAR MAQUINA DE LA RECETA
=============================================*/

$(".formularioRecetaConsumoEnergia").on("change", "select.seleccionarNombreMaquina", function(){
	
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
					$(".precioConsumoEnergia").val("");
					$("#precioTotal").val(0);
					
				}else{
						
					for(i=0;i<idArrayRecetaConsumoEnergia.length;i++){
		
						if(idArrayRecetaConsumoEnergia[i]==idMaquina){
				
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
							$("#potenciaKw").val(respuesta["potenciaKw"]);
							$("#tarifaKwh").val($tarifaKwh);
							$("#nuevoTiempoHoras").val(0);
							$(".precioConsumoEnergia").val(0);
						}
					 }

				}

			  
			  // SUMAR TOTAL DE PRECIOS
			  
			  sumaTotalPrecioRecetaConsumoEnergia();

			  
      	}


	})

})


/*=============================================
MODIFICAR LA TIEMPO HORAS
=============================================*/

$(".formularioRecetaConsumoEnergia").on("change", "input.nuevoTiempoHorasConsumoEnergia", function(){

    var precioUnitario = $(".precioConsumoEnergia");

	var consumoKwh = ($(this).val() * $("#potenciaKw").val()).toFixed(2);

	$("#consumoKwh").val(consumoKwh);

	var precioUnitarioFinal = consumoKwh *$("#tarifaKwh").val();

	precioUnitario.val(precioUnitarioFinal);

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

	sumaTotalPrecioRecetaConsumoEnergia()

	
})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumaTotalPrecioRecetaConsumoEnergia(){

	var precioUnitarioItem = $(".precioConsumoEnergia");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}

	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

		$(".precioConsumoEnergia").val(sumaTotalPrecioUnitario.toFixed(2));
		$("#precioTotal").val(sumaTotalPrecioUnitario);

}

/*=============================================
EDITAR CONSUMO DE ENERGÍA DE LA RECETA
=============================================*/

$(".tablaRecetaConsumoEnergia tbody").on("click", "button.btnEditarConsumoEnergiaReceta", function(){

	var idRecetaConsumoEnergia = $(this).attr("idRecetaConsumoEnergia");
	
	var datos = new FormData();

    datos.append("idRecetaConsumoEnergia", idRecetaConsumoEnergia);

     $.ajax({

      url:"ajax/recetaconsumoenergia.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editaridRecetaConsumoEnergia").val(respuesta["idRecetaConsumoEnergia"]);

		   $("#editarNombreMaquina").val(respuesta["nombreMaquina"]);
		   $("#editarNombreMaquina").attr('disabled', 'disabled');	
		   $("#editarPotenciaKw").val(respuesta["potenciaKw"]);
		   $("#editarTiempoHoras").val(respuesta["horasTrabajoBatch"]);
		   $("#editarConsumoKwh").val(respuesta["consumoKwh"]);
		   $("#editarTarifaKwh").val(respuesta["tarifaKwh"]);
		   $(".editarPrecioConsumoEnergia").val(respuesta["pagoPorBatch"]);
		   
		   editarsumaTotalPrecioRecetaConsumoEnergia();
      }

  })

})


/*=============================================
MODIFICAR LA TIEMPO HORAS AL EDITAR
=============================================*/

$(".formularioEditarRecetaConsumoEnergia").on("change", "input.editarTiempoHorasConsumoEnergia", function(){

	var editarprecioUnitario = $(".editarPrecioConsumoEnergia");

	var editarConsumoKwh = ($(this).val() * $("#editarPotenciaKw").val()).toFixed(2);

	$("#editarConsumoKwh").val(editarConsumoKwh);

	var precioUnitarioFinal = editarConsumoKwh *$("#editarTarifaKwh").val();

	editarprecioUnitario.val(precioUnitarioFinal);

	// SUMAR TOTAL DE PRECIOS

	editarsumaTotalPrecioRecetaConsumoEnergia();

})

/*=============================================
SUMAR TODOS LOS PRECIOS AL EDITAR
=============================================*/

function editarsumaTotalPrecioRecetaConsumoEnergia(){

	var precioUnitarioItem = $(".editarPrecioConsumoEnergia");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}

	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

		$(".editarPrecioConsumoEnergia").val(sumaTotalPrecioUnitario.toFixed(2));
		$("#editarprecioTotal").val(sumaTotalPrecioUnitario);

}


/*=============================================
ELIMINAR CONSUMO DE ENERGÍA DE LA RECETA
=============================================*/

$(".tablaRecetaConsumoEnergia tbody").on("click", "button.btnEliminarConsumoEnergiaReceta", function(){

	var codigoReceta = $("#codigoReceta").val();
	var idReceta = $("#idReceta").val();
	var nombreReceta = $("#nombreReceta").val();
	var idRecetaConsumoEnergia = $(this).attr("idRecetaConsumoEnergia");
	
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

        window.location = "index.php?ruta=recetaconsumoenergia&idRecetaConsumoEnergia="+idRecetaConsumoEnergia+
		                  "&codigoReceta="+codigoReceta+"&nombreReceta="+nombreReceta+"&idReceta="+idReceta;

        }


	})

})

