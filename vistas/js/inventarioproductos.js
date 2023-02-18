
$('.tablaInventarioProductos').DataTable( {
    "ajax": "ajax/datatable-inventarioproductos.ajax.php",
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
MOSTRAR LOTES POR ID PRODUCTO
=============================================*/

$(".nuevoProductoS").on("change", function() {

	var idProducto = $(this).val();

	var datos = new FormData();

	datos.append("idProducto", idProducto);

    if($(this).val()!=''){

	$("#nuevoCodigoLoteS").prop("disabled", false);

	}else{

	$("#nuevaCantidadS").val("");
	$("#nuevaCantidadS").prop("disabled", true);
	$("#nuevoStockS").val("");
	$("#nuevoCodigoLoteS").prop("disabled", true);

	}

	$("#nuevoCodigoLoteS").empty();

	  $.ajax({

     	url:"ajax/lotes.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

		$(".nuevoCodigoLoteS").append("<option value =''>Seleccionar Lote</option>");
		
		for (var i=0; i<respuesta.length; i++) { 

		$(".nuevoCodigoLoteS").append("<option stock='"+respuesta[i]["cantidad"]+"' value ='"+respuesta[i]["codigoLote"]+"'>"+respuesta[i]["codigoLote"]+"</option>");
		
	    }

	
	    }
		

	})
})


$(".nuevoCodigoLoteS").on("change", function() {

    if($(this).val()!=''){

	var stockActual=$(".nuevoCodigoLoteS option:selected").attr("stock");
	$("#nuevoStockS").val(stockActual);
	$("#nuevaCantidadS").val("");
	$("#nuevaCantidadS").prop("disabled", false);

	}else{

	$("#nuevaCantidadS").val("");
	$("#nuevaCantidadS").prop("disabled", true);
	$("#nuevoStockS").val("");

	}

})

$(".nuevaCantidadS").on("change", function(){

	var stockActual=$(".nuevoCodigoLoteS option:selected").attr("stock");

	var stockFinal = (stockActual - $(this).val()).toFixed(2);

	$("#nuevoStockS").val(stockFinal);

	if(stockFinal < 0){
	
		$(this).val(stockActual);
		$("#nuevoStockS").val(0);

		Swal.fire({
			title: "La cantidad no puede ser superior al stock",
			icon: "error",
			showConfirmButton: false,
			timer: 2000
		  });

	 }

})