/*=============================================
TABLA REPORTE INSUMOS
=============================================*/
var table;

table = $("#tablaReporteInsumos").DataTable({
	"ajax": "ajax/datatable-reporteinsumos.ajax.php",
	"dom": 'Brti',
    "buttons": [{
		extend: 'pdf',
		text: "PDF",
		title:'Reporte Insumos',
		filename: 'Reporte Insumos',
		exportOptions: {
			columns: ':visible'
		},
		customize: function (doc) {
			doc.styles.tableHeader.fontSize = 10;
			doc.defaultStyle.alignment = 'center';
			doc.content[1].table.widths = "*";
		}
	
	    },
		{
		extend: 'excel',
		text: "Excel",
		title:'Reporte Insumos',
		filename: 'Reporte Insumos',
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
	
            },
		exportOptions: {
			columns: ':visible'
		}
	    },
		{
		extend: 'print',
		text: "Imprimir",
		title:'Reporte Insumos',
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
	    },{
			extend: 'pageLength',
			text: "Registros"
			}],
    "deferRender": true,
	"ordering": false,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"},
		//Tipo de dato (Número)
		{targets:[6], render: DataTable.render.number( ',', '.', 2, 'S/' )}
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


    /*===================================================================*/
    // EVENTOS PARA CRITERIOS DE BUSQUEDA (CODIGO, CATEGORIA Y PRODUCTO)
    /*===================================================================*/
    $("#codigo").keyup(function(){
        table.column($(this).data('index')).search(this.value).draw();
    })
    $("#nombre").keyup(function(){
        table.column($(this).data('index')).search(this.value).draw();
    })
    $("#descripcion").keyup(function(){
        table.column($(this).data('index')).search(this.value).draw();
    })
	$("#unidadMedida").keyup(function(){
        table.column($(this).data('index')).search(this.value).draw();
    })
	$("#marca").keyup(function(){
        table.column($(this).data('index')).search(this.value).draw();
    })
	$("#precioUnitario").keyup(function(){
        table.column($(this).data('index')).search(this.value).draw();
    })

    $("#iptPrecioVentaDesde, #iptPrecioVentaHasta").keyup(function(){
        table.draw();
    })
    // $.fn.dataTable.ext.search.push(
    //     function(settings, data, dataIndex){
    //         var precioDesde = parseFloat($("#iptPrecioVentaDesde").val());
    //         var precioHasta = parseFloat($("#iptPrecioVentaHasta").val());
    //         var col_venta = parseFloat(data[7]);
    //         if((isNaN(precioDesde) && isNaN(precioHasta)) ||
    //             (isNaN(precioDesde) && col_venta <=  precioHasta) ||
    //             (precioDesde <= col_venta && isNaN(precioHasta)) ||
    //             (precioDesde <= col_venta && col_venta <= precioHasta)){
    //                 return true;
    //         }
    //         return false;
    //     }
    // )

    $("#btnLimpiarBusqueda").on('click',function(){
        $("#codigo").val('')
        $("#nombre").val('')
        $("#descripcion").val('')
		$("#unidadMedida").val('')
		$("#marca").val('')
		$("#precioUnitario").val('')
        $("#iptPrecioVentaDesde").val('')
        $("#iptPrecioVentaHasta").val('')
        table.search('').columns().search('').draw();
    })
