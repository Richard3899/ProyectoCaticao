
$('.tablaEmpleados').DataTable( {
    "ajax": "ajax/datatable-empleados.ajax.php",
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

		   $("#editarNombre").val(respuesta["nombre"]);

		   $("#editarApellido").val(respuesta["apellido"]);

		   $("#editarUsuarioEmpleado").val(respuesta["idUsuario"]);

		   $("#editarCorreo").val(respuesta["correo"]);

           $("#editarTipoDocumento").val(respuesta["idTipoDocumento"]);

           $("#editarNumeroDocumento").val(respuesta["numeroDocumento"]);

		   $("#editarDireccion").val(respuesta["direccion"]);

		   $("#editarTelefono").val(respuesta["telefono"]);

		   $("#editarFechaNacimiento").val(respuesta["fechaNacimiento"]);

		   $("#editarCargo").val(respuesta["cargo"]);

		   $("#editarHorarioTrabajo").val(respuesta["horarioTrabajo"]);

		   $("#editarHorasPorDia").val(respuesta["horasPorDia"]);

		   $("#editarSueldoPorDia").val(respuesta["sueldoPorDia"]);

		   $("#editarSueldoPorMes").val(respuesta["sueldoPorMes"]);

		   $("#editarTipoCosto").val(respuesta["idTipoCosto"]);


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

$("#nuevoNumeroDocumento").change(function(){

	$(".alert").remove();

	var empleado = $(this).val();

	var datos = new FormData();
	datos.append("validarNumeroDocumento", empleado);

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

	    		$("#nuevoNumeroDocumento").parent().after('<div class="alert alert-warning">Este documento ya existe en la base de datos</div>');

	    		$("#nuevoNumeroDocumento").val("");

	    	}

	    }

	})
})

$("#editarNumeroDocumento").change(function(){

	$(".alert").remove();

	var empleado = $(this).val();

	var datos = new FormData();
	datos.append("validarNumeroDocumento", empleado);

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

	    		$("#editarNumeroDocumento").parent().after('<div class="alert alert-warning">Este documento ya existe en la base de datos</div>');

	    		$("#editarNumeroDocumento").val("");

	    	}

	    }

	})
})