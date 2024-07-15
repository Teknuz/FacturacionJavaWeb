<%-- 
    Document   : guardar_personal
    Created on : 23 abr 2024, 20:08:56
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>CERRAR CAJA</h1>
        <!-- 
        Se crea el formulario con un boton de tipo submit que enviara la peticion 
        al controlador del cliente que en breve se estará creando en el tutorial
        se utiliza el metodo post para pasar los valores correspondientes
        -->
        <form action="../cierrecajacontrolador" method="post">
            
            <h1> CODIGO</h1> <input type="text" name="txtcodigo">
            <h1> FECHA</h1> <input type="text" name="txtciefecha">
            <h1> MONTO </h1><input type="number"  name="txtciemonto">
            <h1> APERTURA ID</h1> <input type="text" name="txtapeid">
            
           
            <br>
            <!-- 
            MUY IMPORTANTE ENVIAR UNA VARIABLE MAS POR POST EN ESTE CASO 
            SE ENVIA CON LOS TXT LA VARIABLE accion = "Agregar"
            PARA QUE DE ESA FORMA EL CONTROLADOR PUEDA SABER QUE EL USUARIO 
            QUIERE AGREGAR Y NO MODIFICAR O ELIMINAR
            -->
            <input type="submit" name="accion" value="Agregar">
           
        </form>
</html>
