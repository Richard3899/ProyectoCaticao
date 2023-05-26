$('.tablaMesGasto').DataTable( {
    "ajax": "ajax/datatable-mesgasto.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"}
	  ],
	"retrieve": true,
	"processing": true,
	"order": [[2, 'asc']],
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
EDITAR GASTO ADMIN
=============================================*/

$(".tablaMesGasto tbody").on("click", "button.btnEditarMesGasto", function(){

	var idMesGasto = $(this).attr("idMesGasto");
	
	var datos = new FormData();

    datos.append("idMesGasto", idMesGasto);

     $.ajax({

      url:"ajax/mesgasto.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#idMesGasto").val(respuesta["idMesGasto"]);

		   $("#editarDescripcion").val(respuesta["descripcion"]);

      }

  })

})


/*=============================================
ELIMINAR MES GASTO
=============================================*/

$(".tablaMesGasto tbody").on("click", "button.btnEliminarMesGasto", function(){

	var idMesGasto = $(this).attr("idMesGasto");

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

        	window.location = "index.php?ruta=mesgasto&idMesGasto="+idMesGasto;

        }


	})

})

/*=============================================
REVISAR SI EL MES YA ESTÁ REGISTRADO
=============================================*/

$("#nuevoMes").change(function(){

	$(".alert").remove();

	var mes = $(this).val();

	var datos = new FormData();
	datos.append("validarFecha", mes+"-01");

	 $.ajax({
	    url:"ajax/mesgasto.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoMes").parent().after('<div class="alert alert-warning">Este mes ya está registrado</div>');

	    		$("#nuevoMes").val("");

	    	}

	    }

	})
})

/*=============================================
CERRAR MES
=============================================*/

$(".tablaMesGasto tbody").on("click", "button.btnCerrarMes", function(){

	var idMesGasto = $(this).attr("idMesGasto");

	Swal.fire({

		title: '¿Está seguro de cerrar el mes?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, cerrar mes!'
        }).then(function(result){
        if (result.value) {

			window.location = "index.php?ruta=mesgasto&idMGasto="+idMesGasto;

        }

	})

})

/*=============================================
OCULTAR MES
=============================================*/

$(".tablaMesGasto tbody").on("click", "button.btnOcultarMes", function(){

	var idMesGasto = $(this).attr("idMesGasto");

	Swal.fire({

		title: '¿Está seguro de ocultar el mes?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, ocultar mes!'
        }).then(function(result){
        if (result.value) {

			window.location = "index.php?ruta=mesgasto&idM2Gasto="+idMesGasto;

        }

	})

})