//Initialize Select2 Elements
$('.select2').select2();

//Menú
$(".nav li a").click(function() {
	if($(this).hasClass("active")){
		$(this).removeClass('active');
	}else{
		$(this).addClass('active');
	}
});

//Permisos
var permisoEditar = $("#permisoEditar").val();
var permisoEliminar = $("#permisoEliminar").val();
var idUsuarioSession = $("#idUsuarioSession").val();

$.fn.dataTable.Buttons.defaults.dom.button.className = 'btn';