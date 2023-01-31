if($("#url").val()=='inicio'){

/*=============================================
TRAER TOP PRODUCTOS
=============================================*/
  var datos1 = new FormData();
  datos1.append("topProductos", 1);

   $.ajax({

    url:"ajax/dashboard.ajax.php",
    method: "POST",
    data: datos1,
    cache: false,
    contentType: false,
    processData: false,
    success:function(respuesta){

      var data = JSON.parse(respuesta);
      var productos = [];
      var stock = [];

      for (let index = 0; index < data.length; index++) {
          productos.push(data[index][0]);
          stock.push(data[index][1]);
          
      }

    new Chart(document.querySelector('#barChart'), {
    type: 'bar',
    data: {
      labels: productos,
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

/*=============================================
TRAER CANTIDAD DE RECETAS POR ESTADO
=============================================*/
var datos2 = new FormData();
datos2.append("cantidadRecetasEstados", 1);

 $.ajax({

  url:"ajax/dashboard.ajax.php",
  method: "POST",
  data: datos2,
  cache: false,
  contentType: false,
  processData: false,
  dataType:"json",
  success:function(respuesta){

    new Chart(document.querySelector('#stakedBarChart'), {
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



  





