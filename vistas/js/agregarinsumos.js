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

const idArray=[];

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
				 var precioUnitario = respuesta["precioUnitario"];

				 idArray.push(respuesta["idMateria"]);
   
				 /*=============================================
				 EVITAR AGREGAR PRODUTO CUANDO EL STOCK ESTÁ EN CERO
				 =============================================*/
   
				 if(stock <= 0){
   
					 Swal.fire({
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
					  '<div class="form-group col-12 col-sm-5 col-md-5 col-xl-5 ingresoNombre">'+
					  '<div class="input-group">'+
					  '<input type="text" class="form-control nuevoNombreInsumo" idInsumo="'+idInsumo+'" name="agregarInsumo" value="'+nombre+'" readonly required>'+
					  '</div>'+
					  '</div>'+
					'<!-- ENTRADA PARA EL CANTIDAD -->'+
					'<div class="form-group col-4 col-sm-3 col-md-3 col-xl-3 ingresoCantidad">'+
					  '<div class="input-group ">'+
					  '<input type="number" class="form-control nuevaCantidadInsumo" name="nuevaCantidadInsumo" min="1" value="1" stock="'+stock+'" nuevoStock="'+Number(stock-1)+'" required>'+
					  '</div>'+
					'</div>'+
					'<!-- ENTRADA PARA EL PRECIO -->'+
					 '<div class="form-group col-8 col-sm-4 col-md-4 col-xl-4 ingresoPrecioUnitario">'+
					  '<div class="input-group">'+
					    '<span class="input-group-text"><i class="ion ion-social-usd"></i></span>'+
						'<input type="text" class="form-control nuevoPrecioUnitarioInsumo" precioUnitarioReal="'+precioUnitario+'" name="nuevoPrecioUnitarioInsumo" value="'+precioUnitario+'" readonly required>'+
						'<div class="input-group-prepend">'+
						'<span class="input-group-addon"><button type="button" class="btn btn-danger quitarInsumo" idInsumo="'+idInsumo+'"><i class="fa fa-times"></i></button></span>'+
						'</div>'+
						' </div>'+
					  '</div>'+
					  '</div>') 
					
   
			   // SUMAR TOTAL DE PRECIOS
   
			   sumarTotalPrecioUnitario()
   
			   // AGRUPAR INSUMOS EN FORMATO JSON
   
			   listarInsumos()

   
			   // PONER FORMATO AL PRECIO DE LOS INSUMOS

			   $(".nuevoPrecioUnitarioInsumo").number(true,3);
   

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
QUITAR INSUMOS DE LA RECETA Y RECUPERAR BOTÓN
=============================================*/

var idQuitarInsumo = [];

localStorage.removeItem("quitarInsumo");

$(".formularioAgregarInsumo").on("click", "button.quitarInsumo", function(){

	$(this).parent().parent().parent().parent().parent().remove();

	var nuevoNombreInsumo = $(this).parent().parent().parent().parent().parent().children(".ingresoNombre").children().children(".nuevoNombreInsumo");

	var idInsumo = $(nuevoNombreInsumo).attr("idInsumo");

	/*=============================================
	ALMACENAR EN EL ARRAY EL ID DEL INSUMO A QUITAR
	=============================================*/
	for(i=0;i<idArray.length;i++){
		
		if(idArray[i]==idInsumo){

			idArray.splice(i,1);
			
		}
	 }

	/*=============================================
	ALMACENAR EN EL LOCALSTORAGE EL ID DEL INSUMO A QUITAR
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
		$("#nuevoTotalInsumos").val(0);
		$("#totalInsumos").val(0);
		$("#nuevoTotalInsumos").attr("total",0);

	}else{

		// SUMAR TOTAL DE PRECIOS

    	sumarTotalPrecioUnitario()

        // AGRUPAR INSUMOS EN FORMATO JSON

        listarInsumos()

	}

})

/*=============================================
AGREGANDO INSUMOS DESDE EL BOTÓN PARA DISPOSITIVOS
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
				'<script src="vistas/js/plantilla.js"></script>'+
				'<div class="row mx-2">'+
				  '<!-- ENTRADA PARA EL NOMBRE -->'+
				  '<div class="form-group col-12 col-sm-5 col-md-5 col-xl-5 ingresoNombre">'+
				  '<div class="input-group">'+
				  '<select class="form-control select2 input-lg nuevoNombreInsumo" nombre id="insumo'+numInsumo+'" style="width: 100%;" name="agregarInsumo" idInsumo required>'+
				  '<option value="0">Seleccionar Insumo</option>'+
				  '</select>'+
				  '</div>'+
				  '</div>'+
				 '<!-- ENTRADA PARA EL CANTIDAD -->'+
				  '<div class="form-group col-4 col-sm-3 col-md-3 col-xl-3 ingresoCantidad">'+
				  '<div class="input-group ">'+
				  '<input type="number" class="form-control nuevaCantidadInsumo" name="nuevaCantidadInsumo" min="1" value="0" stock nuevoStock required>'+
				  '</div>'+
				  '</div>'+
				  '<!-- ENTRADA PARA EL PRECIO -->'+
				  '<div class="form-group col-8 col-sm-4 col-md-4 col-xl-4 ingresoPrecioUnitario">'+
				  '<div class="input-group">'+
				    '<span class="input-group-text"><i class="ion ion-social-usd"></i></span>'+
					'<input type="text" class="form-control nuevoPrecioUnitarioInsumo" precioUnitarioReal value="0" name="nuevoPrecioUnitarioInsumo" readonly required>'+
					'<div class="input-group-prepend">'+
					'<span class="input-group-addon"><button type="button" class="btn btn-danger quitarInsumo"><i class="fa fa-times"></i></button></span>'+
					'</div>'+
					' </div>'+
				  '</div>'+
				  '</div>') 


	        // AGREGAR LOS INSUMOS AL SELECT 

	         respuesta.forEach(funcionForEach);

	         function funcionForEach(item){

		         	$("#insumo"+numInsumo).append(

						'<option idInsumo="'+item.idMateria+'" value="'+item.idMateria+'">'+item.nombre+'</option>'
						
		         	)
  		   
	         }

        	 // SUMAR TOTAL DE PRECIOS

    		sumarTotalPrecioUnitario()

	        // PONER FORMATO AL PRECIO DE LOS INSUMOS

			$(".nuevoPrecioUnitarioInsumo").number(true,3);

      	}

	})

})



/*=============================================
SELECCIONAR INSUMO
=============================================*/

$(".formularioAgregarInsumo").on("change", "select.nuevoNombreInsumo", function(){

	var idInsumo = $(this).val();

	var datos = new FormData();

	datos.append("idInsumo", idInsumo);

	var nuevoNombreInsumo = $(this).parent().parent().parent().children().children().children(".nuevoNombreInsumo");

	var nuevoPrecioUnitarioInsumo = $(this).parent().parent().parent().children(".ingresoPrecioUnitario").children().children(".nuevoPrecioUnitarioInsumo");

	var nuevaCantidadInsumo = $(this).parent().parent().parent().children(".ingresoCantidad").children().children(".nuevaCantidadInsumo");

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

			$(nuevaCantidadInsumo).attr("stock",$stock);
			$(nuevaCantidadInsumo).attr("nuevoStock", Number($stock)-1);
			$(nuevaCantidadInsumo).val(1);
			$(nuevoNombreInsumo).attr('disabled', 'disabled');	
			$(nuevoNombreInsumo).attr("nombre", respuesta["nombre"]);	
      	    $(nuevoPrecioUnitarioInsumo).val(respuesta["precioUnitario"]);
			$(nuevoPrecioUnitarioInsumo).attr( "precioUnitarioReal",respuesta["precioUnitario"]);
			$(nuevoNombreInsumo).attr("idInsumo", respuesta["idMateria"]);

			for(i=0;i<idArray.length;i++){
		
				if(idArray[i]==$(nuevoNombreInsumo).attr("idInsumo")){

					Swal.fire({
						title: "El insumo ya está seleccionado",
						text: "¡Seleccionar otro insumo!",
						icon: "error",
						confirmButtonText: "¡Cerrar!"
					  })

					$(nuevoNombreInsumo).parent().parent().parent().remove();

					idArray.splice(i,1);
				}
			
			}

			idArray.push($(nuevoNombreInsumo).attr("idInsumo"));
			
  	        // AGRUPAR INSUMOS EN FORMATO JSON

	        listarInsumos()

			sumarTotalPrecioUnitario();

      	}

      })
	}

	})

})


