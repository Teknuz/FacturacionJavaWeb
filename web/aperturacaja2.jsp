<%-- 
    Document   : aperturacaja2
    Created on : 8 may 2024, 08:25:05
    Author     : User
--%>
<%@page import="modelo.modeloabrircaja"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    
    <link rel="stylesheet" href="css/stylemodal.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="ccs/stylemodal.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     
    <style>
        /* Estilos personalizados */
        body {
            background-color: #343a40;
            color: #fff;
        }
        .container {
            margin-top: 50px;
        }
        th {
            color: #fff;
        }
        td {
            color: #adb5bd;
        }
        .btn {
            margin-right: 5px;
        }
         .modal-content{
            
            background-color: #5f675e
        }
    </style>
</head>
       <% HttpSession sesion = request.getSession();
       if(sesion.getAttribute("sesion") == null){
           response.sendRedirect("index.jsp");
       }
    %>
                <%
 String usunombre = (String)sesion.getAttribute("usu_nombre");
 %>
<header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-between">
            <a class="navbar-brand" href="menuprincipal.jsp">
                <img class="logo" src="img/logo.png" alt="logo"  width="50px" height="50px">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Mantenimiento
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                            <a class="dropdown-item" href="clientes.jsp">Clientes</a>
                            <a class="dropdown-item" href="personales.jsp">Personales</a>
                            <a class="dropdown-item" href="usuarios.jsp">Usuarios</a>
                            <a class="dropdown-item" href="productos.jsp">Productos</a>
                            <a class="dropdown-item" href="proveedores.jsp">Proveedores</a>
                            <a class="dropdown-item" href="ciudades.jsp">Ciudades</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Ventas
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                            <a class="dropdown-item" href="facturacompra.jsp">Registro de Compras</a>
                            <a class="dropdown-item" href="facturaventa.jsp">Generacion de Ventas</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Tesoreria
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown3">
                            <a class="dropdown-item" href="aperturacaja2.jsp">Abrir caja</a>
                            <a class="dropdown-item" href="facturaventa.jsp">Cobrar</a>
                            <a class="dropdown-item" href="#">Pagar</a>
                            <a class="dropdown-item" href="cerrar.jsp">Cerrar caja</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Inventario</a>
                    </li>
                </ul>
          
       
                <ul class="navbar-nav">
                    <!-- Dropdown con imagen de usuario -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="img/per.png" alt="per" width="30" height="30" style="border-radius: 50%;">
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownUser">
                            <span class="dropdown-header"><%= usunombre %></span>
                             
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="perfil.jsp">Perfil</a>
                            <a class="dropdown-item" href="#">Configuración</a>
                            <div class="dropdown-divider"></div>
                           <a class="dropdown-item"   href="cerrarsesion" type="submit" >Salir</a>
                        </div>
                    </li>
                    
                </ul>
            </div>
        </nav>
    </header>
<body>
<main>
    <div class="container">
        <form action="abrircajacontrolador" method="post">
            <div class="form-group">
                <input type="hidden" name="lblcodigo" value="<%= sesion.getAttribute("idusuarios")%>">
                <label for="txtmonto">Ingrese un monto</label>
                <input type="number" class="form-control" id="txtmonto" name="txtmonto">
            </div>
            <button type="submit" class="btn btn-primary" onclick="mostrarModal()" data-toggle="modal" data-target="#miModal">Abrir Caja</button>
         
           




       
</div>
            <!-- Ventan Modal -->
            <div id="miModal" class="modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="text">
                            <h5 class="modal-title">DESEA ABRIR CAJA</h5>
                            <button type="submit" onclick="cerrarModal()" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <!-- Contenido del modal -->
                            <p>Esta seguro que desea abrir caja?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" name="accion" value="abrir">SI</button>
                            <button type="button" onclick="cerrarModal()" class="btn btn-secondary" data-dismiss="modal">NO</button>
                        </div>
                    </div>
                </div>
            </div>
         
                </form>
            </div>
        </div>
    </div>
</div>
        </form>
    </div>
</main>
<script src="js/caja.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
