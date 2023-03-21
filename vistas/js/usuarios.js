$('.tablaUsuarios').DataTable( {
    "ajax": "ajax/datatable-usuarios.ajax.php?permisoEditar="+permisoEditar+"&permisoEliminar="+permisoEliminar+"&idUsuarioSession="+idUsuarioSession,
    "deferRender": true,
	"columnDefs": [
		{targets: [6], render: DataTable.render.moment("YYYY-MM-DD HH:mm:ss","DD/MM/YYYY HH:mm:ss")},
		{"className": "dt-center", "targets": "_all"}
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
CREAR ID PARA USUARIO
=============================================*/

$(".tablaUsuarios").on("draw.dt", function() {

	var idUsuario = "";

	var datos = new FormData();

	datos.append("idUsuario", idUsuario);

	const arrayIdUsuarios = [];
	  $.ajax({

     	url:"ajax/usuarios.ajax.php",
      	method: "POST",
      	data: datos,
      	cache: false,
      	contentType: false,
      	processData: false,
      	dataType:"json",
      	success:function(respuesta){

		if(respuesta.length!=0){
			
			for (var i=0; i<respuesta.length; i++) { 

				arrayIdUsuarios.push(respuesta[i]["idUsuario"]);
	
			}
			arrayIdUsuarios.sort(function(a, b){return a - b});

			const ultimoIdUsuario = $(arrayIdUsuarios).get(-1);
	
			$("#idUsuario").val(parseInt(ultimoIdUsuario)+1);
			
		}else{

			$("#idUsuario").val(1)

		}
      	
	    }

	})
})


function validarModulos(){

    if ($('.checkModulos:checked').val()==null) {

		Swal.fire({
			title: "Debe seleccionar al menos un modulo.",
			icon: "error",
			showConfirmButton: false,
			timer: 2000
		  });

		  panelPermisos();

		return false;
		   
	}else{
		
		return true;
	}
	
}

function editarValidarModulos(){

    if ($('.editarCheckModulos:checked').val()==null && $('#editaridUsuario').val()!=1) {

		Swal.fire({
			title: "Debe seleccionar al menos un modulo.",
			icon: "error",
			showConfirmButton: false,
			timer: 2000
		  });

		editarPanelPermisos();

		return false;
		   
	}else{
		
		return true;
	}
	
}

function panelDatos(){

	$("#panelPermisos").removeClass("show");
	$("#panelDatos").addClass("show");
	$("#navDatos").addClass("active");
	$("#navPermisos").removeClass("active");
	 
}
$("#navDatos").click(function(){
 panelDatos();
});

function panelPermisos(){

	$("#panelDatos").removeClass("show");
	$("#panelPermisos").addClass("show");
	$("#navPermisos").addClass("active");
	$("#navDatos").removeClass("active");

}
$("#navPermisos").click(function(){

	var nombre = document.getElementById("nuevoNombre");
	var usuario = document.getElementById("nuevoUsuario");
	var password = document.getElementById("nuevoPassword");
	var perfil = document.getElementById("nuevoidPerfil");

	if (!nombre.checkValidity() || !usuario.checkValidity() || !password.checkValidity() || !perfil.checkValidity()) {
	  
	  $("#navPermisos").removeClass("active");

	  document.getElementById("guardarUsuario").click();
	}else{
	
		panelPermisos();
	}
  
});


function editarPanelDatos(){
	$("#editarPanelPermisos").removeClass("show");
	$("#editarPanelDatos").addClass("show");
	$("#navDatosEditar").addClass("active");
	$("#navPermisosEditar").removeClass("active"); 
}

$("#navDatosEditar").click(function(){
 editarPanelDatos();
});

function editarPanelPermisos(){
	$("#editarPanelDatos").removeClass("show");
	$("#editarPanelPermisos").addClass("show");
	$("#navPermisosEditar").addClass("active");
	$("#navDatosEditar").removeClass("active");
}

$("#navPermisosEditar").click(function(){

	var nombre = document.getElementById("editarNombre");
	var perfil = document.getElementById("editaridPerfil");

	if (!nombre.checkValidity() || !perfil.checkValidity()) {
	  
	  $("#navPermisosEditar").removeClass("active");

	  document.getElementById("modificarUsuario").click();
	}else{
	
		editarPanelPermisos();
	}
   
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
			
			$("#editaridUsuario").val(respuesta["idUsuario"]);
			$("#editarNombre").val(respuesta["nombre"]);
			$("#editarUsuario").val(respuesta["usuario"]);
			$("#editaridPerfil").val(respuesta["idPerfil"]);
			$("#passwordActual").val(respuesta["password"]);
			$("#fotoActual").val(respuesta["foto"]);

			if(respuesta["foto"] != ""){

				$(".previsualizar").attr("src", respuesta["foto"]);
				
			}

		}

	});

	$.ajax({

		url:"ajax/usuariosmodulos.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function(respuesta){

			for (var i=0; i<respuesta.length; i++) { 

				$("#"+respuesta[i]["descripcion"]+":checkbox").prop('checked', true);

			}

		}

	});

	$.ajax({

		url:"ajax/usuariospermisos.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function(respuesta){

		if(respuesta["insertar"]==1){
			$("#editarPermisoInsertar:checkbox").prop('checked', true);
		}
		if(respuesta["editar"]==1){
			$("#editarPermisoEditar:checkbox").prop('checked', true);
		}
		if(respuesta["eliminar"]==1){
			$("#editarPermisoEliminar:checkbox").prop('checked', true);
		}

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
		
	Swal.fire({

		icon: "success",
		title: "Sesión cerrada",
		showConfirmButton: false,
		timer: 1000

	}).then(function(result){

		window.location = "salir";

	});

	  }
  
	})
  
  })
  






