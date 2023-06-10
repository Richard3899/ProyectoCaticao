/*=============================================
TABLA CONSUMO DE GAS
=============================================*/
var idRecetaC = $("#idReceta").val();

$('.tablaRecetaConsumoGas').DataTable( {
	"ajax": "ajax/datatable-recetaconsumogas.ajax.php?idRecetaC="+idRecetaC+"&permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all",
		 "sortable": false
		},
		//Tipo de dato (Número)
		{targets:[2], render: DataTable.render.number( '.', ',', 2)},
		{targets:[3], render: DataTable.render.number( '.', ',', 2)},
		{targets:[4], render: DataTable.render.number( '.', ',', 2, 'S/ ')},
		{targets:[5], render: DataTable.render.number( '.', ',', 2, 'S/ ')}
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
CONSULTA DE CONSUMO DE GAS
=============================================*/
const idArrayRecetaConsumoGas=[0];

$(".tablaRecetaConsumoGas").on("draw.dt", function() {
	
	var x = $(".nm").val();

	if(x.length > 20){

		window.location ="recetas";

	}

	var idReceta = $("#idReceta").val();

	var datos = new FormData();

	datos.append("idReceta", idReceta);

	  $.ajax({

     	url:"ajax/recetaconsumogas.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
		
		for (var i=0; i<respuesta.length; i++) { 

			idArrayRecetaConsumoGas.push(respuesta[i]["idMaquina"]);
		
		}
		
      	}

	})
})


/*=============================================
SELECCIONAR MAQUINA DE LA RECETA
=============================================*/

$(".formularioRecetaConsumoGas").on("change", "select.seleccionarNombreMaquina", function(){
	
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

					$("#nuevoTrabajoPorBatch").val("");
					$("#nuevoPesoBalonGas").val("");
					$("#nuevaTarifaGas").val("");
					$("#precioTotal").val("");
					
				}else{
						
					for(i=0;i<idArrayRecetaConsumoGas.length;i++){
		
						if(idArrayRecetaConsumoGas[i]==idMaquina){
				
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
							
						}
					 }

				}

			  
      	}


	})

})

/*=============================================
CALCULAR TOTAL
=============================================*/

$("#nuevoPesoBalonGas").on("change", function() {

	var cantidad = $(this).val();
	var precio = $("#nuevaTarifaGas").val();
	
	var total= (cantidad*precio).toFixed(2);
	
	$("#nuevoTotal").val(total);
	
	})
	
$("#nuevaTarifaGas").on("change", function() {
	
	var precio = $(this).val();
	var cantidad = $("#nuevoPesoBalonGas").val();
	
	var total= (precio*cantidad).toFixed(2);
	
	$("#nuevoTotal").val(total);
		
})


/*=============================================
EDITAR DEPRECIACIÓN DE LA RECETA
=============================================*/

$(".tablaRecetaConsumoGas tbody").on("click", "button.btnEditarConsumoGasReceta", function(){

	var idRecetaConsumoGas = $(this).attr("idRecetaConsumoGas");
	
	var datos = new FormData();

    datos.append("idRecetaConsumoGas", idRecetaConsumoGas);

     $.ajax({

      url:"ajax/recetaconsumogas.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editaridRecetaConsumoGas").val(respuesta["idRecetaConsumoGas"]);

		   $("#editarNombreMaquina").val(respuesta["nombreMaquina"]);
		   $("#editarNombreMaquina").attr('disabled', 'disabled');	

		   $("#editarTrabajoPorBatch").val(respuesta["trabajoPorBatch"]);
		   $("#editarPesoBalonGas").val(respuesta["pesoBalonGas"]);
		   $("#editarTarifaGas").val(respuesta["tarifaGas"]);

		   $("#editarTotal").val(respuesta["pagoPorBatch"]);
      }

  })

})


/*=============================================
CALCULAR TOTAL AL EDITAR
=============================================*/

$("#editarPesoBalonGas").on("change", function() {

	var cantidad = $(this).val();
	var precio = $("#editarTarifaGas").val();
	
	var total= (cantidad*precio).toFixed(2);
	
	$("#editarTotal").val(total);
	
	})
	
$("#editarTarifaGas").on("change", function() {
	
	var precio = $(this).val();
	var cantidad = $("#editarPesoBalonGas").val();
	
	var total= (precio*cantidad).toFixed(2);
	
	$("#editarTotal").val(total);
		
})


/*=============================================
ELIMINAR CONSUMO DE GAS DE LA RECETA
=============================================*/

$(".tablaRecetaConsumoGas tbody").on("click", "button.btnEliminarConsumoGasReceta", function(){

	var codigoReceta = $("#codigoReceta").val();
	var idReceta = $("#idReceta").val();
	var nombreReceta = $("#nombreReceta").val();
	var idRecetaConsumoGas = $(this).attr("idRecetaConsumoGas");
	
	Swal.fire({

		title: '¿Está seguro de borrar el consumo de gas?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar consumo de gas!'
        }).then(function(result){
        if (result.value) {

        window.location = "index.php?ruta=recetaconsumogas&idRecetaConsumoGas="+idRecetaConsumoGas+
		                  "&codigoReceta="+codigoReceta+"&nombreReceta="+nombreReceta+"&idReceta="+idReceta;

        }


	})

})

