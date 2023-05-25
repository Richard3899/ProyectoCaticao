const datosAjax=[];
const indice= [];
const valoresRecetas= [];
const valoresGastos = [];
var tablaInicial;
var tablaFinal;

function iniciar(){
	tablaAsignacionInicial();
	tablaCostoReceta();
	CerrarAdicional();
}

function tablaCostoReceta(){

	$('.tablaCostoReceta').DataTable( {
		"ajax": "ajax/datatable-costoreceta.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
		"deferRender": true,
		"columnDefs": [
			{"className": "dt-center", "targets": "_all"},
			//Tipo de dato (Número)
			{targets:[3], render: DataTable.render.number( '.', ',', 2)},
			{targets: [4], render: DataTable.render.moment("YYYY-MM-DD","DD/MM/YYYY")}
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
}

function tablaAsignacionInicial(){

	tablaInicial=$('.tablaAsignacionAdicionales').dataTable( {
		"searching": false,
		"columnDefs": [{"className": "dt-center", "targets": "_all"},
					   { "title": "Recetas", "targets": 0 }],
		"paging": false,
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
}


/*=============================================
INICIALIZA LA TABLA DE COSTOS
=============================================*/
$(".tablaCostoReceta").on("draw.dt", function() {

	$("#nuevoTipoGasto").prop("disabled", true);

})

/*=============================================
SELECCIONAR MES
=============================================*/

$(".seleccionarMesGasto").on("change", function(){

	datosAjax.length = 0;

	var idMesGasto = $(this).val();

	if(idMesGasto != ""){

	$("#nuevoTipoGasto").prop("disabled", false);

	var datos = new FormData();
	datos.append("idMesGasto2", idMesGasto);

	$.ajax({
        url: "ajax/costoreceta.ajax.php",
		method: "POST",
		data: datos, 
		cache: false,
		contentType: false,
		processData: false,
		dataType:"json",
	    success: function(datos){

		var dt="<option value=''>Seleccionar :</option>";
		for (let i = 0; i < datos.length; i++) {
			dt+="<option value='"+datos[i]["idTipoGasto"]+"'>"+datos[i]["descripcion"]+"</option>";
		}
		$("#nuevoTipoGasto").html(dt);
        }
    });

	CargarTablaInicial();

	}
	else{

	$("#nuevoTipoGasto").val("");
	$("#nuevoTipoGasto").prop("disabled", true);

	CargarTablaInicial();

	}
	
})

function LimpiarModalAsignar(){

	CargarTablaInicial();

}

function CargarTablaInicial(){

	var table = $('.tablaAsignacionAdicionales').DataTable();
	
	table.destroy();

	$('.tablaAsignacionAdicionales').empty();

	tablaAsignacionInicial();

}

/*=============================================
GUARDAR LOS GASTOS SELECCIONADOS EN UN ARRAY
=============================================*/
$( document ).on( 'click', '.checkGastos', function() {

	if( $(this).is(':checked') ){

		valoresRecetas.push($(this).attr('idReceta'));
		valoresGastos.push(this.value);
		indice.push($(this).attr('index'));

    }else{

		var index =indice.indexOf($(this).attr('index'));
		indice.splice(index, 1);
		valoresRecetas.splice(index, 1);
		valoresGastos.splice(index, 1);
		
	}
	$("#indice").val(indice);
	$("#idReceta").val(valoresRecetas);
	$("#idGastoAdminPorMes").val(valoresGastos)
	
	console.log(indice); 
	console.log(valoresRecetas)
	console.log(valoresGastos)	

} );

/*=============================================
CADA VEZ QUE SE CAMBIE EL TIPO DE GASTO
=============================================*/
$("#nuevoTipoGasto").on("change", function() {
	
	datosAjax.length = 0;

	var idMesGasto = $("#seleccionarMesGasto").val();
	var idTipoGasto = $(this).val();

	mostrarRecetasYGastos(idMesGasto,idTipoGasto)
	
	
})

function mostrarRecetasYGastos(idMesGasto,idTipoGasto){

	var datos = new FormData();

	datos.append("idMesGasto2", idMesGasto);
	datos.append("idTipoGasto", idTipoGasto);
	
	$.ajax({
		url:"ajax/gastoadminpormes.ajax.php",
		method: "POST",
		data: datos, 
		cache: false,
		contentType: false,
		processData: false,
		dataType:"json",
			success:function(respuesta){

			datosAjax.push({"className": "dt-center", "targets": "_all"},
			{ 
				"title"    : 'N°',
				"targets"  : 0
			},{ 
				"title"    : 'Receta',
				"targets"  : 1
			});

			for (var i=0; i<respuesta.length; i++) { 

				datosAjax.push({ 
					"title"    : respuesta[i]["codigo"],
					"targets"  : i+2
				});
			
			}

			tablaAdicionales(idMesGasto,idTipoGasto)

			$('.tablaAsignacionAdicionales').DataTable().on("draw", function(){
				if($("#nuevoTipoGasto").val()!=""){
					MarcarGastos(idMesGasto,idTipoGasto);
				}
				
			})

		}

		
	}) 
}

function tablaAdicionales(idMesGasto,idTipoGasto){

	var table = $('.tablaAsignacionAdicionales').DataTable();
	
	table.destroy();

	$('.tablaAsignacionAdicionales').empty();
	
	tablaFinal =$('.tablaAsignacionAdicionales').DataTable( {
		"ajax": "ajax/datatable-asignacionadiconales.ajax.php?idTipoGasto="+idTipoGasto+"&idMesGasto="+idMesGasto,
		"processing": true,
		"columnDefs": datosAjax,
		"scrollX": true,
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
	});
}
/*=============================================
CARGAR GASTOS MARCADOS
=============================================*/
function MarcarGastos(idMesGasto,idTipoGasto){

		var datos2 = new FormData();

		datos2.append("idMesGasto", idMesGasto);
		datos2.append("idTipoGasto", idTipoGasto);

		$.ajax({

			url:"ajax/costoreceta.ajax.php",
			method: "POST",
			data: datos2, 
			cache: false,
			contentType: false,
			processData: false,
			dataType:"json",
				success:function(respuesta){

				indice.length = 0;
				valoresGastos.length = 0;
				valoresRecetas.length = 0;

				var index=[];
				var idReceta=[];
				var idGastoAdminPorMes=[];
			
				for (var i=0; i<respuesta.length; i++) { 

				index.push(respuesta[i]["indice"]);
				indice.push(respuesta[i]["indice"]);

				idReceta.push(respuesta[i]["idReceta"]);
				valoresRecetas.push(respuesta[i]["idReceta"]);

				idGastoAdminPorMes.push(respuesta[i]["idGastoAdminPorMes"]);
				valoresGastos.push(respuesta[i]["idGastoAdminPorMes"]);

				}

				console.log(indice)


				$.each(idReceta, function(i,rc){
				
				$('.checkGastos').each(function(){

					var idRecetaDT = $(this).attr('idReceta');
					var idGastoAdminPorMesDT = $(this).val();
 
					if(idRecetaDT == rc && idGastoAdminPorMesDT==idGastoAdminPorMes[i]){

						$(this).prop('checked', true);

					}
							
				});

				});

			}
	
		}) 
}

/*=============================================
CERRAR ADICIONAL
=============================================*/
function CerrarAdicional(){
	$(".tablaCostoReceta tbody").on("click", "button.btnCerrarAdicional", function(){

		var idReceta = $(this).attr("idReceta");
	
		Swal.fire({
	
			title: '¿Está seguro de cerrar los adicionales?',
			text: "¡Si no lo está puede cancelar la acción!",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			cancelButtonText: 'Cancelar',
			confirmButtonText: 'Si, cerrar adicionales!'
			}).then(function(result){
			if (result.value) {
	
				window.location = "index.php?ruta=costoreceta&idReceta="+idReceta;
	
			}
	
		})
	
	})
	
}

iniciar();