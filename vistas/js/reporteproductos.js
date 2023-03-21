/*=============================================
TABLA REPORTE PRODUCTOS
=============================================*/
var tableReporteProductos;

tableReporteProductos = $("#tablaReporteProductos").DataTable({
	"ajax": "ajax/datatable-reporteproductos.ajax.php",
	"dom": 'Brtip',
    "buttons": [{
		extend: 'pdf',
		className: 'btn-danger',
		text: "PDF",
		title:'Reporte Productos',
		filename: 'Reporte Productos',
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
		title:'Reporte Productos',
		filename: 'Reporte Productos',
		customize: function( xlsx ) {
                var sheet = xlsx.xl.worksheets['sheet1.xml'];
				//Centrar al exportar en Excel
 				$('row c[r^="A"]', sheet).attr( 's', '51' );
                $('row c[r^="B"]', sheet).attr( 's', '51' );
				$('row c[r^="C"]', sheet).attr( 's', '51' );
				$('row c[r^="D"]', sheet).attr( 's', '51' );
				$('row c[r^="E"]', sheet).attr( 's', '51' );
                $('row c[r^="F"]', sheet).attr( 's', '51' );

	
            },
		exportOptions: {
			columns: ':visible',
			orthogonal: 'exportxls'
		}
	    },
		{
		extend: 'print',
		className: 'btn-info',
		text: "Imprimir",
		title:'Reporte Productos',
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
	    },{
		extend: 'pageLength',
		className: 'btn-secondary',
		text: "Registros"
		}],
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"},
		//Tipo de dato (Número)
		{targets:[5], render: DataTable.render.number( '.', ',', 2)}
	  ],
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
		}}
  });

	
		/*===================================================================*/
		// EVENTOS PARA CRITERIOS DE BUSQUEDA
		/*===================================================================*/
		$("#codigo").keyup(function(){
			tableReporteProductos.column($(this).data('index')).search(this.value).draw();
		})
		$("#nombre").keyup(function(){
			tableReporteProductos.column($(this).data('index')).search(this.value).draw();
		})
		$("#descripcion").keyup(function(){
			tableReporteProductos.column($(this).data('index')).search(this.value).draw();
		})
		$("#unidadMedida").keyup(function(){
			tableReporteProductos.column($(this).data('index')).search(this.value).draw();
		})
		$("#stockDesde, #stockHasta").keyup(function(){
			tableReporteProductos.draw();
		})
		$.fn.dataTable.ext.search.push(
			function(settings, data, dataIndex){
				if ( settings.nTable.id !== 'tablaReporteProductos' ) {
					return true;
					}
				var stockDesde = parseFloat($("#stockDesde").val());
				var stockHasta = parseFloat($("#stockHasta").val());
				var col_stock = parseFloat(data[5]);
				if((isNaN(stockDesde) && isNaN(stockHasta)) ||
					(isNaN(stockDesde) && col_stock <=  stockHasta) ||
					(stockDesde <= col_stock && isNaN(stockHasta)) ||
					(stockDesde <= col_stock && col_stock <= stockHasta)){
					return true;
				}
				return false;

		} 
		)
	
		$("#btnLimpiarBusquedaProductos").on('click',function(){
			$("#codigo").val('')
			$("#nombre").val('')
			$("#descripcion").val('')
			$("#unidadMedida").val('')
			$("#stockDesde").val('')
			$("#stockHasta").val('')
			
			tableReporteProductos.search('').columns().search('').draw();
		})

	


