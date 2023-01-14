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
		text: "PDF",
		title:'Costo total de la Receta - '+codigo,
		filename: "Costo total de la Receta - "+codigo,
		exportOptions: {
			columns: ':visible'
		},
		customize: function (doc) {
			doc.styles.tableHeader.fontSize = 11;
			doc.defaultStyle.alignment = 'center';
			doc.content[1].table.widths = [ '*', '*','*','*'];
            // Posición en de los datos en cada columna
			var rowCount = doc.content[1].table.body.length;
			for (i = 1; i < rowCount; i++) {
			doc.content[1].table.body[i][0].alignment = 'left';
			}
		}
	
	    },
		{
		extend: 'excel',
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


/*=============================================
EDITAR COSTO TOTAL
=============================================*/

$(".tablaCostoTotal tbody").on("click", "button.btnEditarCostoTotal", function(){

	var idCostoTotal = $(this).attr("idCostoTotal");
	
	var datos = new FormData();
    datos.append("idCostoTotal", idCostoTotal);

     $.ajax({

      url:"ajax/costototal.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#idCostoTotal").val(respuesta["idGastoAdmin"]);

           $("#editarDescripcion").val(respuesta["descripcion"]);

		   $("#editarUnidadMedida").val(respuesta["idUnidadMedida"]);

           $("#editarPrecio").val(respuesta["precio"]);

		   $("#editarTipoCosto").val(respuesta["idTipoCosto"]);
      }

  })

})

/*=============================================
ELIMINAR COSTO TOTAL
=============================================*/

$(".tablaCostoTotal tbody").on("click", "button.btnEliminarCostoTotal", function(){

	var idCostoTotal = $(this).attr("idCostoTotal");

	Swal.fire({

		title: '¿Está seguro de borrar el costo de venta?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar costo de venta!'
        }).then(function(result){
        if (result.value) {

        	window.location = "index.php?ruta=costototal&idCostoTotal="+idCostoTotal;

        }


	})

})