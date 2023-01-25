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
      C-A-T-I-CA-O
      </span>
    </a>
<!-- Sidebar -->
<div class="sidebar">  
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="inicio" class="nav-link <?php if($url=='inicio'){ echo "active"; }?>">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a>
          </li>

          <li class="nav-item <?php if(in_array($url, array('insumos', 'materiales','marcas','productos','maquinas','empleados','gastoadmin', 'costoventa','costomarketing','costooperativo'))){ echo "menu-open"; }?>">
            <a href="#" class="nav-link <?php if(in_array($url, array('insumos', 'materiales','marcas','productos','maquinas','empleados','gastoadmin', 'costoventa','costomarketing','costooperativo'))){ echo "active"; }?>">
              <i class="nav-icon fas fa-pen"></i>
              <p>
                Registros
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>

            <ul class="nav nav-treeview">
              <li class="nav-item <?php if(in_array($url, array('insumos', 'materiales','marcas'))){ echo "menu-open"; }?>">
                <a href="#" class="nav-link <?php if(in_array($url, array('insumos', 'materiales','marcas'))){ echo "active"; }?>">
                  <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Insumos y Materiales
                  <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="insumos" class="nav-link <?php if($url=='insumos'){ echo "active"; }?>">
                  <i class="nav-icon fas fa-angle-right"></i>
                  <p>Insumos</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="materiales" class="nav-link <?php if($url=='materiales'){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-right"></i>
                  <p>Materiales</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="marcas" class="nav-link <?php if($url=='marcas'){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-right"></i>
                  <p>Marcas</p>
                </a>
              </li>
               </ul>
              </li>

              <li class="nav-item">
                <a href="productos" class="nav-link <?php if($url=='productos'){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Productos</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="maquinas" class="nav-link <?php if($url=='maquinas'){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Maquinas</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="empleados" class="nav-link <?php if($url=='empleados'){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Empleados</p>
                </a>
              </li>


              <li class="nav-item <?php if(in_array($url, array('gastoadmin', 'costoventa','costomarketing','costooperativo'))){ echo "menu-open"; }?>">
                <a href="#" class="nav-link <?php if(in_array($url, array('gastoadmin', 'costoventa','costomarketing','costooperativo'))){ echo "active"; }?>">
                  <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Gastos y Costos
                  <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                
                <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="gastoadmin" class="nav-link <?php if($url=='gastoadmin'){ echo "active"; }?>">
                  <i class="nav-icon fas fa-angle-right"></i>
                  <p>Gastos Admin</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="costoventa" class="nav-link <?php if($url=='costoventa'){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-right"></i>
                  <p>Costos de Ventas</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="costomarketing" class="nav-link <?php if($url=='costomarketing'){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-right"></i>
                  <p>Costos de Marketing</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="costooperativo" class="nav-link <?php if($url=='costooperativo'){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-right"></i>
                  <p>Costos Operativos</p>
                </a>
              </li>
            </ul>
              </li>
            </ul>
            
          </li>

          <li class="nav-item <?php if (in_array($url, array('inventariomateriales', 'inventarioinsumos','inventarioproductos','inventariomaquinas','kardexinsumos','kardexmateriales','kardexproductos','kardexmaquinas'))){echo "menu-open";}?>">
            <a href="#" class="nav-link <?php if(in_array($url, array('inventariomateriales', 'inventarioinsumos','inventarioproductos','inventariomaquinas','kardexinsumos','kardexmateriales','kardexproductos','kardexmaquinas'))){ echo "active"; }?>">
              <i class="nav-icon fas fa-box"></i>
              <p>
                Inventario
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>

            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="inventarioinsumos" class="nav-link <?php if(in_array($url, array('inventarioinsumos','kardexinsumos'))){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Inventario Insumos</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="inventariomateriales" class="nav-link <?php if(in_array($url, array('inventariomateriales','kardexmateriales'))){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Inventario Materiales</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="inventarioproductos" class="nav-link <?php if(in_array($url, array('inventarioproductos','kardexproductos'))){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Inventario Productos</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="inventariomaquinas" class="nav-link <?php if(in_array($url, array('inventariomaquinas','kardexmaquinas'))){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Inventario Maquinas</p>
                </a>
              </li>
            </ul>
            
          </li>

          <li class="nav-item <?php if($url=='recetas'){ echo "menu-open"; }?>">
            <a href="#" class="nav-link <?php if($url=='recetas'){ echo "active"; }?>">
              <i class="nav-icon fas fa-receipt"></i>
              <p>
                Operaciones
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>

            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="recetas" class="nav-link <?php if($url=='recetas'){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Receta</p>
                </a>
              </li>
            </ul>
            
          </li>

          <li class="nav-item <?php if (in_array($url, array('costoreceta','costototal','costorecetasgastoadmin','gastoadminpormes','costototalpormes'))){echo "menu-open";}?>">
          <a href="#" class="nav-link <?php if(in_array($url, array('costoreceta','costototal','costorecetasgastoadmin','gastoadminpormes','costototalpormes'))){ echo "active"; }?>">
              <i class="nav-icon fas fa-money-bill"></i>
              <p>
                Costos
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>

            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="costoreceta" class="nav-link <?php if(in_array($url, array('costoreceta','costototal'))){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Costo de Receta</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="costorecetasgastoadmin" class="nav-link <?php if(in_array($url, array('costorecetasgastoadmin','gastoadminpormes','costototalpormes'))){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>C. Receta y G. Admin</p>
                </a>
              </li>
            </ul>
            
          </li>

          <li class="nav-item">
            <a href="usuarios" class="nav-link <?php if($url=='usuarios'){ echo "active"; }?>">
              <i class="nav-icon fas fa-user"></i>
              <p>
                Usuarios
              </p>
            </a>
          </li>

          <li class="nav-item <?php if (in_array($url, array('reporteinsumos','reportemateriales','reporteproductos'))){echo "menu-open";}?>">
          <a href="#" class="nav-link <?php if(in_array($url, array('reporteinsumos','reportemateriales','reporteproductos'))){ echo "active"; }?>">
              <i class="nav-icon fas fa-chart-line"></i>
              <p>
                Reportes
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>

            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="reporteinsumos" class="nav-link <?php if(in_array($url, array('reporteinsumos'))){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Reporte Insumos</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="reportemateriales" class="nav-link <?php if(in_array($url, array('reportemateriales'))){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Reporte Materiales</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="reporteproductos" class="nav-link <?php if(in_array($url, array('reporteproductos'))){ echo "active"; }?>">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Reporte Productos</p>
                </a>
              </li>
            </ul>
            
          </li>

          <li class="nav-item">
            <a href="configuracion" class="nav-link <?php if($url=='configuracion'){ echo "active"; }?>">
              <i class="nav-icon fas fa-gear"></i>
              <p>
                Configuración
              </p>            
            </a>           
          </li>

      
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>