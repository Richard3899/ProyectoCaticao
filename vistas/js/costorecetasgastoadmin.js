$('.tablaCostoRecetasGastoAdmin').DataTable( {
    "ajax": "ajax/datatable-costorecetasgastoadmin.ajax.php",
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"}
	  ],
	"retrieve": true,
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

} );


/*=============================================
ELIMINAR COSTO DE RECETAS Y GASTO ADMINISTRATIVO
=============================================*/

$(".tablaCostoRecetasGastoAdmin tbody").on("click", "button.btnEliminarCostoRecetasGastoAdmin", function(){

	var idCostoRecetasGastoAdmin = $(this).attr("idCostoRecetasGastoAdmin");

	Swal.fire({

		title: '¿Está seguro de borrar el costo de recetas y gasto admin?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar costo de recetas y gasto admin!'
        }).then(function(result){
        if (result.value) {

        	window.location = "index.php?ruta=costorecetasgastoadmin&idCostoRecetasGastoAdmin="+idCostoRecetasGastoAdmin;

        }


	})

})