<%@page import="modelo.clientemodelo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.ciudadmodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AGREGAR UN NUEVO CLIENTE</title>
    <!-- Incluir Bootstrap -->

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
          
            .btn {
                margin-right: 5px;
            }
            
           

            th {
                color: #7e7e7e;
                
            }
            td {
               color: #7e7e7e;
               
               
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
    <div class="container mt-4">
        <h1 class="mb-4">AGREGAR UN NUEVO CLIENTE</h1>
        <form action="../clientecontrolador" method="post">
               <%  clientemodelo facturaModelo = new clientemodelo();
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
                <label for="txtapellido">APELLIDO</label>
                <input type="text" class="form-control" id="txtapellido" name="txtapellido">
            </div>
            <div class="form-group">
                <label for="txtci">RUC/CI</label>
                <input type="text" class="form-control" id="txtci" name="txtci">
            </div>
            <div class="form-group">
                <label for="txttelefono">TELÉFONO</label>
                <input type="text" class="form-control" id="txttelefono" name="txttelefono">
            </div>
            <div class="form-group">
                <label for="txtciudad">ID</label> <button class="btn btn-success mb-2" type="button" name="btnbuscarciu" onclick="mostrarModal()">
                                        BUSCAR</button>
                <input type="text" class="form-control" id="txtciudad" name="txtciudad">
               <label for="txtciudad">CIUDAD</label>
                 <input type="text" class="form-control" id="txtciudadnombre" name="txtciudadombre">
            </div>
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
                            <label>BUSCADOR DE Ciudades</label>
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
         
           
           
            
                      
                                  
                                    
                                    
            <!-- Enviar la acción "Agregar" -->
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
