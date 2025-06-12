
<%@page import="modelo.productosmodelo"%>
<%@page import="modelo.proveedoresmodelo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MODIFICAR PRODUCTOS</title>
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
                margin-right: 5px;
            }
            ´     /* Estilos personalizados */
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
        <h1>MODIFICAR PRODUCTOS</h1>
        <%  
            //recibe el id desde la tabla de la pagina clientes.jsp al presionar el boton modificar
            String id =request.getParameter("id");
            //se instancia la clase cliente modelo
            productosmodelo modelo = new productosmodelo();
            //se crea una lista para obtener todos los datos de la fila seleccionada desde la base de datos
            List<productosmodelo> list = modelo.listarporid(id);
            //se crea un iterador para recorrer los resultados
            Iterator<productosmodelo> iter = list.iterator();
            //se instancia un nuevo objeto vacio para contener lo recorrido
            productosmodelo m = null;
            //en este caso no hay un bucle porque el método listarporid solo arrojara un registro, no hay dos con mismo id
            iter.hasNext();
            //se obtiene el valor
            m = iter.next();
        %>
        <form action="../productoscontrolador" method="post">
            
            <input type="hidden" name="txtcodigo" value="<%= m.getCodigo()%>">
            <div class="form-group">
                <label for="txtcodigo">CÓDIGO</label>
                <input readonly type="text" class="form-control" id="txtcodigo" name="txtcodigo" value="<%= m.getCodigo()%>">
            </div>
            <div class="form-group">
                <label for="txtnombre">NOMBRE</label>
                <input type="text" class="form-control" id="txtnombre" name="txtnombre" value="<%= m.getNombre()%>">
            </div>
            <div class="form-group">
                <label for="txtcosto">COSTO</label>
                <input type="text" class="form-control" id="txtcosto" name="txtcosto" value="<%= m.getCosto()%>">
            </div>
            <div class="form-group">
                <label for="txtprecio">PRECIO</label>
                <input type="text" class="form-control" id="txtprecio" name="txtprecio" value="<%= m.getPrecio()%>">
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
                <input type="text" class="form-control" id="txtstock" name="txtstock" value="<%= m.getStock()%>">
            </div>
            <div class="form-group">
                <label for="txtstockmin">STOCK MINIMO</label>
                <input type="text" class="form-control" id="txtstockmin" name="txtstockmin" value="<%= m.getStockmin()%>">
            </div>
           
             <div class="form-group">
         <label for="lang">CATEGORIA</label> <BR>
        <select name="categoria" id="categoria">
        <option value="Insumo">INSUMO</option>
        <option value="Servicio">SERVICIO</option>
        </select>
            </div>
            
            <br>
            <!-- AL PRESIONAR EL BOTON EDITAR SE ENVIA UNA variable accion = "Editar" QUE DEBE RECIBIR EL CONTROLADOR -->
            
                   <div class="form-group">
                <label for="txtciudad">ID</label> <button class="btn btn-success mb-2" type="button" name="btnbuscarciu" onclick="mostrarModal()">
                                        BUSCAR</button>
                <input type="text" class="form-control" id="txtciudad" name="txtciudad" value="<%= m.getProveedorid()%>">
               <label for="txtciudadnombre">PROVEEDOR</label>
               <input type="text" class="form-control" id="txtciudadnombre" name="txtciudadnombre" value="<%= m.getProveedornombre()%>">
           <br> <button type="submit" name="accion" value="Editar" class="btn btn-primary">Editar</button>
             <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
            </div>   
    </div>
          

        </form>
  
          
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
                document.getElementById("txtciudad").value = datosFila[0];
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
                                        Iterator<proveedoresmodelo> iter2 = list2.iterator();
                                        proveedoresmodelo m2 = null;
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


    <!-- Scripts de Bootstrap (jQuery y Popper.js son requeridos para Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>