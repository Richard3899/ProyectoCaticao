
$('.tablaEmpleados').DataTable( {
    "ajax": "ajax/datatable-empleados.ajax.php",
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
EDITAR EMPLEADO
=============================================*/

$(".tablaEmpleados tbody").on("click", "button.btnEditarEmpleado", function(){

	var idEmpleado = $(this).attr("idEmpleado");
	
	var datos = new FormData();
    datos.append("idEmpleado", idEmpleado);

     $.ajax({

      url:"ajax/empleados.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#idEmpleado").val(respuesta["idEmpleado"]);

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
ELIMINAR EMPLEADO
=============================================*/

$(".tablaEmpleados tbody").on("click", "button.btnEliminarEmpleado", function(){

	var idEmpleado = $(this).attr("idEmpleado");
	
	Swal.fire({

		title: '¿Está seguro de borrar el empleado?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar empleado!'
        }).then(function(result){
        if (result.value) {

        	window.location = "index.php?ruta=empleados&idEmpleado="+idEmpleado;

        }


	})

})
	
/*=============================================
REVISAR SI EL EMPLEADO YA ESTÁ REGISTRADO
=============================================*/

$("#nuevoCodigoEmpleado").change(function(){

	$(".alert").remove();

	var empleado = $(this).val();

	var datos = new FormData();
	datos.append("validarCodigo", empleado);

	 $.ajax({
	    url:"ajax/empleados.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoCodigoEmpleado").parent().after('<div class="alert alert-warning">Este código ya existe en la base de datos</div>');

	    		$("#nuevoCodigoEmpleado").val("");

	    	}

	    }

	})
})