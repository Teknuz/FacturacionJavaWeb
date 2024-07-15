<%-- 
    Document   : menuprincipal
    Created on : 22/04/2024, 23:10:53
    Author     : User
--%>



<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
      <style>
       body {
            background-image: url('img/fondo.jpg'); /* Cambia 'img/background.jpg' por la ruta de tu imagen de fondo */
            background-size:contain, cover;
            background-position: center;
            color: #fff;
        }
        .container {
            margin-top: 100px;
        }
        .card {
            background-color: rgba(0, 0, 0, 2); /* Ajusta el valor de '0.5' para cambiar la opacidad */
            color: #fff;
        }
        .card-body{
            height: 400px;
    background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.8)), url('img/fondo.jpg');
    
        }
   
        .form-sign {
            padding: 20px; /* Añade un poco de espacio interno al formulario */
        }
        .form-group label {
            color: #fff;
        }
       
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="css/stylemodal.css"/>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
       
        <title>Menu Principal</title>
        
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
      
       <div class="container">
    <div class="card col-sm-10 mx-auto"> 
        <div class="card-body">
                
                <div class="form-group text-center">
                    <h3></h3>
                    <img src="img/logo.png" alt="70" width="170"/><br>
                    <label>Bienvenido al Sistema</label>
                </div>
                <div class="form-group">
                    <label>MENU PRINCIPAL</label>
                    
                </div>
                <div class="form-group">
                    <label>Bienvenido!</label>
                </div>
        </div>
    </div>
</div>

        <main>
            <div id="miModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="cerrarModal()">&times;</span>
                    <% String validarcaja = (String) request.getAttribute("validarcaja");
                    if(validarcaja != null && validarcaja.equals("noabrir")) { %>
                    <h1>CAJA ABIERTA, DEBE CERRAR</h1>
                    <button onclick="cerrarModal()">Aceptar</button>
                   <% } else if (validarcaja != null && validarcaja.equals("ABIERTA")) {%>
                    <h1>CAJA ABIERTA CORRECTAMENTE</h1>
                    <button onclick="cerrarModal()">Aceptar</button>
                    <% } else if (validarcaja != null && validarcaja.equals("CERRADAS")) {%>
                    <h1>CAJA CERRADA</h1>
                    <button onclick="cerrarModal()">Aceptar</button>
                    <%}%>
                </div>
            </div>
  </body>
      
 

        </main>
                    <script>
                      document.addEventListener("DOMContentLoaded",function () {
                          <% String validar3 = (String) request.getAttribute("validarcaja");
                          if(validar3 != null){ %>
                              mostrarModal();
                              <% }%>  
                      });
                      function mostrarModal(){
                          event.preventDefault();
                          document.getElementById("miModal").style.display = "block";}
                      
                      function cerrarModal(){
                          event.preventDefault();
                          document.getElementById("miModal").style.display = "none";   
                      }
                        
                    </script>
 
    <footer>
        
                
        
    </footer>
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    

