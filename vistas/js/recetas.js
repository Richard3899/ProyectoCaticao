$('.tablaRecetas').DataTable( {
    "ajax": "ajax/datatable-recetas.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"},
		//Tipo de dato (Número)
		{targets:[4], render: DataTable.render.number( '.', ',', 2)}
	  ],
	"retrieve": true,
	"processing": true,
	"order": [[0, 'desc']],
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

$("#nuevoidEstado" ).on("change", function() {
	
	if($("#nuevoidEstado").val()==3){
		$("#nuevaFechaFin").prop('required', true);
		$("#nuevaFechaVencimiento").prop('required', true);
		$("#nuevoPesoPorTableta").prop('required', true);
		$("#nuevoPesoEnTableta").prop('required', true);
		$("#nuevaMerma").prop('required', true);
		$("#nuevoReproceso").prop('required', true);
		$("#nuevaCantidadTabletas").prop('required', true);
	}else{
		$("#nuevaFechaFin").prop('required', false);
		$("#nuevaFechaVencimiento").prop('required', false);
		$("#nuevoPesoPorTableta").prop('required', false);
		$("#nuevoPesoEnTableta").prop('required', false);
		$("#nuevaMerma").prop('required', false);
		$("#nuevoReproceso").prop('required', false);
		$("#nuevaCantidadTabletas").prop('required', false);
	}

});
   

$("#editaridEstado" ).on("change", function() {
	
	if($("#editaridEstado").val()==3){
		$("#editarFechaFin").prop('required', true);
		$("#editarFechaVencimiento").prop('required', true);
		$("#editarPesoPorTableta").prop('required', true);
		$("#editarPesoEnTableta").prop('required', true);
		$("#editarMerma").prop('required', true);
		$("#editarReproceso").prop('required', true);
		$("#editarCantidadTabletas").prop('required', true);
	}else{
		$("#editarFechaFin").prop('required', false);
		$("#editarFechaVencimiento").prop('required', false);
		$("#editarPesoPorTableta").prop('required', false);
		$("#editarPesoEnTableta").prop('required', false);
		$("#editarMerma").prop('required', false);
		$("#editarReproceso").prop('required', false);
		$("#editarCantidadTabletas").prop('required', false);
	}

});
   

$(document).ready(function() {
	// Create date inputs
	new DateTime($('#nuevaFechaInicio'), {
		format: 'DD/MM/YYYY'
	});
	new DateTime($('#nuevaFechaFin'), {
		format: 'DD/MM/YYYY'
	});
	new DateTime($('#nuevaFechaVencimiento'), {
		format: 'DD/MM/YYYY'
	});

	new DateTime($('#editarFechaInicio'), {
		format: 'DD/MM/YYYY'
	});
	new DateTime($('#editarFechaFin'), {
		format: 'DD/MM/YYYY'
	});
	new DateTime($('#editarFechaVencimiento'), {
		format: 'DD/MM/YYYY'
	});

});

/*=============================================
CREAR ID PARA PRODUCTO
=============================================*/

$(".tablaRecetas").on("draw.dt", function() {

	var idReceta = "";

	var datos = new FormData();

	datos.append("idReceta", idReceta);

	const arrayIdRecetas = [];

	  $.ajax({

     	url:"ajax/recetas.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

		if(respuesta.length!=0){
			
		for (var i=0; i<respuesta.length; i++) { 

		arrayIdRecetas.push(respuesta[i]["idReceta"]);
	
		}
		arrayIdRecetas.sort(function(a, b){return a - b});

		const ultimoIdReceta = $(arrayIdRecetas).get(-1);
	
		$("#nuevoIdReceta").val(parseInt(ultimoIdReceta)+1);
			
		}else{

		$("#nuevoIdReceta").val(1)

		}
		
	    }
		
	})
})

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

		$("#idLote").val(respuesta["idLote"]);
  
		$("#editarCodigoLote").val(respuesta["codigoLote"]);

		if(respuesta["fechaVencimiento"]==null){
			var fechaVencimiento="";
		}else{
			fechaVencimiento=moment(respuesta["fechaVencimiento"],'YYYY-MM-DD').format('DD/MM/YYYY');
		}

		$("#editarFechaVencimiento").val(fechaVencimiento);
		
		$("#editaridProducto").val(respuesta["idProducto"]).trigger('change.select2');

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

		   $("#editarFechaInicio").val(moment(respuesta["fechaInicio"],'YYYY-MM-DD').format('DD/MM/YYYY'));

		   if(respuesta["fechaFin"]==null){
             var fechaFin="";
		   }else{
             fechaFin=moment(respuesta["fechaFin"],'YYYY-MM-DD').format('DD/MM/YYYY');
		   }
		   
		   $("#editarFechaFin").val(fechaFin);

		   $("#editarPesoPorTableta").val(respuesta["pesoPorTableta"]);

		   $("#editarPesoEnTableta").val(respuesta["pesoEnTableta"]);

		   $("#editarMerma").val(respuesta["merma"]);

		   $("#editarReproceso").val(respuesta["reproceso"]);

		   $("#editarCantidadTabletas").val(respuesta["cantidadTabletas"]);

      }

  })


})



/*=============================================
DETALLE RECETA
=============================================*/

$(".tablaRecetas tbody").on("click", "button.btnDetalleReceta", function(){

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
  
		$("#detalleCodigoLote").val(respuesta["codigoLote"]);
		$("#detalleCodigoLote").disabled;

		if(respuesta["fechaVencimiento"]==null){
			var fechaVencimiento="";
		}else{
			fechaVencimiento=moment(respuesta["fechaVencimiento"],'YYYY-MM-DD').format('DD/MM/YYYY');
		}

		$("#detalleFechaVencimiento").val(fechaVencimiento);
		
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
	 //    $("#detallePesoPorTableta").val(new Intl.NumberFormat(['ban', 'id']).format(respuesta["pesoPorTableta"]));

		   $("#detalleFechaInicio").val(moment(respuesta["fechaInicio"],'YYYY-MM-DD').format('DD/MM/YYYY'));

		   if(respuesta["fechaFin"]==null){
		   	   var fechaFin="";
		   }else{
			   fechaFin=moment(respuesta["fechaFin"],'YYYY-MM-DD').format('DD/MM/YYYY');
		   }

		   $("#detalleFechaFin").val(fechaFin);

		   $("#detallePesoPorTableta").val(respuesta["pesoPorTableta"]);
		   
		   $("#detallePesoEnTableta").val(respuesta["pesoEnTableta"]);

		   $("#detalleMerma").val(respuesta["merma"]);

		   $("#detalleReproceso").val(respuesta["reproceso"]);

		   $("#detalleCantidadTabletas").val(respuesta["cantidadTabletas"]);

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
	var codigoLote = $(this).attr("codigoLote");
	var cantidadTabletas = $(this).attr("cantidadTabletas");
	var idEstado = $(this).attr("idEstado");

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

			window.location = "index.php?ruta=recetas&idReceta="+idReceta+"&codigoLote="+codigoLote+"&cantidadTabletas="+cantidadTabletas+"&idEstado="+idEstado;

        }

	})

})

/*=============================================
DUPLICAR RECETA
=============================================*/

$(".tablaRecetas tbody").on("click", "button.btnDuplicarReceta", function(){

	$("#duplicarIdReceta").val($(this).attr("idReceta"));
	$("#codigoLote").val($(this).attr("codigoLote"));

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