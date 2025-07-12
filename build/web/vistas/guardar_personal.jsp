<%-- 
    Document   : guardar_personal
    Created on : 23 abr 2024, 20:08:56
    Author     : User
--%>

<%@page import="modelo.personalmodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AGREGAR UN NUEVO PERSONAL</title>
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
                   <% personalmodelo facturaModelo = new personalmodelo();
    String ultimoNumeroFacturaPago = facturaModelo.obtenerUltimoNumeroFacturaPago();
    int nuevoNumeroFactura = Integer.parseInt(ultimoNumeroFacturaPago) + 1;
    %>
    <div class="container">
        <h1 class="mt-5">AGREGAR UN NUEVO PERSONAL</h1>
        
        <form action="../personalcontrolador" method="post">
            <div class="form-group">
                <label for="txtcodigo">CÓDIGO</label>
                <input type="text" class="form-control" value="<%= nuevoNumeroFactura%>" id="txtcodigo" readonly name="txtcodigo">
            </div>
            <div class="form-group">
                <label for="txtnombre">NOMBRE</label>
                <input type="text" class="form-control" id="txtnombre" name="txtnombre">
            </div>
            <div class="form-group">
                <label for="txtapellido">APELLIDO</label>
                <input type="text" class="form-control" id="txtapellido" name="txtapellido">
            </div>
            <div class="form-group">
                <label for="txtci">CI</label>
                <input type="text" class="form-control" id="txtci" name="txtci">
            </div>
            <div class="form-group">
                <label for="txttelefono">TELÉFONO</label>
                <input type="text" class="form-control" id="txttelefono" name="txttelefono">
            </div>
          
            <button type="submit" class="btn btn-primary" name="accion" value="Agregar">Agregar</button>
            <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
        </form>
    </div>
      
    <!-- Bootstrap JS (opcional) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
