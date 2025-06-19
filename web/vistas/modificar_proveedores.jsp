<%-- 
    Document   : modificarcliente
    Created on : 17/03/2024, 09:16:25 PM
    Author     : user
--%>

<%@page import="modelo.ciudadmodelo"%>
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
                margin-left: 5px;
            }
            table {
    width: 100%;
    border-collapse: unset;
    margin-bottom: 20px;
}

th, td {
    padding: 8px;
    text-align: center;
    color: #fff;
}

  

button {
    margin: 5px;
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
}
            button:hover {
    background-color: #0056b3;
}
            .modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
}
            .modal-contenido {
    background-color: #343a40;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    
    height: auto;
    overflow: auto;
    text-align: center;
}



.cerrar {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.cerrar:hover, .cerrar:focus {
    color: #fff;
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
           
               <div class="form-group"><BR>
                <label for="txtusu">ID</label> <button class="btn btn-success mb-2" type="button" name="btnbuscarciu" onclick="mostrarModal()">
                                        BUSCAR</button>
                <input type="text" class="form-control" id="txtusu" name="txtusu" value="<%=m.getCiudad()%>">
               <label for="txtusunombre">CIUDAD</label>
               <input type="text" class="form-control" id="txtusunombre" name="txtusunombre" value="<%=m.getCiudad_nombre()%>">
            </div><BR>
               <button type="submit" class="btn btn-primary" name="accion" value="Editar">Editar</button>
            <!-- También podrías incluir un botón para cancelar la edición -->
            <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
            
        </form>
    </div>
            <BR>
             <script>
               function mostrarModal() {
                event.preventDefault();
                document.getElementById("miModal").style.display = "block";
            }
                function cerrarModal() {
                event.preventDefault();
                document.getElementById("miModal").style.display = "none";
            }
             function obtenerfilaciu(boton) {
                event.preventDefault(); // Evitar la acción predeterminada del botón

                var fila = boton.parentNode.parentNode;
                var celdas = fila.getElementsByTagName("td");
                var datosFila = [];

                for (var i = 0; i < celdas.length - 1; i++) {
                    var valor = celdas[i].querySelector(".dato-input").textContent;
                    datosFila.push(valor);
                }
                document.getElementById("txtusu").value = datosFila[0];
                document.getElementById("txtusunombre").value = datosFila[1];
                cerrarModal();
            }
           
               </script>
               
                <div id="miModal" class="modal">
                        <div class="modal-contenido">
                                <label>BUSCADOR DE CIUDADES</label>
                            <span class="cerrar" onclick="cerrarModal()">&times;</span>
                            <table border="1" id="mitabla">
                                <thead>
                                    <tr>
                                        <th>CODIGO</th>
                                        <th>NOMBRE</th>
                                        <th>ACCION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ciudadmodelo modelo2 = new ciudadmodelo();
                                        List<ciudadmodelo> list2 = modelo2.listar();
                                        Iterator<ciudadmodelo> iter2 = list2.iterator();
                                        ciudadmodelo m2 = null;
                                        while (iter2.hasNext()) {
                                            m2 = iter2.next();
                                    %>
                                    <tr>
                                        <td><span class="dato-input"><%= m2.getCodigo()%></span></td>
                                        <td><span class="dato-input"><%= m2.getNombre()%></span></td>
                                        <td><button class="btn btn-success mb-2" type="button" onclick="obtenerfilaciu(this)">
                                                SELECCIONAR</button></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
            
</body>
</html>
