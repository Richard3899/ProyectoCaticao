/*=============================================
TABLA RECETA MATERIAL
=============================================*/
var idRecetaC = $("#idReceta").val();

$('.tablaRecetaMateriales').DataTable( {
	"ajax": "ajax/datatable-recetamateriales.ajax.php?idRecetaC="+idRecetaC+"&permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all",
		 "sortable": false
		},
		//Tipo de dato (Número)
		{targets:[2], render: DataTable.render.number( '.', ',', 2)},
		{targets:[3], render: DataTable.render.number( '.', ',', 2, 'S/ ')},
		{targets:[4], render: DataTable.render.number( '.', ',', 2, 'S/ ')}
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
CONSULTA DE RECETA MATERIAL
=============================================*/

const idArrayRecetaMateriales=[0];

$(".tablaRecetaMateriales").on("draw.dt", function() {
	
	var x = $(".nm").val();

	if(x.length > 20){

		window.location ="recetas";

	}

	var idReceta = $("#idReceta").val();

	var datos = new FormData();

	datos.append("idReceta", idReceta);

	  $.ajax({

     	url:"ajax/recetamateriales.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){
		
		for (var i=0; i<respuesta.length; i++) { 

			idArrayRecetaMateriales.push(respuesta[i]["idMateria"]);
		
		}
		
      	}

	})
})


/*=============================================
SELECCIONAR MATERIAL DE LA RECETA
=============================================*/

$(".formularioRecetaMateriales").on("change", "select.seleccionarNombreMaterial", function(){
	
	var idMaterialDetalle = $(this).val();

	var datos = new FormData();

	datos.append("idMaterialDetalle", idMaterialDetalle);
    
	  $.ajax({

     	url:"ajax/recetamateriales.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

				if($(".seleccionarNombreMaterial").val() == ""){

					$("#nuevaCantidad").val(0);
					$("#nuevoStock").val(0);
					$(".precioMaterial").attr("precioReal",0);
					$("#precioTotal").val(0);
					$("#unidadMedidaI").val("");
					$("#unidadMedidaStockI").val("");
					
				}else{
						
					for(i=0;i<idArrayRecetaMateriales.length;i++){
		
						if(idArrayRecetaMateriales[i]==idMaterialDetalle){
				
							Swal.fire({
								icon: "error",
								title: "El material ya está en la receta",
								showConfirmButton: false,
							    timer: 2000
							  })

							$('#seleccionarNombreMaterial').val(null).trigger('change');

						}else{

							$("#idMaterial").val(respuesta["idMateria"]);
							$("#nombreMaterial").val(respuesta["nombre"]+" - "+respuesta["marca"]);
							$(".nuevaCantidadMaterial").attr("stock",respuesta["stock"]);
							$("#nuevaCantidad").val(0);
							$("#nuevoStock").val(respuesta["stock"]);
							$("#precioUnitario").val(respuesta["precioUnitario"]);
							$(".precioMaterial").val(0);
							$(".precioMaterial").attr("precioReal",respuesta["precioUnitario"]);
							
							$("#unidadMedidaI").val(respuesta["unidadMedida"]);
							$("#unidadMedidaStockI").val(respuesta["unidadMedida"]);

							if(respuesta["stock"] <= 0){

								$("#nuevaCantidad").val(0);
								$("#nuevoStock").val(0);
								$(".nuevaCantidadMaterial").attr("stock",0);
							}
							
						}
					 }

				}

			  
			  // SUMAR TOTAL DE PRECIOS
			  
			  sumaTotalPrecioRecetaMateriales();
	
      	}


	})

})

/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

$(".formularioRecetaMateriales").on("change", "input.nuevaCantidadMaterial", function(){

	var precioUnitario = $(".precioMaterial");

	var precioUnitarioFinal = $(this).val() * precioUnitario.attr("precioReal");

	precioUnitario.val(precioUnitarioFinal);

	var nuevoStock = (Number($(this).attr("stock")) - $(this).val()).toFixed(2);

	$(this).attr("nuevoStock", nuevoStock);

	$("#nuevoStock").val(nuevoStock);

		if(Number($(this).val()) > Number($(this).attr("stock"))){


			if(Number($(this).attr("stock")) <= 0){
	
				$(this).val(0);
	
				precioUnitario.val(0);

				$("#nuevoStock").val(0);
				
				Swal.fire({
					title: "No hay stock disponible",
					icon: "error",
					showConfirmButton: false,
					timer: 2000
				  });
		
		
			 }else{
	
				/*=============================================
				SI LA CANTIDAD ES SUPERIOR AL STOCK REGRESAR VALORES INICIALES
				=============================================*/

				$(this).val($(this).attr("stock"));
	
				$(this).attr("nuevoStock", $(this).attr("stock"));

				$("#nuevoStock").val(0);
		
				var precioUnitarioFinal = $(this).val() * precioUnitario.attr("precioReal");
		
				precioUnitario.val(precioUnitarioFinal);
		
				sumaTotalPrecioRecetaMateriales();
		
				Swal.fire({
				  title: "La cantidad supera el stock",
				  icon: "error",
				  showConfirmButton: false,
				  timer: 2000
				});
		
				return;
	
			 }
	
		}


	// SUMAR TOTAL DE PRECIOS

	sumaTotalPrecioRecetaMateriales()


})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumaTotalPrecioRecetaMateriales(){

	var precioUnitarioItem = $(".precioMaterial");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

	if($(".precioMaterial").attr("precioReal") == 0){

		$(".precioMaterial").val("");

	}else{

		$(".precioMaterial").val(sumaTotalPrecioUnitario.toFixed(2));
		$("#precioTotal").val(sumaTotalPrecioUnitario);

	}

}

