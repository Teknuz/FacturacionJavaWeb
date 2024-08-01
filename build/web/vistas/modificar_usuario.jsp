<%-- 
    Document   : modificarcliente
    Created on : 17/03/2024, 09:16:25 PM
    Author     :user
--%>

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
                <label for="txttipo">TIPO</label>
                <input type="text" class="form-control" id="txttipo" name="txttipo" value="<%= m.getTipo()%>">
            </div>
            <div class="form-group">
                <label for="txtestado">ESTADO</label>
                <input type="text" class="form-control" id="txtestado" name="txtestado" value="<%= m.getEstado()%>">
            </div>
            <div class="form-group">
                <label for="txtpersonal">PERSONAL</label>
                <input type="text" class="form-control" id="txtpersonal" name="txtpersonal" value="<%= m.getPersonal()%>">
            </div>

            <br>
            <input type="submit" class="btn btn-primary" name="accion" value="Editar">
              <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
        </form>
    </div>

    <!-- Scripts de Bootstrap y jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
