/*=============================================
TABLA COSTO TOTAL
=============================================*/
var idRecetaC = $("#idReceta").val();
var codigo = $("#codigo").val();

$("#tablaCostoTotal").DataTable({
	"ajax": "ajax/datatable-costototal.ajax.php?idRecetaC="+idRecetaC,
	"dom": 'Bfrtip',
	"searching": false,
	"paging": false,
    "buttons": [{
		extend: 'pdf',
		className: 'btn-danger',
		text: "PDF",
		title:'Costo total de la Receta - '+codigo,
		filename: "Costo total de la Receta - "+codigo,
		exportOptions: {
			columns: ':visible'
		},
		customize: function (doc) {
			doc.styles.tableHeader.fontSize = 10;
			doc.defaultStyle.alignment = 'center';
			doc.content[1].table.widths = "*";
            // Posición en de los datos en cada columna
			var rowCount = doc.content[1].table.body.length;
			for (i = 1; i < rowCount; i++) {
			doc.content[1].table.body[i][0].alignment = 'left';
			}
		}
	
	    },
		{
		extend: 'excel',
		className: 'btn-success',
		text: "Excel",
		title:'Costo total de la Receta - '+codigo,
		filename: "Costo total de la Receta - "+codigo,
		customize: function( xlsx ) {
                var sheet = xlsx.xl.worksheets['sheet1.xml'];
				//Centrar al exportar en Excel
 				$('row c[r^="A"]', sheet).attr( 's', '51' );
                $('row c[r^="B"]', sheet).attr( 's', '51' );
				$('row c[r^="C"]', sheet).attr( 's', '51' );
				$('row c[r^="D"]', sheet).attr( 's', '52' );
	
            },
		exportOptions: {
			columns: ':visible'
		}
	    },
		{
		extend: 'print',
		className: 'btn-info',
		text: "Imprimir",
		title:'Costo total de la Receta - '+codigo,
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
    "deferRender": true,
	"ordering": false,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"},
		//Tipo de dato (Número)
		{targets:[3], render: DataTable.render.number( ',', '.', 2, 'S/' )},
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