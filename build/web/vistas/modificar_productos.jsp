<%@page import="modelo.productosmodelo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MODIFICAR PRODUCTOS</title>
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
    <div class="container mt-4">
        <h1>MODIFICAR PRODUCTOS</h1>
        <%  
            //recibe el id desde la tabla de la pagina clientes.jsp al presionar el boton modificar
            String id =request.getParameter("id");
            //se instancia la clase cliente modelo
            productosmodelo modelo = new productosmodelo();
            //se crea una lista para obtener todos los datos de la fila seleccionada desde la base de datos
            List<productosmodelo> list = modelo.listarporid(id);
            //se crea un iterador para recorrer los resultados
            Iterator<productosmodelo> iter = list.iterator();
            //se instancia un nuevo objeto vacio para contener lo recorrido
            productosmodelo m = null;
            //en este caso no hay un bucle porque el método listarporid solo arrojara un registro, no hay dos con mismo id
            iter.hasNext();
            //se obtiene el valor
            m = iter.next();
        %>
        <form action="../productoscontrolador" method="post">
            <!-- EL CODIGO APARECE OCULTO JUSTAMENTO PORQUE NO QUEREMOS EDITAR -->
            <input type="hidden" name="txtcodigo" value="<%= m.getCodigo()%>">
            <div class="form-group">
                <label for="txtcodigo">CÓDIGO</label>
                <input readonly type="text" class="form-control" id="txtcodigo" name="txtcodigo" value="<%= m.getCodigo()%>">
            </div>
            <div class="form-group">
                <label for="txtnombre">NOMBRE</label>
                <input type="text" class="form-control" id="txtnombre" name="txtnombre" value="<%= m.getNombre()%>">
            </div>
            <div class="form-group">
                <label for="txtcosto">COSTO</label>
                <input type="text" class="form-control" id="txtcosto" name="txtcosto" value="<%= m.getCosto()%>">
            </div>
            <div class="form-group">
                <label for="txtprecio">PRECIO</label>
                <input type="text" class="form-control" id="txtprecio" name="txtprecio" value="<%= m.getPrecio()%>">
            </div>
            <div class="form-group">
                <label for="txtiva">IVA</label>
                <input type="text" class="form-control" id="txtiva" name="txtiva" value="<%= m.getIva()%>">
            </div>
            <div class="form-group">
                <label for="txtstock">STOCK</label>
                <input type="text" class="form-control" id="txtstock" name="txtstock" value="<%= m.getStock()%>">
            </div>
            <div class="form-group">
                <label for="txtstockmin">STOCK MINIMO</label>
                <input type="text" class="form-control" id="txtstockmin" name="txtstockmin" value="<%= m.getStockmin()%>">
            </div>
            <div class="form-group">
                <label for="txtproveedorid">ID PROVEEDOR</label>
                <input type="text" class="form-control" id="txtproveedorid" name="txtproveedorid" value="<%= m.getProveedorid()%>">
            </div>
            
            <br>
            <!-- AL PRESIONAR EL BOTON EDITAR SE ENVIA UNA variable accion = "Editar" QUE DEBE RECIBIR EL CONTROLADOR -->
            <button type="submit" name="accion" value="Editar" class="btn btn-primary">Editar</button>
              <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
        </form>
    </div>
    <!-- Scripts de Bootstrap (jQuery y Popper.js son requeridos para Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
