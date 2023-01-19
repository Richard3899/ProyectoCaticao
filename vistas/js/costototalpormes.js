/*=============================================
TABLA COSTO TOTAL POR MES
=============================================*/
var idCostoRecetasGastoAdmin = $("#idCostoRecetasGastoAdmin").val();
var mes = $("#mes").val();
var descripcion = $("#descripcion").val();

$("#tablaCostoTotalPorMes").DataTable({
	"ajax": "ajax/datatable-costototalpormes.ajax.php?idCostoRecetasGastoAdmin="+idCostoRecetasGastoAdmin+"&mes="+mes,
	"dom": 'Bfrtip',
	"searching": false,
	"paging": false,
    "buttons": [{
		extend: 'pdf',
		text: "PDF",
		title:'Costo total de : '+descripcion,
		filename: 'Costo total de : '+descripcion,
		exportOptions: {
			columns: ':visible'
		},
		customize: function (doc) {
			doc.styles.tableHeader.fontSize = 11;
			doc.defaultStyle.alignment = 'center';
			doc.content[1].table.widths = [ '*', '*'];
		}
	
	    },
		{
		extend: 'excel',
		text: "Excel",
		title:'Costo total de : '+descripcion,
		filename: "Costo total de : "+descripcion,
		customize: function( xlsx ) {
                var sheet = xlsx.xl.worksheets['sheet1.xml'];
				//Centrar al exportar en Excel
 				 $('row c[r^="A"]', sheet).attr( 's', '51' );
				 $('row c[r^="B"]', sheet).attr( 's', '52' );
	
            },
		exportOptions: {
			columns: ':visible'
		}
	    },
		{
		extend: 'print',
		text: "Imprimir",
		title:'Costo total de : '+descripcion,
		exportOptions: {
			columns: ':visible'
		},
		customize: function (win) {
			$(win.document.body).find('h1').css('text-align','center');
		}
	    },
		{
		extend: 'colvis',
		text: "Columnas Visibles"
	    }],
    "deferRender": true,
	"ordering": false,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"},
		//Tipo de dato (Número)
	
		{targets:[1], render: DataTable.render.number( ',', '.', 2, 'S/' )}
	  ],
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
		}}
  });

