/*=============================================
ACTIVAR USUARIO
=============================================*/
$(document).on("click", ".btnActivarModoDark", function(){

	var idConfiguracion= $(this).attr("idConfiguracion");
	var mododark = $(this).attr("mododark");

	var datos = new FormData();
 	datos.append("activarIdConfig", idConfiguracion);
  	datos.append("activarModoDark", mododark);

  	$.ajax({

	  url:"ajax/configuracion.ajax.php",
	  method: "POST",
	  data: datos,
	  cache: false,
      contentType: false,
      processData: false,
      success: function(respuesta){

			if($(respuesta["mododark"])!=1){
				Swal.fire({
					title: "El modo dark ha sido actualizado",
					icon: "success",
				  showConfirmButton: false,
				  timer: 1000
				  }).then(function(result) {
				  
					  window.location = "configuracion";
  
				});
			}

      }

  	})

  	if(mododark == 0){

  		$(this).removeClass('btn-success');
  		$(this).addClass('btn-danger');
  		$(this).html('Desactivado');
  		$(this).attr('mododark',1);

  	}else{

  		$(this).addClass('btn-success');
  		$(this).removeClass('btn-danger');
  		$(this).html('Activado');
  		$(this).attr('mododark',0);

  	}

})






