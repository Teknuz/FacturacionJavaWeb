<%@page import="modelo.usuariosmodelo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Usuarios</title>
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
        <%-- Recibe el ID desde la tabla de la página clientes.jsp al presionar el botón modificar --%>
        <% String id = request.getParameter("id");
           usuariosmodelo modelo = new usuariosmodelo();
           List<usuariosmodelo> list = modelo.listarporid(id);
           Iterator<usuariosmodelo> iter = list.iterator();
           usuariosmodelo m = null;
           if (iter.hasNext()) {
               m = iter.next();
           }
        %>
        <form action="../usuarioscontrolador" method="post">
            <!-- El código aparece oculto justo porque no queremos editarlo -->
            <input type="hidden" name="txtcodigo" value="<%= m.getCodigo()%>">
            <!-- En cada value se envía el valor que se va a editar de la tabla -->
            <div class="form-group">
                <label for="txtusuario">Usuario</label>
                <input type="text" class="form-control" id="txtusuario" name="txtusuario" value="<%= m.getUsuario()%>">
            </div>
            <div class="form-group">
                <label for="txtclave">Clave</label>
                <input type="text" class="form-control" id="txtclave" name="txtclave" value="<%= m.getClave()%>">
            </div>
            <div class="form-group">
                <label for="txttipo">Tipo</label>
                <input type="text" class="form-control" id="txttipo" name="txttipo" value="<%= m.getTipo()%>">
            </div>
            <div class="form-group">
                <label for="txtestado">Estado</label>
                <input type="text" class="form-control" id="txtestado" name="txtestado" value="<%= m.getEstado()%>">
            </div>
            <div class="form-group">
                <label for="txtpersonal">Personal</label>
                <input type="text" class="form-control" id="txtpersonal" name="txtpersonal" value="<%= m.getPersonal()%>">
            </div>
            <br>
            <!-- Al presionar el botón editar se envía una variable accion = "Editar" que debe recibir el controlador -->
            <input type="submit" class="btn btn-primary" name="accion" value="Editar">
        </form>
    </div>

    <!-- Scripts de Bootstrap y jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
