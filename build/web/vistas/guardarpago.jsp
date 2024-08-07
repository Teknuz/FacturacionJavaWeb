<%@page import="modelo.pagomodelo"%>
<%@page import="modelo.facturaventamodelo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.proveedoresmodelo"%>
<%@page import="modelo.modeloabrircaja"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Guardar Pagos</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <style>
        /* Estilos CSS para la página */
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
    height: 330px;
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
    <form action="pagocontrolador" method="post">
        <!-- Campo oculto para el código de sesión -->
        <input type="hidden" name="lblcodigo" value="<%= sesion.getAttribute("idusuarios")%>">
        <div class="container3">
            <div class="window">
                <!-- Tabla para ingresar datos de cobro -->
                <table border="0">
                    <tbody>
                          <%  pagomodelo facturaModelo = new pagomodelo();
    String ultimoNumeroFacturaPago = facturaModelo.obtenerUltimoNumeroFacturaPago();
    int nuevoNumeroFactura = Integer.parseInt(ultimoNumeroFacturaPago) + 1;
    %>
                    <tr>
                        <td>N° PAGO</td>
                        <td><input type="text" class="form-control" name="txtnumero" value="<%= nuevoNumeroFactura %>" readonly></td>
                      
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
                            <td><input type="text" name="txtcodigoprov" id="txtcodigoprov" readonly></td>
                            <td><button type="button" class="btn btn-success mb-2" name="btnbuscarprov" onclick="mostrarModal()">BUSCAR</button></td>
                        </tr>
                        <tr>
                            <td>NOMBRE</td>
                            <td><input type="text" name="txtnombre" id="txtnombre" readonly></td>
                        </tr>
                        <tr>
                            <td>RUC</td>
                            <td><input type="text" name="txtruc" id="txtruc" readonly></td>
                        </tr>
                        <tr>
                            <td>TELEFONO</td>
                            <td><input type="text" name="txttelefono" id="txttelefono" readonly></td>
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
                          <tr>
                            <td>CORREO</td>
                            <td><input type="text" name="txtcorreo" id="txtcorreo" readonly></td>
                        </tr>
                         <tr>
                            <td>CIUDAD</td>
                            <td><input type="text" name="txtciudad" id="txtciudad" readonly></td>
                        </tr>
                    </tbody>
                </table>
                <!-- Modal buscador cliente -->
                <div id="miModal" class="modal">
                    <!-- Contenido del modal -->
                    <div class="modal-contenido">
                        <label>BUSCADOR DE PROVEEDORES</label>
                        <span class="cerrar" onclick="cerrarModal()">&times;</span>
                        <table border="1" id="mitabla">
                            <thead>
                                <tr>
                                    <th>CODIGO</th>
                                    <th>PROVEEDOR</th>
                                    <th>RUC</th>
                                    <th>TELEFONO</th>
                                     <th>CORREO</th>
                                    <th>CIUDAD</th>
                                    <th>ACCION</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    // Obtiene y muestra la lista de clientes
                                    proveedoresmodelo modelo = new proveedoresmodelo();
                                    List<proveedoresmodelo> list = modelo.listar();
                                    for (proveedoresmodelo m : list) {
                                %>
                                <tr>
                                    <td><span class="dato-input"><%= m.getCodigo()%></span></td>
                                    <td><span class="dato-input"><%= m.getNombre()%></span></td>
                                    <td><span class="dato-input"><%= m.getRuc()%></span></td>
                                    <td><span class="dato-input"><%= m.getTelefono()%></span></td>
                                    <td><span class="dato-input"><%= m.getCorreo()%></span></td>
                                    <td><span class="dato-input"><%= m.getCiudad()%></span></td>
                                    <td><button class="btn btn-success mb-2" type="button" onclick="obtenerFilaproveedor(this)">SELECCIONAR</button></td>
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
                <table border="1" class="table2" id="tablapago">
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
                <button type="submit" class="btn btn-success mb-2" name="accion" value="guardarpago">GUARDAR</button>
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
        function obtenerFilaproveedor(boton) {
            event.preventDefault();
            var fila = boton.parentNode.parentNode;
            var celdas = fila.getElementsByTagName("td");
            var datosFila = [];

            for (var i = 0; i < celdas.length - 1; i++) {
                var valor = celdas[i].querySelector(".dato-input").textContent;
                datosFila.push(valor);
            }
            
            console.log("Dartos"),datosFila;

            document.getElementById("txtcodigoprov").value = datosFila[0];
            document.getElementById("txtnombre").value = datosFila[1];
            document.getElementById("txtruc").value = datosFila[2];
            document.getElementById("txttelefono").value = datosFila[3];
            document.getElementById("txtcorreo").value = datosFila[4];
            document.getElementById("txtciudad").value = datosFila[5];
            cerrarModal();

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "pagocontrolador", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("tablaCuerpo").innerHTML = xhr.responseText;
                }
            };

            var params = "accion=buscarPagosPendientes&proveedorId=" + datosFila[0];
            xhr.send(params);
        }
    </script>
</body>
</html>
