<%-- 
    Document   : guardar_cliente
    Created on : 17/03/2024, 08:42:23 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
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
        <h1 class="mb-4">AGREGAR UN NUEVO PROVEEDOR</h1>
    <!-- 
    Se crea el formulario con un boton de tipo submit que enviara la peticion 
    al controlador del cliente que en breve se estará creando en el tutorial
    se utiliza el metodo post para pasar los valores correspondientes
    -->
    <form action="../proveedorescontrolador" method="post">
        <div class="form-group">
            <label for="txtcodigo">CODIGO</label>
            <input type="text" class="form-control" name="txtcodigo"> 
        </div>
        <div class="form-group">
            <label for="txtnombre">NOMBRE</label>
            <input type="text" class="form-control" name="txtnombre"> 
        </div>
       
        <div>
            <label> RUC </label>
        <input type="text" class="form-control" name="txtruc">
        </div>
        <div>
            <label> TELEFONO </label>
            <input type="text" class="form-control" name="txttelefono">
        </div>
        <div>
            <label> CORREO </label>
            <input type="text" class="form-control" name="txtcorreo">
        </div>
        <div>
             <label> CIUDAD</label> 
             <input type="text" class="form-control" name="txtciudad">
        </div>
        
        
       
   
      
        <br>
        <!-- 
        MUY IMPORTANTE ENVIAR UNA VARIABLE MAS POR POST EN ESTE CASO 
        SE ENVIA CON LOS TXT LA VARIABLE accion = "Agregar"
        PARA QUE DE ESA FORMA EL CONTROLADOR PUEDA SABER QUE EL USUARIO 
        QUIERE AGREGAR Y NO MODIFICAR O ELIMINAR
        -->
        <input type="submit" name="accion" value="Agregar" class="btn btn-primary">
        <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
       
    </form>
</div>
    <!-- Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    
</body>
</html>
