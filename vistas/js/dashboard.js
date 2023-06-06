function Inicio(){

  GraficoRecetasEstados();
  SelectItemIventario();
  GraficoInventario();
  RecetasTerminadasPorMes();
  SeleccionarAño();
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
TRAER TOP PRODUCTOS
=============================================*/
function GraficoInventario(){
  
  idItem=$("#itemInventario").val();

  var datos = new FormData();
  datos.append("topProductos", idItem);

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

    if(window.myChart2 != undefined){
    window.myChart2.destroy();
    }

    window.myChart2 = new Chart(document.querySelector('#GraficoBarraInventario'), {
    type: 'bar',
    data: {
      labels: items,
      datasets: [{
        label: 'Stock',
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
RECETAS TERMINADAS POR MES
=============================================*/
function RecetasTerminadasPorMes(){
  
  año=$("#años").val();

  var datos = new FormData();

  datos.append("año", año);

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

    if(window.myChart3 != undefined){
      window.myChart3.destroy();
    }
    
    window.myChart3 = new Chart(document.querySelector('#GraficoBarraRecetasTerminadas'), {
    type: 'bar',
    data: {
      labels: meses,
      datasets: [{
        label: 'Recetas Terminadas',
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

Inicio(); 


  





