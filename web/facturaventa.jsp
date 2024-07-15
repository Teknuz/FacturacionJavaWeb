<%@ page import="modelo.facturaventamodelo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Formulario Facturacion</title>
    <!-- Bootstrap CSS -->
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
        </style>
</head>
  <header>
       <% HttpSession sesion = request.getSession();
            if (sesion.getAttribute("sesion") == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <%
            String usunombre = (String) sesion.getAttribute("usu_nombre");
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-between">
            <a class="navbar-brand" href="menuprincipal.jsp">
                <img class="logo" src="img/logo.png"  width="50px" height="50px">
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
    
    <main class="container mt-5">
        <div id="inicio">
            <div class="bloque-inicio2">
                <h1 class="mb-4">Formulario Facturacion Ventas</h1>
                <form action="facturaventacontrolador" method="POST">
                    <button type="submit" class="btn btn-primary me-3" name="accion" value="add">Agregar nueva factura</button>
                    
                    <table class="table mt-4">
                        <thead>
                            <tr>
                                <th>N</th>
                                <th>Fecha</th>
                                <th>Condicion</th>
                                <th>Estado</th>
                                <th>Usuario</th>
                                <th>Apertura</th>
                                <th>Clientes</th>
                                <th>Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                facturaventamodelo modelo = new facturaventamodelo();
                                List<facturaventamodelo> list = modelo.listarfacturas();
                                Iterator<facturaventamodelo> iter = list.iterator();
                                facturaventamodelo m = null;
                                while (iter.hasNext()) {
                                    m = iter.next();
                            %>
                            <tr>
                                <td><%= m.getIdfacturacion()%></td>
                                <td><%= m.getFecha()%></td>
                                <td><%= m.getCondicion()%></td>
                                <td><%= m.getEstado()%></td>
                                <td><%= m.getIdusuarios()%></td>
                                <td><%= m.getIdapertura()%></td>
                                <td><%= m.getCliente()%></td>
                                <td>
                                    <button type="submit" class="btn btn-info" name="imprimir" value="<%= m.getIdfacturacion()%>">IMPRIMIR</button>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </main>
    <!-- Bootstrap JS (Optional) -->
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
