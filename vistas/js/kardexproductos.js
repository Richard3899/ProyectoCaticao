$('.tablaKardexProductos').dataTable( {
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


$(document).on('click','#KardexProductos',function() {

	if($("#ProductoK").val()==0){
		Swal.fire({
			icon: "error",
			title: "Seleccionar Producto",
			showConfirmButton: false,
			timer: 2000
		  })
	}else{

		KardexProductos()

		$.fn.dataTable.ext.search.push(
			function(settings, aData, iDataIndex) {
				if ( settings.nTable.id !== 'tablaKardexProductos' ) {
						return true;
						}
				var dateIni = $('#min').val();
				var dateFin = $('#max').val();
		
				var indexCol = 4;
		
				dateIni = dateIni?.replace(/-/g, "");
				dateFin= dateFin?.replace(/-/g, "");
		
				var dateCol = aData[indexCol]?.replace(/-/g, "");
		
				if (dateIni === "" && dateFin === "")
				{
					return true;
				}
		
				if(dateIni === "")
				{
					return dateCol <= dateFin;
				}
		
				if(dateFin === "")
				{
					return dateCol >= dateIni;
				}
		
				return dateCol >= dateIni && dateCol <= dateFin;
			}
		);

	/*===================================================================*/
	// EVENTOS PARA CRITERIOS DE BUSQUEDA
	/*===================================================================*/
	$("#transaccion").keyup(function(){
		table.column($(this).data('index')).search(this.value).draw();
	})
	$("#descripcion").keyup(function(){
		table.column($(this).data('index')).search(this.value).draw();
	})
	
	$(document).ready(function() {
		// Create date inputs
		minDate = new DateTime($('#min'));
		maxDate = new DateTime($('#max'));
		// Refilter the table
		$('#min, #max').on('change', function () {
			table.draw();			
		});
	});

	$("#btnLimpiarBusqueda").on('click',function(){

		$("#transaccion").val('')
		$("#descripcion").val('')
		$("#min").val('')
		$("#max").val('')

		table.search('').columns().search('').draw();
		
	})
		
	}

});    

function KardexProductos() {

	$(".tablaKardexProductos").dataTable().fnDestroy();
	$(".tablaKardexProductos > tbody").empty();
	var ProductoK = $("#ProductoK").val();

	table =$('.tablaKardexProductos').DataTable( {
		"ajax": "ajax/datatable-kardexproductos.ajax.php?ProductoK="+ProductoK,
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


