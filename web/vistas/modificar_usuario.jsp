 <%-- 
    Document   : modificarcliente
    Created on : 17/03/2024, 09:16:25 PM
    Author     :user
--%>

<%@page import="modelo.personalmodelo"%>
<%@page import="modelo.usuariosmodelo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.usuariosmodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
     
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
      <style>
        body {
            background-color: #343a40;
            color: #fff;
        }
        .container {
            margin-top: 50px;
        }
        h1 {
            color: #fff;
        }
        input[type="text"] {
            background-color: #495057;
            border: none;
            color: #fff;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
            
        }
                body {
                background-color: #343a40;
                color: #fff;
            }
            .container {
                margin-top: 50px;
            }
          
            .btn {
                margin-right: 5px;
            }
            
           

            th {
                color: #7e7e7e;
                
            }
            td {
               color: #7e7e7e;
               
               
            }



table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    padding: 8px;
    text-align: left;
    color: #fff;
}

  

button {
    margin: 5px;
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
}

.modal-contenido {
    background-color: #343a40;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: auto;
    
    height: auto;
    overflow: auto;
    text-align: center;
}



.cerrar {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.cerrar:hover, .cerrar:focus {
    color: #fff;
}
        
    </style>
</head>
<body>
    <div class="container">
           
   
            
           
        <h1>MODIFICAR USUARIOS</h1>
        <%
            String id = request.getParameter("id");
            usuariosmodelo modelo = new usuariosmodelo();
            List<usuariosmodelo> list = modelo.listarporid(id);
            Iterator<usuariosmodelo> iter = list.iterator();
            usuariosmodelo m = null;
            iter.hasNext();
            while (iter.hasNext()) {
                m = iter.next();
            }
        %>
          
        <form action="../usuarioscontrolador" method="post">
             <script> 
                function mostrarModal() {
                event.preventDefault();
                document.getElementById("miModal").style.display = "block";
            }
                function cerrarModal() {
                event.preventDefault();
                document.getElementById("miModal").style.display = "none";
            }
              </script>
            <input type="hidden" name="txtcodigo" value="<%= m.getCodigo()%>">

            <div class="form-group">
                <label for="txtusuario">USUARIO</label>
                <input type="text" class="form-control" id="txtusuario" name="txtusuario" value="<%= m.getUsuario()%>">
            </div>
            <div class="form-group">
                <label for="txtclave">CLAVE</label>
                <input type="text" class="form-control" id="txtclave" name="txtclave" value="<%= m.getClave()%>">
            </div>
             <div class="form-group">
                <label for="lang">TIPO</label> <BR><BR>
                <select name="tipo" id="tipo">">
                    <option selected="<%=m.getTipo()%>"></option>
        <option value="ADMNISTRADOR">ADMINISTRADOR</option>
        <option value="INVITADO">INVITADO</option>
        </select>
            </div>
            <BR><div class="form-group">
                
                
                   <label for="lang">ESTADO</label> <BR><BR>
                   <select name="estado" id="estado">
        <option value="ACTIVO">ACTIVO</option>
        <option value="INACTIVO">INACTIVO</option>
        </select>
            </div>
          
<div class="form-group"><BR>
     <%
            String id2 = request.getParameter("id");
            personalmodelo modelo2 = new personalmodelo();
            List<personalmodelo> list2 = modelo2.listarporid(id2);
            Iterator<personalmodelo> iter2 = list2.iterator();
            personalmodelo m3 = null;
            iter.hasNext();
            while (iter2.hasNext()) {
                m3 = iter2.next();
            }
        %>
                <label for="txtusu">ID</label> <button class="btn btn-success mb-2" type="button" name="btnbuscarciu" onclick="mostrarModal()">
                                        BUSCAR</button>
                <input type="text" class="form-control" value="<%= m.getPersonal()%>" id="txtusu" name="txtusu">
               <label for="txtusunombre">Nombre Usuario</label>
               <input type="text" value="<%= m3.getNombre()%>" class="form-control" id="txtusunombre" name="txtusunombre">
            </div><BR>
            <br>
            <input type="submit" class="btn btn-primary" name="accion" value="Editar">
              <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
        </form>
    </div>
              <script>
               function mostrarModal() {
                event.preventDefault();
                document.getElementById("miModal").style.display = "block";
            }
                function cerrarModal() {
                event.preventDefault();
                document.getElementById("miModal").style.display = "none";
            }
             function obtenerfilaciu(boton) {
                event.preventDefault(); // Evitar la acción predeterminada del botón

                var fila = boton.parentNode.parentNode;
                var celdas = fila.getElementsByTagName("td");
                var datosFila = [];

                for (var i = 0; i < celdas.length - 1; i++) {
                    var valor = celdas[i].querySelector(".dato-input").textContent;
                    datosFila.push(valor);
// var valor2 = valor ? valor.textContent : "nada";
// datosFila.push(valor);
                }

// Asignar los datos a los inputs correspondientes
                document.getElementById("txtusu").value = datosFila[0];
                document.getElementById("txtusunombre").value = datosFila[1];

// Cerrar el modal
                cerrarModal();
            }
            function moverFila(boton) {
                event.preventDefault(); // Evitar la acción predeterminada del botón
                var fila = boton.parentNode.parentNode;
                var celdas = fila.getElementsByTagName("td");
                var datosFila = [];

                for (var i = 0; i < celdas.length - 1; i++) {
                    var valor = celdas[i].querySelector(".dato-input").textContent;
                    datosFila.push(valor);
                }

// Asignar los datos a los inputs correspondientes
                document.getElementById("txtusu").value = datosFila[0];
                document.getElementById("txtusunombre").textContent = datosFila[1];
                cerrarModalp();
                
                input.focus();
            }
               </script>
               
                <div id="miModal" class="modal">
                        <div class="modal-contenido">
                            <label>BUSCADOR DE PERSONALES</label>
                            <span class="cerrar" onclick="cerrarModal()">&times;</span>
                            <table border="1" id="mitabla">
                                <thead>
                                    <tr>
                                        <th>CODIGO</th>
                                        <th>NOMBRE</th>
                                          <th>Apellido</th>
                                          <th>CI</th>
                                            <th>TELEFONO</th>
                                        <th>ACCION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                     <%
                                        personalmodelo modelo5 = new personalmodelo();
                                        List<personalmodelo> list5 = modelo5.listar();
                                        Iterator<personalmodelo> iter5 = list5.iterator();
                                        personalmodelo m5 = null;
                                        while (iter5.hasNext()) {
                                            m5 = iter5.next();
                                    %>
                                    <tr>
                                        <td><span class="dato-input"><%= m.getCodigo()%></span></td>
                                        <td><span class="dato-input"><%= m5.getNombre()%></span></td>
                                               <td><span class="dato-input"><%= m5.getApellido()%></span></td>
                                        <td><span class="dato-input"><%= m5.getCi()%></span></td>
                                         <td><span class="dato-input"><%= m5.getTelefono()%></span></td>
                                            
                                        
                                        <td><button class="btn btn-success mb-2" type="button" onclick="obtenerfilaciu(this)">
                                                SELECCIONAR</button></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
     
    <!-- Scripts de Bootstrap y jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
