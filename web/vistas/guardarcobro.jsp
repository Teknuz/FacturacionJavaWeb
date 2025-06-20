<%@page import="modelo.cobromodelo"%>
<%@page import="modelo.facturaventamodelo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.clientemodelo"%>
<%@page import="modelo.modeloabrircaja"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Guardar Cobros</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
/* General Styles */
body {
    background-color: #343a40;
   color: #fff;
 
}

            th {
                color: #7e7e7e;
                
            }
            td {
               color: #7e7e7e;
               
               
            }
.container3 {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.container2 {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.window, .window2, .window3 {
    border: 1px solid #ccc;
    margin: 10px;
    padding: 10px;
    
}

.window {
    width: 500px;
    height: 230px;
}

.window2 {
    width: 1020px;
    height: 80px;
    text-align: center;
}

.window3 {
    width: 1020px;
    height: 200px;
    overflow: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    padding: 8px;
    text-align: left;
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

/* Modal Styles */
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
    width: auto;
  
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
    <% 
        // Inicia una sesión HTTP y valida la apertura de la caja para el usuario actual
        HttpSession sesion = request.getSession();
        modeloabrircaja verificar = new modeloabrircaja();
        Object a = sesion.getAttribute("idusuarios");
        verificar.setIdusuario((String) a);
        if (!verificar.validarcaja().equals("ABIERTA")) {
            request.setAttribute("validarcaja", "cerrada");
            request.getRequestDispatcher("../menuprincipal.jsp").forward(request, response);
        }
    %>
    <form action="cobrocontrolador" method="post">
        <!-- Campo oculto para el código de sesión -->
        <input type="hidden" name="lblcodigo" value="<%= sesion.getAttribute("idusuarios")%>">
        <div class="container3">
            <div class="window">
                <!-- Tabla para ingresar datos de cobro -->
                <table border="0">
                    <tbody>                                                   <%
    cobromodelo facturaModelo = new cobromodelo();
    String ultimoNumeroFactura = facturaModelo.obtenerUltimoNumeroFactura();
    int nuevoNumeroFactura = Integer.parseInt(ultimoNumeroFactura) + 1;
%>
                    <tr>
                        <td>N° FACTURA</td>
                        <td><input type="text" class="form-control" name="txtnumero" value="<%= nuevoNumeroFactura %>" readonly></td>
                    </tr>
                        <tr>
                            <td>FECHA</td>
                            <td><input type="text" id="txtfecha" name="txtfecha" readonly></td>
                        </tr>
                        <tr>
                            <td>ESTADO</td>
                            <td><input type="text" name="txtestado" value="PENDIENTE" readonly></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="window">
                <!-- Tabla para datos del cliente -->
                <table border="0">
                    <tbody>
                        <tr>
                            <td>CODIGO</td>
                            <td><input type="text" name="txtcodigocliente" id="txtcodigocliente" readonly></td>
                            <td><button type="button" class="btn btn-success mb-2" name="btnbuscarcli" onclick="mostrarModal()">BUSCAR</button></td>
                        </tr>
                        <tr>
                            <td>NOMBRE</td>
                            <td><input type="text" name="txtnombre" id="txtnombre" readonly></td>
                        </tr>
                        <tr>
                            <td>APELLIDO</td>
                            <td><input type="text" name="txtapellido" id="txtapellido" readonly></td>
                        </tr>
                        <tr>
                            <td>RUC/CI</td>
                            <td><input type="text" name="txtci" id="txtci" readonly></td>
                            <%
                                // Obtiene la última apertura de caja del usuario actual
                                modeloabrircaja mf = new modeloabrircaja();
                                mf.setIdusuario((String) sesion.getAttribute("idusuarios"));
                            %>
                            <td>
                                <input type="hidden" name="txtaper" id="txtaper" value="<%= mf.obtenerultimapertura()%>" readonly>
                                <input type="hidden" name="txtusu" id="txtusu" value="<%= sesion.getAttribute("idusuarios")%>" readonly>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- Modal buscador cliente -->
                <div id="miModal" class="modal">
                    <!-- Contenido del modal -->
                    <div class="modal-contenido">
                        <label>BUSCADOR DE CLIENTES</label>
                        <span class="cerrar" onclick="cerrarModal()">&times;</span>
                        <table border="1" id="mitabla">
                            <thead>
                                <tr>
                                    <th>CODIGO</th>
                                    <th>NOMBRE</th>
                                    <th>APELLIDO</th>
                                    <th>CI</th>
                                    <th>TELEFONO</th>
                                    <th>CIUDAD</th>
                                    <th>ACCION</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    // Obtiene y muestra la lista de clientes
                                    clientemodelo modelo = new clientemodelo();
                                    List<clientemodelo> list = modelo.listar();
                                    for (clientemodelo m : list) {
                                %>
                                <tr>
                                    <td><span class="dato-input"><%= m.getCodigo()%></span></td>
                                    <td><span class="dato-input"><%= m.getNombre()%></span></td>
                                    <td><span class="dato-input"><%= m.getApellido()%></span></td>
                                    <td><span class="dato-input"><%= m.getCi()%></span></td>
                                    <td><span class="dato-input"><%= m.getTelefono()%></span></td>
                                    <td><span class="dato-input"><%= m.getCiudad()%></span></td>
                                    <td><button type="button" class="btn btn-success mb-2" onclick="obtenerFilacliente(this)">SELECCIONAR</button></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- Otra sección del formulario para mostrar facturas pendientes -->
        <div class="container3">
            <div class="window3">
                <table border="1" class="table2" id="tablafactura">
                    <thead>
                        <tr>
                            <th>CODIGO</th>
                            <th>ESTADO</th>
                            <th>CONDICION</th>
                            <th>MONTO</th>
                            <th>SELECCIONAR</th>
                        </tr>
                    </thead>
                    <tbody id="tablaCuerpo">
                        <!-- Cuerpo de la tabla para mostrar facturas -->
                       
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Botón para guardar el cobro -->
        <div class="container3">
            <div class="window2">
                <button type="submit" name="accion" class="btn btn-success mb-2" value="guardarcobro">GUARDAR</button>
            </div>
        </div>
    </form>
    <!-- Script JavaScript para manejar eventos en la página -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Función para obtener la fecha actual y establecerla en un campo de texto
            var fechaActual = new Date();
            var dia = fechaActual.getDate();
            var mes = fechaActual.getMonth() + 1;
            var año = fechaActual.getFullYear();

            if (mes <= 9) {
                mes = "0" + mes;
            }

            var fechaFormateada = año + "-" + mes + "-" + dia;
            document.getElementById("txtfecha").value = fechaFormateada.toString();
        });

        // Función para mostrar la ventana modal
        function mostrarModal() {
            event.preventDefault();
            document.getElementById("miModal").style.display = "block";
        }

        // Función para cerrar la ventana modal
        function cerrarModal() {
            event.preventDefault();
            document.getElementById("miModal").style.display = "none";
        }

        // Función para obtener datos de fila de cliente seleccionado
        function obtenerFilacliente(boton) {
            event.preventDefault();
            var fila = boton.parentNode.parentNode;
            var celdas = fila.getElementsByTagName("td");
            var datosFila = [];

            for (var i = 0; i < celdas.length - 1; i++) {
                var valor = celdas[i].querySelector(".dato-input").textContent;
                datosFila.push(valor);
            }

            document.getElementById("txtcodigocliente").value = datosFila[0];
            document.getElementById("txtnombre").value = datosFila[1];
            document.getElementById("txtapellido").value = datosFila[2];
            document.getElementById("txtci").value = datosFila[3];
            cerrarModal();

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "cobrocontrolador", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("tablaCuerpo").innerHTML = xhr.responseText;
                }
            };

            var params = "accion=buscarFacturasPendientes&clienteId=" + datosFila[0];
            xhr.send(params);
        }
    </script>
</body>
</html>
