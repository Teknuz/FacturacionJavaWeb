<%-- 
    Document   : modificarcliente
    Created on : 17/03/2024, 09:16:25 PM
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.aperturacajamodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <h1>MODIFICAR PERSONAL</h1>
        <%  
                //recibe el id desde la tabla de la pagina clientes.jsp al presionar el boton modificar
                String id =request.getParameter("id");
                //se instancia la clase cliente modelo
                aperturacajamodelo modelo = new aperturacajamodelo();
                //se crea una lista para obtener todos los datos de la fila seleccionada desde la base de datos
                List<aperturacajamodelo> list = modelo.listarporid(id);
                //se crea un iterador para recorrer los resultados
                Iterator<aperturacajamodelo> iter = list.iterator();
                //se instancia un nuevo objeto vacio para contener lo recorrido
                aperturacajamodelo m = null;
                //en este caso no hay un bucle porque el método listarporid solo arrojara un registro, no hay dos con mismo id
               iter.hasNext();
               //se obtiene el valor
            while (iter.hasNext()) {
                m = iter.next();
            }
            %>
        <form action="../aperturacajacontrolador" method="post">
            <!-- EL CODIGO APARECE OCULTO JUSTAMENTO PORQUE NO QUEREMOS EDITAR -->
            <input type="hidden" name="txtcodigo" value="<%= m.getCodigo()%>">
            <!-- en cada value se envia el valor que se va a editar de la tabla -->
            <h1>  CODIGO</h1> <input type="text" name="txtcodigo" value="<%= m.getCodigo()%>">
            <h1> FECHA</h1> <input type="text" name="txtfecha" value="<%= m.getApefecha()%>">
            <h1> MONTO</h1> <input type="text" name="txtmonto" value="<%= m.getApemonto()%>">
            <h1> ESTADO </h1> <input type="text" name="txtestado" value="<%= m.getApeestado()%>">
            <h1> USUARIO </h1> <input type="text" name="txtusuario" value="<%= m.getIdusuario()%>">
            
         
            
            <br>
            <!-- AL PRESIONAR EL BOTON EDITAR SE ENVIA UNA variable accion = "Editar" QUE DEBE RECIBIR EL CONTROLADOR -->
            <input type="submit" name="accion" value="Editar">

        </form>
    
</html>
