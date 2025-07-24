<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.clientemodelo" %>

<%
    clientemodelo. clienteEncontrado = null;
    String cli_id = request.getParameter("cli_id");
    if (cli_id != null && !cli_id.trim().isEmpty()) {
        clienteModelo modelo = new clienteModelo();
        clienteEncontrado = modelo.buscarPorId(cli_id);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Punto de Venta</title>
</head>
<body>
    <form method="get" action="venta.jsp">
        <label for="cli_id">ID Cliente:</label>
        <input type="text" id="cli_id" name="cli_id" value="<%= cli_id != null ? cli_id : "" %>">
        <button type="submit">Buscar</button>
    </form>

    <% if (clienteEncontrado != null) { %>
        <h3>Datos del Cliente:</h3>
        <p>Nombre: <%= clienteEncontrado.getNombre() %></p>
        <p>CI/RUC: <%= clienteEncontrado.getRuc() %></p>
        <p>Dirección: <%= clienteEncontrado.getDireccion() %></p>
    <% } else if (cli_id != null) { %>
        <p style="color:red;">Cliente no encontrado.</p>
    <% } %>
</body>
</html>
