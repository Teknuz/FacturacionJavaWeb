<%-- 
    Document   : modificarcliente
    Created on : 17/03/2024, 09:16:25 PM
    Author     : user
--%>

<%@page import="modelo.proveedoresmodelo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.clientemodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <!-- Bootstrap CSS -->
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
        <h1 class="mt-5">MODIFICAR PROVEEDORES</h1>
        <%  
            //recibe el id desde la tabla de la pagina clientes.jsp al presionar el boton modificar
            String id =request.getParameter("id");
            //se instancia la clase cliente modelo
            proveedoresmodelo modelo = new proveedoresmodelo();
            //se crea una lista para obtener todos los datos de la fila seleccionada desde la base de datos
            List<proveedoresmodelo> list = modelo.listarporid(id);
            //se crea un iterador para recorrer los resultados
            Iterator<proveedoresmodelo> iter = list.iterator();
            //se instancia un nuevo objeto vacio para contener lo recorrido
            proveedoresmodelo m = null;
            //en este caso no hay un bucle porque el método listarporid solo arrojara un registro, no hay dos con mismo id
            iter.hasNext();
            //se obtiene el valor
            m = iter.next();
        %>
        <form action="../proveedorescontrolador" method="post">
            <!-- EL CODIGO APARECE OCULTO JUSTAMENTO PORQUE NO QUEREMOS EDITAR -->
            <input type="hidden" name="txtcodigo" value="<%= m.getCodigo()%>">
            <!-- en cada value se envia el valor que se va a editar de la tabla -->
            <div class="form-group">
                <label for="txtcodigo">CÓDIGO</label>
                <input readonly type="text" class="form-control" name="txtcodigo" value="<%= m.getCodigo()%>">
            </div>
            <div class="form-group">
                <label for="txtnombre">NOMBRE</label>
                <input type="text" class="form-control" name="txtnombre" value="<%= m.getNombre()%>">
            </div>
            <div class="form-group">
                <label for="txtruc">RUC</label>
                <input type="text" class="form-control" name="txtruc" value="<%= m.getRuc()%>">
            </div>
            <div class="form-group">
                <label for="txttelefono">TELÉFONO</label>
                <input type="text" class="form-control" name="txttelefono" value="<%= m.getTelefono()%>">
            </div>
            <div class="form-group">
                <label for="txtcorreo">CORREO</label>
                <input type="text" class="form-control" name="txtcorreo" value="<%= m.getCorreo()%>">
            </div>
            <div class="form-group">
                <label for="txtciudad">CIUDAD</label>
                <input type="text" class="form-control" name="txtciudad" value="<%= m.getCiudad()%>">
            </div>
         
            <button type="submit" class="btn btn-primary" name="accion" value="Editar">Editar</button>
            <!-- También podrías incluir un botón para cancelar la edición -->
            <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
        </form>
    </div>
</body>
</html>
