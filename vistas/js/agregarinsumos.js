$('.tablaAgregarInsumos').DataTable( {
    "ajax": "ajax/datatable-agregarinsumos.ajax.php",
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
AGREGANDO INSUMOS A LA RECETA
=============================================*/

$(".tablaAgregarInsumos tbody").on("click", "button.agregarInsumo", function(){

	
	var idInsumo = $(this).attr("idInsumo");

	$(this).removeClass("btn-info agregarInsumo");

	$(this).addClass("btn-default");

	var datos = new FormData();
	datos.append("idInsumo", idInsumo);

	$.ajax({

	url:"ajax/inventarioinsumos.ajax.php",
	method: "POST",
	data: datos,
	cache: false,
	contentType: false,
	processData: false,
	dataType:"json",
	success:function(respuesta){

		$stock=respuesta["stock"];

		$.ajax({

			url:"ajax/insumos.ajax.php",
			 method: "POST",
			 data: datos,
			 cache: false,
			 contentType: false,
			 processData: false,
			 dataType:"json",
			 success:function(respuesta){
   
				 var nombre = respuesta["nombre"];
				 var stock = $stock;
				 var precio = respuesta["precio"];
   
				 /*=============================================
				 EVITAR AGREGAR PRODUTO CUANDO EL STOCK ESTÁ EN CERO
				 =============================================*/
   
				 if(stock <= 0){
   
					 swal.fire({
					 title: "No hay stock disponible",
					 icon: "error",
					 showConfirmButton: false,
					 timer: 1200
				   });
   
				   $("button[idInsumo='"+idInsumo+"']").addClass("btn-info agregarInsumo");
   
				   return;
   
				 }
   
				 $(".nuevoInsumo").append(
			   '<div class="row mx-2">'+
				   '<!-- ENTRADA PARA EL NOMBRE -->'+
				   '<div class="form-group col-12 col-sm-5 col-md-5 col-xl-5">'+
				   '<div class="input-group">'+
				   '<input type="text" class="form-control nuevoNombreInsumo" idInsumo="'+idInsumo+'" name="agregarInsumo" value="'+nombre+'" readonly required>'+
				   '</div>'+
				   '</div>'+
				'<!-- ENTRADA PARA EL CANTIDAD -->'+
				 '<div class="form-group col-4 col-sm-3 col-md-3 col-xl-3">'+
				   '<div class="input-group ">'+
				   '<input type="number" class="form-control nuevaCantidadInsumo" name="nuevaCantidadInsumo" min="1" value="1" stock="'+stock+'" nuevoStock="'+Number(stock-1)+'" required>'+
				   '</div>'+
				 '</div>'+
				 '<!-- ENTRADA PARA EL PRECIO -->'+
				  '<div class="form-group col-8 col-sm-4 col-md-4 col-xl-4">'+
				   '<div class="input-group">'+
					   '<input type="text" class="form-control nuevoPrecioInsumo" precioReal="'+precio+'" name="nuevoPrecioInsumo" value="S/.'+precio+'" readonly required>'+
					   '<input type="hidden" name="idVendedor" value="">'+
					   '<div class="input-group-prepend">'+
					   '<span class="input-group-addon"><button type="button" class="btn btn-danger quitarInsumo" idInsumo="'+idInsumo+'"><i class="fa fa-times"></i></button></span>'+
					   '</div>'+
					   ' </div>'+
				   '</div>'+
				   '</div>') 
   
			   // SUMAR TOTAL DE PRECIOS
   
			   sumarTotalPrecios()
   
			   // AGREGAR IMPUESTO
   
			   agregarImpuesto()
   
			   // AGRUPAR PRODUCTOS EN FORMATO JSON
   
			   listarInsumos()
   
			   // PONER FORMATO AL PRECIO DE LOS PRODUCTOS
   
			   $(".nuevoPrecioInsumo").number(true, 2);
   
   
			   localStorage.removeItem("quitarInsumo");
   
			 
	   }
   
		})

	}

	})



});

/*=============================================
CUANDO CARGUE LA TABLA CADA VEZ QUE NAVEGUE EN ELLA
=============================================*/

$(".tablaAgregarInsumos").on("draw.dt", function(){

	if(localStorage.getItem("quitarInsumo") != null){

		var listaIdInsumos = JSON.parse(localStorage.getItem("quitarInsumo"));

		for(var i = 0; i < listaIdInsumos.length; i++){

			$("button.recuperarBoton[idInsumo='"+listaIdInsumos[i]["idInsumo"]+"']").removeClass('btn-default');
			$("button.recuperarBoton[idInsumo='"+listaIdInsumos[i]["idInsumo"]+"']").addClass('btn-info agregarInsumo');

		}


	}


})


/*=============================================
QUITAR PRODUCTOS DE LA VENTA Y RECUPERAR BOTÓN
=============================================*/

var idQuitarInsumo = [];

localStorage.removeItem("quitarInsumo");

$(".formularioAgregarInsumo").on("click", "button.quitarInsumo", function(){

	$(this).parent().parent().parent().parent().parent().remove();

	var idInsumo = $(this).attr("idInsumo");

	/*=============================================
	ALMACENAR EN EL LOCALSTORAGE EL ID DEL PRODUCTO A QUITAR
	=============================================*/

	if(localStorage.getItem("quitarInsumo") == null){

		idQuitarInsumo = [];
	
	}else{

		idQuitarInsumo.concat(localStorage.getItem("quitarInsumo"))

	}

	idQuitarInsumo.push({"idInsumo":idInsumo});

	localStorage.setItem("quitarInsumo", JSON.stringify(idQuitarInsumo));

	$("button.recuperarBoton[idInsumo='"+idInsumo+"']").removeClass('btn-default');

	$("button.recuperarBoton[idInsumo='"+idInsumo+"']").addClass('btn-info agregarInsumo');

	if($(".nuevoInsumo").children().length == 0){

		$("#nuevoImpuestoVenta").val(0);
		$("#nuevoTotalVenta").val(0);
		$("#totalVenta").val(0);
		$("#nuevoTotalVenta").attr("total",0);

	}else{

		// SUMAR TOTAL DE PRECIOS

    	sumarTotalPrecios()

    	// AGREGAR IMPUESTO
	        
        agregarImpuesto()

        // AGRUPAR PRODUCTOS EN FORMATO JSON

        listarInsumos()

	}

})

/*=============================================
AGREGANDO PRODUCTOS DESDE EL BOTÓN PARA DISPOSITIVOS
=============================================*/

var numInsumo = 0;

$(".btnAgregarInsumo").click(function(){

	numInsumo ++;

	var datos = new FormData();
	datos.append("traerInsumos", "ok");

	$.ajax({

		url:"ajax/insumos.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
      	    
      	    	$(".nuevoInsumo").append(

					'<div class="row mx-2">'+
					'<!-- ENTRADA PARA EL NOMBRE -->'+
					'<div class="form-group col-12 col-sm-5 col-md-5 col-xl-5">'+
					'<div class="input-group">'+
					'<input type="text" class="form-control nuevoNombreInsumo" idInsumo="'+idInsumo+'" name="agregarInsumo" value="'+nombre+'" readonly required>'+
					'</div>'+
					'</div>'+
				 '<!-- ENTRADA PARA EL CANTIDAD -->'+
				  '<div class="form-group col-4 col-sm-3 col-md-3 col-xl-3">'+
					'<div class="input-group ">'+
					'<input type="number" class="form-control nuevaCantidadInsumo" name="nuevaCantidadInsumo" min="1" value="1" stock="'+stock+'" nuevoStock="'+Number(stock-1)+'" required>'+
					'</div>'+
				  '</div>'+
				  '<!-- ENTRADA PARA EL PRECIO -->'+
				   '<div class="form-group col-8 col-sm-4 col-md-4 col-xl-4">'+
					'<div class="input-group">'+
						'<input type="text" class="form-control nuevoPrecioInsumo" precioReal="'+precio+'" name="nuevoPrecioInsumo" value="S/.'+precio+'" readonly required>'+
						'<input type="hidden" name="idVendedor" value="">'+
						'<div class="input-group-prepend">'+
						'<span class="input-group-addon"><button type="button" class="btn btn-danger quitarInsumo" idInsumo="'+idInsumo+'"><i class="fa fa-times"></i></button></span>'+
						'</div>'+
						' </div>'+
					'</div>'+
					'</div>');


	        // AGREGAR LOS PRODUCTOS AL SELECT 

	         respuesta.forEach(funcionForEach);

	         function funcionForEach(item, index){

	         	if(item.stock != 0){

		         	$("#insumo"+numInsumo).append(

						'<option idInsumo="'+item.id+'" value="'+item.descripcion+'">'+item.descripcion+'</option>'
		         	)

		         
		         }	         

	         }

        	 // SUMAR TOTAL DE PRECIOS

    		sumarTotalPrecios()

    		// AGREGAR IMPUESTO
	        
	        agregarImpuesto()

	        // PONER FORMATO AL PRECIO DE LOS PRODUCTOS

	        $(".nuevoPrecioInsumo").number(true, 2);


      	}

	})

})

/*=============================================
SELECCIONAR PRODUCTO
=============================================*/

$(".formularioAgregarInsumo").on("change", "select.nuevaDescripcionInsumo", function(){

	var nombreInsumo = $(this).val();

	var nuevaDescripcionInsumo = $(this).parent().parent().parent().children().children().children(".nuevaDescripcionInsumo");

	var nuevoPrecioInsumo = $(this).parent().parent().parent().children(".ingresoPrecio").children().children(".nuevoPrecioInsumo");

	var nuevaCantidadInsumo = $(this).parent().parent().parent().children(".ingresoCantidad").children(".nuevaCantidadInsumo");

	var datos = new FormData();
    datos.append("nombreInsumo", nombreInsumo);


	  $.ajax({

     	url:"ajax/insumos.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
      	    
      	     $(nuevaDescripcionInsumo).attr("idInsumo", respuesta["id"]);
      	    $(nuevaCantidadInsumo).attr("stock", respuesta["stock"]);
      	    $(nuevaCantidadInsumo).attr("nuevoStock", Number(respuesta["stock"])-1);
      	    $(nuevoPrecioInsumo).val(respuesta["precio_venta"]);
      	    $(nuevoPrecioInsumo).attr("precioReal", respuesta["precio_venta"]);

  	      // AGRUPAR PRODUCTOS EN FORMATO JSON

	        listarInsumos()

      	}

      })
})

