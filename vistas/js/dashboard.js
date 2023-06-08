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
              data: [respuesta[0]],
              backgroundColor: 'rgb(75, 192, 192)',
            },
            {
              label: 'Proceso',
              data: [respuesta[1]],
              backgroundColor: 'rgb(54, 162, 235)',
            },
            {
              label: 'Terminado',
              data: [respuesta[2]],
              backgroundColor: 'rgb(255, 99, 132)',
            },
          ]
        },
        options: {
          plugins: {
            title: {
              display: true,
              text: 'Chart.js Bar Chart - Stacked'
            },
          },
          responsive: true,
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero: true
                  }
              }],
          }
        }
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
          'rgba(255, 159, 64, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(201, 203, 207, 0.2)'
        ],
        borderColor: [
          'rgb(255, 159, 64)',
          'rgb(75, 192, 192)',
          'rgb(54, 162, 235)',
          'rgb(153, 102, 255)',
          'rgb(201, 203, 207)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
          yAxes: [{
              ticks: {
                  beginAtZero: true
              }
          }],
      }
    }
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
          'rgba(255, 159, 64, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(201, 203, 207, 0.2)'
        ],
        borderColor: [
          'rgb(255, 159, 64)',
          'rgb(75, 192, 192)',
          'rgb(54, 162, 235)',
          'rgb(153, 102, 255)',
          'rgb(201, 203, 207)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
          yAxes: [{
              ticks: {
                  beginAtZero: true
              }
          }],
      }
    }
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
          'rgba(255, 159, 64, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(201, 203, 207, 0.2)'
        ],
        borderColor: [
          'rgb(255, 159, 64)',
          'rgb(75, 192, 192)',
          'rgb(54, 162, 235)',
          'rgb(153, 102, 255)',
          'rgb(201, 203, 207)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
          yAxes: [{
              ticks: {
                  beginAtZero: true
              }
          }],
      }
    }
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

  var datos = new FormData();
  datos.append("años3", año);

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
          'rgba(255, 159, 64, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(201, 203, 207, 0.2)'
        ],
        borderColor: [
          'rgb(255, 159, 64)',
          'rgb(75, 192, 192)',
          'rgb(54, 162, 235)',
          'rgb(153, 102, 255)',
          'rgb(201, 203, 207)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
          yAxes: [{
              ticks: {
                  beginAtZero: true
              }
          }],
      }
    }
    });
}

})
}

function SeleccionarAño3(){

  $("#años3").on( "change", function() {

    GraficoProductosProducidos();

  } );

}


/*=============================================
TRAER PRODUCTOS PRODUCIDOS POR MES - CANTIDAD
=============================================*/
function GraficoProductosProducidosValorizado(){
  
  var año=$("#años4").val();

  var datos = new FormData();
  datos.append("años4", año);

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
          'rgba(255, 159, 64, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(201, 203, 207, 0.2)'
        ],
        borderColor: [
          'rgb(255, 159, 64)',
          'rgb(75, 192, 192)',
          'rgb(54, 162, 235)',
          'rgb(153, 102, 255)',
          'rgb(201, 203, 207)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
          yAxes: [{
              ticks: {
                  beginAtZero: true
              }
          }],
      }
    }
    });
}

})
}

function SeleccionarAño4(){

  $("#años4").on( "change", function() {

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
          'rgba(255, 159, 64, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(201, 203, 207, 0.2)'
        ],
        borderColor: [
          'rgb(255, 159, 64)',
          'rgb(75, 192, 192)',
          'rgb(54, 162, 235)',
          'rgb(153, 102, 255)',
          'rgb(201, 203, 207)'
        ],
        borderWidth: 1
      }
    
    ]
      
    },
    options: {
      maintainAspectRatio: false,
      scales: {
          yAxes: [{
              ticks: {
                  beginAtZero: true
              }
          }],
      }
    }
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
          data: gastoadmin ,
          backgroundColor:'rgba(255, 159, 64, 0.2)',
          borderColor: 'rgb(255, 159, 64)',
          borderWidth: 1,
          stack: 'Stack 0'
        },
        {
          label: 'Costo de Venta',
          data: costoventa ,
          backgroundColor:'rgba(75, 192, 192, 0.2)',
          borderColor:'rgb(75, 192, 192)',
          borderWidth: 1,
          stack: 'Stack 0'
        },
        {
          label: 'Costo de Marketing',
          data: costomarketing ,
          backgroundColor:'rgba(54, 162, 235, 0.2)',
          borderColor:'rgb(54, 162, 235)',
          borderWidth: 1,
          stack: 'Stack 0'
        },
        {
          label: 'Costo Operativo',
          data: costooperativo ,
          backgroundColor:'rgba(153, 102, 255, 0.2)',
          borderColor:'rgb(153, 102, 255)',
          borderWidth: 1,
          stack: 'Stack 0'
        }
      ],
      
    },
    options: {
      maintainAspectRatio: false,
      scales: {
          yAxes: [{
              ticks: {
                  beginAtZero: true
              }
          }],
      }
    }
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


  





