  foreach ($configuracion as $key => $value){

    if($value["modoDark"] == 1 && $value["contraerBarraLateral"]==1 && $value["ocultarBarraLateral"]==1 ){
    
      echo '<body class="hold-transition skin-blue dark-mode sidebar-collapse">';
    
    }else if($value["modoDark"] == 0 && $value["contraerBarraLateral"]==1 && $value["ocultarBarraLateral"]==1 ){
    
      echo '<body class="hold-transition skin-blue sidebar-collapse">';
    
    }else if($value["modoDark"] == 0 && $value["contraerBarraLateral"]==0 && $value["ocultarBarraLateral"]==1 ){
    
      echo '<body class="hold-transition skin-blue sidebar-collapse">';
    
    }else if($value["modoDark"] == 1 && $value["contraerBarraLateral"]==1 && $value["ocultarBarraLateral"]==0){
    
    echo '<body class="hold-transition skin-blue sidebar-mini-xs dark-mode sidebar-collapse">';
    
    }else if($value["modoDark"] == 1 && $value["contraerBarraLateral"]==0 && $value["ocultarBarraLateral"]==0){
    
    echo '<body class="hold-transition skin-blue sidebar-mini-xs dark-mode">';
    
    }else if($value["modoDark"] == 0 && $value["contraerBarraLateral"]==1 && $value["ocultarBarraLateral"]==0){
    
      echo '<body class="hold-transition skin-blue sidebar-mini-xs sidebar-collapse">';

    }else if($value["modoDark"] == 1 && $value["contraerBarraLateral"]==0 && $value["ocultarBarraLateral"]==1){
    
      echo '<body class="hold-transition skin-blue sidebar-collapse dark-mode">';
    };
  }