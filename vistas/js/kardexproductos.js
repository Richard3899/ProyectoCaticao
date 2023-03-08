$('.tablaKardexProductos').dataTable( {
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
	$("#lote").keyup(function(){
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
		$("#lote").val('')
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
	var nombreProducto= $("select option:selected").attr("nombreProducto");

	table =$('.tablaKardexProductos').DataTable( {
		"ajax": "ajax/datatable-kardexproductos.ajax.php?ProductoK="+ProductoK,
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
			{targets: [6],
				render: function ( ingreso, type, row ) {
					var color = 'dark';
					if (ingreso > 0) {
					  color = 'success';
					}
				  return '<p class="text-' + color + '">' + DataTable.render.number( '.', ',', 2).display(ingreso) + '</button>';
				}
			},
			{targets: [7],
				render: function ( salida, type, row ) {
					var color = 'dark';
					if (salida > 0) {
					  color = 'danger';
					}
				  return '<p class="text-' + color + '">' + DataTable.render.number( '.', ',', 2).display(salida) + '</button>';
				}
			},
			{targets: [8],
				render: function ( saldo, type, row ) {
					var color = 'dark';
					if (saldo > 0) {
					  color = 'primary';
					}
				  return '<p class="text-' + color + '">' + DataTable.render.number( '.', ',', 2).display(saldo) + '</button>';
				}
			}
		  ],
		  "buttons": [{
			extend: 'pdf',
			className: 'btn-danger',
			text: "PDF",
			title:'Kardex de '+ nombreProducto,
			filename: 'Kardex de '+ nombreProducto,
			exportOptions: {
				columns: ':visible'
			},
			customize: function (doc) {
				doc.styles.tableHeader.fontSize = 10;
				doc.defaultStyle.alignment = 'center';
				doc.content[1].table.widths ="*";
	
				var tableNode;
				for (i = 0; i < doc.content.length; ++i) {
				  if(doc.content[i].table !== undefined){
					tableNode = doc.content[i];
					break;
				  }
				}
	
				var rowIndex = 0;
				var tableColumnCount = tableNode.table.body[rowIndex].length;
				if(tableColumnCount > 5){
				  doc.pageOrientation = 'landscape';
				}
			}
		
			},
			{
			extend: 'excel',
			className: 'btn-success',
			text: "Excel",
			title:'Kardex de '+ nombreProducto,
			filename: 'Kardex de '+ nombreProducto,
			customize: function( xlsx ) {
					var sheet = xlsx.xl.worksheets['sheet1.xml'];
					//Centrar al exportar en Excel
					 $('row c[r^="A"]', sheet).attr( 's', '51' );
					 $('row c[r^="B"]', sheet).attr( 's', '51' );
					 $('row c[r^="C"]', sheet).attr( 's', '51' );
					 $('row c[r^="D"]', sheet).attr( 's', '51' );
					 $('row c[r^="E"]', sheet).attr( 's', '67' );
					 $('row c[r^="F"]', sheet).attr( 's', '51' );
					 $('row c[r^="G"]', sheet).attr( 's', '51' );
					 $('row c[r^="H"]', sheet).attr( 's', '51' );
					 $('row c[r^="I"]', sheet).attr( 's', '51' );
		
				},
			exportOptions: {
				columns: ':visible'
			}
			},
			{
			extend: 'print',
			className: 'btn-info',
			text: "Imprimir",
			title:'Kardex de '+ nombreProducto,
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


