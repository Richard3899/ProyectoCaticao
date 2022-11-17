<!-- Main Sidebar Container -->
<?php  
foreach ($configuracion as $key => $value){

if($value["mododark"] == 0){

  echo '<aside class="main-sidebar sidebar-dark-primary elevation-4">';

}else{

  echo '<aside class="main-sidebar sidebar-light-primary elevation-4">';

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
            <a href="inicio" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            
            </a>
            
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-pen"></i>
              <p>
                Registros
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>

            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Insumos y Materiales
                  <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                
                <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="insumos" class="nav-link">
                  <i class="nav-icon fas fa-angle-right"></i>
                  <p>Insumos</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="materiales" class="nav-link">
                <i class="nav-icon fas fa-angle-right"></i>
                  <p>Materiales</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="marcas" class="nav-link">
                <i class="nav-icon fas fa-angle-right"></i>
                  <p>Marcas</p>
                </a>
              </li>
               </ul>
              </li>

              <li class="nav-item">
                <a href="productos" class="nav-link">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Productos</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="maquinas" class="nav-link">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Maquinas</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="empleados" class="nav-link">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Empleados</p>
                </a>
              </li>


              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Gastos y Costos
                  <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                
                <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="gastoadmin" class="nav-link">
                  <i class="nav-icon fas fa-angle-right"></i>
                  <p>Gastos Admin</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="costoventa" class="nav-link">
                <i class="nav-icon fas fa-angle-right"></i>
                  <p>Costos de Ventas</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="costomarketing" class="nav-link">
                <i class="nav-icon fas fa-angle-right"></i>
                  <p>Costos de Marketing</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="costooperativo" class="nav-link">
                <i class="nav-icon fas fa-angle-right"></i>
                  <p>Costos Operativos</p>
                </a>
              </li>
            </ul>
              </li>


            </ul>
            
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-box"></i>
              <p>
                Inventario
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>

            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="inventarioinsumos" class="nav-link">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Inventario Insumos</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="inventariomateriales" class="nav-link">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Inventario Materiales</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="inventarioproductos" class="nav-link">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Inventario Productos</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="inventariomaquinas" class="nav-link">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Inventario Maquinas</p>
                </a>
              </li>

            </ul>
            
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-receipt"></i>
              <p>
                Operaciones
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>

            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="recetas" class="nav-link">
                <i class="nav-icon fas fa-angle-double-right"></i>
                  <p>Receta</p>
                </a>
              </li>

            </ul>
            
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-money-bill"></i>
              <p>
                Costos
                <i class="right fas fa-angle-left"></i>
              </p>
              
            </a>
            
          </li>

          <li class="nav-item">
            <a href="usuarios" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>
                Usuarios
                <i class="right fas fa-angle-left"></i>
              </p>
              
            </a>
            
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-chart-line"></i>
              <p>
                Reportes
                <i class="right fas fa-angle-left"></i>
              </p>
              
            </a>
            
          </li>

          <li class="nav-item">
            <a href="configuracion" class="nav-link">
              <i class="nav-icon fas fa-gear"></i>
              <p>
                Configuración
                <i class="right fas fa-angle-left"></i>
              </p>
              
            </a>
            
          </li>

      
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>