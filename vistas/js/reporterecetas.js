/*=============================================
TABLA REPORTE RECETAS
=============================================*/
var tableReporteRecetas;

tableReporteRecetas = $("#tablaReporteRecetas").DataTable({
	"ajax": "ajax/datatable-reporterecetas.ajax.php",
	"dom": 'Brtip',
    "buttons": [{
		extend: 'pdf',
		className: 'btn-danger',
		text: "PDF",
		title:'Reporte Recetas',
		filename: 'Reporte Recetas',
		exportOptions: {
			columns: ':visible'
		},
		customize: function (doc) {
			doc.styles.tableHeader.fontSize = 10;
			// doc.defaultStyle.fontSize = 8;
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
		extend: 'excelHtml5',
		className: 'btn-success',
		text: "Excel",
		title:'Reporte Recetas',
		filename: 'Reporte Recetas',
		customize: function( xlsx ) {
                var sheet = xlsx.xl.worksheets['sheet1.xml'];
				//Centrar al exportar en Excel
 				$('row c[r^="A"]', sheet).attr( 's', '51' );
                $('row c[r^="B"]', sheet).attr( 's', '51' );
				$('row c[r^="C"]', sheet).attr( 's', '51' );
				$('row c[r^="D"]', sheet).attr( 's', '51' );
				$('row c[r^="E"]', sheet).attr( 's', '51' );
                $('row c[r^="F"]', sheet).attr( 's', '51' );
				$('row c[r^="G"]', sheet).attr( 's', '51' );
				$('row c[r^="H"]', sheet).attr( 's', '51' );
				$('row c[r^="I"]', sheet).attr( 's', '51' );
				$('row c[r^="J"]', sheet).attr( 's', '51' );
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
		title:'Reporte Recetas',
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
		{targets: [5,6],  render: DataTable.render.moment('DD/MM/YYYY') },
	    {targets:[8,9], render: DataTable.render.number('.', ',', 2, 'S/ ')}
	  ],
	"processing": true,
	"order": [[0, 'desc']],
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
			tableReporteRecetas.column($(this).data('index')).search(this.value).draw();
		})
		$("#nombre").keyup(function(){
			tableReporteRecetas.column($(this).data('index')).search(this.value).draw();
		})
		$("#producto").keyup(function(){
			tableReporteRecetas.column($(this).data('index')).search(this.value).draw();
		})
		$("#lote").keyup(function(){
			tableReporteRecetas.column($(this).data('index')).search(this.value).draw();
		})
	
		$("#btnLimpiarBusquedaRecetas").on('click',function(){
			$("#codigo").val('')
			$("#nombre").val('')
			$("#producto").val('')
			$("#lote").val('')

			tableReporteRecetas.search('').columns().search('').draw();
		})

	


