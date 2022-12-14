window.onload = function(){ 

	$('.tablaKardexInsumos').dataTable( {
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
	
	
	$(document).on('click','#KardexInsumos',function() {
		KardexInsumos()
	});    
	
	function KardexInsumos() {
	
		$(".tablaKardexInsumos").dataTable().fnDestroy();
		$(".tablaKardexInsumos > tbody").empty();
		var InsumoK = $("#InsumoK").val();
	
		table =$('.tablaKardexInsumos').DataTable( {
			"ajax": "ajax/datatable-kardexinsumos.ajax.php?InsumoK="+InsumoK,
			"deferRender": true,
			"columnDefs": [
				{"className": "dt-center", "targets": "_all",
				"targets": '_all',
				"sortable": false,
				"createdCell": function (td) {
				    $(td).css('padding', '3px')
					
				}}
			  ],
			"deferLoading": 0,        
			"retrieve": true,
			"searching": true,
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
	
  
};