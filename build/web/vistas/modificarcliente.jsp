<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.clientemodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MODIFICAR CLIENTE</title>
    <!-- Incluir Bootstrap -->
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
    <div class="container mt-4">
        <h1>MODIFICAR CLIENTE</h1>
        <%  
            //recibe el id desde la tabla de la pagina clientes.jsp al presionar el boton modificar
            String id = request.getParameter("id");
            //se instancia la clase cliente modelo
            clientemodelo modelo = new clientemodelo();
            //se crea una lista para obtener todos los datos de la fila seleccionada desde la base de datos
            List<clientemodelo> list = modelo.listarporid(id);
            //se instancia un nuevo objeto vacio para contener lo recorrido
            clientemodelo m = null;
            if (list.size() > 0) {
                m = list.get(0);
            }
        %>
        <form action="../clientecontrolador" method="post">
            <!-- EL CODIGO APARECE OCULTO JUSTAMENTO PORQUE NO QUEREMOS EDITAR -->
            <input type="hidden" name="txtcodigo" value="<%= m != null ? m.getCodigo() : "" %>">
            <!-- en cada value se envia el valor que se va a editar de la tabla -->
            <div class="form-group">
                <label for="txtcodigo">CÓDIGO</label>
                <input readonly type="text" class="form-control" id="txtcodigo" name="txtcodigo" value="<%= m != null ? m.getCodigo() : "" %>">
            </div>
            <div class="form-group">
                <label for="txtnombre">NOMBRE</label>
                <input type="text" class="form-control" id="txtnombre" name="txtnombre" value="<%= m != null ? m.getNombre() : "" %>">
            </div>
            <div class="form-group">
                <label for="txtapellido">APELLIDO</label>
                <input type="text" class="form-control" id="txtapellido" name="txtapellido" value="<%= m != null ? m.getApellido() : "" %>">
            </div>
            <div class="form-group">
                <label for="txtci">CI</label>
                <input type="text" class="form-control" id="txtci" name="txtci" value="<%= m != null ? m.getCi() : "" %>">
            </div>
            <div class="form-group">
                <label for="txttelefono">TELÉFONO</label>
                <input type="text" class="form-control" id="txttelefono" name="txttelefono" value="<%= m != null ? m.getTelefono() : "" %>">
            </div>
            <div class="form-group">
                <label for="txtciudad">CIUDAD</label>
                <input type="text" class="form-control" id="txtciudad" name="txtciudad" value="<%= m != null ? m.getCiudad() : "" %>">
            </div>
            <!-- AL PRESIONAR EL BOTON EDITAR SE ENVIA UNA variable accion = "Editar" QUE DEBE RECIBIR EL CONTROLADOR -->
            <button type="submit" class="btn btn-primary" name="accion" value="Editar">Editar</button>
              <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
        </form>
    </div>
    <!-- Scripts de Bootstrap (jQuery y Popper.js son requeridos para Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
