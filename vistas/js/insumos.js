$('.tablaInsumos').DataTable( {
    "ajax": "ajax/datatable-insumos.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
    "deferRender": true,
	"columnDefs": [
		{"className": "dt-center", "targets": "_all"},
		//Tipo de dato (Número)
		{targets:[7], render: DataTable.render.number( '.', ',', 2)},
		{targets:[8,9], render: DataTable.render.number( '.', ',', 2, 'S/ ')}
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
CREAR ID PARA INSUMO
=============================================*/

$(".tablaInsumos").on("draw.dt", function() {

	var idInsumo = "";

	var datos = new FormData();

	datos.append("idInsumo", idInsumo);

	const arrayIdInsumos = [];

	  $.ajax({

     	url:"ajax/insumos.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

		if(respuesta.length!=0){
			
		for (var i=0; i<respuesta.length; i++) { 

		arrayIdInsumos.push(respuesta[i]["idMateria"]);
	
		}

		arrayIdInsumos.sort(function(a, b){return a - b});

		const ultimoIdInsumo = $(arrayIdInsumos).get(-1);
	
		$("#idInsumo").val(parseInt(ultimoIdInsumo)+1);
			
		}else{

		$("#idInsumo").val(1)

		}

	    }
		

	})
})
/*=============================================
SUBIENDO LA FOTO DEL INSUMO
=============================================*/

$(".nuevaImagenInsumo").change(function(){

	var imagen = this.files[0];
	
	/*=============================================
  	VALIDAMOS EL FORMATO DE LA IMAGEN SEA JPG O PNG
  	=============================================*/

  	if(imagen["type"] != "image/jpeg" && imagen["type"] != "image/png"){

		$(".nuevaImagenInsumo").val("");

		 Swal.fire({
			title: "Error al subir la imagen",
			text: "¡La imagen debe estar en formato JPG o PNG!",
			icon: "error",
			confirmButtonText: "¡Cerrar!"
		  });

	}else if(imagen["size"] > 2000000){

		$(".nuevaImagenInsumo").val("");

		 Swal.fire({
			title: "Error al subir la imagen",
			text: "¡La imagen no debe pesar más de 2MB!",
			icon: "error",
			confirmButtonText: "¡Cerrar!"
		  });

	}
	else{

  		var datosImagen = new FileReader;
  		datosImagen.readAsDataURL(imagen);

  		$(datosImagen).on("load", function(event){

  			var rutaImagen = event.target.result;

  			$(".previsualizar").attr("src", rutaImagen);

  		})

  	}
})

/*=============================================
EDITAR INSUMO
=============================================*/

$(".tablaInsumos tbody").on("click", "button.btnEditarInsumo", function(){

	var idInsumo = $(this).attr("idInsumo");
	
	var datos = new FormData();
    datos.append("idInsumo", idInsumo);

     $.ajax({

      url:"ajax/insumos.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      dataType:"json",
      success:function(respuesta){

		   $("#editaridInsumo").val(respuesta["idMateria"]);

           $("#editarCodigo").val(respuesta["codigo"]);

		   $("#editarNombre").val(respuesta["nombre"]);

           $("#editarDescripcion").val(respuesta["descripcion"]);

		   $('#editarMarca').val(respuesta["idMarca"]).trigger('change.select2');

		   $("#editarUnidadMedida").val(respuesta["idUnidadMedida"]);

           $("#editarCantidad").val(respuesta["cantidad"]);

           $("#editarPrecio").val(respuesta["precio"]);

		   $("#ImagenInsumoActual").val(respuesta["imagen"]);

           if(respuesta["imagen"] != ""){

           	$(".previsualizar").attr("src",respuesta["imagen"]);

           }

      }

  })

})

/*=============================================
ELIMINAR INSUMO
=============================================*/

$(".tablaInsumos tbody").on("click", "button.btnEliminarInsumo", function(){

	var idInsumo = $(this).attr("idInsumo");
	var codigo = $(this).attr("codigo");
	var imagen = $(this).attr("imagen");
	
	Swal.fire({

		title: '¿Está seguro de borrar el insumo?',
		text: "¡Si no lo está puede cancelar la acción!",
		icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar insumo!'
        }).then(function(result){
        if (result.value) {

        	window.location = "index.php?ruta=insumos&idInsumo="+idInsumo+"&imagen="+imagen+"&codigo="+codigo;

        }


	})

})
	
/*=============================================
REVISAR SI EL INSUMO YA ESTÁ REGISTRADO
=============================================*/

$("#nuevoCodigo").change(function(){

	$(".alert").remove();

	var insumo = $(this).val();

	var datos = new FormData();
	datos.append("validarCodigo", insumo);

	 $.ajax({
	    url:"ajax/insumos.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoCodigo").parent().after('<div class="alert alert-warning">Este código ya existe en la base de datos</div>');

	    		$("#nuevoCodigo").val("");

	    	}

	    }

	})
})