<%-- 
    Document   : personales
    Created on : 23 abr 2024, 19:50:15
    Author     : User
--%>

<%@page import="modelo.aperturacajamodelo"%>
<%@page import="modelo.aperturacajamodelo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.clientemodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Ciudades</title>
    </head>
    
    <body>
        <%@include file="plantilla.jsp" %>
        <main>
             
        
        <!--titulo de la pagina clientes -->
        <h1>FORMULARIO APERTURA CAJA</h1>
        <!-- SE CREA LA ESTRUCTURA DEL FORMULARIO CLIENTES -->
        <!-- se agrega un hiperviculo para abrir una nueva página para agregar cleintes a la bd -->
        <a href="vistas/guardar_aperturacaja.jsp">ABRIR CAJA</a>
        <form action="aperturacajacontrolador" method="post">
            <button type="submit" name="accion" value="informe">IMPRIMIR</button>
        </form>
        <!-- se agrega una tabla para visualizar a todos los clientes de la base de datos -->
        <table border="1">
            <thead>
                <!-- para el encabezado se colocan los atributos segun la tabla cliente -->
                <tr>
                    <th>CÓDIGO</th>
                    <th>FECHA</th>
                    <th>MONTO</th>
                    <th>ESTADO</th>
                    <th>USUARIO</th>
               
                    <th>ACCION</th><!-- aqui iran dos botones modificar y eliminar -->
                </tr>
            </thead>
            <%
                //se crea la instancia para la comunicacion de la pagina con el modelo
                aperturacajamodelo modelo = new aperturacajamodelo();
                //se crea una lista para obtemer los valores del mertodo listar
                //como listar retorna una lista por eso una lista lo debe recibir
                List<aperturacajamodelo> list = modelo.listar();
                // se crea un iterador para que pueda ser recorrido por un bucle
                Iterator<aperturacajamodelo> iter = list.iterator();
                //se crea un nuevo objeto denominado m vacio que contendrá cada fina de por separado
                aperturacajamodelo m = null;
                //comienza el bucle desde la posicion 1
                while (iter.hasNext()) {
                //se obtiene el primer registro
                    m = iter.next();

            %>
             <tbody>
                <tr>
                    <!-- aqui del objeto m se va obteniendo los valores por separado segun como corrresponda 
                    columna 1 es para codigo
                    columna 2 es para nombre
                    columna 3 es para apellido
                    columna 4 es para ruc/ci
                    -->
                    <td><%= m.getCodigo()%></td>
                    <td><%= m.getApefecha()%></td>
                      <td><%= m.getApemonto()%></td>
                          <td><%= m.getApeestado()%></td>
                          <td><%= m.getIdusuario()%></td>
               
                   
                    <!-- Se envía el id a la pagina modificarcliente.jsp para buscar el cliente a modificar -->
                    <td>
                        <a href="vistas/modificar_aperturacaja.jsp?id=<%= m.getCodigo()%>">EDITAR</a><!-- posterior se convertirá en botones que llamaran a las paginas editar y eliminar -->
                        <form action="aperturacajacontrolador" method="post">
                            <input type="hidden" name="accion" value="delete">
                            <input type="hidden" name="id" value="<%= m.getCodigo()%>">
                            <button type="submit">ELIMINAR</button>
                        </form>
                    </td>
                    <%
                        //se cierra el while y si hay mas registro en la base de datos va a repetir la carga sino saldra del bucle
                        }
                    %>
                </tr>
                
        
            </tbody>
          </table>     
              </main>
    </body>
     <footer>
        <%
        
       
        %>
        <label id="txtnombre"><%=usunombre%> </label>
        
    </footer>
</html>