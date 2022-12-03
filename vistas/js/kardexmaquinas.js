$('.tablaKardexMaquinas').dataTable( {
	"searching": false,
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

$(document).on('click','#KardexMaquinas',function() {
	KardexMaquinas();
});  

function KardexMaquinas() {

	$(".tablaKardexMaquinas").dataTable().fnDestroy();
	$(".tablaKardexMaquinas > tbody").empty();
	var MaquinaK = $("#MaquinaK").val();

	table =$('.tablaKardexMaquinas').DataTable( {
		"ajax": "ajax/datatable-kardexmaquinas.ajax.php?MaquinaK="+MaquinaK,
		"deferRender": true,
		"columnDefs": [
			{"className": "dt-center", "targets": "_all",
			"targets": '_all',
			"createdCell": function (td, cellData, rowData, row, col) {
				$(td).css('padding', '3px')
			}}
		  ],
		"deferLoading": 0,        
		"retrieve": true,
		"searching": false,
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
	
	});

  }
