<%@page import="modelo.proveedoresmodelo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.clientemodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>FORMULARIO PROVEEDORES</title>
 
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
   
    <main class="container mt-4">
        <!--titulo de la pagina clientes -->
        <h1>FORMULARIO PROVEEDORES</h1>
        <!-- SE CREA LA ESTRUCTURA DEL FORMULARIO CLIENTES -->
        <!-- se agrega un hiperviculo para abrir una nueva página para agregar cleintes a la bd -->
        <a class="btn btn-primary mb-2" href="vistas/guardar_proveedores.jsp">GUARDAR PROVEEDOR</a>
        <form action="proveedorescontrolador" method="post">
            <button type="submit" class="btn btn-success mb-2" name="accion" value="informe">IMPRIMIR</button>
        </form>
        <!-- se agrega una tabla para visualizar a todos los clientes de la base de datos -->
        <table class="table">
            <thead class="thead-dark">
                <!-- para el encabezado se colocan los atributos segun la tabla cliente -->
                <tr>
                    <th>CÓDIGO</th>
                    <th>NOMBRE</th>
                    <th>RUC</th>
                    <th>TELEFONO</th>
                    <th>CORREO</th>
                    <th>CIUDAD</th>
                    <th>ACCIONES</th><!-- aqui iran dos botones modificar y eliminar -->
                </tr>
            </thead>
            <tbody>
                <% 
                    //se crea la instancia para la comunicacion de la pagina con el modelo
                    proveedoresmodelo modelo = new proveedoresmodelo();
                    //se crea una lista para obtemer los valores del mertodo listar
                    //como listar retorna una lista por eso una lista lo debe recibir
                    List<proveedoresmodelo> list = modelo.listar();
                    // se crea un iterador para que pueda ser recorrido por un bucle
                    Iterator<proveedoresmodelo> iter = list.iterator();
                    //se crea un nuevo objeto denominado m vacio que contendrá cada fina de por separado
                    proveedoresmodelo m = null;
                    //comienza el bucle desde la posicion 1
                    while (iter.hasNext()) {
                        //se obtiene el primer registro
                        m = iter.next();
                %>
                <tr>
                    <!-- aqui del objeto m se va obteniendo los valores por separado segun como corrresponda -->
                    <td><%= m.getCodigo()%></td>
                    <td><%= m.getNombre()%></td>
                    <td><%= m.getRuc()%></td>
                    <td><%= m.getTelefono()%></td>
                    <td><%= m.getCorreo()%></td>
                    <td><%= m.getCiudad()%></td>
                    <!-- Se envía el id a la pagina modificarcliente.jsp para buscar el cliente a modificar -->
                    <td>
                        <a class="btn btn-warning btn-sm" href="vistas/modificar_proveedores.jsp?id=<%= m.getCodigo()%>">EDITAR</a>
                        <!-- posterior se convertirá en botones que llamaran a las paginas editar y eliminar -->
                        <form action="proveedorescontrolador" method="post" style="display: inline;">
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
    <!-- Scripts de Bootstrap (jQuery y Popper.js son requeridos para Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