/*=============================================
EDITAR MATERIAL DE LA RECETA
=============================================*/

$(".tablaRecetaMateriales tbody").on("click", "button.btnEditarMaterialReceta", function(){

	var idRecetaMaterial = $(this).attr("idRecetaMaterial");
	
	var datos = new FormData();

    datos.append("idRecetaMaterial", idRecetaMaterial);

     $.ajax({

      url:"ajax/recetamateriales.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		var idMaterial = respuesta["idMateria"];

		var datos = new FormData();
	
		datos.append("idMaterial", idMaterial);
	
		$.ajax({
	
			url:"ajax/materiales.ajax.php",
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
						
						$("#unidadMedidaA").val(respuesta["descripcion"]);
						$("#unidadMedidaStockA").val(respuesta["descripcion"]);
					}
					
				})
				
			}
			
		})

		   $("#editaridRecetaMaterial").val(respuesta["idRecetaMateria"]);
		   $("#editaridMaterial").val(respuesta["idMateria"]);
		   $("#editarNombreMaterial").val(respuesta["nombre"]);
		   $("#editarNombreM").attr('disabled', 'disabled');	
		   $("#editarNombreM").val(respuesta["nombre"]);

		   $(".editarCantidadMaterial").attr("edStock",(Number(respuesta["stock"])+Number(respuesta["cantidad"])));
		   $("#editarCantidad").val(respuesta["cantidad"]);
		   $("#editarStock").val(Number(respuesta["stock"]).toFixed(2));

		   $("#editarprecioUnitario").val(respuesta["precioUnitario"]);
		   $(".editarPrecioMaterial").val(respuesta["total"]);
		   $(".editarPrecioMaterial").attr("editarprecioReal",respuesta["precioUnitario"]);
		   
		   editarsumaTotalPrecioRecetaMateriales();
      }

  })

})


/*=============================================
MODIFICAR LA CANTIDAD AL EDITAR
=============================================*/

$(".formularioEditarRecetaMaterial").on("change", "input.editarCantidadMaterial", function(){

	var editarprecioUnitario = $(".editarPrecioMaterial");

	var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioReal");

	editarprecioUnitario.val(precioUnitarioFinal);

	var editarStock = (Number($(this).attr("edStock")) - $(this).val()).toFixed(2);

    $(this).attr("editarStock", editarStock);

	$("#editarStock").val(editarStock);
    
		if(Number($(this).val()) > Number($(this).attr("edStock"))){


			if(Number($(this).attr("edStock")) <= 0){
	
				$(this).val(0);
	
				editarprecioUnitario.val(0);
				
				Swal.fire({
					title: "No hay stock disponible",
					icon: "error",
					showConfirmButton: false,
					timer: 2000
				  });
		
		
			 }else{
	
				/*=============================================
				SI LA CANTIDAD ES SUPERIOR AL STOCK REGRESAR VALORES INICIALES
				=============================================*/
				$(this).val($(this).attr("edStock"));
	
				$(this).attr("editarStock", $(this).attr("edStock"));
				
				$("#editarStock").val(0);

				var precioUnitarioFinal = $(this).val() * editarprecioUnitario.attr("editarprecioReal");
		
				editarprecioUnitario.val(precioUnitarioFinal);
		
				editarsumaTotalPrecioRecetaMateriales();
		
				Swal.fire({
				  title: "La cantidad supera el stock",
				  icon: "error",
				  showConfirmButton: false,
				  timer: 2000
				});
		
				return;
	
			 }
	
		}


	// SUMAR TOTAL DE PRECIOS

	editarsumaTotalPrecioRecetaMateriales();


})

/*=============================================
SUMAR TODOS LOS PRECIOS AL EDITAR
=============================================*/

function editarsumaTotalPrecioRecetaMateriales(){

	var precioUnitarioItem = $(".editarPrecioMaterial");

	var arraySumaPrecioUnitario = [];  

	for(var i = 0; i < precioUnitarioItem.length; i++){

		 arraySumaPrecioUnitario.push(Number($(precioUnitarioItem[i]).val()));
		 
	}


	function sumaArrayPrecioUnitario(total, numero){

		return total + numero;

	}

	var sumaTotalPrecioUnitario = arraySumaPrecioUnitario.reduce(sumaArrayPrecioUnitario,0);

	if($(".editarPrecioMaterial").attr("editarprecioReal") == 0){

		$(".editarPrecioMaterial").val("");

	}else{

		$(".editarPrecioMaterial").val(sumaTotalPrecioUnitario.toFixed(2));
		$("#editarprecioTotal").val(sumaTotalPrecioUnitario);

	}

}


/*=============================================
ELIMINAR MATERIAL DE LA RECETA
=============================================*/

$(".tablaRecetaMateriales tbody").on("click", "button.btnEliminarMaterialReceta", function(){

	var codigoReceta = $("#codigoReceta").val();
	var idReceta = $("#idReceta").val();
	var nombreReceta = $("#nombreReceta").val();
	var idRecetaMaterial = $(this).attr("idRecetaMaterial");
	var idMaterial = $(this).attr("idMaterial");
	
	Swal.fire({

		title: '¿Está seguro de borrar el material?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar material!'
        }).then(function(result){
        if (result.value) {

        window.location = "index.php?ruta=recetamateriales&idRecetaMaterial="+idRecetaMaterial+"&idMaterial="+idMaterial+"&codigoReceta="+codigoReceta+"&nombreReceta="+nombreReceta+"&idReceta="+idReceta;

        }


	})

})

