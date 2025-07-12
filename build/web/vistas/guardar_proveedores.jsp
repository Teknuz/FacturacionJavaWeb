<%-- 
    Document   : guardar_cliente
    Created on : 17/03/2024, 08:42:23 PM
    Author     : user
--%>

<%@page import="modelo.proveedoresmodelo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.ciudadmodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Formulario Proveedores</title>
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
    <div class="container mt-4">
        <h1 class="mb-4">AGREGAR UN NUEVO PROVEEDOR</h1>
    <!-- 
    Se crea el formulario con un boton de tipo submit que enviara la peticion 
    al controlador del cliente que en breve se estará creando en el tutorial
    se utiliza el metodo post para pasar los valores correspondientes
    -->
    <form action="../proveedorescontrolador" method="post">
        <%  proveedoresmodelo facturaModelo = new proveedoresmodelo();
    String ultimoNumeroFacturaPago = facturaModelo.obtenerUltimoNumeroFacturaPago();
    int nuevoNumeroFactura = Integer.parseInt(ultimoNumeroFacturaPago) + 1;
    %>
            <div class="form-group">
                <label for="txtcodigo">CÓDIGO</label>
                <input type="text" class="form-control" id="txtcodigo" value="<%= nuevoNumeroFactura %>" readonly name="txtcodigo">
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
      
         <div class="form-group"><BR>
                <label for="txtusu">ID</label> <button class="btn btn-success mb-2" type="button" name="btnbuscarciu" onclick="mostrarModal()">
                                        BUSCAR</button>
                <input type="text" class="form-control" id="txtusu" name="txtusu">
               <label for="txtusunombre">CIUDAD</label>
                 <input type="text" class="form-control" id="txtusunombre" name="txtusunombre">
            </div><BR>
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
                                        ciudadmodelo modelo = new ciudadmodelo();
                                        List<ciudadmodelo> list = modelo.listar();
                                        Iterator<ciudadmodelo> iter = list.iterator();
                                        ciudadmodelo m = null;
                                        while (iter.hasNext()) {
                                            m = iter.next();
                                    %>
                                    <tr>
                                        <td><span class="dato-input"><%= m.getCodigo()%></span></td>
                                        <td><span class="dato-input"><%= m.getNombre()%></span></td>
                                        <td><button class="btn btn-success mb-2" type="button" onclick="obtenerfilaciu(this)">
                                                SELECCIONAR</button></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
         
            <br>
            
        
       
   
      
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
