/*=============================================
Select Dynamic
=============================================*/
//Initialize Select2 Elements
$('.select2').select2();

//Date picker
$('#reservationdate').datetimepicker({
        format: 'L'
});

//Datemask dd/mm/yyyy
$('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
//Datemask2 mm/dd/yyyy
$('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
//Money Euro
$('[data-mask]').inputmask()


$(".nav li a").click(function() {
	if($(this).hasClass("active")){
		$(this).removeClass('active');
	}else{
		$(this).addClass('active');
	}
});