/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

$(".formularioAgregarInsumo").on("change", "input.nuevaCantidadInsumo", function(){

	var precio = $(this).parent().parent().children(".ingresoPrecio").children().children(".nuevoPrecioInsumo");

	var precioFinal = $(this).val() * precio.attr("precioReal");
	
	precio.val(precioFinal);

	var nuevoStock = Number($(this).attr("stock")) - $(this).val();

	$(this).attr("nuevoStock", nuevoStock);

	if(Number($(this).val()) > Number($(this).attr("stock"))){

		/*=============================================
		SI LA CANTIDAD ES SUPERIOR AL STOCK REGRESAR VALORES INICIALES
		=============================================*/

		$(this).val(0);

		$(this).attr("nuevoStock", $(this).attr("stock"));

		var precioFinal = $(this).val() * precio.attr("precioReal");

		precio.val(precioFinal);

		sumarTotalPrecios();

		swal({
	      title: "La cantidad supera el Stock",
	      text: "¡Sólo hay "+$(this).attr("stock")+" unidades!",
	      type: "error",
	      confirmButtonText: "¡Cerrar!"
	    });

	    return;

	}

	// SUMAR TOTAL DE PRECIOS

	sumarTotalPrecios()

	// AGREGAR IMPUESTO
	        
    agregarImpuesto()

    // AGRUPAR PRODUCTOS EN FORMATO JSON

    listarInsumos()

})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumarTotalPrecios(){

	var precioItem = $(".nuevoPrecioInsumo");
	
	var arraySumaPrecio = [];  

	for(var i = 0; i < precioItem.length; i++){

		 arraySumaPrecio.push(Number($(precioItem[i]).val()));
		
		 
	}

	function sumaArrayPrecios(total, numero){

		return total + numero;

	}

	var sumaTotalPrecio = arraySumaPrecio.reduce(sumaArrayPrecios);
	
	$("#nuevoTotalVenta").val(sumaTotalPrecio);
	$("#totalVenta").val(sumaTotalPrecio);
	$("#nuevoTotalVenta").attr("total",sumaTotalPrecio);


}

