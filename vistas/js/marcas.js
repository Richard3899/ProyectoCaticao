
$('.tablaMarcas').DataTable( {
    "ajax": "ajax/datatable-marcas.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
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
EDITAR MARCAS
=============================================*/

$(".tablaMarcas tbody").on("click", "button.btnEditarMarca", function(){

	var idMarca = $(this).attr("idMarca");
	
	var datos = new FormData();
    datos.append("idMarca", idMarca);

     $.ajax({

      url:"ajax/marcas.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#idMarca").val(respuesta["idMarca"]);

           $("#editarDescripcionMarca").val(respuesta["descripcion"]);

		
        }

    })
})


/*=============================================
ELIMINAR MARCA
=============================================*/

$(".tablaMarcas tbody").on("click", "button.btnEliminarMarca", function(){

	var idMarca = $(this).attr("idMarca");
	
	Swal.fire({

		title: '¿Está seguro de borrar la marca?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar marca!'
        }).then(function(result){
        if (result.value) {

        	window.location = "index.php?ruta=marcas&idMarca="+idMarca;

        }


	})

})

	
/*=============================================
REVISAR SI LA MARCA YA ESTÁ REGISTRADO
=============================================*/

$("#nuevaDescripcionMarca").change(function(){

	$(".alert").remove();

	var marca = $(this).val();

	var datos = new FormData();
	datos.append("validarDescripcion", marca);

	 $.ajax({
	    url:"ajax/marcas.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevaDescripcionMarca").parent().after('<div class="alert alert-warning">Esta marca ya existe en la base de datos</div>');

	    		$("#nuevaDescripcionMarca").val("");

	    	}

	    }

	})
})


/*=============================================
REVISAR SI LA MARCA YA ESTÁ REGISTRADO
=============================================*/

$("#editarDescripcionMarca").change(function(){

	$(".alert").remove();

	var marca = $(this).val();

	var datos = new FormData();
	datos.append("validarDescripcion", marca);

	 $.ajax({
	    url:"ajax/marcas.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#editarDescripcionMarca").parent().after('<div class="alert alert-warning">Esta marca ya existe en la base de datos</div>');

	    		$("#editarDescripcionMarca").val("");

	    	}

	    }

	})
})
