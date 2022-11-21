var idInsumo = $(this).attr("idInsumo");

$(this).removeClass("btn-info agregarInsumo");

$(this).addClass("btn-default");

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

    $stock=respuesta["stock"];


  }

})