/*=============================================
FUNCIÓN AGREGAR IMPUESTO
=============================================*/

function agregarImpuesto(){

	var impuesto = $("#nuevoImpuestoVenta").val();
	var precioTotal = $("#nuevoTotalVenta").attr("total");

	var precioImpuesto = Number(precioTotal * impuesto/100);

	var totalConImpuesto = Number(precioImpuesto) + Number(precioTotal);
	
	$("#nuevoTotalVenta").val(totalConImpuesto);

	$("#totalVenta").val(totalConImpuesto);

	$("#nuevoPrecioImpuesto").val(precioImpuesto);

	$("#nuevoPrecioNeto").val(precioTotal);

}

/*=============================================
CUANDO CAMBIA EL IMPUESTO
=============================================*/

$("#nuevoImpuestoVenta").change(function(){

	agregarImpuesto();

});

/*=============================================
FORMATO AL PRECIO FINAL
=============================================*/

$("#nuevoTotalVenta").number(true, 2);

/*=============================================
SELECCIONAR MÉTODO DE PAGO
=============================================*/

$("#nuevoMetodoPago").change(function(){

	var metodo = $(this).val();

	if(metodo == "Efectivo"){

		$(this).parent().parent().removeClass("col-xs-6");

		$(this).parent().parent().addClass("col-xs-4");

		$(this).parent().parent().parent().children(".cajasMetodoPago").html(

			 '<div class="col-xs-4">'+ 

			 	'<div class="input-group">'+ 

			 		'<span class="input-group-addon"><i class="ion ion-social-usd"></i></span>'+ 

			 		'<input type="text" class="form-control" id="nuevoValorEfectivo" placeholder="000000" required>'+

			 	'</div>'+

			 '</div>'+

			 '<div class="col-xs-4" id="capturarCambioEfectivo" style="padding-left:0px">'+

			 	'<div class="input-group">'+

			 		'<span class="input-group-addon"><i class="ion ion-social-usd"></i></span>'+

			 		'<input type="text" class="form-control" id="nuevoCambioEfectivo" placeholder="000000" readonly required>'+

			 	'</div>'+

			 '</div>'

		 )

		// Agregar formato al precio

		$('#nuevoValorEfectivo').number( true, 2);
      	$('#nuevoCambioEfectivo').number( true, 2);


      	// Listar método en la entrada
      	listarMetodos()

	}else{

		$(this).parent().parent().removeClass('col-xs-4');

		$(this).parent().parent().addClass('col-xs-6');

		 $(this).parent().parent().parent().children('.cajasMetodoPago').html(

		 	'<div class="col-xs-6" style="padding-left:0px">'+
                        
                '<div class="input-group">'+
                     
                  '<input type="number" min="0" class="form-control" id="nuevoCodigoTransaccion" placeholder="Código transacción"  required>'+
                       
                  '<span class="input-group-addon"><i class="fa fa-lock"></i></span>'+
                  
                '</div>'+

              '</div>')

	}

	

})

