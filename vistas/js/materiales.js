
$('.tablaMateriales').DataTable( {
    "ajax": "ajax/datatable-materiales.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar,
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
CREAR ID PARA MATERIALES
=============================================*/

$(".tablaMateriales").on("draw.dt", function() {

	var idMaterial = "";

	var datos = new FormData();

	datos.append("idMaterial", idMaterial);

	const arrayIdMateriales = [];

	  $.ajax({

     	url:"ajax/materiales.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

		if(respuesta.length!=0){
			
		for (var i=0; i<respuesta.length; i++) { 

		arrayIdMateriales.push(respuesta[i]["idMateria"]);
	
		}

		arrayIdMateriales.sort(function(a, b){return a - b});

		const ultimoIdMaterial = $(arrayIdMateriales).get(-1);
	
		$("#idMaterial").val(parseInt(ultimoIdMaterial)+1);
			
		}else{

		$("#idMaterial").val(1)

		}

	    }
		

	})
})

/*=============================================
SUBIENDO LA FOTO DEL INSUMO
=============================================*/

$(".nuevaImagenMaterial").change(function(){

	var imagen = this.files[0];
	
	/*=============================================
  	VALIDAMOS EL FORMATO DE LA IMAGEN SEA JPG O PNG
  	=============================================*/

  	if(imagen["type"] != "image/jpeg" && imagen["type"] != "image/png"){

		$(".nuevaImagenMaterial").val("");

		 Swal.fire({
			title: "Error al subir la imagen",
			text: "¡La imagen debe estar en formato JPG o PNG!",
			icon: "error",
			confirmButtonText: "¡Cerrar!"
		  });

	}else if(imagen["size"] > 2000000){

		$(".nuevaImagenMaterial").val("");

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
EDITAR MATERIAL
=============================================*/

$(".tablaMateriales tbody").on("click", "button.btnEditarMaterial", function(){

	var idMaterial = $(this).attr("idMaterial");
	
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

		   $("#editaridMaterial").val(respuesta["idMateria"]);

           $("#editarCodigo").val(respuesta["codigo"]);

		   $("#editarNombre").val(respuesta["nombre"]);

           $("#editarDescripcion").val(respuesta["descripcion"]);

		   $("#editarMarca").val(respuesta["idMarca"]);

		   $("#editarUnidadMedida").val(respuesta["idUnidadMedida"]);

           $("#editarCantidad").val(respuesta["cantidad"]);

           $("#editarPrecio").val(respuesta["precio"]);

		   $("#ImagenMaterialActual").val(respuesta["imagen"]);

           if(respuesta["imagen"] != ""){

           	$(".previsualizar").attr("src",respuesta["imagen"]);

           }

      }

  })

})


/*=============================================
ELIMINAR MATERIAL
=============================================*/

$(".tablaMateriales tbody").on("click", "button.btnEliminarMaterial", function(){

	var idMaterial = $(this).attr("idMaterial");
	var codigo = $(this).attr("codigo");
	var imagen = $(this).attr("imagen");
	
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

        	window.location = "index.php?ruta=materiales&idMaterial="+idMaterial+"&imagen="+imagen+"&codigo="+codigo;

        }


	})

})

/*=============================================
REVISAR SI EL MATERIAL YA ESTÁ REGISTRADO
=============================================*/

$("#nuevoCodigoMaterial").change(function(){

	$(".alert").remove();

	var material = $(this).val();

	var datos = new FormData();
	datos.append("validarCodigo", material);

	 $.ajax({
	    url:"ajax/materiales.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoCodigoMaterial").parent().after('<div class="alert alert-warning">Este código ya existe en la base de datos</div>');

	    		$("#nuevoCodigoMaterial").val("");

	    	}

	    }

	})
})