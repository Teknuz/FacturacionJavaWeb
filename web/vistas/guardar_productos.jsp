<%@page import="modelo.productosmodelo"%>
<%@page import="modelo.proveedoresmodelo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.ciudadmodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AGREGAR UN NUEVO PRODUCTO</title>
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
        <h1>AGREGAR UN NUEVO PRODUCTO</h1>
        <!-- 
        Se crea el formulario con un boton de tipo submit que enviara la peticion 
        al controlador del cliente que en breve se estará creando en el tutorial
        se utiliza el metodo post para pasar los valores correspondientes
        -->
        <form action="../productoscontrolador" method="post">
         <%  productosmodelo facturaModelo = new productosmodelo();
    String ultimoNumeroFacturaPago = facturaModelo.obtenerUltimoNumeroFacturaPago();
    int nuevoNumeroFactura = Integer.parseInt(ultimoNumeroFacturaPago) + 1;
    %>
            <div class="form-group">
                <label for="txtcodigo">CÓDIGO</label>
                <input type="text" class="form-control" id="txtcodigo" value="<%= nuevoNumeroFactura %>" readonly name="txtcodigo">
            </div>
            <div class="form-group">
                <label for="txtnombre">NOMBRE</label>
                <input type="text" class="form-control" id="txtnombre" name="txtnombre">
            </div>
            <div class="form-group">
                <label for="txtcosto">COSTO</label>
                <input type="text" class="form-control" id="txtcosto" name="txtcosto">
            </div>
            <div class="form-group">
                <label for="txtprecio">PRECIO</label>
                <input type="text" class="form-control" id="txtprecio" name="txtprecio">
            </div>
            <div class="form-group">
         <label for="lang">IVA</label> <BR>
        <select name="iva" id="iva">
        <option value="0">EXENTA</option>
        <option value="5">5%</option>
        <option value="10">10%</option>
        </select>
            </div>
            <div class="form-group">
                <label for="txtstock">STOCK</label>
                <input type="text" class="form-control" id="txtstock" name="txtstock">
            </div>
            <div class="form-group">
                <label for="txtstockmin">STOCK MINIMO</label>
                <input type="text" class="form-control" id="txtstockmin" name="txtstockmin">
            </div>
              <div class="form-group">
         <label for="lang">CATEGORIA</label> <BR>
        <select name="categoria" id="categoria">
        <option value="Insumo">INSUMO</option>
        <option value="Servicio">SERVICIO</option>
        </select>
            </div>
            <div class="form-group">
                <label for="txtciudad">ID</label> <button class="btn btn-success mb-2" type="button" name="btnbuscarciu" onclick="mostrarModal()">
                                        BUSCAR</button>
                <input type="text" class="form-control" id="txtciudad" name="txtciudad">
               <label for="txtciudad">PROVEEDOR</label>
                 <input type="text" class="form-control" id="txtciudadnombre" name="txtciudadombre">
            </div>
            <br>
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
// var valor2 = valor ? valor.textContent : "nada";
// datosFila.push(valor);
                }

// Asignar los datos a los inputs correspondientes
                document.getElementById("txtciudad").value = datosFila[0];
                document.getElementById("txtciudadnombre").value = datosFila[1];

// Cerrar el modal
                cerrarModal();
            }
            function moverFila(boton) {
                event.preventDefault(); // Evitar la acción predeterminada del botón
                var fila = boton.parentNode.parentNode;
                var celdas = fila.getElementsByTagName("td");
                var datosFila = [];

                for (var i = 0; i < celdas.length - 1; i++) {
                    var valor = celdas[i].querySelector(".dato-input").textContent;
                    datosFila.push(valor);
                }

// Asignar los datos a los inputs correspondientes
                document.getElementById("txtciuad").value = datosFila[0];
                document.getElementById("txtciudadnombre").textContent = datosFila[1];
                cerrarModalp();
                
                input.focus();
            }
               </script>
            <div id="miModal" class="modal">
                        <div class="modal-contenido">
                            <label>BUSCADOR DE PROVEEDORES</label>
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
                                        proveedoresmodelo modelo2 = new proveedoresmodelo();
                                        List<proveedoresmodelo> list2 = modelo2.listar();
                                        Iterator<proveedoresmodelo> iter = list2.iterator();
                                        proveedoresmodelo m2 = null;
                                        while (iter.hasNext()) {
                                            m2 = iter.next();
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
            <!-- 
            MUY IMPORTANTE ENVIAR UNA VARIABLE MAS POR POST EN ESTE CASO 
            SE ENVIA CON LOS TXT LA VARIABLE accion = "Agregar"
            PARA QUE DE ESA FORMA EL CONTROLADOR PUEDA SABER QUE EL USUARIO 
            QUIERE AGREGAR Y NO MODIFICAR O ELIMINAR
            -->
            <button type="submit" class="btn btn-primary" name="accion" value="Agregar">Agregar</button>
              <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
           
        </form>
    </div>
    <!-- Scripts de Bootstrap (jQuery y Popper.js son requeridos para Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
