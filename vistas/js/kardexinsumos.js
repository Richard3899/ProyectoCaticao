	$('.tablaKardexInsumos').dataTable( {
		"searching": false,
		"paging": false,
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
	
	$(document).on('click','#KardexInsumos',function() {

		if($("#InsumoK").val()==0){
			Swal.fire({
				icon: "error",
				title: "Seleccionar Insumo",
				showConfirmButton: false,
				timer: 2000
			  })
		}else{

			KardexInsumos()

			$.fn.dataTable.ext.search.push(
				function(settings, aData, iDataIndex) {
					
					if ( settings.nTable.id !== 'tablaKardexInsumos' ) {
							return true;
					}
					var dateIni =$('#min').val();
					var dateFin =$('#max').val();

					if(dateIni!=""){
						dateIni = (moment(dateIni,'DD/MM/YYYY')).format('YYYY-MM-DD');
					}
					if(dateFin!=""){
						dateFin = (moment(dateFin,'DD/MM/YYYY')).format('YYYY-MM-DD');
					}
					
					var indexCol = 5;
			
					var dateCol = (moment(aData[indexCol],'DD/MM/YYYY')).format('YYYY-MM-DD');
                    
					if (dateIni === "" && dateFin === "")
					{
						return true;
					}
			
					if(dateIni === "")
					{
						return dateCol <= dateFin;
					}
			
					if(dateFin === "")
					{
						return dateCol >= dateIni;
					}
			
					return dateCol >= dateIni && dateCol <= dateFin;
				}
			);

	
		/*===================================================================*/
		// EVENTOS PARA CRITERIOS DE BUSQUEDA
		/*===================================================================*/
		$("#transaccion").keyup(function(){
			table.column($(this).data('index')).search(this.value).draw();
		})
		$("#descripcion").keyup(function(){
			table.column($(this).data('index')).search(this.value).draw();
		})
		$("#codigoReceta").keyup(function(){
			table.column($(this).data('index')).search(this.value).draw();
		})
		
		$(document).ready(function() {
			// Create date inputs
			minDate = new DateTime($('#min'), {
				format: 'DD/MM/YYYY'
			});
			maxDate = new DateTime($('#max'), {
				format: 'DD/MM/YYYY'
			});

			// Refilter the table
			$('#min, #max').on('change', function () {
				table.draw();			
			});
		});

	
		$("#btnLimpiarBusqueda").on('click',function(){
	
			$("#transaccion").val('')
			$("#descripcion").val('')
			$("#codigoReceta").val('')
			$("#min").val('')
			$("#max").val('')
	
			table.search('').columns().search('').draw();
			
		})
			
		}
		
	});    
	
	function KardexInsumos() {
	
		$(".tablaKardexInsumos").dataTable().fnDestroy();
		$(".tablaKardexInsumos > tbody").empty();
		var InsumoK = $("#InsumoK").val();
		var nombreInsumo= $("select option:selected").attr("nombreInsumo");

		table =$('.tablaKardexInsumos').DataTable( {
			"ajax": "ajax/datatable-kardexinsumos.ajax.php?InsumoK="+InsumoK,
			"dom": 'Brtip',
			"processing": true,
			"aLengthMenu": [[10,25,50,-1],[10,25,50,"Todos"]],
			"buttons": [{
				extend: 'pdf',
				className: 'btn-danger',
				text: "PDF",
				title:'Kardex de ' + nombreInsumo,
				filename:'Kardex de ' + nombreInsumo,
				exportOptions: {
					columns: ':visible'
				},
				customize: function (doc) {
					doc.styles.tableHeader.fontSize = 10;
					// doc.defaultStyle.fontSize = 8;
					doc.defaultStyle.alignment = 'center';
					doc.content[1].table.widths ="*";
		
					var tableNode;
					for (i = 0; i < doc.content.length; ++i) {
					  if(doc.content[i].table !== undefined){
						tableNode = doc.content[i];
						break;
					  }
					}
		
					var rowIndex = 0;
					var tableColumnCount = tableNode.table.body[rowIndex].length;
					if(tableColumnCount > 5){
					  doc.pageOrientation = 'landscape';
					}
				}
			
				},
				{
				extend: 'excel',
				className: 'btn-success',
				text: "Excel",
				title:'Kardex de ' + nombreInsumo,
				filename: 'Kardex de ' + nombreInsumo,
				customize: function( xlsx ) {
						var sheet = xlsx.xl.worksheets['sheet1.xml'];
						//Centrar al exportar en Excel
						 $('row c[r^="A"]', sheet).attr( 's', '51' );
						 $('row c[r^="B"]', sheet).attr( 's', '51' );
						 $('row c[r^="C"]', sheet).attr( 's', '51' );
						 $('row c[r^="D"]', sheet).attr( 's', '51' );
						 $('row c[r^="E"]', sheet).attr( 's', '51' );
						 $('row c[r^="F"]', sheet).attr( 's', '51' );
						 $('row c[r^="G"]', sheet).attr( 's', '51' );
						 $('row c[r^="H"]', sheet).attr( 's', '51' );
						 $('row c[r^="I"]', sheet).attr( 's', '51' );
			
					},
				exportOptions: {
					columns: ':visible',
					orthogonal: 'exportxls'
				}
				},
				{
				extend: 'print',
				className: 'btn-info',
				text: "Imprimir",
				title:'Kardex de ' + nombreInsumo,
				exportOptions: {
					columns: ':visible'
				},
				customize: function (win) {
					$(win.document.body).find('h1').css('text-align','center');
				}
				},
				{
				extend: 'colvis',
				className: 'btn-secondary',
				text: "Columnas Visibles"
				},{
				extend: 'pageLength',
				className: 'btn-secondary',
				text: "Registros"
				}],
			"columnDefs": [
					{"className": "dt-center", "targets": "_all",
					"targets": '_all',
					"sortable": false,
					"createdCell": function (td) {
						$(td).css('padding', '3px')
					}},
					{targets: [1], render: DataTable.render.moment("YYYY-MM-DD HH:mm:ss","DD/MM/YYYY HH:mm:ss")},
					{targets: [5], render: DataTable.render.moment( 'DD/MM/YYYY' )},
					//Tipo de dato (Número)
					{targets: [6],
						render: function ( ingreso, type, row ) {
						if(type==="display"){
							var color = 'dark';
							if (ingreso > 0) {
							  color = 'success';
							}
						  return '<p class="text-' + color + '">' + DataTable.render.number( '.', ',', 2).display(ingreso) + '</p>';
						}
						  return ingreso;
						}
					},
					{targets: [7],
						render: function ( salida, type, row ) {
						if(type==="display"){
							var color = 'dark';
							if (salida > 0) {
							  color = 'danger';
							}
						  return '<p class="text-' + color + '">' + DataTable.render.number( '.', ',', 2).display(salida) + '</p>';
						}
						  return salida;
						}
					},
					{targets: [8],
						render: function ( saldo, type, row ) {
						if(type==="display"){
							var color = 'dark';
							if (saldo > 0 || saldo <= 0 ) {
							  color = 'primary';
							}
							return '<p class="text-' + color + '">' + DataTable.render.number( '.', ',', 2).display(saldo) + '</p>';
						}
						    return saldo;
						}
					}
			],      
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
		
		});
	
	  }



