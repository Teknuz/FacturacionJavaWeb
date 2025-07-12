<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.ciudadmodelo"%>
<%@page import="modelo.ciudadmodelo"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <!-- Incluye los estilos de Bootstrap -->
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
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">MODIFICAR CIUDAD</h1>
        <%  
            String id = request.getParameter("id");
            ciudadmodelo modelo = new ciudadmodelo();
            List<ciudadmodelo> list = modelo.listarporid(id);
            Iterator<ciudadmodelo> iter = list.iterator();
            ciudadmodelo m = null;
            while (iter.hasNext()) {
                m = iter.next();
            }
        %>
        <form action="../ciudadcontrolador" method="post">
            <input type="hidden" name="txtcodigo" value="<%= m.getCodigo()%>">
            <div class="mb-3">
                <label for="txtcodigo" class="form-label">CÓDIGO</label>
                <input type="text" class="form-control" id="txtcodigo" name="txtcodigo" value="<%= m.getCodigo()%>">
            </div>
            <div class="mb-3">
                <label for="txtnombre" class="form-label">NOMBRE</label>
                <input type="text" class="form-control" id="txtnombre" name="txtnombre" value="<%= m.getNombre()%>">
            </div>
            <button type="submit" class="btn btn-primary" name="accion" value="Editar">Editar</button>
            <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
        </form>
    </div>
</body>
</html>