/*=============================================
CAMBIO EN EFECTIVO
=============================================*/
$(".formularioAgregarInsumo").on("change", "input#nuevoValorEfectivo", function(){

	var efectivo = $(this).val();

	var cambio =  Number(efectivo) - Number($('#nuevoTotalVenta').val());

	var nuevoCambioEfectivo = $(this).parent().parent().parent().children('#capturarCambioEfectivo').children().children('#nuevoCambioEfectivo');

	nuevoCambioEfectivo.val(cambio);

})

/*=============================================
CAMBIO TRANSACCIÓN
=============================================*/
$(".formularioAgregarInsumo").on("change", "input#nuevoCodigoTransaccion", function(){

	// Listar método en la entrada
     listarMetodos()


})


/*=============================================
LISTAR TODOS LOS PRODUCTOS
=============================================*/

function listarInsumos(){

	var listaInsumos = [];

	var descripcion = $(".nuevaDescripcionInsumo");

	var cantidad = $(".nuevaCantidadInsumo");

	var precio = $(".nuevoPrecioInsumo");

	for(var i = 0; i < descripcion.length; i++){

		listaInsumos.push({ "id" : $(descripcion[i]).attr("idInsumo"), 
							  "descripcion" : $(descripcion[i]).val(),
							  "cantidad" : $(cantidad[i]).val(),
							  "stock" : $(cantidad[i]).attr("nuevoStock"),
							  "precio" : $(precio[i]).attr("precioReal"),
							  "total" : $(precio[i]).val()})

	}

	$("#listaInsumos").val(JSON.stringify(listaInsumos)); 

}

