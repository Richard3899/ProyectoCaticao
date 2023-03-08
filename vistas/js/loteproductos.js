$('.tablaLoteProductos').dataTable( {
	"searching": false,
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
	var nombreProducto= $("select option:selected").attr("nombreProducto");

	table =$('.tablaLoteProductos').DataTable( {
		"ajax": "ajax/datatable-loteproductos.ajax.php?ProductoL="+ProductoL,
		"dom": 'Brtip',
		"processing": true,
		"columnDefs": [
			{"className": "dt-center", "targets": "_all",
			"targets": '_all',
			"sortable": false,
			"createdCell": function (td) {
				$(td).css('padding', '3px')
				
			}},
			//Tipo de dato (Número)
			{targets:[3], render: DataTable.render.number( '.', ',', 2)}
		  ],
		  "buttons": [{
			extend: 'pdf',
			className: 'btn-danger',
			text: "PDF",
			title:'Lote de '+ nombreProducto,
			filename: 'Lote de '+ nombreProducto,
			exportOptions: {
				columns: ':visible'
			},
			customize: function (doc) {
				doc.styles.tableHeader.fontSize = 10;
				doc.defaultStyle.alignment = 'center';
				doc.content[1].table.widths ="*";
			}
		
			},
			{
			extend: 'excel',
			className: 'btn-success',
			text: "Excel",
			title:'Lote de '+ nombreProducto,
			filename: 'Lote de '+ nombreProducto,
			customize: function( xlsx ) {
					var sheet = xlsx.xl.worksheets['sheet1.xml'];
					//Centrar al exportar en Excel
					 $('row c[r^="A"]', sheet).attr( 's', '51' );
					 $('row c[r^="B"]', sheet).attr( 's', '51' );
					 $('row c[r^="C"]', sheet).attr( 's', '67' );
					 $('row c[r^="D"]', sheet).attr( 's', '51' );
				},
			exportOptions: {
				columns: ':visible'
			}
			},
			{
			extend: 'print',
			className: 'btn-info',
			text: "Imprimir",
			title:'Lote de '+ nombreProducto,
			exportOptions: {
				columns: ':visible'
			},
			customize: function (win) {
				$(win.document.body).find('h1').css('text-align','center');
			}
			},
			{
			extend: 'colvis',
			className: 'btn-secondary',
			text: "Columnas Visibles"
			}],  
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


