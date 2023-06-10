$('.tablaMesGasto').DataTable( {
    "ajax": "ajax/datatable-mesgasto.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"}
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


/*=============================================
EDITAR MES
=============================================*/

$(".tablaMesGasto tbody").on("click", "button.btnEditarMesGasto", function(){

	var idMesGasto = $(this).attr("idMesGasto");
	
	var datos = new FormData();

    datos.append("idMesGasto", idMesGasto);

     $.ajax({

      url:"ajax/mesgasto.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#idMesGasto").val(respuesta["idMesGasto"]);

		   $("#editarDescripcion").val(respuesta["descripcion"]);

      }

  })

})


/*=============================================
ELIMINAR MES GASTO
=============================================*/

$(".tablaMesGasto tbody").on("click", "button.btnEliminarMesGasto", function(){

	var idMesGasto = $(this).attr("idMesGasto");

	Swal.fire({

		title: '¿Está seguro de borrar el mes?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar mes!'
        }).then(function(result){
        if (result.value) {

        	window.location = "index.php?ruta=mesgasto&idMesGasto="+idMesGasto;

        }


	})

})

/*=============================================
REVISAR SI EL MES YA ESTÁ REGISTRADO
=============================================*/

$("#nuevoMes").change(function(){

	$(".alert").remove();

	var mes = $(this).val();

	var datos = new FormData();
	datos.append("validarFecha", mes+"-01");

	 $.ajax({
	    url:"ajax/mesgasto.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoMes").parent().after('<div class="alert alert-warning">Este mes ya está registrado</div>');

	    		$("#nuevoMes").val("");

	    	}

	    }

	})
})

/*=============================================
CERRAR MES
=============================================*/

$(".tablaMesGasto tbody").on("click", "button.btnCerrarMes", function(){

	var idMesGasto = $(this).attr("idMesGasto");

	Swal.fire({

		title: '¿Está seguro de cerrar el mes?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, cerrar mes!'
        }).then(function(result){
        if (result.value) {

			window.location = "index.php?ruta=mesgasto&idMGasto="+idMesGasto;

        }

	})

})

/*=============================================
OCULTAR MES
=============================================*/