/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

$(".formularioAgregarInsumo").on("change", "input.nuevaCantidadInsumo", function(){

	var precioUnitario = $(this).parent().parent().parent().children(".ingresoPrecioUnitario").children().children(".nuevoPrecioUnitarioInsumo");

	var precioUnitarioFinal = $(this).val() * precioUnitario.attr("precioUnitarioReal");

	precioUnitario.val(precioUnitarioFinal);

	var nuevoStock = Number($(this).attr("stock")) - $(this).val();

	$(this).attr("nuevoStock", nuevoStock);

		if(Number($(this).val()) > Number($(this).attr("stock"))){


			if(Number($(this).attr("stock")) <= 0){
	
				$(this).val(0);
	
				precioUnitario.val(0);
				
	
				Swal.fire({
					title: "No hay stock disponible",
					text: "¡El stock es de "+$(this).attr("stock")+" unidades!",
					icon: "error",
					confirmButtonText: "¡Cerrar!"
				  });
		
		
			 }else{
	
				/*=============================================
				SI LA CANTIDAD ES SUPERIOR AL STOCK REGRESAR VALORES INICIALES
				=============================================*/
				$(this).val($(this).attr("stock"));
	
				$(this).attr("nuevoStock", $(this).attr("stock"));
		
				var precioUnitarioFinal = $(this).val() * precioUnitario.attr("precioUnitarioReal");
		
				precioUnitario.val(precioUnitarioFinal);
		
				sumarTotalPrecioUnitario();
		
				Swal.fire({
				  title: "La cantidad supera el stock",
				  text: "¡Sólo hay "+$(this).attr("stock")+" unidades!",
				  icon: "error",
				  confirmButtonText: "¡Cerrar!"
				});
		
				return;
	
			 }
	
		}


	// SUMAR TOTAL DE PRECIOS

	sumarTotalPrecioUnitario()

    // AGRUPAR INSUMOS EN FORMATO JSON

    listarInsumos()

})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumarTotalPrecioUnitario(){

	var precioUnitarioItem = $(".nuevoPrecioUnitarioInsumo");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

	$("#nuevoTotalInsumos").val(sumaTotalPrecioUnitario);
	$("#totalInsumos").val(sumaTotalPrecioUnitario);
	$("#nuevoTotalInsumos").attr("total",sumaTotalPrecioUnitario);


}


