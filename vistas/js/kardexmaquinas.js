$('.tablaKardexMaquinas').dataTable( {
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

$(document).on('click','#KardexMaquinas',function() {
	KardexMaquinas();
});  

function KardexMaquinas() {

	$(".tablaKardexMaquinas").dataTable().fnDestroy();
	$(".tablaKardexMaquinas > tbody").empty();
	var MaquinaK = $("#MaquinaK").val();
	var nombreMaquina= $("select option:selected").attr("nombreMaquina");

	table =$('.tablaKardexMaquinas').DataTable( {
		"ajax": "ajax/datatable-kardexmaquinas.ajax.php?MaquinaK="+MaquinaK,
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
			{targets: [5],
				render: function ( ingreso, type, row ) {
					var color = 'dark';
					if (ingreso > 0) {
					  color = 'success';
					}
				  return '<p class="text-' + color + '">' + DataTable.render.number( '.', ',', 2).display(ingreso) + '</button>';
				}
			},
			{targets: [6],
				render: function ( salida, type, row ) {
					var color = 'dark';
					if (salida > 0) {
					  color = 'danger';
					}
				  return '<p class="text-' + color + '">' + DataTable.render.number( '.', ',', 2).display(salida) + '</button>';
				}
			},
			{targets: [7],
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
			title:'Kardex de '+ nombreMaquina,
			filename: 'Kardex de '+ nombreMaquina,
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
			title:'Kardex de '+ nombreMaquina,
			filename: 'Kardex de '+ nombreMaquina,
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
		
				},
			exportOptions: {
				columns: ':visible'
			}
			},
			{
			extend: 'print',
			className: 'btn-info',
			text: "Imprimir",
			title:'Kardex de '+ nombreMaquina,
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
