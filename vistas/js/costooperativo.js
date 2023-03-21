
$('.tablaCostoOperativo').DataTable( {
    "ajax": "ajax/datatable-costooperativo.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"},
		//Tipo de dato (Número)
		{targets:[3], render: DataTable.render.number( '.', ',', 2, 'S/ ')}
	  ],
	"retrieve": true,
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
		}

}

} );


/*=============================================
EDITAR COSTOS OPERATIVOS
=============================================*/

$(".tablaCostoOperativo tbody").on("click", "button.btnEditarCostoOperativo", function(){

	var idCostoOperativo = $(this).attr("idCostoOperativo");
	
	var datos = new FormData();
    datos.append("idCostoOperativo", idCostoOperativo);

     $.ajax({

      url:"ajax/costooperativo.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#idCostoOperativo").val(respuesta["idGastoAdmin"]);

           $("#editarDescripcion").val(respuesta["descripcion"]);

		   $("#editarUnidadMedida").val(respuesta["idUnidadMedida"]);

           $("#editarPrecio").val(respuesta["precio"]);

		   $("#editarTipoCosto").val(respuesta["idTipoCosto"]);
      }

  })

})

/*=============================================
ELIMINAR COSTOS OPERATIVOS
=============================================*/

$(".tablaCostoOperativo tbody").on("click", "button.btnEliminarCostoOperativo", function(){

	var idCostoOperativo = $(this).attr("idCostoOperativo");

	Swal.fire({

		title: '¿Está seguro de borrar el costo operativo?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar costo operativo!'
        }).then(function(result){
        if (result.value) {

        	window.location = "index.php?ruta=costooperativo&idCostoOperativo="+idCostoOperativo;

        }


	})

})