
$('.tablaGastoAdmin').DataTable( {
    "ajax": "ajax/datatable-gastoadmin.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
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
EDITAR GASTO
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

		   $("#editarCodigoGasto").val(respuesta["codigo"]);

           $("#editarDescripcion").val(respuesta["descripcion"]);

		   $("#editarUnidadMedida").val(respuesta["idUnidadMedida"]);

		   $("#editarTipoCosto").val(respuesta["idTipoCosto"]);

		   $("#editarTipoGasto").val(respuesta["idTipoGasto"]);
      }

  })

})

/*=============================================
ELIMINAR GASTO
=============================================*/

$(".tablaGastoAdmin tbody").on("click", "button.btnEliminarGastoAdmin", function(){

	var idGastoAdmin = $(this).attr("idGastoAdmin");

	Swal.fire({

		title: '¿Está seguro de borrar el gasto?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar gasto!'
        }).then(function(result){
        if (result.value) {

        	window.location = "index.php?ruta=gastoadmin&idGastoAdmin="+idGastoAdmin;

        }


	})

})

/*=============================================
REVISAR SI EL GASTO YA ESTÁ REGISTRADO
=============================================*/

$("#nuevoCodigoGasto").change(function(){

	$(".alert").remove();

	var gasto = $(this).val();

	var datos = new FormData();
	datos.append("validarCodigo", gasto);

	 $.ajax({
	    url:"ajax/gastoadmin.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoCodigoGasto").parent().after('<div class="alert alert-warning">Este código ya existe en la base de datos</div>');

	    		$("#nuevoCodigoGasto").val("");

	    	}

	    }

	})
})