$('.tablaUsuarios').DataTable( {
    "ajax": "ajax/datatable-usuarios.ajax.php",
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
CONSULTA DE RECETA INSUMO
=============================================*/

$(".tablaUsuarios").on("draw.dt", function() {

	var idUsuario = "ABC";

	var datos = new FormData();

	datos.append("idUsuario", idUsuario);

	  $.ajax({

     	url:"ajax/usuarios.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

			$("#idUsuario").val((respuesta.length)+1);
		
      	}

	})
})


function validarModulos(){

    if($('#nuevoNombre').val()=="" || $('#nuevoUsuario').val()=="" || $('#nuevoPassword').val()=="" || $('#nuevoPerfil').val()==""){

		Swal.fire({
			title: "Completar datos del usuario.",
			icon: "error",
			showConfirmButton: false,
			timer: 1500
		  })

		return false;
		
	}else if ($('.checkModulos:checked').val()==null) {

		Swal.fire({
			title: "Debe seleccionar al menos un modulo.",
			icon: "error",
			showConfirmButton: false,
			timer: 1500
		  })

		return false;
		   
	}else{

		return true;
	}
	
}

//  $(".guardarUsuario").on("click", function(){
	 	
// 	arrayModu=[];
// 	arrayModu=$('.checkModulos:checked').val();
// 	console.log(arrayModu);

//  })

$("#navDatos").click(function(){
	$("#nuevoNombre").attr("required", true);
	$('#nuevoUsuario').attr("required", true); 
	$('#nuevoPassword').attr("required", true);
	$('#nuevoPerfil').attr("required", true);
	$("#panelPermisos").removeClass("show");
	$("#panelDatos").addClass("show");
	$("#navDatos").addClass("active");
	$("#navPermisos").removeClass("active");

});
$("#navPermisos").click(function(){
	$('#nuevoNombre').removeAttr('required');
	$('#nuevoUsuario').removeAttr('required'); 
	$('#nuevoPassword').removeAttr('required'); 
	$('#nuevoPerfil').removeAttr('required'); 
	$("#panelDatos").removeClass("show");
	$("#panelPermisos").addClass("show");
	$("#navPermisos").addClass("active");
	$("#navDatos").removeClass("active");
});


/*=============================================
SUBIENDO LA FOTO DEL USUARIO
=============================================*/
$(".nuevaFoto").change(function(){
	
	var imagen = this.files[0];
	
	/*=============================================
  	VALIDAMOS EL FORMATO DE LA IMAGEN SEA JPG O PNG
  	=============================================*/

  	if(imagen["type"] != "image/jpeg" && imagen["type"] != "image/png"){

  		$(".nuevaFoto").val("");

  		 Swal.fire({
		      title: "Error al subir la imagen",
		      text: "¡La imagen debe estar en formato JPG o PNG!",
		      icon: "error",
		      confirmButtonText: "¡Cerrar!"
		    });

  	}else if(imagen["size"] > 2000000){

  		$(".nuevaFoto").val("");

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
EDITAR USUARIO
=============================================*/
$(document).on("click", ".btnEditarUsuario", function(){

	var idUsuario = $(this).attr("idUsuario");
	
	var datos = new FormData();
	datos.append("idUsuario", idUsuario);

	$.ajax({

		url:"ajax/usuarios.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function(respuesta){

			$("#editarNombre").val(respuesta["nombre"]);
			$("#editarUsuario").val(respuesta["usuario"]);
			$("#editarPerfil").html(respuesta["perfil"]);
			$("#editarPerfil").val(respuesta["perfil"]);
			$("#passwordActual").val(respuesta["password"]);

			if(respuesta["foto"] != ""){

				$("#fotoActual").val(respuesta["foto"]);

				$(".previsualizar").attr("src", respuesta["foto"]);
				
			}

				
	        $("#cInsumos:checkbox").prop('checked', true);

		}

	});

})

/*=============================================
ACTIVAR USUARIO
=============================================*/
$(document).on("click", ".btnActivar", function(){

	var idUsuario = $(this).attr("idUsuario");
	var estadoUsuario = $(this).attr("estadoUsuario");

	var datos = new FormData();
 	datos.append("activarId", idUsuario);
  	datos.append("activarUsuario", estadoUsuario);

  	$.ajax({

	  url:"ajax/usuarios.ajax.php",
	  method: "POST",
	  data: datos,
	  cache: false,
      contentType: false,
      processData: false,
      success: function(respuesta){

      	if(window.matchMedia("(max-width:767px)").matches){
		
      		 Swal.fire({
		      	title: "El usuario ha sido actualizado",
		      	icon: "success",
				showConfirmButton: false,
				timer: 1000
		    	}).then(function(result) {
		        
		        	window.location = "usuarios";

		      });


		}else{

			Swal.fire({
				title: "El usuario ha sido actualizado",
				icon: "success",
			    showConfirmButton: false,
			    timer: 1000
			  })

		}
      }

  	})

  	if(estadoUsuario == 0){

  		$(this).removeClass('btn-success');
  		$(this).addClass('btn-danger');
  		$(this).html('Desactivado');
  		$(this).attr('estadoUsuario',1);

  	}else{

  		$(this).addClass('btn-success');
  		$(this).removeClass('btn-danger');
  		$(this).html('Activado');
  		$(this).attr('estadoUsuario',0);

  	}

})

/*=============================================
REVISAR SI EL USUARIO YA ESTÁ REGISTRADO
=============================================*/

$("#nuevoUsuario").change(function(){

	$(".alert").remove();

	var usuario = $(this).val();

	var datos = new FormData();
	datos.append("validarUsuario", usuario);

	 $.ajax({
	    url:"ajax/usuarios.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		$("#nuevoUsuario").parent().after('<div class="alert alert-warning">Este usuario ya existe en la base de datos</div>');

	    		$("#nuevoUsuario").val("");

	    	}

	    }

	})
})

/*=============================================
ELIMINAR USUARIO
=============================================*/
$(document).on("click", ".btnEliminarUsuario", function(){

  var idUsuario = $(this).attr("idUsuario");
  var fotoUsuario = $(this).attr("fotoUsuario");
  var usuario = $(this).attr("usuario");

  Swal.fire({
    title: '¿Está seguro de borrar el usuario?',
    text: "¡Si no lo está puede cancelar la acción!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      cancelButtonText: 'Cancelar',
      confirmButtonText: 'Si, borrar usuario'
  }).then(function(result){

    if(result.value){

      window.location = "index.php?ruta=usuarios&idUsuario="+idUsuario+"&usuario="+usuario+"&fotoUsuario="+fotoUsuario;

    }

  })

})


/*=============================================
CERRAR SESIÓN
=============================================*/
$(document).on("click", ".btnCerrarSesion", function(){
  
	Swal.fire({
	  title: '¿Está seguro de cerrar sesión?',
	  text: "¡Si no lo está puede cancelar la acción!",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		cancelButtonText: 'Cancelar',
		confirmButtonText: 'Si, cerrar sesión'
	}).then(function(result){
  
	  if(result.value){

		window.location = 'salir';
  
	  }
  
	})
  
  })
  






