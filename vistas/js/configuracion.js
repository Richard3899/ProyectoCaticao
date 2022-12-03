/*=============================================
ACTIVAR MODO DARK
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

			if($(respuesta["modoDark"])!=1){
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

		$(this).addClass('btn-success');
		$(this).removeClass('btn-danger');
		$(this).html('Activado');
		$(this).attr('mododark',0);

  	}else{

		$(this).removeClass('btn-success');
  		$(this).addClass('btn-danger');
  		$(this).html('Desactivado');
  		$(this).attr('mododark',1);

  	}

})



/*=============================================
ACTIVAR CONTRADIDO DE BARRA LATERAL
=============================================*/
$(document).on("click", ".btnActivarContraerBarraLateral", function(){

	var idConfiguracion= $(this).attr("idConfiguracion");
	var contraerbarralateral = $(this).attr("contraerbarralateral");

	var datos = new FormData();
 	datos.append("activarIdConfig", idConfiguracion);
  	datos.append("activarContraerBarraLateral", contraerbarralateral);

  	$.ajax({

	  url:"ajax/configuracion.ajax.php",
	  method: "POST",
	  data: datos,
	  cache: false,
      contentType: false,
      processData: false,
      success: function(){

      }

  	})

  	if(contraerbarralateral == 0){

		$(this).attr('contraerbarralateral',1);

  	}else{

  		$(this).attr('contraerbarralateral',0);

  	}

})



/*=============================================
ACTIVAR OCULTAR DE BARRA LATERAL
=============================================*/
$(document).on("click", ".btnActivarOcultarBarraLateral", function(){

	var idConfiguracion= $(this).attr("idConfiguracion");
	var ocultarbarralateral = $(this).attr("ocultarbarralateral");

	var datos = new FormData();
 	datos.append("activarIdConfig", idConfiguracion);
  	datos.append("activarOcultarBarraLateral", ocultarbarralateral);

  	$.ajax({

	  url:"ajax/configuracion.ajax.php",
	  method: "POST",
	  data: datos,
	  cache: false,
      contentType: false,
      processData: false,
      success: function(respuesta){

			if($(respuesta["ocultarbarralateral"])!=1){
				Swal.fire({
					title: "El ocultado de barra lateral ha sido actualizado",
					icon: "success",
				  showConfirmButton: false,
				  timer: 1000
				  }).then(function(result) {
				  
					  window.location = "configuracion";
  
				});
			}

      }

  	})

  	if(ocultarbarralateral == 0){

		$(this).addClass('btn-success');
		$(this).removeClass('btn-danger');
		$(this).html('Activado');
		$(this).attr('ocultarbarralateral',0);

  	}else{

	    $(this).removeClass('btn-success');
  		$(this).addClass('btn-danger');
  		$(this).html('Desactivado');
  		$(this).attr('ocultarbarralateral',1);

  	}

})