/*=============================================
LISTAR MÉTODO DE PAGO
=============================================*/

function listarMetodos(){

	var listaMetodos = "";

	if($("#nuevoMetodoPago").val() == "Efectivo"){

		$("#listaMetodoPago").val("Efectivo");

	}else{

		$("#listaMetodoPago").val($("#nuevoMetodoPago").val()+"-"+$("#nuevoCodigoTransaccion").val());

	}

}

/*=============================================
BOTON EDITAR VENTA
=============================================*/
$(".tablas").on("click", ".btnEditarVenta", function(){

	var idVenta = $(this).attr("idVenta");

	window.location = "index.php?ruta=editar-venta&idVenta="+idVenta;


})

/*=============================================
FUNCIÓN PARA DESACTIVAR LOS BOTONES AGREGAR CUANDO EL PRODUCTO YA HABÍA SIDO SELECCIONADO EN LA CARPETA
=============================================*/

function quitarAgregarInsumo(){

	//Capturamos todos los id de insumos que fueron elegidos en la venta
	var idInsumos = $(".quitarInsumo");

	//Capturamos todos los botones de agregar que aparecen en la tabla
	var botonesTabla = $(".tablaAgregarInsumos tbody button.agregarInsumo");

	//Recorremos en un ciclo para obtener los diferentes idInsumos que fueron agregados a la venta
	for(var i = 0; i < idInsumos.length; i++){

		//Capturamos los Id de los insumos agregados a la venta
		var boton = $(idInsumos[i]).attr("idInsumo");
		
		//Hacemos un recorrido por la tabla que aparece para desactivar los botones de agregar
		for(var j = 0; j < botonesTabla.length; j ++){

			if($(botonesTabla[j]).attr("idInsumo") == boton){

				$(botonesTabla[j]).removeClass("btn-info agregarInsumo");
				$(botonesTabla[j]).addClass("btn-default");

			}
		}

	}
	
}

/*=============================================
CADA VEZ QUE CARGUE LA TABLA CUANDO NAVEGAMOS EN ELLA EJECUTAR LA FUNCIÓN:
=============================================*/