$(".tablaMesGasto tbody").on("click", "button.btnOcultarMes", function(){

	var idMesGasto = $(this).attr("idMesGasto");

	var datos = new FormData();

	datos.append("idMesGasto3", idMesGasto);

	$.ajax({

		url:"ajax/costoreceta.ajax.php",
		method: "POST",
		data: datos, 
		cache: false,
		contentType: false,
		processData: false,
		dataType:"json",
		success:function(respuesta){
        
			if(respuesta!=""){

				var GastosNoAgregados=[];

				for (var i=0; i<respuesta.length; i++) { 

					GastosNoAgregados.push(respuesta[i]["nombreGastoAdmin"]);
						
				}

				Swal.fire({

					title: 'Hay gastos que no fueron asignados a ninguna receta como :',
					text: GastosNoAgregados,
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					cancelButtonText: 'Cancelar',
					confirmButtonText: 'Continuar'
					}).then(function(result){

					if (result.value) {

						var datos2 = new FormData();

						datos2.append("idMesGasto4", idMesGasto);
		
						$.ajax({
		
							url:"ajax/costoreceta.ajax.php",
							method: "POST",
							data: datos2, 
							cache: false,
							contentType: false,
							processData: false,
							dataType:"json",
							success:function(respuesta){
							
								if(respuesta!=""){
				
									var RecetasDelMes=[];
					
									for (var i=0; i<respuesta.length; i++) { 
					
										RecetasDelMes.push(respuesta[i]["codigo"]);
											
									}
		
									Swal.fire({
		
										title: '¿Está seguro de ocultar el mes?',
										text: "Los gastos del mes fueron asignados a las recetas : "+RecetasDelMes,
										icon: 'warning',
										showCancelButton: true,
										confirmButtonColor: '#3085d6',
										cancelButtonColor: '#d33',
										cancelButtonText: 'Cancelar',
										confirmButtonText: 'Si, ocultar mes!'
										}).then(function(result){
										if (result.value) {
								
											window.location = "index.php?ruta=mesgasto&idM2Gasto="+idMesGasto;
								
										}
								
									})
		
								}else{

									Swal.fire({

										title: '¿Está seguro de ocultar el mes?',
										text: "¡No se ha asignado los gastos a ninguna receta!",
										icon: 'error',
										showCancelButton: true,
										confirmButtonColor: '#3085d6',
										cancelButtonColor: '#d33',
										cancelButtonText: 'Cancelar',
										confirmButtonText: 'Si, ocultar mes!'
										}).then(function(result){
										if (result.value) {
								
											window.location = "index.php?ruta=mesgasto&idM2Gasto="+idMesGasto;
								
										}
								
									})

								}
					
							}
					
						})

					}
			
				})
				
			}else{

				var datos3 = new FormData();

				datos3.append("idMesGasto4", idMesGasto);

				$.ajax({

					url:"ajax/costoreceta.ajax.php",
					method: "POST",
					data: datos3, 
					cache: false,
					contentType: false,
					processData: false,
					dataType:"json",
					success:function(respuesta){
					
						if(respuesta!=""){
			
							var RecetasDelMes=[];
			
							for (var i=0; i<respuesta.length; i++) { 
			
								RecetasDelMes.push(respuesta[i]["codigo"]);
									
							}

							Swal.fire({

								title: '¿Está seguro de ocultar el mes?',
								text: "Los gastos del mes fueron asignados a las recetas : "+RecetasDelMes,
								icon: 'warning',
								showCancelButton: true,
								confirmButtonColor: '#3085d6',
								cancelButtonColor: '#d33',
								cancelButtonText: 'Cancelar',
								confirmButtonText: 'Si, ocultar mes!'
								}).then(function(result){
								if (result.value) {
						
									window.location = "index.php?ruta=mesgasto&idM2Gasto="+idMesGasto;
						
								}
						
							})

						}else{

							Swal.fire({

								title: '¿Está seguro de ocultar el mes?',
								text: "¡No se ha asignado los gastos a ninguna receta!",
								icon: 'error',
								showCancelButton: true,
								confirmButtonColor: '#3085d6',
								cancelButtonColor: '#d33',
								cancelButtonText: 'Cancelar',
								confirmButtonText: 'Si, ocultar mes!'
								}).then(function(result){
								if (result.value) {
						
									window.location = "index.php?ruta=mesgasto&idM2Gasto="+idMesGasto;
						
								}
						
							})

						}
			
					}
			
				})

			}

		}

	})

})


/*=============================================
TABLA GASTO POR MES
=============================================*/

$(".tablaMesGasto tbody").on("click", "button.btnDetalleMesGasto", function(){

	var idMesGastoC = $(this).attr("idMesGasto");
	var descripcion = $(this).attr("descripcionMes");

	$("#descripcionMes").html("Detalle de los gastos de "+descripcion);

	var table = $('.tablaGastoAdminPorMes2').DataTable();
	
	table.destroy();

	$('.tablaGastoAdminPorMes2').DataTable( {
		"ajax": "ajax/datatable-gastoadminpormes.ajax.php?idMesGastoC="+idMesGastoC+"&permisoEditar="+0+"&permisoEliminar="+0,
		"deferRender": true,
		"columnDefs": [
			{"className": "dt-center", "targets": "_all",
				"sortable": false
			}, 
			//Tipo de dato (Número)
			{targets:[3], render: DataTable.render.number( '.', ',', 2)},
			{targets:[4], render: DataTable.render.number( '.', ',', 2, 'S/ ')},
			{targets:[5], render: DataTable.render.number( '.', ',', 2, 'S/ ')}
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

})
		
	
	
	