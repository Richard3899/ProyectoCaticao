<!-- Main Sidebar Container -->
<?php  
foreach ($configuracion as $key => $value){

if($value["modoDark"] == 1){

  echo '<aside class="main-sidebar sidebar-dark-primary elevation-4">';

}else{

  echo '<aside class="main-sidebar sidebar-dark-primary elevation-4">';

};
}

?>
    <!-- Brand Logo -->
    <a href="inicio" class="brand-link">
      <img src="vistas/img/plantilla/logo-mini.png" alt="Logo" class="brand-image ml-3 img-circle" >
      <span class="brand-text p-2 ml-4 badge badge-dark">
      C A T I C A O
      </span>
    </a>

<!-- Sidebar -->
<div class="sidebar">  
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

          <?php if (in_array(1, $arrayidModulos)){
          echo "<li class='nav-item'>
            <a href='inicio' class='nav-link "; if($url=='inicio'){ echo "active"; } echo"'>
              <i class='nav-icon fas fa-tachometer-alt'></i>
              <p>
                Dashboard
              </p>
            </a>
          </li>";}
          ?>

          <?php 
          $idModulosRegistro=array(2,3,4,5,6,7,8);
          $descripcionModulosRegistro=array('insumos', 'materiales','marcas','productos','maquinas','empleados','gastoadmin');
          ?>

          <?php if (array_intersect($idModulosRegistro,$arrayidModulos)){
            echo "<li class='nav-item "; if(in_array($url,$descripcionModulosRegistro) && in_array($url,$arrayDescripcionModulos)){ echo "menu-open"; } echo"'>
            <a href='#' class='nav-link "; if(in_array($url,$descripcionModulosRegistro) && in_array($url,$arrayDescripcionModulos)){ echo "active"; } echo"'>
              <i class='nav-icon fas fa-pen'></i>
              <p>
                Registros
                <i class='right fas fa-angle-left'></i>
              </p>
            </a>

            <ul class='nav nav-treeview'>";

            $descripcionModulosIMM=array('insumos', 'materiales','marcas');

            if (array_intersect(array(2,3,4),$arrayidModulos)){
              echo "<li class='nav-item "; if(in_array($url,$descripcionModulosIMM) && in_array($url,$arrayDescripcionModulos)){ echo "menu-open"; } echo"'>
                <a href='#' class='nav-link "; if(in_array($url,$descripcionModulosIMM) && in_array($url,$arrayDescripcionModulos)){ echo "active"; } echo"'>
                  <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Insumos y Materiales
                  <i class='right fas fa-angle-left'></i>
                  </p>
                </a>
              <ul class='nav nav-treeview'>";

              if (in_array(2, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='insumos' class='nav-link "; if($url=='insumos'){ echo "active"; } echo"'>
                  <i class='nav-icon fas fa-angle-right'></i>
                  <p>Insumos</p>
                </a>
              </li>";}

              if (in_array(3, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='materiales' class='nav-link "; if($url=='materiales'){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-right'></i>
                  <p>Materiales</p>
                </a>
              </li>";}

              if (in_array(4, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='marcas' class='nav-link "; if($url=='marcas'){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-right'></i>
                  <p>Marcas</p>
                </a>
              </li>";}

              echo "</ul>
              </li>";}

              if (in_array(5, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='productos' class='nav-link "; if($url=='productos'){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Productos</p>
                </a>
              </li>";}

              if (in_array(6, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='maquinas' class='nav-link "; if($url=='maquinas'){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Maquinas</p>
                </a>
              </li>";}

              if (in_array(7, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='empleados' class='nav-link "; if($url=='empleados'){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Empleados</p>
                </a>
              </li>";}

              if (in_array(8, $arrayidModulos)){
                echo "<li class='nav-item'>
                  <a href='gastoadmin' class='nav-link "; if($url=='gastoadmin'){ echo "active"; } echo"'>
                  <i class='nav-icon fas fa-angle-double-right'></i>
                    <p>Gastos y Costos</p>
                  </a>
                </li>";}

            echo "</ul>
            
          </li>";}?>

          <?php 
          $idModulosInventario=array(12,13,14,15,24);
          $descripcionModulosInventario=array('inventariomateriales', 'inventarioinsumos','inventarioproductos','inventariomaquinas','kardexinsumos','kardexmateriales','kardexproductos','kardexmaquinas','loteproductos');
          ?>
          
          <?php if (array_intersect($idModulosInventario,$arrayidModulos)){
          echo "<li class='nav-item "; if (in_array($url,$descripcionModulosInventario) && in_array($url,$arrayDescripcionModulos)){echo "menu-open";} echo"'>
            <a href='#' class='nav-link "; if(in_array($url,$descripcionModulosInventario) && in_array($url,$arrayDescripcionModulos)){ echo "active"; } echo"'>
              <i class='nav-icon fas fa-box'></i>
              <p>
                Inventario
                <i class='right fas fa-angle-left'></i>
              </p>
            </a>

            <ul class='nav nav-treeview'>";

              if (in_array(12, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='inventarioinsumos' class='nav-link "; if(in_array($url, array('inventarioinsumos','kardexinsumos'))){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Inventario Insumos</p>
                </a>
              </li>";}
              
              if (in_array(13, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='inventariomateriales' class='nav-link "; if(in_array($url, array('inventariomateriales','kardexmateriales'))){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Inventario Materiales</p>
                </a>
              </li>";}

              if (in_array(14, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='inventarioproductos' class='nav-link "; if(in_array($url, array('inventarioproductos','kardexproductos','loteproductos'))){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Inventario Productos</p>
                </a>
              </li>";}

              if (in_array(15, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='inventariomaquinas' class='nav-link "; if(in_array($url, array('inventariomaquinas','kardexmaquinas'))){ echo "active"; }echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Inventario Maquinas</p>
                </a>
              </li>";}

          echo"</ul>
            
          </li>";}
          ?>

          <?php 
          $idModulosOperaciones=array(16);
          $descripcionModulosOperaciones=array('recetas','recetainsumos','recetamateriales','recetamanodeobra','recetadepreciacion','recetaconsumoenergia','recetaconsumogas');
          ?>

          <?php if ((array_intersect($idModulosOperaciones,$arrayidModulos))){
          echo "<li class='nav-item "; if(in_array($url,$descripcionModulosOperaciones) && in_array($url,$arrayDescripcionModulos)){ echo "menu-open"; } echo "'>
            <a href='#' class='nav-link "; if(in_array($url,$descripcionModulosOperaciones) && in_array($url,$arrayDescripcionModulos)){ echo "active"; } echo "'>
              <i class='nav-icon fas fa-receipt'></i>
              <p>
                Operaciones
                <i class='right fas fa-angle-left'></i>
              </p>
            </a>
          <ul class='nav nav-treeview'>";

          if (in_array(16, $arrayidModulos)){
          echo "<li class='nav-item'>
                <a href='recetas' class='nav-link "; if(in_array($url,$descripcionModulosOperaciones)){ echo "active"; } echo "'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Receta</p>
                </a>
                </li>";}

          echo "</ul>
          </li>";}
          ?>

          <?php 
          $idModulosCostos=array(17,18);
          $descripcionModulosCostos=array('costoreceta','costototal','mesgasto','gastoadminpormes','costototalpormes');
          ?>

          <?php if((array_intersect($idModulosCostos,$arrayidModulos))){ 
          echo "<li class='nav-item "; if (in_array($url,$descripcionModulosCostos) && in_array($url,$arrayDescripcionModulos)){echo "menu-open";} echo"'>
          <a href='#' class='nav-link "; if(in_array($url,$descripcionModulosCostos) && in_array($url,$arrayDescripcionModulos)){ echo "active"; } echo"'>
              <i class='nav-icon fas fa-money-bill'></i>
              <p>
                Costeo
                <i class='right fas fa-angle-left'></i>
              </p>
            </a>

            <ul class='nav nav-treeview'>";

            if(in_array(17, $arrayidModulos)){ 
              echo "<li class='nav-item'>
                <a href='costoreceta' class='nav-link "; if(in_array($url, array('costoreceta','costototal'))){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Costo por Receta</p>
                </a>
              </li>";}
            
            if(in_array(18, $arrayidModulos)){ 
              echo "<li class='nav-item'>
                <a href='mesgasto' class='nav-link "; if(in_array($url, array('mesgasto','gastoadminpormes','costototalpormes'))){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Mes y Gastos</p>
                </a>
              </li>";}

           echo "</ul>
            
          </li>";}
          ?>

          <?php if(in_array(19, $arrayidModulos)){ 
            echo "<li class='nav-item'>
            <a href='usuarios' class='nav-link "; if($url=='usuarios'){ echo 'active'; }; echo "'>
              <i class='nav-icon fas fa-user'></i>
              <p>
                Usuarios
              </p>
            </a>
          </li>";}
          ?>

          <?php 
          $idModulosReportes=array(20,21,22,25);
          $descripcionModulosReportes=array('reporteinsumos','reportemateriales','reporteproductos','reporterecetas');
          ?>

          <?php if ((array_intersect($idModulosReportes,$arrayidModulos))){
          echo"<li class='nav-item "; if (in_array($url,$descripcionModulosReportes) && in_array($url,$arrayDescripcionModulos)){echo "menu-open";} echo"'>
          <a href='#' class='nav-link "; if(in_array($url,$descripcionModulosReportes) && in_array($url,$arrayDescripcionModulos)){ echo "active"; } echo"'>
              <i class='nav-icon fas fa-chart-line'></i>
              <p>
                Reportes
                <i class='right fas fa-angle-left'></i>
              </p>
          </a>

            <ul class='nav nav-treeview'>";
              
            if (in_array(20, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='reporteinsumos' class='nav-link "; if($url=='reporteinsumos'){ echo "active"; }echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Reporte Insumos</p>
                </a>
              </li>";
            }

            if (in_array(21, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='reportemateriales' class='nav-link "; if($url=='reportemateriales'){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Reporte Materiales</p>
                </a>
              </li>";
            }

            if (in_array(22, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='reporteproductos' class='nav-link ";if($url=='reporteproductos'){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Reporte Productos</p>
                </a>
              </li>";
            }
            if (in_array(25, $arrayidModulos)){
              echo "<li class='nav-item'>
                <a href='reporterecetas' class='nav-link ";if($url=='reporterecetas'){ echo "active"; } echo"'>
                <i class='nav-icon fas fa-angle-double-right'></i>
                  <p>Reporte Recetas</p>
                </a>
              </li>";
            }

          echo"</ul>
            
          </li>";
          }?>

          <?php if (in_array(23, $arrayidModulos)){
          echo "<li class='nav-item'>
            <a href='configuracion' class='nav-link ";if($url=='configuracion'){ echo 'active'; } echo"'>
              <i class='nav-icon fas fa-gear'></i>
              <p>
                Configuración
              </p>            
            </a>           
          </li>";
          }?>

          <?php if (in_array(28, $arrayidModulos)){
          echo "<li class='nav-item'>
            <a href='backup' class='nav-link "; if($url=='backup'){ echo "active"; } echo"'>
              <i class='nav-icon fas fa-shield-alt'></i>
              <p>
                Backup
              </p>
            </a>
          </li>";}
          ?>
      
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>