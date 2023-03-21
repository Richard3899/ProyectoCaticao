
$('.tablaEmpleados').DataTable( {
    "ajax": "ajax/datatable-empleados.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"},
		//Tipo de dato (Número)
		{targets:[9],  render: DataTable.render.moment('DD/MM/YYYY') },
		{targets:[12], render: DataTable.render.number( '.', ',', 2)},
		{targets:[13], render: DataTable.render.number( '.', ',', 2, 'S/ ')},
		{targets:[14], render: DataTable.render.number( '.', ',', 2, 'S/ ')}
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


$(document).ready(function() {
	// Create date inputs
	new DateTime($('#editarFechaNacimiento'), {
		format: 'DD/MM/YYYY'
	});
	new DateTime($('#nuevaFechaNacimiento'), {
		format: 'DD/MM/YYYY'
	});
});

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

		   $("#editarFechaNacimiento").val(moment(respuesta["fechaNacimiento"],'YYYY-MM-DD').format('DD/MM/YYYY'));
  
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