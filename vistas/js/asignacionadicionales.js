const datosAjax=[];

$('.tablaAsignacionAdicionales').dataTable( {
	"searching": false,
	"columnDefs": [{ "title": "Recetas", "targets": 0 }],
	"paging": false,
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

$("#nuevoTipoGasto").on("change", function() {

	datosAjax.length = 0;

	var idTipoGasto = $(this).val();

	var datos = new FormData();

	datos.append("idTipoGasto", idTipoGasto);
	
	$.ajax({

		url:"ajax/gastoadmin.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType:"json",
			success:function(respuesta){

			datosAjax.push({ 
				"title"    : 'Receta',
				"targets"  : 0
			});

			for (var i=0; i<respuesta.length; i++) { 

				datosAjax.push({ 
					"title"    : respuesta[i]["descripcion"],
					"targets"  : i+1
				});
			
			}

			tablaAdicionales(idTipoGasto);

		}

		
	}) 
	
})


function tablaAdicionales(idTipoGasto){

	var table = $('.tablaAsignacionAdicionales').DataTable();
	
	table.destroy();

	$('.tablaAsignacionAdicionales').empty();
	
	var table=$('.tablaAsignacionAdicionales').DataTable( {
		"ajax": "ajax/datatable-asignacionadiconales.ajax.php?idTipoGasto="+idTipoGasto,
		"processing": true,
		"columnDefs": datosAjax,
		"scrollX": true,
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
	});

	// table.ajax.reload();
}