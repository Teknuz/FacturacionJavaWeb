<%@page import="modelo.productosmodelo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.clientemodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>PRODUCTOS</title>
    <!-- Incluir Bootstrap -->
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
                            <a class="dropdown-item" href="cobros.jsp">Cobrar</a>
                            <a class="dropdown-item" href="pagos.jsp">Pagar</a>
                            <a class="dropdown-item" href="cerrar.jsp">Cerrar caja</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Inventario</a>
                    </li>
                </ul>
                <% HttpSession sesion = request.getSession();
       if(sesion.getAttribute("sesion") == null){
           response.sendRedirect("index.jsp");
       }
    %>
                <%
 String usunombre = (String)sesion.getAttribute("usu_nombre");
 %>
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
    <div class="container mt-4">
       
        <main>
            <!--titulo de la pagina clientes -->
            <h1>FORMULARIO PRODUCTOS</h1>
            <!-- SE CREA LA ESTRUCTURA DEL FORMULARIO CLIENTES -->
            <!-- se agrega un hiperviculo para abrir una nueva página para agregar cleintes a la bd -->
            <a href="vistas/guardar_productos.jsp" class="btn btn-primary mb-3">GUARDAR PRODUCTOS</a>
            <form action="productoscontrolador" method="post">
                <button type="submit" class="btn btn-success mb-3" name="accion" value="informe">IMPRIMIR</button>
            </form>
            <!-- se agrega una tabla para visualizar a todos los clientes de la base de datos -->
            <table class="table table-dark table-striped">
                <thead >
                    <!-- para el encabezado se colocan los atributos segun la tabla cliente -->
                    <tr>
                        <th>CÓDIGO</th>
                        <th>NOMBRE</th>
                        <th>COSTO</th>
                        <th>PRECIO</th>
                        <th>STOCK</th>
                        <th>STOCK MINIMO</th>
                        <th>PROVEEDOR ID</th>
                        <th>IVA</th>
                        <th>CATEGORIA</th>
                        <th>ACCION</th><!-- aqui iran dos botones modificar y eliminar -->
                    </tr>
                </thead>
                <% 
                    //se crea la instancia para la comunicacion de la pagina con el modelo
                    productosmodelo modelo = new productosmodelo();
                    //se crea una lista para obtemer los valores del mertodo listar
                    //como listar retorna una lista por eso una lista lo debe recibir
                    List<productosmodelo> list = modelo.listar();
                    // se crea un iterador para que pueda ser recorrido por un bucle
                    Iterator<productosmodelo> iter = list.iterator();
                    //se crea un nuevo objeto denominado m vacio que contendrá cada fina de por separado
                    productosmodelo m = null;
                    //comienza el bucle desde la posicion 1
                    while (iter.hasNext()) {
                        //se obtiene el primer registro
                        m = iter.next();
                %>
                <tbody>
                    <tr>
                        <!-- aqui del objeto m se va obteniendo los valores por separado segun como corrresponda 
                        columna 1 es para codigo
                        columna 2 es para nombre
                        columna 3 es para apellido
                        columna 4 es para ruc/ci
                        -->
                        <td><%= m.getCodigo()%></td>
                        <td><%= m.getNombre()%></td>
                        <td><%= m.getCosto()%></td>
                        <td><%= m.getPrecio()%></td>
                        <td><%= m.getStock()%></td>
                        <td><%= m.getStockmin()%></td>
                        <td><%= m.getProveedorid()%></td>
                        <td><%= m.getIva()%></td>
                        <td><%= m.getCategoria()%></td>
                        
                        <!-- Se envía el id a la pagina modificarcliente.jsp para buscar el cliente a modificar -->
                        <td>
                            <a href="vistas/modificar_productos.jsp?id=<%= m.getCodigo()%>" class="btn btn-warning btn-sm">EDITAR</a>
                            <form action="productoscontrolador" method="post" class="d-inline">
                                <input type="hidden" name="accion" value="delete">
                                <input type="hidden" name="id" value="<%= m.getCodigo()%>">
                                <button type="submit" class="btn btn-danger btn-sm">ELIMINAR</button>
                            </form>
                           
                           
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </main>
    </div>
    <!-- Scripts de Bootstrap (jQuery y Popper.js son requeridos para Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<footer>
  
    
</footer>
</html>
