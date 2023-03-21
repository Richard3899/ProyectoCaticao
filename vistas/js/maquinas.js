
$('.tablaMaquinas').DataTable( {
    "ajax": "ajax/datatable-maquinas.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"},
		//Tipo de dato (Número)
		{targets:[7], render: DataTable.render.number( '.', ',', 2, 'S/ ')},
		{targets:[9], render: DataTable.render.number( '.', ',', 2)},
		{targets:[10], render: DataTable.render.number( '.', ',', 2)},
		{targets:[11], render: DataTable.render.number( '.', ',', 2)}
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
CREAR ID PARA MAQUINA
=============================================*/

$(".tablaMaquinas").on("draw.dt", function() {

	var idMaquina = "";

	var datos = new FormData();

	datos.append("idMaquina", idMaquina);

	const arrayIdMaquinas = [];

	  $.ajax({

     	url:"ajax/maquinas.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

		if(respuesta.length!=0){
			
		for (var i=0; i<respuesta.length; i++) { 

		arrayIdMaquinas.push(respuesta[i]["idMaquina"]);
	
		}

		arrayIdMaquinas.sort(function(a, b){return a - b});

		const ultimoIdMaquina = $(arrayIdMaquinas).get(-1);
	
		$("#idMaquina").val(parseInt(ultimoIdMaquina)+1);
			
		}else{

		$("#idMaquina").val(1)

		}

	    }
		
	})
})

/*=============================================
EDITAR MAQUINA
=============================================*/

$(".tablaMaquinas tbody").on("click", "button.btnEditarMaquina", function(){

	var idMaquina = $(this).attr("idMaquina");
	
	var datos = new FormData();
    datos.append("idMaquina", idMaquina);

     $.ajax({

      url:"ajax/maquinas.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editaridMaquina").val(respuesta["idMaquina"]);

           $("#editarCodigo").val(respuesta["codigo"]);

		   $("#editarNombre").val(respuesta["nombre"]);

           $("#editarDescripcion").val(respuesta["descripcion"]);

		   $("#editarSerie").val(respuesta["serie"]);

		   $("#editarModelo").val(respuesta["modelo"]);

           $("#editarMarca").val(respuesta["marca"]);

           $("#editarPrecio").val(respuesta["precio"]);

		   $("#editarAñoCompra").val(respuesta["añoCompra"]);

		   $("#editarCapacidad").val(respuesta["capacidad"]);

		   $("#editarPotenciaHP").val(respuesta["potenciaHP"]);

		   $("#editarVidaUtil").val(respuesta["vidaUtil"]);


      }

  })

})

/*=============================================
ELIMINAR MAQUINA
=============================================*/

$(".tablaMaquinas tbody").on("click", "button.btnEliminarMaquina", function(){

	var idMaquina = $(this).attr("idMaquina");
	
	Swal.fire({

		title: '¿Está seguro de borrar el maquina?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar maquina!'
        }).then(function(result){
        if (result.value) {

        	window.location = "index.php?ruta=maquinas&idMaquina="+idMaquina;

        }


	})

})
	
/*=============================================
REVISAR SI EL MAQUINA YA ESTÁ REGISTRADO
=============================================*/

$("#nuevoCodigoMaquina").change(function(){

	$(".alert").remove();

	var maquina = $(this).val();

	var datos = new FormData();
	datos.append("validarCodigo", maquina);

	 $.ajax({
	    url:"ajax/maquinas.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoCodigoMaquina").parent().after('<div class="alert alert-warning">Este código ya existe en la base de datos</div>');

	    		$("#nuevoCodigoMaquina").val("");

	    	}

	    }

	})
})