
$('.tablaGastoAdmin').DataTable( {
    "ajax": "ajax/datatable-gastoadmin.ajax.php",
    "deferRender": true,
	"retrieve": true,
	"processing": true,
	 "language": {

			"sProcessing":     "",
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
			"sLoadingRecords": "Ningún dato disponible en esta tabla",
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
EDITAR GASTO ADMIN
=============================================*/

$(".tablaGastoAdmin tbody").on("click", "button.btnEditarGastoAdmin", function(){

	var idGastoAdmin = $(this).attr("idGastoAdmin");
	
	var datos = new FormData();
    datos.append("idGastoAdmin", idGastoAdmin);

     $.ajax({

      url:"ajax/gastoadmin.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#idGastoAdmin").val(respuesta["idGastoAdmin"]);

           $("#editarDescripcion").val(respuesta["descripcion"]);

		   $("#editarUnidadMedida").val(respuesta["idUnidadMedida"]);

           $("#editarPrecio").val(respuesta["precio"]);

		   $("#editarTipoCosto").val(respuesta["idTipoCosto"]);
      }

  })

})

/*=============================================
ELIMINAR GASTO ADMIN
=============================================*/

$(".tablaGastoAdmin tbody").on("click", "button.btnEliminarGastoAdmin", function(){

	var idGastoAdmin = $(this).attr("idGastoAdmin");

	Swal.fire({

		title: '¿Está seguro de borrar el gasto admin?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar gasto admin!'
        }).then(function(result){
        if (result.value) {

        	window.location = "index.php?ruta=gastoadmin&idGastoAdmin="+idGastoAdmin;

        }


	})

})