/*=============================================
FORMATO AL PRECIO FINAL
=============================================*/

$("#nuevoTotalInsumos").number(true,3);


/*=============================================
LISTAR TODOS LOS INSUMOS
=============================================*/

function listarInsumos(){

	var listaInsumos = [];

	var nombre = $(".nuevoNombreInsumo");

	var cantidad = $(".nuevaCantidadInsumo");

	var precioUnitario = $(".nuevoPrecioUnitarioInsumo");

	for(var i = 0; i < nombre.length; i++){

		if($(nombre[i]).val() > 0){

			var nm=$(nombre[i]).attr("nombre");

		}else{
			    nm =$(nombre[i]).val();
		}

		listaInsumos.push({   "id" : $(nombre[i]).attr("idInsumo"), 
							  "nombre" : nm,
							  "cantidad" : $(cantidad[i]).val(),
							  "stock" : $(cantidad[i]).attr("nuevoStock"),
							  "precioUnitario" : $(precioUnitario[i]).attr("precioUnitarioReal"),
							  "total" : $(precioUnitario[i]).val()})

	}

	$("#listaInsumos").val(JSON.stringify(listaInsumos)); 

}



/*=============================================
BOTON EDITAR VENTA
=============================================*/
$(".tablas").on("click", ".btnEditarVenta", function(){

	var idVenta = $(this).attr("idVenta");

	window.location = "index.php?ruta=editar-venta&idVenta="+idVenta;


})

/*=============================================
FUNCIÓN PARA DESACTIVAR LOS BOTONES AGREGAR CUANDO EL INSUMO YA HABÍA SIDO SELECCIONADO EN LA CARPETA
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