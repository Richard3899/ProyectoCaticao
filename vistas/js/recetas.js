
$('.tablaRecetas').DataTable( {
    "ajax": "ajax/datatable-recetas.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
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
EDITAR RECETA
=============================================*/

$(".tablaRecetas tbody").on("click", "button.btnEditarReceta", function(){

	var codigoLote = $(this).attr("codigoLote");
	
	var datos = new FormData();
	datos.append("codigoLote", codigoLote);

	 $.ajax({
  
	  url:"ajax/recetas.ajax.php",
	  method: "POST",
	  data: datos,
	  cache: false,
	  contentType: false,
	  processData: false,
	  dataType:"json",
	  success:function(respuesta){
  
		$idLote=respuesta["idLote"];
  
		$codigoLote=respuesta["codigoLote"];

		$fechaVencimiento=respuesta["fechaVencimiento"];

		$idProducto=respuesta["idProducto"];

		$("#idLote").val($idLote);
  
		$("#editarCodigoLote").val($codigoLote);

		$("#editarFechaVencimiento").val($fechaVencimiento);

		$("#editaridProducto").val($idProducto);
  
	  }
  
  })
	
	
	var idReceta = $(this).attr("idReceta");
	
	var datos = new FormData();
    datos.append("idReceta", idReceta);

     $.ajax({

      url:"ajax/recetas.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#idReceta").val(respuesta["idReceta"]);

           $("#editarCodigoReceta").val(respuesta["codigo"]);

		   $("#editarNombre").val(respuesta["nombre"]);

           $("#editarBatch").val(respuesta["batch"]);

		   $("#editaridEstado").val(respuesta["idEstado"]);

		   $("#editarFechaInicio").val(respuesta["fechaInicio"]);

		   $("#editarFechaFin").val(respuesta["fechaFin"]);

		   $("#editarPesoPorTableta").val(respuesta["pesoPorTableta"]);

		   $("#editarPesoEnTableta").val(respuesta["pesoEnTableta"]);

		   $("#editarMerma").val(respuesta["merma"]);

		   $("#editarReproceso").val(respuesta["reproceso"]);

      }

  })


})

/*=============================================
ELIMINAR RECETA
=============================================*/

$(".tablaRecetas tbody").on("click", "button.btnEliminarReceta", function(){

	var idReceta = $(this).attr("idReceta");
	var codigoReceta = $(this).attr("codigoReceta");
	var codigoLote = $(this).attr("codigoLote");

	Swal.fire({

		title: '¿Está seguro de borrar el receta?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar receta!'
        }).then(function(result){
        if (result.value) {

			window.location = "index.php?ruta=recetas&idReceta="+idReceta+"&codigoReceta="+codigoReceta+"&codigoLote="+codigoLote+"&CDPE="+1;


        }


	})

})

/*=============================================
CERRAR RECETA
=============================================*/

$(".tablaRecetas tbody").on("click", "button.btnCerrarReceta", function(){

	var idReceta = $(this).attr("idReceta");

	Swal.fire({

		title: '¿Está seguro de cerrar el receta?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, cerrar receta!'
        }).then(function(result){
        if (result.value) {

			window.location = "index.php?ruta=recetas&idReceta="+idReceta;


        }


	})

})

/*=============================================
DUPLICAR RECETA
=============================================*/

$(".tablaRecetas tbody").on("click", "button.btnDuplicarReceta", function(){

	$("#duplicarIdReceta").val($(this).attr("idReceta"));
	$("#codigoLote").val($(this).attr("codigoLote"));
	$("#nuevoIdReceta").val($(this).attr("nuevoIdReceta"));

})
	
/*=============================================
REVISAR SI LA RECETA YA ESTÁ REGISTRADO
=============================================*/

$("#nuevoCodigoReceta").change(function(){

	$(".alert").remove();

	var receta = $(this).val();

	var datos = new FormData();
	datos.append("validarCodigo", receta);

	 $.ajax({
	    url:"ajax/recetas.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoCodigoReceta").parent().after('<div class="alert alert-warning">Este código ya existe en la base de datos</div>');

	    		$("#nuevoCodigoReceta").val("");

	    	}

	    }

	})
})


/*=============================================
REVISAR SI LA RECETA YA ESTÁ REGISTRADO
=============================================*/

$("#duplicarCodigoReceta").change(function(){

	$(".alert").remove();

	var receta = $(this).val();

	var datos = new FormData();
	datos.append("validarCodigo", receta);

	 $.ajax({
	    url:"ajax/recetas.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#duplicarCodigoReceta").parent().after('<div class="alert alert-warning">Este código ya existe en la base de datos</div>');

	    		$("#duplicarCodigoReceta").val("");

	    	}

	    }

	})
})


/*=============================================
REVISAR SI EL CODIGO LOTE ESTA REGISTRADO
=============================================*/

$("#nuevoCodigoLote").change(function(){

	$(".alert").remove();

	var receta = $(this).val();

	var datos = new FormData();
	datos.append("validarCodigoLote", receta);

	 $.ajax({
	    url:"ajax/recetas.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoCodigoLote").parent().after('<div class="alert alert-warning">Este código ya existe en la base de datos</div>');

	    		$("#nuevoCodigoLote").val("");

	    	}

	    }

	})
})


/*=============================================
REVISAR SI EL CODIGO LOTE ESTÁ REGISTRADO
=============================================*/

$("#editarCodigoLote").change(function(){

	$(".alert").remove();

	var receta = $(this).val();

	var datos = new FormData();
	datos.append("validarCodigoLote", receta);

	 $.ajax({
	    url:"ajax/recetas.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#editarCodigoLote").parent().after('<div class="alert alert-warning">Este código ya existe en la base de datos</div>');

	    		$("#editarCodigoLote").val("");

	    	}

	    }

	})
})