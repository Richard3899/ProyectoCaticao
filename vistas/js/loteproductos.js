$('.tablaLoteProductos').dataTable( {
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

$(document).on('click','#LoteProductos',function() {

	if($("#ProductoL").val()==0){
		Swal.fire({
			icon: "error",
			title: "Seleccionar Producto",
			showConfirmButton: false,
			timer: 2000
		  })
	}else{

	LoteProductos()

	/*===================================================================*/
	// EVENTOS PARA CRITERIOS DE BUSQUEDA
	/*===================================================================*/

	$("#lote").keyup(function(){
		table.column($(this).data('index')).search(this.value).draw();
	})
	
	$(document).ready(function() {
		// Create date inputs
		minDate = new DateTime($('#fechaVencimiento'));
	});

	$("#fechaVencimiento").on('change',function(){
		table.column($(this).data('index')).search(this.value).draw();
	})

	$("#btnLimpiarBusqueda").on('click',function(){

		$("#lote").val('')
		$("#fechaVencimiento").val('')

		table.search('').columns().search('').draw();
		
	})
		
	}

});    

function LoteProductos() {

	$(".tablaLoteProductos").dataTable().fnDestroy();
	$(".tablaLoteProductos > tbody").empty();
	var ProductoL = $("#ProductoL").val();

	table =$('.tablaLoteProductos').DataTable( {
		"ajax": "ajax/datatable-loteproductos.ajax.php?ProductoL="+ProductoL,
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


