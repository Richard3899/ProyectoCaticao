
$('.tablaMaquinas').DataTable( {
    "ajax": "ajax/datatable-maquinas.ajax.php",
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
EDITAR MAQUINA
=============================================*/

$(".tablaMaquinas tbody").on("click", "button.btnEditarMaquina", function(){

	var idMaquina = $(this).attr("idMaquina");
	
	var datos = new FormData();
    datos.append("idMaquina", idMaquina);

     $.ajax({

      url:"ajax/maquinas.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#idMaquina").val(respuesta["idMaquina"]);

           $("#editarCodigo").val(respuesta["codigo"]);

		   $("#editarNombre").val(respuesta["nombre"]);

           $("#editarDescripcion").val(respuesta["descripcion"]);

		   $("#editarSerie").val(respuesta["serie"]);

		   $("#editarModelo").val(respuesta["modelo"]);

           $("#editarMarca").val(respuesta["marca"]);

           $("#editarPrecio").val(respuesta["precio"]);

		   $("#editarAñoCompra").val(respuesta["añoCompra"]);

		   $("#editarCapacidad").val(respuesta["capacidad"]);

		   $("#editarPotencia").val(respuesta["potencia"]);

		   $("#editarVidaUtil").val(respuesta["vidaUtil"]);


      }

  })

})

/*=============================================
ELIMINAR MAQUINA
=============================================*/

$(".tablaMaquinas tbody").on("click", "button.btnEliminarMaquina", function(){

	var idMaquina = $(this).attr("idMaquina");
	
	Swal.fire({

		title: '¿Está seguro de borrar el maquina?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar maquina!'
        }).then(function(result){
        if (result.value) {

        	window.location = "index.php?ruta=maquinas&idMaquina="+idMaquina;

        }


	})

})
	
/*=============================================
REVISAR SI EL MAQUINA YA ESTÁ REGISTRADO
=============================================*/

$("#nuevoCodigoMaquina").change(function(){

	$(".alert").remove();

	var maquina = $(this).val();

	var datos = new FormData();
	datos.append("validarCodigo", maquina);

	 $.ajax({
	    url:"ajax/maquinas.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoCodigoMaquina").parent().after('<div class="alert alert-warning">Este código ya existe en la base de datos</div>');

	    		$("#nuevoCodigoMaquina").val("");

	    	}

	    }

	})
})