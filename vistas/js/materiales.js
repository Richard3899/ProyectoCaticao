
$('.tablaMateriales').DataTable( {
    "ajax": "ajax/datatable-materiales.ajax.php",
    "deferRender": true,
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
EDITAR MATERIAL
=============================================*/

$(".tablaMateriales tbody").on("click", "button.btnEditarInsumo", function(){

	var idInsumo = $(this).attr("idInsumo");
	
	var datos = new FormData();
    datos.append("idInsumo", idInsumo);

     $.ajax({

      url:"ajax/materiales.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#idInsumo").val(respuesta["idMateria"]);

           $("#editarCodigo").val(respuesta["codigo"]);

		   $("#editarNombre").val(respuesta["nombre"]);

           $("#editarDescripcion").val(respuesta["descripcion"]);

		   $("#editarMarca").val(respuesta["idMarca"]);

		   $("#editarUnidadMedida").val(respuesta["idUnidadMedida"]);

           $("#editarCantidad").val(respuesta["cantidad"]);

           $("#editarPrecio").val(respuesta["precio"]);

           if(respuesta["imagen"] != ""){

           	$("#ImagenInsumoActual").val(respuesta["imagen"]);

           	$(".previsualizar").attr("src",respuesta["imagen"]);

           }

      }

  })

})


/*=============================================
ELIMINAR MATERIAL
=============================================*/

$(".tablaMateriales tbody").on("click", "button.btnEliminarMaterial", function(){

	var idInsumo = $(this).attr("idInsumo");
	var codigo = $(this).attr("codigo");
	var imagen = $(this).attr("imagen");
	
	Swal.fire({

		title: '¿Está seguro de borrar el material?',
		text: "¡Si no lo está puede cancelar la accíón!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar material!'
        }).then(function(result){
        if (result.value) {

        	window.location = "index.php?ruta=materiales&idInsumo="+idInsumo+"&imagen="+imagen+"&codigo="+codigo;

        }


	})

})

/*=============================================
REVISAR SI EL MATERIAL YA ESTÁ REGISTRADO
=============================================*/

$("#nuevoCodigoMaterial").change(function(){

	$(".alert").remove();

	var insumo = $(this).val();

	var datos = new FormData();
	datos.append("validarCodigo", insumo);

	 $.ajax({
	    url:"ajax/materiales.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoCodigoMaterial").parent().after('<div class="alert alert-warning">Este código ya existe en la base de datos</div>');

	    		$("#nuevoCodigoMaterial").val("");

	    	}

	    }

	})
})