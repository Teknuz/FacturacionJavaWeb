<%-- 
    Document   : modificarcliente
    Created on : 17/03/2024, 09:16:25 PM
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.cierrecajamodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <h1>MODIFICAR CIERRE DE CAJA</h1>
        <%  
                //recibe el id desde la tabla de la pagina clientes.jsp al presionar el boton modificar
                String id =request.getParameter("id");
                //se instancia la clase cliente modelo
                cierrecajamodelo modelo = new cierrecajamodelo();
                //se crea una lista para obtener todos los datos de la fila seleccionada desde la base de datos
                List<cierrecajamodelo> list = modelo.listarporid(id);
                //se crea un iterador para recorrer los resultados
                Iterator<cierrecajamodelo> iter = list.iterator();
                //se instancia un nuevo objeto vacio para contener lo recorrido
                cierrecajamodelo m = null;
                //en este caso no hay un bucle porque el método listarporid solo arrojara un registro, no hay dos con mismo id
               iter.hasNext();
               //se obtiene el valor
            while (iter.hasNext()) {
                m = iter.next();
            }
            %>
        <form action="../cierrecajacontrolador" method="post">
            <!-- EL CODIGO APARECE OCULTO JUSTAMENTO PORQUE NO QUEREMOS EDITAR -->
            <input type="hidden" name="txtcodigo" value="<%= m.getCodigo()%>">
            <!-- en cada value se envia el valor que se va a editar de la tabla -->
            <h1>  CODIGO</h1> <input type="text" name="txtcodigo" value="<%= m.getCodigo()%>">
            <h1> FECHA</h1> <input type="text" name="txtciefecha" value="<%= m.getCiefecha()%>">
            <h1> MONTO</h1> <input type="text" name="txtciemonto" value="<%= m.getCiemonto()%>">
            <h1> APERTURA ID </h1> <input type="text" name="txtapeid" value="<%= m.getApeid()%>">
            
            
         
            
            <br>
            <!-- AL PRESIONAR EL BOTON EDITAR SE ENVIA UNA variable accion = "Editar" QUE DEBE RECIBIR EL CONTROLADOR -->
            <input type="submit" name="accion" value="Editar">

        </form>
    
</html>
