<%-- 
    Document   : modificarcliente
    Created on : 17/03/2024, 09:16:25 PM
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.personalmodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MODIFICAR PERSONAL</title>
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
<body>
    <div class="container">
        <h1 class="mt-5">MODIFICAR PERSONAL</h1>
        <%  
            //recibe el id desde la tabla de la pagina clientes.jsp al presionar el boton modificar
            String id = request.getParameter("id");
            //se instancia la clase cliente modelo
            personalmodelo modelo = new personalmodelo();
            //se crea una lista para obtener todos los datos de la fila seleccionada desde la base de datos
            List<personalmodelo> list = modelo.listarporid(id);
            //se crea un iterador para recorrer los resultados
            Iterator<personalmodelo> iter = list.iterator();
            //se instancia un nuevo objeto vacio para contener lo recorrido
            personalmodelo m = null;
            //en este caso no hay un bucle porque el método listarporid solo arrojara un registro, no hay dos con mismo id
            if (iter.hasNext()) {
                m = iter.next();
            }
        %>
        <form action="../personalcontrolador" method="post">
            <!-- EL CODIGO APARECE OCULTO JUSTAMENTO PORQUE NO QUEREMOS EDITAR -->
            <input type="hidden" name="txtcodigo" value="<%= m.getCodigo()%>">
            <!-- en cada value se envia el valor que se va a editar de la tabla -->
            <div class="form-group">
                <label for="txtcodigo">CÓDIGO</label>
                <input type="text" class="form-control" id="txtcodigo" name="txtcodigo" value="<%= m.getCodigo()%>">
            </div>
            <div class="form-group">
                <label for="txtnombre">NOMBRE</label>
                <input type="text" class="form-control" id="txtnombre" name="txtnombre" value="<%= m.getNombre()%>">
            </div>
            <div class="form-group">
                <label for="txtapellido">APELLIDO</label>
                <input type="text" class="form-control" id="txtapellido" name="txtapellido" value="<%= m.getApellido()%>">
            </div>
            <div class="form-group">
                <label for="txtci">CI</label>
                <input type="text" class="form-control" id="txtci" name="txtci" value="<%= m.getCi()%>">
            </div>
            <div class="form-group">
                <label for="txttelefono">TELÉFONO</label>
                <input type="text" class="form-control" id="txttelefono" name="txttelefono" value="<%= m.getTelefono()%>">
            </div>
            
            <button type="submit" class="btn btn-primary" name="accion" value="Editar">Editar</button>
            <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
        </form>
    </div>
    <!-- Bootstrap JS (opcional) -->
    
</body>
</html>
