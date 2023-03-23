
$('.tablaInventarioInsumos').DataTable( {
    "ajax": "ajax/datatable-inventarioinsumos.ajax.php",
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"},
		//Tipo de dato (Número)
		{targets: [2],
			render: function ( stock, type, row ) {
			  var color = '';
			  if (stock < 10) {
				color = 'danger';
			  }else if (stock>9 & stock<15) {
				color = 'warning';
			  }else{
				color = 'success';
			  }
			  return '<button class="btn btn-' + color + '" ">' + DataTable.render.number( '.', ',', 2).display(stock) + '</button>';
			}
	   }
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
MOSTRAR LA UNIDAD DE MEDIDAD DEL INSUMO INGRESO STOCK
=============================================*/

$("#nuevoInsumoI").on("change", function() {

	var idInsumo = $(this).val();

	var datos = new FormData();

	datos.append("idInsumo", idInsumo);

	if($(this).val()==""){
		$("#nuevaCantidadI").val("");
	}

	$.ajax({

		url:"ajax/insumos.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType:"json",
      	success:function(respuesta){

			var idUnidadMedida=respuesta["idUnidadMedida"];

			var datos = new FormData();

			datos.append("idUnidadMedida", idUnidadMedida);

			$.ajax({

				url:"ajax/unidadmedida.ajax.php",
				method: "POST",
				data: datos,
				cache: false,
				contentType: false,
				processData: false,
				dataType:"json",
			  	success:function(respuesta){
					
					$("#unidadMedidaI").val(respuesta["descripcion"]);

			    }
				
			})
            
	    }
		
	})
	
})

/*=============================================
MOSTRAR LA UNIDAD DE MEDIDAD DEL INSUMO SALIDA STOCK
=============================================*/

$("#nuevoInsumoS").on("change", function() {

	var idInsumo = $(this).val();

	var datos = new FormData();

	datos.append("idInsumo", idInsumo);

	if($(this).val()==""){
		$("#nuevaCantidadS").val("");
	}

	$.ajax({

		url:"ajax/insumos.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType:"json",
      	success:function(respuesta){

			var idUnidadMedida=respuesta["idUnidadMedida"];

			var datos = new FormData();

			datos.append("idUnidadMedida", idUnidadMedida);

			$.ajax({

				url:"ajax/unidadmedida.ajax.php",
				method: "POST",
				data: datos,
				cache: false,
				contentType: false,
				processData: false,
				dataType:"json",
			  	success:function(respuesta){
					
					$("#unidadMedidaS").val(respuesta["descripcion"]);

			    }
				
			})
            
	    }
		
	})
	
})