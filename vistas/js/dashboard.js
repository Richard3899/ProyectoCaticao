if($("#url").val()=='inicio'){
  
function Inicio(){

  GraficoRecetasEstados();

  RecetasTerminadasPorMes();
  SeleccionarAño();

  GraficoInventario();
  SelectItemIventario();

  GraficoInventarioValorizado();
  SelectItemIventarioValorizado();

  GraficoProductosProducidos();
  SeleccionarAño3();

  GraficoProductosProducidosValorizado();
  SeleccionarAño4();

  GraficoRecetasPorFechaYCosto();
  SeleccionarMes();

  GraficoGastosPorMes();
  SeleccionarAño6();

}

/*=============================================
TRAER CANTIDAD DE RECETAS POR ESTADO
=============================================*/
function GraficoRecetasEstados(){

  var datos = new FormData();

  datos.append("cantidadRecetasEstados", 1);
  
   $.ajax({
  
    url:"ajax/dashboard.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType:"json",
    success:function(respuesta){
  
      new Chart(document.querySelector('#GraficoBarraRecetaEstados'), {
        type: 'bar',
        data: {
          labels: ['Cantidad de Recetas'],
          datasets: [{
              label: 'Iniciado',
              data: respuesta[0],
              backgroundColor: 'rgb(75, 192, 192 , 0.5)',
              borderColor: 'rgb(75, 192, 192)',
              borderWidth: 2
            },
            {
              label: 'Proceso',
              data: respuesta[1],
              backgroundColor: 'rgb(54, 162, 235, 0.5)',
              borderColor: 'rgb(54, 162, 235)',
              borderWidth: 2
            },
            {
              label: 'Terminado',
              data: respuesta[2],
              backgroundColor: 'rgb(255, 99, 132, 0.5)',
              borderColor: 'rgb(255, 99, 132)',
              borderWidth: 2
            }
          ]
        },
        options:{
          plugins:{
              datalabels:{
              color:'white',
              anchor:'center',
              align:'center',
              padding:{
                top:2,
                bottom:2
              },
              backgroundColor:'#7F7F7F',
              borderRadius:3,
              formatter: function(value) {
                return value*1;
              }
            }
          }
        },
        plugins: [ChartDataLabels]
      });

    }
  
  })

}

/*=============================================
RECETAS TERMINADAS POR MES
=============================================*/
function RecetasTerminadasPorMes(){
  
  var año=$("#años").val();

  var datos = new FormData();

  datos.append("años", año);

   $.ajax({

    url:"ajax/dashboard.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType:"json",
    success:function(respuesta){

      var meses = [];
      var cantidadRecetas = [];

      for (let index = 0; index < respuesta.length; index++) {
          meses.push(respuesta[index][0]);
          cantidadRecetas.push(respuesta[index][1]);
      }

    if(window.myChart2 != undefined){
      window.myChart2.destroy();
    }
    
    window.myChart2 = new Chart(document.querySelector('#GraficoBarraRecetasTerminadas'), {
    type: 'bar',
    data: {
      labels: meses,
      datasets: [{
        label: 'Cantidad',
        data: cantidadRecetas,
        backgroundColor: [
          'rgb(241, 196, 15, 0.5)',
          'rgb(230, 126, 34, 0.5)',
          'rgb(231, 76, 60, 0.5)',
          'rgb(142, 68, 173, 0.5)',
          'rgb(52, 152, 219, 0.5)',
          'rgb(22, 160, 133, 0.5)',
          'rgb(46, 204, 113, 0.5)',
          'rgb(252, 243, 207, 0.5)',
          'rgb(118, 68, 138, 0.5)',
          'rgb(20, 143, 119, 0.5)',
          'rgb(113, 125, 126, 0.5)',
          'rgb(245, 238, 248, 0.5)'
        ],
        borderColor: [
          'rgb(241, 196, 15)',
          'rgb(230, 126, 34)',
          'rgb(231, 76, 60)',
          'rgb(142, 68, 173)',
          'rgb(52, 152, 219)',
          'rgb(22, 160, 133)',
          'rgb(46, 204, 113)',
          'rgb(252, 243, 207)',
          'rgb(118, 68, 138)',
          'rgb(20, 143, 119)',
          'rgb(113, 125, 126)',
          'rgb(245, 238, 248)'
        ],
        borderWidth: 2
      }]
    },
    options:{
      plugins:{
          datalabels:{
          color:'white',
          anchor:'center',
          align:'center',
          padding:{
            top:2,
            bottom:2
          },
          backgroundColor:'#7F7F7F',
          borderRadius:3,
          formatter: function(value) {
            return value*1;
          }
        }
      }
    },
    plugins: [ChartDataLabels]
    });
}

})
}

function SeleccionarAño(){

  $("#años").on( "change", function() {

    RecetasTerminadasPorMes();

  } );

}

/*=============================================
TRAER TOP ITEMS DE INVENTARIO - CANTIDAD
=============================================*/
function GraficoInventario(){
  
  idItem=$("#itemInventario").val();
 
  var datos = new FormData();

  datos.append("topItemsStock", idItem);

   $.ajax({

    url:"ajax/dashboard.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType:"json",
    success:function(respuesta){

      var items = [];
      var stock = [];

      for (let index = 0; index < respuesta.length; index++) {
          items.push(respuesta[index][0]);
          stock.push(respuesta[index][1]);
      }

    if(window.myChart3 != undefined){
    window.myChart3.destroy();
    }

    window.myChart3 = new Chart(document.querySelector('#GraficoBarraInventario'), {
    type: 'bar',
    data: {
      labels: items,
      datasets: [{
        label: 'Cantidad',
        data: stock,
        backgroundColor: [
          'rgb(93, 173, 226, 0.5)',
          'rgb(88, 214, 141, 0.5)',
          'rgb(245, 176, 65, 0.5)',
          'rgb(175, 122, 197, 0.5)',
          'rgb(236, 112, 99, 0.5)'
        ],
        borderColor: [
          'rgb(93, 173, 226)',
          'rgb(88, 214, 141)',
          'rgb(245, 176, 65)',
          'rgb(175, 122, 197)',
          'rgb(236, 112, 99)'
        ],
        borderWidth: 2
      }]
    },
    options:{
      plugins:{
          datalabels:{
          color:'white',
          anchor:'center',
          align:'center',
          padding:{
            top:2,
            bottom:2
          },
          backgroundColor:'#7F7F7F',
          borderRadius:3,
          formatter: function(value) {
            return value*1;
          }
        }
      }
    },
    plugins: [ChartDataLabels]
    });
}

})
}

function SelectItemIventario(){
  
  $("#itemInventario").on( "change", function() {

    GraficoInventario();

  } );

}

/*=============================================
TRAER TOP DE ITEMS DE INVENTARIO - VALORIZADO
=============================================*/
function GraficoInventarioValorizado(){
  
  idItem=$("#itemInventarioValorizado").val();

  var datos = new FormData();
  datos.append("topItemsValorizado", idItem);

   $.ajax({

    url:"ajax/dashboard.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType:"json",
    success:function(respuesta){

      var items = [];
      var valor = [];

      for (let index = 0; index < respuesta.length; index++) {
          items.push(respuesta[index][0]);
          valor.push(respuesta[index][1]);
      }

    if(window.myChart4 != undefined){
    window.myChart4.destroy();
    }

    window.myChart4 = new Chart(document.querySelector('#GraficoBarraInventarioValorizado'), {
    type: 'bar',
    data: {
      labels: items,
      datasets: [{
        label: 'Valor en (S/.)',
        data: valor,
        backgroundColor: [
          'rgb(93, 173, 226, 0.5)',
          'rgb(88, 214, 141, 0.5)',
          'rgb(245, 176, 65, 0.5)',
          'rgb(175, 122, 197, 0.5)',
          'rgb(236, 112, 99, 0.5)'
        ],
        borderColor: [
          'rgb(93, 173, 226)',
          'rgb(88, 214, 141)',
          'rgb(245, 176, 65)',
          'rgb(175, 122, 197)',
          'rgb(236, 112, 99)'
        ],
        borderWidth: 2
      }]
    },
    options:{
      plugins:{
          datalabels:{
          color:'white',
          anchor:'center',
          align:'center',
          padding:{
            top:2,
            bottom:2
          },
          backgroundColor:'#7F7F7F',
          borderRadius:3,
          formatter: function(value) {
            return value*1;
          }
        }
      }
    },
    plugins: [ChartDataLabels]
    });
}

})
}

function SelectItemIventarioValorizado(){
  
  $("#itemInventarioValorizado").on( "change", function() {

    GraficoInventarioValorizado();

  } );

}

/*=============================================
TRAER PRODUCTOS PRODUCIDOS POR MES - CANTIDAD
=============================================*/
function GraficoProductosProducidos(){
  
  var año=$("#años3").val();
  var idTipoProducto=$("#idTipoProducto1").val();

  var datos = new FormData();
  datos.append("años3", año);
  datos.append("idTipoProducto1", idTipoProducto);

   $.ajax({

    url:"ajax/dashboard.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType:"json",
    success:function(respuesta){

      var items = [];
      var stock = [];

      for (let index = 0; index < respuesta.length; index++) {
          items.push(respuesta[index][0]);
          stock.push(respuesta[index][1]);
      }

    if(window.myChart5 != undefined){
    window.myChart5.destroy();
    }

    window.myChart5 = new Chart(document.querySelector('#GraficoProductosProducidos'), {
    type: 'bar',
    data: {
      labels: items,
      datasets: [{
        label: 'Cantidad',
        data: stock,
        backgroundColor: [
          'rgb(241, 196, 15, 0.5)',
          'rgb(230, 126, 34, 0.5)',
          'rgb(231, 76, 60, 0.5)',
          'rgb(142, 68, 173, 0.5)',
          'rgb(52, 152, 219, 0.5)',
          'rgb(22, 160, 133, 0.5)',
          'rgb(46, 204, 113, 0.5)',
          'rgb(252, 243, 207, 0.5)',
          'rgb(118, 68, 138, 0.5)',
          'rgb(20, 143, 119, 0.5)',
          'rgb(113, 125, 126, 0.5)',
          'rgb(245, 238, 248, 0.5)'
        ],
        borderColor: [
          'rgb(241, 196, 15)',
          'rgb(230, 126, 34)',
          'rgb(231, 76, 60)',
          'rgb(142, 68, 173)',
          'rgb(52, 152, 219)',
          'rgb(22, 160, 133)',
          'rgb(46, 204, 113)',
          'rgb(252, 243, 207)',
          'rgb(118, 68, 138)',
          'rgb(20, 143, 119)',
          'rgb(113, 125, 126)',
          'rgb(245, 238, 248)'
        ],
        borderWidth: 2
      }]
    },
    options:{
      plugins:{
          datalabels:{
          color:'white',
          anchor:'center',
          align:'center',
          padding:{
            top:2,
            bottom:2
          },
          backgroundColor:'#7F7F7F',
          borderRadius:3,
          formatter: function(value) {
            return value*1;
          }
        }
      }
    },
    plugins: [ChartDataLabels]
    });
}

})
}

function SeleccionarAño3(){

  $("#años3").on( "change", function() {

    GraficoProductosProducidos();

  } );

  $("#idTipoProducto1").on( "change", function() {

    GraficoProductosProducidos();

  } );

}


/*=============================================
TRAER PRODUCTOS PRODUCIDOS POR MES - CANTIDAD
=============================================*/
function GraficoProductosProducidosValorizado(){
  
  var año=$("#años4").val();
  var idTipoProducto=$("#idTipoProducto2").val();

  var datos = new FormData();
  datos.append("años4", año);
  datos.append("idTipoProducto2", idTipoProducto);

   $.ajax({

    url:"ajax/dashboard.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType:"json",
    success:function(respuesta){

      var items = [];
      var valor = [];

      for (let index = 0; index < respuesta.length; index++) {
          items.push(respuesta[index][0]);
          valor.push(respuesta[index][1]);
      }

    if(window.myChart6 != undefined){
    window.myChart6.destroy();
    }

    window.myChart6 = new Chart(document.querySelector('#GraficoProductosProducidosValorizado'), {
    type: 'bar',
    data: {
      labels: items,
      datasets: [{
        label: 'Valor en (S/.)',
        data: valor,
        backgroundColor: [
          'rgb(241, 196, 15, 0.5)',
          'rgb(230, 126, 34, 0.5)',
          'rgb(231, 76, 60, 0.5)',
          'rgb(142, 68, 173, 0.5)',
          'rgb(52, 152, 219, 0.5)',
          'rgb(22, 160, 133, 0.5)',
          'rgb(46, 204, 113, 0.5)',
          'rgb(252, 243, 207, 0.5)',
          'rgb(118, 68, 138, 0.5)',
          'rgb(20, 143, 119, 0.5)',
          'rgb(113, 125, 126, 0.5)',
          'rgb(245, 238, 248, 0.5)'
        ],
        borderColor: [
          'rgb(241, 196, 15)',
          'rgb(230, 126, 34)',
          'rgb(231, 76, 60)',
          'rgb(142, 68, 173)',
          'rgb(52, 152, 219)',
          'rgb(22, 160, 133)',
          'rgb(46, 204, 113)',
          'rgb(252, 243, 207)',
          'rgb(118, 68, 138)',
          'rgb(20, 143, 119)',
          'rgb(113, 125, 126)',
          'rgb(245, 238, 248)'
        ],
        borderWidth: 2
      }]
    },
    options:{
      plugins:{
          datalabels:{
          color:'white',
          anchor:'center',
          align:'center',
          padding:{
            top:2,
            bottom:2
          },
          backgroundColor:'#7F7F7F',
          borderRadius:3,
          formatter: function(value) {
            return value*1;
          }
        }
      }
    },
    plugins: [ChartDataLabels]
    });
}

})
}

function SeleccionarAño4(){

  $("#años4").on( "change", function() {

    GraficoProductosProducidosValorizado();

  } );

  $("#idTipoProducto2").on( "change", function() {

    GraficoProductosProducidosValorizado();

  } );

}

/*=============================================
TRAER RECETAS POR FECHA Y COSTO POR TABLETA
=============================================*/
function GraficoRecetasPorFechaYCosto(){
  
  var mes=$("#meses").val()+"-01";

  var datos = new FormData();

  datos.append("mes", mes);

   $.ajax({

    url:"ajax/dashboard.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType:"json",
    success:function(respuesta){

      var items = [];
      var valor = [];

      for (let i = 0; i < respuesta.length; i++) {

        items.push(respuesta[i][0]);
        valor.push(respuesta[i][1]);
  
      }
  
    if(window.myChart7 != undefined){
      window.myChart7.destroy();
    }

    window.myChart7 = new Chart(document.querySelector('#GraficoRecetasPorFechaYCosto'), {
    type: 'bar',
    data: {
      labels:items,
      datasets:[{
        label:"Costo Unitario",
        data:valor,
        backgroundColor:[
          'rgb(195, 155, 211, 0.5)',
          'rgb(245, 183, 177, 0.5)',
          'rgb(130, 224, 170, 0.5)',
          'rgb(125, 60, 152, 0.5)',
          'rgb(174, 214, 241, 0.5)',
          'rgb(243, 156, 18, 0.5)',
          'rgb(169, 50, 38, 0.5)',
          'rgb(235, 152, 78, 0.5)',
          'rgb(249, 231, 159, 0.5)',
          'rgb(31, 97, 141, 0.5)',
          'rgb(35, 155, 86, 0.5)',
          'rgb(170, 183, 184, 0.5)',
          'rgb(169, 204, 227, 0.5)',
          'rgb(118, 215, 196, 0.5)',
          'rgb(212, 172, 13, 0.5)',
          'rgb(250, 219, 216, 0.5)',
          'rgb(234, 237, 237, 0.5)',
          'rgb(115, 198, 182, 0.5)',
          'rgb(192, 57, 43, 0.5)',
          'rgb(187, 143, 206, 0.5)',
          'rgb(123, 125, 125, 0.5)',
          'rgb(245, 203, 167, 0.5)',
          'rgb(74, 35, 90, 0.5)',
          'rgb(93, 173, 226, 0.5)',
          'rgb(23, 165, 137, 0.5)',
          'rgb(244, 208, 63, 0.5)',
          'rgb(231, 76, 60, 0.5)',
          'rgb(240, 178, 122, 0.5)',
          'rgb(241, 196, 15, 0.5)',
          'rgb(46, 204, 113, 0.5)',
          'rgb(162, 217, 206, 0.5)'
        ],
        borderColor: [
          'rgb(195, 155, 211)',
          'rgb(245, 183, 177)',
          'rgb(130, 224, 170)',
          'rgb(125, 60, 152)',
          'rgb(174, 214, 241)',
          'rgb(243, 156, 18)',
          'rgb(169, 50, 38)',
          'rgb(235, 152, 78)',
          'rgb(249, 231, 159)',
          'rgb(31, 97, 141)',
          'rgb(35, 155, 86)',
          'rgb(170, 183, 184)',
          'rgb(169, 204, 227)',
          'rgb(118, 215, 196)',
          'rgb(212, 172, 13)',
          'rgb(250, 219, 216)',
          'rgb(234, 237, 237)',
          'rgb(115, 198, 182)',
          'rgb(192, 57, 43)',
          'rgb(187, 143, 206)',
          'rgb(123, 125, 125)',
          'rgb(245, 203, 167)',
          'rgb(74, 35, 90)',
          'rgb(93, 173, 226)',
          'rgb(23, 165, 137)',
          'rgb(244, 208, 63)',
          'rgb(231, 76, 60)',
          'rgb(240, 178, 122)',
          'rgb(241, 196, 15)',
          'rgb(46, 204, 113)',
          'rgb(162, 217, 206)'
        ],
        borderWidth: 2
      }
    ]},
    options:{
      maintainAspectRatio: false,
      plugins:{
          datalabels:{
          color:'white',
          anchor:'center',
          align:'center',
          padding:{
            top:2,
            bottom:2
          },
          backgroundColor:'#7F7F7F',
          borderRadius:3,
          formatter: function(value) {
            return value*1;
          }
        }
      }
    },
    plugins: [ChartDataLabels]

    });

    myChart7.canvas.parentNode.style.height = '22rem';
    myChart7.canvas.parentNode.style.width = '100%';

}

})
}

function SeleccionarMes(){

  $("#meses").on( "change", function() {

    GraficoRecetasPorFechaYCosto();

  } );

}

/*=============================================
TRAER GASTOS POR MES
=============================================*/
function GraficoGastosPorMes(){
  
  var años=$("#años6").val();

  var datos = new FormData();

  datos.append("años6", años);

   $.ajax({

    url:"ajax/dashboard.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType:"json",
    success:function(respuesta){

      var mes = [];
      var gastoadmin = [];
      var costoventa = [];
      var costomarketing = [];
      var costooperativo = [];

      for (let i = 0; i < respuesta.length; i++) {

        mes.push(respuesta[i][0]);
        gastoadmin.push(respuesta[i][1]);
        costoventa.push(respuesta[i][2]);
        costomarketing.push(respuesta[i][3]);
        costooperativo.push(respuesta[i][4]);
      }
  
    if(window.myChart8 != undefined){
      window.myChart8.destroy();
    }

    window.myChart8 = new Chart(document.querySelector('#GraficoGastosPorMes'), {
    type: 'bar',
    data: {
      labels:mes,
      datasets: [
        {
          label: 'Gasto Administrativo',
          data: gastoadmin,
          backgroundColor:'rgba(52, 152, 219, 0.6)',
          borderColor: 'rgb(52, 152, 219)',
          borderWidth: 2,
          stack: 'Stack 0'
        },
        {
          label: 'Costo de Venta',
          data: costoventa ,
          backgroundColor:'rgba(26, 188, 156, 0.6)',
          borderColor:'rgb(26, 188, 156)',
          borderWidth: 2,
          stack: 'Stack 0'
        },
        {
          label: 'Costo de Marketing',
          data: costomarketing,
          backgroundColor:'rgba(241, 196, 15, 0.6)',
          borderColor:'rgb(241, 196, 15)',
          borderWidth: 2,
          stack: 'Stack 0'
        },
        {
          label: 'Costo Operativo',
          data: costooperativo,
          backgroundColor:'rgba(155, 89, 182, 0.6)',
          borderColor:'rgb(155, 89, 182)',
          borderWidth: 2,
          stack: 'Stack 0'
        }
      ],
      
    },
    options:{
      maintainAspectRatio: false,
      plugins:{
          datalabels:{
          color:'white',
          anchor:'end',
          align:'bottom',
          padding:{
            top:2,
            bottom:2
          },
          backgroundColor:'#7F7F7F',
          borderRadius:3,
          formatter: function(value) {
            return value*1;
          }
        }
      }
    },
    plugins: [ChartDataLabels]

    });

    myChart8.canvas.parentNode.style.height = '22rem';
    myChart8.canvas.parentNode.style.width = '100%';

}

})
}

function SeleccionarAño6(){

  $("#años6").on( "change", function() {

    GraficoGastosPorMes();

  } );

}

Inicio(); 

}
  