$('.tablaAgregarInsumos').on( 'draw.dt', function(){

	quitarAgregarInsumo();

})


/*=============================================
BORRAR VENTA
=============================================*/
$(".tablas").on("click", ".btnEliminarVenta", function(){

  var idVenta = $(this).attr("idVenta");

  swal({
        title: '¿Está seguro de borrar la venta?',
        text: "¡Si no lo está puede cancelar la accíón!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar venta!'
      }).then(function(result){
        if (result.value) {
          
            window.location = "index.php?ruta=ventas&idVenta="+idVenta;
        }

  })

})

/*=============================================
IMPRIMIR FACTURA
=============================================*/

$(".tablas").on("click", ".btnImprimirFactura", function(){

	var codigoVenta = $(this).attr("codigoVenta");

	window.open("extensiones/tcpdf/pdf/factura.php?codigo="+codigoVenta, "_blank");

})

/*=============================================
RANGO DE FECHAS
=============================================*/

$('#daterange-btn').daterangepicker(
  {
    ranges   : {
      'Hoy'       : [moment(), moment()],
      'Ayer'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
      'Últimos 7 días' : [moment().subtract(6, 'days'), moment()],
      'Últimos 30 días': [moment().subtract(29, 'days'), moment()],
      'Este mes'  : [moment().startOf('month'), moment().endOf('month')],
      'Último mes'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
    },
    startDate: moment(),
    endDate  : moment()
  },
  function (start, end) {
    $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));

    var fechaInicial = start.format('YYYY-MM-DD');

    var fechaFinal = end.format('YYYY-MM-DD');

    var capturarRango = $("#daterange-btn span").html();
   
   	localStorage.setItem("capturarRango", capturarRango);

   	window.location = "index.php?ruta=ventas&fechaInicial="+fechaInicial+"&fechaFinal="+fechaFinal;

  }

)

/*=============================================
CANCELAR RANGO DE FECHAS
=============================================*/

$(".daterangepicker.opensleft .range_inputs .cancelBtn").on("click", function(){

	localStorage.removeItem("capturarRango");
	localStorage.clear();
	window.location = "ventas";
})

/*=============================================
CAPTURAR HOY
=============================================*/

$(".daterangepicker.opensleft .ranges li").on("click", function(){

	var textoHoy = $(this).attr("data-range-key");

	if(textoHoy == "Hoy"){

		var d = new Date();
		
		var dia = d.getDate();
		var mes = d.getMonth()+1;
		var año = d.getFullYear();

		// if(mes < 10){

		// 	var fechaInicial = año+"-0"+mes+"-"+dia;
		// 	var fechaFinal = año+"-0"+mes+"-"+dia;

		// }else if(dia < 10){

		// 	var fechaInicial = año+"-"+mes+"-0"+dia;
		// 	var fechaFinal = año+"-"+mes+"-0"+dia;

		// }else if(mes < 10 && dia < 10){

		// 	var fechaInicial = año+"-0"+mes+"-0"+dia;
		// 	var fechaFinal = año+"-0"+mes+"-0"+dia;

		// }else{

		// 	var fechaInicial = año+"-"+mes+"-"+dia;
	 //    	var fechaFinal = año+"-"+mes+"-"+dia;

		// }

		dia = ("0"+dia).slice(-2);
		mes = ("0"+mes).slice(-2);

		var fechaInicial = año+"-"+mes+"-"+dia;
		var fechaFinal = año+"-"+mes+"-"+dia;	

    	localStorage.setItem("capturarRango", "Hoy");

    	window.location = "index.php?ruta=ventas&fechaInicial="+fechaInicial+"&fechaFinal="+fechaFinal;

	}

})

/*=============================================
ABRIR ARCHIVO XML EN NUEVA PESTAÑA
=============================================*/

$(".abrirXML").click(function(){

	var archivo = $(this).attr("archivo");
	window.open(archivo, "_blank");


})

